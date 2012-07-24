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

#### Sort Medley ####

  - Blum-Floyd-Pratt-Rivest-Tarjan ver (unfinished)
  - Bucket
  - Counting Sort
  - Heap Sort
  - Insertion Sort
  - Median Sort
  - Quicksort
  - Selection

#### How to choose? ####

<table>
<thead><td>Criteria</td><td>Algorithm</td></thead>
<tbody>
<tr><td>Only a few items</td><td>Insertion</td></tr>
<tr><td>Items are mostly sorted already</td><td>Insertion</td></tr>
<tr><td>Concerned about worst-case scenarios</td><td>Heap</td></tr>
<tr><td>Interested in a good average-case result</td><td>Quicksort</td></tr>
<tr><td>Items are drawn from a dense universe</td><td>Bucket</td></tr>
<tr><td>Desire to write as little code as possible</td><td>Insertion</td></tr>
</tbody>
</table>

#### Syntax ####

ary = [1, 2, 3, ..., _x_ ]

Algoruby::Sort::Bucket.sort(ary)

Algoruby::Sort::Counting.sort(ary)

Algoruby::Sort::Heap.sort(ary)

Algoruby::Sort::Insertion.sort(ary)

Algoruby::Sort::Median.sort(ary)

Algoruby::Sort::Quicksort.sort(ary)

Algoruby::Sort::Selection.sort(ary)
