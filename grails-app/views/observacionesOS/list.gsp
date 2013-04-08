
<%@ page import="servicios.ObservacionesOS" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'observacionesOS.label', default: 'ObservacionesOS')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-observacionesOS" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-observacionesOS" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'observacionesOS.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="observacionesOS.orden.label" default="Orden" /></th>
					
						<th><g:message code="observacionesOS.tipo.label" default="Tipo" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'observacionesOS.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'observacionesOS.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'observacionesOS.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${observacionesOSInstanceList}" status="i" var="observacionesOSInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${observacionesOSInstance.id}">${fieldValue(bean: observacionesOSInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: observacionesOSInstance, field: "orden")}</td>
					
						<td>${fieldValue(bean: observacionesOSInstance, field: "tipo")}</td>
					
						<td><g:formatDate date="${observacionesOSInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: observacionesOSInstance, field: "descripcion")}</td>
					
						<td><g:formatDate date="${observacionesOSInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${observacionesOSInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
