package servicios

import org.springframework.dao.DataIntegrityViolationException

class UserRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [userRoleInstanceList: UserRole.list(params), userRoleInstanceTotal: UserRole.count()]
    }

    def create() {
       def usuariosSinRol= User.findAll("from User as us where not exists " +
                "(from UserRole as ur where ur.user = us)")
        System.out.println("usuarios huerfanos" + usuariosSinRol)  
          def userRoleInstance = new UserRole()
         userRoleInstance.properties = params
           
        [userRoleInstance: userRoleInstance, usuariosSinRol:usuariosSinRol ]
       
        }

    def save() {
        def userRoleInstance = new UserRole(params)
        if (!userRoleInstance.save(flush: true)) {
            render(view: "create", model: [userRoleInstance: userRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])
        redirect(action: "show", id: userRoleInstance.id)
    }

    def show(Long id) {
        def userRoleInstance = UserRole.get(id)
        if (!userRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), id])
            redirect(action: "list")
            return
        }

        [userRoleInstance: userRoleInstance]
    }

    def edit(Long id) {
        def userRoleInstance = UserRole.get(id)
        if (!userRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), id])
            redirect(action: "list")
            return
        }

        [userRoleInstance: userRoleInstance]
    }

    def update(Long id, Long version) {
        def userRoleInstance = UserRole.get(id)
        if (!userRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userRoleInstance.version > version) {
                userRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userRole.label', default: 'UserRole')] as Object[],
                          "Another user has updated this UserRole while you were editing")
                render(view: "edit", model: [userRoleInstance: userRoleInstance])
                return
            }
        }

        userRoleInstance.properties = params

        if (!userRoleInstance.save(flush: true)) {
            render(view: "edit", model: [userRoleInstance: userRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])
        redirect(action: "show", id: userRoleInstance.id)
    }

    def delete(Long id) {
        def userRoleInstance = UserRole.get(id)
        if (!userRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), id])
            redirect(action: "list")
            return
        }

        try {
            userRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), id])
            redirect(action: "show", id: id)
        }
    }
    
     
}
