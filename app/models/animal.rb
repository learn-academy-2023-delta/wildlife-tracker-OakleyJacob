class MyValidator < ActiveModel::Validator
    def validate(record)
      unless :common_name == :scientific_binomial
        record.errors.add :common_name, "Cannot be the same as the scientific name"
      end
    end
  end



class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, :scientific_binomial, presence: true, uniqueness: true
    
    validates_with MyValidator

end
