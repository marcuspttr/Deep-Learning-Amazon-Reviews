# big-data-challenge
Processing big data to analyze Amazon Vine reviews


## Some thoughts:
- I struggled and had to do some extra research when creating the layers and number of neurons for my neural network.
- I also had to look into creating callback steps to the fitting process.
- It was a interesting homework, try as I might, I could not improve the accuracy of my model. It hovered around 72 to 74% accuracy pretty consistently.

## The work:

### A picture of the initial data provided:
![Initial upload of data](https://github.com/marcuspttr/big-data-challenge/blob/main/Assets/intial_load.PNG)
I accessed the S3 buckets for Amazon's video game products as well as lawn & garden.  I selected the two data sets because I thought they would be different enough in theme that I could get a more rounded sense of the overall Amazon review datasets. 

I initially dropped the EIN and Name as they were not important factors beyond identification and tracking.

### Cleaning the data:
![Overview of data](https://github.com/marcuspttr/big-data-challenge/blob/main/Assets/data_types.PNG)

Here is a resulting schema, making sure it is ready 

![One hot dataframe](https://github.com/marcuspttr/big-data-challenge/blob/main/Assets/schema.PNG)

### Creating the layers of my neural network.
My next process was the define my neural network and create the layers.
At this point I had 38 features of my data  including ask amounts, application and classifciation types, income groupings, and any other special considerations.
My target was whether or not is was deemed successful.

With this in mind my opening layer had 38 dimensions and using the rule of thumb that the output should be 2 to 3 times that I ened up with 95 as the output. With such
extreme upper values for some of my categories I decided to use the 'relu' activation function. My hidden layer followed a different basic formula of 2/3 the input + the final output (which is just 1 target for my data), so I used 26 units.

Here is the code for my design:
![NN model design](https://github.com/marcuspttr/big-data-challenge/blob/main/Assets/table_creation_write.PNG)

And the resulting parameters:
![NN model parameters](https://github.com/marcuspttr/big-data-challenge/blob/main/Assets/sql_queries.PNG)

### Model accuracy
![Model accuracy loss](https://github.com/marcuspttr/big-data-challenge/blob/main/Assets/sql_averages.PNG)

After compiling and fitting my model (many, many times) my final accuracy didn't hit the intended 75%. 
- I tried different cut off points for my Application and Classification columns data (using 100 or 50 as cut offs to not overgroup the data or 1000 to eliminate the spread of the data alltogether). 
- I tried different activation functions such as tanh or sigmoid all the way through (testing the idea that neural networks like calculations to be between 0 and 1).
- I played with different levels of layers and neurons but that seemed to make things worse, whereas most other changes seemed negligible.

## Final thoughts
I was happy with my results and some of the exploration I was able to do in this homework.
Althought disappointed that I did not hit the target 75% accuracy I do have some ideas I could try in the future:
- I need to research what outliers might look like and how to properly address them in a neural network model, beyond using a scaler on the quantitative data.
- I need to also look into how to actually properly select the number of neurons and layers for creating a deep learning model. Blindly following rules of thumb doesnt seem like good practice.
