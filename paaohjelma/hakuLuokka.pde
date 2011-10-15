class Haku {

  String tiedostonNimi;
  BufferedReader lukija = createReader("maat.txt");
  String rivi;
  int tarkistus;
  List<Maa> haetutMaat = new ArrayList<Maa>();
  
  List<Maa> teeHaku() {
  
    try {
         rivi = lukija.readLine();
     } catch (IOException e) {
       e.printStackTrace();
       rivi = null;
     }
    
    while (rivi != null) {
      
     String[] pieces = split(rivi,"&");
     
     int a = Integer.parseInt(pieces[2]);
     float b = Float.parseFloat(pieces[1]);
     float c = Float.parseFloat(pieces[4]);
     
     Maa maa = new Maa(a, b, pieces[0], pieces[3], c);
     
     //println(maa.annaElinIka());
     
     //println(maa.annaNimi());
     //println(maa.annaVakiluku());
     //println(maa.annaPinta_ala());
     
     haetutMaat.add(maa); 

     try {
         rivi = lukija.readLine();
     } catch (IOException e) {
       e.printStackTrace();
       rivi = null;
     }
     
    }
    return haetutMaat;
  }


}

