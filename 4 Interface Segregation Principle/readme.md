Interface Segregation Principle


This principle is less relevant in dynamic languages.
Since duck typing languages don’t require that types be specified in our code this principle can’t be violated.

That doesn’t mean we shouldn’t take a look at a potential violation in case we’re working with another language.
The principle states that a client should not be forced to depend on methods that it does not use.

## main.rb

Let me show you by example how we can break this rule using Ruby. Let's say that we have FeeCalculator
We use this calculator in just one place of the app.

The other developer has request to add new controller. For that controller he needs to store a fee after the calculation.
So he knows that we already have code to calculate fee, all he needs to do is to add saving fee logic to calculate method.

But the problem is that ProductController#show also uses calculate method,
and we don't want to store fee for that case. I saw many times how developers did something like that:

They add new argument to calculate method, and pass true/false depending on the need they have.

Let's think why it's bad. First of all now we have to pass some weird boolean that changes behavior of method. 
I know that we could add default false value to method definition, but it wouldn't help us if we have additional params after save_result param.

> Clients should not be forced to depend upon interfaces that they don't use.

In our case we're not dealing with interfaces, but we depend on method signature. One of the clients, 
ProductController#show doesn't want to save fee at all, 
but it forced to pass false argument to keep using calculate that method.

To refactor this code we have couple options. 
First of all Interface Segregation says that we should create smaller interfaces.
I would suggest to do something like this

```ruby
class FeeCalculator
  def calculate(product, user, vat)
    # calculation
  end

  def calculate_and_save(product, user, vat)
    fee = calculate(product, user, vat)
    save(fee)
  end

  private

  def save(fee)
    # storing result into db
  end
end
```
I know that when you have "and" in method name it's a code smell itself,
but at least now we have client specific interfaces.

Depending on the situation, this refactoring could be possible as well:

```ruby
class FeeCalculator
  def calculate(product, user, vat)
    # calculation
  end

  def save(fee)
    # storing result into db
  end
end
```
In this case clients are responsible for storing fee if it's required:

```ruby

class OrderController
  def create
    fee = fee_calculator.calculate(product, user, vat)
    fee_calculator.save(fee)
  end

  private

  def fee_calculator
    FeeCalculator.new
  end
end
```