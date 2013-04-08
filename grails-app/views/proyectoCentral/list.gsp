
<%@ page import="servicios.ProyectoCentral" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proyectoCentral.label', default: 'ProyectoCentral')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-proyectoCentral" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                         <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-proyectoCentral" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					<g:sortableColumn property="proyecto" title="${message(code: 'orden.proyecto.label', default: 'Proyecto')}" params="${filterParams}"/>
					<g:sortableColumn property="central" title="${message(code: 'orden.central.label', default: 'Central')}" params="${filterParams}"/>
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proyectoCentralInstanceList}" status="i" var="proyectoCentralInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proyectoCentralInstance.id}">${fieldValue(bean: proyectoCentralInstance, field: "proyecto")}</g:link></td>
					
						<td>${fieldValue(bean: proyectoCentralInstance, field: "central")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proyectoCentralInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
