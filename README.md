# ARM-Assembly-Word_Count
ARM 32-bit, cortex A-7

                                                Szószámolás
  A feladat, egy assemblyben írt függvény és a hozzátartozó keretprogram elkészítése mely megszámolja a bemeneti szövegben hány szó található. Az eljárás csak az angol ABC 26 kis ´es nagybetűkből képzett szavakat tekintse szónak. Bármilyen ´írásjel, szam a szóvéget jelenti.
  A függvénynek egy argumentuma van: 
  1.	text a bemeneti szöveg, amiben kell a szavakat számolni. 
  Az eljárás visszatérési érteké a szövegben található szavak száma.
  Elvárt függvény prototípus (C-ben)
1 int word_count (char * text ) ;
  Példa használat C-ben
1 char * text = " hello test ! string for longest word " ; 
2
3 int result = word_count ( text ) ; 
4 
5 printf ( " % s -> % d \ n " , test , result ) ;

