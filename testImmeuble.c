/******************************************************
*
* Seance 10
* Auteur : <Tod_Douglas et Puche_Thomas>
* Date : <>
* Serie : <B2a_03>
*****************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "immeuble.h"

int main (void)
{
    Immeuble imm1, imm2;
    Immeuble* p_imm2=&imm2;
    int val_switch=0;
    while (val_switch!=2)
      {
          printf("Choisissez une des options suivantes:\n1)Executer le programme\n2)Sortir du programme\n");
          printf("\nVotre choix : ");
          scanf ("%d",&val_switch);
          switch (val_switch)
              {
                case 1:
                    printf("Hauteur=");
                    scanf("%f",&(imm1.hauteur));
                    printf("Largeur=");
                    scanf("%f",&(imm1.largeur));
                    printf("Longueur=");
                    scanf("%f",&(imm1.longueur));
                    printf("nbEtages=");
                    scanf("%d",&(imm1.nbEtages));
                    printf("nbAppart=");
                    scanf("%d",&(imm1.nbAppart));

                    agrandirImmeuble(imm1,p_imm2);
                    printf("\nL'immeuble que vous avez saisi a les caracteristiques suivantes :\n");
                    afficherValeursChampsImmeuble (imm1);
                    printf("L'immeuble agrandi aura les caracteristiques suivantes:\n");
                    afficherValeursChampsImmeuble (imm2);
                    break;

                case 2:
                    val_switch=2;
                    printf("\n**Fin de programme**\n");
                    break;
                default:
                    printf("Vous n'avez pas saisi une option possible, veuillez saisir 1 ou 2\n\n");
              }
      }
    return EXIT_SUCCESS;
}
