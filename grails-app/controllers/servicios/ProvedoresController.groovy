package servicios

import org.springframework.dao.DataIntegrityViolationException

class ProvedoresController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [provedoresInstanceList: Provedores.list(params), provedoresInstanceTotal: Provedores.count()]
    }

    def create() {
        [provedoresInstance: new Provedores(params)]
    }

    def save() {
        def provedoresInstance = new Provedores(params)
        if (!provedoresInstance.save(flush: true)) {
            render(view: "create", model: [provedoresInstance: provedoresInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'provedores.label', default: 'Provedores'), provedoresInstance.id])
        redirect(action: "show", id: provedoresInstance.id)
    }

    def show(Long id) {
        def provedoresInstance = Provedores.get(id)
        if (!provedoresInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provedores.label', default: 'Provedores'), id])
            redirect(action: "list")
            return
        }

        [provedoresInstance: provedoresInstance]
    }

    def edit(Long id) {
        def provedoresInstance = Provedores.get(id)
        if (!provedoresInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provedores.label', default: 'Provedores'), id])
            redirect(action: "list")
            return
        }

        [provedoresInstance: provedoresInstance]
    }

    def update(Long id, Long version) {
        def provedoresInstance = Provedores.get(id)
        if (!provedoresInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provedores.label', default: 'Provedores'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (provedoresInstance.version > version) {
                provedoresInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'provedores.label', default: 'Provedores')] as Object[],
                          "Another user has updated this Provedores while you were editing")
                render(view: "edit", model: [provedoresInstance: provedoresInstance])
                return
            }
        }

        provedoresInstance.properties = params

        if (!provedoresInstance.save(flush: true)) {
            render(view: "edit", model: [provedoresInstance: provedoresInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'provedores.label', default: 'Provedores'), provedoresInstance.id])
        redirect(action: "show", id: provedoresInstance.id)
    }

    def delete(Long id) {
        def provedoresInstance = Provedores.get(id)
        if (!provedoresInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provedores.label', default: 'Provedores'), id])
            redirect(action: "list")
            return
        }

        try {
            provedoresInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'provedores.label', default: 'Provedores'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'provedores.label', default: 'Provedores'), id])
            redirect(action: "show", id: id)
        }
    }
}
