
<%@ page import="servicios.Observacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'observacion.label', default: 'Observacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                  <g:javascript plugin="prototype" library="scriptaculous"/>
                  <filterpane:includes />
                <g:javascript library="application" /> 
                 <link rel="stylesheet" href="${resource(dir: 'css', file: 'main_1.css')}" type="text/css">
	</head>
	<body>
		<a href="#list-observacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="orden" href="/Servicios/observacion/list" action="list">Lista de Ordenes</g:link></li>
				<sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-observacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                        
                        <div class="nav" role="navigation">
                          <table>
                            <tr>
                              <td>
                                <ul>
                                  <li>   <filterpane:filterButton text="Filtro" appliedText="Cambiar Filtro" /></li>
                                  <li>   <filterpane:isNotFiltered>Sin filtrar</filterpane:isNotFiltered></li>
                                  <li>   <filterpane:isFiltered>Con Filtro</filterpane:isFiltered></li>
                                </ul>
                              </td>
                              <td></td><td></td>
                              <td style="width:60%">
                          <li>   <g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">
        <g:textField name="q" value="${params.q}" size="50"/> <input type="submit" value="Buscar" />
    </g:form></li>
                          </td>
                          </tr>
                          <tr>
                            <td> <filterpane:currentCriteria domainBean="servicios.Observacion" quoteValues="true"/></td>
                          </tr>
                          </table>
    
                        </div>  
                        
			<table>
				<thead>
					<tr>
                                              
						
						<g:sortableColumn property="orden" title="${message(code: 'observacion.orden.label', default: 'Orden')}" params="${filterParams}"/>
						<g:sortableColumn property="nombre" title="${message(code: 'observacion.nombre.label', default: 'Nombre')}" params="${filterParams}"/>
					
						
					
						<g:sortableColumn property="usuario" title="${message(code: 'observacion.usuario.label', default: 'Usuario')}" params="${filterParams}"/>
					
						
                                                <g:sortableColumn property="dateCreated" title="${message(code: 'observacion.dateCreated.label', default: 'Creado')}" params="${filterParams}"/>
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${observacionInstanceList}" status="i" var="observacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					<td><g:link controller="orden" action="show" id="${observacionInstance?.orden?.id}">${fieldValue(bean: observacionInstance, field: "orden")}</g:link></td>	
                               
                                <td style="width:60%"><p align="center"><b><g:link action="show" id="${observacionInstance.id}">${fieldValue(bean: observacionInstance, field: "nombre")}</g:link></b></p>
                                
                                  <p> ${fieldValue(bean: observacionInstance, field: "descripcion")}</p>
                                </td>
					
						
                                                
						<td>${fieldValue(bean: observacionInstance, field: "usuario")}</td>
					
						<td style="width:10%"><g:formatDate date="${observacionInstance.dateCreated}" type="datetime" style="MEDIUM"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
              <g:paginate total="${observacionInstanceCount == null ? Observacion.count(): observacionInstanceCount}"
                            params="${filterParams}"/>
                  <filterpane:filterPane domain="servicios.Observacion" additionalProperties="identifier"
                           dialog="true"
                           title="Filtro"
                           titleKey="Filtro Avanzado"
                           
                             associatedProperties="orden.proyecto.nombre,orden.user.username,orden.tservicio.nombre,orden.central.nombre,orden.status.nombre,orden.sitio,orden.dateCreated,orden.fechaProgramada"
                            filterPropertyValues="${[dateCreated:[years:2020..2012,precision:'day'], fechaProgramada:[years:2012..2020,precision:'day']]}"
                            dialog="true"
                            visible="false"
                            showSortPanel="n"
                           showTitle="false"
                           fullAssociationPathFieldNames="false"/>
            </div>
		</div>
	</body>
</html>
