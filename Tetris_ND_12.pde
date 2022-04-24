GameBoy gb = new GameBoy();
void setup(){
  size(285,565);
  gb.begin(0);
}
int i=0;
void draw() {
  gb.drawDisplay();
  delay(500);
  drawBlock(I_Block_1,3,i);
  i++;
}

void drawBlock(byte[][] arr,int x ,int y){
  for(int i = 0; i<4;i++){
    for(int j = 0; j<4;j++){
      if(arr[j][i] ==1){
        gb.drawPoint(x+i,y+j);
      }
    }
  }
}
