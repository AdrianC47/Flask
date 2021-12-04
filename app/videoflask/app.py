from flask import Flask, render_template, request, url_for, redirect, jsonify #Clase importada 
from flask_mysqldb import MySQL

app =Flask (__name__) #Inicializamos la aplicacion

# Conexión MySQL
app.config['MYSQL_HOST'] ='localhost'
app.config['MYSQL_USER'] ='root'
#app.config['MYSQL_PASSWORD'] ='hola'
app.config['MYSQL_DB'] ='sistemas'

conexion=MySQL(app) #Con esto creo que el vinculo necesario entre la 
#aplicacion y mi conexion con Mysql 


@app.before_request
def before_request():
    print('Antes de la petición.....')

@app.after_request 
def after_request(response):
    print('Despues de la petición')
    return response


@app.route('/')
def index():
    #return "<h1>Hello Friend - Es un momento emocionante en el mundo </h1>"
    cursos = ['PHP', 'Python', 'Java', 'Kotlin', 'Dart', 'JavaScript']
    data={
        'titulo':'Sistemas Expertos',
        'bienvenida':'!Saludos!',
        'cursos':cursos,
        'numero_cursos':len(cursos)
    }
    return render_template('index.html', data = data)

@app.route('/contacto/<nombre>/<int:edad>')
def contacto(nombre,edad):
    data = {
        'titulo':'Contacto',
        'nombre':nombre,
        'edad':edad
    }
    return render_template('contacto.html', data=data)

def query_string():
    print(request) #el request es la solicitud que hace el cliente
    print(request.args)#imprimimos los argumentos del request
    print(request.args.get('param1')) 
    print(request.args.get('param2')) 
    return "Okey pankey"


@app.route('/pacientes')
def listar_cursos():
    data =  {}
    try:
        print('holi')
        cursor=conexion.connection.cursor()
        sql="SELECT codigo, nombre, genero FROM  pacientes  ORDER BY codigo ASC" 
        cursor.execute(sql)
        pacientes=cursor.fetchall()
        #print(pacientes)
        #datos={
        #    'pacientes':pacientes
        #}
        data['pacientes']= pacientes 
        #return render_template('pacientes.html', datos=datos)

        data['mensaje'] = 'Exito'
    except Exception as ex: 
        data ['mensaje']='Error.....'
    return jsonify(data)

def  pagina_no_encontrada(error):
    #return render_template('404.html'),404
    return redirect(url_for('index')) #redirije a la pagina de inicio 
if __name__ =='__main__':# Comprobamos si estamos desde el archivo inicial (Archivo main)
    app.add_url_rule('/query_string',view_func=query_string)
    app.register_error_handler(404,pagina_no_encontrada)
    app.run(debug=True,port=5000)