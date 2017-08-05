$LOAD_PATH << '.'
require 'Index'
require 'TestPhone'
require 'FileIO'


str=ARGV.join(' ')  
phone=Index.getPhoneFromUrl(str)
email=Index.getEmailFromUrl(str)
action=ARGV.first

item=Index.getItemFromUrl(str)

if action=='count'&&!/^1/.match(phone)
	puts '错误，电话不合法'
end

if action=='select'&&phone!='nil'&&!TestPhone.testPhone(phone)
	puts '错误，电话不合法'
end

if email!='nil'&&!TestPhone.testEmail(email)
	puts '错误，邮箱不合法'
end

if action=='select'
	puts 'select action'
elsif action=='delete'
	puts 'delete action'
elsif action=='insert'
	FileIO.write(item)
	# puts item
elsif action=='update'
	puts 'update action'
elsif action=='count'
	puts 'count action'
else 
	puts '请输入正确指令'
end