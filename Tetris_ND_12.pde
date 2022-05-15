GameBoy gb = new GameBoy();

int x = 2;
int y = -1;

int nX = 0;
int nY = 0;

int rot = 0;
int speed = 200;
int acc = 1; // Expl

int level = 0;
int score = 0;
boolean gameOver = true;

void setup(){
  size(285,565);
  gb.begin(0);
  createBlock( (int) random(7) );
}

void draw() {
  if (gameOver){    
     gb.drawPoint(nX, nY);
     
     if(nX < 8){ 
       nX++;
     } else {
       nX = 0;
       if(nY <= 15){
         nY++;
       } else{
         gameOver = false;
         nY = 0;
         nX = 0;
       }
     }
     delay(1);
    
  } else {
  
    if (gb.checkBlockCollision(gb.block[rot], x, y + 1)) {
      gb.memBlock(gb.block[rot], x, y);
      
      // 
      if (y <=1){
        gameOver = true;
        gb.display = new boolean[8][16];
        println("----Game Over----");
        println("- Score: " + score + " -");
        score = 0;
        level = 0;
      }
      
      int lines = gb.fullLine();
      
      if (lines != 0) {
        score += lines;
        level +=lines;
      }
      
      if (level >= 5) {
        acc += 1;
        level=0;
      } else {
        acc=1;
      }
  
  
      
      createBlock((int)random(0, 7));
    } else {
      y++;
    }
    gb.drawDisplay();
    drawBlock(gb.block[rot], x, y);
    delay(speed / acc);
  
  }
  
  
}

void keyPressed(){
  
  if (gb.getKey() == 6){
    if(!gb.checkBlockCollision(gb.block[rot], x, y + 1)){
      y++;
    }
  }
  
  if (gb.getKey() == 4){
    if(!gb.checkBlockCollision(gb.block[rot], x - 1, y)){
      x--; 
    }
   
  }
  if (gb.getKey() == 5){
   if(!gb.checkBlockCollision(gb.block[rot], x + 1, y)){
      x++; 
    }
  }
  
  if(gb.getKey() == 3){
    
    int tempRot = rot;
    
    if(tempRot < 3){
     tempRot++; 
    }else {
      tempRot = 0;
    }
    
    if(!gb.checkBlockCollision(gb.block[tempRot], x + 1, y)){
      rot = tempRot;
    }
     
      
  }
  
}

void drawBlock(byte[][] arr,int x ,int y){
  for(int i = 0; i<4; i++){
    for(int j = 0; j<4;j++){
      if(arr[j][i] ==1){
        gb.drawPoint(x+i,y+j);
      }
    }
  }
}

void createBlock(int num){
  x = 2;
  y = -1;
  rot = (int)random(4);
  if (num == 0) gb.generateBlock(gb.block, I_Block_1, I_Block_2, I_Block_3, I_Block_4);
  if (num == 1) gb.generateBlock(gb.block, Z_Block_1, Z_Block_2, Z_Block_3, Z_Block_4);
  if (num == 2) gb.generateBlock(gb.block, S_Block_1, S_Block_2, S_Block_3, S_Block_4);
  if (num == 3) gb.generateBlock(gb.block, L_Block_1, L_Block_2, L_Block_3, L_Block_4);
  if (num == 4) gb.generateBlock(gb.block, J_Block_1, J_Block_2, J_Block_3, J_Block_4);
  if (num == 5) gb.generateBlock(gb.block, T_Block_1, T_Block_2, T_Block_3, T_Block_4);
  if (num == 6) gb.generateBlock(gb.block, O_Block_1, O_Block_2, O_Block_3, O_Block_4);

}
