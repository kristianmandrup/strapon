module <%= class_name.camelize %>::API
  class << self
    def accessible_attributes
      %w[
        fieldname_1
        fieldname_2
        fieldname_3
      ]
    end

    #example attributes
    def authorize_attributes
      %w[
        fieldname_1
        fieldname_2
        fieldname_3
      ]
    end
  end
end
