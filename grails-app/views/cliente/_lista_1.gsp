
<%@ page import="servicios.Cliente" %>

<div class="fieldcontain ${hasErrors(bean: osInstance, field: 'recomendaciones', 'error')} ">
	<label for="recomendaciones">
		<g:message code="os.recomendaciones.label" default="Recomendaciones" />
		
	</label>
	<g:textField name="recomendaciones" value="${osInstance?.recomendaciones}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: osInstance, field: 'acciones', 'error')} ">
	<label for="acciones">
		<g:message code="os.acciones.label" default="Acciones" />
		
	</label>
	<g:select name="acciones" from="${servicios.Acciones.list()}" multiple="multiple" optionKey="id" size="5" value="${osInstance?.acciones*.id}" class="many-to-many"/>
</div>
<td class="fieldcontain ${hasErrors(bean: osInstance, field: 'entrega', 'error')} required">
        <label for="entrega">
		<g:message code="os.entrega.label" default="Entrega" />
		<span class="required-indicator">*</span>
	</label>
      </td>

<td>
        <g:select id="entrega" name="entrega.id" from="${servicios.Idc.list()}" optionKey="id" required="" value="${osInstance?.entrega?.id}" class="many-to-one"/>
      </td>
      
      
        <table>
     <tr>
    <td class="fieldcontain ${hasErrors(bean: osInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
          <span class="required-indicator">*</span>
      	<g:message code="os.ticket.label" default="Ticket" />
		
	</label>
	<g:field name="ticket" value="${fieldValue(bean: osInstance, field: 'ticket')}" required=""/>
    </td>
    </tr>
  </table>