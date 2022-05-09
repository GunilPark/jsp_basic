<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
	function inputCheck() {
	
		var k = event.keyCode;

		if(k==13){
			if (login.t_id.value == "") {
				alert("아이디를 입력하세요.");
				return;			
			}		
			login.t_password.focus();
			return;
	
		}		
	}

	function passwordCheck(){
		var k = event.keyCode;
		
		if(k == 13){
			if (login.t_password.value == "") {
				alert("비밀번호를 입력하세요.");
				return;			
			}else{
				goLogin();
			}	
			
		}
		
	}
	
	

	function goLogin() {

		login.t_id.focus();

		if (login.t_id.value == "") {
			alert("아이디를 입력하세요.");
			return;
			
		}
		
		if (login.t_password.value == "") {
			alert("비밀번호를 입력하세요.");
			return;
			
		}

		login.method = "post";
		login.action = "db_member_login.jsp";
		login.submit();
		
	}
	
	
</script>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset style="width: 300px">
		<legend>LOGIN</legend>
		<table border="0" width="300">
			<colgroup>
				<col width="100" />
				<col width="200" />
			</colgroup>
			<tbody>
				<form name="login">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="t_id"
						onkeypress="inputCheck(this)" size="10"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="t_password"
						onkeypress="passwordCheck(this)" size="12"></td>
				</tr>
				</form>
				<tr>
					<td colspan="2" align="center"><input type="button"
						onclick="goLogin()" value="로그인" /> <input type="reset"
						value="다시작성" /></td>
				</tr>
		</table>
</body>
</html>