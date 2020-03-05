module Review
  class Get
    def self.all
      JSON.parse(
        File.read(Rails.root.join("app/presenters/review/review.json"))
      )
    end
  end
end
