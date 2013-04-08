package servicios

class Observacion {
    String nombre
    String descripcion
    TipoObservacion tipo
    Date dateCreated
    Date lastUpdated
    User usuario
    
    static belongsTo = [orden : Orden]

      static constraints = {
        nombre(blank: false)
        orden (nullble: false)
        tipo (nullble: false)
      
    }

    String toString() {
        " Titulo: ${nombre} | Comentario: ${descripcion} | Fecha: ${dateCreated} "
    }
    static mapping = {
        sort id:"desc"
      
        descripcion type: 'text'

     }
     
    
}
