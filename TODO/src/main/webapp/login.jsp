<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="TODO - Login">
	<meta name="author" content="Ninad Todkari">
	<title>Log in</title>
</head>

<body>
	<div>
		<form method="POST" action="${contextPath}/login">
			<h2 >Log In</h2>
			<div ${error != null ? 'has-error' : ''}">
				<span>${message}</span> <input name="username" type="text" placeholder="Username" autofocus="true" />
				<input name="password" type="password" placeholder="Password" />
				<span>${error}</span> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button type="submit">Log In</button>
			</div>
		</form>
	</div>
</body>
</html>
