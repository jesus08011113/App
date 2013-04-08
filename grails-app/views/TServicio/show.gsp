
<%@ page import="servicios.TServicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'TServicio.label', default: 'TServicio')}" />
		<title><g:message code="Mostrar Servicio" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-TServicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Lista de Servicios" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Crear Servicio" args="[entityName]" /></g:link></li>
                <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="show-TServicio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list TServicio">
			
				<g:if test="${TServicioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="TServicio.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${TServicioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${TServicioInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="TServicio.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${TServicioInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
                          
                          <g:if test="${TServicioInstance?.herramienta}">
				<li class="fieldcontain">
					<span id="herramienta-label" class="property-label"><g:message code="TServicio.herramienta.label" default="Herramienta" /></span>
					
						<span class="property-value" aria-labelledby="herramienta-label"><g:fieldValue bean="${TServicioInstance}" field="herramienta"/></span>
					
				</li>
				</g:if>
                          <g:if test="${TServicioInstance?.documentos}">
				<li class="fieldcontain">
					<span id="documentos-label" class="property-label"><g:message code="TServicio.documentos.label" default="Documentos" /></span>
					
						<span class="property-value" aria-labelledby="documentos-label"><g:fieldValue bean="${TServicioInstance}" field="documentos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${TServicioInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="Fecha de Creación" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${TServicioInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				
			
				
			
				<g:if test="${TServicioInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="TServicio.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${TServicioInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${TServicioInstance?.id}" />
					<g:link class="edit" action="edit" id="${TServicioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
