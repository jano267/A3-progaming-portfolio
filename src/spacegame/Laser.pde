class Laser {
  int x, y, w, h, speed;
  color c1;

  Laser(int x, int y) {
    this.x= x;
    this.y = y;
    w = 4;
    h = 10;
    speed = 5;
    c1 = color(#F22222);
  }
  void display() {
    rectMode(CENTER);
    fill(255, 0, 0);
    noStroke();
    rect(x, y, w, h);
  }
  void move() {
    y -= speed;
  }
  boolean reachTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
    boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<20) {
      return true;
    } else {
      return false;
    }
  }
}
