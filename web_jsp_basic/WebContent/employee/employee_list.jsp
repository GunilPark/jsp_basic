<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.*,dao.*,common.*,java.util.*" %>
    <%
    	Employee_dao dao = new Employee_dao();
            ArrayList<Employee_dto> dtos = dao.getListPage();
            
            dtos.get(0).getId();
    %>
<!DOCTYPE html>

<script type="text/javascript">

function goView(id){
	view.t_id.value = id;
	view.method ="post";
	view.action ="employee_View.jsp";
	view.submit();
	
}



</script>

<form name="view">
<input name="t_id" type="hidden" value="id">
</form>

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
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>성명</th>
					<th>부서</th>
					<th>등급</th>
					<th>고용날짜</th>
				</tr>
			</thead>
			<form name="list">
			<tbody>
			<%for(int k = 0; k < dtos.size(); k++){ %>
				<tr>
					<td><a href="javascript:goView('<%=dtos.get(k).getId()%>')"><%=dtos.get(k).getId()%></a></td>
					<td><%=dtos.get(k).getName()%></td>
					<td><%=dtos.get(k).getDepart()%></td>
					<td><%=dtos.get(k).getRank()%></td>
					<td><%=dtos.get(k).getEntry_date()%></td>
				</tr>	
			<%} %>
			</tbody>
			</form>
		</table>
		<div class="paging">
			<a href="snack_write.html" class="write">제품등록</a>
		</div>
	</div>
 </body>
</html>