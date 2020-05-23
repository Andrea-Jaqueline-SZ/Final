import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

PImage Gato;
PImage fondo;

piso pisos;
Attractor a;
Bridge p;
gatitos[] gatitoss = new gatitos[25];
ArrayList<Box> boxes;

void setup()
{
  size(1500,900);
  smooth();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-90);
  boxes = new ArrayList<Box>();
  
  Gato = loadImage("Gato.png");
  fondo = loadImage("fondo.jpg");
  a = new Attractor (50, 50, 50, 50);
  pisos =new piso (0, 650, width*2,12 ,12);
   pisos =new piso (0, 650, width*2,12 ,0);
  p = new Bridge(width/2,30);
 // pantallas = new pantalla();
   for (int i = 0; i < gatitoss.length; i++) 
   {
    gatitoss[i] = new gatitos (random(4,4),random(width),100);
   }
  
  
}


void draw()
{
 background(255); 
 
  box2d.step();
  for (int i = 0; i < gatitoss.length; i++) 
  {
    Vec2 force = a.attract(gatitoss[i]);
    gatitoss[i].applyForce(force);
    gatitoss[i].display();
  }
  a.display();
  a.mover();
  p.display();
  pisos.display();
  //pantallas.display();
  
   if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  for (Box b: boxes) {
    b.display();
  }
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }

  
   fill(200,150,30);
  text("Click mouse to add food. Press any key to move to the right",10,height-10);
  text("Can the big cat fly?",1300,height-850);
  
  
}
