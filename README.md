# CUDA_Mutli_Search
Here I have implemented a short but pretty much a solution to any Seaching algorithmic problem.
Anyone who has had a coding interview has been there then need to search and sort specific elements within a string.

I can only speek for myself when saying I would sit there and think there has to be abetter way well there is.

If you are presented with a family of objects lets say balls and they are all diffrent colors, and you are asked to
find the red one. Well you look at the entire set then pinpoin the red ball and you are done. Prior, or in serial this
was not possible. If a list is unordered you would have to go through each element to assure that an elemnt was not in the given set.
Resulting in best run time of O(n) for an unordered list. 
With GPU processing this is no longer an issue each elment has its own observer and thus eliminates two things the need to sort a list
and and the need to in look at every elemnt in serial.
Seach for  an element in o(1) depending on elements then it depends on the number of blocks used
