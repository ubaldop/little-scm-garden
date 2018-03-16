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
- [X] **Chapter 7**
- [X] **Chapter 8**
- [ ] **Chapter 9**
- [ ] **Chapter 10**

## Chapter 1

Do you know what is the actual name of the `'` operator? Is it named **quote**?  

---

#### Page 8

The authors say that writing `(cons s l)` with `s` and `l` both atoms, the interpreter should not provide a valid response. However, using the R5RS interpreter of **DrRacket**, if I write:

```scheme
> (cons 'a 'b)
```
I get the following answer:

```scheme
(a . b)
```
Instead by doing:

```scheme
> (cons 'a '(b))
```
I get:
```scheme
(a b)
```
So, are both `(a . b)` and `(a b)` the same? Is `(a . b)` a **pair**?

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
  
## Chapter 7

#### Page 111
I have a doubt about the usage of the primitive `eq?` function in **DrRacket**. This happens because I am trying to implement the `set?` function as defined at the start of this chapter (see page 111). This function requires to use `member?` function in order to check if the current list of atoms passed as input actually is a set.
`member?` function needs to use an equality check in order to assess if an atom passed as argument is member of the list of atom passed as argument too.
I perfomed this equality using `eq?`. Indeed, doing the following operation with DrRacked and **R5RS** as interpreter led to some errors:

```scheme
> (eq? 'a 'a)
#t
> ;;; here something strange happens ...
> (define list '('a 'b 'b 'c))
> (car (cdr list))
'b
> (car (cdr (cdr list)))
'b
> (eq? (car (cdr list)) (car (cdr (cdr list))))
#f
```

Actually, [looking at Stack Overflow]() it seems to me I have to use `eqv?` instead, that basically checks equality for the value itself. Indeed, `eq?` predicate is used to check whether its two parameters respresent the same object in memory, not if they are properly equal in the sense of the value.  

#### Page 113
In the first definition of `subset` is it again worth to note that the author uses the `cond` each time is assessing two or more predicates over a recursion step.

I mean, for example:

```scheme
 ...(cond 
        (null? set1) #t)
        (else (cond   ;;;I mean here, this could be slightly simplified
             ((member? (car set1) set2) ...)
             (else #f)))
```

generally I use to do this semplification upfront, while within the book it is performed in two different steps. Maybe it is better how the author does since the recursive step over a not empty list basically has two check two stuff (i.e.: in the above example 1 - if the current element of first set is member of second set too, 2 - else returns false).  

#### Page 114

Here the authors define `eqset?` through the assymetric relation of subsets. I mean, according to the following:

Given `≤` as a binary relation (in our case subset) over a set, then
if `a ≤ b` and `b ≤ a`, then `a = b` (antisymmetry: two distinct elements cannot be related in both directions).

See on [Wikipedia](https://en.wikipedia.org/wiki/Partially_ordered_set#Formal_definition)

#### Page 120-122

Here the authors define a concept of finite function and one to one function using a set containing pairs. Personally I did not grasp the complete meaning behind this introduction so far.

First of all, why we can represent a finite function as ''_a list of pairs in which no first element of any pair is the same as any other first element?_''  

Again, what is a _fullfun_? Why it is renamed to _one-to-one_ later?

As discussed with @marcosh and @geodoo, basically these functions definitions are the same of the mathematical ones. For example, the function that the authors here name as **one-to-one**, is the injective function where for each element of the domain must correspond only one element of the codomain.  

## Chapter 8

#### Page 133

In the last example of the page there's the definition of `rember` in the form of a curried lambda over `insert-g`. Here, the authors ask:

> What role does #f play?

According to me it is just a placeholder since the inner anonymous function would expect three arguments and here do we need just the third argument (i.e.: the cdr of `l`).  

#### Page 141
At which kind of function could the collector function be compared to? Is this something like a fold?  

#### Page 146
Is the approach defined in the collector example for `evens-only*&co` a way to represent stacked HOF?  

#### Final Note for Chapter 8

Sometimes while I am trying the examples using DrRacket I come across this error:

```scheme
 application: not a procedure;
 expected a procedure that can be applied to arguments
  given: XXX
  arguments...: [none]
```
That's basically sometimes I define function with too much parentheses. This for interpreter means the following:
it expects to evaluate what's wrapped in parentheses to a function. However when the evaluating expression does is not a procedure it is required to avoid these parentheses.

## Chapter 9

## Chapter 10
