<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,dao.*,dto.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    Group_dao dao = new Group_dao();
    
    String id = request.getParameter("t_id");
    
    Group_dto dto = dao.getMemberView(id);
    
    %>
    <script>
    function goUpdate(){  	
    	update.method="post";
    	update.action="db_member2_update.jsp"
    	update.submit();
    }
    
    </script>
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>풀스텍 홍길동</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >	
	<script type="text/javascript">

	</script>
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
					<form name="update">
					<tbody>
						
						<tr>
							<th>ID</th>
							<td class="th_left">
								<input name="t_id" value="<%=dto.getId()%>" class="input_300px" type="hidden">
								<%=dto.getId()%>
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td class="th_left">
								<input name="t_name" value="<%=dto.getName()%>" class="input_300px" type="text">
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<td class="th_left">
								<input name="t_age" value="<%=dto.getAge()%>" class="input_100px" type="text">
							</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td class="th_left">
								<input name="t_reg_date" value="<%=dto.getReg_date()%>" class="input_200px" type="date">							
							</td>
						</tr>
						
					</tbody>
					</form>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" onClick="location.href='member2_list.jsp'" value="목록" class="btn_list">
				<input type="button" onClick="goUpdate()" value="수정저장" class="btn_ok">&nbsp;&nbsp;
			</div>
		</div>
	</div>
</body>
</html>



















