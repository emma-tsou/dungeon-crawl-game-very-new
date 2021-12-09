class Button {
 float x, y, w, h;
 boolean clicked;
 color highlight, normal;
 String text;
  Button(String t, float _x, float _y, float _w, float _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }
  
  void show() {
    //rectangle
    rectMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
     fill(highlight); 
    } else {
     fill(normal); 
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);
    
    //text label
    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
     fill(normal); 
    } else {
     fill (highlight); 
    }
    textSize(w/4);
    text(text, x, y-8);
    
    if (mouseReleased && mouseX > x-w/2 & mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
     clicked = true; 
    } else {
     clicked = false; 
    }
  }
  
  void act() {
    
  }
}
