## makeCacheMatrix() creates a special "matrix" object that can cache its inverse.
## cacheSolve(): computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve retrieves the inverse from the cache.

## a list containing functions to
##  1. set the matrix
##  2. get the matrix
##  3. set the inverse
##  4. get the inverse
## this list is used as the input to cacheSolve()

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  ##  1. set the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  ##  2. get the matrix
  get <- function() x
  ##  3. set the inverse
  setinv <- function(inverse) inv <<- inverse 
  ##  4. get the inverse
  getinv <- function() inv
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## returns the inverse of the original matrix input to makeCacheMatrix()

cacheSolve <- function(x, ...) {
  
  inv <- x$getinv()
  
  # if the inverse has been calculated
  if (!is.null(inv)){
    # get it from the cache and skip the computation
    message("getting cached data")
    return(inv)
  }
  
  # if not calculated, calculate the inverse 
  mat.data <- x$get()
  inv <- solve(mat.data, ...)
  
  # sets the value of the inverse in the cache via the setinv function.
  x$setinv(inv)
  
  return(inv)
}
