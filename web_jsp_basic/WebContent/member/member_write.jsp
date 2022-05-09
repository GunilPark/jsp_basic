<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*"%>
<%
	String loginLevel = (String) session.getAttribute("sessionLevel");
	if(loginLevel == null){
		loginLevel = "";
	}
	
	
	
	
	String toDay = CommonUtil.getToday();
	out.print("오늘: " + toDay);
%>

<%
	if(!loginLevel.equals("top")){
%>
<script>
alert("관리자용 화면입니다.");
location.href="member_login.jsp";
</script>
<%
	}else{

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
			//alert("등록 완료.");
			
			var id = member.t_id.value;
			var name = member.t_name.value;
			var age = member.t_age.value;
			var reg_date = member.t_reg_date.value;
			
			if(id ==""){
				alert("id를 입력하시오!");
				member.t_id.focus();
				return;
			}
			
			if(name ==""){
				alert("이름을 입력하시오!");
				member.t_name.focus();
				return;
			}
			if(member.t_age.value ==""){
				alert("나이를 입력하시오!");
				member.t_age.focus();
				return;
			}
			if(member.t_reg_date.value ==""){
				alert("날짜 선택 하세요!");
				member.t_reg_date.focus();
				return;
			}

			
			member.method = "post";	// get, post 두종류 있음.
//			member.action = "db_member_save.jsp";
			member.action = "db_member_save_2.jsp";
			member.submit();
		}
	
	
	</script>
</head>
<body>
	<div class="container">

		<div class="leftmargin">
			<h1>풀스텍 홍길동 회원관리</h1>
		</div>		
		<div class="write_wrap">
			<form name="member">
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
								<input name="t_reg_date" value="<%=toDay%>"/*초기값 설정*/ class="input_200px" type="date">							
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
			<div class="btn_wrap">
				<input type="button" value="등록" onclick="memberSave()" class="btn_ok">&nbsp;&nbsp;
				<input type="button" value="목록" onclick="location.href='member_list.jsp'" class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>
<%
	}
%>






