require "./contact.rb"
class AddressBook
  
  attr_reader :contacts
  
  def initialize
    @contacts = []
  end
  
  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
  
end

address_book = AddressBook.new

sim = Contact.new
sim.first_name = "simla"
sim.middle_name = "sophia"
sim.last_name = "yildirim"
sim.add_phone_number("Home","123")
sim.add_phone_number("Werk","456")
sim.add_address("home","street1","s2","sehi","ste","224234")

mis = Contact.new
mis.first_name = "almis"
mis.middle_name = "aihpos"
mis.last_name = "miridliy"
mis.add_phone_number("sdf","234234")
mis.add_address("wprk","sdf","dsfg","gtrtg","tg","34")


address_book.contacts.push(sim)
address_book.contacts.push(mis)
address_book.print_contact_list