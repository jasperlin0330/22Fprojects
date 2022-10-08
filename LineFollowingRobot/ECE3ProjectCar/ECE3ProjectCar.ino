#include <ECE3.h>
const int numSensors = 8;
const int left_nslp_pin=31; // nslp ==> awake & ready for PWM
const int left_dir_pin=29;
const int left_pwm_pin=40;
const int right_nslp_pin=11; // nslp ==> awake & ready for PWM
const int right_dir_pin=30;
const int right_pwm_pin=39;
uint16_t sensorValues[numSensors]; // right -> left, 0 -> 7
uint16_t norSensVal[numSensors];
uint16_t MIN[numSensors] = {712, 640, 584, 617, 640, 571, 640, 688};
uint16_t MAX[numSensors] = {2400, 2400, 2400, 2400, 2400, 2400, 2400, 2400};
const int max_spd = 60;
const int min_spd = 0;
const float kp = 0.05; // 0.009...0.01
const float kd = 0.005; // 0.06 ...0.05
int prev = 0;
bool turnStop = false;
void spin() {
if(turnStop) {
analogWrite(left_pwm_pin, 0);
analogWrite(right_pwm_pin, 0);
delay(50000);
}
digitalWrite(right_dir_pin, HIGH);
resetEncoderCount_right();
while(getEncoderCount_right() < 320) {
//Serial.println(getEncoderCount_right());
analogWrite(left_pwm_pin, 50);
analogWrite(right_pwm_pin, 50);
}
analogWrite(left_pwm_pin, 0);
analogWrite(right_pwm_pin, 0);
digitalWrite(right_dir_pin, LOW);
delay(200);
}
void printSensorValues(uint16_t sv[]) {
for(int i = 0; i < numSensors; i++) {

Serial.print(sv[i]);
Serial.print("\t");
}
Serial.println();
}
void printnormSensorValues(uint16_t sv[]) {
for(int i = 0; i < numSensors; i++) {
Serial.print(sv[i]);
Serial.print("\t");
}
Serial.println();
delay(500);
}
///////////////////////////////////
void setup() {
Serial.begin(9600);
// put your setup code here, to run once:
pinMode(left_nslp_pin,OUTPUT);
pinMode(left_dir_pin,OUTPUT);
pinMode(left_pwm_pin,OUTPUT);
digitalWrite(left_dir_pin,LOW);
digitalWrite(left_nslp_pin,HIGH);
pinMode(right_nslp_pin,OUTPUT);
pinMode(right_dir_pin,OUTPUT);
pinMode(right_pwm_pin,OUTPUT);
digitalWrite(right_dir_pin,LOW);
digitalWrite(right_nslp_pin,HIGH);
// pinMode(LED_RF, OUTPUT);
ECE3_Init();
// set the data rate in bits/second for serial data transmission
// Serial.begin(9600);
for(int i=0; i < 250; i++) {
ECE3_read_IR(sensorValues);
for(int j = 0; j < numSensors; j++) {

if(MIN[j] > sensorValues[j]) {
MIN[j] = sensorValues[j];
}
if(MAX[j] < sensorValues[j]) {
MAX[j] = sensorValues[j];
}
}
delay(20);
}
// delay(1000); // Wait 2 seconds before starting
}
void loop() {
// put your main code here, to run repeatedly:
uint16_t sensorSum = 0;
ECE3_read_IR(sensorValues);
// printSensorValues(sensorValues);
// Serial.println(sensorSum);
// car must stop at end; car starts at angle
for(int i = 0; i < numSensors; i++) {
norSensVal[i] = 1000 * abs(sensorValues[i] - MIN[i]) / MAX[i];
sensorSum += sensorValues[i];
}
if( norSensVal[0] > 725 && norSensVal[1] > 700 && norSensVal[2] > 700 &&
norSensVal[3] > 700 && norSensVal[4] > 700 && norSensVal[5] > 700 &&
norSensVal[6] > 700 && norSensVal[7] > 725 ) {
if(sensorSum > 18000) {
spin();
turnStop = true;
}
}

// printnormSensorValues(norSensVal);

int weighted_val = ( -8*norSensVal[0] - 4*norSensVal[1] - 2*norSensVal[2] -
norSensVal[3] + norSensVal[4] + 2*norSensVal[5] + 4*norSensVal[6] +
8*norSensVal[7] )/4;
// int weighted_val = ( -8*sensorValues[0] - 4*sensorValues[1] -
2*sensorValues[2] - sensorValues[3] + sensorValues[4] + 2*sensorValues[5] +
4*sensorValues[6] + 8*sensorValues[7] )/4;
// Serial.print("Weighted Value: ");
// Serial.println(weighted_val);
// subtract error from speed and find kp and kd
int leftSpd = 50;
int rightSpd = 50;
int spd = kp * weighted_val + kd*(weighted_val - prev);
prev = weighted_val;
if(spd > 0) {
rightSpd = rightSpd + spd;
leftSpd = leftSpd - spd;
}
if(spd < 0) {
leftSpd = leftSpd - spd;
rightSpd = rightSpd + spd;
}

if(rightSpd > max_spd) {
rightSpd = max_spd;

}
if(leftSpd < 0) {
leftSpd = min_spd;
}
if(leftSpd > max_spd) {
leftSpd = max_spd;
}
if(rightSpd < 0) {
rightSpd = min_spd;
}
/*
Serial.print(leftSpd);
Serial.print("\t");
Serial.println(rightSpd);
Serial.println();
*/
analogWrite(left_pwm_pin,leftSpd);
analogWrite(right_pwm_pin,rightSpd);
// delay(1000);
/*
digitalWrite(LED_RF, HIGH);
delay(250);
digitalWrite(LED_RF, LOW);
delay(250);
*/
}