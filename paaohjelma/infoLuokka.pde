class infoRuutu {
  
  PFont fontti = loadFont("AgencyFB-Reg-48.vlw");
  
  infoRuutu(Maa maa, int x, int y) {
    
    textFont(fontti, 30);
    
    String teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
    + maa.annaVakiluku() + "\nEliniänodote: " + maa.annaElinIka() + " vuotta" + "\nBKT: " + maa.annaBkt() + " €/as.";
    
    text(teksti, 100, 100, 600, 600);
    
  }
  

}  
