package servicios
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class SeguimientoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

 def springSecurityService
    def index() {
        redirect(action: "list", params: params)
    }

  def exportService
    def grailsApplication

   def list(Integer max) {
       
       if (params)
        params.max = Math.min(max ?: 50, 100)
        
        def seguimientoInstanceList = null
        def seguimientoInstanceTotal = null

        def filterParams = [:]
        
         if (session["sessionFilterSeguimiento"] != null) {
            filterParams = session["sessionFilterSeguimiento"]
            params.putAll(filterParams)
                System.out.println("con filtro sesion seguimiento " + params) 
            seguimientoInstanceList = filterPaneService.filter(params, Seguimiento)
           seguimientoInstanceTotal = filterPaneService.count(params, Seguimiento)
            System.out.println("lista seguimiento filtrada " + seguimientoInstanceList) 
            
             
   
        }
        else {
            System.out.println("lista vacia") 
            seguimientoInstanceList = Seguimiento.list(params)
            seguimientoInstanceTotal = Seguimiento.count()
        }
        
      
        if(params?.format && params.format != "html" && session["sessionFilterSeguimiento"] == null)
        {
             System.out.println("sin filtro")
			response.contentType = grailsApplication.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=Vitacora.${params.extension}")

         
            
exportService.export(params.format, response.outputStream,Seguimiento.list(params), [:], [:])
		}
       
        
        if(params?.format && params.format != "html" && session["sessionFilterSeguimiento"] != null)
            {
      
           filterParams = session["sessionFilterSeguimiento"]
            params.putAll(filterParams)
                System.out.println("filtro + export seguimiento  " + params) 
            seguimientoInstanceList = filterPaneService.filter(params, Seguimiento)
           seguimientoInstanceTotal = filterPaneService.count(params, Seguimiento)
              response.contentType = grailsApplication.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=VitacoraFiltrada.${params.extension}")

exportService.export(params.format, response.outputStream,seguimientoInstanceList, [:], [:])
          
            }
     
       [seguimientoInstanceList: seguimientoInstanceList, seguimientoInstanceTotal: seguimientoInstanceTotal, filterParams: filterParams]
    }
    
       
    
def filterPaneService


     def filter = {
        if (!params.max) params.max = 50

          def filterParams = org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params)

        session["sessionFilterSeguimiento"] = filterParams
        System.out.println("filtro en session seguimiento " + session.sessionFilterSeguimiento) 
      /*  render(view: 'list',
                model: [ordenInstanceList: filterPaneService.filter( params, Orden ),
                         ordenInstanceCount: filterPaneService.count( params, Orden ),
                       filterParams:filterParams,
                        params: params])*/
        redirect(action: "list", 
                model: [seguimientoInstanceList: filterPaneService.filter( params, Seguimiento ),
                         seguimientoInstanceCount: filterPaneService.count( params, Seguimiento ),
                       filterParams:filterParams,
                        params: params])
                        
    }

    
  
    def create() {
         def usuario = User.findByUsername(springSecurityService.currentUser.username)//Obtiene el usuario logeado y lo busca en la bd 
         def totem = Orden.get(params.zzzorden.id)
         def ordenIns = Orden.findById(params.zzzorden.id)       
      
       def observaciones = ordenIns ? Observacion.findAllByOrden(ordenIns) : []
    // def observacionesList = Observacion.find("from Observacion as ob order by ob.dateCreated desc") 
    
        
       
     
         def seguimientoInstance = new Seguimiento()
         seguimientoInstance.properties = params
         seguimientoInstance.zzusuario = usuario
         seguimientoInstance.asitio = totem.sitio
         seguimientoInstance.bservicio = totem.servicio
         seguimientoInstance.cso = totem.cso
         seguimientoInstance.epo = totem.po
         seguimientoInstance.zmcomentario = observaciones
         System.out.println("objeto properties" + seguimientoInstance.properties) 
        [seguimientoInstance: seguimientoInstance]
    }

    def save() {
        def seguimientoInstance = new Seguimiento(params)
        if (!seguimientoInstance.save(flush: true)) {
            render(view: "create", model: [seguimientoInstance: seguimientoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'seguimiento.label', default: 'Seguimiento'), seguimientoInstance.id])
        redirect(action: "show", id: seguimientoInstance.id)
    }

    def show(Long id) {
        def seguimientoInstance = Seguimiento.get(id)
        if (!seguimientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguimiento.label', default: 'Seguimiento'), id])
            redirect(action: "list")
            return
        }

        [seguimientoInstance: seguimientoInstance]
    }

    def edit(Long id) {
        def seguimientoInstance = Seguimiento.get(id)
        if (!seguimientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguimiento.label', default: 'Seguimiento'), id])
            redirect(action: "list")
            return
        }

        [seguimientoInstance: seguimientoInstance]
    }

    def update(Long id, Long version) {
        def seguimientoInstance = Seguimiento.get(id)
        if (!seguimientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguimiento.label', default: 'Seguimiento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (seguimientoInstance.version > version) {
                seguimientoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'seguimiento.label', default: 'Seguimiento')] as Object[],
                          "Another user has updated this Seguimiento while you were editing")
                render(view: "edit", model: [seguimientoInstance: seguimientoInstance])
                return
            }
        }

        seguimientoInstance.properties = params

        if (!seguimientoInstance.save(flush: true)) {
            render(view: "edit", model: [seguimientoInstance: seguimientoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'seguimiento.label', default: 'Seguimiento'), seguimientoInstance.id])
        redirect(action: "show", id: seguimientoInstance.id)
    }

    def delete(Long id) {
        def seguimientoInstance = Seguimiento.get(id)
        if (!seguimientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguimiento.label', default: 'Seguimiento'), id])
            redirect(action: "list")
            return
        }

        try {
            seguimientoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'seguimiento.label', default: 'Seguimiento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'seguimiento.label', default: 'Seguimiento'), id])
            redirect(action: "show", id: id)
        }
    }
}
