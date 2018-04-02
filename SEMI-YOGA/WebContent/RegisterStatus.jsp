<%@page import="controller.classDay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function delete_register(classNo){
		if(confirm("해당 강좌를 취소하시겠습니까?")){
			location.href="dispatcher?command=Delete_Register&classNo="+classNo;
		}
	}
</script>
<style type="text/css">

/*table {
	text-align: center;
    border-collapse: collapse;
    width: 100%;
}

th, td {
	border-style: solid;
	border-width: 1px;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}*/

html,
body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	text-align: center;
	width: 800px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th,
td {
	border-style:solid;
	border-width:1px;
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: #fff;
}

th {
	text-align: center;
}

thead {
	th {
		background-color: #55608f;
	}
}
a{
	color: #fff;
	text-decoration: none;
	
}
a:hover{
	color:rgba(255,255,255,0.8);
}

</style>
</head>
<body>
<div class="container">
<a href="index.jsp">Back</a>
	<table>
		<thead>
			<tr>
				<th>강좌명</th>
				<th>강사</th>
				<th>요일</th>
				<th>시간</th>
				<th>등록일시</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${registerStatus_list }" var="list">
				<tr>
					<td>${list.programName }</td>
					<td>${list.teacherNick }</td>
					<td>
						<c:choose>
							<c:when test="${list.classDay==classDay.MON.getName() }">
								월요일
							</c:when>
							<c:when test="${list.classDay==classDay.TUE.getName() }">
								화요일
							</c:when>
							<c:when test="${list.classDay==classDay.WEN.getName() }">
								수요일
							</c:when>
							<c:when test="${list.classDay==classDay.THU.getName() }">
								목요일
							</c:when>
							<c:when test="${list.classDay==classDay.FRI.getName() }">
								금요일
							</c:when>
							<c:when test="${list.classDay==classDay.SAT.getName() }">
								토요일
							</c:when>
						</c:choose>
					</td>
					<td>${list.classTime }</td>
					<td>${list.regDate }</td>
					<td><input type="button" value="수강취소" onclick="delete_register(${list.classNo})"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>