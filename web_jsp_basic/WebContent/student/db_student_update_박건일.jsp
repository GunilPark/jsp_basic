<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.*,dao.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    Student_dao_박건일 dao = new Student_dao_박건일();
    String sYear = request.getParameter("t_sYear");
    String sClass = request.getParameter("t_sClass");
    String no = request.getParameter("t_no");
    String name = request.getParameter("t_name");
    int kor = Integer.parseInt(request.getParameter("t_kor"));
    int eng = Integer.parseInt(request.getParameter("t_eng"));
    int mat = Integer.parseInt(request.getParameter("t_mat"));
    
    Student_dto_박건일 dto = new Student_dto_박건일(sYear,sClass,no,name,kor,eng,mat);
    
    int result = dao.getUpdateStudent(dto);
    
    String msg = "";
    if(result == 1){
    	msg = "수정 성공";
    }else{
    	msg = "수정 실패";
    }
    
    %>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="student_list_박건일.jsp";
    
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