
<%@ page import="servicios.Idc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'idc.label', default: 'Idc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'main_1.css')}" type="text/css">
	</head>
	<body>
		<a href="#list-idc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                         <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-idc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                                          <g:sortableColumn property="id" title="${message(code: 'orden.id.label', default: 'Id')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'idc.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="paterno" title="${message(code: 'idc.paterno.label', default: 'Paterno')}" />
					
						<g:sortableColumn property="materno" title="${message(code: 'idc.materno.label', default: 'Materno')}" />
					
						<g:sortableColumn property="estatus" title="${message(code: 'idc.estatus.label', default: 'Estatus')}" />
					
						<g:sortableColumn property="provedor" title="${message(code: 'idc.provedor.label', default: 'Provedor')}" />
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${idcInstanceList}" status="i" var="idcInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                          <td><g:link action="show" id="${idcInstance.id}">${fieldValue(bean: idcInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: idcInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: idcInstance, field: "paterno")}</td>
					
						<td>${fieldValue(bean: idcInstance, field: "materno")}</td>
					
						<td>${fieldValue(bean: idcInstance, field: "estatus")}</td>
					
						<td>${fieldValue(bean: idcInstance, field: "provedor")}</td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${idcInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
