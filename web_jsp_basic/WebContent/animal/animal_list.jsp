<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dao.*,dto.*,common.*,java.util.*" %>
    
    <%
    Animal_dao dao = new Animal_dao();
    ArrayList<Animal_dto> dtos = dao.getListPage();
    
    
    
    
    
    
    
    
    
    
    %>
<!DOCTYPE html>
<html> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--
	******************************************** 
		title : 풀스텍 홍길동
	******************************************** 
 -->	
	<title>풀스텍 홍길동</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">	
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >	
</head>
<body>
	<div class="container">

		<div class="leftmargin">
			<h1>풀스텍_홍길동 SNACK</h1>
		</div>		
		<div class="search_wrap">
			<div class="record_group">
				<p>총게시글 : <span>2</span>건</p>
			</div>
			<div class="search_group">
				<select class="select">
					<option >제품명</option>
					<option >제조사명</option>
				</select>
				<input type="text" class="search_word">
				<button class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</div>
		</div>
	</div>
	<div class="board_list">
		<table class="board_table">
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>종류</th>
					<th>이름</th>
					<th>나이</th>
				</tr>
			</thead>
			<tbody>
			<%for(int k = 0; k < dtos.size(); k++){ %>
				<tr>			
					<td><a href="animal_view.jsp"><%=dtos.get(k).getNo() %>></a></td>
					<td><%=dtos.get(k).getKind()%></td>
					<td><%=dtos.get(k).getName()%></td>
					<td><%=dtos.get(k).getAge()%></td>
				</tr>	
			<%} %>
			</tbody>
		</table>
		<div class="paging">
			<a href="snack_write.html" class="write">제품등록</a>
		</div>
	</div>
 </body>
</html>







