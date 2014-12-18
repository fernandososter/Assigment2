## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## function declaration where mat is the matrix parameter
makeCacheMatrix <- function(mat = matrix()) { 

  inverseMatrix <- NULL 
  
  set <- function(y) {
    mat <<- y
    inverseMatrix <<- NULL
  }
  
  get <- function() mat
  
  setInverse <- function(inverse) inverseMatrix<<- inverse
  
  getInverse <- function() inverseMatrix
  
  list (set = set, get = get, setInverse = setInverse, getInverse = getInverse )
  
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  matInverse <- x$getInverse()
  
  if(!is.null(matInverse)) {
    message("using cached data.")  
    matInverse
  }
  
  
  x$setInverse(solve(x$get()))
  
  x$getInverse()
}
