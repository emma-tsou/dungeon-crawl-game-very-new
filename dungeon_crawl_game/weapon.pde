class Weapon {
  
  int shotTimer;
  int threshold;
  int bulletSpeed;   //speed of projectile
  
  Weapon() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
    
    
  }
  
  Weapon(int thr, int bs) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
  }
  
  void update() {
    shotTimer++;
  }
  
  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
   aimVector.setMag(bulletSpeed);
   myObjects.add(new Bullet(aimVector, purple, 10));
   shotTimer = 0;
  }
    
  }
  
  
}
  
  
