package servicios

import org.springframework.dao.DataIntegrityViolationException

class SeguimientoCatController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [seguimientoCatInstanceList: SeguimientoCat.list(params), seguimientoCatInstanceTotal: SeguimientoCat.count()]
    }

    def create() {
        [seguimientoCatInstance: new SeguimientoCat(params)]
    }

    def save() {
        def seguimientoCatInstance = new SeguimientoCat(params)
        if (!seguimientoCatInstance.save(flush: true)) {
            render(view: "create", model: [seguimientoCatInstance: seguimientoCatInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'seguimientoCat.label', default: 'SeguimientoCat'), seguimientoCatInstance.id])
        redirect(action: "show", id: seguimientoCatInstance.id)
    }

    def show(Long id) {
        def seguimientoCatInstance = SeguimientoCat.get(id)
        if (!seguimientoCatInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguimientoCat.label', default: 'SeguimientoCat'), id])
            redirect(action: "list")
            return
        }

        [seguimientoCatInstance: seguimientoCatInstance]
    }

    def edit(Long id) {
        def seguimientoCatInstance = SeguimientoCat.get(id)
        if (!seguimientoCatInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguimientoCat.label', default: 'SeguimientoCat'), id])
            redirect(action: "list")
            return
        }

        [seguimientoCatInstance: seguimientoCatInstance]
    }

    def update(Long id, Long version) {
        def seguimientoCatInstance = SeguimientoCat.get(id)
        if (!seguimientoCatInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguimientoCat.label', default: 'SeguimientoCat'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (seguimientoCatInstance.version > version) {
                seguimientoCatInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'seguimientoCat.label', default: 'SeguimientoCat')] as Object[],
                          "Another user has updated this SeguimientoCat while you were editing")
                render(view: "edit", model: [seguimientoCatInstance: seguimientoCatInstance])
                return
            }
        }

        seguimientoCatInstance.properties = params

        if (!seguimientoCatInstance.save(flush: true)) {
            render(view: "edit", model: [seguimientoCatInstance: seguimientoCatInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'seguimientoCat.label', default: 'SeguimientoCat'), seguimientoCatInstance.id])
        redirect(action: "show", id: seguimientoCatInstance.id)
    }

    def delete(Long id) {
        def seguimientoCatInstance = SeguimientoCat.get(id)
        if (!seguimientoCatInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguimientoCat.label', default: 'SeguimientoCat'), id])
            redirect(action: "list")
            return
        }

        try {
            seguimientoCatInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'seguimientoCat.label', default: 'SeguimientoCat'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'seguimientoCat.label', default: 'SeguimientoCat'), id])
            redirect(action: "show", id: id)
        }
    }
}
