require 'rails_helper'

describe ResumeTemplatingEngine::Manifest do
  let(:expectation) do
    {
      "shades_of_black" => {
        "name" => "Shades of Black",
        "description" => "Basic and simple professional looking resume template suitable on any job titles.",
        "author" => "Jonathan Canaveral", "category" => "simple",
        "thumbnail" => "https://picsum.photos/300/421",
        "preview" => "https://picsum.photos/595/842"
      },
      "clean_and_green" => {
        "name" => "Clean and green",
        "description" => "An executive resume sample with a contemporary approach and eye-catching design that will make sure your application will be spotted first.",
        "author" => "Jonathan Canaveral",
        "category" => "simple",
        "thumbnail" => "https://picsum.photos/300/421",
        "preview" => "https://picsum.photos/595/842"
      },
      "simply_creative" => {
        "name" => "Simply Creative",
        "description" => "Land your dream job in the creative industries by using this creative resume template which will make your application stand out.",
        "author" => "Jonathan Canaveral",
        "category" => "simple",
        "thumbnail" => "https://picsum.photos/300/421",
        "preview" => "https://picsum.photos/595/842"
      }
    }
  end

  subject do
    described_class.new.get
  end

  it 'returns list of templates' do
    expect(subject).to eq expectation
  end
end
