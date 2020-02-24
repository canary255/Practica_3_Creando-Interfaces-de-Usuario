class Planeta{
  PVector posicion;
  float angulo;
  float radio;
  float distancia;
  float velocidadOrbita;
  Planeta[] planetas;
  PVector v;

  String texto;
  
  PShape globe;
  
  
  Planeta(float rad, float dis,float o, PImage img, String text){
    v = new PVector(0,0,1);
    
    radio=rad;
    angulo=random(0,TWO_PI);
    distancia = dis;
    v.mult(distancia);
    velocidadOrbita = o;
    texto=text;
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radio);
    globe.setTexture(img);
  }

  void muestra(){ 
    pushMatrix();
    noStroke();
    PVector v2 = new PVector(1,0,1);
    PVector p = v.cross(v2);
    rotate(angulo,p.x,p.y,p.z);
    stroke(255);    
    translate(v.x,v.y,v.z);
    noStroke();
    fill(255);
    shape(globe);
    text(texto, radio/2,radio*1.5);
    if(planetas != null){
      for(int i = 0; i < planetas.length; i++){
        planetas[i].muestra();
        planetas[i].orbita();
      }
    }
    popMatrix();
  }

  void apareceLuna(int total, float r, PImage img){
    planetas = new Planeta[total];
    for(int i = 0; i < planetas.length; i++){
      float d = random((radio+r+i),(radio+r)*2);
      float o =0.03;
      planetas[i] = new Planeta(r,d,o, img, "");
      planetas[i].muestra();
    }
  }

  void orbita(){
    angulo+=velocidadOrbita; 
    if(planetas != null){
      for(int i = 0; i < planetas.length; i++){
        planetas[i].orbita();
      }
    }
  }
  
  
   
    
  
}
