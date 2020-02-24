import peasy.*;

Planeta sol;
Planeta mercurio;
Planeta venus;
Planeta tierra;
Planeta marte;
Planeta jupiter;
Planeta saturno;
Planeta urano;
Planeta neptuno;

int modoCamara=0;
/*
Cámara fija por defecto
*/
int x=0,y=0,z=0;
float anguloHorizontal=0;
float anguloVertical=0;

//PeasyCam cam;

PImage texturaSol;
PImage espacio;


void setup(){
  size(900,600,P3D);
  //cam = new PeasyCam(this, 1400);
  creaPlanetas();
  espacio  = loadImage("espacio.jpg");
  tierra.apareceLuna(1,3.4,loadImage("luna.jpg"));
  marte.apareceLuna(2,5,loadImage("luna.jpg"));
  textFont(createFont("Arial Black",16));
}

void draw(){
  espacio.resize(width,height);
  background(espacio);
  fill(255);
  if(modoCamara==1){
    instruccionesCamara();
  } else {
    defaultMode();
  }
  translate(x,y,z);
  lights();
  pointLight(255,255,255,0,0,0);
  muestraPlanetas(); 
  teclaPulsada(); 
}



void creaPlanetas(){
  sol = new Planeta(150,0,0,loadImage("sol.png"),"Sol");
  mercurio = new Planeta(8,250,0.005,loadImage("mercurio.jpg"),"Mercurio");
  venus = new Planeta(16,300,0.002,loadImage("venus.jpg"), "Venus");
  tierra = new Planeta(16.7,350,0.001,loadImage("tierra.jpg"), "Tierra");
  marte = new Planeta(20,450,0.0005,loadImage("marte.jpg"), "Marte");
  jupiter = new Planeta(60,600,0.0007,loadImage("jupiter.jpg"),"Júpiter");
  /*saturno = new Planeta(50, 900, 0.0003,loadImage("saturno.jpg"),"Saturno");
  urano = new Planeta(30, 1000, 0.0001, loadImage("urano.jpg"),"Urano");
  neptuno = new Planeta(35, 1100, 0.00005, loadImage("neptuno.jpg"),"Neptuno");*/
}



void muestraPlanetas(){
  sol.muestra();
  sol.orbita();
  
  mercurio.muestra();
  mercurio.orbita();
  
  venus.muestra();
  venus.orbita();
  
  tierra.muestra();
  tierra.orbita();
  
  marte.muestra();
  marte.orbita();
  
  jupiter.muestra();
  jupiter.orbita();
  
  /*saturno.muestra();
  saturno.orbita();
  
  urano.muestra();
  urano.orbita();
  
  neptuno.muestra();
  neptuno.orbita();*/


}


void instruccionesCamara(){
    text("Modo libre", width-100,16);
    text("Eje x: "+x, 16,15);
    text("Eje y: "+y, 16,30);
    text("Eje z: "+z, 16,45);
    text("Ángulo vertical: "+anguloVertical, 16,60);
    text("Ángulo horizontal: "+anguloHorizontal, 16,75);
    
    text("Tecla O - Pasa a cámara fija", 16,height-112);
    text("Barra espaciadora - Resetea coordenadas", 16,height-96);
    
    text("Tecla → - Rota hacia la derecha", 16,height-64);
    text("Tecla ← - Rota hacia la izquierda", 16,height-48);
    text("Tecla ↑ - Rota hacia arriba", 16,height-32);
    text("Tecla ↓ - Rota hacia abajo", 16,height-16);
    
    text("Tecla T - Para ir arriba", width-textWidth("Tecla T - Para ir arriba   "),height-96);
    text("Tecla G - Para ir abajo", width-textWidth("Tecla G - Para ir abajo   "),height-80);
    text("Tecla W - Para ampliar", width-textWidth("Tecla W - Para ampliar   "),height-64);
    text("Tecla S - Para alejar", width-textWidth("Tecla S - Para alejar   "),height-48);
    text("Tecla A - Para ir a la izquierda", width-textWidth("Tecla A - Para ir a la izquierda   "),height-32);
    text("Tecla D - Para ir a la derecha", width-textWidth("Tecla D - Para ir a la derecha   "),height-16);
    rotateX(anguloVertical);
    rotateY(anguloHorizontal);
}

void teclaPulsada(){

if(keyPressed){
    if(modoCamara==1){
      if(key=='w' || key=='W'){
        z+=10;
      } else if (key=='s' || key=='S'){
        z-=10;    
      } else if (key=='t' || key=='T'){
        y+=10;    
      } else if (key=='g' || key=='G'){
        y-=10;    
      } else if(key=='a' || key=='A'){
        x+=10;
      } else if(key=='d' || key=='D'){
        x-=10;
      } else if(keyCode==LEFT){
        anguloHorizontal+=0.02;
      } else if(keyCode==RIGHT){
        anguloHorizontal-=0.02;
      } else if(keyCode==UP){
        anguloVertical-=0.02;
      } else if(keyCode==DOWN){
        anguloVertical+=0.02;
      } else if(key==' '){
        x=430;
        y=310;
        z=-800;
        anguloHorizontal=0;
        anguloVertical=0;
      } else if(key=='o'||key=='O'){
        modoCamara=0;
      } 
    } else if(key=='k'||key=='K'){
        modoCamara=1;
        x=430;
        y=310;
        z=-800;
        anguloHorizontal=0;
        anguloVertical=0;
    } 
  }
}



void defaultMode(){
    text("Modo fijo", width-100,16);
    text("Pulse la tecla ", 16,height-16);
    fill(255,0,0);
    text(" K ",16+textWidth("Pulse la tecla"),height-16);
    fill(255);
    text(" para pasar al modo libre.",16+textWidth("Pulse la tecla K"),height-16);
    x=410;
    y=770;
    z=-230;
    anguloHorizontal=-0.04;
    anguloVertical=-0.98;
    rotateX(anguloVertical);
    rotateY(anguloHorizontal);
}
