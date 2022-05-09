<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*,dao.*"%>
<%
	Snack_dao dao = new Snack_dao();
ArrayList<Snack_info_dto> dtos = dao.getInfoList();
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>풀스텍 홍길동</title>
<link href="../css/common.css" rel="stylesheet">
<link href="../css/layout.css" rel="stylesheet">
<script type="text/javascript">
	function snackSave() {
		
		if (snack.t_p_code.value == "") {
			alert("제품코드입력!");
			snack.t_p_code.focus();
			return;
		}
		
		if (snack.t_p_name.value == "") {
			alert("제품이름입력!");
			snack.t_p_name.focus();
			return;
		}
		if (snack.t_price.value == "") {
			alert("가격입력!");
			snack.t_price.focus();
			return;
		}
		if (snack.t_m_code.value == "") {
			alert("제조사 코드입력!");
			snack.t_m_code.focus();
			return;
		}

		snack.method = "post";
		snack.action = "db_snack_save.jsp";
		snack.submit();
	}
</script>
</head>
<body>
	<div class="container">

		<div class="leftmargin">
			<h1>풀스텍_홍길동 SNACK</h1>
		</div>
		<div class="write_wrap">
			<form name="snack">
				<div class="board_list">
					<table class="board_table">
						<colgroup>
							<col width="12%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>제품번호</th>
								<td class="th_left"><input name="t_p_code" value="자동생성" readonly
									class="input_100px" type="text"></td>
							</tr>
							<tr>
								<th>제품명</th>
								<td class="th_left"><input name="t_p_name"
									class="input_300px" type="text"></td>
							</tr>
							<tr>
								<th>가격</th>
								<td class="th_left"><input name="t_price"
									class="input_100px" type="text"></td>
							</tr>
							<tr>
								<th>제조사</th>
								<td class="th_left"><select name="t_m_code" class="select">
										<%
											for (int k = 0; k < dtos.size(); k++) {
										%>
										<option value="<%=dtos.get(k).getM_code()%>"><%=dtos.get(k).getM_name()%></option>
										<%
											};
										%>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="btn_wrap">
				<input type="button" value="등록" onclick="script:snackSave()"
					class="btn_ok">&nbsp;&nbsp; 
				<input type="button" value="목록jsp" onclick="location.href='snack_list.jsp'"
					class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>



















