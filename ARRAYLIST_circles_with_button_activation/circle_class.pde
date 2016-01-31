class Circle{

  float w;
  float h;
  float x;
  float y;
  float r;
  float g;
  float b;


  Circle(){
  
    w = 50;
    h = 50;
    x = width/2;
    y = height/2;
    
  }
  
  void update(float r_, float g_, float b_, float x_, float y_, float w_, float h_ ){
  
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    r = r_;
    g = g_;
    b = b_;
        
  
  }
  
  void display(){
    
    fill(r,g,b);
    ellipse(x,y,w,h);
    
  }

}