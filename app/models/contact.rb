class Contact < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :lead_type
  attr_accessor :govt_contract, :dod, :other

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
