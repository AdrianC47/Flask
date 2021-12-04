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
def cargarBC():
    print('Cargar BD')
   
    try:
        entorno.load('Base-Conocimiento-Sistemas.clp')#Cargo mi base de conocimiento
        return render_template('Test1.html', resultadoCarga='Exitoso', estado=True)
    except Exception:
        traceback.print_exc()
    return "<h1>Error al cargar Base</h1>"

 


app.run(debug=True,port=5000)