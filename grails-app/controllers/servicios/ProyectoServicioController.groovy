package servicios

import org.springframework.dao.DataIntegrityViolationException

class ProyectoServicioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 40, 100)
        [proyectoServicioInstanceList: ProyectoServicio.list(params), proyectoServicioInstanceTotal: ProyectoServicio.count()]
    }

    def create() {
        [proyectoServicioInstance: new ProyectoServicio(params)]
    }

    def save() {
        def proyectoServicioInstance = new ProyectoServicio(params)
        if (!proyectoServicioInstance.save(flush: true)) {
            render(view: "create", model: [proyectoServicioInstance: proyectoServicioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'proyectoServicio.label', default: 'ProyectoServicio'), proyectoServicioInstance.id])
        redirect(action: "show", id: proyectoServicioInstance.id)
    }

    def show(Long id) {
        def proyectoServicioInstance = ProyectoServicio.get(id)
        if (!proyectoServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyectoServicio.label', default: 'ProyectoServicio'), id])
            redirect(action: "list")
            return
        }

        [proyectoServicioInstance: proyectoServicioInstance]
    }

    def edit(Long id) {
        def proyectoServicioInstance = ProyectoServicio.get(id)
        if (!proyectoServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyectoServicio.label', default: 'ProyectoServicio'), id])
            redirect(action: "list")
            return
        }

        [proyectoServicioInstance: proyectoServicioInstance]
    }

    def update(Long id, Long version) {
        def proyectoServicioInstance = ProyectoServicio.get(id)
        if (!proyectoServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyectoServicio.label', default: 'ProyectoServicio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (proyectoServicioInstance.version > version) {
                proyectoServicioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'proyectoServicio.label', default: 'ProyectoServicio')] as Object[],
                          "Another user has updated this ProyectoServicio while you were editing")
                render(view: "edit", model: [proyectoServicioInstance: proyectoServicioInstance])
                return
            }
        }

        proyectoServicioInstance.properties = params

        if (!proyectoServicioInstance.save(flush: true)) {
            render(view: "edit", model: [proyectoServicioInstance: proyectoServicioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'proyectoServicio.label', default: 'ProyectoServicio'), proyectoServicioInstance.id])
        redirect(action: "show", id: proyectoServicioInstance.id)
    }

    def delete(Long id) {
        def proyectoServicioInstance = ProyectoServicio.get(id)
        if (!proyectoServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyectoServicio.label', default: 'ProyectoServicio'), id])
            redirect(action: "list")
            return
        }

        try {
            proyectoServicioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'proyectoServicio.label', default: 'ProyectoServicio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'proyectoServicio.label', default: 'ProyectoServicio'), id])
            redirect(action: "show", id: id)
        }
    }
}
