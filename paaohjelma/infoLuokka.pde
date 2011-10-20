class infoRuutu {
  
  PFont fontti = loadFont("AgencyFB-Reg-48.vlw");
  PImage postit = loadImage("postit.png");
  
  infoRuutu(Maa maa, int x, int y) {
    
    // Luodaan inforuutu lataamalla post it -lapun kuva ja kirjoittamalla sen päälle maan tiedot
    
    textFont(fontti, 22);   
    
    String teksti = maa.annaNimi() + "\nPinta-ala: " + maa.annaPinta_ala() + " km²" + "\nVäkiluku: "
    + maa.annaVakiluku() + "\nEliniänodote: " + maa.annaElinIka() + " vuotta" + "\nBKT: " + maa.annaBkt() + " $/as.";
    
    image(postit, 5, 400, 200, 200);
    
    fill(0);
    
    text(teksti, 18, 402, 600, 600);
    
  }
  

}  
