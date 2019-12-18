module Imprezify
  class PDFGenerationFailed < StandardError
    attr_reader :thing
    def initialize(msg='Unable to generate', thing="pdf")
      @thing = thing
      super(msg)
    end
  end
end
