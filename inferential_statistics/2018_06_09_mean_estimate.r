
llint_norm <- Vectorize(function(par, y.p, y.i){
    ## y.p Ã© um vetor de dados pontuais
    ## i.i Ã© uma matriz (n x 2) de dados intervalares
    if(missing(y.p)) ll.p <- 0
    else ll.p <-  sum(dnorm(y.p, mean=par, sd=5, log=TRUE))
    if(missing(y.i)) ll.i <- 0
    else ll.i <- sum(apply(y.i, 1, function(x) log(diff(pnorm(x, mean=par, sd=5)))))
    return(ll.i+ll.p)
}, "par")

llint_pois <- Vectorize(function(par, y.p, y.i){
    ## y.p Ã© um vetor de dados pontuais
    ## i.i Ã© uma matriz (n x 2) de dados intervalares
    if(missing(y.p)) ll.p <- 0
    else ll.p <-  sum(dpois(y.p, lambda=par, log=TRUE))
    if(missing(y.i)) ll.i <- 0
    else ll.i <- sum(apply(y.i, 1, function(x) log(diff(ppois(x, lambda=par)))))
    return(ll.i+ll.p)
}, "par")

yp  <- c(20, 28, 39)
optimize(llint_norm, interval=c(0,50), y.p=yp, maximum=TRUE)

yi  <- cbind(c(-Inf, 25, 38), c(22, 32, Inf)) 
optimize(llint_norm, interval=c(0,50),y.i=yi, maximum=TRUE)

yi  <- cbind(c(22, 25, -Inf), c(Inf, 32, 38))
optimize(llint_norm, interval=c(0,50),y.i=yi, maximum=TRUE)

yp <- c(5, 3, 0, 1, 6, 2, 3, 4, 5, 3)
optimize(llint_pois, interval=c(0,50), y.p=yp, maximum=TRUE)

yp <- c(5, 0, 1, 3, 4)
yi <- cbind(c(-Inf, 4, 1, 3, 1), c(3, Inf, 3, Inf, 6))
optimize(llint_pois, interval=c(0,50), y.p=yp, y.i=yi, maximum=TRUE)
