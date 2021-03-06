#' Tokenize the corpus
#'
#' Tokenize and remove stopwords and rare words from the \code{speeches} corpus.
#' 
#' @param corpus a fnac corpus.
#' @param rare_word_limit The rare word limit to use (tokens for word types occuring less or equal to the limit is removed).
#' @param stop_list a character vector
#' 
#' @examples 
#' data("small_fnac_corpus")
#' small_fnac_corpus_tokenized <- tokenize_corpus(small_fnac_corpus)
#' 
#' @export
tokenize_corpus <- function(corpus, rare_word_limit = 10, stop_list = NULL){
  checkmate::assert_class(corpus, "tbl_df")
  checkmate::assert_subset(c("doc_id", "text"), names(corpus))
  checkmate::assert_integerish(rare_word_limit, lower = 0)
  checkmate::assert_character(stop_list, any.missing = FALSE, null.ok = TRUE)
    
  # Create one-token-per-row object
  txt <- tidytext::unnest_tokens(corpus, token, text)
  tkns <- nrow(txt)
  message(tkns, " tokens in data.")
  
  # Remove stop words
  if(!is.null(stop_list)){
    txt$row <- 1L:nrow(txt)
    stop_word <- dplyr::data_frame(word_type = stop_list)
    txt <- dplyr::anti_join(txt, stop_word, by = c("token" = "word_type"))
    txt <- dplyr::arrange(txt, row)
    txt$row <- NULL
    message(tkns - nrow(txt), " stop word tokens removed.")
    tkns <- nrow(txt)
  }
  
  # Calculate and remove rare words
  if(rare_word_limit > 0){
    rare_words <- dplyr::count(txt, token) 
    rare_words <- dplyr::filter(rare_words, n <= rare_word_limit)
    txt$row <- 1L:nrow(txt)
    txt <- dplyr::anti_join(txt, rare_words, by = c("token" = "token"))
    txt <- dplyr::arrange(txt, row)
    txt$row <- NULL
    message(tkns - nrow(txt), " rare word tokens removed.")
    tkns <- nrow(txt)
  }
  
  names(txt) <- c("doc_id", "token")
  txt$token <- as.factor(txt$token)
  txt
}

