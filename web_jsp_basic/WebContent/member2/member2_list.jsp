<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,dao.*,dto.*"%>
<%
request.setCharacterEncoding("utf-8");
	Group_dao dao = new Group_dao();
ArrayList<Group_dto> dtos = new ArrayList<>();

String select = request.getParameter("t_select");
String search = request.getParameter("t_search");

if (search == null) {
	select = "id";
	search = "";
}

dtos = dao.getMemberList(select, search);
%>
<!DOCTYPE html>
<script>


function goSearch(){
	search.method = "post";
	search.action = "member2_list.jsp";
	search.submit();
	
}

function goView(id){
	view.t_id.value = id;    //t_id 안의 value값을 id를 대입한다.
	view.method="post";
	view.action="member2_view.jsp";
	view.submit();
	
	
}


</script>
<form name="view">
	<input type="hidden" name="t_id" value="id">
</form>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!--
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
			<h1>풀스텍 홍길동 회원관리</h1>
		</div>		
		<div class="search_wrap">
			<div class="record_group">
				<p>총회원수 : <span><%=dtos.size()%></span>명</p>
			</div>
			<div class="search_group">
			<form name="search">
			
				<select name="t_select" class="select">
				<%if(select.equals("id")){ %>	
					<option value="id" selected>ID</option>
					<option value="name">성명</option>
				<%}else{ %>
					<option value="id">ID</option>
					<option value="name" selected>성명</option>
				<%} %>
				</select>
				<input name="t_search" type="text" class="search_word">
				<button onclick="goSearch()" class="btn_search">
				<i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			
			</form>
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
					<th>ID</th>
					<th>성명</th>
					<th>나이</th>
					<th>가입일</th>
				</tr>
			</thead>
			<%for(int k = 0; k<dtos.size(); k++){ %>
			<tbody>
				<tr>
					
					<td><a href="member2_view.jsp?t_id=<%=dtos.get(k).getId()%>">정보?</a>&nbsp;&nbsp;
					<a href="javascript:goView('<%=dtos.get(k).getId()%>')"><%=dtos.get(k).getId() %></a></td>
					<td><%=dtos.get(k).getName() %></td>
					<td><%=dtos.get(k).getAge() %></td>
					<td><%=dtos.get(k).getReg_date() %></td>
			
				</tr>	
			
			</tbody>
				<%}; %>
		</table>
		<div class="paging">
			<a href="member2_write.jsp" class="write">회원등록</a>
		</div>
	</div>
 </body>
</html>







