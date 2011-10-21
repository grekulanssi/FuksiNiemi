
List<Maa> maat;
Piirto piirto_olio;


void setup() {

  smooth();
  size(1100,650);
  Haku hakuolio = new Haku();
  maat = hakuolio.teeHaku(); 
  piirto_olio = new Piirto(maat);
  
}

void draw() {
  background(200);
  piirto_olio.piirto();
}

void mouseClicked() {
   piirto_olio.mouseClicked();
}
