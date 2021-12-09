class AnimatedGIF {

  //instance variables
  PImage[] images;
  int numFrames;
  int currentFrame;
  //int i;
  float x, y, w, h;
  int rate;

  //constructors
  AnimatedGIF(int nf, String pre, String post) {

    x = width/2;
    y = height/2;
    w = width;
    h = height;
    numFrames = nf;
    images = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      images[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }

  AnimatedGIF(int nf, int r, String pre, String post) {
    numFrames = nf;
    images = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      images[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
    rate = r;
  }

  AnimatedGIF(int nf, String pre, String post, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    numFrames = nf;
    images = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      images[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }



  //behaviour functions
  void show() {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(images[currentFrame], x, y, w, h);
    currentFrame++;
  }

  void show(float x, float y, float w, float h) {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(images[currentFrame], x, y, w, h);
    //currentFrame++;
    if (frameCount % rate == 0) currentFrame++;
  }
}
