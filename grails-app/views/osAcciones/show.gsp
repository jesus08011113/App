
<%@ page import="servicios.OsAcciones" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'osAcciones.label', default: 'OsAcciones')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-osAcciones" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-osAcciones" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list osAcciones">
			
				<g:if test="${osAccionesInstance?.acciones}">
				<li class="fieldcontain">
					<span id="acciones-label" class="property-label"><g:message code="osAcciones.acciones.label" default="Acciones" /></span>
					
						<span class="property-value" aria-labelledby="acciones-label"><g:link controller="acciones" action="show" id="${osAccionesInstance?.acciones?.id}">${osAccionesInstance?.acciones?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${osAccionesInstance?.os}">
				<li class="fieldcontain">
					<span id="os-label" class="property-label"><g:message code="osAcciones.os.label" default="Os" /></span>
					
						<span class="property-value" aria-labelledby="os-label"><g:link controller="os" action="show" id="${osAccionesInstance?.os?.id}">${osAccionesInstance?.os?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${osAccionesInstance?.id}" />
					<g:link class="edit" action="edit" id="${osAccionesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
