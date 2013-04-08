package servicios

import org.springframework.dao.DataIntegrityViolationException

class IdcController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [idcInstanceList: Idc.list(params), idcInstanceTotal: Idc.count()]
    }

    def create() {
        [idcInstance: new Idc(params)]
    }

    def save() {
        def idcInstance = new Idc(params)
        if (!idcInstance.save(flush: true)) {
            render(view: "create", model: [idcInstance: idcInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'idc.label', default: 'Idc'), idcInstance.id])
        redirect(action: "show", id: idcInstance.id)
    }

    def show(Long id) {
        def idcInstance = Idc.get(id)
        if (!idcInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'idc.label', default: 'Idc'), id])
            redirect(action: "list")
            return
        }

        [idcInstance: idcInstance]
    }

    def edit(Long id) {
        def idcInstance = Idc.get(id)
        if (!idcInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'idc.label', default: 'Idc'), id])
            redirect(action: "list")
            return
        }

        [idcInstance: idcInstance]
    }

    def update(Long id, Long version) {
        def idcInstance = Idc.get(id)
        if (!idcInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'idc.label', default: 'Idc'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (idcInstance.version > version) {
                idcInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'idc.label', default: 'Idc')] as Object[],
                          "Another user has updated this Idc while you were editing")
                render(view: "edit", model: [idcInstance: idcInstance])
                return
            }
        }

        idcInstance.properties = params

        if (!idcInstance.save(flush: true)) {
            render(view: "edit", model: [idcInstance: idcInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'idc.label', default: 'Idc'), idcInstance.id])
        redirect(action: "show", id: idcInstance.id)
    }

    def delete(Long id) {
        def idcInstance = Idc.get(id)
        if (!idcInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'idc.label', default: 'Idc'), id])
            redirect(action: "list")
            return
        }

        try {
            idcInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'idc.label', default: 'Idc'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'idc.label', default: 'Idc'), id])
            redirect(action: "show", id: id)
        }
    }
}
