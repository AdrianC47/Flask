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
        entorno.clear 
        entorno.load('Base-Conocimiento-Sistemas.clp')#Cargo mi base de conocimiento
        return render_template('Test1.html', resultadoCarga='Exitoso', estado=True)#Estas variables usualmente son enviadas a los archivos html
    except Exception:
        traceback.print_exc()
    return "<h1>Error al cargar Base</h1>"

@app.route('/Test2')
def cargarTest_2():
    print('Cargar BD')
   
    try:
        entorno.load('Base-Conocimiento-Sistemas.clp')#Cargo mi base de conocimiento
        return render_template('Test2.html', resultadoCarga='Exitoso', estado=True)
    except Exception:
        traceback.print_exc()
    return "<h1>Error al cargar Base</h1>"


def crearPtest1():
    if request.method=='POST':
        codigo = request.form.get('codigo', default=-1, type=int)
        nombre = request.form.get('nombre', default='vacio', type=str)
        apellido = request.form.get('apellido', default='vacio', type=str)
        edad = request.form.get('edad', default='1', type=int)
        #template = entorno.find_template('persona')
        clase = entorno.find_class('paciente')
        print(clase)
        #print(template)
        #hecho = template.assert_fact(codigo=codigo, nombre=nombre, apellido=apellido)
        instancia = clase.make_instance('instance-name',codigo=codigo, nombre=nombre, apellido=apellido, edad=edad)
        retval = instancia.send('handler')
        #print('Hecho: ', hecho)
        assert retval == 3

        for instancia in entorno.instances():
            print(instancia)
        entorno.run()

        ##res = '<table border=\'3\'>'

        res = ''
        instancias = []
        for h in entorno.instances():
            ##res+='<tr><td>'+str(h)+'</td></tr>'
            res+=str(h)
            instancias.append(str(h))

        #res = ''
        #hechos = []
        #for h in entorno.facts():
            ##res+='<tr><td>'+str(h)+'</td></tr>'
         #   res+=str(h)
          #  hechos.append(str(h))

        
        
        ##res+='</table>'

        return render_template('listadoHechos.html', tam=len(instancias), lista=instancias)

    return ""
 

if __name__ =='__main__':
    app.run(debug=True,port=5000)