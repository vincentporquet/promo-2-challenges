# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  attr_reader :iban
  attr_accessor :position, :name
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)

  MIN_DEPOSIT =  100

  def initialize(name, iban, initial_deposit, password)

    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
    puts "Owner: #{@name}\n IBAN: #{@iban}\n Current amount: #{@position} euros"
  end

  def withdraw(amount)
    @position -= amount
    "You've just withdraw #{amount} euros"

    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
  end

  def deposit(amount)
    @position += amount
    "You've just deposit #{amount} euros, #{@name} / Current amount: #{@position}"
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
  end

  def transactions_history(args = {})
      if args[:password] == @password
        "#{@transactions}"
      else
        "wrong password"
      end
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
  end

  def iban
    @iban.sub([5..14], '*')
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
  end

  def to_s
    @name.to_s
    @iban.to_s
    "Current amount: #{@position} euros"
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: Displays the account owner, the hidden iban and the position of the account
  end

  private

  def add_transaction(amount)
    @transactions << amount
    @position += amount
    # TODO: add the amount in the transactions array
    # TODO: update the current position (which represents the balance of the account)
  end

end
