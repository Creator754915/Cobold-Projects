# COBOLD
Small COBOL projects for start COBOL

## Display

DISPLAY est utilisé pour afficher une valeur dans la console COBOL.

```cobol
DISPLAY "Bonjour les cobolistes !".
```

*NotaBene: **chaque ligne de COBOL doit finir par un point (.)***

# Variables

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

Chaque caractères de la variable représente 1 octet

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

*NotaBene: la lettre **V** est utlisé comme **virgule virtuelle** de la variable SOLDE*

## Variables à Données Numériques Binaire

On utlise le mot clef `USAGE IS COMPUTATIONAL` pour définir une variable binaire mais on utise le plus souvent `COMP` ou `BINARY`
