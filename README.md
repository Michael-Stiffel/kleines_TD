# Kleines TD

Die Idee ist ein kleines TD. Erstmal Singleplayer und dann einen Multiplayer 
nachzurüsten. Das besondere sollen ein paar Sachen sein. Prinzipiell ist die
Haupt Inspiration die Fun Map Entropy TD von Starcraft.  

## 1. prozedural generierte Map

Die Map soll komplett random sein jedes Mal, wenn man eine Runde startet.
Start und Ziel der Route sind immer woanders und es soll nachher noch andere Wegpunkte und Hindernisse geben.

## 2. Mazen 

Der ganze Witz soll sein das man Mazes mit seinen Türmen bauen kann also
dass man Türme in den Weg der Monster zu stellen und diese sich einen neuen Weg suchen müssen, um ans Ziel zu kommen. 

## 3. Verschiedene Völker und Türme 

Die Türme sollen verschiedene Upgrade pfade bekommen. Dann soll jeder Spieler auch ein 
Volk wählen können, um andere Türme und Perks zu haben. Die Eco soll nicht auf besiegten 
Gegner aufbauen, sondern gesondert laufen. 

## 4. Multiplayer

### Modus 1:

Im Multiplayer soll das alles etwas erweitert werden, sodass man nicht wählen können
wie man sich verteidigt, sondern auch wie man angreift und man kann dem Gegner Völkerspezifische Gegner schicken. 

### Modus 2: 

Statt das man spezifische Angriffe schickt geht es darum die Wellen zu besiegen und für alle Viecher, die man besiegt bekommt man 1 Leben und zieht dem andrem Spieler 1 Leben ab.

## 5. Todo und Getan 

### Todo: 

#### Phase 2: 

Ehrlich wenn das hier erreicht, wird dann bin ich schon echt erstaunt.

- [ ] Mehr Stuff auf der Karte(Felsen, Kartoffeln, Kontrollpunkte, Booster, vielleicht fucking Portale)
- [ ] mehr Upgrade Möglichkeiten für die Türme und Völker für den Spieler (Turret Overhaul mit Larry)
- [ ] Anfangen einen Multiplayer zu cavemanen 
- [ ] Modus 2 hat prio und erst wenn der Funtzt dann können wir über Modus 1 nachdenken
- [ ] Kontent Kontent Kontent
- [ ] Add Multiplayer
  - [ ] Add Multiplayer Menu Options
  - [ ] Schauen wie Multiplayer hier aussehen soll
  - [ ] Dedicated Server support? Ich vermute mal nicht
  - [ ] Wie kann ich meinem gegenüber Joinen? Direkt IP und Port oder Relay Server schenanigans.
    - [ ] Wird wahrscheinlich Relay Server weil ISP der Hurensohn kein richtige IP mehr raus gibt

##### Bugs & Improvments:


### Getan: 

- [x] Map wird in sehr primitiver Form generiert (Grastiles, Start, Ziel und Steinborder)
- [x] Pfad von Start nach Ziel wird berechnet
- [x] Sehr primitiv folgen dummys dem Pfad
- [x] Spawner für Viecher erstellen 
- [x] GUI für eigene HP der Basis und Schaden pro Vieh einsetzten
- [x] Losingstate erstellen
- [x] Türme setzten können, GUI fürs Bauen
- [x] Pfad soll auf Türme reagieren und feststellen, falls ein Turm den letzten möglichen Weg versperrt
- [x] Türme dürfen nicht auf den Start und das Ziel gesetzt werden, allgemein brauchen wir einen "buildable" state 
  der dann gecheckt wird ob da ein Tower hin kann(nicht auf den Rand der MAp bauen, nicht auf Start und Ziel und nicht außerhalb der Karte) 
- [x] Türme sollen Gegner angreifen (ATK von Türmen,. HP von gegnern etc.)
- [x] Türme können nicht mehr gestapelt werden 
- [x] Türme können nicht mehr die Buildleite korumpieren
- [x] das spiel nicht mehr briken (also wenn amn dne letztenb Pfad killt das man das dannnicht bauen kann)
- [x] feedback wenn amn was nicht bauen kann (rotes leuchten oder so)
- [x] Prozedural Wellen generieren(caveman)
- [x] Visuals updaten(HUD soll anzeigen wieviele Gegner in der aktuellen welle sind, welchje welle wir haben, wie viel Münzen haben wir. Dann sollen die Tower Projektilie verschießen und treffereffekte wären schön)
- [x] Eco aufbauen  
- [x] Tower soll Upgrades bekommen
- [x] Code aufräuemn um einfacher gegner hinzuzufügen (also scriptwise soll nicht so viel Code Dopplung vorkommen)
- [x] das Wellen System soll eine Schwierigkeit klasse kriegen damit man ab nem gewissen Punkt keien Low-Tier mobs mehr spawnt (also keine 1000 schaben, sondern dann ...HYDREN oder so)
- [x] Winstate erstellen (im Moment soll man eine bestimmte Welle (10) erreichen, vielleicht nachher als alternative einen Highscore erreichen und unendliche Wellen)
- [x] Hauptmenü erstellen 
- [x] Optionsmenü erstellen
- [x] Pausen menü erstellen
- [x] ein bisschen mukke und SFX 
- [x] Dann einmal gucken, ob das überhaupt Spaß macht XD, falls das so is dann Phase 2
- [x] Soundmenüs und Speichern der Soundeinstellungen 
- [x] Für alle Bildschirmauflösungen anpassen
  - [x] Um alle Elemente Container Elemente machen, an die sich die Unterelemente anordnen können
  - [x] Bildschirmäuflösung im Optionsmenu einführen
  - [x] Fullscreen und WindowedMode unterschied schauen und eventuell was dafür einführen?
-[x] Mehr Stuff auf der Karte(Felsen)
