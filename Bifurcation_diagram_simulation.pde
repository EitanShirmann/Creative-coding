float fingraph = 0.0;
int count = 0;

float x =0.0;
float xp = x;
          
float r = 0.0;
          
float n = 15;
float inc = 4;

void setup(){
  size(1500,750);
  background(50);
  
}
         

void draw(){
   //println(r+" "+equation(r,40)/1000.0); 
   r+=0.003;
   count+=1;
   for(int i =40;i<50;i++){
   stroke(255);
   ellipse(count,700-equation(r,i),1,1);
 }
   }
   
float equation(float r,int k){
  float x =0.1;
float xp = x;

float fineq = 0;

float inc = 4;


  for(int i = 0; i<k;i++){
  int xgraph = round(x*750);

x = r*xp*(1.0-xp);
xp=x;
n+=inc;  
fineq = xgraph;
}
return fineq;
  
}
