
(deftemplate paciente 
    (slot codigo
        (type INTEGER)
        (range 1 13373)
        (default 1)
    )
    (multislot nombres
        (type STRING)
        (default ?DERIVE)
		(cardinality 1 2)
    )
    (multislot apellidos
        (type STRING)
        (default ?DERIVE)
		(cardinality 1 2)
    )

	(slot edad
		(type FLOAT)
		(default 0.0)
		(range 0.0 100.0)
	)
)

(deftemplate diagnostico 
 
    (multislot texto
        (type STRING)
        (default ?DERIVE)
    )
 
)

(deftemplate paciente2 
    (slot codigo
        (type INTEGER)
        (range 1 13373)
        (default 1)
    )
    (multislot nombres
        (type STRING)
        (default ?DERIVE)
		(cardinality 1 2)
    )
    (multislot apellidos
        (type STRING)
        (default ?DERIVE)
		(cardinality 1 2)
    )

	(slot edad
		(type FLOAT)
		(default 0.0)
		(range 0.0 100.0)
	)
)

(deftemplate cuestionario  

	(slot codigo
		(type INTEGER)
		(range 1 2)
		(default 1)
	)	

	(slot codigo-paciente
		(type INTEGER)
        (range 1 13373)
        (default 1)
	)
	
	(slot respuesta
		(type STRING)
		(default "NUNCA")
		(allowed-values "NUNCA" "MUY POCO" "UN POCO" "MUCHISIMO" "TODO EL TIEMPO") 
	)
 
	
	(slot tipo
		(type SYMBOL)
		(allowed-values FB vacio)
		(default vacio)
	) 
	
		(slot pregunta
		(type INTEGER)
		(range 1 20)
		(default 1)
	)	
)


(deftemplate cuestionario2  

	(slot codigo
		(type INTEGER)
		(range 1 2)
		(default 1)
	)	

	(slot codigo-paciente
		(type INTEGER)
        (range 1 13373)
        (default 1)
	)
	
	(slot respuesta
		(type STRING)
		(default "1")
		(allowed-values "1" "2" "3" "4") 
	)
 
	(slot tipo
		(type SYMBOL)
		(allowed-values AU vacio)
		(default vacio)
	) 
	
	(slot pregunta
		(type INTEGER)
		(range 1 5)
		(default 1)
	)	
)

 

 