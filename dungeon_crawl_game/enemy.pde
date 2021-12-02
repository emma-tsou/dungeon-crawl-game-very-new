class Enemy extends GameObject {

  Enemy() {
    hp = 100;
    roomX = 1;
    roomY = 1;
  }

  Enemy(int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    size = 50;
    roomX = x;
    roomY = y;
  }

  Enemy(int _hp, int s, int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY = y;
  }

  void show() {
    stroke(3, 3, 3);
    strokeWeight(2);
    fill(99, 234, 88);
    ellipse(50, 50, 50, 50);
    fill(3, 3, 3);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {
        hp = hp - int(obj.vel.mag());
        obj.hp = 0;
        if (hp <= 0) {
          //explode(size);
          myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY));
        }
      }
      i++;
    }
  }//end of act
}//end of class
