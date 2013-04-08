package servicios

class ObservacionesOS {
    String nombre
    String descripcion
    TipoObservacion tipo
    Date dateCreated
    Date lastUpdated
 
    
    static belongsTo = [orden : Os]

      static constraints = {
        nombre(blank: false)
        orden (nullble: false)
        tipo (nullble: false)
        descripcion (blank:false, maxLength:2000)
      
    }

    String toString() {
        " Titulo: ${nombre} | Comentario: ${descripcion} | Fecha: ${dateCreated} "
    }
    static mapping = {
        sort id:"desc"
        descripcion type: 'text'

     }
     
}
