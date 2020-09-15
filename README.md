# Pandoc example.
---------

Pandoc is a method for transforming markdown files into typset documents.

Documentation of any project is often left to the end, and does not get done. At MSF we see ongoing documentation as important as the project itself. Documentation is less important for a single use item/jig/code snippet, but highly important for a system that will see use over many years. If the theory and the mechanics are described, the hardware/software/proces can be maintained. If no or little documentation exisits, repairs or upgrade require extensive reverse-engineer. The reverse engineering costs is typcailly equal to or much greater than the time original took to create. This proecess is repeated for each improvement.

This template shows a simple example of building a documentation book from assorted readme & markdown files in your source tree.

Plan
---------------
Our Documents have several key features:
* Standard Cover Page
   * [Code Example](/Example/build-title.sh)
   * [Example](/Output/custom-titlepage.pdf)
* Standard Acknowledgement Page
* TOC
* Abstract
* Content
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
