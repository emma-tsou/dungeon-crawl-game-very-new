class Message extends GameObject {
  String text;
  Message(PVector L, String x) {
    loc = L;
    text = x;

    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    fill(red);
    textSize(30);
    text(text, loc.x, loc.y);
  }


  void act() {
    loc.y = loc.y - 2;
  }
}
