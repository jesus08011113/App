dataSource {
    pooled = true
    //driverClassName = "org.h2.Driver"
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
           // dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
           // url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
           
             dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
           driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://localhost:3306/servicio"
        }
    }
    test {
        dataSource {
             dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
           driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://localhost:3306/servicio"
        }
    }
    production {
       dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
           driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://localhost:3306/servicio"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
