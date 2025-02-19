#### Contenidos de este repositorio

* carpeta [codigo_arduino/](codigo_arduino/):
  * archivo 1 [codigo_arduino/sketch_may10a.ino](codigo_arduino/sketch_may10a.ino)
  * archivo 2 [codigo_arduino/sketch_220510a.pde](codigo_arduino/sketch_220510a.pde)
* carpeta [imagenes/](imagenes/):
  * archivo [/imagenes/1.1.JPG](/imagenes/1.1.JPG)
  * archivo [/imagenes/1.2.JPG](/imagenes/1.2.JPG)
  * archivo [/imagenes/2.1.JPG](/imagenes/2.1.JPG)
  * archivo [/imagenes/2.2.JPG](/imagenes/2.2.JPG)
  * archivo [/imagenes/2.3.JPG](/imagenes/2.3.JPG)
  * archivo [/imagenes/2.4.JPG](/imagenes/2.4.JPG)
  * archivo [/imagenes/2.5.JPG](/imagenes/2.5.JPG)
  * archivo [/imagenes/2.6.JPG](/imagenes/2.6.JPG)
  * archivo [/imagenes/3.1.JPG](/imagenes/3.1.JPG)
  * archivo [/imagenes/3.2.JPG](/imagenes/3.2.JPG)
  * archivo [/imagenes/3.3.JPG](/imagenes/3.3.JPG)
  * archivo [/imagenes/4.1.JPG](/imagenes/4.1.JPG)
  * archivo [/imagenes/4.2.JPG](/imagenes/4.2.JPG)
  * archivo [/imagenes/5.1.JPG](/imagenes/5.1.JPG)
  
* archivo [README.md](README.md)
____


# Acerca de

Proyecto ARTE VISUAL: EXPERIMENTANDO CON LA REPRESENTACION DIGITAL DE DIODOS EMISORES DE LUZ - visualizacion y principios de interfaz interactiva.

[Martes 10 de Mayo, 2022]

![6.1](imagenes/6.1.JPG)![6.2](imagenes/6.2.JPG)

<sub> x **Javier Burgos** para aud5i022-2022-1. Diseño de interfaz eletrònica mediante Arduino - DOCENTE: **Aaron Montoya Moraga** - FAU.UCHILE -  </sub> 
____
____


https://user-images.githubusercontent.com/101606177/176946329-887d1546-bbba-4c24-8994-70c97d95ccd0.mp4

____

#### Materiales

* 1 Arduino Uno
* 1 protoboard
* 1 potenciómetro
* 1 pulsador
* 4 resistencias
* 3 leds (verde, rojo, azul)
* cables


#### Software

* Arduino IDE 1.8.19
* Processing 4.0b8


____

![5.1](imagenes/5.1.JPG)

____

## Armado de circuito:

1.

Conectar dos cables desde Arduino.Uno a la protoboard:


* **5V** a canal positivo **+** 
* **GND** a canal negativo **-** 

![Arduino.Uno](imagenes/1.1.JPG) ![Protoboard](imagenes/1.2.JPG)

##
2.

Acoplar el pulsador al lado derecho de la protoboard y conectar 3 cables a las respectivas filas:


* Canal positivo conectado a **pin1** potenciometro (fila 1)
* Canal negativo conectado a **pin3** potenciometro (fila 5)

Desde Arduino.Uno:

* **A0** - conectado a **pin2** potenciometro (fila 3)

![2.1](imagenes/2.1.JPG) ![2.2](imagenes/2.2.JPG)
![2.3](imagenes/2.3.JPG) ![2.4](imagenes/2.4.JPG)
![2.5](imagenes/2.5.JPG) ![2.6](imagenes/2.6.JPG)



##
3. 

Acoplar LED verde, azul y rojo a la protoboard, resistencias y conectar cables a los respectivos pines:

LED VERDE
* **Digital 6** de Arduino.Uno a pin **positivo**
* Resistencia desde pin **negativo** a canal **negativo**

![3.1](imagenes/3.1.JPG)

LED ROJO
* **Digital 4** de Arduino.Uno a pin **positivo**
* Resistencia desde pin **negativo** a canal **negativo**

![3.2](imagenes/3.2.JPG)

LED AZUL
* **Digital 2** de Arduino.Uno a pin **positivo**
* Resistencia desde pin **negativo** a canal **negativo**

![3.3](imagenes/3.3.JPG)



##
4.

Acoplar pulsador a protoboard, resistencia y conectar cables a respectivos pines:

* Canal **positivo** de protoboard a pin **superior**
* **Digital 8** de Arduino.Uno a pin **inferior**
* Resistencia entre pin **inferior** y canal **negativo** de protoboard

![4.1](imagenes/4.1.JPG)![3.1](imagenes/4.2.JPG)


*Debido a la ubicacion del pulsador en la protoboard, en este caso, se utiliza un cable para unir el canal negativo superior con el canal negativo inferior.
**Este paso puede no ser necesario en otros modelos de protoboard**


##

https://user-images.githubusercontent.com/101606177/176938127-12be705b-e156-472e-882a-1f92a6f6f724.mp4



____

## Código para Arduino uno <br /> 
<sub> Controla LEDs por medio de potenciometro y pulsador </sub>


**Repositorio: [codigo_arduino/sketch_may10a.ino](codigo_arduino/sketch_may10a.ino).**
##

**-Código basado en:**

ej_06_perilla_mapeo x montoyamoraga (v0.0.1 abril 2022): <br />
<sub> [https://github.com/montoyamoraga/aud5i022-2022-1/tree/main/clases/clase-05/ej_06_perilla_mapeo](https://github.com/montoyamoraga/aud5i022-2022-1/tree/main/clases/clase-05/ej_06_perilla_mapeo) </sub>

##

-Recursos adicionales:

<sub> ej_02_pulsador_luz_intermitente_delay <br />
 [https://github.com/montoyamoraga/aud5i022-2022-1/tree/main/clases/clase-05/ej_02_pulsador_luz_intermitente_delay](https://github.com/montoyamoraga/aud5i022-2022-1/tree/main/clases/clase-05/ej_02_pulsador_luz_intermitente_delay). </sub>


<sub> ej_03_pulsador_luz_intermitente <br />
 [https://github.com/montoyamoraga/aud5i022-2022-1/tree/main/clases/clase-05/ej_03_pulsador_luz_intermitente](https://github.com/montoyamoraga/aud5i022-2022-1/tree/main/clases/clase-05/ej_03_pulsador_luz_intermitente) </sub>


<sub> **Arduino.cc** </sub>
* <sub> [https://forum.arduino.cc/t/using-millis-for-timing-a-beginners-guide/483573](https://forum.arduino.cc/t/using-millis-for-timing-a-beginners-guide/483573) </sub>
* <sub> [https://forum.arduino.cc/t/how-to-make-two-conditions-in-an-if-statement/202090](https://forum.arduino.cc/t/how-to-make-two-conditions-in-an-if-statement/202090) </sub>


##
##


### +Creamos:

* **pinEntrada** / pin de lectura de informaciòn anàloga. (Potenciometro)
* **pinBoton** / pin de lectura de informacion analoga. (Pulsador)
##
* **pinVER** / pin para controlar led VERDE.
* **pinRED** / pin para controlar led ROJO.
* **pinBLU** / pin para controar led AZUL.
##
* **estadoLED** / variable para almacenar estado led.
* **valorSensor** / variable para almacenar valor de potenciometro.
* **estadoBoton** / variable para almacenar estado de pulsador.
##
* **valorMin - ValorMax - rangoMin - rangoMax - valorMapeado** / variables para mapeo de valores.
##
* **intervalo**/ variable para valor de intermitencia.
* **tiempoAnterior - tiempoActual** / variables para almacenar valores de tiempo. 
##
### +En setup(): 
 
* **pinVER - pinRED - pinBLU** / salidas digitales. (LEDs)
* **pinBoton** / entrada analogo-digital. (Pulsador)
##
* Iniciar comunicacion serial 
##
### +En loop():


**Actualizamos:**


* Tiempo actual con la funcion **millis()**. (funcion nos entrega la cantidad de milisegundos desde que el programa esta trabajando) 
* Valor del potenciometro (**valorSensor**) con la funcion analogRead() sobre la variable pinEntrada.
* Valor del pulsador (**estadoBoton**) con la funcion digitalRead() sobre la variable pinBoton.
##
*  Usamos funcion **map()** para cambiar de rango los valores recibidos del potenciometro.
## 
* Imprimimos los valores (**Serial.print**) del potenciometro (**valorSensor**) y pulsador (**estadoBoton**).
## 
**Por medio de la condicion if:**
* Si valor del potenciometro es menor a 1020: 
  * Led verde encendido y ajustado a valores del potenciometro. (**pinVER**)
  * Led azul apagado. (**pinBLU**)


* De otro modo:
  * Si pulsador presionado:
    * Led verde apagado
    * Si tiempo actual es mayor al intervalo:
      * Cambiar estado de led azul entre apagado y encencido, por medio del operador booleadno "**!**".
  * De otro modo, led azul encendido.      
  * Si tiempo actual es mayor al intervalo:
    * Cambiar estado de led verde entre apagado y encendido, por medio del operador booleano "**!**". 
##
* Si valor del potenciometro es mayor a 512:
  * Led rojo encendido y ajustado a valores del potenciometro. (**pinRED**)
* De otro modo, led rojo apagado.

____   
____

## Codigo para Proccesing
<sub> Recibe y procesa datos desde arduino uno para generar visualizaciones. </sub>
  
**Repositorio: [codigo_arduino/sketch_220510a.pde](codigo_arduino/sketch_220510a.pde).**
##

**-Código basado en:**

ej_00_processing_recibe_numeros x montoyamoraga (v0.0.1 mayo 2022): <br />
<sub> [https://github.com/montoyamoraga/aud5i022-2022-1/tree/main/clases/clase-08/ej_00_processing_recibe_numeros](https://github.com/montoyamoraga/aud5i022-2022-1/tree/main/clases/clase-08/ej_00_processing_recibe_numeros) </sub>

##

-Recursos adicionales:

<sub>  clase-08-ejemplo-p5js-elipse <br />
 [https://github.com/aud5i022-2022-1/clase-08-ejemplo-p5js-elipse](https://github.com/aud5i022-2022-1/clase-08-ejemplo-p5js-elipse). </sub>

<sub> **Arduino.cc** </sub>
* <sub> [https://docs.arduino.cc/built-in-examples/communication/VirtualColorMixer](https://docs.arduino.cc/built-in-examples/communication/VirtualColorMixer) </sub>

##
##


### +Creamos:

* **numeroPuerto** / variable para elegir puerto serial. [**INGRESAR PUERTO CONECTADO A ARDUINO**]
##
* **valorBoton** / variable para almacenar valor del pulsador.
* **valorColor** / variable para nivel de negro-color seleccionado.
* **valorDiametro** / variable para el diametro del elipse.
##
* **intervalo** / variable para valor de intermitencia.
* **tiempoAnterior - tiempoActual** / variables para almacenar valores de tiempo. 
##
* Importar biblioteca para comunicacion serial. (**processing.serial**)
##
* Declarar variable para puerto de clase serial.
##

### +En setup(): 
 
* Definir dimensiones del display por medio de la funcion **size()**.
##
* Imprimir en consola todos los puertos seriales disponibles.
##
* Abrir puerto serial correspondiente a la tasa de 9600 baud. (Arduino Uno)
##
* Generar un nuevo evento de lectura cuando se recibe una nueva linea. (**'\n'**)
##

### +En serialEvent():

* Leer string ascii hasta caracter nueva linea
* Si la entrada no esta vacia:
  * Borrar caracteres blancos.
  * Separar por comas y crear un arreglo de numeros float. (**datos**)
  * Si el arreglo tiene 2 o mas elementos: 
    * Asignar elemento 1 (valor del pulsador) a variable **valorBoton**.
    * Asignar elemento 0 (valor del potenciometro) a variable **valorColor**.

##
### +En draw():

* Color del fondo del display.
* Actualizar tiempo actual.
##
* Elipse verde:
  * Controlar nivel de color por medio de varable **valorColor** (Potenciometro) 
  * Si pulsador no esta presionado y potenciometro al "maximo":
    * Si tiempo transcurrido es mayor al intervalo:
      * Actualizar tiempo previo. 
      * Elipse verde parpadea.
  * Si pulsador esta presionado y potenciometro al maximo:
    * Elipse desaparece.
  * Dibujar elipse.
##

* Elipse rojo:
  * Si nivel de potenciometro mayor a 125:
    * Elipse rojo aparece y controlado por medio de variable **valorColor** (Potenciometro)
  * De otro modo desaparece.
  * Dibujar elipse.
##
     
* Elipse azul:
  * Si nivel de potenciometro al maximo:
    * Elipse azul aparece.
    * Si pulsador esta presionado:
      * Actualizar tiempo previo
      * Elipse azul parpadea.
  * De otro modo desaparece.    
  * Dibujar elipse.         

____ 
____

## Conclusiones

Aprendizajes: 

* Circuito conectado de un potenciometro, botón pulsador y 3 leds.
* Aplicacion de millis() para lograr intermitencia en la luz.
* Proyeccion digital de los diodos y sus cambios.   


Las dificultades de este proyecto fueron escribir el readme file y los comentarios dentro del codigo. 


El circuito funciona con 2 resistencias. Al utilizar solo una dejo de funcionar, problema fue resuelto de este modo y no se siguio investigando.
Version 1.1 se llevo a cabo con 4 resistencias, 2 extras: conectando LED rojo y azul con el canal negativo, por razones esteticas mas que nada.


Se trato de encontrar otro modo de lograr la intermitencia en los elipses verde y azul, no se ha logrado por el momento, investigacion abierta.

Este proyecto permite interiorizarse en el desarollo de visuales y displays interactivos, tanto con arduino uno, como con mouse, teclado, etc. 
* Conectar inputs analogos con respuestas y cambios digitales. 
* Lograr representaciones virtuales que simulen cambios fisicos (ej.luz) en el espacio.
  * Posible aplicacion para lograr una experiencia inmersiva y/o conectar-controlar los cambios, tanto digitales como analogos (visuales y luces).

____
____

