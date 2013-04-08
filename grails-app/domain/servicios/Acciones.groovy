package servicios

class Acciones {
    String  nombre, descripcion
      BigDecimal precio
    
      static belongsTo = Os
      static hasMany = [orden:Os]

    static constraints = {
       orden nullable:true
        descripcion maxLength:1000, nullable:false, blank:false
        precio nullable:false, blank:false
        nombre nullable:false, blank:false
      
        
    }
     public String toString() {
       "Servicio: ${nombre} | Precio: ${precio} "
         
    
    }
}
