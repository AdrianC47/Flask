(deftemplate persona
    (slot codigo
        (type INTEGER)
        (range 1 13373)
        (default 1)
    )
    (slot nombre
        (type STRING)
        (default ?DERIVE)
    )
    (slot apellido
        (type STRING)
        (default ?DERIVE)
    )    
)

(defrule codigo-impar
    (persona (codigo ?c) (nombre ?n) (apellido ?a))
    (test
        (!= 0 (mod ?c 2))
    )
=>
    (assert (codigo-impar ?c))
    (assert (pertenece-a ?c ?n ?a))
)