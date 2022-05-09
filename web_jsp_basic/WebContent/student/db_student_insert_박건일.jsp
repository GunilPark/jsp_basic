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
    
    Student_dto_박건일 dto = new Student_dto_박건일(sYear, sClass, no, name, kor, eng, mat);
    
   
    String msg = "";
    int result = 0;
    int check = dao.getCheckStudent(sYear, sClass, no);
    if(check == 1){
    	msg = "중복된 정보(학년.반.번호) 입니다.";
    }else{
    	msg = "정보입력 완료!";
    	result = dao.getInsertStudent(dto);
    	if(result == 1){
    		msg = "추가 완료";
    	}else{
    		msg = "입력하신 정보가 올바르지 않습니다.";
    	}
    	
    }
    
    %>
    
   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <form name="backback">
		<input type="hidden" name="t_sYear" value="<%=sYear%>">
		<input type="hidden" name="t_sClass" value="<%=sClass%>">
		<input type="hidden" name="t_no" value="<%=no%>">
		<input type="hidden" name="t_name" value="<%=name%>">
		<input type="hidden" name="t_kor" value="<%=kor%>">
		<input type="hidden" name="t_eng" value="<%=eng%>">
		<input type="hidden" name="t_mat" value="<%=mat%>">
    </form>

    <script type="text/javascript">
    
    function goBack(){
    	backback.method="post";
    	backback.action="student_write_박건일.jsp";
    	backback.submit();
    }	

    
    alert("<%=msg%>");
    if(<%=check%> == 1){
    	goBack();
    }else if(<%=result%> != 1){
    	goBack();
    }else{
		location.href="student_list_박건일.jsp";
    }
    
   
    
 
    	
    
    
    </script>
</head>
<body>
 
</body>
</html>