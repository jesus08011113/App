package servicios

class ProyectoCentral {
   // static belongsTo = [proyecto:Proyecto, central:Central]
   Proyecto proyecto
   Central central

    static constraints = {
        proyecto nullable:false, blank:false
        central nullable:false, blank:false
        
    }
   public String toString() {
         central
         
    
    }
}
