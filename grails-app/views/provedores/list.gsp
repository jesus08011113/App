
<%@ page import="servicios.Provedores" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'provedores.label', default: 'Provedores')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'main_1.css')}" type="text/css">
	</head>
	<body>
		<a href="#list-provedores" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                         <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-provedores" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'provedores.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="estatus" title="${message(code: 'provedores.estatus.label', default: 'Estatus')}" />
					
						<g:sortableColumn property="telefono1" title="${message(code: 'provedores.telefono1.label', default: 'Telefono1')}" />
					
						<g:sortableColumn property="telefono2" title="${message(code: 'provedores.telefono2.label', default: 'Telefono2')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'provedores.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'provedores.direccion.label', default: 'Direccion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${provedoresInstanceList}" status="i" var="provedoresInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${provedoresInstance.id}">${fieldValue(bean: provedoresInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: provedoresInstance, field: "estatus")}</td>
					
						<td>${fieldValue(bean: provedoresInstance, field: "telefono1")}</td>
					
						<td>${fieldValue(bean: provedoresInstance, field: "telefono2")}</td>
					
						<td><g:formatDate date="${provedoresInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: provedoresInstance, field: "direccion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${provedoresInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
