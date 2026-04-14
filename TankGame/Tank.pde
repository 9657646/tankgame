// Dan Jansen | Apr 14 2026 | Tank
class Tank{
  int x,y,w,h,speed,health;
  PImage t1;

  //Constructor
  Tank() {
    x = 100;
    y = 100; 
    w = 100; 
    h = 100;
    speed = 2;
    health = 100;
    t1 = loadImage("jansen_tank.png");
  }

  void display() {
    imageMode(CENTER);
    image(t1,x,y);
  }
  
  void move() {
    x = x + speed;
  }
}
