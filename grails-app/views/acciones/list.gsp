
<%@ page import="servicios.Acciones" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'acciones.label', default: 'Acciones')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-acciones" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-acciones" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'acciones.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="precio" title="${message(code: 'acciones.precio.label', default: 'Precio')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'acciones.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${accionesInstanceList}" status="i" var="accionesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${accionesInstance.id}">${fieldValue(bean: accionesInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: accionesInstance, field: "precio")}</td>
					
						<td>${fieldValue(bean: accionesInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accionesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
