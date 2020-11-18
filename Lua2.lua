function manageInventory()
    --[[ reading total Items N
   N = tonumber(io.read())]]
 
	table1={"Servo 3","Drone 6","Board 7"}
	io.write("Total item : ")
	print(#table1)
	for i=1,#table1 do
		print(table1[i])
	end
 	
	io.write("Enter the number of task to be performed : ")
	M = tonumber(io.read())
	table2={}
	if (M>0) and (M<101) then
		for i=1,M do
			table2[i] = io.read()
		end
		
		

		for i=1,#table2 do
			if string.match(table2[i],"%w+") == "ADD" then
				temp1=string.match(table2[i],"%S+",4)
				bool1=true
				for j=1,#table1 do
					if temp1 == string.match(table1[j],"%w+") then
						bool1=false
						table1[j]=table1[j]:gsub(string.match(table1[j],"%d+"),tonumber(string.match(table1[j],"%d+")) + tonumber(string.match(table2[i],"%d+")))
						print("UPDATED Item",temp1)
					end
				end
					if bool1==true then
					table.insert(table1,string.match(table2[i],"%S+",4).." "..string.match(table2[i],"%d+"))
					print("ADDED Item",temp1)
					end
				
			elseif string.match(table2[i],"%w+") == "DELETE" then
				temp2=string.match(table2[i],"%S+",7)
				bool2=true
				for j=1,#table1 do
					if temp2 == string.match(table1[j],"%w+") then
						bool2=false
						if tonumber(string.match(table1[j],"%d+")) > tonumber(string.match(table2[i],"%d+")) then
							table1[j]=table1[j]:gsub(string.match(table1[j],"%d+"),tonumber(string.match(table1[j],"%d+")) - tonumber(string.match(table2[i],"%d+")))
							print("DELETED Item",temp2)
						else
							print("Item",temp2,"could not be DELETED")
						end
						
					end
				end
				if bool2==true then
				print("Item",temp2,"does not exist")
				end
					
			else
				print("Invalid Entry or Format. Task format : ADD itemName 5(whole number) // DELETE itemName 2(whole number).")
			end
		end

	else
		io.write("Invalid Entry. Number of task should be more than 1 and not exceed 100.\n")
	end
	
--[[	for i=1,#table1 do
		print(table1[i])
	end
 ]]

	local sum = 0
 
	for i=1,#table1 do
		sum = sum + tonumber(string.match(table1[i],"%d+"))
	end 
 
	print("sum of all the items on the list :",sum)
	
	io.write("Do you want to view table y or n : ")
	temp5 = io.read()
	if temp5=="y" then
		for i=1,#table1 do
			print(table1[i])
		end
	elseif temp5=="n" then
	else
		print("Invalid Entry")
	end
end
 
io.write("Enter the number of testcases to be  performed : ")
tc = tonumber(io.read())
i = 0
if (tc>0) and (tc<26) then
	while i < tc do
    		manageInventory()
    		i = i + 1
	end
else
io.write("Invalid testcase. The testcase should be more than 1 and not exceed 25.\n")
end
