package servicios

class Sitio {
  String nombre

    
    static belongsTo = [central:Central]

    static constraints = {
        nombre(blank: false)
        central(nullble: false)
    }
static mapping = {
    sort nombre: "asc" // or "asc"
}
    String toString() {
        nombre
    }
}
