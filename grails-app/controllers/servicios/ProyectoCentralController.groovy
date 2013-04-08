package servicios

import org.springframework.dao.DataIntegrityViolationException

class ProyectoCentralController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        [proyectoCentralInstanceList: ProyectoCentral.list(params), proyectoCentralInstanceTotal: ProyectoCentral.count()]
    }

    def create() {
        [proyectoCentralInstance: new ProyectoCentral(params)]
    }

    def save() {
        def proyectoCentralInstance = new ProyectoCentral(params)
        if (!proyectoCentralInstance.save(flush: true)) {
            render(view: "create", model: [proyectoCentralInstance: proyectoCentralInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'proyectoCentral.label', default: 'ProyectoCentral'), proyectoCentralInstance.id])
        redirect(action: "show", id: proyectoCentralInstance.id)
    }

    def show(Long id) {
        def proyectoCentralInstance = ProyectoCentral.get(id)
        if (!proyectoCentralInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyectoCentral.label', default: 'ProyectoCentral'), id])
            redirect(action: "list")
            return
        }

        [proyectoCentralInstance: proyectoCentralInstance]
    }

    def edit(Long id) {
        def proyectoCentralInstance = ProyectoCentral.get(id)
        if (!proyectoCentralInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyectoCentral.label', default: 'ProyectoCentral'), id])
            redirect(action: "list")
            return
        }

        [proyectoCentralInstance: proyectoCentralInstance]
    }

    def update(Long id, Long version) {
        def proyectoCentralInstance = ProyectoCentral.get(id)
        if (!proyectoCentralInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyectoCentral.label', default: 'ProyectoCentral'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (proyectoCentralInstance.version > version) {
                proyectoCentralInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'proyectoCentral.label', default: 'ProyectoCentral')] as Object[],
                          "Another user has updated this ProyectoCentral while you were editing")
                render(view: "edit", model: [proyectoCentralInstance: proyectoCentralInstance])
                return
            }
        }

        proyectoCentralInstance.properties = params

        if (!proyectoCentralInstance.save(flush: true)) {
            render(view: "edit", model: [proyectoCentralInstance: proyectoCentralInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'proyectoCentral.label', default: 'ProyectoCentral'), proyectoCentralInstance.id])
        redirect(action: "show", id: proyectoCentralInstance.id)
    }

    def delete(Long id) {
        def proyectoCentralInstance = ProyectoCentral.get(id)
        if (!proyectoCentralInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyectoCentral.label', default: 'ProyectoCentral'), id])
            redirect(action: "list")
            return
        }

        try {
            proyectoCentralInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'proyectoCentral.label', default: 'ProyectoCentral'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'proyectoCentral.label', default: 'ProyectoCentral'), id])
            redirect(action: "show", id: id)
        }
    }
}
