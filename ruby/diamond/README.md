# Diamond

Given a letter, print a diamond starting with 'A' with the supplied letter at the widest point.

## Diamond kata

The diamond kata takes as its input a letter, and outputs it in a diamond 
shape. Given a letter, it prints a diamond starting with 'A', with the 
supplied letter at the widest point.

## Requirements

* The first row contains one 'A'.
* The last row contains one 'A'.
* All rows, except the first and last, have exactly two identical letters. 
* The diamond is horizontally symmetric.
* The diamond is vertically symmetric.
* The diamond has a square shape (width equals height).
* The letters form a diamond shape.
* The top half has the letters in ascending order.
* The bottom half has the letters in descending order. 
* The four corners (containing the spaces) are triangles.

## Examples

Diamond for letter 'A':

```plain
A
```

Diamond for letter 'C':

```plain
  A
 B B
C   C
 B B
  A
```

Diamond for letter 'E':

```plain
    A       
   B B   
  C   C 
 D     D
E       E
 D     D   
  C   C
   B B
    A
``` 
* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called
`hello_world_test.rb`, you can run the following command:

    ruby hello_world_test.rb

To include color from the command line:

    ruby -r minitest/pride hello_world_test.rb

The test files may have the execution bit set so you may also be able to
run it like this:

    ./hello_world_test.rb

## Source

Seb Rose [http://claysnow.co.uk/recycling-tests-in-tdd/](http://claysnow.co.uk/recycling-tests-in-tdd/)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

