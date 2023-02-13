class Button {
  // member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  // constructor
  Button (int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(#FFA81A);
    c2 = color(#F21616);
    on  = false;
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER);
    textSize(30);
    if (val == 'c') {
      text("Clear", x, y);
    } else if (val == 's') {
      text("x²", x, y);
    } else {
      text(val, x, y);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2);
  }
}
