
<%@ page import="servicios.Central" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'central.label', default: 'Central')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-central" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                         <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-central" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'central.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'central.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'central.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="zona" title="${message(code: 'central.zona.label', default: 'Zona')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${centralInstanceList}" status="i" var="centralInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${centralInstance.id}">${fieldValue(bean: centralInstance, field: "nombre")}</g:link></td>
					
						<td><g:formatDate date="${centralInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${centralInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: centralInstance, field: "zona")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${centralInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
