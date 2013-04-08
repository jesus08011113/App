<%@ page import="servicios.Orden" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orden.label', default: 'Orden')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                  <g:javascript library="jquery" plugin="jquery"/>
	</head>
	<body>
		<a href="#edit-orden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="edit-orden" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${ordenInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${ordenInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
                          <g:setProvider library="jquery"/>

                      <calendar:resources lang="es" theme="tiger"/>
				<g:hiddenField name="id" value="${ordenInstance?.id}" />
				<g:hiddenField name="version" value="${ordenInstance?.version}" />
                                
                                
                                 <table>
  <tr>
  <td>
      
      <label for="proyecto">
    <g:message code="orden.proyecto.label" default="Proyecto" />
   <span class="required-indicator">*</span> 
  </label>
      
  <g:select  name="proyecto.id" from="${servicios.Proyecto.list()}" optionKey="id" required=""
            noSelection="['':'Selecciona un proyecto']"
            
            value="${ordenInstance?.proyecto?.id}" class="many-to-one"/>
  
    </td>
  
  </tr>
</table>

<table>
  <tr>
     <g:if test="${ordenInstance?.central}">
   <td  class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'central', 'error')} required">

 <label for="central">
   <span class="required-indicator">*</span>
    <g:message code="orden.central.label" default="Central" />
    
     </label>
   
        <g:select id="sitio" name="central.id" from="${servicios.Central.list()}" optionKey="id"  noSelection="['':'Seleccione una central ']"
                  value="${ordenInstance?.central?.id}" class="many-to-one"/>
    
</td>
     </g:if>
   <g:if test="${ordenInstance?.servicio}">
<td  class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'servicio', 'error')} required">

 <label for="servicio">
   <span class="required-indicator">*</span>
        <g:message code="orden.servicio.label" default="Servicio"/>
       
    </label>
    
        <g:select id="servicio" name="servicio.id" from="${servicios.TServicio.list()}" optionKey="id" required="" noSelection="['':' ']"
                  value="${ordenInstance?.servicio?.id}" class="many-to-one"/>
   
   


</td>

   </g:if>
  </tr>
</table>

      
            
<table>
  <tr>

    <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'sitio', 'error')} required">
  <label for="sitio">
     <span class="required-indicator">*</span>
        <g:message code="orden.sitio.label" default="Sitio"/>
       
    </label>
       <g:textField name="sitio"  value="${ordenInstance?.sitio}" required="" size="50px"/>
    </td>
     <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'po', 'error')} required">
  <label for="po">
     <span class="required-indicator">*</span>
        <g:message code="orden.po.label" default="PO:"/>
       
    </label>
       <g:textField name="po"  value="${ordenInstance?.po}"  />
    </td>
  </tr>
  
 
  
</table>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'ticket', 'error')} ">
      <label for="ticket">
      
        <g:message code="orden.ticket.label" default="No.Ticket" />

      </label>
      <g:remoteField name="ticket"  value="${ordenInstance?.ticket}"
                     action="ticketdisp"
                     update="mensageticket" paramName="ticket"
                    
                     />
      <div id="mensageticket"></div>
    </td>
    
     <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'cso', 'error')} ">
       <label for="cso">
      <g:message code="orden.cso.label" default="Cso" />
      </label>
       <g:textField name="cso"  value="${ordenInstance?.cso}"/>
    </td>
     <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'status', 'error')} required">
       <label for="status">
        <span class="required-indicator">*</span>
        <g:message code="orden.status.label" default="Status" />

      </label>
           <g:select name="status" name="status.id" from="${servicios.Status.list()}" optionKey="id" required="" noSelection="['':'Selecciona un status']" value="${ordenInstance?.status?.id}" class="many-to-one"/>
    </td>
  </tr>
  
  
  
</table>

<table>
  
  <tr>
    <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'ingeniero', 'error')} required">
  <label for="ingeniero">
        <span class="required-indicator">*</span>
        <g:message code="orden.ingeniero.label" default="Ingeniero" />

      </label>
  <g:select id="ingeniero" name="ingeniero.id" from="${servicios.Idc.list(sort: 'nombre', order:'asc')}" optionKey="id" required="" noSelection="['':'Selecciona un ingeniero']" value="${ordenInstance?.ingeniero?.id}" class="many-to-one" />
</td>
  
  
  
 

</tr>

</table>


<div>
  <table >
    <tr>
      <td>
        <label for="fechaProgramada">
          <span class="required-indicator">*</span>
          <g:message code="orden.fechaProgramada.label" default="Fecha Programada" />

        </label>
      </td>
      <td>
        <label for="fechaConclusion">
          <span class="required-indicator">*</span>
          <g:message code="orden.fechaConclusion.label" default="Fecha Conclusion" />

        </label>
      </td>
    </tr>
    <tr>
      <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'fechaProgramada', 'error')} required">
   
    <calendar:datePicker name="fechaProgramada"  value="${ordenInstance?.fechaProgramada}"/>
    </td>
    <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'fechaConclusion', 'error')} required">
   
      <calendar:datePicker name="fechaConclusion"  value="${ordenInstance?.fechaConclusion}"/>
    </td>
    </tr>

  </table>
</div>

<table>
  <tr>
    <td>
      <label for="horaArribo">
        <span class="required-indicator">*</span>
        <g:message code="orden.horaArribo.label" default="Hora Programada" />

      </label>
    </td>
    <td>
      <label for="horaAtencion">
        <span class="required-indicator">*</span>
        <g:message code="orden.horaAtencion.label" default="Hora Atencion" />

      </label>
    </td>
    <td>
      <label for="horaSalida">
        <span class="required-indicator">*</span>
        <g:message code="orden.horaSalida.label" default="Hora Salida" />

      </label>
    </td>
  </tr>

  <tr>
    <td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'horaArribo', 'error')} required">
  <joda:timePicker name="horaArribo" value="${ordenInstance?.horaArribo}" precision="minute" default="none" noSelection="['':'']"/>
</td>
<td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'horaAtencion', 'error')} required">
<joda:timePicker name="horaAtencion" value="${ordenInstance?.horaAtencion}" precision="minute" default="none" noSelection="['':'']"/>
</td>
<td class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'horaSalida', 'error')} required">
<joda:timePicker name="horaSalida" value="${ordenInstance?.horaSalida}" precision="minute" default="none" noSelection="['':'']"/>
</td>
</tr>



</table>

</div>

<div class="fieldcontain ${hasErrors(bean: encuesta1Instance, field: 'usuario', 'error')} required">
	
	<g:hiddenField id="usuario" name="usuario.id" from="${servicios.User.list()}" optionKey="id" required="" value="${ordenInstance?.usuario?.id}" class="many-to-one"/>
</div>
        
   
    
				

                                  
                                <center>
                               
                                  <table>
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
                                  
                                  </table>
                                </center>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link controller="observacion" action="create" params="['orden.id': ordenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'observacion.label', default: 'Observacion')])}</g:link>
                                        <sec:ifAllGranted roles="ROLE_ADMIN,ROLE_SUPERVISOR">      <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></sec:ifAllGranted>
                                        
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
