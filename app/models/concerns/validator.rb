class Validator
  attr_accessor :attr_name, :option

  def initialize(attr_name, option)
    @attr_name = attr_name
    @option = option
  end

  def valid?(obj)
    raise NotImplementError, 'You should override this method in subclass'
  end
end
