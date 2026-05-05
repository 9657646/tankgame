// Dan Jansen | May 5 2026 | Tank Game
Tank t1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage bg;
int score;
Timer obsTimer, puTimer;


void setup() {
  size(500, 500);
  bg = loadImage("background.png");
  t1 = new Tank();
  //obstacles.add(new Obstacle(250, 250));
  //obstacles.add(new Obstacle(25, 250));
  //obstacles.add(new Obstacle(250, 400));
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}


void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  // Add timer to distribute
  if (obsTimer.isFinished()) {


    obstacles.add(new Obstacle(-100, int(random(height))));
    obsTimer.start();
  }


  // Distribute powerups on a timer
  if (puTimer.isFinished()) {


    powerups.add(new PowerUp());
    puTimer.start();
  }


  // Display and remove powerups
  for (int i = 0; i < powerups.size(); i ++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(pu);
    }
    if (pu.intersect(t1)) {
      if (pu.type == 'h') {
        t1.health = t1.health + 100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        t1.laserCount = t1.laserCount + 100;
        powerups.remove(pu);
      } else if (pu.type == 't') {
        t1.turretCount = t1.turretCount + 1;
        powerups.remove(pu);
      }
    }
  }
  // Displaying obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
    if (t1.intersect(o)) {
    }
  }
  // Displaying projectiles
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }


    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  t1.display();


  scorePanel();


  println("Objects in Memory:"+obstacles.size());
  println("Projectiles in Memory:"+projectiles.size());
}




void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
  text("Health:" + t1.health, width/2-150, 25);
  text("Ammo:" + t1.laserCount, width/2+150, 25);
}


void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'd') {
    t1.move('d');
  } else if (key == 'a') {
    t1.move('a');
  }
}


void mousePressed() {
  if (t1.turretCount == 1) {
    projectiles.add(new Projectile(t1.x, t1.y));
  } else if (t1.turretCount == 2) {
    projectiles.add(new Projectile(t1.x, t1.y));
    projectiles.add(new Projectile(t1.x, t1.y));
  }
}
