
<%@ page import="servicios.Os" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'os.label', default: 'Os')}" />
		<title>Lista de Servicios</title>
	</head>
	<body>
		<a href="#list-os" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="busqueda" controller="cliente">Busqueda y alta</g:link></li>
			</ul>
		</div>
		<div id="list-os" class="content scaffold-list" role="main">
			<h1>Listado de ordenes de servicio</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="ticket" title="${message(code: 'os.descripcion.label', default: 'No Ticket')}" />
					
						<th><g:message code="os.status.label" default="Status" /></th>
					
                                                <th><g:message code="os.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="fechaEntrega" title="${message(code: 'os.fechaEntrega.label', default: 'Fecha Entrega')}" />
					
						
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${osInstanceList}" status="i" var="osInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${osInstance.id}">${fieldValue(bean: osInstance, field: "ticket")}</g:link></td>
					
						<td>${fieldValue(bean: osInstance, field: "status")}</td>
					
                                                <td>${fieldValue(bean: osInstance, field: "cliente")}</td>
					
						<td><g:formatDate date="${osInstance.fechaEntrega}" /></td>
					
						
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${osInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
