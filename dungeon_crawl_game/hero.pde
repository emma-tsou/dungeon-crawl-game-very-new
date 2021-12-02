class Hero extends GameObject {

  float speed;
  Weapon myWeapon;

  Hero() {
    super();
    speed = 3;
    roomX = 1;
    roomY = 1;
    myWeapon = new AutoPistol();
  }


  void show() {
    fill(purple);
    stroke(black);
    strokeWeight(2);
    circle(loc.x, loc.y, 40);
  }

  void act() {
    super.act();

    if (w) vel.y = -speed;
    if (a) vel.x = -speed;
    if (s) vel.y = speed;
    if (d) vel.x = speed;

    if (vel.mag() > 5) vel.setMag(speed); 

    if (!w && !s) vel.y = vel.y * 0.75;
    if (!a && !d) vel.x = vel.x * 0.75;

    //check exits
    //north
    if (northRoom != #FFFFFF && loc.y == height*0.1 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY = roomY - 1;
      loc = new PVector(width/2, height*0.9-10);
    }
    //east
    if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX + 1;
      loc = new PVector(width*0.1+10, height/2);
    }
    //south
    if (southRoom != #FFFFFF && loc.y == height*0.9 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY = roomY - 1;
      loc = new PVector(width/2, height*0.1+0);
   
    //west
    if (westRoom != #FFFFFF && loc.x == width*0.1 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX - 1;
      loc = new PVector(width*0.9-10, height/2);
    }
    myWeapon.update();
    if (space) myWeapon.shoot();

    //check for collisions
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof EnemyBullet && isCollidingWith(myObj)) {
        hp = hp - int(myObj.vel.mag());
        myObj.hp = 0;
      }
      if (myObj instanceof DroppedItem && isCollidingWith(myObj)) {
        DroppedItem item = (DroppedItem) myObj;
        if (item.type == GUN) {
          myWeapon = item.w;
        }
      }
      i++;
    }
  }//end of act
}//end of class
}
