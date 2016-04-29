import processing.opengl.*;
PImage tex;
PImage bg;
float inc = 0.0;
float spin = 0.0;
float rotx = PI/4;
float roty = PI/4;

void setup()
{
  size(800,1280,OPENGL);
  tex = loadImage("texture.jpg");
  bg = loadImage("background.jpg");
  textureMode(NORMAL);
  stroke(255);
}

void draw()
{
  background(bg);
  inc +=0.01;
  spin +=0.01;
  
  pushMatrix();
  fill(0,130,150,150);
  translate(mouseX, mouseY,0);
  rotateX(mouseX*0.01);
  rotateY(mouseY*0.01 + spin);
  // rotateZ(inc);
  box(150);
  popMatrix();
  TexturedCube(tex);

}
 void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);

  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);

  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
