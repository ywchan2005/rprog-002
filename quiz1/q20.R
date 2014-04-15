data <- read.csv( 'hw1_data.csv', header=TRUE );
m <- data[[ 'Month' ]]
z <- data[[ 'Ozone' ]]
max( z[ m==5 ], na.rm=TRUE )
