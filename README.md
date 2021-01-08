# Lessons in Pandoc and Markdown

## Background
Documentation for engineering projects: software, hardware, or firmware is often left to the end. The development history and choices are often lost to time. The software open source community has standardized using markdown in the repositories (coupled with readthedocs). We needed pdf copies for our customers. So we are utilizing `pandoc`, the `eisvogel latex template`, and `GitHub Markdown` to meet our needs.

## Introduction
Latex combined with templates makes documents easily customizable for different publishing needs. We use a template called [`eisvogel`](https://github.com/Wandmalfarbe/pandoc-latex-template). The template was selected for completeness and the color pallet.

### Tool chain
```
Markdown --> GitHub --> pandoc --> Latex --> eisvogel --> pdflatex --> pdf Output
```
## Configuration
Assumptions:
* pandoc installed and running
* `eisvogel.latex` present in current working directory
* output directory is in `currentworkingdirectory/pdf`

## Simplest Example
We are going to use the Command Line Interface (CLI) to create a simple pdf file. We are going to use the [file](mypandoctest.md) called `mypandoctest.md` for all our testing. It contains multilevel headers, ordered lists, unordered lists, code blocks, and inline code. We have included a small sample inline to keep this document readable. You will need to add a codeblock in the readme file to see some of the advanced outputs.

### Input: Example markdown text
```
# Top Heading Chapter 1

This is some content that might go Here

* Unordered list element
* Unordered list element
* Unordered list element
* Unordered list element

# Second Heading Next chapter
Notice that pandoc did not number the breaks

# Third Heading
The quick Brown Fox Jumped over the lazy Dog's Back.The quick Brown Fox Jumped over the lazy Dog's Back.The quick Brown Fox Jumped over the lazy Dog's Back.

```

### Output 1: Basic Rendering -- No Numbering
The simplest case is basic rendering. This results in a tidy Times New Roman Rendering.  Simple but effective. This will give the document a pretty and tidy Times New Roman Look.
```
pandoc -s mypandoctest.md  -o pdf/mypandoctest.pdf
```
[***output file***](pdf/mypandoctest.pdf)

### Output 2: Basic Rendering -- Apply Template
The next level is to apply the template to the entire document. This changes the font and the page setup
```
pandoc -s mypandoctest.md  -o pdf/mypandoctest_eisvogel.pdf  --template eisvogel.latex
```
[***output file***](pdf/mypandoctest_eisvogel.pdf)

## Advanced Rendering
Now that we have the `eisvogel` template applied, we will be adding features to the document using this template. If you don't like the template you can choose a different one or the default one. A few of the varaibles `eisvogel` uses are specific to the template, but most are in the generic pandoc/latex toolchain.

We are building the complexity of the rendered document, but it important to understand that each of these options can be omitted or included. As and example if you didn't want the `eisvogel` template you would just leave it off. and everything would render correctly.

You will need to add a sub-directory to your working directory `/pdf`

```
mkdir pdf
```

### Output 3: Advanced Rendering -- Apply Template and listing
Next we run the listing through the template. This is where we get the nice output we are looking to achieve. The code snippet should be in a box with blue and gray syntax highlighting.

```
pandoc -s mypandoctest.md  -o pdf/mypandoctest_eisvogel_listing.pdf --listing --template eisvogel.latex
```
[***output file***](pdf/mypandoctest_eisvogel_listing.pdf)

### Output 4: Advanced Rendering -- Adding numbered sections
Now we are going to apply numbering to the sections. Here you will learn the levels of Heading, ie. the number of # signs determines the heading level in the renderings.
* a single # sign is and **H1** or a chapter equivalent -- ***1.0***
* two ## signs is an **H2** heading ***1.1***
* ...
* five ##### signs is a **H5** level heading ***1.1.1.1.1***

```
pandoc -s mypandoctest.md  -o pdf/mypandoctest_eisvogel_listing_numbered.pdf --listing --number-sections --template eisvogel.latex
```
[***output file***](pdf/mypandoctest_eisvogel_listing_number.pdf)


### Output 5: Advanced Rendering -- Adding a Table of Contents (TOC)
A table of contents uses the heading level **H#** lines to create the TOC.

```
pandoc -s mypandoctest.md  -o pdf/mypandoctest_eisvogel_listing_numbered_toc.pdf --listing --number-sections --toc --template eisvogel.latex
```

[***output file***](pdf/mypandoctest_eisvogel_listing_number_toc.pdf)


## More Complex configurations
Utilizing the CLI is practical for small jobs or scripting the work, but we also have the option of using YAML files to provide the configurations. We can also specify *variables* used by either the `eisvogel` template or `Pandoc` engine. Below is a sample YAML file that does all the above steps.

```

---
input-files:
  - mypandoctest.md

variables:
  toc-own-page: true

toc: true
template: eisvogel.latex
output-file: mypandoctest_YAML.pdf
number-sections: true

...

```
We run the command with
```
pandoc --listing -d mypandoctestYAML.yml
```

[***output file***](pdf/mypandoctest_YAML.pdf)

This is the basis for an MSF report. The only added item above is the TOC is on it's own page. with the `toc-own-page: true` statement in the variables.

### Adding Authorship with YAML file
Latex and `eisvogel` have author and title variables. The `eisvogel` imports the latex variables and uses them.

we are going to add the following lines to our YAML file under the `variables` section. for title and author, and change the output filename.

```
---
input-files:
  - mypandoctest.md

variables:
  toc-own-page: true
  title: "Pandoc for MSF Reports"
  author:
    - author1@marinesciencefoundation.org


toc: true
template: eisvogel.latex
output-file: pdf/mypandoctest_YAML_title_author.pdf
number-sections: true

...


```
Run the following command. It will output another pdf.
```
pandoc --listing -d mypandoctestauthor.yml
```
[***output file***](pdf/mypandoctest_YAML_title_author.pdf)

### Multiple Files

Often our reports or documents need to be generated using multiple files from different locations. We are going to add three files to the current configuration. To show how to add new files.

```
---
input-files:
  - mypandoctest.md
  - alice.md
  - bob.md
  - sources/eve.md

variables:
  toc-own-page: true
  title: "Pandoc for MSF Reports"
  author:
    - author1@marinesciencefoundation.org


toc: true
template: eisvogel.latex
output-file: 'pdf/mypandoctest_YAML_title_author_multi_files.pdf'
number-sections: true

...


```
Run the following command. It will output another pdf.
```
pandoc --listing -d mypandoctestauthormultfiles.yml
```
[***output file***](pdf/mypandoctest_YAML_title_author_multi_files.pdf)

## Cover Page

Cover sheets are used for most reports at MSF. Here will walk through first building a stand-alone cover sheet, then we will add it to the previous document. Making a standalone coverpage requires a few files.
files required:
1. `blank.md` -- so pandoc knows to generate a pdf
1. `make_coversheet.yml` -- overall document information
1. `coversheet.yml` -- tells pandoc how to make the coverpage
1. `eisvogel.latex` -- latex template to make docs look nice
1. `pandoc-coverpage.yml` -- yaml file you will need to edit for content
1. `images/MSFlogo.png` -- pretty logo for the coverpage
1. `images/background.pdf` -- pretty background that give it the blue look

run
```
pandoc --listing -d coverpage_main.yml
```
[***output file***](pdf/coverpage.pdf)


## Full Report
Now that we have worked through a solid set of examples. Adding the core of the document to the coverpage is going to be pretty easy. We start with modifing `coverpage_main.yml`. Copy it an rename it `fullreport.yml`. We are going to make a few changes.


```
---

input-files:

  - coverpage.yml
  - mypandoctest.md
  - alice.md
  - bob.md
  - sources/eve.md

variables:

  lang: en
  titlepage: true
  title: "Pandoc for MSF Reports"
  subtitle: Marine Science Foundation

  author:
    - author1@marinesciencefoundation.org

  toc-own-page: true

toc: true
template: '../eisvogel.latex'
output-file: pdf/full_report.pdf
number-sections: true
...

```

1. remove `blank.md`
1. add the files in order we want them to the input_files: `mypandoctest.md`, `alice.md`, `bob.md`, and `sources/eve.md`
1. set `toc: true`
1. change `output-file: full_report.pdf`


run
```
pandoc --listing -d fullreport.yml
```
[***output file***](pdf/full_report.pdf)
