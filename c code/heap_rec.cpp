#include <iostream> 
using namespace std; 

// creating a max heap
void heapify(int arr[], int n, int i) 
{ 
	int largest = i; // biggest as root
	int l = 2*i + 1; // left 
	int r = 2*i + 2; // right 

	// if left is grater than root
	if (l < n && arr[l] > arr[largest]) 
		largest = l; 

	// if right is greater than root 
	if (r < n && arr[r] > arr[largest]) 
		largest = r; 

	// if biggest is not root
	if (largest != i) 
	{ 
		swap(arr[i], arr[largest]); 

		// calling again for sub-tree
		heapify(arr, n, largest); 
	} 
} 

// doing heap-sort
void heapSort(int arr[], int n) 
{ 
	// rearrange array
	for (int i = n / 2 - 1; i >= 0; i--) 
		heapify(arr, n, i); 

	// removing one by one from heap
	for (int i=n-1; i>0; i--) 
	{ 
		// swapping current element to last element
		swap(arr[0], arr[i]); 

		// calling same function on modified max heap
		heapify(arr, i, 0); 
	} 
} 

// printing the array
void printArray(int arr[], int n) 
{ 
	for (int i=0; i<n; ++i) 
		cout << arr[i] << " "; 
	cout << "\n"; 
} 

// main program for calling everything
int main() 
{ 
	int arr[] = {12, 11, 13, 5, 6, 7}; 
	int n = sizeof(arr)/sizeof(arr[0]); 

	heapSort(arr, n); 

	cout << "Sorted array is \n"; 
	printArray(arr, n); 
} 
