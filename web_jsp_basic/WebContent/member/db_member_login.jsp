<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*,dto.*"%>
<%
	Group_dao dao = new Group_dao();
	String id = request.getParameter("t_id");
	String password = request.getParameter("t_password");
	
//	out.print("id:" + id + "\r\n");
//	out.print("password:" + password + "\r\n");

	String loginName = dao.getCheckLogin(id,password);
	
	String msg = "";
	if(loginName.equals("")){
		msg = "잘못된 아이디, 비밀번호 입니다.";
	}else{
		// out, request, session  자동으로 만들어줌
		session.setAttribute("sessionName", loginName);
		session.setAttribute("sessionId", id);
		if(id.equals("admin")){
		session.setAttribute("sessionLevel", "top");
		}
		
		session.setMaxInactiveInterval(60);
		msg = loginName + "님 로그인 축하드립니다.";
	}
	
	




	
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
alert("<%=msg%>");
location.href="member_list.jsp";

</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>