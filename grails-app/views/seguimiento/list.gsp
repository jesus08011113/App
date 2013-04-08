
<%@ page import="servicios.Seguimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seguimiento.label', default: 'Seguimiento')}" />
		<title>Listado de Check List</title>
                
                 <g:javascript plugin="prototype" library="scriptaculous"/>
        <r:require module="export"/>        
         <export:resource /> 
                
                <filterpane:includes />
                <g:javascript library="application" /> 
                
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'main_1.css')}" type="text/css">
                
	</head>
	<body>
		<a href="#list-seguimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				 <li><g:link class="list" controller="orden" href="/Servicios/observacion/list" action="list">Lista de Ordenes</g:link></li>
                                <li><g:link class="list" controller="observacion" >Lista de Observaciónes</g:link></li>
                                 <li><g:link class="create" controller="orden" href="/Servicios/observacion/create" action="create">Nueva Orden</g:link></li>
                        <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="list-seguimiento" class="content scaffold-list" role="main">
			<h1>Listado de Check List</h1>
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
                              
                          </tr>
                          <tr>
                            <td> <filterpane:currentCriteria domainBean="servicios.Seguimiento" quoteValues="true"/></td>
                           
                          </tr>
                          </table>
    
                        </div> 
                        
                        
                        
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'seguimiento.id.label', default: 'Id')}" params="${filterParams}" />
						<g:sortableColumn property="zzzorden" title="${message(code: 'seguimiento.zzzorden.label', default: 'Orden')}" params="${filterParams}" />
						<g:sortableColumn property="asitio" title="${message(code: 'seguimiento.asitio.label', default: 'Sitio')}" params="${filterParams}" />
					
						<g:sortableColumn property="bservicio" title="${message(code: 'seguimiento.bservicio.label', default: 'Servicio')}" params="${filterParams}"/>
					
						<g:sortableColumn property="cso" title="${message(code: 'seguimiento.cso.label', default: 'CSO')}" params="${filterParams}"/>
					
						<g:sortableColumn property="epo" title="${message(code: 'seguimiento.epo.label', default: 'Po')}" params="${filterParams}"/>
					
						<g:sortableColumn property="zzusuario" title="${message(code: 'seguimiento.zzusuario.label', default: 'Usuario')}" />
					
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${seguimientoInstanceList}" status="i" var="seguimientoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						
                                          
                                              <td><g:link action="show" id="${seguimientoInstance.id}">${fieldValue(bean: seguimientoInstance, field: "id")}</g:link></td>
                                              <td><g:link controller="orden" action="show" id="${seguimientoInstance?.zzzorden?.id}">${fieldValue(bean: seguimientoInstance, field: "zzzorden")}</g:link></td>
					
						
					
						
						<td>${fieldValue(bean: seguimientoInstance, field: "asitio")}</td>
					
						<td>${fieldValue(bean: seguimientoInstance, field: "bservicio")}</td>
					
						<td>${fieldValue(bean: seguimientoInstance, field: "cso")}</td>
					
						<td>${fieldValue(bean: seguimientoInstance, field: "epo")}</td>
						<td>${fieldValue(bean: seguimientoInstance, field: "zzusuario")}</td>
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			    <div class="pagination">
              <g:paginate total="${seguimientoInstanceCount == null ? Seguimiento.count(): seguimientoInstanceCount}"
                            params="${filterParams}"/>
                <export:formats formats="['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']"  />
            </div>
                
       <filterpane:filterPane domain="servicios.Seguimiento" additionalProperties="identifier"
                           dialog="true"
                           title="Filtro"
                           titleKey="Filtro Avanzado"
                   excludeProperties="fdeliberycompleto,gdeliberyincompleto,hot,isurvey,jtierras,kcfe,lglt,mfuerza,oarnes,pdfo,qpasosCable,rdg,sbajadasFibra,tfijacion,uinterconexion,vempalme,wbdfo,xenergizacion,yaterrizaje,ztimbrado,zaapotencia,zbetiquetado,zcrcdt,zdconfiguracion,zeactsw,zfpuertos,zgcontroladora,zhsfp,zifo,zjbaterias,zkgabinete,zlreprogramacion,zncns,zoreporteFotografico,zprotocolo,zmcomentario"
                           associatedProperties="zzzorden.proyecto.nombre,zzzorden.central.nombre,zzzorden.sitio,zzzorden.usuario.username,zzzorden.status.nombre"
                            filterPropertyValues="${[fechaProgramada:[years:2020..2012,precision:'day'],fechaConclusion:[years:2020..2012,precision:'day']]}"
                            dialog="true"
                            visible="false"
                            showSortPanel="n"
                           showTitle="false"
                           fullAssociationPathFieldNames="false"/>
		</div>
	</body>
</html>
