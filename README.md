# rcrpsfnac
A repository containg financial news articles in Chinese

# Installation

1. Clone the repository to your local computer (you need git large file system [here](https://git-lfs.github.com/))

2. Install the package

```
devtools::install_local("[the path to the repository]/RPackage")
```

# Access data
The data contained in the package can be wieved in this way:

```
data(package = "rcrpsfnac")
```

To load a corpus just use:

```
data(package = "rcrpsfnac")
```

To get a tokenized version just use:

```
small_fnac_corpus_tokenized <-  tokenize_corpus(small_fnac_corpus, rare_word_limit = 10, stop_list = NULL)
```


