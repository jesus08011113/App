package servicios

class TServicio {
    String nombre
    String tipo
    String codigo
    String herramienta
    String documentos
  
    Date dateCreated
    Date lastUpdated

    static constraints = {
        nombre nullable:false, blank:false
        tipo inList:["Proyecto","Orden Servicio"], nullable:false, blank:false
    
    }
    public String toString() {
        "${nombre}  "
    }
   static mapping = {
   herramienta type: 'text'
   documentos type: 'text'
}
 
}
