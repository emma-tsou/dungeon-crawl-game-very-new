class Turret extends Enemy {

  Turret() {
  }

  void show() {
    fill(pink);
    stroke(black);
    strokeWeight(2);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(size*0.4);
    text(hp, loc.x, loc.y);
  }

  void act() {
  }
}
