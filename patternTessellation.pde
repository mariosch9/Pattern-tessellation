int smallGridX, smallGridY;  
int largeGridX, largeGridY;  
int rectangleSize = 10;  
int tileSize = 55;
int XIndex;
int YIndex;    
int[][][] grid = new int[50][5][5];
int[] rectangleX = new int[6];
int[] rectangleY =  new int[6];
int[][] tileGrid = new int[5][5];


//initializing the buttons
int resetBtnX = 20;
int resetBtnY = 200;
int rtBtnX = 20;
int rtBtnY = 250;
int transpBtnX = 20;
int transpBtnY = 300;
int rotateBtnX = 20;
int rotateBtnY = 350;

int blackX = 40;
int blackY = 145;
int redX = 120;
int redY= 145;
int greenX = 80;
int greenY = 145;
int blueX = 100;
int blueY = 145;
int yellowX = 60;
int yellowY = 145;
int rgbSize = 20;
int ButtonSize = 30;
int colorNum = 1;

boolean colorBool;
boolean transpBool = false;
boolean rotateBool = false;
boolean resetBool = false;
boolean rtBool = false;

void setup() {
  size(900, 750);
  background(255, 255, 255);
  rectMode(CORNER);
  ellipseMode(CORNER);
  smallGridX = 55;
  smallGridY = 50;
  largeGridX = 190;
  largeGridY = 50;

  drawTile(tileGrid, smallGridX, smallGridY);
  PFont f;
    f = createFont("Arial", 16, true);

    background(255);
    textFont(f, 16);                  // font to be used
    fill(0, 0, 0);                         //   font color 
    text("reset", 60, 220);
    text("90 degrees rotation", 60, 270);
    text("transpose", 60, 320);
    text("45 degrees rotation", 60, 370);
}

void draw() {
  
  drawGrid();
  drawTile(tileGrid, smallGridX, smallGridY);
  Rect();
  choices();
  
}

void drawTile(int[][] tile, int x, int y) {
  int offsetX = x;
  int offsetY = y;
  int space = 1;
  for (int i = 0; i < tile.length; i++) {
    offsetY = y;
    fill(255, 255, 255);                 

    for (int j = 0; j<tile.length; j++) {
      //filling the large grid
      if (tile[i][j] == 1)          
        fill(0, 0, 0);              
      else if (tile[i][j] == 2)       
        fill(250, 0, 0);
      else if (tile[i][j] == 3)    
        fill(0, 250, 0);
      else if (tile[i][j] == 4)      
        fill(0, 0, 250);
      else if (tile[i][j] == 5)      
        fill(255, 255, 0);

      stroke(150, 150, 150);
      rect(offsetX, offsetY, rectangleSize, rectangleSize);

      if (i == 4) {              
        rectangleY[j] = offsetY;
      }
      offsetY = offsetY + rectangleSize + space;
      fill(255, 255, 255);
    }

    rectangleX[i] = offsetX;
    offsetX = offsetX + rectangleSize + space;
  }

  rectangleX[5] = offsetX;
  rectangleY[5] = offsetY;
}

void drawGrid() {

  if (resetBool)
    reset();

  if (rotateBool)
    rotateNinety();
    
  if (rtBool)
    rotateFourtyfive();

  if (transpBool)
    transposing();
  largeGridX = 200;
  largeGridY = 60;

  for (int i = 0; i< 10; i++) {
    largeGridX = 200;
    for (int j = 0; j < 10; j++) {

      drawTile(grid[j], largeGridX, largeGridY);

      largeGridX = largeGridX + tileSize;
    }
    largeGridY = largeGridY + tileSize;
  }
}

void choices() {

  fill(0, 0, 0);
  ellipse(blackX, blackY, rgbSize, rgbSize);
  
  fill(255, 255, 0);
  ellipse(yellowX, yellowY, rgbSize, rgbSize);
  
  fill(255, 102, 0);
  rect(rtBtnX, rtBtnY, ButtonSize, ButtonSize);

  fill(250, 0, 0);
  ellipse(redX, redY, rgbSize, rgbSize);


  fill(0, 255, 255);
  rect(resetBtnX, resetBtnY, ButtonSize, ButtonSize);
  fill(0, 0, 255);
  ellipse(blueX, blueY, rgbSize, rgbSize);

  fill(0, 250, 0);
  rect(transpBtnX, transpBtnY, ButtonSize, ButtonSize);
  ellipse(greenX, greenY, rgbSize, rgbSize);
  
  fill(103, 62, 150);
  rect(rotateBtnX, rotateBtnY, ButtonSize, ButtonSize);
  
}

void reset() {
  for (int i = 0; i< grid.length; i++)
    grid[i] = tileGrid;
}

void transposing() {
  for (int i = 0; i< grid.length; i++)
    grid[i] = transpose(tileGrid);
}

void rotateNinety() {
  int[][] rotate90 = rotateTile(transpose(tileGrid));
  int[][] rotate180 = rotateTile(transpose(rotate90));
  int[][] rotate270 = rotateTile(transpose(rotate180));

  for (int i = 0; i< grid.length; i++) {
    if (i == 0)
      grid[i] = tileGrid;

    if (i== 1)
      grid[i] = rotate90;

    if (i == 2)
      grid[i] =  rotate180;

    if (i == 3)
      grid[i] = rotate270;


    if (i >= 4)
      if (i%4 ==0)
        grid[i] = tileGrid;
      else if (i%4 == 1)
        grid[i] = rotate90;
      else if (i%4 == 2)
        grid[i] =  rotate180;
      else if (i%4 == 3)
        grid[i] = rotate270;
  }
}

void rotateFourtyfive() {
  int[][] rotate45 = rotateTile(transpose(tileGrid));
  int[][] rotate135 = rotateTile(transpose(rotate45));
  int[][] rotate225 = rotateTile(transpose(rotate135));
  int[][] rotate315 = rotateTile(transpose(rotate225));

  for (int i = 0; i< grid.length; i++) {
    if (i == 0)
      grid[i] = tileGrid;

    if (i== 1)
      grid[i] = rotate45;
      rotate(radians(45));

    if (i == 2)
      grid[i] =  rotate135;
      rotate(radians(135));

    if (i == 3)
      grid[i] = rotate225;
      rotate(radians(225));
      
    if (i == 4)
      grid[i] = rotate315;
      rotate(radians(315));


    if (i >= 4)
      if (i%4 ==0)
        grid[i] = tileGrid;
      else if (i%4 == 1)
        grid[i] = rotate45;
      else if (i%4 == 2)
        grid[i] =  rotate135;
      else if (i%4 == 3)
        grid[i] = rotate225;
      
  }
}

int[][] transpose(int[][] tile) {
  int [][] trans = new int[tile.length][tile.length];

  for (int i = 0; i < tile.length; i++)
    for (int j = 0; j < tile.length; j++)
      trans[j][i] = tile[i][j];

  return trans;
}

int[][] rotateTile(int[][] tile) {
  int [][] rot = new int[tile.length][tile.length];
  
  for (int i = 0; i < tile.length; i++)                       
    for (int j = 0, k = tile.length - 1; j <= k; j++, k--) {      
      
      rot[j][i] = tile[k][i];
      rot[k][i] = tile[j][i];
    }


  return rot;
}

boolean Black() {
  if (mouseX >= blackX && mouseX < blackX+rgbSize &&
    mouseY >=blackY && mouseY <= blackY+rgbSize)
    return true;

  else
    return false;
}

boolean Yellow() {
  if (mouseX >= yellowX && mouseX < yellowX+rgbSize &&
    mouseY >=yellowY && mouseY <= yellowY+rgbSize)
    return true;

  else
    return false;
}

boolean Red() {
  if (mouseX >= redX && mouseX < redX+rgbSize &&
    mouseY >=redY && mouseY <= redY+rgbSize)
    return true;

  else
    return false;
}
boolean Green() {
  if (mouseX >= greenX && mouseX < greenX+rgbSize &&
    mouseY >=greenY && mouseY <= greenY+rgbSize)
    return true;

  else
    return false;
}
boolean Blue() {
  if (mouseX >= blueX && mouseX < blueX+rgbSize &&
    mouseY >=blueY && mouseY <= blueY+rgbSize)
    return true;

  else
    return false;
}


boolean RotButton() {
  if (mouseX >= rtBtnX && mouseX < rtBtnX+ButtonSize &&
    mouseY >=rtBtnY && mouseY <= rtBtnY+ButtonSize)
    return true;
  else
    return false;
}


boolean ResetButton() {
  if (mouseX >= resetBtnX && mouseX < resetBtnX+ButtonSize &&
    mouseY >=resetBtnY && mouseY <= resetBtnY+ButtonSize)
    return true;
  else
    return false;
}

boolean TranspButton() {
  if (mouseX >= transpBtnX && mouseX < transpBtnX+ButtonSize &&
    mouseY >=transpBtnY && mouseY <= transpBtnY+ButtonSize)
    return true;
  else
    return false;
}

boolean RtButton() {
  if (mouseX >= rotateBtnX && mouseX < rotateBtnX+ButtonSize &&
    mouseY >=rotateBtnY && mouseY <= rotateBtnY+ButtonSize)
    return true;
  else
    return false;
}

//swaps the values from false to true 
//to the plce where the user clicked on the grid
boolean Rect() {
  
    
  if (mouseX >= rectangleX[0] && mouseX <= rectangleX[1] &&
    mouseY >= rectangleY[0] && mouseY <= rectangleX[1]) {
    XIndex = 0;
    YIndex = 0;
    return true;
  }

  if (mouseX >= rectangleX[1] && mouseX <= rectangleX[2] &&
    mouseY >= rectangleY[0] && mouseY <= rectangleX[1]) {
    XIndex = 1;
    YIndex = 0;
    return true;
  }
  if (mouseX >= rectangleX[2] && mouseX <= rectangleX[3] &&
    mouseY >= rectangleY[0] && mouseY <= rectangleX[1]) {
    XIndex = 2;
    YIndex = 0;
    return true;
  }
  if (mouseX >= rectangleX[3] && mouseX <= rectangleX[4] &&
    mouseY >= rectangleY[0] && mouseY <= rectangleX[1]) {
    XIndex = 3;
    YIndex = 0;
    return true;
  }
  if (mouseX >= rectangleX[4] && mouseX <= rectangleX[5] &&
    mouseY >= rectangleY[0] && mouseY <= rectangleX[1]) {
    XIndex = 4;
    YIndex = 0;
    return true;
  }
      
  else if (mouseX >= rectangleX[0] && mouseX <= rectangleX[1] &&
    mouseY >= rectangleY[1] && mouseY <= rectangleY[2]) {
    XIndex = 0;
    YIndex = 1;
    return true;
  } else if (mouseX >= rectangleX[1] && mouseX <= rectangleX[2] &&
    mouseY >= rectangleY[1] && mouseY <= rectangleY[2]) {
    XIndex = 1;
    YIndex = 1;
    return true;
  } else if (mouseX >= rectangleX[2] && mouseX <= rectangleX[3] &&
    mouseY >= rectangleY[1] && mouseY <= rectangleY[2]) {
    XIndex = 2;
    YIndex = 1;
    return true;
  } else if (mouseX >= rectangleX[3] && mouseX <= rectangleX[4] &&
    mouseY >= rectangleY[1] && mouseY <= rectangleY[2]) {
    XIndex = 3;
    YIndex = 1;
    return true;
  } else if (mouseX >= rectangleX[4] && mouseX <= rectangleX[5] &&
    mouseY >= rectangleY[1] && mouseY <= rectangleY[2]) {
    XIndex = 4;
    YIndex = 1;
    return true;
  }
   
  else if (mouseX >= rectangleX[0] && mouseX <= rectangleX[1] &&
    mouseY >= rectangleY[2] && mouseY <= rectangleY[3]) {
    XIndex = 0;
    YIndex = 2; 
    return true;
  } else if (mouseX >= rectangleX[1] && mouseX <= rectangleX[2] &&
    mouseY >= rectangleY[2] && mouseY <= rectangleY[3]) {
    XIndex = 1;
    YIndex = 2; 
    return true;
  } else if (mouseX >= rectangleX[2] && mouseX <= rectangleX[3] &&
    mouseY >= rectangleY[2] && mouseY <= rectangleY[3]) {
    XIndex = 2;
    YIndex = 2; 
    return true;
  } else if (mouseX >= rectangleX[3] && mouseX <= rectangleX[4] &&
    mouseY >= rectangleY[2] && mouseY <= rectangleY[3]) {
    XIndex = 3;
    YIndex = 2; 
    return true;
  } else if (mouseX >= rectangleX[4] && mouseX <= rectangleX[5] &&
    mouseY >= rectangleY[2] && mouseY <= rectangleY[3]) {
    XIndex = 4;
    YIndex = 2; 
    return true;
  }

  
  else if (mouseX >= rectangleX[0] && mouseX <= rectangleX[1] &&
    mouseY >= rectangleY[3] && mouseY <= rectangleY[4]) {
    XIndex = 0;
    YIndex = 3;
    return true;
  } else if (mouseX >= rectangleX[1] && mouseX <= rectangleX[2] &&
    mouseY >= rectangleY[3] && mouseY <= rectangleY[4]) {
    XIndex = 1;
    YIndex = 3;
    return true;
  } else if (mouseX >= rectangleX[2] && mouseX <= rectangleX[3] &&
    mouseY >= rectangleY[3] && mouseY <= rectangleY[4]) {
    XIndex = 2;
    YIndex = 3;
    return true;
  } else if (mouseX >= rectangleX[3] && mouseX <= rectangleX[4] &&
    mouseY >= rectangleY[3] && mouseY <= rectangleY[4]) {
    XIndex = 3;
    YIndex = 3;
    return true;
  } else if (mouseX >= rectangleX[4] && mouseX <= rectangleX[5] &&
    mouseY >= rectangleY[3] && mouseY <= rectangleY[4]) {
    XIndex = 4;
    YIndex = 3;
    return true;
  }
  
  else if (mouseX >= rectangleX[0] && mouseX <= rectangleX[1] &&
    mouseY >= rectangleY[4] && mouseY <= rectangleY[5]) {
    XIndex = 0;
    YIndex = 4;
    return true;
  } else if (mouseX >= rectangleX[1] && mouseX <= rectangleX[2] &&
    mouseY >= rectangleY[4] && mouseY <= rectangleY[5]) {
    XIndex = 1;
    YIndex = 4;
    return true;
  } else if (mouseX >= rectangleX[2] && mouseX <= rectangleX[3] &&
    mouseY >= rectangleY[4] && mouseY <= rectangleY[5]) {
    XIndex = 2;
    YIndex = 4;
    return true;
  } else if (mouseX >= rectangleX[3] && mouseX <= rectangleX[4] &&
    mouseY >= rectangleY[4] && mouseY <= rectangleY[5]) {
    XIndex = 3;
    YIndex = 4;
    return true;
  } else if (mouseX >= rectangleX[4] && mouseX <= rectangleX[5] &&
    mouseY >= rectangleY[4] && mouseY <= rectangleY[5]) {
    XIndex = 4;
    YIndex = 4;
    return true;
  } else
    return false;
}

void mousePressed() {
  rotateBool = false;
  resetBool = false;
  transpBool = false;
  rtBool = false;
  if ( Rect()) {
    if ( tileGrid[XIndex][YIndex] == colorNum)
      tileGrid[XIndex][YIndex] = 0 ;

    else if ( tileGrid[XIndex][YIndex] == 0)
      tileGrid[XIndex][YIndex] = colorNum ;
  }

  if (RotButton()) {
    rotateBool = true;
    } 

  if (ResetButton()) {
    resetBool = true;
    }

  if (TranspButton()) {
    transpBool = true;
   }
  
   if (RtButton()) {
    rtBool = true;
  }

  if (Black()) {
    colorNum = 1;
    PFont f;
    f = createFont("Arial", 16, true);

    background(255);
    textFont(f, 16);                  
    fill(0);                          
    text("Black", 65, 135);   
  }
  
  if (Yellow()) {
    colorNum = 5;
    PFont f;
    f = createFont("Arial", 16, true);

    background(255);
    textFont(f, 16);                  
    fill(255, 255, 0);                          
    text("Yellow", 65, 135);   
  }

  

  if (Green()) {
    colorNum = 3;
    PFont f;
    f = createFont("Arial", 16, true);

    background(255);
    textFont(f, 16);                 
    fill(0, 255, 0);                          
    text("Green", 65, 135);   
  }
  if (Blue()) {

    colorNum = 4;
    PFont f;
    f = createFont("Arial", 16, true);

    background(255);
    textFont(f, 16);                  
    fill(0, 0, 255);                          
    text("Blue", 65, 135);   
  }
  
  
  if (Red()) {
    colorNum = 2;
    PFont f;
    f = createFont("Arial", 16, true);

    background(255);
    textFont(f, 16);                  
    fill(255, 0, 0);                         
    text("Red", 65, 135);   
   }
}
