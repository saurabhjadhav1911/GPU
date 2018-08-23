#include <stdio.h>
#define N 64

__global__ void square(float * d_out,float * d_in){
int idx=threadIdx.x;
float f=d_in[idx];
d_out[idx] = f*f/255;
}

void wrapper_square(float * d_out,float * d_in){

	square<<<1,N>>>(d_out,d_in);
}

int main(int argc,char ** argv){
const int ARRAY_BYTES = N * sizeof(float);

float h_in[N];
for(int i=0;i<N;i++){
  h_in[i]=float(i);
  
}
float h_out[N];

float * d_in;
float * d_out;
cudaMalloc((void **) &d_in, ARRAY_BYTES);
cudaMalloc((void **) &d_out, ARRAY_BYTES);

cudaMemcpy(d_in,h_in,ARRAY_BYTES,cudaMemcpyHostToDevice);

wrapper_square(d_out,d_in);

cudaMemcpy(h_out,d_out,ARRAY_BYTES,cudaMemcpyDeviceToHost);

for(int i=0;i<N;i++){
  printf("%f   ",h_out[i]);
  printf("%f",h_in[i]);
  printf("\n");
}

cudaFree(d_in);
cudaFree(d_out);

return 0;
}