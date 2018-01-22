# Code Dojo

### <%= Tennis-Refacturing-Kata - Ruby %>

*Intermediate Bootcamp - week 1 - January 19th, 2018*

#### Assignment :

- Code smelling. Refactor the code of class TennisGame1 in tennis.rb.
- Code origin : https://github.com/emilybache/Tennis-Refactoring-Kata/tree/master/ruby



#### Pitfalls :

- Start looking at code without reading the assignment carefully.
- Communication, it's hard. What to talk about? Where to start? Who does what? How do I translate my thoughts into something intelligible to my co-workers.
- Keeping on coding without testing, trying to change everything in one go. At demo-time have nothing working.



#### Lessons learned :

- Read assignment carefully. We also looked at code to refactor in places we were not supposed to
- Make the code easy to read and understand :
  - Define many methods, which have 1 task each. Give them meaningfull names.
  - End name of methods that return booleans with '?'.  (A method that returns true or false is called a "predicate method".)
  - Magical Numbers : when using numerals in code, assign that value to a constant with a meaningfull name.
  - Avoid comments if you can. If your code needs many comments you're not naming methods, variables and constants well.
  - Follow Ruby / Rails Style Guide rules.
  - Be consistent in string quotation throughout your code. Double quotes allow interpolation, use these by default.
- Test over and over again. Test after each change to see if you broke the code.
  - Arno had something to run the test conintuously so if you break the code, you will see an error instantly (if that terminal is visible). What is it called and where can I find it?
  - Arno also had something called Guard for something. What is it for and where can I find it?


#### Stumbled upon :

**Github**

When trying to link local repository to remote, I got the message :

```shell
$ git remote add origin git@github.com:ZjanPreijde/CodeDojo-TennisScore.git
fatal: remote origin already exists.
```

Apparently I had already done something, that made this impossible. 

Solved it (in this particular case) by :

```shell
$ git remote set-url origin git@github.com:ZjanPreijde/CodeDojo-TennisScore.git
```



**Beautifier** (yes, it is opinionated) 

- removes `.freeze` from numerals 
  - found online : Symbols, fixnums, bignums, and floats are all frozen by default. Strings, however, aren’t.
  - So numerals don't need to be `.frozen?`.
  - `.freeze` ing strings optimizes for performance (http://flats.github.io/blog/2016/01/03/frozen-strings/)
- changes `= ["a", "b"]`  into `= %w[a b]`
  - Apparently Beautifier likes the `%w[]` declaration a lot.
- refactors `case-when` into `if-elsif`
  - Apparently Beautifier likes `else-if`'s more then `case-when`'s.

```
WINNING_DIFFERENCE = 2.freeze
FORTY              = 3.freeze
SCORE_TEXTS        = ["Love", "Fifteen", "Thirty", "Forty"].freeze
```

beautifies into

```
WINNING_DIFFERENCE = 2
FORTY              = 3
SCORE_TEXTS        = %w[Love Fifteen Thirty Forty].freeze
```

and

```
case
when winning_score?
  winner_desc
when deuce_score?
  deuce_desc
when advantage_score?
  advantage_desc
when equal_score?
  equal_desc
else
  non_equal_desc
end
```

beautifies into

```
if winning_score?
  winner_desc
elsif deuce_score?
  deuce_desc
elsif advantage_score?
  advantage_desc
elsif equal_score?
  equal_desc
else
  non_equal_desc
end
```



