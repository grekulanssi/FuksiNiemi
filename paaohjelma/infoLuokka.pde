class infoRuutu {
  
  PFont fontti = loadFont("AgencyFB-Reg-48.vlw");
  PImage postit = loadImage("postit.png");
  
  infoRuutu(Maa maa, int x, int y) {
    
    // Luodaan inforuutu lataamalla post it -lapun kuva ja kirjoittamalla sen päälle maan tiedot
    
    textFont(fontti, 24);   
    
    String teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
    + maa.annaVakiluku() + "\nEliniänodote: " + maa.annaElinIka() + " vuotta" + "\nBKT: " + maa.annaBkt() + " €/as.";
    
    image(postit, 80, 80, 250, 250);
    
    fill(0);
    
    text(teksti, x, y, 600, 600);
    
  }
  

}  
