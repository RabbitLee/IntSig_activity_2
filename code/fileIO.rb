#!/usr/bin/ruby -w
require 'pathname'
require './dataProcess'



module FileIO
    
    def self.write(item)

        parentPath =  File.expand_path("..",Dir.pwd)
        namePath = "/data/name/"
        phonePath ="/data/phone/"
        emailPath = "/data/email/"
        companyPath = "/data/company/"
        departmentPath = "/data/department/"
        positionPath = "/data/position/"
        name = "#{item['name']}"
        phone = "#{item['phone']}"
        email = "#{item['email']}"
        company = "#{item['company']}"
        department = "#{item['department']}"
        position = "#{item['position']}"
        
        hashName = DataProcess.hash(name);
        hashPhone = DataProcess.hash(phone);
        hashEmail = DataProcess.hash(email.downcase());
        hashCompany = DataProcess.hash(company);
        hashDepartment = DataProcess.hash(department);
        hashPosition = DataProcess.hash(position);
        
        writeFile("#{parentPath+namePath+hashName}",name,phone,email,company,department,position);
        writeFile("#{parentPath+phonePath+hashPhone}",name,phone,email,company,department,position);
        writeFile("#{parentPath+emailPath+hashEmail}",name,phone,email,company,department,position);
        writeFile("#{parentPath+companyPath+hashCompany}",name,phone,email,company,department,position);
        writeFile("#{parentPath+departmentPath+hashDepartment}",name,phone,email,company,department,position);
        writeFile("#{parentPath+positionPath+hashPosition}",name,phone,email,company,department,position);
        
    end
    
    
    def self.writeFile(filePath,name,phone,email,company,department,position)
        file = File.open("#{filePath}","a+")
        if file
            file.syswrite("#{name}!-!#{phone}!-!#{email}!-!#{company}!-!#{department}!-!#{position}}\n")
            else
            puts "Unable to open file!"
        end
        file.close()
    end

end

if __FILE__ == $0
     item = Hash['name' => 'liyichao', 'phone' => '18201987108',
                 'email' => 'yclissetj@gmail.com', 'company' => 'IntSig',
                 'department' => 'Algorithm', 'position' => 'internship']

     FileIO.write(item)
end

