#!/usr/bin/ruby -w
require 'pathname'
require './DataProcess'

$ParentPath =  File.expand_path("..",Dir.pwd)
$namePath = "/data/name/"
$phonePath ="/data/phone/"
$emailPath = "/data/email/"
$companyPath = "/data/company/"
$departmentPath = "/data/department/"
$positionPath = "/data/position/"
$File_Number = 10000

module FileIO
    
    def write(item)
        
        name = "#{item['name']}"
        phone = "#{item['phone']}"
        email = "#{item['email']}"
        company = "#{item['company']}"
        department = "#{item['department']}"
        position = "#{item['position']}"
        
        hashName = DataProcess.hash(name);
        hashPhone = DataProcess.hash(phone);
        hashEmail = DataProcess.hash(email);
        hashCompany = DataProcess.hash(company);
        hashDepartment = DataProcess.hash(department);
        hashPosition = DataProcess.hash(position);
        
        writeFile("#{ParentPath+namePath+hashName}",name,phone,email,company,department,position);
        writeFile("#{ParentPath+phonePath+hashPhone}",name,phone,email,company,department,position);
        writeFile("#{ParentPath+emailPath+hashEmail}",name,phone,email,company,department,position);
        writeFile("#{ParentPath+companyPath+hashCompany}",name,phone,email,company,department,position);
        writeFile("#{ParentPath+departmentPath+hashDepartment}",name,phone,email,company,department,position);
        writeFile("#{ParentPath+positionPath+hashPosition}",name,phone,email,company,department,position);
        
        end
    
    
    # def writeFile(filePath,name,phone,email,company,department,position)
    #     file = File.open("#{filePath}","a+")
    #     if file
    #         file.syswrite("#{name}!-!#{phone}!-!#{email}!-!#{company}!-!#{department!-!#{position}}\n")
    #         else
    #         puts "Unable to open file!"
    #     # end
    #     file.close()
    #
    #     end
end
