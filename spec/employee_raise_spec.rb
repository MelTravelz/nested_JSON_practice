require './lib/employee_raise'

describe EmployeeRaise do
  subject(:employee_raise) {described_class.new}

  describe '#give_raise' do
     it 'gives a 5% raise to employees making $70,000 or more and a 10% raise to employees making less than $70,000 and returns a hash with each employee name and new salary' do
      expected_hash = {
        "Shaun": 66000,
        "Paul": 35750,
        "Mel": 94500,
        "Jasmine": 84000
      }
      
      expect(employee_raise.give_raise).to eq(expected_hash)
    end
  end
end