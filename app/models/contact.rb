class Contact < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :lead_type
  attr_accessor :govt_contract, :dod, :other
end
