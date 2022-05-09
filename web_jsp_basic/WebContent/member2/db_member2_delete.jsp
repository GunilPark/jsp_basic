<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.*,dao.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    Group_dao dao = new Group_dao();
    String id = request.getParameter("t_id");
    int result = dao.deleteMember(id);
    
    
    %>
    <script>
    alert("삭제되었습니다.");
    location.href="member2_list.jsp";
    
    </script>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>