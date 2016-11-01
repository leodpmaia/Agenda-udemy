namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do
    puts "Gerando os contatos (Contacts)... "
      100.times do |i|
        Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          kind: Kind.all.sample,
          rmk: LeroleroGenerator.sentence([1,2,3].sample)
          )
      end
    puts "Contatos gerados com sucesso!!!"
    
    puts "Gerando os endereços (Address)... "
      Contact.all.each do |contato|
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: contato
          )
      end
    puts "Endereços gerados com sucesso!!!"

    puts "Gerando os telefones (Phones)... "
      Contact.all.each do |contato|
        Random.rand(1..5).times do |i|
          Phone.create!(
            phone: Faker::PhoneNumber.phone_number,
            contact: contato
            )
          end
      end
    puts "Telefones gerados com sucesso!!!"    
    
  end

end
