package servicios

class Idc {
        String nombre, materno, paterno
        String telefono
        String telefono2
        String celular
        String curp, rfc, nss
        String direccion1, direccion2
        String puesto
        String estatus
        String tipo
        
     
        String email
        Provedores provedor
        Date dateCreated    
        Date lastUpdated 

    static constraints = {
     
        nombre nullable:false, blank:false 
        paterno nullable:false, blank:false
        materno nullable:false, blank:false
        direccion1 nullable:false, blank:false
        email email:true
        celular size:10..10, matches:"[0-9]+"
        telefono size:7..10, matches:"[0-9]+"
        estatus  inList:[" ","Activo","Inactivo","Suspendido"], nullable:false, blank:false 
        tipo  inList:["IDC","IDS"], nullable:false, blank:false 
    }
    public String toString() {
         "${nombre} ${paterno} ${materno} "
    }
    static mapping = {
    sort nombre:  "asc"
}
}
