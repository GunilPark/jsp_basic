<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.*,dao.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    Student_dao_박건일 dao = new Student_dao_박건일();
    String sYear = request.getParameter("t_sYear");
    String sClass = request.getParameter("t_sClass");
    String no = request.getParameter("t_no");
    String name = request.getParameter("t_name");
    String kor = request.getParameter("t_kor");
    String eng = request.getParameter("t_eng");
    String mat = request.getParameter("t_mat");
    
    if(sYear == null){
    	sYear ="1";
    	sClass ="1";
    	no ="";
    	name ="";
    	kor="";
    	eng="";
    	mat="";
    	
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>풀스텍 홍길동</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >		
	<script type="text/javascript">
	
	function goInsert(){
		var sYear = insert.t_sYear.value;
		var sClass = insert.t_sClass.value;
		var no = insert.t_no.value;
		var name = insert.t_name.value;
		var kor = insert.t_kor.value;
		var eng = insert.t_eng.value;
		var mat = insert.t_mat.value;
		
		if(sYear == ""){
			alert("학년을 입력해 주세요");
			return;
		}
		if(sClass == ""){
			alert("반을 입력해 주세요");
			return;
		}
		if(no == ""){
			alert("번호를 입력해 주세요");
			return;
		}
		if(name == ""){
			alert("이름을 입력해 주세요");
			return;
		}
		
		if(kor == ""){
			alert("국어점수를 입력해 주세요");
			return;
			
		}else if(kor > 100){
			alert("점수는 100점을 넘을 수 없습니다.");
			return;
		}
		
		if(eng == ""){
			alert("영어점수를 입력해 주세요");
			return;
		}else if(eng > 100){
			alert("점수는 100점을 넘을 수 없습니다.");
			return;
		}
		
		if(mat == ""){
			alert("수학점수를입력해 주세요");
			return;
		}else if(mat > 100){
			alert("점수는 100점을 넘을 수 없습니다.");
			return;
		}
		
		insert.method="post";
		insert.action="db_student_insert_박건일.jsp";
		insert.submit();
		
	}
	
	</script>
</head>
<body>
	<div class="container">

		<div class="leftmargin">
			<h1>풀스텍_홍길동 SNACK</h1>
		</div>		
		<div class="write_wrap">
			<form name="insert">
			<div class="board_list">
				<table class="board_table">
					<colgroup>
						<col width="12%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>학년</th>
							<td class="th_left">
							<select name="t_sYear" class="select">
								<option value="1" <%if(sYear.equals("1")){out.print("selected");}%>>1</option>
								<option value="2" <%if(sYear.equals("2")){out.print("selected");}%>>2</option>
								<option value="3" <%if(sYear.equals("3")){out.print("selected");}%>>3</option>
							</select>				
							</td>
						</tr>
						<tr>
							<th>반</th>
							<td class="th_left">				
							<select name="t_sClass" class="select">
								<option value="1" <%if(sClass.equals("1")){out.print("selected");}%>>1</option>
								<option value="2" <%if(sClass.equals("2")){out.print("selected");}%>>2</option>
								<option value="3" <%if(sClass.equals("3")){out.print("selected");}%>>3</option>
								<option value="4" <%if(sClass.equals("4")){out.print("selected");}%>>4</option>
								<option value="5" <%if(sClass.equals("5")){out.print("selected");}%>>5</option>
							</select>
							</td>
						</tr>
						<tr>
							<th>번호</th>
							<td class="th_left">						
								번호:<input name="t_no" value="<%=no%>" class="input_100px" type="text">
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td class="th_left">
								<input name="t_name" value="<%=name%>" class="input_300px" type="text">
							</td>
						</tr>
						<tr>
							<th>국어</th>
							<td class="th_left">
								<input name="t_kor" value="<%=kor%>"  class="input_100px" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
							</td>
						</tr>
						<tr>
							<th>영어</th>
							<td class="th_left">
								<input name="t_eng" value="<%=eng%>"  class="input_100px" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
							</td>
						</tr>
						<tr>
							<th>수학</th>
							<td class="th_left">
								<input name="t_mat" value="<%=mat%>" class="input_100px" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
							</td>
						</tr>						
					</tbody>
				</table>
			</div>
			</form>
			<div class="btn_wrap">
				<input type="button" value="등록" onclick="javascript:goInsert()" class="btn_ok">&nbsp;&nbsp;
				<input type="button" value="목록" onclick="location.href='student_list_박건일.jsp'" class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>



















