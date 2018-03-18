class CardFetchingJob < ApplicationJob
  PRICE_PATH = 'http://yugiohprices.com/api/price_for_print_tag/'

  queue_as :default

  def perform(name)
    i = 1
    while true
      uri = URI("#{PRICE_PATH}#{name}-EN#{i.to_s.rjust(3, '0')}")
      json = JSON.parse(Net::HTTP.get(uri))
      break if json['status'] == 'fail'
      card_params = json['data']
      Card.create(
        name: card_params['name'],
        card_attribute: card_params['family'],
        number: card_params['price_data']['print_tag'],
        price: card_params['price_data']['price_data']['data']['prices']['average'],
        card_type: card_params['type']
      )
      i += 1
    end
  end
end
