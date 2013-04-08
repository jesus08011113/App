
<%@ page import="servicios.ProyectoCentral" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proyectoCentral.label', default: 'ProyectoCentral')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proyectoCentral" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                 <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="show-proyectoCentral" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proyectoCentral">
			
				<g:if test="${proyectoCentralInstance?.proyecto}">
				<li class="fieldcontain">
					<span id="proyecto-label" class="property-label"><g:message code="proyectoCentral.proyecto.label" default="Proyecto" /></span>
					
						<span class="property-value" aria-labelledby="proyecto-label"><g:link controller="proyecto" action="show" id="${proyectoCentralInstance?.proyecto?.id}">${proyectoCentralInstance?.proyecto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${proyectoCentralInstance?.central}">
				<li class="fieldcontain">
					<span id="central-label" class="property-label"><g:message code="proyectoCentral.central.label" default="Central" /></span>
					
						<span class="property-value" aria-labelledby="central-label"><g:link controller="central" action="show" id="${proyectoCentralInstance?.central?.id}">${proyectoCentralInstance?.central?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${proyectoCentralInstance?.id}" />
					<g:link class="edit" action="edit" id="${proyectoCentralInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
