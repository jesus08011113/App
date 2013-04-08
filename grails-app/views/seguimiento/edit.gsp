<%@ page import="servicios.Seguimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seguimiento.label', default: 'Seguimiento')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-seguimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Listado de CheckList</g:link></li>
                             <li><g:link class="list" controller="orden" href="/Servicios/observacion/list" action="list">Lista de Ordenes</g:link></li>
                       <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="edit-seguimiento" class="content scaffold-edit" role="main">
			<h1>Crear Checklist </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${seguimientoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${seguimientoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${seguimientoInstance?.id}" />
				<g:hiddenField name="version" value="${seguimientoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
