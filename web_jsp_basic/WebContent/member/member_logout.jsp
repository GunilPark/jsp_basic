<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   String name = (String)session.getAttribute("sessionName");
   session.invalidate();
   
   String msg = "";
   if(name == null){
	   msg = "로그아웃 되었습니다.";
   }else{
	   msg = name + "님 로그아웃 되었습니다.";
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