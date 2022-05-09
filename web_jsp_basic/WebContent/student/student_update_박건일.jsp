<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.*,dao.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    Student_dao_박건일 dao = new Student_dao_박건일();
    String sYear = request.getParameter("t_sYear");
    String sClass = request.getParameter("t_sClass");
    String no = request.getParameter("t_no");
    
    Student_dto_박건일 dto = dao.getViewStudent(sYear, sClass, no);
    
    
    %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>풀스텍 홍길동</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >	
	<script type="text/javascript">
	function goUpdate(){
		update.method = "post";
		update.action = "db_student_update_박건일.jsp";
		update.submit();
	}
	</script>
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
					<form name="update">
						<tr>
							<th>학년</th>
							<td class="th_left">
								<%=dto.getsYear()%>학년
								<input name="t_sYear" value="<%=dto.getsYear()%>" class="input_100px" type="hidden">
							</td>
						</tr>
						<tr>
							<th>반</th>
							<td class="th_left">
								<%=dto.getsClass()%>반
								<input name="t_sClass" value="<%=dto.getsClass()%>" class="input_100px" type="hidden">
							</td>
						</tr>
						<tr>
							<th>번호</th>
							<td class="th_left">
								 <%=dto.getNo()%>번
								<input name="t_no" value="<%=dto.getNo()%>" class="input_100px" type="hidden">
							</td>
						</tr>						
						<tr>
							<th>이름</th>
							<td class="th_left">
								<input type="text" name="t_name" value="<%=dto.getName()%>" class="input_300px" type="text">
							</td>
						</tr>
						<tr>
							<th>국어</th>
							<td class="th_left">
								<input name="t_kor" value="<%=dto.getKor()%>" class="input_100px" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
							</td>
						</tr>
						<tr>
							<th>영어</th>
							<td class="th_left">
								<input name="t_eng" value="<%=dto.getEng()%>" class="input_100px" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
							</td>
						</tr>
						<tr>
							<th>수학</th>
							<td class="th_left">
								<input name="t_mat" value="<%=dto.getMat()%>" class="input_100px" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
							</td>
						</tr>
					</form>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" onClick="location.href='student_list_박건일.jsp'" value="목록" class="btn_list">
				<input type="button" onClick="javascript:goUpdate()" value="수정저장" class="btn_ok">&nbsp;&nbsp;
			</div>
		</div>
	</div>
</body>
</html>



















