package servicios

class Cliente {
    String nombre , domicilio, telefono, movil, email
    Date dateCreated, lastUpdated
 def  os
    static hasMany = [servicios:Os]
   
    static constraints = {
        nombre nullable: false, blank: false
        domicilio nullable: false, blank: false
        email email:true
        movil size:10..10, matches:"[0-9]+"
        telefono size:7..10, matches:"[0-9]+"
    }
     String toString() {
       nombre
    }
      static mapping = {
    sort lastUpdated:  "asc"
}
}
