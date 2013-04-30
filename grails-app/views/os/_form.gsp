<%@ page import="servicios.Os" %>
<g:setProvider library="jquery"/>

<calendar:resources lang="es" theme="tiger"/>

<center>
  <p>Orden de Servicio No. ${osInstance?.ticket}</p>
  <table>
   
    <tr>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'tipo', 'error')} ">
        <label for="tipo">
        
		<g:message code="os.tipo.label" default="Tipo:" />
		
	</label>
      </td>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'otroTipo', 'error')} ">
        <label for="otroTipo">
		<g:message code="os.otroTipo.label" default="Otro Tipo" />
		
	</label>      
      </td>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'marca', 'error')} ">
        <label for="marca">
		<g:message code="os.marca.label" default="Marca" />
		
	</label>
      </td>
      <td  class="fieldcontain ${hasErrors(bean: osInstance, field: 'modelo', 'error')} ">
        <label for="modelo">
		<g:message code="os.modelo.label" default="Modelo" />
		
	</label>
      </td>
    </tr>
    <tr>
      <td>
        <g:select id="tipo" name="tipo.id" from="${servicios.Equipos.list()}" optionKey="id"  value="${osInstance?.tipo?.id}" class="many-to-one"  noSelection="['':' ']"/>
      </td>
      <td>
        <g:textField name="otroTipo" value="${osInstance?.otroTipo}"/>
      </td>
      <td>
        <g:textField name="marca" value="${osInstance?.marca}"/>
      </td>
      <td>
        <g:textField name="modelo" value="${osInstance?.modelo}"/>
      </td>
    </tr>
    
  </table>
  
  <table>
    <tr>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'ns', 'error')} ">
        <label for="ns">
		<g:message code="os.ns.label" default="No. Serie" />
		
	</label>
	<g:textField name="ns" value="${osInstance?.ns}" size="40px"/>
      </td>
      
    </tr>
    
    <tr>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'descripcion', 'error')} ">
        
       <label for="descripcion">
		<g:message code="os.descripcion.label" default="Descripcion de Equipo y Fallas" />
		
	</label>
      </td>
       
    </tr>
    <tr>
      <td>
          <g:textArea name="descripcion" value="${osInstance?.descripcion}"  rows="5" cols="40"/>
      </td>
       
    </tr>
    <tr>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'acesorios', 'error')} ">
         <label for="acesorios">
		<g:message code="os.acesorios.label" default="Accesorios" />
		
	</label>
      </td>
    </tr>
    <tr>
      <td >
         <g:textArea name="acesorios" value="${osInstance?.acesorios}"/>
      </td>
    </tr>
    
  </table> 
  
  <table>
    <tr>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'status', 'error')} required">
        	<label for="status">
                  <span class="required-indicator">*</span>
		<g:message code="os.status.label" default="Status" />
		
	</label>
	<g:select id="status" name="status.id" from="${statusLista}" optionKey="id"  value="${osInstance?.status?.id}" class="many-to-one"  noSelection="['':' ']"/>

      </td>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'salida', 'error')} " size ="20px">
        <label for="salida" >
		<g:message code="os.salida.label" default="Visita en el Area" />
		
	</label>
      </td>
      <td>
	<g:checkBox name="salida" value="${osInstance?.salida}" />
      </td>
    </tr>
</table>
  <table>
    <tr>
      
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'fechaEntrega', 'error')} required">
        <label for="fechaEntrega">
		<g:message code="os.fechaEntrega.label" default="Fecha sugerida de Entrega" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaEntrega" precision="hour"   years="[2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]" value="${osInstance?.fechaEntrega}" default="none" noSelection="['':'']" />
      </td>
    </tr>
      
  </table>
  <table>
    <tr>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'recibe', 'error')} required">
        <label for="recibe">
		<g:message code="os.recibe.label" default="Recibe" />
		<span class="required-indicator">*</span>
	</label>
      </td>
      <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'ingeniero', 'error')} required">
        <label for="ingeniero">
		<g:message code="os.ingeniero.label" default="Ingeniero" />
		<span class="required-indicator">*</span>
	</label>
      </td>
      
    </tr>
    <tr>
      <td>
        <g:select id="recibe" name="recibe.id" from="${ingenierosLista}" optionKey="id" required="" value="${osInstance?.recibe?.id}" class="many-to-one"  noSelection="['':' ']"/>
      </td>
      <td>
        <g:select id="ingeniero" name="ingeniero.id" from="${ingenierosLista}" optionKey="id" required="" value="${osInstance?.ingeniero?.id}" class="many-to-one"  noSelection="['':'Ingeniero a cargo']"/>
      </td>
      
    </tr>
  </table>
</center>






	<g:hiddenField id="cliente" name="cliente.id" from="${servicios.Cliente.list()}" optionKey="id" required="" value="${osInstance?.cliente?.id}" class="many-to-one"/>
	<g:hiddenField id="ticket" name="ticket"  value="${osInstance?.ticket}" />



