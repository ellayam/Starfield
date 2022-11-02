Particle[] lisa;

void setup() {
  size(400,400);
  lisa = new Particle[800];
  for(int i = 0; i < 797; i++) {
    lisa[i] = new Particle();
  }
  for(int i = 797; i < lisa.length; i++) {
    lisa[i] = new Oddball();
  }
}

void draw() {
  background(0);
  for(int i = 0; i < lisa.length; i++) {
    lisa[i].move();
    lisa[i].show();
  }
}

void mousePressed() {
  background(0);
  redraw();
}

class Particle {
  double myX, myY, mySize, mySpeed, myAngle;
  int myColor;
  
  Particle() {
    myX = 200;
    myY = 200;
    myColor = color((int)(Math.random()*100)+100,(int)(Math.random()*100)+100,(int)(Math.random()*100)+100);
    mySize = (Math.random()*6)+1;
    mySpeed = (Math.random()*4);
    myAngle = (Math.random()*(2*Math.PI));
    System.out.println(mySize);
  }
  
  void move() {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  
  void show() {
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}

class Oddball extends Particle {
  Oddball() {
    myX = 200;
    myY = 200;
    myColor = color((int)(Math.random()*100)+150,(int)(Math.random()*100)+150,(int)(Math.random()*100)+150);
    mySize = (Math.random()*10)+50;
    mySpeed = (Math.random()*2)+0.001;
    myAngle = (Math.random()*(2*Math.PI));
    System.out.println(mySize);
  }
  
  void show() {
    fill(myColor);
    noStroke();
    ellipse((float)myX,(float)myY,(float)mySize,(float)mySize);
    noFill();
    stroke(150);
    strokeWeight(11);
    ellipse((float)myX,(float)myY+2,(float)mySize+30,(float)mySize-30);
    noStroke();
    fill(myColor);
    arc((float)myX,(float)myY,(float)mySize,(float)mySize,19*PI/20,41*PI/20);
  }
}
