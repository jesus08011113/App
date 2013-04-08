
<%@ page import="servicios.ProyectoServicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proyectoServicio.label', default: 'ProyectoServicio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-proyectoServicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                        <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-proyectoServicio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                                                <g:sortableColumn property="proyecto" title="${message(code: 'orden.proyecto.label', default: 'Proyecto')}" />
                                                <g:sortableColumn property="servicio" title="${message(code: 'orden.servicio.label', default: 'Servicio')}" />
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proyectoServicioInstanceList}" status="i" var="proyectoServicioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proyectoServicioInstance.id}">${fieldValue(bean: proyectoServicioInstance, field: "proyecto")}</g:link></td>
					
						<td>${fieldValue(bean: proyectoServicioInstance, field: "servicio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proyectoServicioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
