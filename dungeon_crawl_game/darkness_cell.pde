class DarknessCell {
  float opacity;
  float x, y, size;
  float d;

  DarknessCell(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 0;
  }
  
  
  void show() {
   fill(black, opacity);
   noStroke();
   d = dist(myHero.loc.x, myHero.loc.y, x, y);
   opacity = map(d, 0, 300, 0, 255);
   rectMode(CENTER);
   square(x, y, size);
  }
  
  void act() {
    
  }
  
}
