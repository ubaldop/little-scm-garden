Notes picked while reading
===

This file contains a list of notes/doubts I picked while reading this book.  
Generally I use to discuss them with my friends [@marcosh](https://github.com/marcosh) and [@geodoo](https://github.com/geodoo).

**Disclaimer**: reading is still in progress.

- [X] **Chapter 1**
- [X] **Chapter 2**
- [X] **Chapter 3**
- [X] **Chapter 4**
- [X] **Chapter 5**
- [X] **Chapter 6**
- [ ] **Chapter 7**
- [ ] **Chapter 8**
- [ ] **Chapter 9**
- [ ] **Chapter 10**

## Chapter 1

## Chapter 2

## Chapter 3

## Chapter 4

## Chapter 5

Page 84, The final version of **Fourth Commandment** reminds me of what we discussed together during previous meeting. See [here](https://gist.github.com/marcosh/208b669b0e1228f3e684835e3adc9ccd)  
  
Page 86, the function _member*_ exits from `or` condition as soon as `(eq? (car l) a)`, so it uses the first `or` short circuit/lazy evaluation returning true to avoid performing next recursive steps.  
  
[Answer](https://stackoverflow.com/questions/19353700/cond-and-and-or-in-scheme) to my doubt at page 89.  

Page 90, the `eqlist` function asks 9 questions because, given the two lists `l1` and `l2` as arguments it does:

- if `l1` is empty and `l2` is either empty, or an (atom | tail) or a (sublist | tail) 
- if `l1` is (atom | tail) and `l2` is either empty, or an (atom | tail) or a (sublist | tail) 
- if `l1` is (sublist | tail) and `l2` is either empty, or an (atom | tail) or a (sublist | tail) 

for a total of 9 questions!  

Page 95, when the authors say:

> Can all functions that use eq ? and = be generalized by replacing eq? and = by the function equal ?

we cannot generalize the `eqan?` function too because `equal?` itself is made using `eqan?`, so it cannot be replaced. See page 78 for a clarification of the same reason (where the authors suggest to replace every `eq?` occurrence with `eqan?`).  

## Chapter 6
About being aware of shadows I liked a lot the following reading, available [here](http://ckplusplus.com/?page=1):

> "The Eighth Commandment of The Little Schemer - use help functions to abstract from representations - is as obvious as most of the Ten  Commandments. Of course you would use other functions to support or create abstraction.
  To make the case more clearly, the authors attempt to represent primitive numbers with collections of empty lists ( e.g. (()) for one,  (()()) for two). This is a new level of parenthetical obnoxiousness, and for a while, the reader may think - “Are they going to do this f or the rest of the book?” - because the authors then go on to demonstrate that a lot of the API used thus far in the book, works for this type of representation. But, then there’s lat?
  Testing reveals that lat? doesn’t work as expected with such an abstraction. The chapter concludes with the two speakers exchanging:
  Is that bad?
  You must beware of shadows
  This isn’t a very common thing to read in an instructional programming book, hell, you’d be blown away to see this in a cookbook. 
  Searching around online, I couldn’t find too many people fleshing out a very thorough explanation other than a couple chat groups and most  users said “I guess they mean...but who cares?” or instead just complained about the book’s overall format. I know how I feel.
  The phrase is out of place even in The Little Schemer, considering most chapters end with a recommendation to eat sweets. Nonetheless, it   is a perfect for what the authors want the reader to consider.
  Going back to the Eighth Commandment above, it’s a considerable summation of coding cleaning activities programmers can read up on in   books such as Code Complete and Refactoring.  
  But why end the chapter like this and call the chapter "Shadows"?
  It’s obviously a parental-level warning in the family of “Keep your head up.” While a programmer can abstract a lot, the taller an  abstraction is built, the greater shadow it may be casting over operations that are still necessary or rarely necessary, which could even be more painful (read the first chapter of Release It!). The shadows cast by the edifice of your abstraction leads ultimately to bugs or worse a crack in the abstraction that can’t be patched.
  It’s more delicate and literary warning than was given by Joel Spolsky about frameworks. Spolsky, as usual, is more confrontational, and  aside from the possibility of him yelling at me about this topics, Schemers’ warning sticks better. It’s like a cautioning given by an old woman near a dark wood.
  However, these shadows are not cast by some creepy tree, but by our own code. It’s ultimately an admonishment to test, check your abstractions in places you wouldn’t necessarily use them and be just as thorough as the creators of the primary methods of your language.   And, of course, be afraid."
