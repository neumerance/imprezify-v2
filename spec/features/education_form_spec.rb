require 'rails_helper'

feature 'Education Form', :js do
  it_behaves_like 'an entity', :educations, 1, {
    name: 'University of Magbobote',
    title: 'BS in Vulcanizing',
    address: '#123 Di Makita St.',
    description: [
      'Bahay kubo kahit munti,',
      'Ang halaman doon,',
      'ay sari sari.'
    ],
    city: 'Olongapo',
    country: 'Philiipines',
    postal_code: '2200',
    logo: 'spec/fixtures/photo.jpeg',
    since: '2010-01-01',
    upuntil: '2010-06-06',
    phone: '+63 947 721 0530',
    email: 'admin@uom.com'
  }
end
