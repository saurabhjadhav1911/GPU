#include <stdio.h>

__global__ void square(float * d_out,float * d_in){
int idx=threadIdx.x;
float f=d_in[idx];
d_out[idx] = f*f;
}


int main(int argc,char ** argv){
const int N=64;
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

square<<<1,N>>>(d_out,d_in);

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