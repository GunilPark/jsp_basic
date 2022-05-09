<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.*,dao.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Snack_dao dao = new Snack_dao();

//	String p_code = request.getParameter("t_p_code");
	String p_code = dao.getNewCode();
	String p_name = request.getParameter("t_p_name");
	String price = request.getParameter("t_price");
	String m_code = request.getParameter("t_m_code");
//	out.print("p_code : " + p_code + "<br>");
//	out.print("p_name : " + p_name + "<br>");
//	out.print("price : " + price + "<br>");
//	out.print("m_code : " + m_code);
	
	Snack_dto dto = new Snack_dto(p_code, p_name, m_code, price);
	
	String msg = "";
	
	int result = dao.saveSnack(dto);
	if(result == 1){
		msg = "제품등록 완료!";
	}else{
		msg = "제품등록 실패!";
	}
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	alert("<%=msg%>");
	location.href="snack_write.jsp";
	

</script>
<title></title>
</head>
<body>

</body>
</html>