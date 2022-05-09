<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*"%>

<%
Member_dto dto = new Member_dto("오인환","서울",35);
Member_dto dto2 = new Member_dto("박건일","울산",28);
Member_dto dto3 = new Member_dto("김세훈","부산",27);
ArrayList<Member_dto> dtos = new ArrayList<>();
dtos.add(dto);
dtos.add(dto2);
dtos.add(dto3);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%for(int k = 0; k<dtos.size(); k++){ %>
	성 명:<%=dtos.get(k).getName()%><br>
	지 역:<%=dtos.get(k).getArea()%><br>
	나 이:<%=dtos.get(k).getAge()%><br>
<%} %>
</body>
</html>