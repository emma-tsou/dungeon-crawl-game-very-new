void pause() {
  click();

  if (e) {
    e = false;
    mode = GAME;
  }

  background(pink); 
  
  textAlign(CENTER);
  fill(black);
  textSize(50);
  text("XP: "+myHero.xp, width/2, height*0.1);
  //hey grayson add the hp text on monday you idiot
  
  //hp button
  hpButton.show();
  hpButton.act();

  if (hpButton.clicked && myHero.xp >= 5) {
    myHero.xp = myHero.xp - 5;
    myHero.hpMax = myHero.hpMax + 5;
  }
}
