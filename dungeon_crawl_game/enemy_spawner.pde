class Spawner extends Enemy {
  int timer;
 Spawner(int x, int y, float posx, float posy) {
   super(100, 50, x, y, posx, posy);
   timer = 300;
    xp = 10;
 }
 
 void show() {
   fill(yellow);
   stroke(black);
   strokeWeight(2);
   circle(loc.x, loc.y, size);
   fill(black);
   textSize(size*0.40);
   text(hp, loc.x, loc.y);
 }
 
 void act() {
   super.act();
   //spawn follower thingy
   timer++;
   if (timer == 600) {
    
     myObjects.add(new Follower(myHero.roomX, myHero.roomY, loc.x, loc.y));
     timer = 0;
   }
 }
}
