class Bullet extends GameObject {
  color CBullet;
  Bullet(PVector a, color c, int s) {
  hp = 1;
  loc = new PVector(myHero.loc.x, myHero.loc.y);
  vel = a;
  size = s;
  CBullet = c;
  
  roomX = myHero.roomX;
  roomY = myHero.roomY;
 }
 
 void show() {
   stroke(CBullet);
   strokeWeight(4);
   noFill();
   circle(loc.x, loc.y, size);
 }
 
 void act() {
 }
}

class EnemyBullet extends GameObject {
  color CBullet;
  EnemyBullet(PVector a, color c, int s, float posx, float posy) {
  hp = 1;
  loc = new PVector(posx, posy);
  vel = a;
  size = s;
  CBullet = c;
  
  roomX = myHero.roomX;
  roomY = myHero.roomY;
 }
 
 void show() {
   stroke(CBullet);
   strokeWeight(4);
   noFill();
   circle(loc.x, loc.y, size);
 }
 
 void act() {
 }
}
