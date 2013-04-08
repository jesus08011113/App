<%@ page import="servicios.Orden" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orden.label', default: 'Orden')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
              
               
        <g:javascript plugin="prototype" library="scriptaculous"/>
        <r:require module="export"/>        
         <export:resource /> 
                
                <filterpane:includes />
                <g:javascript library="application" /> 
                
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'main_1.css')}" type="text/css">
	</head>
	<body>
		<a href="#list-orden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="list" controller="observacion" >Lista de Observaciónes</g:link></li>
                        <li><g:link class="list" controller="seguimiento" >Listado de Check List</g:link></li>
                        <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
      
		<div id="list-orden" class="content scaffold-list" role="main">
			<h1>Listado de Ordenes</h1>
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
                            <td> <filterpane:currentCriteria domainBean="servicios.Orden" quoteValues="true"/></td>
                           
                          </tr>
                          </table>
    
                        </div> 
                        
                       
                        
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'orden.id.label', default: 'Id')}" params="${filterParams}"/>
						<g:sortableColumn property="ticket" title="${message(code: 'orden.ticket.label', default: 'Ticket')}" params="${filterParams}"/>
						<g:sortableColumn property="cso" title="${message(code: 'orden.cso.label', default: 'CSO')}" params="${filterParams}"/>
						<g:sortableColumn property="po" title="${message(code: 'orden.po.label', default: 'PO')}" params="${filterParams}"/>
						<g:sortableColumn property="central" title="${message(code: 'orden.central.label', default: 'Central')}" params="${filterParams}"/>
                                                <g:sortableColumn property="sitio" title="${message(code: 'orden.sitio.label', default: 'Sitio')}" params="${filterParams}"/>
                                                <g:sortableColumn property="proyecto" title="${message(code: 'orden.proyecto.label', default: 'Proyecto')}" params="${filterParams}"/>
                                                <g:sortableColumn property="servicio" title="${message(code: 'orden.servicio.label', default: 'Servicio')}" params="${filterParams}"/>
						<g:sortableColumn property="status" title="${message(code: 'orden.status.label', default: 'Status')}" params="${filterParams}"/>
                                                <g:sortableColumn property="fechaProgramada" title="${message(code: 'orden.fechaProgramada.label', default: 'Fecha Programada')}" params="${filterParams}"/>
						<g:sortableColumn property="usuario" title="${message(code: 'orden.usuario.label', default: 'Usuario')}" params="${filterParams}"/>
                                                <g:sortableColumn property="dateCreated" title="${message(code: 'orden.dateCreated.label', default: 'Creado')}" params="${filterParams}"/>
                                                <th> Check List</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${ordenInstanceList}" status="i" var="ordenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ordenInstance.id}">${fieldValue(bean: ordenInstance, field: "id")}</g:link></td>
                                                <td>${fieldValue(bean: ordenInstance, field: "ticket")}</td>
                                                <td>${fieldValue(bean: ordenInstance, field: "cso")}</td>
                                                <td>${fieldValue(bean: ordenInstance, field: "po")}</td>
                                                <td>${fieldValue(bean: ordenInstance, field: "central")}</td>
						<td>${fieldValue(bean: ordenInstance, field: "sitio")}</td>
						<td>${fieldValue(bean: ordenInstance, field: "proyecto")}</td>
                                                <td>${fieldValue(bean: ordenInstance, field: "servicio")}</td>
                                                <td>${fieldValue(bean: ordenInstance, field: "status")}</td>
                                                <td><g:formatDate date="${ordenInstance.fechaProgramada}" type="date" style="MEDIUM"  /></td>
						<td>${fieldValue(bean: ordenInstance, field: "usuario")}</td>
						<td><g:formatDate date="${ordenInstance.dateCreated}" type="datetime" style="MEDIUM"  /></td>
                                                <td>  <g:if test="${ordenInstance?.seguimiento}"><center>√</center> </g:if>
                                                <g:else test="${ordenInstance?.seguimiento}"><center>x</center> </g:else>
                                                </td>
					</tr>
				</g:each>
				</tbody>
			</table>
                      
		</div>
                
               <div class="pagination">
              <g:paginate total="${ordenInstanceCount == null ? Orden.count(): ordenInstanceCount}"
                            params="${filterParams}"/>
                <export:formats formats="['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']" /> 
            </div>
                
       <filterpane:filterPane domain="servicios.Orden" additionalProperties="identifier"
                           dialog="true"
                           title="Filtro"
                           titleKey="Filtro Avanzado"
                            excludeProperties="horaAtencion,horaArribo,horaSalida"
                             associatedProperties="ingeniero.nombre,proyecto.nombre,usuario.username,servicio.nombre,central.nombre,status.nombre"
                            filterPropertyValues="${[dateCreated:[years:2012..2020,precision:'day'],fechaProgramada:[years:2012..2020,precision:'day'],fechaConclusion:[years:2012..2020,precision:'day'] ]}"
                            dialog="true"
                            visible="false"
                            showSortPanel="n"
                           showTitle="false"
                           fullAssociationPathFieldNames="false"/>
                  
	</body>
</html>
