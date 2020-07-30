
// ReSharper disable CppClangTidyCppcoreguidelinesAvoidGoto
// ReSharper disable CppClangTidyHicppAvoidGoto
#include <cassert>
#include <iostream>
#include <limits>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

struct SetSearchValue
{
private:
	int search = 0;
public:
	 SetSearchValue(int serarch_in) : search(serarch_in){}
	int* getSearch(){return &search;};
	
};
inline cudaError_t checkCuda(cudaError_t result)
{
  if (result != cudaSuccess) {
    fprintf(stderr, "CUDA Runtime Error: %s\n", cudaGetErrorString(result));
  	goto ERROR;
  }
  return result;
}


__global__ void search_bigo_one(int* d_in,int* d_out_result, const int* d_in_search_val,const int SIZE)
{
	const int index = blockIdx.x * blockDim.x + threadIdx.x;
	if(index < SIZE){
	const int value = d_in[index];	
		if(value == *d_in_search_val)
		{
			printf("%d\n", value);
			*d_out_result = blockIdx.x * blockDim.x + threadIdx.x;		
		}
	}
}
/// <summary>
/// This is a short intro to a GPU search algorithm
/// this in theory should have run time of O(1)
/// the algorithm assigns one thread to each element in the array.
/// and the element that we are searching for is passed in along with
/// the thread and array element then the thread that contains the
/// element returns the 
/// </summary>
/// <returns></returns>
auto main() -> int
{
	const auto SIZE = 1000;
	const auto BYTES = SIZE * sizeof(int);
	auto* h_in = static_cast<int*>(malloc(SIZE * sizeof(int)));
	
	int input = 0;
	do
	{
		std::cout << "Enter value to search for: " << std::endl;
		std::cin >> input;
	}while (input == 0);

	SetSearchValue sv =  SetSearchValue(input);
	auto max = std::numeric_limits<int>::max();
	int* d_in;
	int* d_result_index;
	int* d_search;
	auto initializer = 0;
	auto* const search = sv.getSearch();
	auto* const index = &max;
	h_in[544] = *search;
	
	for(int i{0} ; i < SIZE; i++)
	{
		if(i == 52) continue;
		 initializer = rand() % 1472 + 1;
		*(h_in + i)  = initializer == 44? initializer * initializer : initializer;
		std::cout << *(h_in + i);
	}

	for(int ii = 0 ; ii < SIZE ; ii++)
	{
		std::cout << ":   this is the input value at" << *(h_in + ii) << std::endl;
	}
	// Allocate GPU buffers for three vectors (two input, one output)    .
	checkCuda(cudaMalloc(reinterpret_cast<void**>(&d_in), BYTES));
	checkCuda(cudaMalloc(reinterpret_cast<void**>(&d_search), sizeof(int)));
	checkCuda(cudaMalloc(reinterpret_cast<void**>(&d_result_index), sizeof(int)));

	checkCuda(cudaMemcpy(d_in, h_in, BYTES, cudaMemcpyHostToDevice));
	checkCuda(cudaMemcpy(d_search, search, sizeof(int), cudaMemcpyHostToDevice));
	const auto threads = 256;
	auto block = (SIZE * threads)/ threads;
	search_bigo_one<<<block,threads>>>(d_in,d_result_index,d_search,SIZE);
	checkCuda(cudaGetLastError());
	checkCuda(cudaMemcpy(index, d_result_index, sizeof(int), cudaMemcpyDeviceToHost));
	
	if(*index == max)
	std::cout << "The value was found at: "  << *index << std::endl;
	else
	std::cout << "No such value" << std::endl;

ERROR:
    checkCuda(cudaFree(d_in));
	checkCuda(cudaFree(d_search));
	checkCuda(cudaFree(d_result_index));
	free(index);
	free(h_in);


}

