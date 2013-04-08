<%@ page import="servicios.Idc" %>


<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: idcInstance, field: 'nombre', 'error')} required">
      <label for="nombre">
		<g:message code="idc.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td>
      <label for="paterno">
		<g:message code="idc.paterno.label" default="Paterno" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td>
      <label for="materno">
		<g:message code="idc.materno.label" default="Materno" />
		<span class="required-indicator">*</span>
	</label>
    </td>
  </tr>
  <tr>
    <td>
      <g:textField name="nombre" required="" value="${idcInstance?.nombre}"/>
    </td>
    
    <td>
      <g:textField name="paterno" required="" value="${idcInstance?.paterno}"/>
    </td>
    
    <td>
      <g:textField name="materno" required="" value="${idcInstance?.materno}"/>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: idcInstance, field: 'direccion1', 'error')} required">
      <label for="direccion1">
		<g:message code="idc.direccion1.label" default="Direccion1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion1" required="" value="${idcInstance?.direccion1}" size="60px"/>
    </td>
        </tr>
        <tr>
    <td class="fieldcontain ${hasErrors(bean: idcInstance, field: 'direccion2', 'error')} required">
      <label for="direccion2">
		<g:message code="idc.direccion2.label" default="Direccion2" />
		
	</label>
	<g:textField name="direccion2" value="${idcInstance?.direccion2}" size="60px"/>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td>
      <label for="telefono">
		<g:message code="idc.telefono.label" default="Telefono" />
		
	</label>
    </td>
    
    <td>
      <label for="telefono2">
		<g:message code="idc.telefono2.label" default="Telefono2" />
		
	</label>
    </td>
    
    <td>
      <label for="celular">
		<g:message code="idc.celular.label" default="Celular" />
		
	</label>
    </td>
    
    <td>
      <label for="email">
		<g:message code="idc.email.label" default="Email" />
		
	</label>
    </td>
    
    
    
  </tr>
  <tr>
    <td>
      <g:textField name="telefono" maxlength="10" pattern="${idcInstance.constraints.telefono.matches}" value="${idcInstance?.telefono}"/>
    </td>
    
    <td>
      <g:textField name="telefono2" value="${idcInstance?.telefono2}"/>
    </td>
    
    <td>
      <g:textField name="celular" maxlength="10" pattern="${idcInstance.constraints.celular.matches}" value="${idcInstance?.celular}"/>
    </td>
    
    <td>
      <g:field type="email" name="email" value="${idcInstance?.email}"/>
    </td>
    
        
  </tr>
</table>


<table>
  <tr>
    <td>
      <label for="provedor">
		<g:message code="idc.provedor.label" default="Provedor" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td>
      <label for="puesto">
		<g:message code="idc.puesto.label" default="Puesto" />
		
	</label>
    </td>
    <td>
      <label for="estatus">
		<g:message code="idc.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td>
      <label for="tipo">
		<g:message code="idc.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
    </td>
  </tr>
  <tr>
    <td>
      <g:select id="provedor" name="provedor.id" from="${servicios.Provedores.list()}" optionKey="id" required="" value="${idcInstance?.provedor?.id}" class="many-to-one"/>
    </td>
    <td>
      <g:textField name="puesto" value="${idcInstance?.puesto}"/>
    </td>
    <td>
      <g:select name="estatus" from="${idcInstance.constraints.estatus.inList}" required="" value="${idcInstance?.estatus}" valueMessagePrefix="idc.estatus"/>
    </td>
    <td>
      <g:select name="tipo" from="${idcInstance.constraints.tipo.inList}" required="" value="${idcInstance?.tipo}" noSelection="['':' ']" valueMessagePrefix="idc.tipo"/>
    </td>
  </tr>
  
</table>
<table>
  <tr>
    <td>
      <label for="curp">
		<g:message code="idc.curp.label" default="Curp" />
		
	</label>
    </td>
    <td>
      <label for="rfc">
		<g:message code="idc.rfc.label" default="Rfc" />
		
	</label>
    </td>
   
    <td>
       <label for="nss">
		<g:message code="idc.nss.label" default="No. Seguro Social" />
		
	</label>
    </td>
  </tr>
  <tr>
    <td>
      <g:textField name="curp" value="${idcInstance?.curp}"/>
    </td>
    <td>
      <g:textField name="rfc" value="${idcInstance?.rfc}"/>
    </td>
    <td>
      	<g:textField name="nss" value="${idcInstance?.nss}"/>
    </td>
  </tr>
  
</table>

