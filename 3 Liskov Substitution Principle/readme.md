Liskov Substitution Principle


Liskov’s principle tends to be the most difficult to understand. 
The principle states that you should be able to replace any instances of a parent class 
with an instance of one of its children without creating any unexpected or incorrect behaviors.

## refactor_main.rb

For our Square class to make sense we need to modify both height and width 
when we call either set_height or set_width. 
This is the classic example of a Liskov violation.
The modification of the other instance method is an unexpected consequence.

## notes

Another common instance of a Liskov violation is raising an exception for an overridden method in a child class.
It’s also not uncommon to see methods overridden with modified method signatures 
causing branching on type in classes that depend on objects of the parent’s type.
All of these either lead to unstable code or unnecessary and ugly branching.