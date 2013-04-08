package servicios

class Tickets {
    String estatus
     static hasMany = [conceptos:Conceptos]
      static belongsTo = [orden:Os]
  
    static constraints = {
        conceptos nullable:true 
        estatus nullable:false
        
    }
}
