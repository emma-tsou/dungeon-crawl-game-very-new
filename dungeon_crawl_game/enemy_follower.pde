class Follower extends Enemy {
  
  Follower(int x, int y) {
    super(100, 50, x, y);
  }
  
  void show() {
    stroke(black);
    strokeWeight(2);
    fill(green);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(15);
    text(hp, loc.x, loc.y);
    
  }
  
  void act() {
    super.act();
    
    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y); 
    vel.setMag(3);
  }
}
