#ovladač vozítka

const int osaY = A7;
const int osaX = A6;
const int button = 2;


const int mosfet1 = 3;
const int mosfet2 = 5;
const int mosfet3 = 7;
const int mosfet4 = 6;


const int mosfet5 = 13;
const int mosfet6 = 8;
const int mosfet7 = 9;
const int mosfet8 = 10;



int b = 0;


void setup() {
pinMode(mosfet1,OUTPUT);
pinMode(mosfet2,OUTPUT);
pinMode(mosfet3,OUTPUT);
pinMode(mosfet4,OUTPUT);

pinMode(mosfet5,OUTPUT);
pinMode(mosfet6,OUTPUT);
pinMode(mosfet7,OUTPUT);
pinMode(mosfet8,OUTPUT);

pinMode(osaY,INPUT);
pinMode(osaX,INPUT);
pinMode(button,INPUT);


Serial.begin(9600);


}

void loop() {

if(digitalRead(button) == LOW)
{
   b++;
  delay(400);
}
 switch(b){
  
 case 0:{


  int osaXOvl = analogRead(A6);
int osaXregl = map(osaXOvl,0,1023,0,510);

int osaXreglupr = osaXregl - 255;
int osaXccv;

if(osaXreglupr << 0){
  osaXccv = osaXreglupr * -1;
  
}

Serial.print("osaXccv:");
Serial.println(osaXccv);
Serial.print("osaX:");
Serial.println(osaXreglupr);
Serial.println();
Serial.println();

if(osaXccv < 0){
  osaXccv = 0;
}

if(osaXreglupr < 0){
  osaXreglupr = 0;
}






  analogWrite(mosfet1,osaXreglupr);
  analogWrite(mosfet2,osaXccv);
  analogWrite(mosfet3,osaXccv);
  analogWrite(mosfet4,osaXreglupr);

  Serial.write(osaXreglupr);














 int osaYOvl = analogRead(A7);
int osaYregl = map(osaYOvl,0,1023,0,510);

int osaYreglupr = osaYregl - 255;
int osaYccv = 0;

if(osaYreglupr << 0){
  osaYccv = osaYreglupr * -1;
  
}

 Serial.print("osaYccv:");
 Serial.println(osaYccv);
 Serial.print("osaY:");
 Serial.println(osaYreglupr);
 Serial.println();
 Serial.println();

if(osaYccv < 0){
  osaYccv = 0;
}

if(osaYreglupr < 0){
  osaYreglupr = 0;
}

 analogWrite(mosfet5,osaYreglupr);
 analogWrite(mosfet6,osaYccv);
 analogWrite(mosfet7,osaYccv);
 analogWrite(mosfet8,osaYreglupr);




}
 
  case 2:{


    b = 0;
  }
//Serial.println(digitalRead(button));
  
 }

}
