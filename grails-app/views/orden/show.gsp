
<%@ page import="servicios.Orden" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orden.label', default: 'Orden')}" />
		<title><g:message code="default.show.label" args="[entityName]" />
                 </title>
                 <link rel="stylesheet" href="${resource(dir: 'css', file: 'main_1.css')}" type="text/css">
                
	</head>
	<body>
		<a href="#show-orden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="show-orden" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ordenes">
                          
                          
                                <g:if test="${ordenInstance?.id}">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="orden.id.label" default="Id" /></span>
					
						<span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${ordenInstance}" field="id"/></span>
					
				</li>
				</g:if>
                          
                                 <g:if test="${ordenInstance?.ticket}">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="orden.id.label" default="No. Ticket" /></span>
					
						<span class="property-value" aria-labelledby="ticket-label"><g:fieldValue bean="${ordenInstance}" field="ticket"/></span>
					
				</li>
				</g:if>
                          
                          
                           <g:if test="${ordenInstance?.proyecto}">
				<li class="fieldcontain">
					<span id="proyecto-label" class="property-label"><g:message code="orden.proyecto.label" default="Proyecto" /></span>
					
						<span class="property-value" aria-labelledby="proyecto-label"><g:link controller="proyecto" action="show" id="${ordenInstance?.proyecto?.id}">${ordenInstance?.proyecto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
                          
                           <g:if test="${ordenInstance?.central}">
				<li class="fieldcontain">
					<span id="central-label" class="property-label"><g:message code="orden.central.label" default="Zona & Central" /></span>
					
						<span class="property-value" aria-labelledby="central-label"><g:link controller="central" action="show" id="${ordenInstance?.central?.id}">${ordenInstance?.central?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
                          
                         <g:if test="${ordenInstance?.sitio}">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="orden.sitio.label" default="Sitio" /></span>
					
						<span class="property-value" aria-labelledby="sitio-label"><g:fieldValue bean="${ordenInstance}" field="sitio"/></span>
					
				</li>
				</g:if>
                          
                          
                           <g:if test="${ordenInstance?.cso}">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="orden.cso.label" default="CSO" /></span>
					
						<span class="property-value" aria-labelledby="cso-label"><g:fieldValue bean="${ordenInstance}" field="cso"/></span>
					
				</li>
				</g:if>
                          <g:if test="${ordenInstance?.po}">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="orden.po.label" default="PO" /></span>
					
						<span class="property-value" aria-labelledby="po-label"><g:fieldValue bean="${ordenInstance}" field="po"/></span>
					
				</li>
				</g:if>
                          
                                
                          
                          <g:if test="${ordenInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="orden.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${ordenInstance}" field="status"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${ordenInstance?.servicio}">
				<li class="fieldcontain">
					<span id="servicio-label" class="property-label"><g:message code="orden.servicio.label" default="Servicio" /></span>
					
						<span class="property-value" aria-labelledby="servicio-label"><g:link controller="TServicio" action="show" id="${ordenInstance?.servicio?.id}">${ordenInstance?.servicio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				
				
			
				<g:if test="${ordenInstance?.fechaConclusion}">
				<li class="fieldcontain">
					<span id="fechaConclusion-label" class="property-label"><g:message code="orden.fechaConclusion.label" default="Fecha Conclusion" /></span>
					
						<span class="property-value" aria-labelledby="fechaConclusion-label"><g:formatDate date="${ordenInstance?.fechaConclusion}" type="date" style="LONG"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.fechaProgramada}">
				<li class="fieldcontain">
					<span id="fechaProgramada-label" class="property-label"><g:message code="orden.fechaProgramada.label" default="Fecha Programada" /></span>
					
						<span class="property-value" aria-labelledby="fechaProgramada-label"><g:formatDate date="${ordenInstance?.fechaProgramada}" type="date" style="LONG"/></span>
					
				</li>
				</g:if>
                          
			
				<g:if test="${ordenInstance?.horaArribo}">
				<li class="fieldcontain">
					<span id="horaArribo-label" class="property-label"><g:message code="orden.horaArribo.label" default="Hora Arribo" /></span>
					
						<span class="property-value" aria-labelledby="horaArribo-label"><g:fieldValue bean="${ordenInstance}" field="horaArribo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.horaAtencion}">
				<li class="fieldcontain">
					<span id="horaAtencion-label" class="property-label"><g:message code="orden.horaAtencion.label" default="Hora Atencion" /></span>
					
						<span class="property-value" aria-labelledby="horaAtencion-label"><g:fieldValue bean="${ordenInstance}" field="horaAtencion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.horaSalida}">
				<li class="fieldcontain">
					<span id="horaSalida-label" class="property-label"><g:message code="orden.horaSalida.label" default="Hora Salida" /></span>
					
						<span class="property-value" aria-labelledby="horaSalida-label"><g:fieldValue bean="${ordenInstance}" field="horaSalida"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.ingeniero}">
				<li class="fieldcontain">
					<span id="ingeniero-label" class="property-label"><g:message code="orden.ingeniero.label" default="Ingeniero" /></span>
					
						<span class="property-value" aria-labelledby="ingeniero-label"><g:link controller="idc" action="show" id="${ordenInstance?.ingeniero?.id}">${ordenInstance?.ingeniero?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
                          <g:if test="${ordenInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="orden.dateCreated.label" default="Fecha de creación" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ordenInstance?.dateCreated}" type="datetime" style="LONG" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="orden.lastUpdated.label" default="Ultima Actualización" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${ordenInstance?.lastUpdated}" type="datetime" style="LONG" /></span>
					
				</li>
				</g:if>
                          
                          <g:if test="${ordenInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="ordenInstance.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="user" action="show" id="${ordenInstance?.usuario?.id}">${ordenInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				
                          
                          
			
			</ol>
             
 <%--                       
                       <g:if test="${ordenInstance?.observaciones}"> 
                         <center>       <table>
                                    <tbody>
                                      
                                      <tr>
                                        <td class="fieldcontain">
                                          <span id="observaciones-label" class="property-label"><g:message code="orden.observaciones.label" default="Observaciones" /></span>
                                        </td>
                                        <td>
                                        </td>
                                      </tr>
                                      <g:each in="${ordenInstance?.observaciones?}" var="i">
                                        <tr >
                                          <td></td>
                                          <td><g:link controller="observacion" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></td>
                                      </tr>
                                      </g:each>
                                    </tbody>
                                  
                                  </table></center>
                        </g:if>
                        
           --%>
           
                       <g:if test="${ordenInstance?.observaciones}"> 
                         <center>       <table>
                                    <tbody>
                                      
                                      <tr>
                                        <td class="fieldcontain">
                                          <span id="observaciones-label" class="property-label"><g:message code="orden.observaciones.label" default="Observaciones:" /></span>
                                        </td>
                                        <td>
                                        </td>
                                      </tr>
                                      <g:each in="${observacionesList}" var="i">
                                        
                                        <tr >
                                          
                                         
                                         <tr>  <td>${fieldValue(bean: i, field: "usuario")}:</td> <td> <p><g:link controller="observacion" action="show" id="${i.id}">${fieldValue(bean: i, field: "nombre")}</g:link></p><p> ${fieldValue(bean: i, field: "descripcion")}</p>   </td></tr>
                                      <tr><td></td><td align="left" ><g:formatDate date="${i.lastUpdated}" type="datetime" style="LONG"/></td></tr>
                                      </tr>
                                      </g:each>
                                    </tbody>
                                  
                                  </table></center>
                        </g:if> 
                        
                        
                        	<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ordenInstance?.id}" />
					<g:link class="edit" action="edit" id="${ordenInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                        <g:link controller="observacion" action="create" params="['orden.id': ordenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'observacion.label', default: 'Observacion')])}</g:link>
                                        <g:if test="${ordenInstance?.seguimiento}"> <g:link controller="seguimiento" action="edit" params="['zzzorden.id': ordenInstance?.id]">${message(code: 'default.edit.label', args: [message(code: 'observacion.label', default: 'Check List')])}</g:link></g:if>
                                        <g:else test="${ordenInstance?.seguimiento}">  <g:link controller="seguimiento" action="create" params="['zzzorden.id': ordenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'observacion.label', default: 'Check List')])}</g:link></g:else>
                                        
                                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SUPERVISOR"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></sec:ifAnyGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
