### Assignment 2: Caching the Inverse of a Matrix

The assignment contains a pair of functions that cache the inverse
of a matrix.

1.	`makeCacheMatrix`: This function creates a special "matrix"
	object that can cache its inverse.
2.	`cacheSolve`: This function computes the inverse of the
	special "matrix" returned by `makeCacheMatrix` above. If the
	inverse has already been calculated (and the matrix has not
	changed), the the `cacheSolve` should retrieve the inverse
	from the cache.
