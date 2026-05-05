class Obstacle {
  float x, w, y, h, speed, health;
  PImage obst1;
  char idir;


  //Constructor
  Obstacle(float w, float h) {
    this.w = w;
    this.h = h;
    this.speed = 5;
    this.health = 100;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x = width+100;
      y = random(height);
    } else {
      idir = 's';
      x = random(width);
      y = -100;
    }


    obst1 = loadImage("tumbleweed.png");
  }


  void display() {
    imageMode(CENTER);
    image(obst1, x, y);
  }


  void move() {
    switch(idir) {
    case 'w':
      y = y -speed;
      break;
    case 'a':
      x = x -speed;
      break;
    case 's':
      y = y + speed;
      break;
    case 'd':
      x = x + speed;
    }
  }
  boolean reachedEdge() {
    return x >= width+150 || x <= -150 || y > height + 150 || y < -150;
    // Logic for when to return true
  }
}

class PowerUp {
  float x, w, y, h, speed;
  char type;


  //Constructor
  PowerUp() {
    w = 100;
    h = 100;
    speed = 5;
    x = random(width);
    y = -100;
    if (random(4) == 2) {
      type = 'h';
    } else if (random(3) == 1) {
      type = 't';
    } else {
      type = 'a';
    }




  }


  void display() {
    if (type == 'a') {
      fill(200, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Ammo", x, y);
    } else if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Health", x, y);
    } else if (type == 't') {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
      fill(225);
      textAlign(CENTER, CENTER);
      text("Turret", x, y);
    }
  }


  void move() {
    y = y + speed;
  }

  boolean reachedEdge() {
    return x >= width+150 || x<= -150 || y >= height+150 || y<= -150;
  }

  Boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
}
