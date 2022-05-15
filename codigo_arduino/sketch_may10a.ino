// Codigo basado en ej_06_perilla_mapeo x montoyamoraga (v0.0.1 abril 2022)
// Hecho con Arduino Uno y IDE 1.8.19

// Recursos adicionales: ej_02_pulsador_luz_intermitente_delay
//                       ej_03_pulsador_luz_intermitente        x montoyamoraga
//                       https://forum.arduino.cc/*
//                       https://forum.arduino.cc/t/using-millis-for-timing-a-beginners-guide/483573
//                       https://forum.arduino.cc/t/how-to-make-two-conditions-in-an-if-statement/202090

// 3 LEDs (VERDE, ROJO, AZUL), 1 POTENCIOMETRO, 1 PULSADOR

// LED VERDE NIVELA BRILLO CON POTENCIOMETRO
// LED ROJO ENCIENDE CUANDO POTENCIOMETRO ESTA A NIVEL MEDIO
// LED AZUL ENCIENDE CUANDO POTENCIOMETRO ESTA A NIVEL ALTO Y LED VERDE PARPADEA
// LED AZUL PARPADEA Y LED VERDE SE APAGA CUANDO PULSADOR ESTA APRETADO


// Arduino Uno x Potenciometro
// 5V conectado a pin1 potenciometro (fila 1)
// A0 conectado a pin2 potenciometro (fila 3)
// GND conectado a pin3 potenciometro (fila 5)



// LED VERDE conectado a digital 6
// LED ROJO conectado a digital 4
// LED AZUL conectado a digital 2


// variable para pin de lectura información análoga
int pinEntrada = A1;
int pinBoton = 8;

// pin de Arduino para cada led
int pinVER = 6;
int pinRED = 4;
int pinBLU = 2;

// variable para almacenar estado led
int estadoLED = 0;

// variable para valor de potenciometro
int valorSensor = 0;

// variable para almacenar estado pulsador
int estadoBoton = 0;

// Mapeo
int valorMin = 0;
int valorMax = 1024;

int rangoMin = 0;
int rangoMax = 255;

int valorMapeado = 0;

// variable para pausa de intermitencia
const long intervalo = 100;

unsigned long tiempoAnterior = 0;
unsigned long tiempoActual = 0;



void setup() {

  // definir pin como salida digital
  pinMode(pinVER, OUTPUT);
  pinMode(pinRED, OUTPUT);
  pinMode(pinBLU, OUTPUT);

  pinMode(pinBoton, INPUT);




  // abrir comunicacion serial
  Serial.begin(9600);
}

void loop() {

  // actualizar tiempo actual
  tiempoActual = millis();

  // actualizar valor sensor
  valorSensor = analogRead(pinEntrada);

  // actualizar valor minimo
  if (valorSensor < valorMin) {
    valorMin = valorSensor;
  }

  if (valorSensor > valorMax) {
    valorMax = valorSensor;
  }

  // mapear valor
  valorMapeado = map(valorSensor, valorMin, valorMax, rangoMin, rangoMax);

  // leer pin y actualizar variable interna
  estadoBoton = digitalRead(pinBoton);


  // imprimir valores min y max
  // Serial.print("actual, min, max, mapeado: ");
  Serial.print(valorSensor);
  Serial.print(", ");
  Serial.print(estadoBoton);
  Serial.println("");

  // prender LED VERDE segun brillo
  if (valorSensor < 1020) {
    analogWrite(pinVER, valorMapeado);
  }

  // prender LED ROJO cuando potenciometro llega a la mitad
  if (valorSensor > 512) {
    analogWrite(pinRED, valorMapeado);
  }

  else {
    digitalWrite(pinRED, LOW);

  }

  // LED VERDE intermitente y prender LED AZUL cuando potenciometro llega al maximo
  if (valorSensor > 1020) {
    analogWrite(pinBLU, valorMapeado);

        // comprobar si tiempo transcurrido es mayor que intervalo
    if (tiempoActual - tiempoAnterior >= intervalo) {

      // actualizar tiempo previo
      tiempoAnterior = tiempoActual;

      estadoLED = !estadoLED;
      digitalWrite(pinVER, estadoLED);

    }

    if (estadoBoton == HIGH) {
      digitalWrite(pinVER, LOW);
      digitalWrite(pinBLU, estadoLED);

    }

  }

  else {
    digitalWrite(pinBLU, LOW);

  }
 

}
