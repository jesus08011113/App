package servicios

class Equipos {
    String tipo
    Date  dateCreated, lastUpdated
  
    
    static constraints = {
       tipo nullable:false, blank:false
    }
    String toString() {
       tipo
    }
}
