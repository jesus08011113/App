package servicios


    import org.joda.time.LocalTime
class Orden {
    
  
   // Sitio sitio
    String sitio
    String po
    Central central
    Status status
    Proyecto proyecto
    Date fechaProgramada
    LocalTime horaAtencion
    LocalTime horaArribo
    LocalTime horaSalida
    Date fechaConclusion
    TServicio servicio
    User usuario
    String ticket
    String cso
    static searchable = true
  
    Idc ingeniero
    Date dateCreated    
    Date lastUpdated 
    static hasMany = [observaciones:Observacion]
    static hasOne = [seguimiento:Seguimiento]

    static constraints = {
         status nullable:false, blank:false
         servicio nullable:true, blank:false
         sitio nullable:true, blank:false
         proyecto nullable:true, blank:false
        fechaConclusion nullable:true, blank:true
        horaAtencion nullable:true, blank:true
        horaArribo nullable:true, blank:true
        horaSalida nullable:true, blank:true
        central nullable:true, blank:false
        seguimiento nullable:true, blank:true 
         
         
    }
    public String toString() {
         " ${proyecto} - ${central}- ${sitio}"
         
    
    }
     static mapping = {
        sort id:"desc"
     }
     
    static scope = "session"
  /*   def beforeUpdate(){
         String a = ordenInstance.properties.statusId
           String b = params.status.id
         if ( a != b ) {
             System.out.println("no son iguales :(  "  )  
             System.out.println("id orden:(  " + ordenInstance?.id )  
       //     def ob = new Observacion (nombre:"Cambio de Status", descripcion:"Se cambio el estatus ", orden: ordenInstance?.id, usuario: 1)
         //   ob.save()
          //   System.out.println("observacion" +ob )
          
            Observacion ob = new Observacion (nombre:"Cambio de Status", descripcion:"Se cambio el estatus ", orden: ordenInstance?.id, usuario: 1).save()
           // ob.orden.id = ordenInstance.id
           // ob.save()
            def valem = Observacion.get(ob.orden.id)
            System.out.println("puta madre" + valem)
            System.out.println("observacion" +ob )
            System.out.println("obs" +ob.orden.id )
        //  Observacion.executeQuery('insert into observacion (nombre, descripcion, orden) values (?,?,?)', ["Cambio de status", "si se pudo", ordenInstance.properties.id ])
        }
     } */
         
  
}

    
