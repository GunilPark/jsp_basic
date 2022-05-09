<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*,dao.*,common.*"%>
<%
	request.setCharacterEncoding("UTF-8");
Group_dao dao = new Group_dao();
String select = request.getParameter("t_select");
String search = request.getParameter("t_search");

if (select == null) {
	select = "id";
	search = "";
}

/* paging 설정 start*/
String nowPage = request.getParameter("t_nowPage");

int current_page = 0; // 현재페이지 번호
int total_page = 0;    // 전체 페이지 수
int total_count = dao.getTotalCount(select, search); // 전체 행수 21
int list_setup_count = 5;  //한페이지당 출력 행수 



if(nowPage == null || nowPage.equals("")) current_page = 1; 
else current_page = Integer.parseInt(nowPage);

total_page = total_count / list_setup_count;  // 몫 : 2
int rest = 	total_count % list_setup_count;   // 나머지:1
if(rest !=0) total_page = total_page + 1;     // 3

int start = (current_page -1) * list_setup_count + 1;
int end   = current_page * list_setup_count;
/* paging 설정 end*/	

out.print("strat:" + start+"<br>");
out.print("end:" + end+"<br>");
out.print("current_page:" + current_page+"<br>");
out.print("total_page:" + total_page+"<br>");
out.print("total_count:" + total_count+"<br>");

//리스트 페이지
ArrayList<Group_dto> dtos = dao.getMemberListPage(select, search, start, end);
//ArrayList<Group_dto> dtos = dao.getMemberList(select, search);
//	ArrayList<Group_dto> dtos = dao.getMemberList();

String loginName = (String) session.getAttribute("sessionName");
String loginId = (String) session.getAttribute("sessionId");
String loginLevel = (String) session.getAttribute("sessionLevel");
if(loginLevel == null){
	loginLevel = "";
}
out.print("loginName:" + loginName + "<br>");
out.print("loginId:" + loginId + "<br>");

if (loginName == null) {
	out.print("로그인 하시오 <br>");
} else {
	out.print(loginName + "님 사용중! <br>");
}
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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/layout.css" rel="stylesheet">
<script type="text/javascript">
	function goPage(pageNum){
		pageForm.t_nowPage.value = pageNum;
		pageForm.method="post";
		pageForm.action="member_list.jsp";
		pageForm.submit();
	}

	function goSearch() {
		//		alert("작동 여부를 체크합시다.");
		//		alert(111);

		var sel = mem.t_select.value;

		mem.method = "post";
		mem.action = "member_list.jsp"
		mem.submit();

	}
	function goView(id) { //폼(form)이름 : view.
	//		alert(id);
		view.t_id.value = id;
		view.method = "post";
		view.action = "member_view.jsp";
		view.submit();

	}
</script>

</head>
<body>
	<form name="pageForm">
		<input type="hidden" name="t_nowPage" >
		<input type="hidden" name="t_select" value="<%=select%>">
		<input type="hidden" name="t_search" value="<%=search%>">
	</form>


	<form name="view">
		<input type="hidden" name="t_id">
	</form>
	<div class="container">

		<div class="leftmargin">
			<h1>풀스텍 홍길동 회원관리</h1>
		</div>
		<div class="search_wrap">
			<div class="record_group">
				<p>
					총회원수 : <span><%=dtos.size()%></span>명
				</p>
			</div>

			<form name="mem">
				<div class="search_group">
					<select name="t_select" class="select">
						<%
							if (select.equals("id")) {
						%>
						<option value="id" selected>ID</option>
						<option value="name">성명</option>
						<%
							} else {
						%>
						<option value="id">ID</option>
						<option value="name" selected>성명</option>

						<%
							}
						%>
					</select> <input name="t_search" value="<%=search%>" type="text"
						class="search_word">
					<button onclick="goSearch()" class="btn_search">
						<i class="fa fa-search"></i><span class="sr-only">검색버튼</span>
					</button>
					<%
						if (loginName == null) {
					%>
					<input type="button" onClick="location.href='member_login.jsp'"
						value="로그인" class="btn_search">
					<%
						} else {
					%>
					<input type="button" onClick="location.href='member_logout.jsp'"
						value="로그아웃" class="btn_search">
					<%
						}
					%>
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
					<th>ID</th>
					<th>성명</th>
					<th>나이</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<%
						for (int k = 0; k < dtos.size(); k++) {
					%>
				
				<tr>
					<td><a href="member_view.jsp?t_id=<%=dtos.get(k).getId()%>"><%=dtos.get(k).getId()%></a>
						&nbsp;&nbsp;&nbsp; <a
						href="javascript:goView('<%=dtos.get(k).getId()%>')">[<%=dtos.get(k).getId()%>]
					</a></td>
					<td><a href="member_view.jsp?t_id=<%=dtos.get(k).getId()%>"><%=dtos.get(k).getName()%></a>
						&nbsp;&nbsp;&nbsp; <a
						href="javascript:goView('<%=dtos.get(k).getId()%>')">[<%=dtos.get(k).getName()%>]
					</a></td>
					<td><a href="member_view.jsp?t_id=<%=dtos.get(k).getId()%>"><%=dtos.get(k).getAge()%></a>
					</td>
					<td><a href="member_view.jsp?t_id=<%=dtos.get(k).getId()%>"><%=dtos.get(k).getReg_date()%></a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<div class="paging">


		<%
		String info = CommonUtil.pageListPost(current_page, total_page, 2);	
		out.print(info);
		%>
		
		
		<%if(loginLevel.equals("top")){ %>
			<a href="member_write.jsp" class="write">회원등록</a>
		<%} %>
		</div>
	</div>
</body>
</html>







