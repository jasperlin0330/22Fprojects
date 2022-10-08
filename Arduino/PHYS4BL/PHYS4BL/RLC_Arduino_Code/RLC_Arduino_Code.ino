// Arduino fast serial data transmission. 
// Must use serialPlotter.Py to visualize data

int buffer [512]; // 1K input buffer

void setup(){
 Serial.begin(115200);
 ADCSRA = (ADCSRA & 0xf8) | 0x04; // set 16 times division
}
void loop(){
  
 for(int i=0; i<512 ; i++){
    buffer[i] = analogRead(A0);
 }

 for(int i=0; i<512 ; i++){
    Serial.write(buffer[i]);
 }
}
