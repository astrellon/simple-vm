# Test program
ASSIGN @value 5

:start_loop
PRINT "Counting " @value
SUB @value 1
NOT_EQUAL @is_equal @value 0
IF @is_equal :start_loop

PRINT "Loop done!"