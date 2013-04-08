import servicios.Role
import servicios.User
import servicios.UserRole


class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        if (User.findByUsername( 'admin') &&
            User.findByUsername( 'user') &&
            User.findByUsername( 'supervisor') )return
        def adminRole = new Role(authority: 'ROLE_ADMIN')
        .save(flush: true)
        def userRole = new Role (authority: 'ROLE_USER')
        .save(flush: true)
        def supervisorRole = new Role (authority: 'ROLE_SUPERVISOR')
        .save(flush: true)
        String password = springSecurityService.encodePassword('password')
        def adminUser = new User(username: 'admin', enabled: true,
            password: password)
        adminUser.save(flush: true)
        def normalUser= new User(username: 'user', enabled:true,
            password: password)
        normalUser.save(flush:true)
        def supervisorUser= new User(username: 'supervisor', enabled:true,
            password: password)
        supervisorUser.save(flush:true)
        UserRole.create(adminUser, adminRole, true)
        UserRole.create(normalUser, userRole, true)
        UserRole.create(supervisorUser, supervisorRole, true)
        assert User.count() == 3
        assert Role.count() == 3
        assert UserRole.count() == 3
    
    }
    def destroy = {
    }
}
