require 'rails_helper'

RSpec.describe Apartment do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'when it does not have a name' do
  	a = Apartment.new
  	a.validate?
  	it{ is_expected.to (a).not_to_be_valid}
  end
end
