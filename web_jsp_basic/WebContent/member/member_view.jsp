<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,dto.*,dao.*"%>
	<%
	request.setCharacterEncoding("UTF-8");
	Group_dao dao = new Group_dao();
	String id = request.getParameter("t_id");
	out.print("id : " + id);
	
	
	Group_dto dto = dao.getMemberView(id);
   
	%>
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>풀스텍 홍길동</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >	
	<script type="text/javascript">
		function goUpdateForm() {
		mem.method="post";
		mem.action="member_update.jsp";
		mem.submit();
			
		}
		
		function goDeleteForm() {
			var goYN = confirm("증말 삭제?");
			if(goYN){
				mem.method="post";
				mem.action="db_member_delete.jsp";
				mem.submit();
			}
		}

	
	</script>
</head>
<body>
<form name="mem">
	<input type="hidden" name="t_id" value="<%=id%>">
</form>
	<div class="container">
	
		<div class="leftmargin">
			<h1>풀스텍 홍길동 회원관리</h1>
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
							<th>ID</th>
							<td class="th_left">
								<%=dao.getMemberView(id).getId() %>
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td class="th_left">
								<%=dao.getMemberView(id).getName() %>
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<td class="th_left">
								<%=dao.getMemberView(id).getAge() %>
							</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td class="th_left">
								<%=dao.getMemberView(id).getReg_date() %>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" onClick="location.href='member_list.jsp'" value="목록" class="btn_list">
				<input type="button" onClick="location.href='member_update.jsp?t_id=<%=id%>'" value="get수정" class="btn_list">
				<input type="button" onClick="goUpdateForm()" value="post수정" class="btn_list">
				<input type="button" onClick="goDeleteForm()" value="삭제" class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>



