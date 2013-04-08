
<%@ page import="servicios.Sitio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sitio.label', default: 'Sitio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                 <link rel="stylesheet" href="${resource(dir: 'css', file: 'main_1.css')}" type="text/css">
	</head>
	<body>
		<a href="#list-sitio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                         <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-sitio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'sitio.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="sitio.central.label" default="Central" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sitioInstanceList}" status="i" var="sitioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sitioInstance.id}">${fieldValue(bean: sitioInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: sitioInstance, field: "central")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sitioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
