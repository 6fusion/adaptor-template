# Don't modify this file
module Implementor
end

class Module
  def extends_host_with(class_methods)
    @_extension_module = class_methods

    def included(base)
      base.extend(const_get(@_extension_module)) unless @_extension_module.blank?
    end
  end
end