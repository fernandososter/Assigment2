
## The 2 function above aim to generate and keep an inverse matrix 
## in memory. 

## MakeCacheMatrix creates an 

## It doesn't matter whether the input matrix is inversed or not, 
## cacheSolve() will invert the matrix content, this way it will 
## work correct in both cases. 


##
## This function creates the "object" that holds the matrix structure. 
##
makeCacheMatrix <- function(mat = matrix()) {

  ## inverseMatrix holds the inverted matrix content. 
  ## This variable is accessed through Getter and Setter method.  
  inverseMatrix <- NULL 
  
  ## Matrix Setter Method 
  set <- function(y) {
    ## Setting matrix in mat variable. 
    mat <<- y ## 
    
    ## Every time that a new matrix is setted the inverse must be zeroed.
    inverseMatrix <<- NULL 
  
  }
  
  ##Matrix Getter method
  get <- function() mat
  
  ## Inverse Matrix setter method.
  setInverse <- function(inverse) inverseMatrix<<- inverse
  
  ## Inverse matrix getter method. 
  getInverse <- function() inverseMatrix
  
  ## returning the list element with object template to be accessed outside. 
  list (set = set, get = get, setInverse = setInverse, getInverse = getInverse )
  
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
  
  ## Getting the inverted matrix. 
  matInverse <- x$getInverse()
  
  ## If the matrix wasn't returned (matInverse is NULL) so there isn't
  ## any cache and it must be generated. Otherwise, if it's not NULL, 
  ## so the message will be printed and cache could be returned  
  
  if(!is.null(matInverse)) {
    message("using cached data.")  
    matInverse
  }
  
  ## If the execution stack reach this point means that there isnt any cache in before step. 
  ## The inverse matrix will be generated (solve() function) and setted inside x variable. 
  x$setInverse(solve(x$get()))
  
  ## returning the inversed matrix. 
  x$getInverse()
}
