#include <stdio.h>
#include <stdlib.h>
#include "immeuble.h"


void agrandirImmeuble(Immeuble immReference,Immeuble* ptrImmAgrandi)
    {
        ptrImmAgrandi->hauteur=2*immReference.hauteur;
        ptrImmAgrandi->largeur=2*immReference.largeur;
        ptrImmAgrandi->longueur=2*immReference.longueur;
        ptrImmAgrandi->nbEtages=2*immReference.nbEtages;
        ptrImmAgrandi->nbAppart=2*immReference.nbAppart;
    }

void afficherValeursChampsImmeuble (Immeuble imm)
    {
        printf("hauteur : %f\nlargeur : %f\nlongueur : %f\nnbEtages : %d\nnbAppart : %d\n\n\n",imm.hauteur,imm.largeur,imm.longueur,imm.nbEtages,imm.nbAppart);
    }
