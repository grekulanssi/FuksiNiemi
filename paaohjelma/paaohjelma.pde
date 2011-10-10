

List<Maa> maat = new ArrayList<Maa>();
List<Piste> pisteet = new ArrayList<Piste>();
//Luo tekstitiedosto
boolean pisteet_piirretty = false;

void setup() {

  size(400, 400);
  //Haetaan maat-listaan tekstitiedostosta Maa-oliot
  //Oma luokka siihen, maat lisätään maat-listaan
  //Samalla arvotaan jokaiselle x ja y
 
  Maa testimaa = new Maa(5000, 300, "Testimaa", 200, 200);
  maat.add(testimaa);
}

void draw() {
  // Sijainnin voisi arpoa vasta täällä luomisen yhteydessä tapahtuvan
  // koordinaattien antamisen sijaan
  for (int a=0; a < maat.size(); a++) {

    Maa maa = maat.get(a);
  
    //  Maa vertailumaa = maat.get(a-1);
      //Piirretään maa ruudulle pallona
      int sade = (int) log(maa.annaPinta_ala()) * 20;
      fill(255);
      ellipse(maa.annaX(), maa.annaY(), sade, sade);
     
      //Piirrä pallon päälle väkiluvun mukainen määrä pisteitä
      int vakiluku = (int) (maa.annaVakiluku() / 500);
      
      if (pisteet_piirretty == false){
        for (int b = 0; b < vakiluku; b++){
       // fill(150);
        int aks = (int) (maa.annaX() + random((-sade), sade-1));
        int yy = (int) (maa.annaY() + random((-sade-1), sade-1));
        if (aks*aks + yy*yy >= sade*sade){
        
        Piste piste = new Piste(aks, yy);
        pisteet.add(piste);
        point(aks, yy);
        }
        
        pisteet_piirretty = true;
        }
         for (int c = 0; c < pisteet.size(); c++){
          Piste pointti = pisteet.get(c);
          pointti.lisaaXaa();
          if (c == 1){
          println(pointti.annaX());
          }
          
     }
   }
}

void lisaaMaa(Maa maa){
  
  maat.add(maa);
}

class Piste {

  int x;
  int y;
  
  Piste(int x, int y){
  
    this.x = x;
    this.y = y;
  }
  
  int annaX(){
    return this.x;
  }
  int annaY(){
    return this.y;
  }
  void lisaaXaa(){
    this.x++;
    
  }
}

