       IDENTIFICATION DIVISION.
       PROGRAM-ID. FirstProgram.
       AUTHOR. Gabriel.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NOM PIC X(12) VALUE 'RAPHAEL'.
           02 WS-AGE PIC 9(3).
           03 SOLDE PIC 9(4)V99.
           88 WS-MAJEUR VALUE 18.

       PROCEDURE DIVISION.
           
           DISPLAY "Bienvenue Coboliste !".
           DISPLAY "Quel est ton nom ?".

           ACCEPT WS-NOM.

           MOVE 1457.59 TO SOLDE.
           DISPLAY SOLDE.

           DISPLAY "Et bien salut " WS-NOM.

           DISPLAY "Quel est ton age ?".
           ACCEPT WS-AGE.

           SET WS-MAJEUR TO TRUE.

           IF WS-AGE = 18
               DISPLAY "Tu es majeur"
           ELSE 
               DISPLAY "Tu n'est pas encore majeur"
           END-IF

           STOP RUN.
