PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int score;
Timer obsTimer;

void setup() {
  size(500, 500);
  bg = loadImage("background.png");
  tank1 = new Tank();
  //obstacles.add(new Obstacle(250, 250));
  //obstacles.add(new Obstacle(25, 250));
  //obstacles.add(new Obstacle(250, 400));
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
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
  // Displaying obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
  }
  // Displaying projectiles
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }

  }
      scorePanel();
    tank1.display();
}
void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(30);
  text("Score", width/2, 50);
}

void keyPressed() {
  if (key == 'w') {
    tank1.move('w');
  } else if (key == 's') {
    tank1.move('s');
  } else if (key == 'd') {
    tank1.move('d');
  } else if (key == 'a') {
    tank1.move('a');
  }
}

void mousePressed() {
  projectiles.add(new Projectile(tank1.x, tank1.y));
}
