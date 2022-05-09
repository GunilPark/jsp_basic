<%@page import="dao.Group_dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*,dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");

Group_dao dao = new Group_dao();
String id = request.getParameter("t_id");
String name = request.getParameter("t_name");
String age = request.getParameter("t_age");
String reg_date = request.getParameter("t_reg_date");

Group_dto dto = new Group_dto(id, name, Integer.parseInt(age), reg_date);

int checkId = dao.getCheckId(id);
String msg = "";
if(checkId == 1){ //중복 되어있으면
	msg = "사용 불가. 이미 사용중인 ID입니다.";
}else{
	msg = "사용가능한 ID입니다.";
	int result = dao.saveMember(dto);
	if(result == 1){
		msg ="등록성공";
	}else{
		msg ="등록실패";
	}
	
}





/*
out.print("id: " + id + "<br>");
out.print("name: " + name + "<br>");
out.print("age: " + age + "<br>");
out.print("date: " + date + "<br>");
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	alert("<%=msg%>");
	action="member2_list.jsp";
	
</script>
<title>Insert title here</title>
</head>
<body>
</body>
</html>






