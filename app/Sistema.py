import clips
import traceback
from flask import Flask, render_template, request, url_for, redirect, jsonify #Clase importada 
from flask_mysqldb import MySQL


app = Flask(__name__)
entorno = clips.Environment()


@app.route('/')
@app.route('/index')
def indice ():
     
     return render_template('index.html')


@app.route('/Test1')
def cargarTest_1():
    print('Cargar BD')
   
    
    try:
         
        
       # entorno.load('Base-Conocimiento-Sistemas.clp')#Cargo mi base de conocimiento
        return render_template('Test1.html', resultadoCarga='Exitoso', estado=True)#Estas variables usualmente son enviadas a los archivos html
    except Exception:
        traceback.print_exc()
    return "<h1>Error al cargar Base</h1>"

@app.route('/Test2')
def cargarTest_2():
   
    print('Cargar BD')
    
    try:
       
        #entorno.load('Base-Conocimiento-Sistemas.clp')#Cargo mi base de conocimiento
        return render_template('Test2.html', resultadoCarga='Exitoso', estado=True)
        
    except Exception:
        traceback.print_exc()
    return "<h1>Error al cargar Base</h1>"

@app.route('/Diagnostico')
def  Diagnostico():
    try:
        
        return "<h1>Datos cargados</h1>"

    except Exception:
        traceback.print_exc()
    return "<h1> alv ya sueño </h1>"



 
         
    
@app.route('/crearPtest1', methods=['GET', 'POST'])    
def crearPtest1(): 
    
    entorno.load('Base-Conocimiento-Sistemas.clp')#Cargo mi base de conocimiento
    if request.method=='POST':
        codigo = request.form.get('codigo',  type=int)
        nombre = request.form.get('nombre')
        nombre2 = None
 
        apellido = request.form.get('apellido', default='vacio', type=str)
        edad = request.form.get('edad', default='1', type=float)
        respuesta1 = request.form.get ('respuesta1', default='NUNCA',type=str)
        respuesta2 = request.form.get ('respuesta2', default='NUNCA',type=str)
        respuesta3 =request.form.get ('respuesta3', default='NUNCA',type=str)
        respuesta4 = request.form.get ('respuesta4', default='NUNCA',type=str)
        respuesta5 =request.form.get ('respuesta5', default='NUNCA',type=str)
        respuesta6 =request.form.get ('respuesta6', default='NUNCA',type=str)
        respuesta7 =request.form.get ('respuesta7', default='NUNCA',type=str)
        respuesta8 =request.form.get ('respuesta8', default='NUNCA',type=str)
        respuesta9 =request.form.get ('respuesta9', default='NUNCA',type=str)
        respuesta10 =request.form.get ('respuesta10', default='NUNCA',type=str)
        respuesta11 =request.form.get ('respuesta11', default='NUNCA',type=str)
        respuesta12 =request.form.get ('respuesta12', default='NUNCA',type=str)
        respuesta13 =request.form.get ('respuesta13', default='NUNCA',type=str)
        respuesta14 =request.form.get ('respuesta14', default='NUNCA',type=str)
        respuesta15 =request.form.get ('respuesta15', default='NUNCA',type=str)
        respuesta16 =request.form.get ('respuesta16', default='NUNCA',type=str)
        respuesta17 =request.form.get ('respuesta17', default='NUNCA',type=str)
       # template = entorno.find_template('paciente')
        clasepaciente = entorno.find_class('paciente')
        clasecuestionario = entorno.find_class('cuestionario')
        print(clasepaciente)
        print(clasecuestionario)
        #print(template)
        #hecho = template.assert_fact(codigo=codigo, nombre=nombre, apellido=apellido)
     
        instanciap = clasepaciente.make_instance('paciente01',codigo=codigo, nombres=(nombre,""), apellidos=(apellido,""), edad=edad)
        instancia1 = clasecuestionario.make_instance('cuestionario1p1',codigo=1, codigopaciente=codigo, respuesta =respuesta1, tipo= "FB" ,pregunta=1)
        instancia2 = clasecuestionario.make_instance('cuestionario1p2',codigo=1, codigopaciente=codigo, respuesta =respuesta2, tipo="FB" ,pregunta=2)
        instancia3 = clasecuestionario.make_instance('cuestionario1p3',codigo=1, codigopaciente=codigo, respuesta =respuesta3, tipo="FB" ,pregunta=3)
        instancia4 = clasecuestionario.make_instance('cuestionario1p4',codigo=1, codigopaciente=codigo, respuesta =respuesta4, tipo="FB" ,pregunta=4)
        instancia5 = clasecuestionario.make_instance('cuestionario1p5',codigo=1, codigopaciente=codigo, respuesta =respuesta5, tipo="FB" ,pregunta=5)
        instancia6 = clasecuestionario.make_instance('cuestionario1p6',codigo=1, codigopaciente=codigo, respuesta =respuesta6, tipo="FB" ,pregunta=6)
        instancia7 = clasecuestionario.make_instance('cuestionario1p7',codigo=1, codigopaciente=codigo, respuesta =respuesta7, tipo="FB" ,pregunta=7)
        instancia8 = clasecuestionario.make_instance('cuestionario1p8',codigo=1, codigopaciente=codigo, respuesta =respuesta8, tipo="FB" ,pregunta=8)
        instancia9 = clasecuestionario.make_instance('cuestionario1p9',codigo=1, codigopaciente=codigo, respuesta =respuesta9, tipo="FB" ,pregunta=9)
        instancia10 = clasecuestionario.make_instance('cuestionario1p10',codigo=1, codigopaciente=codigo, respuesta =respuesta10, tipo="FB" ,pregunta=10)
        instancia11 = clasecuestionario.make_instance('cuestionario1p11',codigo=1, codigopaciente=codigo, respuesta =respuesta11, tipo="FB" ,pregunta=11)
        instancia12 = clasecuestionario.make_instance('cuestionario1p12',codigo=1, codigopaciente=codigo, respuesta =respuesta12, tipo="FB" ,pregunta=12)
        instancia13 = clasecuestionario.make_instance('cuestionario1p13',codigo=1, codigopaciente=codigo, respuesta =respuesta13, tipo="FB" ,pregunta=13)
        instancia14 = clasecuestionario.make_instance('cuestionario1p14',codigo=1, codigopaciente=codigo, respuesta =respuesta14, tipo="FB" ,pregunta=14)
        instancia15 = clasecuestionario.make_instance('cuestionario1p15',codigo=1, codigopaciente=codigo, respuesta =respuesta15, tipo="FB" ,pregunta=15)
        instancia16 = clasecuestionario.make_instance('cuestionario1p16',codigo=1, codigopaciente=codigo, respuesta =respuesta16, tipo="FB" ,pregunta=16)
        instancia17 = clasecuestionario.make_instance('cuestionario1p17',codigo=1, codigopaciente=codigo, respuesta =respuesta17, tipo="FB" ,pregunta=17)
        retval = instanciap.send('handler')
        retval1 = instancia1.send('handler')
        retval2 = instancia2.send('handler')
        retval3 = instancia3.send('handler')
        retval4 = instancia4.send('handler')
        retval5 = instancia5.send('handler')
        retval6 = instancia6.send('handler')
        retval7 = instancia7.send('handler')        
        retval8 = instancia8.send('handler')
        retval9 = instancia9.send('handler')
        retval10 = instancia10.send('handler')
        retval11 = instancia11.send('handler')
        retval12 = instancia12.send('handler')
        retval13 = instancia13.send('handler')
        retval14 = instancia14.send('handler')
        retval15 = instancia15.send('handler')
        retval16 = instancia16.send('handler')
        retval17 = instancia17.send('handler')
        entorno.run()
        #print('Hecho: ', hecho)
 
        #assert retval == 1
        print('Paciente: ',instanciap)
    
        
        res = ''
        instancias = []

        for h in entorno.instances():
            res+=str(h)
            instancias.append("(make-instance" +str(h)+")")
            print(instanciap)
            
        
    
        return render_template('Diagnostico.html',tam=len(instancias),lista=instancias )
    #entorno.load('Base-Conocimiento-Sistemas.clp')
 
   
    return ""
@app.route('/crearPtest2', methods=['GET', 'POST'])    
def crearPtest2(): 
    entorno.load('Base-Conocimiento-Sistemas.clp')#Cargo mi base de conocimiento
    if request.method=='POST':
        codigo = request.form.get('codigo',  type=int)
        nombre = request.form.get('nombre')
        nombre2 = None
        apellido = request.form.get('apellido', default='vacio', type=str)
        edad = request.form.get('edad', default='1', type=float)
        respuesta1 = request.form.get ('respuesta1', default='1' )
        respuesta2 = request.form.get ('respuesta2', default='1' )
        respuesta3 =request.form.get ('respuesta3', default='1' )
        respuesta4 = request.form.get ('respuesta4', default='1' )
        respuesta5 =request.form.get ('respuesta5', default='1' )
        respuesta6 =request.form.get ('respuesta6', default='1' )
         
       # template = entorno.find_template('paciente')
        clasepaciente2 = entorno.find_class('paciente2')
        clasecuestionario2 = entorno.find_class('cuestionario2')
        print(clasepaciente2)
        print(clasecuestionario2)
        #print(template)
        #hecho = template.assert_fact(codigo=codigo, nombre=nombre, apellido=apellido)
     
        instanciap = clasepaciente2.make_instance('paciente02',codigo=codigo, nombres=(nombre,""), apellidos=(apellido,""), edad=edad)
        instancia1 = clasecuestionario2.make_instance('cuestionario1p1',codigo=1, codigopaciente=codigo, respuesta =respuesta1, tipo= "AU" ,pregunta=18)
        instancia2 = clasecuestionario2.make_instance('cuestionario1p2',codigo=1, codigopaciente=codigo, respuesta =respuesta2, tipo="AU" ,pregunta=19)
        instancia3 = clasecuestionario2.make_instance('cuestionario1p3',codigo=1, codigopaciente=codigo, respuesta =respuesta3, tipo="AU" ,pregunta=20)
        instancia4 = clasecuestionario2.make_instance('cuestionario1p4',codigo=1, codigopaciente=codigo, respuesta =respuesta4, tipo="AU" ,pregunta=21)
        instancia5 = clasecuestionario2.make_instance('cuestionario1p5',codigo=1, codigopaciente=codigo, respuesta =respuesta5, tipo="AU" ,pregunta=22)
        instancia6 = clasecuestionario2.make_instance('cuestionario1p5',codigo=1, codigopaciente=codigo, respuesta =respuesta6, tipo="AU" ,pregunta=23)
         
        retval = instanciap.send('handler')
        retval1 = instancia1.send('handler')
        retval2 = instancia2.send('handler')
        retval3 = instancia3.send('handler')
        retval4 = instancia4.send('handler')
        retval5 = instancia5.send('handler')
        retval6 = instancia6.send('handler')
 
        entorno.run()
        #print('Hecho: ', hecho)
 
        #assert retval == 1
        print('Paciente: ',instanciap)
    
        
        res = ''
        instancias = []

        for h in entorno.instances():
            res+=str(h)
            instancias.append("(make-instance" +str(h)+")")
            print(instanciap)
            
        
    
        return render_template('Diagnostico.html',tam=len(instancias),lista=instancias )
    #entorno.load('Base-Conocimiento-Sistemas.clp')
 
   
    return ""
if __name__ =='__main__':
    app.run(debug=True,port=5000)
 