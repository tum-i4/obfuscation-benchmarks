# Obfuscation Benchmarks
------------------------
By *Obfuscation Benchmarks* we mean programs which can be obfuscated using different tools at both source code, intermediate representation and/or machine code level.
The reason for obfuscating these programs can be (but is not limited) to compare the strength of different obfuscation transformations/implementations against both manual and automated attacks. 
This repository contains the source code of programs written in the C programming language, which can be used as obfuscation benchmarks. 

## Description of Each Directory

  - `basic-algorithms` contains typical algorithms taught in Bachelor level computer science and programming courses, e.g. factorial, sorting algorithms, searching algorithms, greatest common divisor, least common multiple, etc.
  - `simple-hash-functions` contains non-cryptographic hash functions 
  - `small-programs` contains a set of 48 programs with few lines of code constructed by varying the following code characteristics:
    - Range of symbolic inputs
    - Number of symbolic inputs
    - Depth of nested control flow
    - Number of IF-statements
    - Number of input dependent IF-statements
    - Type of IF-condition
    - Number of loops
    - Number of input length dependent loops (e.g. if the input is 10 characters long, then the loop has 10 iterations)
    - Number of input value dependent loops (e.g. if the input is an integer equal to 100, then the loop has 100 iterations)

## List of Obfuscation Tools
The following is a non-exhaustive list of obfuscation tools. Please feel free to contact me if you would like to add other tools to this list.

* [COBF](http://www.plexaure.de/cms/index.php?id=cobf)
* [Code Virtualizer](http://www.oreans.com/codevirtualizer.php)
* [EXECryptor](http://www.strongbit.com/execryptor_inside.asp)
* [Obfuscator-LLMV](https://github.com/obfuscator-llvm/obfuscator/wiki)
* [Mangle-It](http://www.brothersoft.com/mangle-it-c%2B%2B-obfuscator-91793.html)
* [Morpher](http://morpher.com/)
* [Semantics Designs Ticket](http://www.semdesigns.com/Products/Obfuscators/index.html)
* [StarForce C++ Obfuscator](http://www.star-force.com/products/starforce-obfuscator/)
* [Stunnix C/C++ Obfuscator](http://stunnix.com/prod/cxxo/overview.shtml)
* [Tigress](http://tigress.cs.arizona.edu/)
* [Themida](http://www.oreans.com/themida.php)
* [VMProtect](http://vmpsoft.com/)
