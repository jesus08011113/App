<%@ page import="servicios.Cliente" %>


  <center>
    <table>
      <tr>
        <td class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required" >
          
            <label for="nombre">
              <span class="required-indicator">*</span>
		<g:message code="cliente.nombre.label" default="Nombre"  />
		
	</label>
           <g:textField name="nombre" required="" value="${clienteInstance?.nombre}" size="35px"/>
        </td>
      </tr>
      
      <tr>
        <td class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'domicilio', 'error')} required">
          <label for="domicilio">
            <span class="required-indicator">*</span>
		<g:message code="cliente.domicilio.label" default="Domicilio" />
		
	</label>
	<g:textField name="domicilio" required="" value="${clienteInstance?.domicilio}"size="50px"/>
       
        </td>
      </tr>
    </table>
    
    <table>
      <tr>
        <td class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefono', 'error')} ">
          <label for="telefono">
		<g:message code="cliente.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="10" pattern="${clienteInstance.constraints.telefono.matches}" value="${clienteInstance?.telefono}"/>
        </td>
        
        <td class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'movil', 'error')} ">
          <label for="movil">
		<g:message code="cliente.movil.label" default="Movil" />
		
	</label>
	<g:textField name="movil" maxlength="10" pattern="${clienteInstance.constraints.movil.matches}" value="${clienteInstance?.movil}"/>
        </td>
        
        <td class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
          <label for="email">
		<g:message code="cliente.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${clienteInstance?.email}"/>
        </td>
      </tr>
    </table>
    
    
  </center>


<g:if test="${clienteInstance?.servicios}">
<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'servicios', 'error')} ">
	<label for="servicios">
		<g:message code="cliente.servicios.label" default="Servicios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${clienteInstance?.servicios?}" var="s">
    <li><g:link controller="os" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
  </g:if>
</ul>

</div>


