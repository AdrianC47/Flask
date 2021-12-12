
;======================================TEMPLATES====================================================
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

	(slot codigopaciente
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
		(type STRING)
		(default "FB")
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

	(slot codigopaciente
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
		(type STRING)
		(default "AU")
	) 
 
	
	(slot pregunta
		(type INTEGER)
		(range 18 24)
 
	)	
)

;======================================CLASES====================================================
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

(defclass paciente2 (is-a USER)
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



(defclass cuestionario (is-a  USER)

	(slot codigo
		(type INTEGER)
		(range 1 2)
		(default 1)
	)	

	(slot codigopaciente
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
		(type STRING)
		(default "FB")
	) 

	(slot pregunta
		(type INTEGER)
		(range 1 20)
		(default 1)
	)	
)

(defclass cuestionario2 (is-a  USER) 

	(slot codigo
		(type INTEGER)
		(range 1 2)
		(default 1)
	)	

	(slot codigopaciente
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
		(type STRING)
		(default "AU")
	)  
 
	
	(slot pregunta
		(type INTEGER)
		(range 18 24)
 
	)	
)
 
;===========================================FUNCION=================================================
(deffunction suma  (?a ?b)
	(+ ?a ?b)
)


;======================================REGLAS====================================================
(defglobal ?*cont* = 0)
(defglobal ?*aux* = 0)
(defglobal ?*total* = 0) 
(defglobal ?*total2* = 0) 
 
(defrule match-paciente
	(object  (is-a paciente) (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))	
	(object  (is-a cuestionario)  (codigo ?ct)(codigopaciente ?cp) (respuesta ?r)  (tipo ?t) (pregunta ?p))	  
 
    (test
         (= ?cp ?c)
    )
	
 
 
=>
 
	(printout t "El Paciente  " $?n " con  el codigo: " ?cp" es evaluado en el cuestionario de Fobia Social de codigo "  ?ct  crlf)
 

	(assert (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e)))
	(assert (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r)(tipo ?t) (pregunta ?p) ))


)


(defrule match-paciente2
	(object  (is-a paciente2) (codigo ?c2) (nombres $?n2) (apellidos $?a2) (edad ?e2))	
	(object  (is-a cuestionario2)  (codigo ?ct2)(codigopaciente ?cp2) (respuesta ?r2)  (tipo ?t2) (pregunta ?p2))	  
 
    (test
         (= ?cp2 ?c2)
    )
	
 
=>
 
	(printout t "El Paciente  " $?n2 " con  el codigo: " ?cp2" es evaluado en el cuestionario de Autoestima de  codigo "  ?ct2  crlf)
 
 
	(assert (paciente2 (codigo ?c2) (nombres $?n2) (apellidos $?a2) (edad ?e2)))
	(assert (cuestionario2 (codigo ?ct2) (codigopaciente ?cp2) (respuesta ?r2)(tipo ?t2) (pregunta ?p2)))

 
)


(defrule pregunta_1
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     ) 
	 
	 (test
        (eq ?p 1)
     ) 
=>

	(if 
		(eq ?r NUNCA) 	
	 	then (bind ?*cont* (suma ?*cont* 1))
 		 	(printout t  "El total es "  ?*cont* crlf)
	)
	 
	 (if (eq ?r "MUY POCO")	
	 	then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )
	 (if (eq ?r "MUCHISIMO") 
		then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )	  
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
	 (bind ?*total*  ?*cont*)
	 (printout t "WEEEEEEEEEEEE" ?*total*)
		 (bind ?*cont* 0)
 
 
)
(defrule pregunta_2
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     ) 
	 (test
        (eq ?p 2)
     ) 
=>
	 (if (eq ?r "NUNCA") 
		 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
		then (bind ?*cont* (suma ?*cont* 2))
 		(printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
		then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
		then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_3
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 3)
     )	 
=>
	 (if (eq ?r "NUNCA") 
		then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
		then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
		 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
		 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_4
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     ) 
	 (test
        (eq ?p 4)
     ) 
=>
	 (if (eq ?r "NUNCA") 
		then (bind ?*cont* (suma ?*cont* 1))
 		(printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
		then(bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
		then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
		then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
		then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)
(defrule pregunta_5
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 5)
     )	 
=>
	 (if (eq ?r "NUNCA") 
		 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es  "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
		 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_6
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     ) 
	 (test
        (eq ?p 6)
     )
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
 		then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
		then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
		 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_7
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 7)
     )
	 
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
		 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_8
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     ) 
	 (test
        (eq ?p 8)
     )
=>
	 (if (eq ?r "NUNCA")
	  	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO")
	  	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO")
	   	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_9
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 9)
     )	 
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_10
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 10)
     )	 
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
		 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
		 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO")
	  	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_11
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     ) 
	 (test
        (eq ?p 11)
     )	 
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_12
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 12)
     )	 
=>
	 (if (eq ?r "NUNCA") 
	 	then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO")
	  	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_13
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 13)
     )	 
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_14
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 14)
     )	 
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO")
	  	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_15
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 15)
     )	 
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_16
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 16)
     )	 
=>
	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
	 )	 
	 (printout t "El paciente en el  test de tipo " ?t " de momento ha obtenido una puntuacion de " ?*cont*  crlf)
 
)

(defrule pregunta_17
 	 (paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t FB)
     )
	 (test
        (eq ?p 17)
     )	 
=>
 

	 (if (eq ?r "NUNCA") 
	 	 then (bind ?*cont* (suma ?*cont* 1))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )
	 
	 (if (eq ?r "MUY POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 2))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )

	 (if (eq ?r "UN POCO") 
	 	 then (bind ?*cont* (suma ?*cont* 3))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )
	 (if (eq ?r "MUCHISIMO") 
	 	 then (bind ?*cont* (suma ?*cont* 4))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )

	 (if (eq ?r "TODO EL TIEMPO") 
	 	 then (bind ?*cont* (suma ?*cont* 5))
 		 (printout t  "El total es "  ?*cont* crlf)
 
	 )	 


	 (printout t "El paciente  en el  test de tipo " ?t " de momento ha obtenido una puntuacion de  " ?*cont*  crlf)

	
)

(defrule diagnostico1 
	(paciente (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	(cuestionario (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	(test
        (eq ?t FB)
    )
	
	(test
      (eq ?p 1)
     )
	
 
=>
	(if (<= ?*total* 17) 
	then 
	(printout t  "yuuydf" ?*total* crlf )
	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosFB "a")
 
	(printout DiagnosticosFB   " Diagnostico de paciente: " $?n "  " $?a "  Los síntomas que presenta no son suficientes para indicar la presencia de Fobia Social, por lo que es muy poco probable que padezca este trastorno." crlf)
	(close DiagnosticosFB) 
 
	)
 
	 
	(if 
		(and
			(>= ?*total* 18)   
			(<= ?*total* 34) 
		)
	 
	then
 	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosFB "a")
	(printout DiagnosticosFB  "Diagnostico de paciente: " $?n "  " $?a " Usted presenta una sintomatología leve Fobia Social, por lo que es muy poco probable que actualmente tenga esta patología. Le recomendamos hablar con un profesional de salud mental si estos síntomas persisten por más de un mes o si en el futuro se agregan otros síntomas." crlf)
	(close DiagnosticosFB)  
	)
 	
	(if 
		(and
		(>= ?*total* 35)   
		(<= ?*total* 51) 
		)
	 
	then
 	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosFB "a")
	(printout DiagnosticosFB  "Diagnostico de paciente: " $?n "  " $?a " Le sugerimos que solicite una evaluación por médico psiquiatra, ya que usted podría estar cursando con una Fobia Social." crlf)
	(close DiagnosticosFB)  
	)
 	
	(if 
		(and
		(>= ?*total* 52)   
		(<= ?*total* 68) 
 
		)
	then
 	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosFB "a")
	(printout DiagnosticosFB  "Diagnostico de paciente: " $?n "  " $?a " Los resultados indican que usted tiene una alta probabilidad de padecer fobia social por lo que se recomienda la terapia conversacional y los antidepresivos para  aumentar la confianza y mejorar la capacidad de interactuar con otras personas." crlf)
	(close DiagnosticosFB)  
	)

	(if 
		(and
		(>= ?*total* 69)   
		(<= ?*total* 85) 
 
		)
	 
	then
 	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosFB "a")
	(printout DiagnosticosFB  "Diagnostico de paciente: " $?n "  " $?a " Usted padece de fobia social!! por lo que por su bienestar se exige que acuda inmediatamente a una clínica u hospital más cercano con la compañía de algún familiar" crlf)
	(close DiagnosticosFB) 
	)
 
 
	;(bind ?*total* 0)
 
 
	 
) 



(defrule pregunta_18
	(paciente2 (codigo ?c2) (nombres $?n2) (apellidos $?a2) (edad ?e2))
	(cuestionario2 (codigo ?ct2) (codigopaciente ?cp2) (respuesta ?r2)(tipo ?t2) (pregunta ?p2))
	 (test
        (eq ?t2 AU)
     )
	 (test
        (eq ?p2 18)
     )	 
=>
	(if 
		(eq ?r2 "1") 
	then (bind ?*aux* (suma ?*aux* 1))
	(printout t  "El total es "  ?*aux* crlf)
 
	)
	 
	 (if (eq ?r2 "2") 
	 then (bind ?*aux* (suma ?*aux* 2))
 		 (printout t  "El total es "  ?*aux* crlf)
 		 
	 )

	 (if (eq ?r2 "3") 
	 then (bind ?*aux* (suma ?*aux* 3))
 		 (printout t  "El total es "  ?*aux* crlf)
 
	 )
	 (if (eq ?r2 "4") 
	 then (bind ?*aux* (suma ?*aux* 4))
 		 (printout t  "El total es "  ?*aux* crlf)
 
	 )
	(printout t "El paciente en el  test de tipo " ?t2 " de momento ha obtenido una puntuacion de  " ?*aux*  crlf)
	(bind ?*total2* ?*aux*)
	(bind ?*aux* 0)
 

)


(defrule pregunta_19
	(paciente2 (codigo ?c2) (nombres $?n2) (apellidos $?a2) (edad ?e2))
	(cuestionario2 (codigo ?ct2) (codigopaciente ?cp2) (respuesta ?r2)(tipo ?t2) (pregunta ?p2))
	 (test
        (eq ?t2 AU)
     )
	 (test
        (eq ?p2 19)
     )	 
=>
	 (if (eq ?r2 "1") 
	 	then (bind ?*aux* (suma ?*aux* 1))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 
	 (if (eq ?r2 "2") 	
	 	then (bind ?*aux* (suma ?*aux* 2))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

	 (if (eq ?r2 "3") 	
	 	then (bind ?*aux* (suma ?*aux* 3))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 (if (eq ?r2 "4") 	
	 	then (bind ?*aux* (suma ?*aux* 4))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

 
	 (printout t "El paciente en el  test de tipo " ?t2 " de momento ha obtenido una puntuacion de  " ?*aux*  crlf)
 
)

(defrule pregunta_20
	(paciente2 (codigo ?c2) (nombres $?n2) (apellidos $?a2) (edad ?e2))
	(cuestionario2 (codigo ?ct2) (codigopaciente ?cp2) (respuesta ?r2)(tipo ?t2) (pregunta ?p2))
	 (test
        (eq ?t2 AU)
     )
	 (test
        (eq ?p2 20)
     )	 
=>
	 (if (eq ?r2 "1") 	
	 	then (bind ?*aux* (suma ?*aux* 1))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 
	 (if (eq ?r2 "2") 	
	 	then (bind ?*aux* (suma ?*aux* 2))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

	 (if (eq ?r2 "3") 	
	 	then (bind ?*aux* (suma ?*aux* 3))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 (if (eq ?r2 "4") 	
	 	then (bind ?*aux* (suma ?*aux* 4))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

 
	 (printout t "El paciente en el  test de tipo " ?t2 " de momento ha obtenido una puntuacion de  " ?*aux*  crlf)
 
)
(defrule pregunta_21
	(paciente2 (codigo ?c2) (nombres $?n2) (apellidos $?a2) (edad ?e2))
	(cuestionario2 (codigo ?ct2) (codigopaciente ?cp2) (respuesta ?r2)(tipo ?t2) (pregunta ?p2))
	 (test
        (eq ?t2 AU)
     )
	 (test
        (eq ?p2 21)
     )	 
=>
	 (if (eq ?r2 "1")	
	 	 then (bind ?*aux* (suma ?*aux* 1))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 
	 (if (eq ?r2 "2") 	
	 	then (bind ?*aux* (suma ?*aux* 2))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

	 (if (eq ?r2 "3") 	
	 	then (bind ?*aux* (suma ?*aux* 3))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 (if (eq ?r2 "4") 	
	 	then (bind ?*aux* (suma ?*aux* 4))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

 
	 (printout t "El paciente en el  test de tipo " ?t2 " de momento ha obtenido una puntuacion de  " ?*aux*  crlf)
 
)

(defrule pregunta_22
	(paciente2 (codigo ?c2) (nombres $?n2) (apellidos $?a2) (edad ?e2))
	(cuestionario2 (codigo ?ct2) (codigopaciente ?cp2) (respuesta ?r2)(tipo ?t2) (pregunta ?p2))
	 
	 (test
        (eq ?t2 AU)
     )
	 (test
        (eq ?p2 22)
     )	 
=>
	 (if (eq ?r2 "1")	
	 	 then (bind ?*aux* (suma ?*aux* 1))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 
	 (if (eq ?r2 "2") 	
	 	then (bind ?*aux* (suma ?*aux* 2))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

	 (if (eq ?r2 "3") 	
	 	then (bind ?*aux* (suma ?*aux* 3))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 (if (eq ?r2 "4") 	
	 	then (bind ?*aux* (suma ?*aux* 4))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

 
	 (printout t "El paciente en el  test de tipo " ?t2 " de momento ha obtenido una puntuacion de  " ?*aux*  crlf)
 
)

(defrule pregunta_23
	(paciente2 (codigo ?c2) (nombres $?n2) (apellidos $?a2) (edad ?e2))
	(cuestionario2 (codigo ?ct2) (codigopaciente ?cp2) (respuesta ?r2)(tipo ?t2) (pregunta ?p2))
	 (test
        (eq ?t2 AU)
     )
	 (test
        (eq ?p2 23)
     )	 
=>

 
	 (if (eq ?r2 "1") 	
	 	then (bind ?*aux* (suma ?*aux* 1))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 
	 (if (eq ?r2 "2")	
		then (bind ?*aux* (suma ?*aux* 2))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

	 (if (eq ?r2 "3") 	
	 	then (bind ?*aux* (suma ?*aux* 3))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )
	 (if (eq ?r2 "4") 	
	 	then (bind ?*aux* (suma ?*aux* 4))
 		 (printout t  "El total es "  ?*aux* crlf)
	 )

 
	 (printout t "El paciente en el  test de tipo " ?t2 " de momento ha obtenido una puntuacion de  " ?*aux*  crlf)

	
)



(defrule diagnostico2 
	 (paciente2 (codigo ?c) (nombres $?n) (apellidos $?a) (edad ?e))
	 (cuestionario2 (codigo ?ct) (codigopaciente ?cp) (respuesta ?r) (tipo ?t) (pregunta ?p))
	 (test
        (eq ?t AU)
     )
	 (test
      (eq ?p 18)
     )
	 
 
=>
	(if (<= ?*total2* 5) 	
  
	then (open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosAU "a")
 
	(printout DiagnosticosAU "Diagnostico de paciente: " $?n "  " $?a "  Usted tiene baja Autoestima por lo que se recomienda trabajar y confiar en usted mismo  y además  acudir a un psiquiatra" crlf)
	(close DiagnosticosAU) 
	
 
	)

 
	 
	(if 
		(and
			(>= ?*total2* 6)   
			(<= ?*total2* 10) 
		)
	 
	then
	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosAU "a")
	(printout DiagnosticosAU  "Diagnostico de paciente: " $?n "  " $?a " Usted tiene una  Autoestima media baja  por lo que se recomienda identificar sus miedos y no compararse con los demás, el ejercicio igual ayuda y de ser necesario     acudir a un psiquiatra" crlf)
	(close DiagnosticosAU)  
	 
	)
	
	(if 
		(and
			(>= ?*total2* 11)   
			(<= ?*total2* 15) 
		)
	 
	then
	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosAU "a")
	(printout DiagnosticosAU  "Diagnostico de paciente: " $?n "  " $?a " Usted tiene una  Autoestima media alta   por lo que si en algún momento se siente mal sólo se  recomienda  distraerse y hacer lo que le guste" crlf)
	(close DiagnosticosAU) 
	)
	
	(if 
		(and
			(>= ?*total2* 16)   
			(<= ?*total2* 20) 
 
		)
	then
	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosAU "a") 
	(printout DiagnosticosAU   "Diagnostico de paciente: " $?n "  " $?a "Usted se encuentra emocionalmente estable y fuera de peligro siga así" crlf)
	(close DiagnosticosAU)

	)

	(if 
		(and
			(>= ?*total2* 21)   
			(<= ?*total2* 24) 
 
		)
	then
	(open "C://Users//Adrian//Desktop//Flask//app//Base-Conocimiento-Sistemas.csv" DiagnosticosAU "a") 
	(printout DiagnosticosAU   "Diagnostico de paciente: " $?n "  " $?a "Felicidades usted tiene una autoestima alta a sonreirle a la vida" crlf)
	(close DiagnosticosAU)

	)
	

	;(bind ?*aux* 0)	
 
)
 


 
 




 