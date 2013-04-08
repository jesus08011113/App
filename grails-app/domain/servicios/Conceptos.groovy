package servicios

class Conceptos {
    String concepto
    BigDecimal precio
     static belongsTo = [ticket:Tickets]
  

    static constraints = {
        concepto nullable:false
        precio nullable:false
    }
}
