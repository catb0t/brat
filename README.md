# Brat

[![Build Status](https://travis-ci.org/presidentbeef/brat.svg?branch=master)](https://travis-ci.org/presidentbeef/brat)

[Try Brat online!](http://try.brat-lang.org/)

Brat is a simple little toy language that lets you do what you want. It is primarily object-oriented with first-class functions and very little syntax.

Brat is flexible enough that you can get by with a very small core and write any functionality that most languages use keywords for. For example, you can write and use a while loop like so:

    # Loops until the block returns false
    while = { block |
        true? block, { while ->block }
    }

    # Print 1 through 9
    n = 1
    while {
        p n
        n = n + 1
        n < 10
    }

If you would rather have your conditions be separated out, you could define it this way instead:

    # Loops until condition is false
    while = { condition, block |
        true? condition, { block; while ->condition, ->block }
    }

    n = 1
    while { n < 10 } { p n; n = n + 1 }

Brat compiles to Lua and runs on [LuaJit](http://luajit.org/).

# Features

* Dynamically typed
* Everything is object, except functions
* And functions are closures, which can be attached to objects to make methods
* Objects use a prototyping system and are completely open
* Built-in hash tables and dynamic arrays
* Very flexible unary and binary operators
* Tail calls are optimized to make infinite loops faster (and more infinite)

# Requirements

Please have on hand:

* Linux or OS X
* The usual development tools (like `make` and `gcc`)
* Git if you want to check it out of the repository directly - `sudo urpmi git-core` (or the equivalent for your platform)

# Installation

Please follow the following steps, in the order in which they are ordered. Otherwise, results are not guaranteed.

With Git:

   1. Clone the latest Brat version: `git clone git://github.com/presidentbeef/brat.git`
   2. Change to new directory: `cd brat`
   3. Run `sh ./build.sh`
   4. Optionally, run `sudo sh ./install.sh`. This will install in `/usr` by default. Append a directory to change this.


Without Git:

   1. Download the [latest](https://github.com/presidentbeef/brat/archive/master.zip)
   2. Decompress the archive (`unzip brat-master.zip`)
   3. Change to the new directory (`cd brat-master`)
   3. Run `sh ./build.sh`
   4. Optionally, run `sudo sh ./install.sh`. This will install in `/usr` by default. Append a directory to change this.

# Testing

Try out your newly discovered power thusly:

   1. Create a new file, perhaps called `test.brat`
   2. In that file, type something like: `p "OK COMPUTER"`
   3. Save and close it
   4. Return to the comfort of your command line
   5. Type `brat test.brat` (or `./brat test.brat` if you did not run the install script)
   6. Cross fingers
   7. Press enter
   8. Marvel or weep, as appropriate

# More Testing

Run `brat test/test.brat` to run the test suite. SWEET.

# More fun

Running Brat without specifying a file will launch interactive mode.

    $ ./brat
    # Interactive Brat
    brat:1> 1 + 1
    #=> 2

# Even more fun

Take a look at [some examples](http://brat-lang.org/examples.html) of Brat code.

# Problems

Sometimes there are problems. Everyone has issues. Report Brat issues [here](https://github.com/presidentbeef/brat/issues).

# License

The MIT License

Copyright (c) 2009-2019, Justin Collins

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
