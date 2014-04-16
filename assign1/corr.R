corr <- function( directory, threshold=0 ) {
	corrs <- numeric()
	id <- 1:332
	classes <- c( 'NULL', 'numeric', 'numeric', 'NULL' )
	j <- 1
	for( i in id ) {
		filename <- sprintf( '%s/%03d.csv', directory, i )
		data <- read.csv( filename, header=TRUE, colClasses=classes )
		s <- data[[ 'sulfate' ]]
		n <- data[[ 'nitrate' ]]
		g <- ! is.na( s ) & ! is.na( n )
		if( length( g[ g ] ) > threshold ) {
			corrs[ j ] <- cor( s, n, use='complete.obs' )
			j <- j + 1
		}
	}
	corrs
}
