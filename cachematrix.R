#makeCacheMatrix: 
#This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = as.matrix()){
        i <- NULL
        set <- function(y){
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) i <<- inverse
        getInverse <- function() i
        list(set = set, get = get, 
             setInverse = setInverse, 
             getInverse = getInverse)
}


#cacheSolve: 
#This function computes the inverse of the special "matrix" returned 
#by makeCacheMatrix above. If the inverse has already been calculated 
#(and the matrix has not changed), then the cachesolve should retrieve 
#the inverse from the cache.

cacheSolve <- function(x, ...){
        i = x$getInverse()
        if(!is.null(i)){
            message("Getting Cached Matrix")
            return(i)    
        }
        matrix <- x$get()
        i <- solve(matrix)
        x$setInverse(i)
        i
}
