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
$(document).ready(function(){
   $(".regLink").click(function(){
      if(${requestScope.userPackage>0}){
         return confirm($(this).text()+"를 수강하시겠습니까?");
      }else{
         alert("수강신청 가능 횟수를 모두 소모하셨습니다.");
         return false;
      }
   }); //click
});//ready
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
	background-image: url("레드벨벳.jpg");
	background-size: cover;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #fff;
	
	
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
	<%--color:rgba(255,255,255,0.8);--%>
	color: black;
}
.fullClass{
	color:red;
}

</style>
</head>
<body>
<div class="container">
<a href="dispatcher?command=Read_Register">수강내역확인</a>&emsp;신청 가능 횟수: <span id="userPackage">${requestScope.userPackage}</span>
	<table>
		<thead>
			<tr>
				<th>TIME</th>
				<th>MON</th>
				<th>TUE</th>
				<th>WEN</th>
				<th>THU</th>
				<th>FRI</th>
				<th>SAT</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="8" varStatus="countOfClassTime">
				<tr>
					<td>${countOfClassTime.count }</td>
					<c:forEach begin="0" end="5" varStatus="week">
					<td><c:forEach items="${timetable_list }" var="list" varStatus="tdNo">
							<c:if test="${list.classTime==countOfClassTime.count&&list.classDay==week.index }">
								<c:choose>
									<c:when test="${list.capacity==list.count_reg }">
										<span class="fullClass">${list.programName }<br>${list.teacherNick }<br>${list.count_reg }/ ${list.capacity }</span>
									</c:when>
									<c:otherwise>
										<a class="regLink" href="dispatcher?command=Create_RegisterClass&classNo=${list.classNo }">${list.programName }<br>${list.teacherNick }<br>
										${list.count_reg }/ ${list.capacity }</a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach></td>
				</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>