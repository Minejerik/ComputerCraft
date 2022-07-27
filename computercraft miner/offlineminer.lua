print("Welcome to the minejerik offline miner installer!")
print("Would you like to continue? Y/N")
Input = read()
if Input == "y" then
print("Starting Installation!")
elseif Input == "n" then
print("Quitting")
os.reboot()
end
if fs.exists("startup") then
print("deleting old startup")
fs.delete("startup")
end
print("Starting download")
shell.run("wget https://raw.githubusercontent.com/Minejerikisme/computercraftstuff/main/startup.lua")
os.reboot()