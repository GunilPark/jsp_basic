<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*,dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
Group_dao dao = new Group_dao();
String id 		= request.getParameter("t_id");
String name		= request.getParameter("t_name");
String age 		= request.getParameter("t_age");
String reg_date = request.getParameter("t_reg_date");

Group_dto dto = new Group_dto(id, name, Integer.parseInt(age), reg_date);

int result = dao.updateMember(dto);
String msg = "수정 성공~";
if (result != 1) {
	msg = "수정실패";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "member_list.jsp";
</script>
</head>
<body>

</body>
</html>