<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	git 연습중!! <br>
	따라올테면 따라와바!
</body>
</html>


HttpSession session=request.getSession();
MemberVO mvo=session.getAttribut("mvo");
if(mvo.package>0)
	classDAO.getInstance().register();