## to cache up internal state of a matrix in order to save time taken
## on recomputation

## to create a special 'matrix' which is able to cache inverse matrix

makeCacheMatrix <- function( x = matrix() ) {
	## inverse matrix cache, initially set to NULL
	im <- NULL
	## set the value of the matrix
	set <- function( y ) {
		x <<- y
		im <<- NULL
	}
	## get the vlaue of the matrix
	get <- function() {
		x
	}
	## set the value of the inverse matrix
	setInverse <- function( m ) {
		im <<- m
	}
	## set the value of the inverse matrix
	getInverse <- function() {
		im
	}
	list( set = set,
		get = get,
		setInverse = setInverse,
		getInverse = getInverse )
}


## to calculate the inverse matrix of the special 'matrix' created
## with makeCacheMatrix

cacheSolve <- function( x, ... ) {
	## retrieve internally cached inverse matrix
	im <- x$getInverse()
	## if the cached inverse matrix is not null, use it as the
	## result of this function
	if( ! is.null( im ) ) {
		message( "getting cached data" )
		return( im )
	}
	## otherwise, compute the inverse matirx in the original way
	data <- x$get()
	im <- solve( data, ... )
	## store the inverse matrix in the cache
	x$setInverse( im )
	## return the inverse matrix
	im
}
