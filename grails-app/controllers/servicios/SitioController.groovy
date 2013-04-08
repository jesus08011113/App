package servicios

import org.springframework.dao.DataIntegrityViolationException

class SitioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [sitioInstanceList: Sitio.list(params), sitioInstanceTotal: Sitio.count()]
    }

    def create() {
        [sitioInstance: new Sitio(params)]
    }

    def save() {
        def sitioInstance = new Sitio(params)
        if (!sitioInstance.save(flush: true)) {
            render(view: "create", model: [sitioInstance: sitioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sitio.label', default: 'Sitio'), sitioInstance.id])
        redirect(action: "show", id: sitioInstance.id)
    }

    def show(Long id) {
        def sitioInstance = Sitio.get(id)
        if (!sitioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sitio.label', default: 'Sitio'), id])
            redirect(action: "list")
            return
        }

        [sitioInstance: sitioInstance]
    }

    def edit(Long id) {
        def sitioInstance = Sitio.get(id)
        if (!sitioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sitio.label', default: 'Sitio'), id])
            redirect(action: "list")
            return
        }

        [sitioInstance: sitioInstance]
    }

    def update(Long id, Long version) {
        def sitioInstance = Sitio.get(id)
        if (!sitioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sitio.label', default: 'Sitio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sitioInstance.version > version) {
                sitioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sitio.label', default: 'Sitio')] as Object[],
                          "Another user has updated this Sitio while you were editing")
                render(view: "edit", model: [sitioInstance: sitioInstance])
                return
            }
        }

        sitioInstance.properties = params

        if (!sitioInstance.save(flush: true)) {
            render(view: "edit", model: [sitioInstance: sitioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sitio.label', default: 'Sitio'), sitioInstance.id])
        redirect(action: "show", id: sitioInstance.id)
    }

    def delete(Long id) {
        def sitioInstance = Sitio.get(id)
        if (!sitioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sitio.label', default: 'Sitio'), id])
            redirect(action: "list")
            return
        }

        try {
            sitioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sitio.label', default: 'Sitio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sitio.label', default: 'Sitio'), id])
            redirect(action: "show", id: id)
        }
    }
    
     def scaffold = true

    def getSitios = {
        //Se obtiene central
    //def centralInstance = Central.get(params.id)
     def centralInstance = Central.findById(params.id) 
        //Se la lista de sitios
       // def sitiosList = centralInstance?.sitios
     def sitiosList = centralInstance ? Sitio.findAllByCentral(centralInstance) : []
       
        //Se hace el render del emplate '_selectSitios.gsp' con la lista de sitios obtenida.
        render(template: "selectSitios", model: [sitiosList:sitiosList])
    }
}
