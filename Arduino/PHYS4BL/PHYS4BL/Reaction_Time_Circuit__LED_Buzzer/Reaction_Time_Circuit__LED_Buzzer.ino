int ledPin = 9;
int ledBrightness = 125;
int ledState = LOW;

int buttonPin = 2;
int buttonState = LOW;

long randDelay;
long newT;
long oldT;
long deltaT;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin, OUTPUT);

  pinMode(buttonPin, INPUT);

  Serial.begin(9600);
  Serial.println("PRepare. Reactiton time measurements will begin shortly!");
  for (int i = 0; i <= 3; i++) {
    analogWrite(ledPin, ledBrightness);
    delay(250);
    analogWrite(ledPin, 0);
    delay(250);
  }

  randomSeed(analogRead(A0));
  randDelay = random(3000, 6000);
  delay(randDelay);

}

void loop() {
  // put your main code here, to run repeatedly:
  buttonState = digitalRead(buttonPin);

  if (ledState == LOW && buttonState == LOW) {
    analogWrite(ledPin, ledBrightness);
    oldT = millis();
    ledState = HIGH;
  }

  if (ledState == HIGH && buttonState == HIGH) {
    newT = millis();
    analogWrite(ledPin, 0);

    deltaT = newT - oldT;
    Serial.println(deltaT);

    ledState = LOW;
    randDelay = random(1000, 3000);
    delay(randDelay);
  }

}
