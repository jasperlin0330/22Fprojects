
#include <SoftwareSerial.h>

SoftwareSerial mySerial(10, 11); // RX, TX

// Define the pins of the trigger pins and echo pins 
const int trigPin = 2;
const int echoPin = 3;

float duration, cm;

void setup() {
  // The trigger pin will output an ultrasonic
  // signal from the speaker
  pinMode(trigPin, OUTPUT);

  // The echo pin will receive the reflected signal
  // and input it back to the IDE
  pinMode(echoPin, INPUT);
  pinMode(10, INPUT);
  pinMode(11, OUTPUT);
  
   // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Hello, Serial ready");
  mySerial.begin(9600);
  mySerial.println("Hello, SoftwareSerial ready");
}

void loop() {
  // put your main code here, to run repeatedly:
  // Define the duration beetween transmitted and
  // recieved
  
  //------- UltraSound -------
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH); //Send pulse
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH); // Recieve pulse
  cm = (duration/2)*0.0343;
  delay(1);
  mySerial.print(millis());
  mySerial.print(',');
  mySerial.println(cm); 
  delay(10); // Delay in between samples

}
