<%@ page import="servicios.TServicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'TServicio.label', default: 'TServicio')}" />
		<title><g:message code="Crear Servicio" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-TServicio" class="skip" tabindex="-1"><g:message code="Tipo de Servicio" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Lista de Servicios" args="[entityName]" /></g:link></li>
                        <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="create-TServicio" class="content scaffold-create" role="main">
			<h1><g:message code="Nuevo Tipo de Servicio" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${TServicioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${TServicioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
