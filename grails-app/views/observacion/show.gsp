
<%@ page import="servicios.Observacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'observacion.label', default: 'Observacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-observacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" controller="orden" href="/Servicios/observacion/list" action="list">Lista de Ordenes</g:link></li>
                                <li><g:link class="list" action="list"><g:message code="Lista de Observaciones" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="orden" href="/Servicios/observacion/create" action="create">Nueva Orden</g:link></li>
				 <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="show-observacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list observacion">
			
				<g:if test="${observacionInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="observacion.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${observacionInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${observacionInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="observacion.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="orden" action="show" id="${observacionInstance?.orden?.id}">${observacionInstance?.orden?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${observacionInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="observacion.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${observacionInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
                           <g:if test="${observacionInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="observacionInstance.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="user" action="show" id="${observacionInstance?.usuario?.id}">${observacionInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
                          
                          
                          <g:if test="${observacionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="observacion.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${observacionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${observacionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="observacion.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${observacionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
                          
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${observacionInstance?.id}" />
					<g:link class="edit" action="edit" id="${observacionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					  <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SUPERVISOR"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></sec:ifAnyGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
