data <- read.csv( 'hw1_data.csv', header=TRUE );
r <- nrow( data )
data <- read.csv( 'hw1_data.csv', header=TRUE, skip=r-2 );
print( data )
