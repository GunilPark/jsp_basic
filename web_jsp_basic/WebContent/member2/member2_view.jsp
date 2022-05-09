<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,dao.*,dto.*" %>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
Group_dao dao = new Group_dao();

String id = request.getParameter("t_id");

Group_dto dto = dao.getMemberView(id);



%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>풀스텍 홍길동</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >	
	<script type="text/javascript">
	function goUpdate(){

		update.method="post";
		update.action="member2_update.jsp";
		update.submit();
	}
	
	function goDelete(){
		var goYesNo = confirm("정말 삭제?");
		if(goYesNo){
		
		update.method="post";
		update.action="db_member2_delete.jsp";
		update.submit();
		}
	}
	
	</script>
	
	<form name="update">
	<input type="hidden" name="t_id" value="<%=id%>">
	</form>
	
</head>
<body>
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
								<%=dto.getId()%>
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td class="th_left">
								<%=dto.getName()%>
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<td class="th_left">
								<%=dto.getAge()%>
							</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td class="th_left">
								<%=dto.getReg_date()%>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" onClick="location.href='member2_list.jsp'" value="목록" class="btn_list">
				<input type="button" onClick="location.href='member2_update.jsp?t_id=<%=dto.getId()%>'" value="수정jsp" class="btn_list">
				<input type="button" onClick="javascript:goUpdate()" value="수정" class="btn_list">
				<input type="button" onClick="javascript:goDelete()" value="삭제" class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>



















