double i;
double r;
int iterations = 0; 
boolean pressed = false;

double scale = 1;


double lastPointX = 13*width*2/3;
double lastPointY = 4*height;


void setup(){
 size(1200,800);
}


int  x = 0;
int y = 0;




void draw(){
  loadPixels();


    for(int x = 0; x<width; x++){
      for(int y = 0; y<height; y++){
        int curr = x+y*width;
 
        pixels[curr] = color(0,0,5*mandelbrot(x(x),y(y),40));
      }
    }
  
 
  
  if(iterations==40){
    iterations = 0; 
  }
  iterations++;
  
  updatePixels();
}
  

//calculating if the point belongs to the madelbrot set
int mandelbrot(double r, double i, int iterations){
   int mandelbrotIterations = 0;
   int finmandelbrotIterations = 0; 
   double rz = 0; 
   double iz = 0; 
   
    for(int y = 0; y<iterations;y++){
     double firstTerm = rz*rz;
     double secondTerm = 2 * (rz * iz);
     double thirdTerm = iz * iz;
     
     rz = firstTerm+(thirdTerm*-1);
     iz = secondTerm;
     rz+= r;
     iz+= i;
     mandelbrotIterations++;
     if(rz>2){
       finmandelbrotIterations = mandelbrotIterations;
     }
}
  return finmandelbrotIterations;
}

boolean switchX = false;




//converting pixels to plot -2:1 *real* values
double x(double r){
  double x;
  double beginningOffsetX = 0;
  
  if(mousePressed){
    
    if(switchX){
      beginningOffsetX = lastPointX+mouseX;
      switchX = false;
      
    }
    
    
    
   x = scale * 3 * (r-mouseX-beginningOffsetX)/width;
   lastPointX = mouseX;
}
else  {
   x = scale*3*(r-lastPointX+500)/width;
   switchX = true;
   

}

  
  return x;
}



//converting pixels to plot +1i:-1i *imanginary* values
double y(double r){
  double y;
  if(mousePressed){
   y = scale * -2 * (r-mouseY)/height;
   lastPointY = mouseY;
  }
  else  y = scale * -2 * (r-lastPointY)/height;

  return y;
}


//Scaling logic
void mouseClicked(){

  if(keyPressed){
  scale+=0.1;
  }
  else scale-=0.1;
  
  

}

//double offsetClickX = 0;
//void mouseClicked(){

 
//}
