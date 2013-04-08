<td  >

 <label for="central">
   <span class="required-indicator">*</span>
    <g:message code="orden.central.label" default="Central" />
    
     </label>
    <g:if test="${centralesList}">
        <g:select  name="centralo.id" from="${centralesList}" optionKey="central" required="" noSelection="['':'Selecciona una central']"
                 onchange="${remoteFunction (
controller: 'central',
action: 'buscaCentral',
params: '\'central=\' + this.value',
update: 'cDiv'
)}"
                         
                  />
        
        
        
    </g:if>
    <g:else>
        No existen centrales para este proyecto
    </g:else>
</td>



   
 