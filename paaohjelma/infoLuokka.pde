class infoRuutu {
  
  PFont fontti = loadFont("AgencyFB-Reg-48.vlw");
  PImage postit = loadImage("postit.png");
  
  infoRuutu(Maa maa, int x, int y) {
    
    // Resize postit-kuvalle jottei ohjelma lagaa
    this.postit.resize(200,200);
  }
  
  void piirra(Maa maa) {
    
   // Metodi, joka piirtää inforuudun
    
   textFont(fontti, 22);  
    
   String teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
   + maa.annaVakiluku() + "\nEliniänodote: " + maa.annaElinIka() + " vuotta" + "\nBKT: " + maa.annaBkt() + " $/as."; 
   
   image(postit, 5, 400);
       
   fill(0);
    
   text(teksti, 18, 402, 600, 600);
   
  }
  

}  
