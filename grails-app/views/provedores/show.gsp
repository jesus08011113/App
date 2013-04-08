
<%@ page import="servicios.Provedores" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'provedores.label', default: 'Provedores')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-provedores" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-provedores" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list provedores">
			
				<g:if test="${provedoresInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="provedores.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${provedoresInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${provedoresInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="provedores.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:fieldValue bean="${provedoresInstance}" field="estatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${provedoresInstance?.telefono1}">
				<li class="fieldcontain">
					<span id="telefono1-label" class="property-label"><g:message code="provedores.telefono1.label" default="Telefono1" /></span>
					
						<span class="property-value" aria-labelledby="telefono1-label"><g:fieldValue bean="${provedoresInstance}" field="telefono1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${provedoresInstance?.telefono2}">
				<li class="fieldcontain">
					<span id="telefono2-label" class="property-label"><g:message code="provedores.telefono2.label" default="Telefono2" /></span>
					
						<span class="property-value" aria-labelledby="telefono2-label"><g:fieldValue bean="${provedoresInstance}" field="telefono2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${provedoresInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="provedores.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${provedoresInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${provedoresInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="provedores.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${provedoresInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${provedoresInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="provedores.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${provedoresInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${provedoresInstance?.id}" />
					<g:link class="edit" action="edit" id="${provedoresInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
