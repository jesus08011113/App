package servicios

class Os {
    Equipos tipo
    String marca, modelo, ns, descripcion, acesorios, otroTipo, fallas, recomendaciones
    Date fechaEntrega, dateCreated, lastUpdated
   BigInteger ticket
  
    Status status
   
    Idc ingeniero,  recibe, entrega
    boolean salida 
    static belongsTo = [cliente:Cliente]
    static hasMany = [acciones:Acciones , observaciones:ObservacionesOS]
 
   static hasOne = [ticket:Tickets]
    static constraints = {
     
        status nullable:false, blank:false
        acciones nullable:true
        fechaEntrega nullable:false, blank:false 
        ingeniero nullable:false, blank:false
        cliente nullable:false, blank:false
        fallas maxLength:10000, nullable:true
        recomendaciones maxLength:10000
        ticket autoIncrement: true
        tipo nullable:true , blank: true
        recomendaciones nullable:true , blank: true
        acesorios nullable:true , blank: true
        entrega nullable:true , blank: true
        ticket nullable:true , blank: true, unique: true
       
        
    }
     public String toString() {
         "Ticket: ${ticket} | Equipo: ${tipo} | Marca: ${marca} | Estatus: ${status}"
         
    
    }
 
  static mapping = {
    sort id:  "desc"
}
}
