class Base
end

class Main
  include ActiveModel::Validations
  include ActiveSupport::JSON

  def initialize(args)
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end