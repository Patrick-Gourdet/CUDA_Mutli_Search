# CUDA_Mutli_Search
<img src="https://fedigital.org/wp-content/uploads/2020/07/nvidia.jpg">

# Initial thoughts
I can only speak for myself when saying; I would sit there and think; there has to be a better way. Well, there is, when it comes to searching for elements in a list.  I am sure you are aware of the standard procedure, given an unordered list. First, we sort with a sorting algorithm of choice then; you would have to go through each element to assure that a component was not in the given set (depending on the algorithm excluding divide and conquer and the like), but even with binary search the best you can hope to do is O(nLog (n)) where n is the hight of the tree. 
## Possibilities
With GPU processing, this is no longer an issue; each element has its observer (thread) and thus eliminates two things, the need to sort a list and the need to, in essence, search for a component. In theory, it is almost quantum in nature; you can be everywhere at the same time and wither you are or not. Meaning, at time 0 to time 1, is true or false for N^x elements. Kind of insane if you ask me.
## Applications
The GPU is underutilized in everyday applications, such as searching a Database, which is a blocking call, but the time between the request to the response can be O(1)—so speeding up any query of N files parsing and retrieving, to the access time of a hash map. Of course, the complexity to query a database would be far more complicated than this basic example, but all we need to know is what table x,y,z contains each portion of the data, then we could retrieve everything using the unique identifiers. Finally, a real reason to normalize a database, we save space and time. Hey, maybe create a new querying language GPU-SQL or GSQL  based on GPU's. 
Disclaimer, I do say the N^x element's lightly, but it does have limitations, namely the amount of memory a GPU has to its disposal. To reiterate, searching a large amount of data in O(1) is possible and that without a HashTable.
<img src="https://fedigital.org/wp-content/uploads/2020/07/NVIDIA.png">
