algoruby
========

Algorithms in a Nutshell, Ruby Implementations
# Algoruby

Translating algorithms from:

"Algorithms in a Nutshell: A Desktop Reference"
George T. Heineman Gary Police & Stanley Selkow
O'reilly

into Ruby.  Just for fun and educational purposes.

## Installation

Add this line to your application's Gemfile:

    gem 'algoruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install algoruby

## Usage

== Sorts ==

  - Insertion Sort
  - Median Sort
  - Blum-Floyd-Pratt-Rivest-Tarjan ver (unfinished)

ary = [1, 2, 3, ..., n]

Algoruby::Sort::Insertion.sort(ary)

Algoruby::Sort::Median.sort(ary)
