require 'rails_helper'

feature 'Certification and Achievement Form', :js do
  it_behaves_like 'an entity', :certification_and_achievements, 1, {
    name: 'Jonathan Kamote',
    title: 'Magbabaka',
    address: '#123 Di Makita St.',
    description: [
      'Bahay kubo kahit munti,',
      'Ang halaman doon,',
      'ay sari sari.'
    ],
    city: 'Prontera',
    country: 'Midgard',
    postal_code: '2200',
    logo: 'spec/fixtures/photo.jpeg',
    since: '2010-01-01',
    upuntil: '2010-06-06',
    phone: '+63 947 721 0530',
    email: 'hr@mangangaso.com'
  }
end
