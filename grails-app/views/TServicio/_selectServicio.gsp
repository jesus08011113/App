
<td  >

 <label for="servicio">
   <span class="required-indicator">*</span>
        <g:message code="orden.servicio.label" default="Servicio"/>
       
    </label>
    <g:if test="${serviciosList}">
        <g:select  name="serviciolo.id" from="${serviciosList}" optionKey="servicio" required="" noSelection="['':' ']"
                  onchange="${remoteFunction (
controller: 'TServicio',
action: 'buscaServicio',
params: '\'servicio=\' + this.value',
update: 'sDiv'
)}"
                  
                  
                 />
    </g:if>
    <g:else>
        No existen servicios para este proyecto
    </g:else>


</td>