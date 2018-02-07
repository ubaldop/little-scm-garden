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
- [ ] **Chapter 6**
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
