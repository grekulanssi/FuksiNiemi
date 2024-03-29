class infoRuutu {
  
  PFont fontti = loadFont("AgencyFB-Reg-48.vlw");
  PImage postit = loadImage("postit.png");
  int x,y;
  
  infoRuutu(Maa maa, int x, int y) {
    
    // Resize postit-kuvalle jottei ohjelma lagaa
    this.postit.resize(200,220);
    this.x = x; // x on tieto tarkasteltavasta x-akselista
    this.y = y; // y on tieto tarkasteltavasta y-akselista
  }
  
  void piirra(Maa maa) {
    
   // Metodi, joka piirtää inforuudun
    
   textFont(fontti, 22);
   
   String teksti = "asd"; // alustus
   
   // tarkistetaan mitä akseleita käyttäjä tarkastelee ja kirjoitetaan tiedot sen mukaan
    
   if(this.x == 4 && this.y == 1) {
      teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nEliniänodote: " + maa.annaElinIka() + " vuotta" + "\nFB-käyttäjiä: " + maa.annaFacebookProsentti() + " %"; 
   }
   
   if(this.x == 4 && this.y == 2) {
     teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nEliniänodote: " + maa.annaElinIka() + " vuotta" + "\nÖljynkulutus: " + maa.annaOljynKaytto() + "\ntynnyriä / pvä"; 
   }
   
   if(this.x == 4 && this.y == 3) {
     teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nEliniänodote: " + maa.annaElinIka() + " vuotta" + "\nMobiililiittymät: " + maa.annaPuhelinLiittymat() + " / as."; 
   }
   
   if(this.x ==5 && this.y == 1) {
     teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nBKT: " + maa.annaBkt() + " $ / as." + "\nFB-käyttäjiä: " + maa.annaFacebookProsentti() + " %";
   }
   
   if(this.x == 5 && this.y == 2) {
     teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nBKT: " + maa.annaBkt() + " $ / as." + "\nÖljynkulutus: " + maa.annaOljynKaytto() + "\ntynnyriä / pvä";
   }
   
   if(this.x == 5 && this.y == 3) {
    teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nBKT: " + maa.annaBkt() + " $ / as." + "\nMobiililiittymät: " + maa.annaPuhelinLiittymat() + " / as.";
   }
   
   if(this.x == 6 && this.y == 1) {
     teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nTyöttömyysaste: " + maa.annaTyottomyys() + " %" + "\nFB-käyttäjiä: " + maa.annaFacebookProsentti() + " %";
   }
   
   if(this.x == 6 && this.y == 2) {
     teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nTyöttömyysaste: " + maa.annaTyottomyys() + " %" + "\nÖljynkulutus: " + maa.annaOljynKaytto() + "\ntynnyriä / pvä";
   }
   
   if(this.x == 6 && this.y == 3) {
     teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
     + maa.annaVakiluku() + "\nTyöttömyysaste: " + maa.annaTyottomyys() + " %" + "\nMobiililiittymät: " + maa.annaPuhelinLiittymat() + " / as.";
   }
 
   image(postit, 2, 35);
       
   fill(0);
    
   text(teksti, 15, 37, 600, 600);
   
  }
  
  void asetaX(int x) {
   this.x = x; 
  }
  
  void asetaY(int y) {
   this.y = y; 
  }
  

}  
