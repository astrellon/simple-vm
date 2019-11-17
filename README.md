# Simple Virtual Machine

A simple implementation of a virtual machine.

**This is intended for educational purposes only!** As it will not perform will nor does it conform to any specific real CPU!

## To run

Right now the program accepts a single command line argument which is the filename for a program.

```sh
ruby main test_program.asm
```

## Example program

```
# Test program
ASSIGN @value 5

:start_loop
PRINT "Counting " @value
SUB @value 1
NOT_EQUAL @is_equal @value 0
IF @is_equal :start_loop

PRINT "Loop done!"
```

Will print the following

```
Counting 5
Counting 4
Counting 3
Counting 2
Counting 1
Loop done!
```


## Author

Alan Lawrey