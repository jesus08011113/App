<%@ page import="servicios.Acciones" %>


<g:form url="[action:'save',controller:'acciones']" >
  
				<fieldset class="form">
					<g:render template="anticipo"/>
				</fieldset>
                          
				<fieldset class="buttons">
                                     <g:render template="botonesDinamicos"/>
                                </fieldset>
		

  </g:form>