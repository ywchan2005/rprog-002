source( 'cachematrix.R' )
d <- 1000
dd <- d * d
x <- matrix( rnorm( 1:dd ), c( d, d ) )
#x <- x %*% x
m <- makeCacheMatrix( x )
t <- Sys.time()
mm <- cacheSolve( m )
print( Sys.time() - t )
print( paste( 'is identity?', all.equal( diag( d ), m$get() %*% mm ) ) )
t <- Sys.time()
mm <- cacheSolve( m )
print( Sys.time() - t )
print( paste( 'is identity?', all.equal( diag( d ), m$get() %*% mm ) ) )
