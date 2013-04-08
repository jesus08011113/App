package servicios

class UsuarioProyecto {
    
        User usuario
        Proyecto proyecto
        Date dateCreated
        Date lastUpdated

    static constraints = {
        usuario nullable:false, blank: false
        proyecto nullable:false, blank: false
    }
}
