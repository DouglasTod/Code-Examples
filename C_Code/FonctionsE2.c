#include "fiche.h"

void InitFiche(Fiche* p_f)
    {
        printf("Nom=");
        scanf("%s",&((*p_f).nom));
        printf("Domicile=");
        scanf("%s",&((*p_f).domicile));
        printf("Age=");
        scanf("%s",&((*p_f).age));
    }
