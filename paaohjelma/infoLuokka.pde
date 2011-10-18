class infoRuutu {
  
  PFont fontti = loadFont("AgencyFB-Reg-48.vlw");
  PImage postit;
  
  infoRuutu(Maa maa, int x, int y) {
    
    textFont(fontti, 24);
    
    this.postit = loadImage("postit.png");
    
    String teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
    + maa.annaVakiluku() + "\nEliniänodote: " + maa.annaElinIka() + " vuotta" + "\nBKT: " + maa.annaBkt() + " €/as.";
    
    image(postit, 80, 80, 250, 250);
    
    text(teksti, x, y, 600, 600);
    
  }
  

}  
