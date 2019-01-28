require 'csv'

class Gossip
	attr_accessor :author, :content
	def initialize (author, content)
		@author = author
		@content = content
	end
	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author, @content]
  	end
	end
	def self.all
  	all_gossips = []
  	  CSV.read("./db/gossip.csv").each do |csv_line|
    		all_gossips << Gossip.new(csv_line[0], csv_line[1]) #comprendre pourquoi on fait un Gossip.new
  		end
  	return all_gossips
	end
	def self.find(id)
		return Gossip.all[id-1]
	end
	def self.update(id, author, content)
		# now change the file
		rows_array = CSV.read("./db/gossip.csv")
		rows_array.each_with_index do |csv_line, i|
				if (i + 1)  == id.to_i
					csv_line[0] = author
					csv_line[1] = content
				end
  	end
		# now update the file
		CSV.open("./db/gossip.csv", 'wb') { |csv| rows_array.each{|row| csv << row}}
	end

	def self.comment(comment)
	end
end

