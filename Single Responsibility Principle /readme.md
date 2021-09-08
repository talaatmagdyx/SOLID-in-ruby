Single Responsibility Principle

The Single Responsibility Principle is the most abstract of the bunch. It helps keep classes and methods small and maintainable. In addition to keeping classes small and focused it also makes them easier to understand.

## main.rb

In the above class we have a single command interface that processes commission payments for deals. At first glance the class seems simple enough, 
but let’s look at reasons we might want to change this class. 
Any change in how we calculate commissions would require a change to this class. 
We could introduce new commission rules or strategies that would cause our calculate_commission method to change. 
For instance, we might want to vary the percentage based on deal amount. 
Any change in the steps required to mark a deal as processed in the mark_deal_processed method would result in a change in the file as well.
An example of this might be adding support for sending an email summary of a specific person’s commissions after marking a deal processed. 
The fact that we can identify multiple reasons to change signals a violation of the Single Responsibility Principle.

