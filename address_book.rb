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
  
  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name search results for (#{search}):", results)    
  end
  
  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone search results for (#{search}):", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
        results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results for (#{search}):", results)
  end
  
  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

end


address_book = AddressBook.new

sim = Contact.new
sim.first_name = "simla"
sim.middle_name = "sophia"
sim.last_name = "yildirim"
sim.add_phone_number("Home","123-456-7890")
sim.add_phone_number("Werk","456-456-4567")
sim.add_address("home","street1","s2","sehi","ste","224234")

mis = Contact.new
mis.first_name = "almis"
mis.middle_name = "aihpos"
mis.last_name = "miridliy"
mis.add_phone_number("sdf","123-123-1234")
mis.add_address("work","sdf","dsfg","gtrtg","tg","34")


address_book.contacts.push(sim)
address_book.contacts.push(mis)

#address_book.print_contact_list
address_book.find_by_name("s")
address_book.find_by_phone_number("123")
address_book.find_by_address("tg")