<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="common.*"%>
<%

	String toDay = CommonUtil.getToday();
	out.print("오늘: " + toDay);
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>풀스텍 홍길동</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >		
	<script type="text/javascript">
		function memberSave(){
			var id = memberForm.t_id.value;	//form안에있는 input들 이름으로 value(적은 내용)값 가져오기
			var name = memberForm.t_name.value;
			var age = memberForm.t_age.value;
			var reg_date = memberForm.t_reg_date.value;
			
			if(id == ""){
				alert("id를 입력하세요.");		//알람창 함수
				memberForm.t_id.focus();	//커서 이동 시키는 함수
				return;
			}
			if(name == ""){
				alert("name를 입력하세요.");
				memberForm.t_name.focus();
				return;
			}
			if(age == ""){
				alert("age를 입력하세요.");
				memberForm.t_age.focus();
				return;
			}
			if(reg_date == ""){
				alert("reg_date를 입력하세요.");
				memberForm.t_reg_date.focus();
				return;
			}
			
			memberForm.method="post";
			memberForm.action="db_member2_save.jsp";
			memberForm.submit();
			
		}
	

	</script>
</head>
<body>
	<div class="container">

		<div class="leftmargin">
			<h1>풀스텍 홍길동 회원관리</h1>
		</div>		
		<div class="write_wrap">
			<form name="memberForm">
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
								<input name="t_id"  class="input_100px" type="text">
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td class="th_left">
								<input name="t_name"  class="input_300px" type="text">
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<td class="th_left">
								<input name="t_age"  class="input_100px" type="text">
							</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td class="th_left">
								<input name="t_reg_date" value="<%=toDay%>" class="input_200px" type="date">							
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
			<div class="btn_wrap">
				<input type="button" value="등록" onclick="memberSave()"class="btn_ok">&nbsp;&nbsp;
				<input type="button" value="목록" onclick="location.href='member2_list.jsp'" class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>



















