// 3D RAIN SYSTEM

RainSystem rs; // Downpour
SplashSystem ss; // Droplet hits the ground, and splashed 
PVector gravity = new PVector(0, 0.9, 0);

// MAIN CLASS to start generating 3D rain graphics
class StartRaining {

   StartRaining(){
     stroke(255);
     xRot = 0;  // by default rain angle set to be 0
     rs = new RainSystem(30); // 30 drops per frame
     ss = new SplashSystem();
   }
   
   void rain() {
     background(color(shape_color_r, shape_color_g, shape_color_b));
     rotateX(xRot); // Set value from whichever angle you get nice view
     rs.run(); // Pouring
     ss.run(); // Splashing
    }

}

// Rain droplets
class Droplet{
  PVector pos; // Keep track droplet position
  PVector vel; // droplet velocity
  boolean off; // hit the ground, and die
  float size; 
  float len; // length 
  
  Droplet(float x, float y, float z){
    pos = new PVector(x,y,z);
    vel = new PVector();
    this.len = random(10);
  }
  
  void show(){
    strokeWeight(1.5);    
    line(pos.x, pos.y, pos.z, pos.x, pos.y + len, pos.z);
  }
  
  void update(){
    vel.add(gravity);
    pos.add(vel);
    // Hit the ground and splashed
    if(pos.y > height) {
      ss.init(pos.x, height, pos.z, vel.mag());
      off = true;
    }
  }
}

// To generate the random rain effect
class Splash {
  PVector pos;
  PVector vel;
  boolean off;
  float size;
  
  Splash(float x, float y, float z, float size) {
    this.pos = new PVector(x, y, z);
    this.size = random(0, pow(size,0.15));
    vel = PVector.random3D();
    vel.mult(random(size/4));
  }

  void update() {
    if (pos.y > height) {
      off = true;
      // Only inits another splashes if the size not too small
      if (size >1) {
        // Hit the ground and splashed
        ss.init(pos.x, height, pos.z, size);
      }
    } else {
      // Otherwise update it
      vel.add(gravity);
      pos.add(vel);
    }
  }

  void show() {
    strokeWeight(size);
    // the splash just a point
    point(pos.x, pos.y, pos.z);
  }
}

// generates multiple rain droplets
class RainSystem {
  ArrayList<Droplet> droplets;
  int f;
  
  RainSystem(int f) {
    this.f = f;
    droplets = new ArrayList<Droplet>();
  }

  void run() {
    for (int i = 0; i < f; i++) {
      droplets.add(new Droplet(random(-width, width*2), random(-300), random(-2500, 500)));
    }
    for (int i = droplets.size() - 1; i >= 0; i--) {
      if (droplets.get(i).off) {
        droplets.remove(i);
      } else {
        droplets.get(i).update();
        droplets.get(i).show();
      }
    }
  }
}

class SplashSystem {
  ArrayList<Splash> splashes;
  SplashSystem() {
    splashes = new ArrayList<Splash>();
  }

  void run() {
    for (int i = splashes.size() - 1; i >= 0; i--) {
      if (splashes.get(i).off) {
        splashes.remove(i);
      } else {
        splashes.get(i).update();
        splashes.get(i).show();
      }
    }
  }
  
  void init(float x, float y, float z, float size){
    for (int i = 0; i < size/3; i++) {
      splashes.add(new Splash(x, y, z, size));
    }
  }
}
