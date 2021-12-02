void game() {
  drawRoom();
  drawGameObject();
  drawLightLayer();
  drawMiniMap();
}

void drawRoom() {
 background(gray);
  //draw corners
  stroke(3, 3, 3);
  strokeWeight(4);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  //draw exits
  //1 - find out which directions have exits
  
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom  = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  //2 - draw doors where there are exits
  noStroke();
  fill(3, 3, 3);
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  //draw floor
  rectMode(CENTER);
  stroke(3, 3, 3);
  fill(72, 47, 47);
  rect(width/2, height/2, width*0.8, height*0.8);


  int i = 0; 
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show();
      obj.act();
      if (obj.hp <= 0) {
        myObjects.remove(i);
        i--;
      }
    }
    i++;
  }
  
}

void drawGameObject() {
  
}

void drawLightLayer() {
  
}

void drawMiniMap() {
  int size = 10;
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      fill(map.get(x, y), 100);
      square(x*size+50, y*size+50, size);
    }
  }
  fill(purple);
  
}
