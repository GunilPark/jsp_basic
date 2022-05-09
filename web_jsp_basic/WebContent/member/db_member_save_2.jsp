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
int result = 0;
if(checkId == 1){ //중복 되어있으면
	msg = "사용 불가. 이미 사용중인 ID입니다.";
	out.print("등록실패입니다.<br>");
}else{
	msg = "사용가능한 ID입니다.";
	result = dao.saveMember(dto);
	if(result == 1){
		msg ="등록설정";
		out.print("id: " + id + "<br>");
		out.print("name: " + name + "<br>");
		out.print("age: " + age + "<br>");
		out.print("date: " + reg_date + "<br>");
		out.print("등록이 완료되었습니다." + "<br>");
	}else{
		msg ="등록실패";

	}
	
}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	alert("<%=msg%>");
	<% if(result == 1){ %>
	location.href="member_list.jsp";
	<%} else{%>
	location.href="member_write.jsp";
	<%} %>
</script>
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="확인"
		onclick="location.href='member_list.jsp'" class="btn_list">
</body>
</html>

