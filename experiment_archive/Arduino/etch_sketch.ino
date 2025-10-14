// variables for pins
int xPin = A1;
int yPin = A0;

void setup() {
  // start Serial
  Serial.begin( 9600 );
}

void loop() {
  // read in values
  int xValue = analogRead( xPin );
  int yValue = analogRead( yPin );

  // print out values
  Serial.print( "\n");
  Serial.print( "x:" );
  Serial.print( xValue );
  Serial.print( "; y:" );
  Serial.print( yValue );

  // wait a little bit
  delay( 30 );
}
