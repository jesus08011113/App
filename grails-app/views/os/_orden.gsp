<%@ page import="servicios.Os" %>


<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                         <center><h4>ORDEN DE SERVICIO NO. ${osInstance?.ticket+48}</h4></centar>
                        <table>
                           <g:if test="${osInstance?.status}">
                          <tr >
                           
                            <td class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="os.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="status" action="show" id="${osInstance?.status?.id}">${osInstance?.status?.encodeAsHTML()}</g:link></span>
					
				
				</td>
                          </tr>
                          </g:if>
                          <tr>
                            <td>
                              <table>
                                <tr collspan ="2"> Datos del Cliente</tr>
                                <tr>
                                  <td class="fieldcontain">
                                    <span id="cliente-label" class="property-label"><g:message code="os.cliente.label" default="Cliente:" /></span>
                                  </td>
                                  <td>
                                    					<span class="property-value" aria-labelledby="cliente-label"><modalbox:createLink controller="cliente" action="launchbox" width="1000" linkname="${osInstance?.cliente?.encodeAsHTML()}" title="Modificar Cliente" id="${clienteDatos.id}" params="[osInstance : osInstance.id]" /></span>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="fieldcontain">
                                     <span id="clienteDireccion-label" class="property-label"><g:message code="os.clienteDomicilio.label" default="Domicilio:" /></span>
                                  </td>
                                  <td>
                                    <span class="property-value" aria-labelledby="clienteDomicilio-label">${clienteDatos.domicilio.encodeAsHTML()}</span>
                                  </td>
                                </tr>
                                <g:if test="${clienteDatos?.telefono}">
                                <tr>
                                  <td class="fieldcontain">
                                     <span id="clienteTelefono-label" class="property-label"><g:message code="os.clienteTelefono.label" default="Telefono:" /></span>
                                  </td>
                                  <td>
                                    <span class="property-value" aria-labelledby="clienteTelefono-label">${clienteDatos.telefono.encodeAsHTML()}</span>
                                  </td>
                                </tr>
                                	</g:if>
                                
                                <g:if test="${clienteDatos?.movil}">
                                <tr>
                                  <td class="fieldcontain">
                                     <span id="clienteMovil-label" class="property-label"><g:message code="os.clienteMovil.label" default="Celular:" /></span>
                                  </td>
                                  <td>
                                    <span class="property-value" aria-labelledby="clienteCelular-label">${clienteDatos.movil.encodeAsHTML()}</span>
                                  </td>
                                </tr>
                                	</g:if>
                                
                                <g:if test="${clienteDatos?.email}">
                                <tr>
                                  <td class="fieldcontain">
                                     <span id="clienteMovil-label" class="property-label"><g:message code="os.clienteEmail.label" default="Email:" /></span>
                                  </td>
                                  <td>
                                    <span class="property-value" aria-labelledby="clienteEmail-label">${clienteDatos.email.encodeAsHTML()}</span>
                                  </td>
                                </tr>
                                	</g:if>
                              
                              </table>
                              
                            </td>
                            <td>
                              <table >
                                  <tr collspan ="2"> Datos del Equipo</tr>
                               <g:if test="${osInstance?.tipo}"> 
                                <tr >
                                  <td class="fieldcontain">
                                    <span id="tipo-label" class="property-label"><g:message code="os.tipo.label" default="Tipo:" /></span>
                                  </td>
                                  <td>
                                    <span class="property-value" aria-labelledby="tipo-label">${osInstance?.tipo?.encodeAsHTML()}</span>
                                  </td>
                                </tr>
                               </g:if>
                                
                               <g:if test="${osInstance?.otroTipo}"> 
                                <tr >
                                  <td class="fieldcontain">
                                    <span id="tipo-label" class="property-label"><g:message code="os.tipo.label" default="Tipo:" /></span>
                                  </td>
                                  <td>
                                  	<span class="property-value" aria-labelledby="otroTipo-label"><g:fieldValue bean="${osInstance}" field="otroTipo"/></span>
                                  </td>
                                </tr>
                               </g:if>
                                
                               
                                
                           <g:if test="${osInstance?.marca}">
                                <tr >
                                  <td class="fieldcontain">
                                    <span id="tipo-label" class="property-label"><g:message code="os.marca.label" default="Marca:" /></span>
                                  </td>
                                  <td>
                                  	<span class="property-value" aria-labelledby="marca-label"><g:fieldValue bean="${osInstance}" field="marca"/></span>
                                  </td>
                                </tr>
                               </g:if>
                                
                           <g:if test="${osInstance?.modelo}">
                                <tr >
                                  <td class="fieldcontain">
                                    <span id="tipo-label" class="property-label"><g:message code="os.marca.label" default="Modelo:" /></span>
                                  </td>
                                  <td>
                                  	<span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${osInstance}" field="modelo"/></span>
                                  </td>
                                </tr>
                               </g:if>
                                
                               
                                
                           <g:if test="${osInstance?.ns}">
                                <tr >
                                  <td class="fieldcontain">
                                    <span id="tipo-label" class="property-label"><g:message code="os.ns.label" default="N/S:" /></span>
                                  </td>
                                  <td>
                                  	<span class="property-value" aria-labelledby="ns-label"><g:fieldValue bean="${osInstance}" field="ns"/></span>
                                  </td>
                                </tr>
                               </g:if>
                                
                               
                                
                              </table>
                            </td>
                          </tr>
                          <tr>
                          <table>
                            <g:if test="${osInstance?.acesorios}">
                            <tr>
                              <td class="fieldcontain">
                                <span id="acesorios-label" class="property-label"><g:message code="os.acesorios.label" default="Acesorios:" /></span>
                              </td>
                              
                              <td>
                                	<span class="property-value" aria-labelledby="acesorios-label"><g:fieldValue bean="${osInstance}" field="acesorios"/></span>
                              </td>
                            </tr>
                            </g:if>
                          <g:if test="${osInstance?.descripcion}">
                            <tr>
                              <td class="fieldcontain">
                                	<span id="descripcion-label" class="property-label"><g:message code="os.descripcion.label" default="Descripcion del equipo y fallos:" /></span>
                              </td>
                              <td>
                                	<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${osInstance}" field="descripcion"/></span>
                              </td>
                            </tr>
                          </g:if>
                            
                             <g:if test="${osInstance?.fallas}">
                            <tr>
                              <td class="fieldcontain">
                                	<span id="descripcion-label" class="property-label"><g:message code="os.fallas.label" default="Reporte de Fallas:" /></span>
                              </td>
                              <td>
                                	<span class="property-value" aria-labelledby="fallas-label"><g:fieldValue bean="${osInstance}" field="fallas"/></span>
                              </td>
                            </tr>
                          </g:if>
                            
                         
                            
                          </table>
                          <table>
                            <tr>
                            
                              <td class="fieldcontain">
                                <span id="recibe-label" class="property-label"><g:message code="os.recibe.label" default="Recibe el equipo:" /></span>
                                <span class="property-value" aria-labelledby="recibe-label"><g:link controller="idc" action="show" id="${osInstance?.recibe?.id}">${osInstance?.recibe?.encodeAsHTML()}</g:link></span>
                              </td>
                              
                              <td class="fieldcontain">
                                <span id="ingeniero-label" class="property-label"><g:message code="os.ingeniero.label" default="Ingeniero Asignado:" /></span>
					
						<span class="property-value" aria-labelledby="ingeniero-label"><g:link controller="idc" action="show" id="${osInstance?.ingeniero?.id}">${osInstance?.ingeniero?.encodeAsHTML()}</g:link></span>
					
                              </td>
                             <g:if test="${osInstance?.entrega}"> 
                              <td class="fieldcontain">
                                <span id="entrega-label" class="property-label"><g:message code="os.entrega.label" default="Entrega" /></span>
					
						<span class="property-value" aria-labelledby="entrega-label"><g:link controller="idc" action="show" id="${osInstance?.entrega?.id}">${osInstance?.entrega?.encodeAsHTML()}</g:link></span>
					
                              </td>
                             </g:if>
                            </tr>
                          </table>
                          
                          </tr>
                          <tr>
                               <g:if test="${osInstance?.salida}">
                              <td>
                                <span  class="property-label"><g:message code="os.descripcion.label" default="El servicio requirió ser visitado por lo que se ha añadido un monto adicional  de \$120 por concepto de visita" /> </span>
                              </td>
                            </g:if>
                          </tr>
                          <g:if test="${osInstance?.recomendaciones}">
				<tr class="fieldcontain">
					<span id="recomendaciones-label" class="property-label"><g:message code="os.recomendaciones.label" default="Recomendaciones" /></span>
					
						<span class="property-value" aria-labelledby="recomendaciones-label"><g:fieldValue bean="${osInstance}" field="recomendaciones"/></span>
					
				</tr>
				</g:if>
                        </table>
                         
                         <table>
                           <tr>
                             <td>
                               <span id="dateCreated-label" class="property-label"><g:message code="os.dateCreated.label" default="Fecha de Recepción:" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${osInstance?.dateCreated}" type="datetime" style="LONG"/></span>
					
                             </td>
                             <g:if test="${osInstance?.fechaEntrega}">
                             <td>
                               <span id="fechaEntrega-label" class="property-label"><g:message code="os.fechaEntrega.label" default="Fecha de Entrega:" /></span>
					
						<span class="property-value" aria-labelledby="fechaEntrega-label"><g:formatDate date="${osInstance?.fechaEntrega}" type="datetime" style="MEDIUM"/>  </span>
					
                             </td>
                             </g:if>
                           </tr>
                         </table>
                         
                       <g:if test="${osInstance?.observaciones}"> 
                          <center>       <table>
                                    <tbody>
                                      
                                      <tr>
                                        <td class="fieldcontain">
                                          <span id="observaciones-label" class="property-label"><g:message code="os.observaciones.label" default="Observaciones:" /></span>
                                        </td>
                                        <td>
                                        </td>
                                      </tr>
                                      <g:each in="${osInstance?.observaciones}" var="i">
                                        
                                        <tr >
                                          
                                         
                                         <tr>
                                           <td>${fieldValue(bean: i, field: "tipo")}:</td>
                                           <td> <p><g:link controller="observacionesOS" action="show" id="${i.id}">${fieldValue(bean: i, field: "nombre")}</g:link></p><p> ${fieldValue(bean: i, field: "descripcion")}</p>   </td>
                                      </tr>
                                      <tr><td></td><td align="left" ><g:formatDate date="${i.lastUpdated}" type="datetime" style="LONG"/></td></tr>
                                      </tr>
                                      </g:each>
                                    </tbody>
                                  
                                  </table></center>
                         
                       </g:if>
                         
                         
                         
                     <g:if test="${osInstance?.acciones}">    
                         <table>
                           <tr>
                             <td>
                               <span id="acciones-label" class="property-label"><g:message code="os.acciones.label" default="Acciones Tomadas:" /></span>
                             </td>
                           </tr>
                           
                           <tr>
                             <td>
                               <g:each in="${osInstance.acciones}" var="i">
                                 <tr>	 <td> <p><g:link controller="observacionesOS" action="show" id="${i.id}">${fieldValue(bean: i, field: "nombre")}</g:link></p><p> ${fieldValue(bean: i, field: "descripcion")}</p>     </td>
                               <td><p>$ ${fieldValue(bean: i, field: "precio")}</p></td>
                               </tr>
                               
                              </g:each>
                           <tr>
                             <td>
                               Total:
                             </td>
                             <td>
                               <p>$ ${osInstance.acciones.precio.sum()}</p>
                             </td>
                           
                           </tr>
                             </td>
                           </tr>
                         </table>
                     </g:if>    
			<ol class="property-list os">
			
				
			
			
				
			
				
				<g:if test="${osInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="os.lastUpdated.label" default="Ultima Actualización" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${osInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				
			
			</ol>