/*boolean pisteet = false;
ArrayList<Float> pisteidenX = new ArrayList<Float>();
ArrayList<Float> pisteidenY = new ArrayList<Float>();
ArrayList<Float> pisteidenXSuunnat = new ArrayList<Float>();
ArrayList<Float> pisteidenYSuunnat = new ArrayList<Float>();
float suuntaX;
float suuntaY;


void setup(){
size(400,400);
background(255);
smooth();
//noLoop();
}


void draw(){
strokeWeight(2);
ellipseMode(CENTER);
ellipse(200,200,100,100);
int sade = 50;
int keskipiste = 200;
if(pisteet == false){
for(int i = 0; i<10; i++){
  float x = random(keskipiste-sade, keskipiste+sade);
  float y = random(keskipiste-sade, keskipiste+sade);
 /* if(pow((x-keskipiste),2)+pow((y-keskipiste),2) >pow(sade,2)){
    x = 50;
    y = 50;
    point(x,y);
  }*/ /*
  while(pow((x-keskipiste),2)+pow((y-keskipiste),2) >pow(sade,2)){
    x = random(keskipiste-sade, keskipiste+sade);
    y = random(keskipiste-sade, keskipiste+sade);
  }
    suuntaX = random(0,1);
    suuntaY = random(0,1);
    pisteidenXSuunnat.add(suuntaX);
    pisteidenYSuunnat.add(suuntaY);
    pisteidenY.add(y);
    pisteidenX.add(x);
    pisteet = true;
}
}
    for(int a = 0; a<10; a++){
      if(pow((pisteidenX.get(a)-keskipiste),2)+pow((pisteidenY.get(a)-keskipiste),2) >=pow(sade,2)){
        if(pisteidenX.get(a)>=keskipiste+sade){
          pisteidenXSuunnat.set(a,-suuntaX);
        }
        if(pisteidenX.get(a)<=keskipiste-sade){
          pisteidenXSuunnat.set(a,-suuntaX);
        }
        if(pisteidenY.get(a)>=keskipiste+sade){
          pisteidenYSuunnat.set(a,-suuntaY);
        }
        if(pisteidenY.get(a)<=keskipiste-sade){
          pisteidenYSuunnat.set(a,-suuntaY);
        }
      }
    point(pisteidenX.get(a),pisteidenY.get(a));
    pisteidenX.set(a,pisteidenX.get(a)+pisteidenXSuunnat.get(a));
    pisteidenY.set(a, pisteidenY.get(a)+pisteidenYSuunnat.get(a));
    }

*/
