require 'json'

class EmployeeRaiseIncrementor
  attr_reader :parsed_data

  def initialize
    data_hash = File.read("data/employee_information.json")
    @parsed_data = JSON.parse(data_hash)
  end

  #OPTION 1:
  #every Ruby class has a default method 'call' it's live invoke
  #SRP: this class should only do ONE thing:
  def call
    # start_time = Time.now
    new_salary_hash = Hash.new

    employee_data.each do |emp|
      current_salary = emp["salary"].values.last
      perc_raise = find_perc_raise(current_salary)

      new_salary = current_salary + (current_salary * perc_raise)
      new_salary_hash[emp["name"]] = new_salary
    end

    new_salary_hash
    # end_time = Time.now - start_time 
    #=>.each is the fastest of all!: 0.000428, 0.000442, 0.000423
  end

  ##OPTION 2: SLOWER
  # def give_raise
  #   # start_time = Time.now
  #   emp_array = read_parse_sort_data

  #   new_hash = emp_array.reduce({}) do |new_salary_hash, emp|
  #     current_salary = emp["salary"].values.last
  #     perc_raise = find_perc_raise(current_salary)
      
  #     new_salary = current_salary + (current_salary * perc_raise)
  #     new_salary_hash[emp["name"]] = new_salary.round

  #     new_salary_hash
  #   end
  #   new_hash
  #   # end_time = Time.now - start_time 
  #   #=>.each_with_object is the slowest!:  0.000449,  0.00059, 0.000467
  #   #=>.reduce is slightly faster!: 0.000432, 0.00057, 0.000439
  # end

  private

  def employee_data
    parsed_data["data"]["employees"]
  end

  def find_perc_raise(current_salary)
    if current_salary >= 70000
      0.05
    else
      0.1
    end
  end
end