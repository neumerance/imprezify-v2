require 'rails_helper'

feature 'Work Experience Form', :js do
  it_behaves_like 'an entity', :work_experiences, 1, {
    name: 'Los Polluelos Lechon',
    title: 'Boy Pihit',
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
    email: 'hr@lospolueslos.com'
  }
end
