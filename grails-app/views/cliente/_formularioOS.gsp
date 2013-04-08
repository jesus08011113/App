<%@ page import="servicios.Os" %>

<g:form url="[action:'save',controller:'os']" >
  
		      
				<fieldset class="form">
					<g:render template="/os/form"/>
				</fieldset>
		      
				<fieldset class="buttons">
                                     <g:render template="botones"/>
                                </fieldset>
		

  </g:form>

