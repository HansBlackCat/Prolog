#  Definite Clause Grammars
  
  
Goals
  
1. introduce `Context Free Grammars`
  
2. introduce `Definite Clause Grammars`
  
##  Context free grammars
  
  
finite collection of rules which tell us that certain sentences are grammatical.
  
|non-terminal symbols|->|symbols|
|:-:|:-:|:-:|
s|->|np vp
np|->|det n
vp|->|v
det|->|_a_
det|->|_the_
n|->|_woman_
n|->|_man_
v|->|_shoots_
  
>s, np, vp, det, n, v
  
These are called non-terminal symbols.
  
```flow
st=>start: Start:>http://www.google.com[blank]
e=>end:>http://www.google.com
op1=>operation: My Operation
sub1=>subroutine: My Subroutine
cond=>condition: Yes
or No?:>http://www.google.com
io=>inputoutput: catch something...
para=>parallel: parallel tasks
  
st->op1->cond
cond(yes)->io->e
cond(no)->para
para(path1, bottom)->sub1(right)->op1
para(path2, top)->op1
```
  