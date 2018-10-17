require('validator')
require('validators/presence')

class Base
  class << self
    @@validators = []

    def validates(*attributes)
      validators = extract_option!(attributes)
      validators.each do |validator, option|
        attributes.each do |attr_key|
          key = "#{validator.to_s}Validator"
          # const_get获得validate子类的class名称
          @@validators << Object.const_get(key).new(attr_key, option)
        end
      end
    end

    def extract_option!(attributes)
      if attributes.last.is_a?(Hash)
        attributes.pop
      else
        {}
      end
    end

    def validators
      @@validators
    end
  end

  def valid?
    self.class.validators.each do |validator|
      return false unless validator.valid?(self)
    end
    true
  end

  #def presence?(value)
  #  value.respond_to?(:empty?) ? !value.empty? : !!value
  #end
end

#class Post < Base
#  attr_accessor :title

#  validates :title

#  def initialize(title)
#    @title = title
#  end
#end
