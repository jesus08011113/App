package servicios

class Provedores {
    String nombre, estatus, direccion, telefono1, telefono2 
    Date dateCreated, lastUpdated

    static constraints = {
        nombre nullable:false, blank:false
          estatus  inList:[" ","Activo","Inactivo","Suspendido"], nullable:false, blank:false
           telefono1 size:7..10, matches:"[0-9]+"
           telefono2 size:7..10, matches:"[0-9]+"
    }
    public String toString() {
         " ${nombre} "
         
    
    }
}
