
<%@ page import="servicios.UsuarioProyecto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-usuarioProyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Nueva Relación</g:link></li>
                        <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-usuarioProyecto" class="content scaffold-list" role="main">
			<h1>Proyectos por Usuario</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="usuarioProyecto.usuario.label" default="Usuario" /></th>
					
						<th><g:message code="usuarioProyecto.proyecto.label" default="Proyecto" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'usuarioProyecto.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'usuarioProyecto.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioProyectoInstanceList}" status="i" var="usuarioProyectoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioProyectoInstance.id}">${fieldValue(bean: usuarioProyectoInstance, field: "usuario")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioProyectoInstance, field: "proyecto")}</td>
					
						<td><g:formatDate date="${usuarioProyectoInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${usuarioProyectoInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioProyectoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
