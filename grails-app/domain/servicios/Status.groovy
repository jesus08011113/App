package servicios

class Status {
    String nombre
    String descripcion
    String tipo
    Date dateCreated
    Date lastUpdated
    

    static constraints = {
        nombre (nullabe:false, blank: false)
         tipo inList:["Proyecto","Orden Servicio"], nullable:false, blank:false
    }
    String toString() {
        nombre
    }
}
