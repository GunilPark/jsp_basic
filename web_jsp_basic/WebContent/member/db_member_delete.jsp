<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,dto.*,dao.*"%>
    <%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("t_id");
    
    Group_dao dao = new Group_dao();
    
    int result = dao.deleteMember(id);
    
    String msg="삭제완료";
    
    if(result != 1){
    	msg ="삭제 실패";
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