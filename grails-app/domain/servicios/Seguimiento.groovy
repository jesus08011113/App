package servicios

class Seguimiento {
        
           
        Orden zzzorden
        String asitio
        String bservicio
        String cso
        Provedores dcontratista
        String epo
        
        String fdeliberycompleto
        String gdeliberyincompleto
        String hot
        String isurvey
        
        String jtierras
        String kcfe
        String lglt
        String mfuerza
        String oarnes
        String pdfo 
        String qpasosCable 
        String rdg
        String sbajadasFibra
        
        String tfijacion
        String uinterconexion
        String vempalme
        String wbdfo
        String xenergizacion
        String yaterrizaje
        String ztimbrado
        String zaapotencia
        String zbetiquetado
        String zcrcdt
        String zdconfiguracion
        String zeactsw
        
        
        
        String zfpuertos
        String zgcontroladora
        String zhsfp
        String zifo
        String zjbaterias
        String zkgabinete
        
        String zlreprogramacion
        String zncns
        String zoreporteFotografico
        String zprotocolo
        
        String zmcomentario
        User zzusuario
     
    Date dateCreated
    Date lastUpdated

    static constraints = {
         asitio blank:true, nullable: true
       bservicio blank:true, nullable: true
       cso blank:false, nullable: true
         dcontratista blank:true, nullable: true
         epo blank:true, nullable: true
        
        fdeliberycompleto blank:false, nullable: false
        gdeliberyincompleto blank:false, nullable: false
        hot blank:false, nullable: false
        isurvey blank:false, nullable: false
        
       jtierras blank:false, nullable: false
       kcfe blank:false, nullable: false
         lglt blank:false, nullable: false
        mfuerza blank:false, nullable: false
         oarnes blank:false, nullable: false
        pdfo  blank:false, nullable: false
       qpasosCable blank:false, nullable: false 
         rdg blank:false, nullable: false
        sbajadasFibra blank:false, nullable: false
        
         tfijacion blank:false, nullable: false
       uinterconexion blank:false, nullable: false
        vempalme blank:false, nullable: false
       wbdfo blank:false, nullable: false
       xenergizacion blank:false, nullable: false
       yaterrizaje blank:false, nullable: false
        ztimbrado blank:false, nullable: false
       zaapotencia blank:false, nullable: false
        zbetiquetado blank:false, nullable: false
        zcrcdt blank:false, nullable: false
        zdconfiguracion blank:false, nullable: false
        zeactsw blank:false, nullable: false
        
        zfpuertos blank:false, nullable: false
       zgcontroladora blank:false, nullable: false
        zhsfp blank:false, nullable: false
        zifo blank:false, nullable: false
        zjbaterias blank:false, nullable: false
        zkgabinete blank:false, nullable: false
        
        zlreprogramacion blank:false, nullable: false
       zncns blank:false, nullable: false
        zoreporteFotografico blank:false, nullable: false
       zprotocolo blank:false, nullable: false
        
        zmcomentario blank: true, nullable: true
       
       
    }
}
