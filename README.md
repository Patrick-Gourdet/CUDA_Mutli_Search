# CUDA_Mutli_Search
<img src="https://fedigital.org/wp-content/uploads/2020/07/nvidia.jpg">

# Initial thoughts
I can only speak for myself when saying; I would sit there and think; there has to be a better way. Well, there is, when it comes to searching for elements in a list.  I am sure you are aware of the standard procedure, given an unordered list. First, we sort with a sorting algorithm of choice then; you would have to go through each element to assure that a component was not in the given set (depending on the algorithm excluding divide and conquer and the like), but even with binary search the best you can hope to do is O(nLog (n)) where n is the hight of the tree. 
## Possibilities
With GPU processing, this is no longer an issue; each element has its observer (thread) and thus eliminates two things, the need to sort a list and the need to, in essence, search for a component. In theory, it is almost quantum in nature; you can be everywhere at the same time and wither you are or not. Meaning, at time 0 to time 1, is true or false for N^x elements. Kind of insane if you ask me.
## Applications
The GPU is underutilized in everyday applications, such as searching a database. Although it is a blocking call, the time between the request to the response can be O(1). The complexity of query a database would be far more complicated than the primary example in this repository. Still, to execute a query across multiple tables and databases using the GPU, all that is needed is to know where table x,y,z is. The size of each table and the unique identifiers of the data elements requested, in layman's terms where the data lives. Finally, a real reason to normalize a database, we save space and time. Those above would lend itself to creating a new querying language GPU-SQL or GSQL  based on GPU's. 
Disclaimer, I do say the N^x element's lightly, but it does have limitations, namely the amount of memory a GPU has to its disposal. To reiterate, searching a large amount of data in O(1) is possible and that without a HashTable.

# How it works 
Below we see a depiction of how we access a memory location in CUDA. Stating the obvious the memory location could or could not contain the information we are interested in. We could use CUDA and its memory access method to locate and return the data or the lack thereof in correspondence to an attribute in much shorter execution times. The decrease in execution time means energy savings, means savings for companies, a pay raise for the Devs LOL, and an overall smaller carbon footprint for the world. Its no revolution, but every bit counts. 

<img src="https://fedigital.org/wp-content/uploads/2020/07/NVIDIA.png">
