require '../code/fileIO'
require '../code/testPhone'

$Initial_Data_Path = '../data/card_person_new.data'
module DataProcess
  def self.is_item_valid(item) # 根据电话、邮箱判断是否合法
    TestPhone.testPhone(item['phone']) && TestPhone.testEmail(item['email'])
    # true
  end

  def self.LoadInitialData(data_path)
    puts('Load')
    File.open(data_path, 'r') do |file|
      start = Time.now
      i = 0
      file.each_line do |line|de
        i += 1
        if i % 1000 == 0
          puts(i)
          puts(Time.now - start)
          puts
        end
        info_list = line.split("\t")
        item = Hash['name' => info_list[0], 'phone' => info_list[1],
                    'email' => info_list[2], 'company' => info_list[3],
                    'department' => info_list[4], 'position' => info_list[5]]
        if is_item_valid(item)
          FileIO.write(item)
        end
      end
    end
  end

end

if __FILE__ == $0
  # puts 1
  # item = Hash['name' => 'liyichao', 'phone' => '15962020046',
  #             'email' => 'ba-satou@1reast.co.jp', 'company' => 'IntSig',
  #             'department' => 'Algorithm', 'position' => 'internship']
  # puts(DataProcess.is_item_valid(item))

  # puts DataProcess.hash('王大伟 公司')
  DataProcess.LoadInitialData($Initial_Data_Path)
  # str = "ha\tha1\tha2"
  # puts str
  # a = str.split(' ')
  # for i in a
  #   puts i
  # end
end
