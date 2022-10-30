#include <Servo.h>
#include <ESP8266WiFi.h>
#include <Firebase_ESP_Client.h>
#include <addons/TokenHelper.h>
#include <addons/RTDBHelper.h>
float moisture_percentage = 0;
int moisturePin = A0;
int pos = 60, endpos = 170;
int servoPin1 = D7, servoPin2 = D8;  // replace with servo pin
int motorPin1 = D0, motorPin2 = D1;  // motor one pins
int motorPin3 = D2, motorPin4 = D3;  // motor two pins


bool tempRoof1 = false, tempRoof2 = false, roofcheck1 = false, roofcheck2 = false, checkWaterMotor1 = false , checkWaterMotor2 = false;
Servo myservo1;
Servo myservo2;

float moisturePercentage;

/* 1. Define the WiFi credentials */
#define WIFI_SSID "Priya_EXT"
#define WIFI_PASSWORD "MH04CM7217"

/* 2. Define the API Key */
#define API_KEY "AIzaSyDS9BYSsg51gkybXxaEZ1m5x4ZFxDxsC-s"

/* 3. Define the RTDB URL */
#define DATABASE_URL "polyhouseie-default-rtdb.firebaseio.com"  //<databaseName>.firebaseio.com or <databaseName>.<region>.firebasedatabase.app

/* 4. Define the user Email and password that alreadey registerd or added in your project */
#define USER_EMAIL "manishtalele1410@gmail.com"
#define USER_PASSWORD "Talele@1234"

// Define Firebase Data object
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;

unsigned long count = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  /* Assign the certificate file (optional) */
  // config.cert.file = "/cert.cer";
  // config.cert.file_storage = StorageType::FLASH;

  /* Assign the database URL(required) */
  config.database_url = DATABASE_URL;

  config.signer.test_mode = true;


  Firebase.reconnectWiFi(true);

  /* Initialize the library with the Firebase authen and config */
  Firebase.begin(&config, &auth);
  // Serial.begin(9600);
  pinMode(moisturePin, INPUT);
  myservo1.attach(servoPin1);  // attaches the servo on pin 9 to the servo object
  myservo1.write(pos);
  myservo2.attach(servoPin2);  // attaches the servo on pin 9 to the servo object
  myservo2.write(pos);

  pinMode(motorPin1, OUTPUT);
  pinMode(motorPin2, OUTPUT);
  pinMode(motorPin3, OUTPUT);
  pinMode(motorPin4, OUTPUT);
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, LOW);

  Firebase.RTDB.setInt(&fbdo, F("/Control/SoilMoisture"), 1);
}

void loop() {

  int temp = analogRead(A0);
  moisture_percentage = (100 - ((temp / 1023.00) * 100));
  Serial.println(moisture_percentage);
  roofs();
  waterMotor();
  soilMoistureFunc(moisture_percentage);
  delay(2000);
}

void soilMoistureFunc(float moisture_percentage) {
  if (moisture_percentage > 45) {
    Firebase.RTDB.setInt(&fbdo, "/Control/SoilMoisture", 2);
  } else if (moisture_percentage > 30 && moisture_percentage < 45) {
    Firebase.RTDB.setInt(&fbdo, "/Control/SoilMoisture", 1);
  } else {
    Firebase.RTDB.setInt(&fbdo, "/Control/SoilMoisture", 0);
  }
}


void waterMotor() {
  Firebase.RTDB.getBool(&fbdo, "/Control/Waterpump1");
  checkWaterMotor1 = fbdo.boolData();
  Firebase.RTDB.getBool(&fbdo, "/Control/Waterpump2");
  checkWaterMotor2 = fbdo.boolData();
  Serial.println(checkWaterMotor1);
  Serial.println(checkWaterMotor2);
  if (checkWaterMotor1 == 1) {
    digitalWrite(motorPin1, HIGH);
    digitalWrite(motorPin2, LOW);
  } else {
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, LOW);
  }
  if (checkWaterMotor2 == 1) {
    digitalWrite(motorPin3, HIGH);
    digitalWrite(motorPin4, LOW);
  } else {
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, LOW);
  }
}


void roofs() {
  
  Firebase.RTDB.getBool(&fbdo, "/Control/Roof1");
  roofcheck1 = fbdo.boolData();
  Firebase.RTDB.getBool(&fbdo, "/Control/Roof2");
  roofcheck2 = fbdo.boolData();
  Serial.print("Roof 1 :");
  Serial.println(roofcheck1);
  Serial.print("Roof 2 :");
  Serial.println(roofcheck2);


  if (roofcheck1 == 1 && tempRoof1 != true) {
    servo1Opening();
    tempRoof1 = true;
  }
  if (roofcheck1 == 0 && tempRoof1 != false) {
    servo1Closeing();
    tempRoof1 = false;
    //  digitalWrite(motorPin, LOW);
  }
  if (roofcheck2 == 1 && tempRoof2 != true) {
    servo2Opening();
    tempRoof2 = true;
  }
  if (roofcheck2 == 0 && tempRoof2 != false) {
    servo2Closeing();
    tempRoof2 = false;
  }
}




void servo1Opening() {

  for (pos = 60; pos <= 170; pos += 1) {  // goes from 0 degrees to 180 degrees
    myservo1.write(pos);                  // tell servo to go to position in variable 'pos'
    delay(15);                            // waits 15ms for the servo to reach the position
  }
}

void servo1Closeing() {

  for (pos = 170; pos >= 60; pos -= 1) {  // goes from 180 degrees to 0 degrees
    myservo1.write(pos);                  // tell servo to go to position in variable 'pos'
    delay(15);                            // waits 15ms for the servo to reach the position
  }
}

void servo2Opening() {

  for (pos = 60; pos <= 170; pos += 1) {  // goes from 0 degrees to 180 degrees
    myservo2.write(pos);                  // tell servo to go to position in variable 'pos'
    delay(15);                            // waits 15ms for the servo to reach the position
  }
}

void servo2Closeing() {

  for (pos = 170; pos >= 60; pos -= 1) {  // goes from 180 degrees to 0 degrees
    myservo2.write(pos);                  // tell servo to go to position in variable 'pos'
    delay(15);                            // waits 15ms for the servo to reach the position
  }
}