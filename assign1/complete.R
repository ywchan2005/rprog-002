complete <- function( directory, id=1:332 ) {
	nobs <- c()
	classes <- c( 'NULL', 'numeric', 'numeric', 'NULL' )
	j <- 1
	for( i in id ) {
		filename <- sprintf( '%s/%03d.csv', directory, i )
		data <- read.csv( filename, header=TRUE, colClasses=classes )
		s <- data[[ 'sulfate' ]]
		n <- data[[ 'nitrate' ]]
		g <- ! is.na( s ) & ! is.na( n )
		nobs[ j ] <- length( g[ g ] )
		j <- j + 1
	}
	data.frame( id=id, nobs=nobs )
}
