## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<-NULL
  }
  get <- function() x
  
  getInverse <- function() inv
  # Function to cache the inverse of the matrix
  cacheSolve <- function() {
    if (!is.null(inv)) {
      message("Getting cached data")
      return(inv) # Return the cached inverse if available
    }
    message("Calculating inverse and caching")
    inv <- solve(x) # Calculate and cache the inverse
    return(inv)
  }
  
  # Return a list of the functions
  list(set = set, get = get, getInverse = getInverse, cacheSolve = cacheSolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- obj$getInverse() # Attempt to retrieve the cached inverse
  if (!is.null(inv)) {
    message("Getting cached data")
    return(inv) # Return the cached inverse if available
  }
  
  message("Calculating inverse and caching")
  inv <- solve(obj$get()) # Calculate and cache the inverse
  obj$setInverse(inv) # Cache the inverse
  return(inv)
}
# Create a cacheable matrix
mat <- makeCacheMatrix(matrix(c(4, 2, 2, 3), nrow = 2))

# Calculate and cache the inverse
cacheSolve(mat)
