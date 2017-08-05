# require 'FileIO'
require './testPhone'

$Initial_Data_Path = '../data/card_person_new.data'

module DataProcess
  def self.is_item_valid(item) # 根据电话、邮箱判断是否合法
    return testPhone(item['phone']) && testEmail(item['email'])
  end

  def self.hash(str)
    return str.hash % $File_Number
  end

  def self.LoadInitialData(data_path)
    File.open(data_path, 'r') do |file|
      
    end
    return true
  end

end

if __FILE__ == $0
  # item = Hash['name' => 'liyichao', 'phone' => '18201987108',
  #             'email' => 'yclissetj@gmail.com', 'company' => 'IntSig',
  #             'department' => 'Algorithm', 'position' => 'internship']
  # puts(DataProcess.is_item_valid(item))

  puts DataProcess.LoadInitialData($Initial_Data_Path)
end