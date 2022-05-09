<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*,dao.*,common.*" %>
<%
request.setCharacterEncoding("utf-8");
Student_dao_박건일 dao = new Student_dao_박건일();

String selectYear = request.getParameter("t_selectYear");
String[] selectClass = request.getParameterValues("t_selectClass");
String selectNN = request.getParameter("t_selectNN");
String search = request.getParameter("t_search");


if(selectYear == null){
	selectYear = "all";
	
	selectNN = "name";
	search = "";
}

if(selectClass == null){
	selectClass = new String[6];
for(int k = 0; k<5; k++){
	selectClass[k] = Integer.toString(k+1);
}


}


/*
onclic 일때는 goSearch() 바로 써주면 되고, href(태그)일때는 javascript:goSearch() 라고 써줘야한다.ㅋㅋ
*/

/* paging 설정 start*/
String nowPage = request.getParameter("t_nowPage");

int current_page = 0; // 현재페이지 번호
int total_page = 0;    // 전체 페이지 수
int total_count = dao.getTotalCount(selectYear, selectClass, selectNN, search); // 전체 행수 21
int list_setup_count = 5;  //한페이지당 출력 행수 



if(nowPage == null || nowPage.equals("")) current_page = 1; 
else current_page = Integer.parseInt(nowPage);

total_page = total_count / list_setup_count;  // 몫 : 2
int rest = 	total_count % list_setup_count;   // 나머지:1
if(rest !=0) total_page = total_page + 1;     // 3

int start = (current_page -1) * list_setup_count + 1;
int end   = current_page * list_setup_count;
/* paging 설정 end*/	



//ArrayList<Student_dto_박건일> dtos = dao.getStudentListTotal(selectYear, selectClass1, selectClass2, selectClass3, selectClass4, selectClass5, selectNN, search);

ArrayList<Student_dto_박건일> dtos = dao.getStudentListPage(selectYear, selectClass, selectNN, search, start, end);
%>
<!DOCTYPE html>

<script>

function goPage(pageNum){
	pageForm.t_nowPage.value = pageNum;
	pageForm.method="post";
	pageForm.action="student_list_박건일.jsp";
	pageForm.submit();
}


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

<form name="pageForm">

		<input type="text" name="t_nowPage" >
		<input type="text" name="t_selectYear" value="<%=selectYear%>">
		<%for(int k = 0; k<selectClass.length; k++){ %>	
				<input type="text" name="t_selectClass" value="<%=selectClass[k]%>">
		<%} %>
		<input type="text" name="t_selectNN" value="<%=selectNN%>">
		<input type="text" name="t_search" value="<%=search%>">
	</form>

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
				<input name="t_selectYear" value="all" type="radio" <%if(selectYear.equals("all")){out.print("checked"); }%>>전체
				<input name="t_selectYear" value="1" type="radio" <%if(selectYear.equals("1")){out.print("checked"); }%>>1학년
				<input name="t_selectYear" value="2" type="radio" <%if(selectYear.equals("2")){out.print("checked"); }%>>2학년
				<input name="t_selectYear" value="3" type="radio" <%if(selectYear.equals("3")){out.print("checked"); }%>>3학년
			<br>
			<%for(int k = 0; k<5; k++){ %>	
				<input name="t_selectClass" value="<%=k+1%>" type="checkbox"  
				<%
				for(int i = 0; i<selectClass.length; i++){
				if(selectClass.length != 6 && selectClass[i].equals(Integer.toString(k+1))){out.print("checked");}
				}
				%>
				><%=k+1%>반
			<%} %>
			<br>
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
			<%
		String info = CommonUtil.pageListPost(current_page, total_page, 2);	
		out.print(info);
		%>
		
			<a href="student_write_박건일.jsp" class="write">학생 등록</a>
		</div>
	</div>
 </body>
</html>








