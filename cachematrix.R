## The functions in this program create a matrix and compute its inverse. For faster operations, the program uses
## caching. e.g. if inverse of matrix has already been calculated, the cached results are displayed (no re-calculation)

## This function creates a special vector, which is really a list containing a function to set and 
## get the matrix as well as to set and get its inverse

makeCacheMatrix <- function(matrix = matrix()) {
    invMatrix <- NULL
    set <- function(y){
        matrix <<- y
        invMatrix <<- NULL
    }
    get <- function() matrix
    setmatrix <- function(solve) invMatrix <<- solve
    getmatrix <- function() invMatrix
    list(set = set, get = get, setmatrix = setmatrix, getmatrix = getmatrix)
}

## cacheSolve(): This function calculates the inverse of the matrix created above. If the inverse has been already
## created (as in, if it is present in cache), it gets the inverse from the cache and skips the computation 
## (and hence, is faster)

cacheSolve <- function(matrix = matrix(), ...) {
    invMatrix <- matrix$getmatrix()
    if(!is.null(invMatrix)){
        message("Getting cached data")
        return(invMatrix)
    }
    properMatrix <- matrix$get()
    invMatrix <- solve(properMatrix, ...)
    matrix$setmatrix(invMatrix)
    invMatrix
}
