
<%@ page import="servicios.Conceptos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptos.label', default: 'Conceptos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conceptos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conceptos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="concepto" title="${message(code: 'conceptos.concepto.label', default: 'Concepto')}" />
					
						<g:sortableColumn property="precio" title="${message(code: 'conceptos.precio.label', default: 'Precio')}" />
					
						<th><g:message code="conceptos.ticket.label" default="Ticket" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptosInstanceList}" status="i" var="conceptosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptosInstance.id}">${fieldValue(bean: conceptosInstance, field: "concepto")}</g:link></td>
					
						<td>${fieldValue(bean: conceptosInstance, field: "precio")}</td>
					
						<td>${fieldValue(bean: conceptosInstance, field: "ticket")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
