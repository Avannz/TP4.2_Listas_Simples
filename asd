#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    char nombre[30];
    char genero;
    int edad;
} persona;

typedef struct{
     int valores[100];
     int posTope; //posición de nuevo tope, lugar en donde se almacenará el nuevo valor
} Pila;

int cargarArreglo(persona arreglo[], int dim);
int cantidadGenero(persona arreglo[], int validos, char genero);
void pasarDatos(persona arreglo[], persona aux[], int validos, char genero);
void mostrarArreglo (persona arreglo[], int validos);
persona* crearArreglo (int validos);
persona cargarPersona();

void apilar(Pila * p, int valor);
int desapilar(Pila * p);
int tope(Pila * p);
void mostrar(Pila * p);
void leer (Pila * p);
int pilavacia(Pila* p);


int main()
{

    int arreglo[30];
    char genero;
    int validos;
    int eleccion;

    Pila p;
    Pila p2;



    printf("Ingrese el ejercicio: ");
    fflush(stdin);
    scanf("%i",&eleccion);
    switch(eleccion)
    {
    case 1:
        validos = cargarArreglo(arreglo, 30);
        printf("Ingresa un genero: ");
        fflush(stdin);
        scanf("%c", &genero);
        int cantGenero = cantidadGenero(arreglo, validos, genero);
        persona* arreglo2 = malloc(sizeof(persona) * cantGenero);
        pasarDatos(arreglo, arreglo2, validos, genero);
        mostrarArreglo(arreglo2, cantGenero);
        ordenarArreglo(arreglo2, validos);
        //mostrarArreglo(arreglo2, cantGenero);

        break;

    case 3:

        inicPila(&p);
        inicPila(&p2);
        apilar(&p, 5);
        mostrar(&p);
        leer(&p);
        mostrar(&p);
        desapilar(&p);
        mostrar(&p);

        while(!pilavacia(&p)){
            apilar(&p2, desapilar(&p));
        }

        mostrar(&p2);
        mostrar(&p);


        break;
    }

}

persona cargarPersona()
{

    persona aux;

    printf("\nIngresa el nombre: ");
    fflush(stdin);
    gets(aux.nombre);
    printf("\n");
    printf("Ingresa la edad: ");
    fflush(stdin);
    scanf("%d", &aux.edad);
    printf("\n");
    printf("Ingresa el genero (M o F): ");
    fflush(stdin);
    scanf("%c", &aux.genero);

    return aux;
}


int cargarArreglo(persona arreglo[], int dim)
{

    int i = 0;
    char letra = 's';

    while(i < dim && letra == 's')
    {
        arreglo[i] = cargarPersona();
        printf("\nIngresa 's' para continuar: ");
        fflush(stdin);
        scanf("%c", &letra);
        i++;
    }

    return i;
}

int cantidadGenero(persona arreglo[], int validos, char genero)
{

    int i = 0;
    int cant = 0;

    while(i < validos)
    {

        if(genero == arreglo[i].genero)
        {
            cant++;
            i++;
        }
        else
        {
            i++;
        }
    }

    return cant;
}

persona* crearArreglo (int validos)
{

    persona* aux = malloc(sizeof(persona) * validos);

    return aux;
}

void pasarDatos(persona arreglo[], persona aux[], int validos, char genero)
{

    int i = 0;
    int cant = 0;

    while(i < validos)
    {

        if(arreglo[i].genero == genero)
        {

            aux[cant] = arreglo[i];
            cant++;
            i++;
        }
        else
        {

            i++;

        }
    }
}

void mostrarArreglo (persona arreglo[], int validos)
{

    for(int i = 0; i < validos; i++)
    {

        printf("\n\n=================\n");
        printf("Nombre: %s\n", arreglo[i].nombre);
        printf("Genero: %c\n", arreglo[i].genero);
        printf("Edad: %d\n", arreglo[i].edad);
        printf("=================\n");

    }
}

void ordenarArreglo(persona arreglo[], int validos)
{
    int posmenor;
    persona aux;
    int i = 0;
    while(i < validos-1)
    {
        posmenor = posicionMenor(arreglo, i, validos);
        aux = arreglo[posmenor];
        arreglo[posmenor] = arreglo[i];
        arreglo[i] = aux;
        i++;
    }
}

int posicionMenor (persona arreglo[], int posIni, int validos)
{

    persona menor = arreglo[posIni];
    int posMenor = posIni;
    int i = posIni+1;

    while(i < validos)
    {
        if(menor.edad > arreglo[i].edad)
        {
            menor.edad = arreglo[i].edad;
            posMenor = i;

        }
        i++;
    }
    return posMenor;
}

void inicPila(Pila * p){

    p->posTope = 0;

}

void apilar(Pila * p, int valor){

    if(p->posTope < 100){

    p->valores[p->posTope] = valor;
    (p->posTope)++;

    }else{

        printf("\nPILA LLENA");

    }

}

int desapilar(Pila * p){
    int valor = p->valores[p->posTope-1];
    p->posTope--;

    return valor;
}

int tope(Pila * p){

    int i = p->valores[p->posTope-1];
    return i;
}

void mostrar(Pila * p)
{

    int validos = p->posTope;
    int i = 0;

        printf("...................................................\n");

    for(i = 0; i < validos; i++){

        printf(" %d", p->valores[i]);

    }

        printf("\n...................................................");
}

void leer (Pila * p){

    int i = 0;
    int num;

    printf("\n * Ingresa un valor: ");
    fflush(stdin);
    scanf("%i", &num);

    p->valores[p->posTope] = num;

    p->posTope++;

}

int pilavacia(Pila* p){
    if(p->posTope == 0){
        return 1;
    }
    else{
        return 0;
    }
}


