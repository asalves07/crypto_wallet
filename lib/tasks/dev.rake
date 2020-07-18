namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") {%x(rails db:drop)}
      show_spinner("Criando BD...") {%x(rails db:create)}
      show_spinner("Migrando BD...") {%x(rails db:migrate)}
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("cadastrando moedas...") do
      coins=[
            {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "https://banner2.cleanpng.com/20180729/plb/kisspng-bitcoin-cash-cryptocurrency-bitcoin-unlimited-logo-bitcoin-white-5b5e786fc44317.2481451315329178718039.jpg",
              mining_type: MiningType.find_by(acronym: 'PoW')
            },
            {
              description: "Ethereum",
              acronym: "ETH",
              url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
              mining_type: MiningType.all.sample
            },
            {
              description: "Dash",
              acronym: "DSH",
              url_image: "https://cdn4.iconfinder.com/data/icons/cryptocoins/227/DASH-512.png",
              mining_type: MiningType.all.sample
            },
            {
              description: "Iota",
              acronym: "IOT",
              url_image: "data:image/jpeg;base64,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",
              mining_type: MiningType.all.sample
            },
            {
              description: "ZCash",
              acronym: "ZEC",
              url_image: "https://img2.gratispng.com/20180628/ohj/kisspng-zcash-cryptocurrency-bitcoin-market-capitalization-btc-digital-llc-5b34e3913bff74.5774957615301927852458.jpg",
              mining_type: MiningType.all.sample
            }
        ]
      
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastro os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("cadastrando os tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  
private
  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(Concluido!)")
  end

end
