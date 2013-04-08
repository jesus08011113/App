
<%@ page import="servicios.Cliente" %>


			<table>
				<thead>
					<tr>
                                          <th>  </th>
					
                                          <th property="nombre" >Nombre </th>
                                          <th property="direccion" >Domicilio </th>
					
                                          <th property="servicios"> Servicios</th>
					
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td> <modalbox:createLink controller="os" action="launchLightbox" width="1000" linkname="+" title="Alta de Orden de Servicio del cliente ${clienteInstance?.nombre} " id="${clienteInstance.id}" /></td>
						<td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "nombre")}</g:link> </td>
						<td>${fieldValue(bean: clienteInstance, field: "domicilio")}</td>
                                               
					
						<td >
                                                  <g:if test="${clienteInstance?.servicios}">
                                                    <table>
                                                      <tbody>
                                                    <g:each in="${clienteInstance.servicios}" var="s">
                                                         <tr>
                                                 
                                                            <td>
                                                    <g:link controller="os" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link>
                                                            </td>
                                                        </tr>
                                                    </td>
                                                    </g:each>
                                                      </tbody>
                                                    </table>
                                                  </g:if>
                                                
                                                </td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clienteInstanceTotal}" />
			</div>
		
