<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="TODO">
	<meta name="author" content="Ninad Todkari">
	<title>TODO</title>
	<link href="${contextPath}/resources/css/todo.css" rel="stylesheet">

</head>

<body>
	<div>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<h2> Welcome ${pageContext.request.userPrincipal.name} | <button onclick="document.forms['logoutForm'].submit()">Logout</button> </h2>
		</c:if>
	</div>

	<div>
		<section id="todoapp">
			<header id="header">
				<h1>todo</h1>
				<form action="<c:url value="insert"/>" method="POST">
					<input type="hidden" name="filter" value="${filter}" /> 
					<input id="new-todo" name="desc" placeholder="Add an item" autofocus>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</header>
			<div>
				<p>Double click on task to edit it</p>
			</div>
			<section id="main">
				<%--<input id="toggle-all" type="checkbox">
				<label for="toggle-all">Mark all as complete</label>--%>

				<ul id="todo-list">
					<c:forEach var="task" items="${tasks}" varStatus="status">
						<li id="task_${status.count}" class="<c:if test="${task.isCompleted}">completed</c:if>" ondblclick="javascript:document.getElementById('task_${status.count}').className += ' editing';document.getElementById('taskDesc_${status.count}').focus();">
							<div >
								<form id="toggleForm_${status.count}" action="<c:url value="toggleCompleted"/>" method="POST">
									<input type="hidden" name="id" value="${task.id}" /> 
									<input type="hidden" name="filter" value="${filter}" />
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input name="toggle" type="checkbox" <c:if test="${task.isCompleted}">checked</c:if> onchange="javascript:document.getElementById('toggleForm_${status.count}').submit();">
								</form>
								Task Desc: <label>${task.desc}</label>
								Created On: <label>${task.crtDt}</label>
								Modified On: <label>${task.lastUpdDt}</label>
								<form action="<c:url value="delete"/>" method="POST">
									<input type="hidden" name="id" value="${task.id}" /> 
									<input type="hidden" name="filter" value="${filter}" />
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<button class="delete"></button>
								</form>
							</div>
							<form id="updateForm_${status.count}" action="<c:url value="update"/>" method="POST">
								<input type="hidden" name="id" value="${task.id}" /> 
								<input type="hidden" name="filter" value="${filter}" />
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input class="edit" id="taskDesc_${status.count}" name="desc" value="${task.desc}" onblur="javascript:document.getElementById('updateForm_${status.count}').submit();" />
							</form>
						</li>
					</c:forEach>
				</ul>
			</section>
		</section>
	</div>

</body>
</html>
