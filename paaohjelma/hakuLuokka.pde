class Haku {

  String tiedostonNimi;
  BufferedReader lukija = createReader("maat.txt"); // luetaan maat.txt tiedostosta
  String rivi;
  List<Maa> haetutMaat = new ArrayList<Maa>();
  
  List<Maa> teeHaku() {
    
    // Haetaan maat.txt tiedostosta maiden tiedot ja luodaan Maa-olioita niiden pohjalta
  
    try {
         rivi = lukija.readLine(); //Ekaa riviä ei lasketa
         rivi = lukija.readLine();
     } catch (IOException e) {
       e.printStackTrace();
       rivi = null;
     }  
    
    while (rivi != null) {
      
     String[] pieces = split(rivi,"\t");
     
     // Muutetaan parametrit oikeisiin muotoihin
     
     int a = Integer.parseInt(pieces[2]);
     float b = Float.parseFloat(pieces[1]);
     float c = Float.parseFloat(pieces[4]);
     int d = Integer.parseInt(pieces[5]);
     int q = Integer.parseInt(pieces[6]);
     float f = Float.parseFloat(pieces[7]);
     int w = Integer.parseInt(pieces[8]);
     
     Maa maa = new Maa(a, b, pieces[0], pieces[3], c, d, q, f, w);
     
     // Lisätään Maa-oliot haetutMaat-listaan
     
     haetutMaat.add(maa); 

     try {
         rivi = lukija.readLine();
     } catch (IOException e) {
       e.printStackTrace();
       rivi = null;
     }
     
    }    
    // Metodi palauttaa haetutMaat-listan  
    return haetutMaat;
  }


}

