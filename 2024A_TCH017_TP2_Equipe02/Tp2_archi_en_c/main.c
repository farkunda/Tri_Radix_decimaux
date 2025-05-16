#include <stdio.h>
#include <stdlib.h>

void a_input(int *tab, int taille) { //saisit des donnees
    printf("Rentrez vos valeurs: \n");
    for (int i=0;i<taille;i++) {
        scanf("%d",&tab[i]);
    }
}

void b_copier(int *tab1,int *tab2, int taille) { //tab2<-tab1
    for (int i=0;i<taille;i++) {
        tab2[i] = tab1[i];
    }
}

int c_max(int *tab,int taille) { //trouver le max du tab
    int max =tab[0];
    for (int i=1; i<taille; i++) {
        if (max<tab[i]) {
            max=tab[i];
        }
    }
    return max;
}

void d_radix(int *tab1, int taille) { //tri radix en base 2

        int output[taille];
        int max = c_max(tab1, taille); //on trouve le max

        for (int shift = 0; (max >> shift) > 0; shift++) { //on fait la boucle pour chaque position jusqu'a que max soit 0 (apres les ASRA)
            int count[2] = {0, 0}; // initialiser count

            for (int i = 0; i < taille; i++) {
                int bit = (tab1[i] >> shift) & 1; //trouver le bit a la position cherchee
                count[bit]++; //incrementer count a l'indice de bit
            }

            // accumulation des comptes
            count[1] += count[0];

            // insertion dans output
            for (int i = taille - 1; i >= 0; i--) {
                int bit = (tab1[i] >> shift) & 1; // reisole le bit cherche
                output[--count[bit]] = tab1[i];  // on place les valeurs de tab1 dans la bonne case de output
            }

            // On copie output dans tab1
            for (int i = 0; i < taille; i++) { //tab1<-output
                tab1[i] = output[i];
            }
        }
    }


void e_radix(int *tab2, int taille) { //tri radix a base 16

    int output[taille];
    int max = c_max(tab2, taille);

    for (int shift = 0; (max >> shift) > 0; shift+=4) { //on fait des ASRA 4 fois de suite cette fois car on fait des paquets de 4 bits en hexa
        int count[16] = {0}; // initialiser count

        for (int i = 0; i < taille; i++) {
            int bit = (tab2[i] >> shift) & 0xF; // isoler les 4 bits (valeur hexa) cherches
            count[bit]++; //incrementer count
        }

        for (int i = 1; i<16; i++) {
            count[i] += count[i-1];
        }                               //accumulation des comptes pour les 16 cases de count

        //inserer les valeurs dans output
        for (int i = taille - 1; i >= 0; i--) {
            int bit = (tab2[i] >> shift) & 0xF; // reisoler les valeurs cherchee
            output[--count[bit]] = tab2[i];  // Placer les valeurs de tab2 dans output selon la valeure calculee
        }

        //on copie output dans tab2
        for (int i = 0; i < taille; i++) { //tab2<-output
            tab2[i] = output[i];
        }
    }
}

void f_affic(int *tab,int taille) { //on affiche les valeurs
    for (int i=0; i<taille; i++) {
        printf("%d ",tab[i]);
    }
    printf("\n");
}

void g_med(int *tab, int taille) { //on trouve la mediane
    float med = 0;
    if (taille%2 == 1) { //si la taille est impaire
        med = (float)tab[(taille-1)/2];
    }
    else { //si elle est paire
        med = (float)((tab[taille/2]+tab[(taille/2)-1]))/2;
    }
    printf("La mediane est de %.1f",med);
}
int main() {
    int taille = 0;
    printf("Combien de valeurs veux-tu trier?");
    scanf("%d",&taille);

    int tab1[taille];
    int tab2[taille];

    a_input(tab1,taille);
    b_copier(tab1,tab2,taille);

    d_radix(tab1, taille);
    printf("Tri en binaire: ");
    f_affic(tab1,taille);

    e_radix(tab2, taille);
    printf("Tri en hexadecimale: ");
    f_affic(tab2,taille);

    g_med(tab1, taille);


    return 0;
}