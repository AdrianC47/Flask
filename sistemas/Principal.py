import clips
import traceback
from flask import Flask, render_template, request, url_for, redirect, jsonify #Clase importada 
from flask_mysqldb import MySQL

app = Flask(__name__)
entorno = clips.Environment()


@app.route('/')
@app.route('/index')
def indice ():
   # return '<h1> Transtornos Mentales</h1>'
   return render_template('indice.html')



@app.route('/cargarBaseConocimiento')
def cargarBC():
   print('Cargar BD')


   try:
        entorno.load('BaseConocimiento.clp')
        return render_template('generacionHechos.html', resultadoCarga='Exitoso', estado=True)
   except Exception:
        traceback.print_exc()
   return "<h1>Error al cargar Base</h1>"


@app.route('/crearPersona', methods=['GET', 'POST'])
def crearPersona():
    if request.method=='POST':
        codigo = request.form.get('codigo', default=-1, type=int)
        nombre = request.form.get('nombre', default='vacio', type=str)
        apellido = request.form.get('apellido', default='vacio', type=str)

        template = entorno.find_template('persona')
        print(template)
        hecho = template.assert_fact(codigo=codigo, nombre=nombre, apellido=apellido)
        print('Hecho: ', hecho)
        entorno.run()

        #res = '<table border=\'3\'>'
        res = ''
        hechos = []
        for h in entorno.facts():
            #res+='<tr><td>'+str(h)+'</td></tr>'
            res+=str(h)
            hechos.append(str(h))

        
        
        #res+='</table>'

        return render_template('listadoHechos.html', tam=len(hechos), lista=hechos)

    return ""
@app.route('/Holi' , methods=['GET', 'POST'])

def Holi():
    if request.method=='POST':
        print('Hoy es un gran dia para morir')
    return "<h1>Tengo hamble</h1>"
app.run(debug=True,port=5000)