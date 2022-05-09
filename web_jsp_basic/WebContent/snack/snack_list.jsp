<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*,dao.*,common.*"%>
<%
	request.setCharacterEncoding("utf-8");
Snack_dao dao = new Snack_dao();

String select = request.getParameter("t_select");
String search = request.getParameter("t_search");
String m_code = request.getParameter("t_m_code");

if(search == null){
	search ="";
	select ="a.p_code";
	m_code ="all";
}

/* paging 설정 start*/
String nowPage = request.getParameter("t_nowPage");

int current_page = 0; // 현재페이지 번호
int total_page = 0;    // 전체 페이지 수
int total_count = dao.getTotalCount(select, search, m_code); // 전체 행수 21
int list_setup_count = 5;  //한페이지당 출력 행수 



if(nowPage == null || nowPage.equals("")) current_page = 1; 
else current_page = Integer.parseInt(nowPage);

total_page = total_count / list_setup_count;  // 몫 : 2
int rest = 	total_count % list_setup_count;   // 나머지:1
if(rest !=0) total_page = total_page + 1;     // 3

int start = (current_page -1) * list_setup_count + 1;
int end   = current_page * list_setup_count;
/* paging 설정 end*/	





ArrayList<Snack_dto> mainDtos = dao.getSnackListPage(select, search, m_code, start, end);
ArrayList<Snack_info_dto> infoDtos = dao.getInfoList();

%>
<script>
function goSearch(){
	search.method="post";
	search.action="snack_list.jsp";
	search.submit();
}

function goView(p_code){
	view.t_p_code.value = p_code;
	view.method="post";
	view.action="snack_view.jsp";
	view.submit();
}

function goPage(pageNum){
	pageForm.t_nowPage.value = pageNum;
	pageForm.method="post";
	pageForm.action="snack_list.jsp";
	pageForm.submit();
}




</script>

<!DOCTYPE html>

<form name="view">
	<input type="hidden" name="t_p_code" value="p_code">
</form>


<form name="pageForm">
		<input type="hidden" name="t_nowPage" >
		<input type="hidden" name="t_select" value="<%=select%>">
		<input type="hidden" name="t_search" value="<%=search%>">
		<input type="hidden" name="t_m_code" value="<%=m_code%>">
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
				<p>총게시글 : <span><%=total_count%></span>건</p>
			</div>
			<div class="search_group">
				<form name= "search">
				<td class="th_left">
				<select name="t_m_code" class="select">
				<option value= "all"  <%if(m_code.equals("all")) out.print("selected"); %>>전체</option>
				
				<%for(int k = 0; k<infoDtos.size(); k++){ %>				
				<option value="<%=infoDtos.get(k).getM_code()%>"<%if(m_code.equals(infoDtos.get(k).getM_code())) out.print("selected");%>><%=infoDtos.get(k).getM_name()%></option>
				<%}; %></select>
				</td>
				
				<select name="t_select" class="select">
				
				<option value="a.p_code" <%if(select.equals("a.p_code")) out.print("selected"); %>>제품코드</option>
				<option value="a.p_name" <%if(select.equals("a.p_name")) out.print("selected"); %>>제품명</option>
				
				</select>
				<input name="t_search" type="text" class="search_word">
				<button onclick="goSearch()" class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
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
					<th>제품번호</th>
					<th>제품명</th>
					<th>제조사명</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
			<%for(int k = 0; k < mainDtos.size(); k++){ %>
				<tr>
					<td><a href="snack_view.jsp?t_p_code=<%=mainDtos.get(k).getP_code()%>"><%=mainDtos.get(k).getP_code()%></a>&nbsp;&nbsp;
						<a href="javascript:goView('<%=mainDtos.get(k).getP_code()%>')"><%=mainDtos.get(k).getP_code()%></a></td>
					<td><%=mainDtos.get(k).getP_name()%></td>
					<td><%=mainDtos.get(k).getM_code()%></td>
					<td><%=mainDtos.get(k).getPrice()%></td>
				</tr>	
			<%}; %>
			</tbody>
		</table>
		<div class="paging">
		<%
		String info = CommonUtil.pageListPost(current_page, total_page, 2);	
		out.print(info);
		%>
		
			<a href="snack_write.jsp" class="write">제품등록</a>
		</div>
	</div>
 </body>
</html>







