<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*,dao.*" %>
<%
request.setCharacterEncoding("utf-8");
Snack_dao dao = new Snack_dao();

String p_code = request.getParameter("t_p_code");
String p_name = request.getParameter("t_p_name");
String m_name = request.getParameter("t_m_code");
String prics = request.getParameter("t_price");

Snack_dto dto = new Snack_dto(p_code, p_name, m_name, prics);
int result = dao.updateSnack(dto);
String msg = "";
if(result == 1){
	msg= "수정완료";
}else{
	msg="수정실패";
}
%>
<script>
alert("<%=msg%>");
location.href="snack_view.jsp?t_p_code=<%=p_code%>";


</script>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>