<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.*,dao.*" %>
    
    <%
    request.setCharacterEncoding("utf-8");
    Group_dao dao = new Group_dao();
    
    String id = request.getParameter("t_id");
    String name = request.getParameter("t_name");
    String age = request.getParameter("t_age");
    String reg_date = request.getParameter("t_reg_date");
    
    
    
    Group_dto dto = new Group_dto(id, name, Integer.parseInt(age), reg_date);
    
    int result = dao.updateMember(dto);
    String msg = "";
    
    if(result == 1){
    	msg ="수정 완료";
    }else{
    	msg ="수정 실패";
    }
    %>
    <script>
    alert("<%=msg%>");
    location.href="member2_view.jsp?t_id=<%=id%>";		//뷰로 가기 위해서는 반드시 id가 필요하다. (.jsp 뒤에)"?t_id=<%=id%>"를 써줘야함.
    
    </script>
	<form name="update">
	<input type="hidden" name="t_id" value="<%=id%>">
	</form>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% %>
</body>
</html>