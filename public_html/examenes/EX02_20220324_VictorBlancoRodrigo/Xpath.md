# XPATH
## A - Nombre de los alumnos que han aprobado la 1º evaluacion del modulo SINF
//alumno[expediente=//calificacion[@]/@expediente]/nombre/text()

## B - Lista las siglas de los modulos de aquellos alumnos que han aprobado las tres evaluaciones.


## C - Nombre de los modulos impartidos por Antonio Ramos Garcia
//modulo[@codigo=//profesor[.="Antonio Ramos Garcia"]/@codigo]/nombre/text()


##    D - Cuantos alumnos estudian 
count(//alumno[expediente=//boletin/calificacion[@sigla=//modulo[nombre="Entornos de Desarrollo"]/@codigo]/@expediente])