# COBOLD
Small COBOL projects for start COBOL

# WORKING STORAGE SECTION

Cette Section permet de définit toutes les varaibles qui serront utilisé au cours du programme.

```cobol
WORKING-STORAGE SECTION.

01 WS-AGE PIC 9(3).
```

# PROCEDURE DIVISION

Cette Divion va acceullir le code principale, mais sans pouvoir définir de variable

```cobol
PROCEDURE DIVISION.

    DISPLAY "Salut tout le monde".

    STOP RUN.
```

Ainsi, à chaque fin de programme le mot clef `STOP RUN.` doit être employé

> **chaque ligne de COBOL doit finir par un point (.)**

## DISPLAY

DISPLAY est utilisé pour afficher une valeur dans la console COBOL.

```cobol
DISPLAY "Bonjour les cobolistes !".
```

# Variables

Les variables sont définie dans la WORKING-STORAGE SECTION
Il existe plusieurs types de variables dans le COBOL

## Variable Numérique:

On utlise le mot clef ` PIC 9 ` pour créer une variable numérique

On définie une variable SOLDE qui pourra accepter des nombres entre 0 et 9

```cobol
01 SOLDE PIC 9.
```

On définie une variable SOLDE qui pourra accepter des nombres entre 0 et 9999

```cobol
01 SOLDE PIC 9(4).
```

Ainsi les variables peuvent avoir au maximum 18 caractères soit 999.999.999.999.999.999

Chaque caractères d'un variable représente 1 octet, donc la variable SOLDE représente 4 octets

## Variables à Virgule:

On définie une variable SOLDE qui pourra accepter 4 nombres avant la virgule, et 2 nombres après la virgule

```cobol
01 SOLDE PIC 9(4)V99.
```

On peut biensur modifier le nombre de chiffres après la virgule en modifiant `V999` par exemple. Mais la variable ne doit pas dépasser 18 octets

## Variables à Données Numériques Compactées

Un chiffre est codé sur **un demi octet** lorsqu'il fait partie d'une variable à donnée numérique compactée

Il esiste trois mot clefs pour cela, mais ils veulent dire exactement la même chose
1. COMP-3
2. USAGE COMP-3
3. PACKED-DECIMAL

Pour savoir combien d'octet va faire la variable on fait le calcul suivant en **arrondisant à l'unité la plus proche**

`Nombres Octets = (Taille Variable + 1 ) / 2`

On définie une variable SOLDE qui peux accepter 4 chiffres avant la virgule et 2 chiffres après la virgule, mais sous forme `COMP-3`

```cobol
01 SOLDE PIC 9(4)V99 COMP-3
```

```cobol
01 SOLDE PIC 9(4)V99 USAGE COMP-3
```


```cobol
01 SOLDE PIC 9(4)V99 PACKED-DECIMAL
```


Donc la variable SOLDE va faire exactement **4 octets** au lieu de **6 octets**

```
Nombres Octets = (6 + 1) / 2
Nombres Octets = (7) / 2
Nombres Octets = 3.5 ~= 4 ocets
````

> la lettre **V** est utlisé comme **virgule virtuelle** de la variable SOLDE

## Variables à Données Numériques Binaire

On utlise le mot clef `USAGE IS COMPUTATIONAL` pour définir une variable binaire mais on utise le plus souvent
1. USAGE IS COMP
2. COMP
3. BINARY

Au cours de l'allocation de l'espace des données COMP, le compilateur alloue un esapce **multiple de mots**

1. demi-mot (2 octets)
2. mot (4 octets)
3. double-mot (8 octets)

Une chose à savoir
1. Si la longeur de **n** est compris entre 1 à 4, alors le compilateur alloue un **demi-mot (2 octets)**
2. Si la longeur de **n** est compris entre 5 à 9, alors le compilateur alloue un **mot (4 octets)**
3. Si la longeur de **n** est compris entre 10 à 18, alors le compilateur alloue un **double-mot (8 octets)**

```cobol
01 NOMBRE PIC 9(4) USAGE IS COMP
```

```cobol
01 NOMBRE PIC 9(4) COMP
```

```cobol
01 NOMBRE PIC 9(4) BINARY
```

> Donc pour la variable NOMBRE le compilateur alloue un **demi-mot** soit 2 octets

## Formats d'éditions

Les formats d'éditions ne doivent pas être employés pour effectuer des calculs, ainsi les formats d'éditions sont constitués par:
1. Caractères de **subtitution** [](#caractères-de-subtitution)
2. Caractères **d'insertion**
3. Caractères **mixtes**

### Caractères de subtitution

Ils sont utilisés pour remplacer des chiffres non significatifs par d'autres caractères. Les deux principaux sont le symbole Z et le symbole *

Le symbole **Z** remplace les 0 non significatifs par des blancs

Le symbole __*__ remplace les 0 non significatifs par des __*__

```cobol
WORKING-STORAGE SECTION.

* On définie une variable SALAIRE1 qui pourra accepter 4 nombres (ZZZ => 3 nombres + 9 un nombres)
01 SALAIRE1 PIC ZZZ9.
01 SALAIRE2 PIC ***9.

PROCEDURE DIVISION.

    MOVE 159 TO SALAIRE1.
    MOVE 159 TO SALAIRE2.

    DISPLAY SALAIRE1.
    DISPLAY SALAIRE2.

*   Le résultat du programme sera
*    159
*   *159

    STOP RUN.
```

La variable SALAIRE1 n'est pas remplie au maximum, donc il y a un zéro significatif, avec **Z** ce 0 est remplacé par un esapce

La variable SALAIRE2 n'est pas remplie au maximum, donc il y a un zéro significatif, avec __*__ ce 0 est remplacé par __*__

### Caractères d'insertion

Le caractère d'insertion vient s'insérer comme caractère physique au sein d'un format numérique édité. Les 3 principaux caractères d'insertion sont les suivants
1. Le symbole **B** => insère un *caractère blanc* entre deux séries de chiffres.
2. Le symbole **.** => insère un *point* comme séparateur de la partie entière et de la partie décimale.
3. Le symbole **,** => insère une *virgule* comme séparateur de la partie entière et de la partie décimale.

```cobol
01 SALAIRE PIC ZZBZZ9.99.
01 SALAIRE PIC ZZ.ZZ9.99.
01 SALAIRE PIC ZZB,Z9.99.
```
