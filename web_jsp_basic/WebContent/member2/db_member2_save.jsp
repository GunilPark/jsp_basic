<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.util.*,dao.*,dto.*"%>
<%
request.setCharacterEncoding("utf-8");

Group_dao dao = new Group_dao();
String id = request.getParameter("t_id");
String name = request.getParameter("t_name");
String age = request.getParameter("t_age");
String reg_date = request.getParameter("t_reg_date");

Group_dto dto = new Group_dto(id, name, Integer.parseInt(age), reg_date);

/* //각 항목마다 확인하는 습관을 기르자!
out.print("id: " + id + "<br>");
out.print("name: " + name + "<br>");
out.print("age: " + age + "<br>");
out.print("date: " + reg_date + "<br>");
*/
String msg ="";
int checkId = dao.getCheckId(id);

if(checkId == 1){
	msg = "중복된 ID입니다.";
}else{
	msg = "사용 가능한 ID입니다.";
	int result = dao.saveMember(dto);
	if(result == 1){
		msg ="등록성공";
	}else{
		msg ="등록실패";
	}
	
}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
alert("<%=msg%>");
<%if(checkId == 1){%>
location.href="member2_write.jsp";
<%}else{%>
location.href="member2_list.jsp";
<%}%>


</script>
<title>Insert title here</title>
</head>
<body>
</body>
</html>