module BootstrapErrorStyling
  module ViewHelpers
    def flash_class(name)
      puts name
      case name
      when :notice
        return "has-error"
      when :error
        return ["has-error"]
      else
      return "has-error"
      end
    end
  end
end
