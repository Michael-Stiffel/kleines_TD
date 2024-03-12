# Kleines TD

Die Idee ist ein kleines TD. Erstmal Singleplayer und dann einen Multiplayer 
nachzurüsten. Das besondere sollen ein paar Sachen sein. Prinzipiell ist die
hauptinspiration die Fun Map Entropy TD von Starcraft.  

## 1. Prozedual generierte Map

Die Map soll komplett random sein jedes Mal wenn man eine Runde Startet.
Start und Ziel der Route sind immer woanders und es soll nachher noch andere Wegpunkte und Hindernisse geben.

## 2. Mazen 

Der ganze Witz soll sein das man Mazes mit seinen Türmen bauen kann also
das man Türme in den Weg der Monster zu stellen und diese sich einen neuen weg suchen 
müsen um ans Ziel zu kommen. 

## 3. Verschiedene Völker und Türme 

Die Türme sollen verschiedene Upgradepfade bekommen. Dann soll jeder Spieler auch ein 
Volk wählen können um andere Türme und Perks zu haben. Die Eco soll nicht auf besiegten 
GEgnern aufbauen sondern gesondert laufen. 

## 4. Multiplayer

### Modus 1:

Im Multiplayer soll das alles etwas erweitert werden sodass man nicht wählen können
wie man sich verteidigt sondern auch wie man angreift und man kann dem Gegner Völkerspezifische Gegner schicken. 

### Modus 2: 

Statt das man spezische Angriffe schickt geht es darum die Wellen zu besiegen und für alle Viehcer die man besigt bekommt man  1 Leben und zieht dem anderm Spieler 1 LEben ab.

## 5. Todo und Getan 

### Todo: 

- das wellensystem soll eine schwierigkeits klasse kriegen damit man ab nem gewissen Punkt keien Low-Tier mobs mehr spawnt (also keine 1000 schaben sondern dann ...HYDREN oder so)
- Winstate erstellen (nun vielleicht einfach Higfhscore und unendlich Wellen)
- Hauptmenü erstellen 
- Optionsmenü erstellen
- ein bisschen mukke und SFX 
- polishing der Grafiken 
- Dann einmal gucken ob das überhaupt spaß macht XD, falls das so is dann Phase 2

#### Phase 2: 

Ehrlich wenn das hier erreicht wird dann bin ich schon echt erstaunt.

- Mehr Stuff auf der Karte(Felsen, Kartoffeln, Kontrollpunkte, Booster, vielleicht fucking Portale)
- mehr Upgrademöglichkeiten für die Türme und Völker für den Spieler (Turret Overhaul mit Larry)
- Anfangen einen Multiplayer zu cavemanen 
- Modus 2 hat prio und erst wenn der Funtzt dann können wir über Modus 1 nachdenken
- Kontent Kontent Kontent

### Getan: 

- Map wird in sehr primitiver Form generiert(Grastiles, Start, Ziel und Steinborder)
- Pfad von Start nach Ziel wird berechent
- Sehr primitiv folgen dummys dem Pfad
- Spawner für Viecher erstellen 
- GUI für eigene HP der Basis und Scahden pro Vieh einsetzten
- Losingstate erstellen
- Türme setzten können, GUI fürs bauen
- Pfad soll auf Türme reagieren und festellenn falls ein Turm den letztzen möglichen Weg versperrt
- Türme dürfen nicht auf den STart und das Ziel gesetzt werden, allgemeion brauchen wir einen "buildable" state 
  der dann gecheckt wird ob da ein Tower hin kann(nicht auif den Rand der MAp bauen, nicht auf start und Ziel und nicht ausserhalb der Karte) 
- Türme sollen gegner angreifen (ATK von Türmen,. HP von gegnern etc.)
- Türme könbne nicht mehr gestapelt werden 
- Türme können nicht mehr die Buildleite korumpieren
- das spiel nicht mehr briken (also wenn amn dne letztenb Pfad killt das man das dannnicht bauen kann)
- feedback wenn amn was nicht bauen kann (rotes leuchten oder so)
- Prozedural Wellen generieren(caveman)
- Visuals updaten(HUD soll anzeigen wieviele Gegner in der aktuellen welle sind, welchje welle wir haben, wie viel Münzen haben wir. Dann sollen die Tower Projektilie verschießen und treffereffekte wären schön)
- Eco aufbauen  
- Tower soll Upgrades bekommen
- Code aufräuemn um einfacher gegner hinzuzufügen (also scriptwise soll nicht soviel Code dopplung vorkommen)
