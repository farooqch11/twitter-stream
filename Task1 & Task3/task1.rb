#Task 1
#please place configuration file in this directory to test

config = Hash.new
File.open("config") do |f|
  f.each_line do |line|
    # do something here
    line = line.gsub(/\s+/, "")

    if line[0] != '#'
      #puts line
      str=line.split('=', 2)
      #puts str
      str[1]= str[1].split('#',2)
      puts str[1][0]
      if str[1][0] == "on" || str[1][0] == "yes" || str[1][0] == "true"
        config[str[0]] = true
      elsif str[1][0] == "off" || str[1][0] == "false" || str[1][0] == "no"
        config[str[0]] = false
      elsif (num = Integer(str[1][0]) rescue Float(str[1][0]) rescue nil)
        config[str[0]] = num
      else
        config[str[0]] = str[1][0]
      end

    end
  end
end
puts config.inspect