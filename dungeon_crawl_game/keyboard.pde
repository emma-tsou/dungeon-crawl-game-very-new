void keyPressed() {
  if (key == 'w' || key == 'W') w = true;
  if (key == 'a' || key == 'A') a = true;
  if (key == 's' || key == 'S') s = true;
  if (key == 'd' || key == 'D') d = true;
  if (key == ' ') space = true;
  if (key == 'e' || key == 'E') e = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') w = false;
  if (key == 'a' || key == 'A') a = false;
  if (key == 's' || key == 'S') s = false;
  if (key == 'd' || key == 'D') d = false;
  if (key == ' ') space = false;
  if (key == 'e' || key == 'E') e = false;
}
