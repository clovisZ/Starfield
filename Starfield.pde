boolean begin = false;
int palettePick; 

class Particle {
  double x, y, angle, speed, gravity;
  float opacity, size;
  int smokeColor;
  Particle() {
    x = mouseX;
    y = mouseY;
    angle = Math.random()*2*Math.PI;
    speed = Math.random()*15;
    gravity = 0;
    size = 20;
    opacity = 255;
    
    int colorPick = (int)(Math.random() * 5); 
    
    int[] purplePalette = {color(230, 230, 250), color(200, 162, 200), color(218, 112, 214), color(153, 102, 204), color(120, 81, 169)};
    int[] bluePalette = {color(173, 216, 230), color(135, 206, 235), color(176, 224, 230), color(240, 248, 255), color(191, 239, 255)};
    int[] orangePalette = {color(255, 223, 186), color(255, 204, 128), color(255, 179, 71), color(255, 160, 88), color(255, 140, 90)};

    if (palettePick == 0) {
      smokeColor = purplePalette[colorPick];
    } else if (palettePick == 1) {
      smokeColor = bluePalette[colorPick];
    } else {
      smokeColor = orangePalette[colorPick];
    } 
  }

  void move() {
    x += cos((float)angle) * speed;
    y += sin((float)angle) * speed;
  }

  void show() {
    if (opacity > 0) 
      opacity-=1.2;
    if (size > 10) 
      size -= 0.01;
    if (speed > 3) 
      speed -= 0.15;
    if (gravity >= 0) {
      gravity += 0.05;
    }
    y += gravity;
    fill(smokeColor, opacity);
    noStroke();
    ellipse((float) x, (float) y, size, size);
  }
}

class OddballParticle extends Particle {
  OddballParticle() {
    x = mouseX;
    y = mouseY;
    angle = Math.random()*2*Math.PI;
    speed = Math.random()*15 + 2;
    gravity = 0;
    size = 10;
    opacity = 255;
    
    int colorPick = (int)(Math.random() * 3); 
    
    int[] lightGreenPalette = { color(144, 238, 144), color(173, 255, 47), color(189, 252, 201) };

    smokeColor = lightGreenPalette[colorPick];
  }
  
  void move() {
    x += cos((float)angle + (int)(Math.random() * 2)) * speed;
    y += sin((float)angle + (int)(Math.random() * 2)) * speed;
  }
  
  void show() {
    if (opacity > 0) 
      opacity-=1.8;
    if (size > 5) 
      size -= 0.05;
    if (speed > 3) 
      speed -= 0.15;
    if (gravity >= 0) {
      gravity += 0.03;
    }
    y += gravity;
    fill(smokeColor, opacity);
    noStroke();
    ellipse((float) x, (float) y, size, size);
  }
}

Particle[] particles = new Particle[40];

void setup() {
  size(1000, 1000);
  background(10);
}

void draw() {
  if (begin) {
    background(10);
    
    for (int i = 0; i < particles.length; i++) {
      particles[i].move();
      particles[i].show();
    }
  }
}

void mousePressed() {
  begin = true;
  palettePick = (int)(Math.random() * 3); 
  for (int i = 0; i < particles.length; i++) {
    if ((int)(Math.random() * 3) == 0) {
      particles[i] = new OddballParticle();
    } else {
      particles[i] = new Particle();
    }
  }
  draw();
}
