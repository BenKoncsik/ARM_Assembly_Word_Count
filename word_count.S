.syntax unified
.cpu cortex-a7
.data
.text
betuellenor: /*itt elenorzom, hogy az adott karakter betu-e ha betu akkor 1-gyel terek vissza ha nem betu akkor 0-val*/
/*fugveny epilogus*/
push {r4-r11, lr}
b _betuellenornagybetu

_betuellenornagybetu:
mov r9, #65 /*65 == A betu innen indul a ciklus*/
b _loopnb /*ciklus ra ugrik*/

_loopnb:
cmp r9, #91 /*91-1 == Z ha ezzen tul megy azza 91 akkor nem nagy betu*/
beq _betuellenorkisbetu /*es akkor a kisbetuket nezem meg ugrik oda*/

cmp r0, r9 /*ellenorzi, hogy r5 - r9 == 0 ? ha igen akkor tovább lep a fociklusomba*/
add r9, r9, #1 /*r9 += 1 tovább lépteti a ciklus szamlalom*/
beq _betu /*ha egyenlo akkor vissza ugras fociklusba*/
bne _loopnb /* ha nem egyenlo akkor a ciklus elejere ugrok*/

_betuellenorkisbetu:
mov r9, #97 /* 97 == a betu innin indul a kibetuk elleorzese*/
b _loopkb /*a kibetuk elllenorzese ciklusra ugrik*/

_loopkb:
cmp r9, #123 /*123-1 == z ha ezzen tul megy akkor nincs benne kisbetbu*/
beq _nembetu /*ellenorzom, hogy szo koz-e*/

cmp r0, r9 /*ha r5-r9 == 0 akkor kisbetu*/
add r9, r9, #1 /*r9 +=1 tovább lép a kovetkezo beture*/
beq _betu /*ha igyaz akkor vissza a fo ciiklusba*/
bne _loopkb /*ha hamis akkor ciklus elejere ugrok*/

_betu:
mov r0, #1 /*vissza teresi ereteke ha betu akkor 1 == igaz*/
b _betuend
_nembetu:
mov r0, #0 /*vissza teresi ereteke ha nem betu akkor 0 == hamis*/
b _betuend

_betuend:
/*fugveny prologus*/
pop {r4-r11, pc}

.global word_count
word_count:
/*fugveny epilogus*/
push {r4-r11, lr}

mov r7, #0 /*szo szam*/ 
mov r5, #0 /*ide toltom be a karaktereket*/
mov r4, r0 /*betoltom a tomb cimet a munka regiszterbe*/
mov r8, #0 /*melyik helyierteknel jarok egyesevel novelem*/

_loop:
ldrb r5, [r4, r8] /*r5 == r4 + r8*/
cmp r5, #0 /* ellenorzes hogy vege van-e?*/

beq _loopend /*vege cimre ugrik*/
add r8, r8, #1 /*r8 += 1 a kovetkezo eretek lesz*/
mov r0, r5 /*r0 ba bemásolom az r5 regiszeter erteket a fugvenynek valo atadas miatt*/
bl betuellenor /*ellenorzesre ugrik elsonek megnezem, hogy nagy betu-e*/
cmp r0, #1 /*ha betu akkor a betuellenor vissza teresi ereteke 1 == true*/
beq _loop
cmp r0, #0 /*ha nem betu akkor a betuellenopr vissza teresi ereteke 0 == false*/
beq _szokoz


_szokoz:
ldrb r5, [r4, r8] /*megnezem a kovetekezo karaktert*/
cmp r5, #32 /*r9-32(32 a szokoz) == 0 akkor szokoz*/
beq _loop /*tehat ugras vissza a loopra*/
bne _szovegjel /*ha nem akkor ellenorzom, hogy szovegjel vagy betu*/

_szovegjel:
cmp r5, #0 /*ellenorzom, hogy egyaltalan van e mogote valami vagy a szoveg utolso karaktere*/
beq _loopend /*ha igne akkor ugras fo ciklus es ott a _loopend cimre ugras*/
bne _mivanutana /*ha nem szokoz es nem a szoveg vege (elsonek elenoriztem) akkor ugras a mivanutana*/

_mivanutana:
ldrb r5, [r4, r8] /* r5 = r4+r8*/
mov r0, r5 /*r0 ba bemásolom az r5 regiszeter erteket a fugvenynek valo atadas miatt*/
bl betuellenor /*ellenorzom, hogy betu e a kovetkezo szo*/
cmp r0, #1 /*ha a betuellenor-nek 1 a vissza teresi erteke akkor betu*/
beq _ujszo
bne _tovabblep

_tovabblep:
add r8, r8, #1 /*r8 +=1 megnezi mivan kettovel utana*/
b _szokoz /*szokoz-re ugrik*/

_ujszo:
add r7, r7, #1 /*r7 += 1 a szavak szamat novelem*/
b _loop /*a fociklusomba ugrik*/


_loppendtovabbvizsgalat:
ldrb r5, [r4, #0]
mov r0, r5 /*r0 ba bemásolom az r5 regiszeter erteket a fugvenynek valo atadas miatt*/
bl betuellenor
cmp r0, #1
beq _loopendszovege 
bne _loopendnemszoveg

_loopend:
ldrb r5, [r4, #0] /*ellenorzes, hogy a van-e egyaltalan szo amit szamolnai kell*/
cmp r5, #0 /*ha r5 elso eretke 0 akkor nincs szo ha viszoint ettol elter akkor van*/
beq _loopendnemszoveg
bne _loppendtovabbvizsgalat

_loopendnemszoveg:
mov r0, r7 /*r0 := r7 r0 a vissza teresi ertek*/
/*fugveny prologus*/
pop {r4-r11, pc}

_loopendszovege:
add r7, r7, #1 /*r7 += 1 a szavak szamat novelem mert a masodik szotol szamol valojaban*/
mov r0, r7 /*r0 := r7 r0 a vissza teresi ertek*/
/*fugveny prologus*/
pop {r4-r11, pc}
 




