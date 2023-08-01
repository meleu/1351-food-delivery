class Employee
  attr_reader :username, :password, :role
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role] # manager or driver
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end
