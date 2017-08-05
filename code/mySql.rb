$LOAD_PATH << '.'
require 'Index'
require 'TestPhone'
require 'FileIO'
require 'Select'


str=ARGV.join(' ')  
phone=Index.getPhoneFromUrl(str)
email=Index.getEmailFromUrl(str)
action=ARGV.first

item=Index.getItemFromUrl(str)

# if action=='count'&&!/^1/.match(phone)
# 	puts '错误，电话不合法'
# end

# if action=='select'&&phone!='nil'&&!TestPhone.testPhone(phone)
# 	puts '错误，电话不合法'
# end

# if email!='nil'&&!TestPhone.testEmail(email)
# 	puts '错误，邮箱不合法'
# end


if action=='select'
	time1=Time.now
	items=Select.select(item)
	time2=Time.now
	puts "#{items}"
	puts time2-time1
elsif action=='delete'
	time3=Time.now
	items=FileIO.delete(item)
	time4=Time.now
	puts time4-time3
elsif action=='insert'
	time5=Time.now
	FileIO.write(item)
	time6=Time.now
	puts time6-time5
elsif action=='update'
	time7=Time.now
	FileIO.modify(item)
	time8=Time.now
	puts time8-time7
elsif action=='count'
	puts 'count action'
else 
	puts '请输入正确指令'
end