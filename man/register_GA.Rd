% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/register_GA.R
\name{register_GA}
\alias{register_GA}
\alias{GA}
\alias{ga}
\alias{gaperm_mixedMutation}
\title{Register a Genetic Algorithm Seriation Method}
\usage{
register_GA()

gaperm_mixedMutation(ismProb = 0.8)
}
\arguments{
\item{ismProb}{probability to use \code{\link[GA:ga_Mutation]{GA::gaperm_ismMutation()}} (inversion) versus \code{\link[GA:ga_Mutation]{GA::gaperm_simMutation()}} (simple insertion).}
}
\value{
Nothing.
}
\description{
Register a GA-based seriation metaheuristic for use with \code{\link[=seriate]{seriate()}}.
}
\details{
Registers the method \code{"GA"} for \code{\link[=seriate]{seriate()}}. This method can be used
to optimize any criterion in package \pkg{seriation}.

\code{control} for
\code{seriate} with method \code{"GA"} accepts the following parameters:
\itemize{
\item "criterion" criterion to optimize. Default: BAR
\item "suggestions" suggestions to warm start the GA.
\code{NA} means no warm start. Default: TSP, QAP_LS and Spectral.
\item "selection" Selection operator.
\item "crossover" Crossover operator.
\item "mutation" Mutation operator. Default: a
mixture of the simple insertion (80\% chance) and simple inversion (20\%
chance) operators.
\item "pmutation" probability for permutations. Default: .5
\item "pcrossover" probability for crossover. Default: .2
\item "popsize" the population size. Default: 100
\item "maxiter" maximum number of generations. Default: 1000
\item "run" stop after \code{run} generations without improvement. Default: 50
\item "parallel" use multiple cores? Default: TRUE
\item "verbose" a logical; report progress? Default: TRUE
}

The GA uses by default the ordered cross-over (OX) operator. For mutation,
the GA uses a mixture of simple insertion and simple inversion operators.
This mixed operator is created using
\code{seriation::gaperm_mixedMutation(ismProb = .8)}, where \code{ismProb}
is the probability that the simple insertion mutation operator is used. See
package \pkg{GA} for a description of other available cross-over and
mutation operators for permutations. The appropriate operator functions in
\pkg{GA} start with \code{gaperm_}.

We warm start the GA using \code{"suggestions"} given by several heuristics.
Set \code{"suggestions"} to \code{NA} to start with a purely random initial
population.

\bold{Note:} Package \pkg{GA} needs to be installed.
}
\examples{

\dontrun{
register_GA()
get_seriation_method("dist", "GA")

d <- dist(random.robinson(50, pre=TRUE, noise=.1))

## use default settings: Banded AR form
o <- seriate(d, "GA")
pimage(d, o)

## optimize for linear sertiation criterion (LS)
o <- seriate(d, "GA", control = list(criterion = "LS"))
pimage(d, o)

## no warm start
o <- seriate(d, "GA", control = list(criterion = "LS", suggestions = NA))
pimage(d, o)
}
}
\references{
Luca Scrucca (2013): GA: A Package for Genetic Algorithms in R.
\emph{Journal of Statistical Software,} \bold{53}(4), 1--37. URL
\doi{10.18637/jss.v053.i04}.
}
\seealso{
Other seriation: 
\code{\link{register_DendSer}()},
\code{\link{register_optics}()},
\code{\link{register_tsne}()},
\code{\link{register_umap}()},
\code{\link{registry_seriate}},
\code{\link{seriate}()}
}
\author{
Michael Hahsler
}
\concept{seriation}
\keyword{cluster}
\keyword{optimize}
