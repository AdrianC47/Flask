(defclass paciente (is-a USER)
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

(defclass test (is-a  paciente)
	(slot codigo-paciente
		(type INTEGER)
        (range 1 13373)
        (default 1)
	)
	
	 (slot puntuacion
		(type INTEGER)
        (range 0 86)
        (default 0)
	)
)
 
 
 


 





;(bind ?codigo  (send [persona1] get-codigo))
;(bind $?nombres  (send [persona1] get-nombres))
;(bind $?apellidos  (send [persona1] get-apellidos))
;(bind ?edad  (send [persona1] get-edad))

;(bind $?diagnostico  (send [fobia1] get-tipo) (send [fobia1] get-nombres))
 
 
;(assert (El_Paciente_es  $?nombres  ?codigo $?apellidos ?edad))
;(assert (Padece-de  $?diagnostico))
	