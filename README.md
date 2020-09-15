# Pandoc example.
---------

Pandoc is a method for transforming markdown files into typset documents.

Documentation of any project is often left to the end, and does not get done. At MSF we see ongoing documentation as important as the project itself. Documentation is less important for a single use item/jig/code snippet, but highly important for a system that will see use over many years. If the theory and the mechanics are described, the hardware/software/proces can be maintained. If no or little documentation exisits, repairs or upgrade require extensive reverse-engineer. The reverse engineering costs is typcailly equal to or much greater than the time original took to create. This proecess is repeated for each improvement.

This template shows a simple example of building a documentation book from assorted readme & markdown files in your source tree.

Plan
---------------
Our Documents have several key features:
* Standard Cover Page
   * [Script Example](Examples/build-title.sh)
   * [Code Example](custom-titlepage/custom-title.md)
   * [Output Example](Output/custom-title.pdf)

       Example output of properly running `build-title.sh` script

       ```
       $ ./build-title.sh
       ##
       # Building book example
       ##

       - custom-titlepage
       ```
   * In `custom-titlepage/background.pdf & /MSFlogo.png` are passed from custom-title.tex to `templates eisvogel.tex` to create the custom cover page / title .

* Standard Acknowledgement Page
   * TBD
* TOC
  * Created from the various files
* Abstract
  * Required -- first page
* Content
  * The various chapters that make up the document. 
* Appendices:
* Definitions
* Scripts
* Code





-----------------


For a mac ---

## Requirements
* *[MacTex](https://tug.org/mactex/)*

* *popplar*
```ruby -e
   "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    < /dev/null 2> /dev/null
    ```
