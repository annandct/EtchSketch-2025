import processing.serial.*;

float penX;
float penY;

color bgColor = color( 222,222,222 ); // color of background
color penColor = color( 60, 245, 80 ); // color of our pen

Serial myPort; // our serial port
String inString;
/* setup
   everything here happens only once when
  the sketch starts
*/
void setup() {
  size( 800, 600 );
  background( bgColor ); // set the background color
  noStroke(); // turn off outline around shapes
  fill( penColor ); // set pen color

  penX = width/2; // starting x position of pen
  penY = height/2; // starting y position of pen

  println(Serial.list()); // print list of all ports
  // you may need to change the number in [ ] to match
  // the correct port for your computer
  myPort = new Serial(this, Serial.list()[3], 9600);

  myPort.bufferUntil('n');
}

/* draw
   everything here happens repeatedly
*/
void draw() {
  ellipse( penX, penY, 18, 18 );
  if (myPort.available() > 0)
  inString = myPort.readStringUntil('\n');  // read string from serial port
  // lastval =  // set lastval to the current pen values so when is reads a null it uses those instead
  
  println( inString );
  
// if inString = ('null')  // ignore if the value is null - put everything into else loop
   
   String data[] = split( inString, ';' );
   if ( data.length == 2 ) { // continue only if there are 2 things
    String xValue = trim( data[0] ); // remove extra whitespace
    String yValue = trim( data[1] ); // remove extra whitespace

    // convert from string to int and then resize range to window
    int xv = int(xValue);
    penX = map( xv, 0, 1023, 0, width);
    int yv = int(yValue);
    penY = map( yv, 0, 1023, 0, height);
  }
}
  
  // println(val);
  // println(str(millis()));
  // ellipse( penX, penY, 18, 18 );
  

/* clearDrawing
   this function is called when button on Arduino is pressed
 */
 void clearDrawing() {
  background( bgColor );
}