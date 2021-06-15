# Using `stmd` to generate `.html` files with embedded Stata analysis

Author:   Flo Martin   
Date:     03/12/20

Stata markdown utilises the standard markup language that provides text formatting from plain text with the statistical analysis capabilities of Stata, generating an accessible `.html` file containing text, graphs and analysis. It requires the package `stmd` and a document converter,  `pandoc`.

#### Installing `pandoc`
This program must be installed separately from the web. Follow the link: https://pandoc.org/installing.html and use the installer for your system to download it.

#### Installing `stmd`
In Stata, we need the package called `stmd` (Doug Hemken, University of Wisconsin). Use the command `ssc install stmd` in the Stata command window to install.

#### Using `pandoc`
In order for Stata to recognise that you have `pandoc` installed we need to tell it where it is. First, install the `whereis` package using the command `ssc install whereis` then tell Stata where `pandoc` is located:

```
whereis pandoc /usr/local/bin/pandoc
```

The above command is the location of `pandoc` on a Mac - Windows users may need `"c:\program files (x86)\pandoc\pandoc.exe"` (if spaces in the pathname enclose in speech marks). If these don't work on your machine, typing `help whereis` will show the Unix commands to find `pandoc`'s location.

#### The `.stmd` file
To create a file that the package `stmd` can read, you can write a do-file then change it's file extension to `.stmd`. I don't think this is the proper way to make one of these files because it keeps it's `.do` file extension in secret, but that's ok because it means you can still open it in Stata (I can't open pure `.stmd` files on my computer which isn't good for making edits so I don't really mind this way). 

In this do-file, instead of writing as you normally would, you want to write plain text where you would like text on the `.html` file and then enclose Stata code in 'chunks' (as you would in R markdown). These chunks are defined as such:

````
  ```{s}
    - Stata command - 
  ```
````

The first chunk should define your working directory and dataset that the future chunks will be drawing from to generate tables, graphs etc. If you want the code to be hidden in the `.html` file, you can use `echo=FALSE` and if you don't want to see the results (for example, if you don't want your working directory to be printed at the top of the document when you assign it) use `results=FALSE` in the `{s}` part. So, putting that together, the first chunk in your `.stmd` file would look like this:

````
  ```{s, echo=FALSE, results=FALSE}
    cd "/path/to/your/working/directory"
    use dataset.dta
  ```
````

This will perform these lines of code behind the scenes and not print anything on the output document. Subsequent chunks that are providing information on data analysis may look like this:

````
  ```{s, echo=FALSE}
    summarize
    tab variable1 variable2, col chi
  ```
````

Now, the code will run and be hidden on the document (because of `echo=FALSE`) but the output will be shown as you would see it in Stata (`results` no longer specified, defaults to `TRUE`).

#### Customising the document
HTML code can be used in the `.stmd` file to customise it to suit your needs. Standard markdown commands for bold and italic don't seem to work so I have been using a line of HTML code to define text font, size and style. It looks like this:

```
<p style="font-family: verdana, sans-serif; font-size:18pt; font-weight:bold"> Customised text </p>
```

<div align="center">

:pencil2: **Customised text** 

</div>

The file does recognise `#` and `##` etc. to denote headings, however it hyperlinks them all (makes them blue) to their respecive sections which I didn't like so I just denoted headings using the HTML code specifying different size, bold etc. 

Also, the document defaults to text aligning left; if you want a figure or text element to be aligned in the center for example, you can enclose the bit you want realigned like this:

```
<div align="center">

Newly aligned text

</div>
```

<div align="center">

:pencil2: **Newly aligned text**

</div>

Any text not enclosed like this will default back to left alignment.

#### Generating the `.html` document
Once you have written the do-file, saved it and changed it's extension to `.stmd` you are ready to generate your `.html` file! Make sure your working directory is now set in Stata to where the `.stmd.do` file is located then type:

```
stmd example.stmd.do
```

Like I said above, when you change the extension manually, it keeps the `.do` there backstage so if you try and run `stmd example.stmd` as it looks in your Finder then Stata will say the file doesn't exist. Once you have set it running it will go through the code chunks in the Results window and generate individual picture files of any graphs you have asked for. These will all go into you working directory and are required to see the full `.html` file. The last file to be generated will be your `.html` file, which you can open in you browser and admire your handy work!

This is a great feature if you have lots of graphs to show in one go, whilst keeping the source code intact and linked to the graphs, reducing the chance of not being able to find what code links to what graph. Also it makes making changes to graphs super easy and eliminates the long process of deleting loads of images when something changes and the having to re-save them all individually.

:confetti_ball: Yay for markdown! :confetti_ball:
