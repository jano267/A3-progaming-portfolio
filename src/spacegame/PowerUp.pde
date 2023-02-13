class PowerUp {
  int x, y, diam, speed;
  char type;
  PImage powerUpHealth, powerUpTurret, powerUpAmmo;

  PowerUp() {
    x = int(random(width));
    y = -50;
    diam = 200;
    speed = int(5);
    powerUpHealth = loadImage("health.png");
    powerUpTurret = loadImage("turret.png");
    powerUpAmmo = loadImage("ammo.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'A';
    } else if (rand == 1) {
      type = 'H';
    } else {
      type = 'T';
    }
  }
  void display() {
  powerUpHealth.resize(diam, diam);
    imageMode(CENTER);
    image(powerUpHealth, x, y);
    
    powerUpTurret.resize(diam, diam);
    imageMode(CENTER);
    image(powerUpTurret, x, y);
    
    powerUpAmmo.resize(diam, diam);
    imageMode(CENTER);
    image(powerUpAmmo,x, y);
    
    if (type == 'A') {
      image(powerUpAmmo, x, y);
    } else if (type == 'H') {
      image(powerUpHealth, x, y);
    } else {
      image(powerUpTurret, x, y);
    }
    imageMode(CENTER);
  }


  void move() {
    y += speed;
  }

  boolean reachBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Ship ship) {
    float d = dist(x, y, s1.x, s1.y);
    if (d<35) {
      return true;
    } else {
      return false;
    }
  }
}
