// Codigo basado en ej_00_processing_recibe_numeros x montoyamoraga (v0.0.1 mayo 2022)
// Hecho con Arduino Uno y IDE 1.8.19

// Recursos adicionales: clase-08-ejemplo-p5js-elipse        x montoyamoraga
//                       https://forum.arduino.cc/
//                       Examples/04. Communication/VirtualColorMixer

// REPRESENTACION DIGITAL DE LEDS CONECTADOS A BREADBOARD

// 3 LEDs (VERDE, ROJO, AZUL), 1 POTENCIOMETRO, 1 PULSADOR

// ELIPSE VERDE NIVELA COLOR CON POTENCIOMETRO
// ELIPSE ROJO APARECE CUANDO POTENCIOMETRO ESTA A NIVEL MEDIO
// ELIPSE AZUL APARECE CUANDO POTENCIOMETRO ESTA A NIVEL ALTO Y ELIPSE VERDE PARPADEA
// ELIPSE AZUL PARPADEA Y VERDE DESAPARECE CUANDO PULSADOR ESTA APRETADO


// importar biblioteca para comunicacion serial
import processing.serial.*;

// declarar nueva variable puerto de clase Serial
Serial puerto;

// declarar variable para elegir puerto serial del Arduino
int numeroPuerto = 1;

// declarar variable para boton
float valorBoton = 0;

// declarar variable para nivel de negro
float valorColor = 0;

// declara variable para diametro elipse
float valorDiametro = 100;

// variable para pausa de intermitencia
long intervalo = 200;

long tiempoAnterior = 0;
long tiempoActual = 0;

// setup() ocurre una vez, al principio
void setup() {

  // crear lienzo de 400px ancho y 200px altura
  size(1080, 800);

  // imprimir en consola todos los puertos seriales disponibles
  printArray(Serial.list());

  // abrir puerto serial correspondiente , a tasa de 9600 baud
  puerto = new Serial(this, Serial.list()[numeroPuerto], 9600);

  // generar un nuevo evento de lectura cuando se recibe caracter "nueva linea"
  puerto.bufferUntil('\n');
}

void draw() {

  // fondo negro
  background(0);

  // ELIPSE VERDE

  // controlar nivel de negro-verde con potenciometro
  fill(0, valorColor, 0);

  // si el boton no esta presionado y potenciometro al maximo: Elipse verde parpadea.
  if (valorBoton == 0 && valorColor > 249) {

    // actualizar tiempo actual
    tiempoActual = millis();

    // comprobar si tiempo transcurrido es mayor que intervalo
    if (tiempoActual - tiempoAnterior >= intervalo) {

      // actualizar tiempo previo
      tiempoAnterior = tiempoActual;

      // Quitar color
      fill(0, 0, 0);
    }
  }

  // si el boton esta presionado y potenciometro al maximo: Elipse verde desaparece
  if (valorBoton ==1 && valorColor > 249) {
    // negro
    fill(0, 0, 0);
  }

  // dibujar elipse a la derecha de la pantalla
  // ellipse(posX, posY, diametroX, diametroY);
  ellipse(850, height/2, valorDiametro, valorDiametro);


  // ELIPSE ROJO

  // elipse rojo aparece con potenciometro a mas de la mitad
  if (valorColor > 125) {
    fill(valorColor, 0, 0);
  }
  // color rojo desaparece con potenciometro a menos de la mitad
  else {
    // negro
    fill(0, 0, 0);
  }

  // dibujar elipse al medio de la pantalla
  // ellipse(posX, posY, diametroX, diametroY);
  ellipse(520, height/2, valorDiametro, valorDiametro);


  // ELIPSE AZUL

  // elipse azul aparece si potenciometro al maximo
  if (valorColor > 249) {
    fill(0, 0, valorColor);

    // si boton esta apretado, elipse azul aparece y desaparece
    if (valorBoton == 1 ) {

      // actualizar tiempo actual
      tiempoActual = millis();

      // comprobar si tiempo transcurrido es mayor que intervalo
      if (tiempoActual - tiempoAnterior >= intervalo) {

        // actualizar tiempo previo
        tiempoAnterior = tiempoActual;
        // quitar color
        fill(0, 0, 0);
      }
    }
  }

  // elipse azul desaparece si nivel de potenciometro menos del maximo
  else {
    fill(0, 0, 0);
  }

  // dibujar elipse a la izquierda de la pantalla
  // ellipse(posX, posY, diametroX, diametroY);
  ellipse(230, height/2, valorDiametro, valorDiametro);
}

// evento serial
void serialEvent(Serial myPort) {

  // leer String ASCII hasta caracter nueva linea
  String entrada = myPort.readStringUntil('\n');

  // si entrada no esta vacia
  if (entrada != null) {

    // borrar caracteres blancos
    entrada = trim(entrada);

    // separar por comas y crear un arreglo de numeros float
    float[] datos = float(split(entrada, ","));

    // si el arreglo tiene al menos dos elementos, llego bien
    if (datos.length >= 2) {
      // map them to the range 0-255:

      // asignar elemento 1 de la entrada de boton
      valorBoton = datos[1];

      // asignar elemento 0 a la entrada de color
      // y mapear desde rango [0,1023] a rango [0, width]
      valorColor = map(datos[0], 0, 1023, 0, 250);
    }
  }
}
