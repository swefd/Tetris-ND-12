GameBoy gb = new GameBoy();

int x = 2;
int y = -1;
int rot = 0;
int speed = 200;
int acc = 1; // Expl

void setup(){
  size(285,565);
  gb.begin(0);
  createBlock( (int) random(7) );
}

void draw() {
  gb.drawDisplay();
  
  if (y < 15){
    drawBlock(gb.block[rot], x, y);
    y++;
  } else {
    createBlock( (int) random(7) );
  }
  
  delay(speed);
}

void keyPressed(){
  if (gb.getKey() == 4){
   x--; 
  }
  if (gb.getKey() == 5){
   x++; 
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
