require "bootstrap-error-styling/version"
require 'bootstrap-error-styling/view_helpers'
# TODO: refactor using Nokogiri parsing
#    html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
#    html_field.children.add_class 'error'
#    html_field.to_s

module BootstrapErrorStyling
  class BootstrapErrorStyling < Rails::Railtie
    initializer "bootstrap-error-styling.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end

    # assign the proc to adjust the form field error classes
    initializer "bootstrap-error-styling.apply_error_classes" do
      ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
        puts "BEGIN"
        puts html_tag.inspect
        puts instance_tag.to_s
#        puts instance_tag.inspect
        puts "END"
        if html_tag =~ /<(input|textarea|select|div)[^>]+class=/
          class_attribute = html_tag =~ /class=['"]/
          html_tag.insert(class_attribute + 7, "has-error ")
        elsif html_tag =~ /<label/
          first_whitespace = html_tag =~ /\s/
          html_tag[first_whitespace] = " class='has-error' "
          html_tag.insert html_tag.index('</'), " " + instance_tag.error_message.join(" and ")
        elsif html_tag =~ /<(input|textarea|select|label|)/
          first_whitespace = html_tag =~ /\s/
          html_tag[first_whitespace] = " class='has-error' "
        end
        html_tag
      end
    end
  end
end
