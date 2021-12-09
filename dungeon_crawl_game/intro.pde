void intro() {
  click();
  //nightsky.show();
  background(gray);
  
  introButton.show();
  introButton.act();
  
  if (introButton.clicked) {
   mode = GAME; 
  }
}
