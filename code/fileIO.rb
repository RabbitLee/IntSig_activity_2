#!/usr/bin/ruby -w
require 'pathname'

$File_Number = 10000

module FileIO
    def self.hash(str)
        seed = 5381
        result = 0
        str.each_char() do |char|
            result = (result * seed + char.ord) % $File_Number
        end
        result
    end
    def self.write(item)#将Hash item写入文件

        #获取字段的文件路径
        parentPath =  File.expand_path("..",Dir.pwd)
        namePath = "/data/name/"
        phonePath ="/data/phone/"
        emailPath = "/data/email/"
        companyPath = "/data/company/"
        departmentPath = "/data/department/"
        positionPath = "/data/position/"


        #获取字段的值
        name = "#{item['name']}"
        phone = "#{item['phone']}"
        email = "#{item['email']}"
        company = "#{item['company']}"
        department = "#{item['department']}"
        position = "#{item['position']}"

        #获取字段hash
        hashName = hash(name);
        hashPhone = hash(phone);
        hashEmail = hash(email.downcase());
        hashCompany = hash(company);
        hashDepartment = hash(department);
        hashPosition = hash(position);

        #将数据分别插入到其中
        writeFile("#{parentPath+namePath+hashName.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+phonePath+hashPhone.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+emailPath+hashEmail.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+companyPath+hashCompany.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+departmentPath+hashDepartment.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+positionPath+hashPosition.to_s}",name,phone,email,company,department,position);
        
    end
    
    
    def self.writeFile(filePath,name,phone,email,company,department,position)#实现将数据插入
        file = File.open("#{filePath}","a+")
        if file
            file.syswrite("#{name}!-!#{phone}!-!#{email}!-!#{company}!-!#{department}!-!#{position}\n")#每个字段的值以 !-!分开
            else
            puts "Unable to open file!"
        end
        file.close()
    end


  def self.delete(name,phone,email,company,department,position)

      parentPath =  File.expand_path("..",Dir.pwd)
      namePath = "/data/name/"
      phonePath ="/data/phone/"
      emailPath = "/data/email/"
      companyPath = "/data/company/"
      departmentPath = "/data/department/"
      positionPath = "/data/position/"


      #获取字段hash
      hashName = hash(name);
      hashPhone = hash(phone);
      hashEmail = hash(email.downcase());
      hashCompany = hash(company);
      hashDepartment = hash(department);
      hashPosition = hash(position);


    nameFilePath = parentPath+namePath+hashName.to_s;
    phoneFilePath = parentPath+phonePath+hashPhone.to_s
    emailFilePath = parentPath+emailPath+hashEmail.to_s
    companyFilePath = parentPath+companyPath+hashCompany.to_s
    departmentFilePath = parentPath+departmentPath+hashDepartment.to_s
    positionFilePath = parentPath+positionPath+hashPosition.to_s







  end

  def self.deleteDataAndWrite(filePath,name,phone,email,company,department,position)
      arr = IO.readlines(filePath);
      size = arr.length
      i = 0;
      while i < size  do
          puts("在循环语句中 i = #$i" )
          $i +=1
      end



  end
end

if __FILE__ == $0
     item1 = Hash['name' => 'wangpeiyu', 'phone' => '15111929296',
                 'email' => '3285840393@qq.com', 'company' => 'IntSig',
                 'department' => 'Algorithm', 'position' => 'internship']

     item2 = Hash['name' => 'baidu', 'phone' => '18201987234',
                 'email' => '472979382@gmail.com', 'company' => 'IntSig',
                 'department' => 'Algorithm', 'position' => 'internship']

     item3 = Hash['name' => 'yahoo', 'phone' => '15901987108',
                 'email' => '08438543@gmail.com', 'company' => 'IntSig',
                 'department' => 'Algorithm', 'position' => 'internship']

     item4 = Hash['name' => 'alibaba', 'phone' => '15901987108',
                 'email' => 'fafagjag@gmail.com', 'company' => 'IntSig',
                 'department' => 'Algorithm', 'position' => 'internship']
    FileIO.write(item1)
    FileIO.write(item2)
    FileIO.write(item3)
    FileIO.write(item4)
end

