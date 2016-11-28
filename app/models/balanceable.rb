module Balanceable

  def credit! amount
    self.balance += amount
    self.save
  end

  def debit! amount
    self.balance -= amount
    self.save
  end

  def set_balance amount
    self.balance = amount
  end

  def set_balance! amount
    self.set_balance amount
    self.save
  end

end
