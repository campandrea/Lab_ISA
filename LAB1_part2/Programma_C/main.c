#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>


#define N 1 /// order of the filter
#define NB 10  /// number of bits


int main()
{
    long long int input_sample =0, output_sample=0;
    long long int C;
    static  long long int sw[N];

    long long int a_quad = 13, a_b = 35, B0 = 215, b_ab = 249,fb, ff;
    long long int Pipeline_vector[7] = {0,0,0,0,0,0,0};


    FILE *fp_in, *fp_out;



    ///open and check
    fp_in = fopen("samples_10.txt","r");
    if(fp_in == NULL){
        printf("Errore apertura file sample_10.txt");
        return EXIT_FAILURE;
    }

    fp_out = fopen("output_sample.txt","w");
    if(fp_in == NULL){
        printf("Errore apertura file output_sample.txt");
        return EXIT_FAILURE;
    }
    fclose(fp_out);

    fp_out = fopen("output_sample.txt","a");
    if(fp_out == NULL){
        printf("Errore apertura file output_sample.txt");
        return EXIT_FAILURE;
    }

    ///reading  samples from the file
    for(uint8_t i=0;i<201;i++){
        fscanf(fp_in,"%lld", &input_sample);
        output_sample =  Pipeline_vector[6] + Pipeline_vector[2];
        Pipeline_vector[2] = Pipeline_vector[0]*B0 >> (NB-1);
        Pipeline_vector[6] = Pipeline_vector[1] + Pipeline_vector[5];
        Pipeline_vector[1] = Pipeline_vector[0]*(b_ab) >> (NB-1);
        Pipeline_vector[5] = Pipeline_vector[3]*(a_b) >> (NB-1);
        Pipeline_vector[3] = Pipeline_vector[0];
        Pipeline_vector[4] = Pipeline_vector[0]*(a_quad) >> (NB-1);
        Pipeline_vector[0] = Pipeline_vector[4] + input_sample;
        for(uint16_t k=0;k<7;k++){
            printf("%lld    ", Pipeline_vector[k]);
        }
        printf("\n");
        fprintf(fp_out, "%lld\n", output_sample);
    }
    fclose(fp_in);
    fclose(fp_out);
    return 0;
}
