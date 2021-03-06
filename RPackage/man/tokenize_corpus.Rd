% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tokenize_corpus.R
\name{tokenize_corpus}
\alias{tokenize_corpus}
\title{Tokenize the corpus}
\usage{
tokenize_corpus(corpus, rare_word_limit = 10, stop_list = NULL)
}
\arguments{
\item{corpus}{a fnac corpus.}

\item{rare_word_limit}{The rare word limit to use (tokens for word types occuring less or equal to the limit is removed).}

\item{stop_list}{a character vector}
}
\description{
Tokenize and remove stopwords and rare words from the \code{speeches} corpus.
}
\examples{
data("small_fnac_corpus")
small_fnac_corpus_tokenized <- tokenize_corpus(small_fnac_corpus)

}

