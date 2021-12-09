final int AMMO = 0;
final int HEALTH = 1;
final int GUN = 2;

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//settings: enemies
final int TURRET_HP = 50;
final int TURRET_SIZE = 50;
final int TURRET_THRESHOLD = 60;
final int TURRET_BULLET_SPEED = 5; 

final int SPAWNINGPOOL_HP = 50;
final int SPAWNINGPOOL_SIZE = 100;
final int SPAWNINGPOOL_THRESHOLD = 100;
final int x = 0;
final int y = 0;

//keyboard input
boolean w, a, s, d, space;

//color pallette
color blue = #1EE7FB;
color green = #C3F83C;
color pink = #F1416B;
color purple = #C981E6;
color yellow = #FFF387;
color Dgray = #1C0F00;
color Dbrown = #6B4F00;
//color brown = #987G1D;
color black = #000000;
color gray = #4D4242;
color red = #FF0000;

//mouse
boolean mouseReleased;
boolean wasPressed;
//settings: weapons


PFont volcanicDungeon;
PImage map;
color northRoom, eastRoom, southRoom, westRoom;
Hero myHero;
ArrayList <DarknessCell> darkness;

//Game objects
ArrayList<GameObject> myObjects;

Button introButton;

AnimatedGIF nightsky;
AnimatedGIF manUp;
AnimatedGIF manDown;
AnimatedGIF manLeft;
AnimatedGIF manRight;


void setup() {
  size(800, 600, FX2D);

  //Alignments
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  //nightsky = new AnimatedGIF (12, "frame_", "_delay-0.07s.png", 0, 0, 600, 800);

  //images
  map = loadImage("map.png");
  //create objects
  myObjects = new ArrayList<GameObject>(1000);
  
  introButton = new Button("START", width/2, height/2, 200, 100, red, black);
  
  manUp = new AnimatedGIF(4, 10, "man/up/sprite_", ".png");
  manDown = new AnimatedGIF(4, 10, "man/down/sprite_", ".png");
  manLeft = new AnimatedGIF(4, 10, "man/left/sprite_", ".png");
  manRight = new AnimatedGIF(4, 10, "man/right/sprite_", ".png");
  myHero = new Hero();
  myObjects.add(myHero); 
  ////myObjects.add(new Enemy());
  //myObjects.add(new Follower(1, 2));
  //myObjects.add(new Follower(2, 1));

  //create darkness
  darkness = new ArrayList<DarknessCell>(1000);
  int size = 5;
  int x = size/2; 
  int y = size/2;

  while (y < height) {
    darkness.add(new DarknessCell(x, y, size)); 
    x = x + size;
    if (x >= width+1) {
      y = y+size;
      x = size/2;
    }
  }
  
  x = 0;
  y = 0;
  while (y < map.height) {
   color roomColor = map.get(x, y);
   
   if (roomColor == red) {
    myObjects.add(new Turret(x, y, width*0.3, height/2));
    myObjects.add(new Turret(x, y, width*0.7, height/2));
   }
   
   if (roomColor == blue) {
     myObjects.add(new Follower(x, y, width*0.3, height/2));
     myObjects.add(new Follower(x, y, width*0.7, height/2));
   }
   
   if (roomColor == yellow) {
     myObjects.add(new Spawner(x, y, width*0.3, height/2));
     myObjects.add(new Spawner(x, y, width*0.7, height/2));
   }
   
   x++;
   if (x == map.width) {
    x = 0;
    y++;
   }
  }






  //Load Fonts
  volcanicDungeon = createFont("Volcanic Dungeon.ttf", 50);

  //Load GIFs
  AnimatedGIF introGIF;

  //Initialize
  mode = INTRO;

  //loading the enemies from the map
  x = 0;
  y = 0;
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == pink) {
      myObjects.add(new Enemy(x, y));
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
}

void draw() {



  //mode framework
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else {
    println ("Mode error : " + mode);
  }
}
