# COBOLD
Small COBOL projects for start COBOL

## Display

DISPLAY est utilisé pour afficher une valeur dans la console COBOL.

```cobol
DISPLAY "Bonjour les cobolistes !".
```

*NotaBene: **chaque ligne de COBOL doit finir par un point (.)***

## Variables

Il existe plusieurs types de variables dans le COBOL

### Variable Numérique:

Définir une variable SOLDE qui pourra accepter des nombres entre 0 et 9

```cobol
01 SOLDE PIC 9.
```

Définir une variable SOLDE qui pourra accepter des nombres entre 0 et 9999

```cobol
01 SOLDE PIC 9(4).
```

Ainsi les variables peuvent avoir au maximum 18 caractères soit 999.999.999.999.999.999

Chaque caractères de la variable représente 1 octet
