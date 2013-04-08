package servicios

import org.springframework.dao.DataIntegrityViolationException

class AccionesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
     def launchLightbox (Long id) { 
        System.out.println("id " + id)
      //  def orden = Os.get(id)
      System.out.println("orden id " + orden)
       
      def accionesInstance = new Acciones() 
      accionesInstance.orden = orden.id
       accionesInstance.nombre = "Anticipo"
       
    
   
       
        render(template: "modalform", model:  [accionesInstance: accionesInstance, orden:orden.id]) 
  
  
}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [accionesInstanceList: Acciones.list(params), accionesInstanceTotal: Acciones.count()]
    }

    def create() {
        [accionesInstance: new Acciones(params)]
    }

    def save() {
        def accionesInstance = new Acciones(params)
        if (!accionesInstance.save(flush: true)) {
            render(view: "create", model: [accionesInstance: accionesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'acciones.label', default: 'Acciones'), accionesInstance.id])
        redirect(action: "show", id: accionesInstance.id)
    }

    def show(Long id) {
        def accionesInstance = Acciones.get(id)
        if (!accionesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acciones.label', default: 'Acciones'), id])
            redirect(action: "list")
            return
        }

        [accionesInstance: accionesInstance]
    }

    def edit(Long id) {
        def accionesInstance = Acciones.get(id)
        if (!accionesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acciones.label', default: 'Acciones'), id])
            redirect(action: "list")
            return
        }

        [accionesInstance: accionesInstance]
    }

    def update(Long id, Long version) {
        def accionesInstance = Acciones.get(id)
        if (!accionesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acciones.label', default: 'Acciones'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (accionesInstance.version > version) {
                accionesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'acciones.label', default: 'Acciones')] as Object[],
                          "Another user has updated this Acciones while you were editing")
                render(view: "edit", model: [accionesInstance: accionesInstance])
                return
            }
        }

        accionesInstance.properties = params

        if (!accionesInstance.save(flush: true)) {
            render(view: "edit", model: [accionesInstance: accionesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'acciones.label', default: 'Acciones'), accionesInstance.id])
        redirect(action: "show", id: accionesInstance.id)
    }

    def delete(Long id) {
        def accionesInstance = Acciones.get(id)
        if (!accionesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acciones.label', default: 'Acciones'), id])
            redirect(action: "list")
            return
        }

        try {
            accionesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'acciones.label', default: 'Acciones'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'acciones.label', default: 'Acciones'), id])
            redirect(action: "show", id: id)
        }
    }
}
