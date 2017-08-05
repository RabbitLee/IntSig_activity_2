def testPhone(str)
	if (str=~/^1[3|4|5|7|8][0-9]{9}$/)
		puts true
	else
		puts false
	end
end

testPhone('13333333333')