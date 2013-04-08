<%@ page import="servicios.Cliente" %>

<g:form url="[action:'save',controller:'cliente']" >
  
		      
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
		      
				<fieldset class="buttons">
                                     <g:render template="botonesDinamicos"/>
                                </fieldset>
		

  </g:form>

