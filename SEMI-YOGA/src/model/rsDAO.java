package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class rsDAO {
	private static rsDAO instance=new rsDAO();
	private rsDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		
		return DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771:xe", "system", "oracle");
	}
	
	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
	}
	
	public static rsDAO getInstance() {
		return instance;
	}

	public ArrayList<rsVO> readTimetableInfo() throws ClassNotFoundException, SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<rsVO> list=new ArrayList<rsVO>();
		
		try {
			con=getConnection();
			String sql="select prg.programName, tch.teacherNick, cls.classNo, cls.classTime, cls.classDay, cls.capacity from yoga_program prg, yoga_teacher tch, yoga_class cls where cls.programNo=prg.programNo and cls.teacherId=tch.teacherId order by cls.classNo asc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				list.add(new rsVO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6)));
			}
			ps.close();
			rs.close();
			
			sql="select cls.classNo, count(reg.classNo) from registerStatus reg, YOGA_CLASS cls, YOGA_MEMBER mem where reg.classNo=cls.classNo and reg.id=mem.id group by cls.classNo";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				for(int i=0; i<list.size(); i++) {
					if(list.get(i).getClassNo()==rs.getInt(1)) {
						list.get(i).setCount_reg(rs.getInt(2));
						break;
					}
				}
			}
		}finally {
			closeAll(rs, ps, con);
		}
		
		return list;
	}

	public void RegisterClass(String classNo, String userId) throws ClassNotFoundException, SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=getConnection();
			String sql="insert into registerStatus(rsNo, classNo, id, regDate) values(rs_seq.nextVal, ?, ?, sysdate)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(classNo));
			ps.setString(2, userId);
			ps.executeUpdate();
			ps.close();
			
			sql="update yoga_member set class_package=class_package-1 where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.executeUpdate();
					
		}finally {
			closeAll(ps,con);
		}
		
	}

	public void Delete_RegisterClass(String userId, Integer classNo) throws ClassNotFoundException, SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=getConnection();
			String sql="delete from registerStatus where id=? and classNo=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setInt(2, classNo);
			ps.executeUpdate();
			ps.close();
			
			sql="update yoga_member set class_package=class_package+1 where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.executeUpdate();
			
		}finally {
			closeAll(ps,con);
		}
		
	}

	public ArrayList<rsVO> Read_RegisterStatus(String userId) throws ClassNotFoundException, SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<rsVO> list=new ArrayList<rsVO>();
		
		try {
			con=getConnection();
			String sql="select prg.programName, tch.teacherNick, cls.classTime, cls.classDay, to_char(reg.regDate,'YY/MM/DD'), reg.classNo from YOGA_PROGRAM prg, YOGA_TEACHER tch, YOGA_CLASS cls, REGISTERSTATUS reg where reg.id=? and reg.classNo=cls.classNo and prg.programNo=cls.programNo and tch.teacherId=cls.teacherId ";
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			rs=ps.executeQuery();
			while(rs.next()) {
				list.add(new rsVO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
			}
		}finally {
			closeAll(rs,ps,con);
		}
		return list;
	}





}










