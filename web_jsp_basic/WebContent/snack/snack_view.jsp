<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="dao.*,dto.*" %>
<%
request.setCharacterEncoding("utf-8");
Snack_dao dao = new Snack_dao();
String p_code = request.getParameter("t_p_code");

Snack_dto dto = dao.getSnackView(p_code);

%>




<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>풀스텍 홍길동</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >	
	<script type="text/javascript">
	function goUpdate(){
		view.method="post";
		view.action="snack_update.jsp";
		view.submit();
		
	}
	
	function goDelete(){
		var goYesNo = confirm("정말삭제하시겠습니까?");
		if(goYesNo){
			view.method="post";
			view.action="db_snack_delete.jsp";
			view.submit();
		}
	
	}
	</script>
	
<form name="view">
	<input type="hidden" name="t_p_code" value="<%=p_code%>">
</form>
</head>
<body>
	<div class="container">
	
		<div class="leftmargin">
			<h1>풀스텍_홍길동 SNACK</h1>
		</div>		
		<div class="write_wrap">
		
			<div class="board_list">
				<table class="board_table">
					<colgroup>
						<col width="12%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>제품번호</th>
							<td class="th_left">
								<%=dto.getP_code()%>
							</td>
						</tr>
						<tr>
							<th>제품명</th>
							<td class="th_left">
								<%=dto.getP_name()%>
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td class="th_left">
								<%=dto.getPrice()%>
							</td>
						</tr>
						<tr>
							<th>제조사</th>
							<td class="th_left">
								<%=dto.getM_code()%>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" onClick="location.href='snack_list.jsp'" value="목록" class="btn_list">
				<input type="button" onClick="location.href='snack_update.jsp?t_p_code=<%=p_code%>'" value="수정jsp" class="btn_list">
				&nbsp;&nbsp;<input type="button" onClick="javascript:goUpdate()" value="수정" class="btn_list">
				
				<input type="button" onClick="goDelete()" value="삭제" class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>



















