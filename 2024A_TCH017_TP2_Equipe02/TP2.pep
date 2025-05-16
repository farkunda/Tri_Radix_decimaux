;TRI RADIX
;
;        AUTEURES        : Sarah Hann, Arisa Halluni, Ariane Hussaini, Farkunda Wahedi
;        DATE:           : 08/12/2024
;        EQUIPE:         : Gr12-Equipe02
;        DESCRIPTION     :
;
;                Ce programme contient des fontions qui
;                permettent de trier un tableau donne 
;                avec la methode de tri de comptage 
;                utilise plusieurs fois pour faire
;                un tri radix.

         BR      main,i
;---------------------------------------------------------------------------------
;FONCTION: A_INPUT
;
;    Fonction qui fait la saisie des nombres du tableau a trier
;
; PARAMETRES
;    *tab : pointeur vers tableau vide
;    taille: taille du tableau vide
;
; PARAMETRES MODIFIES
;    *tab : Tableau a les valeurs saisies
;
; VARIABLES LOCALES:
;
;position  relatives des arguments AVANT l'appel
a_arg1a: .EQUATE -2          ;taille
a_arg1b: .EQUATE  0          ;taille
a_arg2:  .EQUATE -4          ;adresse du tableau 1

;position relatives des parametres DANS la fonction
a_prm1:  .EQUATE 8           ;taille
a_prm2:  .EQUATE 6           ;adresse tableau 1

;taille de la zone des parametres
a_prms:  .EQUATE 4

;position relaives des registres DANS la fonction
a_regA:  .EQUATE -2
a_regX:  .EQUATE -4

;taille de la zone des registres
a_regs:  .EQUATE 4


;---------------------------------------------------------------------------------
a_input: STA     a_regA,s       ;sauvegarde du registre A
         STX     a_regX,s       ;sauvegarde du registre B
         
         SUBSP   a_regs,i
         
         LDX     0,i             ;for (int i =0; i<taille; i++){
            
a_for_1: CPX     a_prm1,s        ;x = taille 
         BREQ    a_end_1,i    

         DECI    a_prm2,sxf      ;DECI toutes les valeurs du tableau         
         ADDX    2,i             ;scanf(%d,&tab[i])}

         BR      a_for_1,i

a_end_1: LDA     2,s             ;restauration du registre A
         LDX     0,s             ;restauration du registre B
         
         ADDSP   a_regs,i        ;depile les registres            

         RET0

;---------------------------------------------------------------------------------
;FONCTION: B_COPIER
;
;    Fonction qui copie tab1 dans tab2
;
; PARAMETRES
;    *tab1 : pointeur vers tab1 
;    *tab2 : pointeur vers tab2
;
; PARAMETRES MODIFIES
;    *tab2 : Tableau a les valeurs de tab1
;
; VARIABLES LOCALES:

;
;position  relatives des arguments AVANT l'appel
b_arg1:  .EQUATE -2          ;taille
b_arg2:  .EQUATE -4          ;adresse du tableau 1
b_arg3:  .EQUATE -6          ;adresse du tableau 2

;position relatives des parametres DANS la fonction
b_prm1:  .EQUATE 10          ;taille
b_prm2:  .EQUATE 8           ;adresse tableau 1
b_prm3:  .EQUATE 6           ;adresse tableau 2

;taille de la zone des parametres
b_prms:  .EQUATE 6

;position relaives des registres DANS la fonction
b_regA:  .EQUATE -2
b_regX:  .EQUATE -4

;taille de la zone des registres
b_regs:  .EQUATE 4
;---------------------------------------------------------------------------------
b_copier:STA     b_regA,s       ;sauvegarde du registre A
         STX     b_regX,s       ;sauvegarde du registre B
         
         SUBSP   b_regs,i
         
         LDX     0,i            ;for (int i = 0; i<taille; i++) {      
         
b_for_1: CPX     b_prm1,s
         BREQ    b_end_1,i

         LDA     b_prm2,sxf      ;LDA tab1 STA tab2 pour toutes les cases de tab1 et 2
         STA     b_prm3,sxf      ;tab2[i] = tab1 [i]}
         
         ADDX    2,i
         BR      b_for_1,i  

b_end_1: LDA     2,s             ;restauration du registre A
         LDX     0,s             ;restauration du registre B
         
         ADDSP   b_regs,i        ;depile les registres            

         RET0                        
;--------------------------------------------------------------------------------
;FONCTION: C_MAX
;
;    Fonction qui trouve la valeur maximum d'un tableau
;
; PARAMETRES
;    *tab1 : pointeur vers tab1
;    *max  : Case vide pour valeur max du tableau
;
; PARAMETRES MODIFIES
;    *max: valeur max du tableau
;
; VARIABLES LOCALES:
;
;
;position  relatives des arguments AVANT l'appel
c_arg1:  .EQUATE -2              ;max

;position relatives des parametres DANS la fonction
c_prm1:  .EQUATE 18              ;max
c_prm2:  .EQUATE 20              ;adresse de tableau 1 
c_prm3:  .EQUATE 22              ;taille tableau

;taille de la zone des parametres
c_prms:  .EQUATE 2

;position relaives des registres DANS la fonction
c_regA:  .EQUATE -2
c_regX:  .EQUATE -4

;taille de la zone des registres
c_regs:  .EQUATE 4

;---------------------------------------------------------------------------------
c_max:   STA     c_regA,s       ;sauvegarde du registre A
         STX     c_regX,s       ;sauvegarde du registre B
         
         SUBSP   c_regs,i

         LDX     0,i
         LDA     c_prm2,sxf
         STA     c_prm1,s        ;int max = tab1[0]; // Find the maximum number in the array    
         
         ADDX    2,i

c_for_1: CPX     c_prm3,s        ;for (int i = 1; i < taille; i++) {           
         BREQ    c_end_1,i

         LDA     c_prm2,sxf
         CPA     c_prm1,s       ;comparer toutes les cases du tableau pour trouver max
         BRGT    c_thn_1,i      ;if (tab1[i] > max) {

         BR      c_eof_1,i

c_thn_1: STA     c_prm1,s       ;max = tab1[i];} 
         BR      c_eof_1,i

c_eof_1: ADDX    2,i
         BR      c_for_1,i

c_end_1: LDA     2,s             ;restauration du registre A
         LDX     0,s             ;restauration du registre B
         
         ADDSP   c_regs,i        ;depile les registres            

         RET0  

;--------------------------------------------------------------------------------
;FONCTION: C_MAX2
;
;    Fonction qui trouve la valeur maximum d'un tableau
;
; PARAMETRES
;    *tab1 : pointeur vers tab1
;    *max  : Case vide pour valeur max du tableau
;
; PARAMETRES MODIFIES
;    *max: valeur max du tableau
;
; VARIABLES LOCALES:

;position relatives des parametres DANS la fonction
c2_prm1:  .EQUATE 46           ;max
c2_prm2:  .EQUATE 48           ;adresse de tableau 2 
c2_prm3:  .EQUATE 50           ;taille tableau

;taille de la zone des parametres
c2_prms:  .EQUATE 2

;position relaives des registres DANS la fonction
c2_regA:  .EQUATE -2
c2_regX:  .EQUATE -4

;taille de la zone des registres
c2_regs:  .EQUATE 4

;---------------------------------------------------------------------------------
c_max2:  STA     c2_regA,s       ;sauvegarde du registre A
         STX     c2_regX,s       ;sauvegarde du registre B
         
         SUBSP   c2_regs,i

         LDX     0,i
         LDA     c2_prm2,sxf
         STA     c2_prm1,s        ;int max = tab2[0]; 
         
         ADDX    2,i

c2_for_1: CPX     c2_prm3,s       ;for (int i = 1; i < taille; i++) {           
         BREQ    c2_end_1,i

         LDA     c2_prm2,sxf
         CPA     c2_prm1,s        ;comparer toutes les cases du tableau pour trouver max
         BRGT    c2_thn_1,i       ;if (tab2[i] > max) {

         BR      c2_eof_1,i

c2_thn_1: STA     c2_prm1,s       ;max = tab2[i];} 
         BR      c2_eof_1,i

c2_eof_1: ADDX    2,i
         BR      c2_for_1,i

c2_end_1: LDA     2,s             ;restauration du registre A
         LDX     0,s              ;restauration du registre B
         
         ADDSP   c2_regs,i        ;depile les registres            

         RET0  

;--------------------------------------------------------------------------------
;FONCTION: D_RADIX2
;
;    Fonction qui fait le tri radix d'un tableau en binaire
;
; PARAMETRES
;    *tab1 : pointeur vers tab1
;  
;
; PARAMETRES MODIFIES
;    *tab1 : Tableau avec valeurs tries
;
; VARIABLES LOCALES:
;
;taille des arguments
d_arg1:  .EQUATE 10          ;taille
d_arg2:  .EQUATE 8           ;*tab1
;taille des parametres
d_prms:  .EQUATE 14    
;parametres
d_prm1:  .EQUATE 18          ;premiere case de output
d_prm2:  .EQUATE 16          ;taille
d_prm3:  .EQUATE 14          ;*tab1
d_prm4:  .EQUATE 12          ;max
d_prm5:  .EQUATE 10          ;i asra (compteur de asra)
d_prm6:  .EQUATE 8           ;bit
d_prm7:  .EQUATE 6           ;i for (compteur de boucle)
d_prm8:  .EQUATE 4           ;i taille 
d_prm9:  .EQUATE 2           ;premiere case de compt
d_prm10: .EQUATE 0           ;deuxieme case de compt
d_prm11: .EQUATE -2          ;i out (indice de compteurs)
d_prm12: .EQUATE -4          ;i temp 

;poisitions des registres
d_regA:  .EQUATE -2          ;A
d_regX:  .EQUATE -4          ;X

;taille des registres
d_regs:  .EQUATE 4           

;---------------------------------------------------------------------------------
; SUBSP output[] 

                 ;sauvegarde les registres

d_radix2:        STA         d_regA,s
                 STX         d_regX,s
                 SUBSP       d_regs,i 

                 LDA         d_arg1,s          ;sauver taille et &tab et faire de la place pour output[]
                 LDX         d_arg2,s
                 SUBSP       d_arg1,s
                 STA         -2,s
                 STX         -4,s
                 SUBSP       4,i
                 
                 SUBSP       d_prms,i          ;faire place pour autres variables
                 LDA         0,i
                 STA         d_prm5,s          ;i(asra)<-0

                 CALL       c_max,i 
;------------------------------------------------------------------------------------------------------------------------------------
                                               ;for (int shift = 0; (max >> shift) > 0; shift++){

d_for_0:         LDA         d_prm4,s 
                 CPA         0,i
                 BREQ        d_fin,i           ;on continue la boucle jusqu'a que max==0

                 LDA         0,i
                 STA         d_prm10,s
                 STA         d_prm9,s          ;cmpt[] = {0,0} 
                 
;-------------------------------------------------------------------------------------------------------------------------------------
                 ;compter les occurences
                 
                 LDA         0,i
                 STA         d_prm7,s          ;i(for)<-0  ;for (int i = 0; i < taille; i++) { 
          
d_for_1:         LDX         d_prm7,s
                 CPX         d_prm2,s          ;boucle de i a taille {
                 BREQ        d_bd1,i

                 LDA         d_prm3,sxf        ;A<-tab1[i]

                 LDX         d_prm5,s
                 STX         d_prm12,s         ;i temp <- i asra
                 
d_shift:         LDX         d_prm12,s
                 CPX         0,i
                 BREQ        d_next,i
                 ASRA

                 SUBX        1,i               ;i temp--;
                 STX         d_prm12,s  
                 BR          d_shift,i         ;int bit = (tab1[i] >> shift) & 1; 
      
                 
d_next:          ANDA        0x0001,i          ;isoler le bit de poid faible
                 ASLA
                 STA         d_prm6,s          ;bit<-A


                 LDX         d_prm6,s
                 LDA         0,sx              ;compt[bit]++
                 ADDA        1,i
                 STA         0,sx

                 LDX         d_prm7,s
                 ADDX        2,i               ;i (for) ++
                 STX         d_prm7,s

                 BR          d_for_1,i         ;}
;----------------------------------------------------------------------------------------------------------------------------------------
                 ;accumulation des comptes
                 ;count[1] +=count[0]

d_bd1:           LDX         0,i
                 LDA         0,sx              ;A<-cmp[0]                  
                 ADDX        2,i    
                 ADDA        0,sx              ;A<-A+cmp[1]
                 STA         0,sx              ;cpmt[1]<-A


                 ;mettre les chiffres dans output (on commence de la fin)
                
                 LDA         d_prm2,s
                 SUBA        2,i
                 STA         d_prm8,s          ;i<-taille-2

                 
d_for_2:         LDX         d_prm8,s      
                 CPX         0,i               ;boucle de i(taille) a 0
                 BRLT        d_bd2,i           ;for (int i = taille - 1 (ici -2); i >= 0; i--) 

                 LDA         d_prm3,sxf        ;A<-tab1[i]
               
                 LDX         d_prm5,s
                 STX         d_prm12,s         ;i temp <- i asra
                 
d_shift2:        LDX         d_prm12,s
                 CPX         0,i
                 BREQ        d_next2,i

                 ASRA

                 SUBX        1,i               ;i temp--;
                 STX         d_prm12,s  
                 BR          d_shift2,i
                 
d_next2:         ANDA        0x0001,i          ;isoler le bit de poid faible
                 ASLA
                 STA         d_prm6,s          ;int bit = (arr[i] >> shift) & 1;

                 LDX         d_prm6,s          ;X<-bit
                 LDA         0,sx              ;A<-cmpt[bit]
                 SUBA        1,i               ;--compt[bit]
                 STA         0,sx
  
                                               ;output[--count[bit]] = arr[i]; 

                 ASLA                          ;i(output)*2 car 2 octets
                 STA         d_prm11,s         ;i(output) <- A

                 LDX         d_prm8,s          ;X<-i(taille}
                 LDA         d_prm3,sxf        ;A<tab1[i]

                 LDX         d_prm11,s         ;X<-i[output]
                 STA         d_prm1,sx         ;output[x]<-A

                 LDA         d_prm8,s
                 SUBA        d_prm9,i
                 STA         d_prm8,s          ; i(taille)--;

                 BR          d_for_2,i

;-------------------------------------------------------------------------------------------------------------------------------------
                 ;copier output[] dans tab1[]
                 ;for (int i = 0; i < taille; i++) { 
                 ;tab1[i] = output[i]; }

d_bd2:           LDX         0,i
d_for_3:         CPX         d_prm2,s
                 BREQ        d_dbcl1,i         ;for (int i = 0; i < taille; i++) { 

                 LDA         d_prm1,sx
                 STA         d_prm3,sxf        ;tab[i] = output[i]

                 ADDX        2,i
                 BR          d_for_3,i

d_dbcl1:         LDA         d_prm5,s
                 ADDA        1,i
                 STA         d_prm5,s          ; i(asra)++

                 LDA         d_prm4,s 
                 ASRA        
                 STA         d_prm4,s          ;max<<shift

                 BR          d_for_0,i

                                               ;} fin de la boucle parent***

                                               ;depiler

d_fin:   ADDSP   16,i
         ADDSP   0,s
         ADDSP   2,i

         LDA     2,s                           ;<restauration des registres>
         LDA     0,s

         ADDSP   4,i                           ;<liberation des zones de memoires>

         RET0

;-----------------------------------------------------------------------------------------------------------------------------------------
;FONCTION: E_RADIX16
;
;    Fonction qui fait le tri radix d'un tableau en hexadecimal
;
; PARAMETRES
;    *tab2 : pointeur vers tab2
;  
;
; PARAMETRES MODIFIES
;    *tab2 : Tableau avec valeurs tries
;
; VARIABLES LOCALES:

;taille des arguments
e_arg1:  .EQUATE 10          ;taille
e_arg2:  .EQUATE 6           ;*tab2
;taille des parametres
e_prms:  .EQUATE 46    
;
;positions relatives des parametres DANS la fonction
e_prm1:  .EQUATE 46          ;output
e_prm2:  .EQUATE 44           ;taille
e_prm3:  .EQUATE 42          ;*tab2
e_prm4:  .EQUATE 40          ;max
e_prm5:  .EQUATE 38          ;i(asra)
e_prm6:  .EQUATE 36          ;bit 
e_prm7:  .EQUATE 34          ;i for
e_prm8:  .EQUATE 32          ;i taille 
e_prm9:  .EQUATE 0           ;compte
e_prm10: .EQUATE -2          ;i out
e_prm11: .EQUATE -4          ;i temp 
    
;
;
;positions relatives des registres DANS la fonction
e_regA:  .EQUATE -2
e_regX:  .EQUATE -4

;taille de la zone des registres
e_regs:  .EQUATE 4
;
;---------------------------------------------------------------------------------
                 ;sauvegarde des registres

e_radix2:        STA         e_regA,s
                 STX         e_regX,s
                 SUBSP       e_regs,i

                 LDA         e_arg1,s          ;sauver taille et &tab et faire de la place pour output[]
                 LDX         e_arg2,s
                 SUBSP       e_arg1,s
                 STA         -2,s              ;taille
                 STX         -4,s              ;*tab2
                 SUBSP       46,i              ;faire place pour toutes les variables  
                 
                 LDA         0,i
                 STA         e_prm5,s          ;i(asra)<-0

                 CALL       c_max2,i 
                

                                               ;for (int shift = 0; (max >> shift) > 0; shift++){

e_for_0:         LDA         e_prm4,s 
                 CPA         0,i
                 BREQ        e_fin,i           ;on continue la boucle jusqu'a que max==0

                 LDX         0,i
e_init:          CPX         32,i
                 BREQ        e_finit,i          

                 LDA         0,i               
                 STA         0,sx 

                 ADDX        2,i
                 BR          e_init,i
                 
;--------------------------------------------------------------------------------------------------------------------------------------
                 ;compter les occurences
                 

e_finit:         LDA         0,i
                 STA         e_prm7,s          ;i(for)<-0  ;for (int i = 0; i < taille; i++) { 
          
e_for_1:         LDX         e_prm7,s          
                 CPX         e_prm2, s         ;boucle de i a taille {
                 BREQ        e_bd1,i

                 LDA         e_prm3,sxf        ;A<-tab2[i]

                 LDX         e_prm5,s
                 STX         e_prm11,s         ;i temp <- i asra
                 
e_shift:         LDX         e_prm11,s
                 CPX         0,i
                 BREQ        e_next,i
                 ASRA                          ;SHIFT de 4;
                 ASRA
                 ASRA
                 ASRA

                 SUBX        1,i               ;i temp--;
                 STX         e_prm11,s   
                 BR          e_shift,i         ;int bit = (arr[i] >> shift) & 1; 
      
                 
e_next:          ANDA        0x000F,i          ;isoler leS 4 bitS de poid faible
                 ASLA 
                 STA         e_prm6,s          ;bit<-A


                 LDX         e_prm6,s
                 LDA         0,sx              ;compt[bit]++
                 ADDA        1,i
                 STA         0,sx
                 
                
                 LDX         e_prm7,s
                 ADDX        2,i               ;i (for) ++
                 STX         e_prm7,s

                 BR          e_for_1,i         ;}
;-------------------------------------------------------------------------------------------------------------------------------------------
                 ;accumulation des comptes
                 ;count[i] +=count[i-1] - i=0 à i<16

                 ;for (int i=1; i<16; i++){
                 ;count[i]+=count[i-1]
                 ;}


e_bd1:           LDX         2,i               ;condition d'arret de la boucle : i<16 - 16 est la base
e_for_2:         CPX         32, i
                 BREQ        e_eof_2, i

                 LDA         0,sx              ;A<-compt[i]
                 SUBX        2, i
                 ADDA        0,sx              ;A<-compt[i-1]+ compt[i]
                 ADDX        2,i
                 STA         0,sx              ;count[i] +=count[i-1]
                 
               
                 ADDX        2,i
                 
                 BR          e_for_2, i


                 ;mettre les chiffres dans output (on commence de la fin)
                
e_eof_2:         LDA         e_prm2,s
                 SUBA        2,i
                 STA         e_prm8,s          ;i<-taille-2

                 
e_for_3:         LDX         e_prm8,s      
                 CPX         0,i               ;boucle de i(taille) a 0
                 BRLT        e_bd2,i           ;for (int i = taille - 1 (ici -2); i >= 0; i--) 

                 LDA         e_prm3,sxf        ;A<-tab2[i]
               
                 LDX         e_prm5,s
                 STX         e_prm11,s         ;i temp <- i asra
                 
e_shift2:        LDX         e_prm11,s
                 CPX         0,i
                 BREQ        e_next2,i

                 ASRA                          ;shift 4x
                 ASRA
                 ASRA
                 ASRA

                 SUBX        1,i               ;i temp--;
                 STX         e_prm11,s  
                 BR          e_shift2,i
                 
e_next2:         ANDA        0x000F,i          ;isoler le bit de poid faible
                 ASLA
                 STA         e_prm6,s          ;int bit = (tab2[i] >> shift) & 1;

                 LDX         e_prm6,s          ;X<-bit
                 LDA         0,sx              ;A<-cmpt[bit]
                 SUBA        1,i               ;--compt[bit]
                 STA         0,sx
  
                 ;output[--count[bit]] = arr[i]; 

                 ASLA                          ;i(output)*2 car 2 octets
                 STA         e_prm10,s         ;i(output) <- A

                 LDX         e_prm8,s          ;X<-i(taille}
                 LDA         e_prm3,sxf        ;A<tab2[i]

                 LDX         e_prm10,s         ;X<-i[output]
                 
                 STA         e_prm1,sx         ;output[x]<-A

                 LDA         e_prm8,s
                 SUBA        2,i
                 STA         e_prm8,s          ; i(taille)--;

                 BR          e_for_3,i

;--------------------------------------------------------------------------------------------------------------------------------------
                 ;copier output[] dans tab2[]
                 ;for (int i = 0; i < taille; i++) { 
                 ;tab1[i] = output[i]; }

e_bd2:           LDX         0,i
e_for_4:         CPX         e_prm2,s
                 BREQ        e_dbcl1,i         ;for (int i = 0; i < taille; i++) { 

                 LDA         e_prm1,sx
                 
                 STA         e_prm3,sxf        ;tab2[i] = output[i]
                 

                 ADDX        2,i
                
                 BR          e_for_4,i

e_dbcl1:         LDA         e_prm5,s
                 
                 ADDA        1,i
                 STA         e_prm5,s           ; i(asra)++
                 

                 LDA         e_prm4,s 
                
                 ASRA                           ;shift 4x
                 ASRA
                 ASRA
                 ASRA
       
                 STA         e_prm4,s           ;max<<shift

                 BR          e_for_0,i

                                                ;} fin de la boucle parent***

                                                ;depiler

e_fin:   ADDSP   44,i
         ADDSP   0,s
         ADDSP   2,i

         LDA     2,s                            ;<restauration des regsitres>
         LDX     0,s

         ADDSP   4,i                            ;<liberation des zones de memoire>

         RET0


;---------------------------------------------------------------------------------------------------------------------------
;FONCTION: F_AFFICH
;
;    Fonction qui affiche les valeurs d'un tableau 
;
; PARAMETRES
;    *tab : pointeur vers un tableau
;  
;
; PARAMETRES MODIFIES
;    Aucun
;
; VARIABLES LOCALES:
;
 
;
;arguments
f_arg1:  .EQUATE 6           ;*tab
f_arg2:  .EQUATE 12          ;taille
;
;
;positions relatives des registres DANS la fonction
f_regA:  .EQUATE -2
f_regX:  .EQUATE -4

;taille de la zone des registres
f_regs:  .EQUATE 4
;---------------------------------------------------------------------------
f_affic: STX     f_regX,s                       ;sauvegarde des registres
         STA     f_regA,s

         SUBSP   f_regs,i

         LDX    0,i                             ;for (i=0; i<taille; i++)
f_for_1: CPX    f_arg2,s                        ;x==0
         BREQ   f_fin,i

         DECO   f_arg1,sxf                      ;printf("%d",tab[i]);
         CHARO  ' ',i

         ADDX   2,i                             ;x+2
         BR     f_for_1,i

f_fin:   CHARO  '\n',i
         LDA     2,s                            ;<restauration des registres>
         LDX     0,s

         ADDSP   f_regs,i                       ;<liberation des zones memoires>

         RET0   

;
;--------------------------------------------------------------------------------------------------------------------------------------
;FONCTION: G_MED
;
;    Fonction qui trouve la mediane d'un tableau et l'affiche 
;
; PARAMETRES
;    *tab : pointeur vers un tableau
;  
;
; PARAMETRES MODIFIES
;    Aucun
;
; VARIABLES LOCALES:
;

;taille des parametres
g_prms:  .EQUATE 6    
;
;positions relatives des parametres DANS la fonction
g_prm1:  .EQUATE 0          ;mediane
g_prm2:  .EQUATE 10         ;*tab1
g_prm3:  .EQUATE 12         ;taille

;positions relatives des registres DANS la fonction
g_regA:  .EQUATE -2
g_regX:  .EQUATE -4

;taille de la zone des registres
g_regs:  .EQUATE 4
;
;---------------------------------------------------------------------------------------------------------------------------------------
g_med:   STA     g_regA,s                      ;sauvegarde des registres
         STX     g_regX,s
         SUBSP   g_prms,i                      

         LDA     g_prm3,s                       
         ASRA
         STA     g_prm3,s

         ANDA    0x0001,i  
         CPA     1,i  
         BREQ    g_impair,i                    ;si nbre_cases est impaire au va a g_impair
         BR      g_pair,i                      ;si nbre_cases est paire au va a g_pair
;cas impair
g_impair: LDX    g_prm3,s
          ASRX
          ASLX   
          LDA    g_prm2,sxf                    ;tab[(nbre_cases/2)*2], car pep8 ne prend pas en compte les nombres apres la virgule
         
          STA    g_prm1,s                      ;mediane<-A
          
          DECO   g_prm1,s                      ;printf mediane
          BR     g_fin,i

;cas pair
g_pair:  LDX     g_prm3,s                         
         LDA     g_prm2,sxf

         STA     g_prm1,s

         LDX     g_prm3,s
         SUBX    2,i
         

         LDA     g_prm2,sxf
         ADDA    g_prm1,s
         STA     g_prm1,s                       ;somme des 2 cases au milieu tab[nb_cases]+tab[nb_cases-2]
         
         ANDA    0x0001,i                       ;verifier si pair ou impair

         CPA     1,i
         BREQ    g_imp2,i                       ;si la somme est impaire
         BR      g_pair2,i                      ;si la somme est paire

g_pair2: LDA     g_prm1,s
         ASRA
         STA     g_prm1,s                       ;somme/2 et printf


         DECO    g_prm1,s  
         BR      g_fin,i

         
g_imp2:  LDA   g_prm1,s                          ;printf somme/2 et printf ".5", car la division causerait un .5
         ASRA
         STA   g_prm1,s

         DECO  g_prm1,s
         CHARO '.',i
         DECO  5,i
         
         BR    g_fin,i



g_fin:   LDX     2,s
         LDA     4,s
        
         ADDSP   g_prms,i
         RET0
;--------------------------------------------------------------------------------------------------------------------------------
;FONCTION: MAIN - Appelle tout les sous-programmes

m_ask:   .ASCII  "Combien de valeurs voulez-vous trier? \x00"
m_input: .ASCII  "Veuillez entrer vos valeurs: \n\x00"
m_out:   .ASCII  "Triage en binaire: \x00"
m_out2:  .ASCII  "Triage en hexadecimale: \x00"
m_out3:  .ASCII  "Valeur de la mediane: \x00" 


;fonction a_input-------------------------------------------------------------------------------------------------------
main:    STRO     m_ask,d
         DECI     a_arg1a,s         ;scanf("%d", &taille)
         LDA      a_arg1a,s         ;taille x2
         ASLA
         STA      a_arg1a,s

         SUBSP    2,i

         LDA      a_arg1b,s         ;sauvegarder la taille dans le registre A
         SUBSP    a_arg1b,s         ;creation du tableau sur la pile

         STA      a_arg1a,s         ;deplacer la taille en haut du tableau 
         
         MOVSPA
         STA      a_arg2,s          ;envoyer adresse du tableau sur la pile

         SUBSP    a_prms,i
         STRO     m_input,d
                               
         CALL     a_input,i

;fonction b_copier---------------------------------------------------------------------------------------------------

         LDA     0,s              ;sauvegarder l'adresse de tab 1
         LDX     2,s              ;sauvegarder la taille

         SUBSP   2,s              ;creer de la place pour un deuxieme tableau vide de la meme taille
         
         STX     b_arg1,s         ;deplacer la taille des deux tableaux
         STA     b_arg2,s         ;deplacer adresse de tab 1

         MOVSPA
         STA     b_arg3,s         ;envoyer adresse de tab2 sur la pile   
         
         SUBSP   b_prms,i

         CALL    b_copier,i


;fonction d_radix2---------------------------------------------------------------------------------------------------
         
         CALL    d_radix2,i       ;call d_radix pour tri radix base 2 
         STRO    m_out,d
         LDA     2,s
         STA     -2,s             ;mettre l'adresse de tab1 sur le dessus de la pile
         SUBSP   2,i
         CALL    f_affic,i        ;call f_affic pour afficher tab1
         ADDSP   2,i


;fonction e_radix2---------------------------------------------------------------------------------------------------

         CALL    e_radix2,i       ;call e_radix pour tri radix base 16
         STRO    m_out2, d
         LDA     0,s
         STA     -2,s             
         SUBSP   2,i
         CALL    f_affic,i        ;call f_affic pour afficher tab2
         ADDSP   2,i

         STRO    m_out3,d
         CALL    g_med,i          ;call g_med pour afficher la mediane

;Liberer la pile-----------------------------------------------------------------------------------------------------------
         ADDSP   4,i              ;<liberation des zones memoires>
         ADDSP   0,s
         ADDSP   4,i
         ADDSP   0,s
         ADDSP   4,s
         

         STOP

         .END    