# Raku Riddle Contest

[![Build Status](https://travis-ci.com/yangyanzhan/raku-riddle-contest.svg?branch=main&status=passed)](https://travis-ci.com/github/yangyanzhan/raku-riddle-contest)

Watch Raku Riddle Contest on [My Youtube Channel](https://www.youtube.com/channel/UCDkz-__gl3frqLexukpG0DA) .

# How to join this contest? Gif Illustration.

![tutorial.gif](https://github.com/yangyanzhan/raku-riddle-contest/raw/main/resources/tutorial.gif)

# How to join this contest? Detailed Tutorial.

### 1. Fork my code.

### 2. Select a riddle to solve. Let's say you want to solve the first riddle.

### 3. View the content of the first riddle. There are two kinds of files to look at for one riddle.

The desc.txt file shows the description for this riddle.

The files under the case directory show the test cases for this riddle. Each test case corresponds to two files in the case directory. The input.txt is the input of the test case. The output.txt is the desired output of the test case.

To view the content of the first riddle. You should look at ./riddles/1/desc.txt and ./riddles/1/case.

### 4. Write a solution for the riddle.

To write a solution, create a raku file under the solutions directory. For example, to solve the first riddle, you should create ./solutions/1/username.raku in which the username is your github username. Note that you must use your github username to name the raku file, otherwise your commit can't be merged into the master repo.

Your solution script is expected to solve only one single test case for one invocation. The test driver will repeatedly call your script for each test case and provide the input of the test case as the stdin for your script. You should print your result to the stdout. If your result is the same as the desired output of the test case, then this test case will be marked as correct. If all the test cases are correctly solved, then your script is viewed as correct.

### 5. Check the correctness of your solution.

Use the test.raku file in the root directory to test the correctness of your solution. For example, to test your solution for the first puzzle, you should use the following command.

```
raku test.raku --riddle=1 --user=username
```

### 6. Create a pull request so that your solution can be merged back to the main repo.

Create a pull request, I'll check the correctness and the uniqueness of your solution. If the solution is both correct and unique, I'll merge your pull request and publish your solution to my youtube channel so that everyone can learn from your raku code.

# Riddle Difficulty Level

This repo needs your help! If you have any idea of a novel and difficult riddle, please contact me.

Also, sometimes there're two tracks for one week's riddle. For example, for the #2 riddle, there are 2-1 riddle and 2-2 riddle. 2-1 stands for the first track (easy track). 2-2 stands for the second track (hard track).

# How to support me?

It's very easy to support me. Just follow my youtube channel and my github account. Also don't forget to star this project.

# How to watch videos about this contest?

Every week, I'll upload a video to youtube to spread the best solutions to everyone who loves raku. If you like raku, don't forget to follow me in my youtube channel.

This is [My Youtube Channel](https://www.youtube.com/channel/UCDkz-__gl3frqLexukpG0DA) .

# Youtube Video List:

[Introduction](https://www.youtube.com/watch?v=-LNAyCxXVxY&list=PLauAmRFUiNdtNCuyA9SlSReMOMtchw6CU&index=1)

[Solution for #1 Riddle](https://youtu.be/bP3qoaWLig0)

[Solution for #2 Riddle](https://youtu.be/PJR9TA0OMM0)

[Solution for #3 Riddle](https://youtu.be/ZxpU5xRl0i4)

[Solution for #4 Riddle](https://youtu.be/Iduj4nznojM)

[Solution for #5 Riddle](https://youtu.be/3xYWRzi4biY)

