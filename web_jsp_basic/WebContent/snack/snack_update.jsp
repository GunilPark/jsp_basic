<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.*,dto.*,dao.*" %>
<%
request.setCharacterEncoding("utf-8");
Snack_dao dao = new Snack_dao();
ArrayList<Snack_info_dto> infoDtos = dao.getInfoList();
String p_code = request.getParameter("t_p_code");

Snack_dto dto = dao.getSnackView2(p_code);



%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>풀스텍 홍길동</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >	
	<script type="text/javascript">
function goUpdate(){
	update.methode="post";
	update.action="db_snack_update.jsp"
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
						<form name="update">
					<tbody>
				
						<tr>
							<th>제품번호</th>
							<td class="th_left">
								<%=dto.getP_code()%><input name="t_p_code" value="<%=dto.getP_code()%>" class="input_300px" type="hidden" readonly>
							</td>
						</tr>
						<tr>
							<th>제품명</th>
							<td class="th_left">
								<input name="t_p_name" value="<%=dto.getP_name()%>" class="input_300px" type="text">
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td class="th_left">
								<input name="t_price" value="<%=dto.getPrice()%>" class="input_100px" type="text">
							</td>
						</tr>
						<tr>
							<th>제조사</th>
							<td class="th_left">
								<select name="t_m_code" class="select">
								<%for(int k = 0; k < infoDtos.size(); k++){ %>
								<option value="<%=infoDtos.get(k).getM_code()%>"><%=infoDtos.get(k).getM_name()%></option>
								<%} %>
								</select>								
							</td>
						</tr>
						
					</tbody>
					</form>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" onClick="location.href='snack_list.jsp'" value="목록" class="btn_list">
				<input type="button" onClick="javascript:goUpdate()" value="수정저장" class="btn_ok">&nbsp;&nbsp;
			</div>
		</div>
	</div>
</body>
</html>



















