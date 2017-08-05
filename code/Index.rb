module Index
	
	def Index.getNameFromUrl(argvString)
		if pattern=/\(name=(.*?)\)/.match(argvString)
			return pattern[1]
		else
			return 'nil'	
		end
	end

	def Index.getPhoneFromUrl(argvString)
		if pattern=/\(phone=(.*?)\)/.match(argvString)
			return pattern[1]
		else
			return 'nil'	
		end
	end

	def Index.getEmailFromUrl(argvString)
		if pattern=/\(email=(.*?)\)/.match(argvString)
			return pattern[1]
		else
			return 'nil'
		end
	end

	def Index.getCompanyFromUrl(argvString)
		if pattern=/\(company=(.*?)\)/.match(argvString)
			return pattern[1]	
		else
			return 'nil'
		end
	end

	def Index.getDepartmentFromUrl(argvString)
		if pattern=/\(department=(.*?)\)/.match(argvString)
			return pattern[1]	
		else
			return 'nil'
		end
	end

	def Index.getPositionFromUrl(argvString)
		if pattern=/\(position=(.*?)\)/.match(argvString)
			return pattern[1]
		else
			return 'nil'	
		end
	end

	def Index.getItemFromUrl(argvString)
		item=['name'=>getNameFromUrl(argvString),'phone'=>getPhoneFromUrl(argvString),'email'=>getEmailFromUrl(argvString),'company'=>getCompanyFromUrl(argvString),'department'=>getDepartmentFromUrl(argvString),'position'=>getPositionFromUrl(argvString)]
		return item
	end
end