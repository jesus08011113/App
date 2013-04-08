
<%@ page import="servicios.TServicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'TServicio.label', default: 'TServicio')}" />
		<title><g:message code="Lista de Servicios" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-TServicio" class="skip" tabindex="-1"><g:message code="Lista de Servicios" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Crear Servicio" args="[entityName]" /></g:link></li>
                        <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-TServicio" class="content scaffold-list" role="main">
			<h1><g:message code="Lista de Servicios" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'TServicio.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'TServicio.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'TServicio.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'TServicio.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${TServicioInstanceList}" status="i" var="TServicioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${TServicioInstance.id}">${fieldValue(bean: TServicioInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: TServicioInstance, field: "codigo")}</td>
					
						<td><g:formatDate date="${TServicioInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${TServicioInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${TServicioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
