Dependency Inversion Principle

The Dependency Inversion Principle has to do with high-level (think business logic) 
objects not depending on low-level (think database querying and IO) implementation details. 
This can be achieved with duck typing and the Dependency Inversion Principle. 
Often this pattern is used to achieve the Open/Closed Principle that we discussed above.
In fact, we can even reuse that same example as a demonstration of this principle.

## main.rb

As you can see, our high-level object, the file parser, does not depend directly on an implementation of a lower-level object, XML and CSV parsers. 
The only thing that is required for an object to be used by our high-level class is that it responds to the parse message. 
This decouples our high-level functionality from low-level implementation details and allows us to easily modify 
what those low-level implementation details are. 
Having to write a separate usage file parser per file type would require lots of unnecessary duplication.

