# matlab-patternmatching
matlab code for pattern matching of 2 matrices (only binary)

example:

     A = [1,0,1,0,1;

          0,1,1,1,1; 
     
          0,1,0,1,1;]
          
   
         
     B = [1,1;

          1,1;]
          
          

     result = 1


try patternmatching.m

patternmatching.m calls patternExactly.m 

patternExactly.m calls patternExactlyInRow.m


     patternExactly.m

     patternExactly(A, B)
------------------------------------------

     patternExactlyInRow.m

     patternExactlyInRow(A(1,:), B(1,:)


