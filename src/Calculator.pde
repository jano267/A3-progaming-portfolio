// Alejandro Oyarzun | Nov 2022 | Calc project //<>//
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.00";
boolean left = true;
float l, r, result;
char op = ' ';

void setup() {
  size(322, 600);
  numButtons[0] = new Button(80, 559, 160, 80, '0');
  numButtons[1] = new Button(40, 479, 80, 80, '1');
  numButtons[2] = new Button(120, 479, 80, 80, '2');
  numButtons[3] = new Button(200, 479, 80, 80, '3');
  numButtons[4] = new Button(40, 399, 80, 80, '4');
  numButtons[5] = new Button(120, 399, 80, 80, '5');
  numButtons[6] = new Button(200, 399, 80, 80, '6');
  numButtons[7] = new Button(40, 319, 80, 80, '7');
  numButtons[8] = new Button(120, 319, 80, 80, '8');
  numButtons[9] = new Button(200, 319, 80, 80, '9');
  opButtons[0] = new Button(200, 559, 80, 80, '=');
  opButtons[1] = new Button(280, 159, 80, 80, '±');
  opButtons[2] = new Button(280, 559, 80, 80, '÷');
  opButtons[3] = new Button(280, 479, 80, 80, '+');
  opButtons[4] = new Button(280, 399, 80, 80, '-');
  opButtons[5] = new Button(280, 319, 80, 80, '*');
  opButtons[6] = new Button(80, 159, 160, 80, 'c');
  opButtons[7] = new Button(120, 239, 80, 80, '.');
  opButtons[8] = new Button(200, 239, 80, 80, 's');
  opButtons[9] = new Button(40, 239, 80, 80, 'π');
  opButtons[10] = new Button(200, 159, 80, 80, '√');
  opButtons[11] = new Button(280, 239, 80, 80, '^');
}

void draw() {
  background(200);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 27 || key == 'c') {
    handleEvent("c", false);
  } else if (keyCode == 10 || keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("*", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 30) {
    if (dVal.equals("0.00")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("c")) {
    dVal = "0.00";
    left = true;
    l = 0.00;
    r = 0.00;
    result = 0.00;
    op = ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0.00";
    left = false;
  } else if (val.equals("s")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  }
}

void mousePressed() {
  for (int i =0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }

  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'c') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0.00";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal = "0.00";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '*') {
      op = '*';
      dVal = "0.00";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      preformCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } //else if (opButtons[i].on && opButtons[i].val == '^') {
    //if (left) {
    //  l = pow(l,);
    //  dVal = str(l);
    //} else {
    //  r = pow(r,l);
    //  dVal = str(r);
    //}
  //}
}
println("l;"+l+" r:" + r + " op:" + op + "result:" + result + "left:" + left);
}
void updateDisplay() {
  fill(80);
  rect(160, 60, width, 118);
  fill(255);
  textAlign(RIGHT);
  if (dVal.length() < 12) {
    textSize(50);
  } else if (dVal.length() < 20 ) {
    textSize(30);
  } else {
    textSize(20);
  }

  text(dVal, width-15, 80);
}

void preformCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }

  dVal = str(result);
  l = result;
  left = true;
}
