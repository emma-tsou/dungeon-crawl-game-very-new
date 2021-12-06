class Hero extends GameObject {

  float speed;
  int immunity;
  Weapon myWeapon;
  AnimatedGIF currentAction;

  Hero() {
    super();
    speed = 3;
    roomX = 1;
    roomY = 1;
    myWeapon = new SniperRifle();
    hp = 100;
    size = 40;
    currentAction= manDown;
    immunity = 0;
  }


  void show() {
    ////Character
    //fill(purple);
    //stroke(black);
    //strokeWeight(2);
    //circle(loc.x, loc.y, size);
    
    currentAction.show(loc.x, loc.y, size, size);
    
    //Health Bar
    rectMode(CORNER);
    fill(red);
    stroke(black);
    strokeWeight(1);
    rect(loc.x-50, loc.y+50, 100, 15);
    
    fill(green);
    stroke(black);
    strokeWeight(1);
    rect(loc.x-50, loc.y+50, hp, 15);
    
  }

  void act() {
    super.act();
    //zoom
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
      roomY = roomY + 1;
      loc = new PVector(width/2, height*0.1+0);
    }
    //west
    if (westRoom != #FFFFFF && loc.x == width*0.1 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX - 1;
      loc = new PVector(width*0.9-10, height/2);
    }
    
    //gun go bang bang pew pew
    myWeapon.update();
    if (space) myWeapon.shoot();
    
    //check for collisions
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof EnemyBullet && isCollidingWith(myObj)) {
        hp = hp - 10;
        myObj.hp = 0;
      }
      if (myObj instanceof Enemy && isCollidingWith(myObj) & immunity > 5) {
       hp = hp-2;
       immunity = 0;
      }
      if (myObj instanceof DroppedItem && isCollidingWith(myObj)) {
        DroppedItem item = (DroppedItem) myObj;
        if (item.type == GUN) {
          myWeapon = item.w;
          item.hp = 0;
        }
      }
      i++;
    }
    immunity++;
  }//end of act
}//end of class
