<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*,dao.*" %>
<%
request.setCharacterEncoding("utf-8");
Student_dao_박건일 dao = new Student_dao_박건일();

String selectYear = request.getParameter("t_selectYear");
String selectClass = request.getParameter("t_selectClass");
String selectNN = request.getParameter("t_selectNN");
String search = request.getParameter("t_search");

if(selectYear == null){
	selectYear = "all";
	selectClass = "all";
	selectNN = "no";
	search = "";
	
}

String query = dao.getStudentList2(selectYear, selectClass, selectNN, search);
out.print(query);

ArrayList<Student_dto_박건일> dtos = dao.getStudentList(selectYear,selectClass,selectNN,search);
%>
<!DOCTYPE html>

<script>
function viewStudent(sYear,sClass,no){
	
	view.t_sYear.value=sYear;
	view.t_sClass.value=sClass;
	view.t_no.value=no;
	view.method="post";
	view.action="student_view_박건일.jsp";
	view.submit();
	
}

function goSearch(){
	
	search.method="post";
	search.action="student_list_박건일.jsp";
	search.submit();
	
	
}

</script>
<form name="view">
<input type="hidden" name="t_sYear" value="sYear">
<input type="hidden" name="t_sClass" value="sClass">
<input type="hidden" name="t_no" value="no">
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
				<p>학생수 : <span><%=dtos.size() %></span>명</p>
			</div>
			<form name="search">
			<div class="search_group">
				<select name="t_selectYear" class="select">
					<option value="all" <%if(selectYear.equals("all")){out.print("selected"); }%>>학년</option>
					<option value="1" <%if(selectYear.equals("1")){out.print("selected"); }%>>1</option>
					<option value="2" <%if(selectYear.equals("2")){out.print("selected"); }%>>2</option>
					<option value="3" <%if(selectYear.equals("3")){out.print("selected"); }%>>3</option>
				</select>
				
				<audio src="sasa"></audio>

				<select name="t_selectClass" class="select">
					<option value="all" <%if(selectClass.equals("all")){out.print("selected"); }%>>반</option>
					<option value="1" <%if(selectClass.equals("1")){out.print("selected"); }%>>1</option>
					<option value="2" <%if(selectClass.equals("2")){out.print("selected"); }%>>2</option>
					<option value="3" <%if(selectClass.equals("3")){out.print("selected"); }%>>3</option>
					<option value="4" <%if(selectClass.equals("4")){out.print("selected"); }%>>4</option>
					<option value="5" <%if(selectClass.equals("5")){out.print("selected"); }%>>5</option>
				</select>
				<select name="t_selectNN" class="select">
					<option value="no" <%if(selectNN.equals("no")){out.print("selected"); }%>>번호</option>
					<option value="name" <%if(selectNN.equals("name")){out.print("selected"); }%>>성명</option>
				</select>
				<input name="t_search" type="text" class="search_word" value="<%=search%>">
				<button onclic="javascript:goSearch()" class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</div>
			</form>
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
					<th>학년</th>
					<th>반</th>
					<th>번호</th>
					<th>이름</th>
				</tr>
			</thead>
			<tbody>
				<%for(int k = 0; k<dtos.size(); k++){ %>
				<tr>
					<th><%=dtos.get(k).getsYear()%>학년</th>
					<th><%=dtos.get(k).getsClass()%>반</th>
					<th><%=dtos.get(k).getNo()%>번</th>
					<th><a href="javascript:viewStudent('<%=dtos.get(k).getsYear()%>','<%=dtos.get(k).getsClass()%>','<%=dtos.get(k).getNo()%>')"><%=dtos.get(k).getName()%></a></th>				
				</tr>
				<%}; %>	
			
			</tbody>
		</table>
		<div class="paging">
			<a href="student_write_박건일.jsp" class="write">학생 등록</a>
		</div>
	</div>
 </body>
</html>











