<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="dto.*,dao.*" %>
<%
request.setCharacterEncoding("utf-8");

Snack_dao dao = new Snack_dao();

String p_code = request.getParameter("t_p_code");

int result = dao.deleteSnack(p_code);
String msg = "";
if(result==1){
	msg = "삭제되었습니다.";
}else{
	msg ="삭제에 실패하였습니다.";
}

%>
<!DOCTYPE html>
<script>
alert("<%=msg%>")
location.href="snack_list.jsp";
</script>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>