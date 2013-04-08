<%@ page import="servicios.Orden" %>

<g:setProvider library="jquery"/>

<calendar:resources lang="es" theme="tiger"/>
<%--
<table>

  <tr>
    
    <td >
      
      <label for="central">
    <g:message code="orden.central.label" default="Central" />
    <span class="required-indicator">*</span>
  </label>
      
  <g:select id="central" name="central.id" from="${servicios.Central.list()}" optionKey="id" required=""
            noSelection="['':'Selecciona una central']"
            onchange="${remoteFunction (
controller: 'sitio',
action: 'getSitios',
params: '\'id=\' + this.value',
update: 'sitioDiv'
)}"
            value="${ordenInstance?.central?.id}" class="many-to-one"/>
  
    </td>
    <td id="sitioDiv" class="fieldcontain ${hasErrors(bean: personaInstance, field: 'sitio', 'error')} required">
      <g:if test="${ordenInstance.sitio}">
    <g:include controller="sitio" action="getSitios" id="${ordenInstance.sitio.central.id}"/>
  </g:if>
    </td>
 
    

  </tr>


 

</table>
 --%>   
<table>
  <tr>
  <td>
  <sec:ifAnyGranted roles="ROLE_USER,ROLE_SUPERVISOR">    
      <label for="proyecto">
    <g:message code="orden.proyecto.label" default="Proyecto" />
   <span class="required-indicator">*</span> 
  </label>
      
  <g:select  name="proyecto.id" from="${proyecto}" optionKey="id" required=""
            noSelection="['':'Selecciona un proyecto']"
            onchange="${remoteFunction (
controller: 'TServicio',
action: 'getServicios',
params: '\'id=\' + this.value',
update: 'servicioDiv'
)}"
            value="${ordenInstance?.proyecto?.id}" class="many-to-one"/>
   </sec:ifAnyGranted >
  
  <sec:ifAllGranted roles="ROLE_ADMIN">    
      <label for="proyecto">
    <g:message code="orden.proyecto.label" default="Proyecto" />
   <span class="required-indicator">*</span> 
  </label>
      
  <g:select  name="proyecto.id" from="${servicios.Proyecto.list()}" optionKey="id" required=""
            noSelection="['':'Selecciona un proyecto']"
            onchange="${remoteFunction (
controller: 'TServicio',
action: 'getServicios',
params: '\'id=\' + this.value',
update: 'servicioDiv'
)}"
            value="${ordenInstance?.proyecto?.id}" class="many-to-one"/>
   </sec:ifAllGranted>
   
    </td>
  
  </tr>
</table>




<table>
  <tr>
     
  <table id="servicioDiv">
      <g:if test="${ordenInstance.servicio}">
    <g:include controller="TServicio" action="getServicios" />
  </g:if>
  </table>
  </tr>
</table>

   <div id="cDiv">
      <g:if test="${ordenInstance.central}">
    <g:include controller="central" action="buscaCentral" />
  </g:if>
  </div>
<div id="sDiv">
      <g:if test="${ordenInstance.servicio}">
    <g:include controller="TServicio" action="buscaServicio" />
  </g:if>
  </div>  
            
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
           <g:select name="status" name="status.id" from="${statusLista}" optionKey="id" required="" noSelection="['':'Selecciona un status']" value="${ordenInstance?.status?.id}" class="many-to-one"/>
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
  <g:select id="ingeniero" name="ingeniero.id" from="${idcActivos}" optionKey="id" required="" noSelection="['':'Selecciona un ingeniero']" value="${ordenInstance?.ingeniero?.id}" class="many-to-one" />
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


