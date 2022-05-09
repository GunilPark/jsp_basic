<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.*, dao.*, java.util.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	Student_dao_김세훈 dao = new Student_dao_김세훈();
	String sltYear = request.getParameter("s_year");
	String sltClass = request.getParameter("s_class");
	String sltSelect = request.getParameter("s_select");
	String search = request.getParameter("s_search");
	/*
	if(select == null){
		select = "id";
		search = "";
	}*/
	
	if(sltYear == null){
		sltYear = "all";
		sltClass = "all";
		sltSelect = "no";
		search = "";
	}

	out.print("s_year : " + sltYear + "<br>");
	out.print("s_class : " + sltClass + "<br>");
	out.print("s_select : " + sltSelect + "<br>");
	out.print("s_search : " + search + "<br>");
	//ArrayList<Group_dto> dtos = dao.getMemberList(select, search);

	
	ArrayList<Student_dto_김세훈> mDtos = dao.getStudentList(sltYear, sltClass, sltSelect, search);
	out.print(mDtos.size());
%>
<!DOCTYPE html>
<html> 
<script>
	function goSearch(){
		stu.method = "post";
		stu.action = "student_list_김세훈.jsp";
		stu.submit();
	}
	
	function goView(syear, sclass, no){
		view.s_year.value = syear;
		view.s_class.value = sclass;
		view.s_no.value = no;
		view.method = "post";
		view.action = "student_view_김세훈.jsp";
		view.submit();
	}
</script>
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
<form name="view">
	<input type = "text" name = "s_year"  value = "1">
	<input type = "text" name = "s_class" value = "1">
	<input type = "text" name = "s_no" value = "1">
</form>
	<div class="container">

		<div class="leftmargin">
			<h1>풀스텍_김세훈 STUDENT</h1>
		</div>		
		<div class="search_wrap">
			<div class="record_group">
				<p>총학생수 : <span><%=mDtos.size()%></span>명</p>
			</div>
			<form name ="stu">
			<div class="search_group">
			학년 : 
			<label><input type="radio" name="s_year" value="all" <%if(sltYear.equals("all")) out.print("checked"); %>> 전체</label>
			<label><input type="radio" name="s_year" value="1" <%if(sltYear.equals("1")) out.print("checked"); %>> 1학년</label>
			<label><input type="radio" name="s_year" value="1" <%if(sltYear.equals("2")) out.print("checked"); %>> 2학년</label>
			<label><input type="radio" name="s_year" value="1" <%if(sltYear.equals("3")) out.print("checked"); %>> 3학년</label>
			<br>
	
				
			반 : 
				<input type="hidden" name="s_class" value="ini" <%if(sltClass.equals("ini")) out.print("checked"); %>>
				<input type="hidden" name="s_class" value="all" <%if(sltClass.equals("all")) out.print("checked"); %>>
				<label><input type="checkbox" name="s_class" value="1" <%if(sltClass.equals("1")) out.print("checked"); %>>1반</label>
				<label><input type="checkbox" name="s_class" value="2" <%if(sltClass.equals("2")) out.print("checked"); %>>2반</label>
				<label><input type="checkbox" name="s_class" value="3" <%if(sltClass.equals("3")) out.print("checked"); %>>3반</label>
				<label><input type="checkbox" name="s_class" value="4" <%if(sltClass.equals("4")) out.print("checked"); %>>4반</label>
				<label><input type="checkbox" name="s_class" value="5" <%if(sltClass.equals("5")) out.print("checked"); %>>5반</label>
				<br>
				
				<select name="s_select" >
					<option value = "no" <%if(sltSelect.equals("no")) out.print("selected"); %>>번호</option>
					<option value = "name" <%if(sltSelect.equals("name")) out.print("selected"); %>>성명</option>
				</select>
				
				<input type="text" name="s_search" value = <%=search%>>
				<button onclick="goSearch()" style="cursor: Pointer" class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
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
					<th>성명</th>
				</tr> 
			</thead>
			<tbody>
			<%for(int i = 0; i<mDtos.size(); i++){%>
				<tr>
					<td><%=mDtos.get(i).getsYear()%></td>
					<td><%=mDtos.get(i).getsClass()%></td>
					<td><%=mDtos.get(i).getNo()%></td>
					<td><a href="javascript:goView('<%=mDtos.get(i).getsYear()%>','<%=mDtos.get(i).getsClass()%>', '<%=mDtos.get(i).getNo()%>')"><%=mDtos.get(i).getName()%></a></td>
				</tr>
			<%}%>
			</tbody>
		</table>
		<div class="paging">
			<a href="student_write_김세훈.jsp" class="write">학생등록</a>
		</div>
	</div>
 </body>
</html>

    