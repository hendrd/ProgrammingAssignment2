# Matrix inversion is usually a costly computation and there
# may be some benefit to caching the inverse of a matrix rather 
# than compute it repeatedly (there are also alternatives to
# matrix inversion that we will not discuss here). Your 
# assignment is to write a pair of functions that cache the 
# inverse of a matrix.

# makeCacheMatrix: This function creates a special "matrix" 
# object that can cache its inverse.

makeCacheMatrix <- function( x = matrix()) {
        inv = NULL
        set <- function(y) {
                x <<-
                        inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


# cacheSolve: This function computes the inverse of the special 
# "matrix" returned by makeCacheMatrix above. If the inverse 
# has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- inv(data, ...)
        x$setinv(inv)
        inv
}