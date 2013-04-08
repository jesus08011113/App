package servicios

import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.filterpane.FilterPaneUtils
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class ObservacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    

    def index() {
        redirect(action: "list", params: params)
    }
def springSecurityService
    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        def observacionInstanceList = null
         def observacionInstanceTotal = null
      
        def usuario = User.findByUsername(springSecurityService.currentUser.username)//Obtiene el usuario logeado y lo busca en la bd r
           def roles = springSecurityService.getPrincipal().getAuthorities()
                 if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {  
           
                      def proyectos = UsuarioProyecto.findAllByUsuario(usuario)
                      def enrol = proyectos.proyecto
                      def ordenes = Orden.findAllByProyectoInList(enrol) 
                  
                      def observaciones = Observacion.findAllByOrdenInList(ordenes,[max: params.max, sort: "id", order: "desc", offset: params.offset])
                      def observacionesTotal = Observacion.findAllByOrdenInList(ordenes).size()
                      observacionInstanceList = observaciones
                      observacionInstanceTotal = observacionesTotal
            
            
                 }
                  else {
               
               observacionInstanceList = Observacion.list(params)
               observacionInstanceTotal = Observacion.count() 
               
           } 
        
        
        [observacionInstanceList: observacionInstanceList, observacionInstanceTotal: observacionInstanceTotal]
    }

  def filterPaneService

    def filter = {
        if(!params.max) params.max = 25
        render( view:'list',
                model:[ observacionInstanceList: filterPaneService.filter( params, Observacion ),
                        observacionInstanceCount: filterPaneService.count( params, Observacion ),
                        filterParams: org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params),
                        params:params ] )
   
    }
    
    
   
     def create() {
       
        def usuario = User.findByUsername(springSecurityService.currentUser.username)//Obtiene el usuario logeado y lo busca en la bd 
        //Procedimiento Create   
        def observacionInstance = new Observacion()
        observacionInstance.properties = params
        observacionInstance.usuario = usuario
       
        [observacionInstance: observacionInstance]
    }

    def save() {
        def observacionInstance = new Observacion(params)
        if (!observacionInstance.save(flush: true)) {
            render(view: "create", model: [observacionInstance: observacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'observacion.label', default: 'Observacion'), observacionInstance.id])
        redirect(controller:"orden", action: "show", id: observacionInstance.orden.id)
      //  redirect(controller:"observacion", action: "create", params:['orden.id': ordenInstance?.id])  observacionInstance?.orden?.id
    }

    def show(Long id) {
        def observacionInstance = Observacion.get(id)
        if (!observacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "list")
            return
        }

        [observacionInstance: observacionInstance]
    }

    def edit(Long id) {
        def observacionInstance = Observacion.get(id)
        if (!observacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "list")
            return
        }

        [observacionInstance: observacionInstance]
    }

    def update(Long id, Long version) {
        def observacionInstance = Observacion.get(id)
        if (!observacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (observacionInstance.version > version) {
                observacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'observacion.label', default: 'Observacion')] as Object[],
                          "Another user has updated this Observacion while you were editing")
                render(view: "edit", model: [observacionInstance: observacionInstance])
                return
            }
        }

        observacionInstance.properties = params

        if (!observacionInstance.save(flush: true)) {
            render(view: "edit", model: [observacionInstance: observacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'observacion.label', default: 'Observacion'), observacionInstance.id])
        redirect(action: "show", id: observacionInstance.id)
    }

    def delete(Long id) {
        def observacionInstance = Observacion.get(id)
        if (!observacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
             redirect(controller:"orden", action: "show", id: observacionInstance.orden.id)
            return
        }

        try {
            observacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
           // redirect(action: "list")
          
            redirect(controller:"orden", action: "show", id: observacionInstance.orden.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(controller:"orden", action: "show", id: observacionInstance.orden.id)
        }
    }
}
