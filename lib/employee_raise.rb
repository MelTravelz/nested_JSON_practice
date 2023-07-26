require 'json'

class EmployeeRaise

  def give_raise
    #read, parse, sort data:
    data_hash = File.read("data/employee_information.json")
    parsed_data = JSON.parse(data_hash)
    emp_array = parsed_data["data"]["employees"]

    #make raise
    new_salary_hash = Hash.new
    emp_array.each do |emp|
      current_salary = emp["salary"].values.last

      if current_salary >= 70000
        perc_raise = 0.05
      else
        perc_raise = 0.1
      end

      new_salary = current_salary + (current_salary * perc_raise)
      new_salary_hash[emp["name"]] = new_salary
    end

    new_salary_hash
  end
end