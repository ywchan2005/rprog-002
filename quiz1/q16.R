data <- read.csv( 'hw1_data.csv', header=TRUE );
z <- data[[ 'Ozone' ]]
length( z[ is.na( z ) ] )
