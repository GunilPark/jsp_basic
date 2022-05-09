<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.*,dao.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    Student_dao_박건일 dao = new Student_dao_박건일();
    String sYear = request.getParameter("t_sYear");
    String sClass = request.getParameter("t_sClass");
    String no = request.getParameter("t_no");
  
    Student_dto_박건일 dto = dao.getViewStudent(sYear,sClass,no);
    
    int total = dao.getTotal(dto);
    String Average = dao.getAverage(dto);
    
    String classAverage = dao.getClassAverage(dto);
    %>
    
    
    
    <script>
   function goUpdate(){
	   update.method="post";
	   update.action="student_update_박건일.jsp";
	   update.submit();
   }
    
   function goDelete(){
	   var goYN = confirm("정말로 삭제하시겠습니까?");
	   if(goYN){
	   update.method="post";
	   update.action="db_student_delete_박건일.jsp";
	   update.submit();
	   }
   }
   
    </script>
    
	<form name="update">
	<input type="hidden" name="t_sYear" value="<%=sYear%>">
	<input type="hidden" name="t_sClass" value="<%=sClass%>">
	<input type="hidden" name="t_no" value="<%=no%>">
	</form>
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
							<th>학년.반.번호</th>
							<td class="th_left">
								<%=dto.getsYear()%>학년 <%=dto.getsClass()%>반 <%=dto.getNo()%>번
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td class="th_left">
								<%=dto.getName()%>
							</td>
						</tr>
						<tr>
							<th>국어</th>
							<td class="th_left">
								<%=dto.getKor()%>점
							</td>
						</tr>
						<tr>
							<th>영어</th>
							<td class="th_left">
								<%=dto.getEng()%>점
							</td>
						</tr>
						<tr>
							<th>수학</th>
							<td class="th_left">
								<%=dto.getMat()%>점
							</td>
						</tr>
						<tr>
							<th>총점</th>
							<td class="th_left">
								<%=total%>점
							</td>
						</tr>
						<tr>
							<th>평균</th>
							<td class="th_left">
								<%=Average%>점
							</td>
						</tr>
						<tr>
							<th>반평균</th>
							<td class="th_left">
								<%=classAverage%>점
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" onClick="location.href='student_list_박건일.jsp'" value="목록" class="btn_list">
				<input type="button" onClick="javascript:goUpdate()" value="수정" class="btn_list">
				<input type="button" onClick="javascript:goDelete()" value="삭제" class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>


