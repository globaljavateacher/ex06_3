<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<h1>Member Join Form</h1>
		</div>
		<div>
			<form id="frm1" action="/member/join/regist" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
				<input type="text" name="userid" placeholder="아이디"><br>
				<input type="password" name="userpw" placeholder="비밀번호"><br>
				<input type="text" name="userName" placeholder="이름"><br>
				<select name="auth">
					<option value="ROLE_ADMIN">admin</option>
					<option value="ROLE_USER">user</option>
				</select><br>
				<input type="button" id="btnJoin" value="Join">
			</form>
		</div>
		<script>
			document.getElementById('btnJoin').addEventListener('click', function(){
				document.getElementById('frm1').submit();
			});
		</script>
	</body>
</html>