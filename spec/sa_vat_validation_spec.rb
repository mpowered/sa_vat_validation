require 'spec_helper'

describe SaVatValidation do
  it 'has a version number' do
    expect(SaVatValidation::VERSION).not_to be nil
  end

  context 'validates a South African VAT number' do
    it "should validate '4111111110' as true" do
      expect(SaVatValidation::valid?(4111111110)).to be_truthy
    end

    it "should validate '0000000000' as false" do
      expect(SaVatValidation::valid?(0000000000)).to be_falsy
    end

    it "should validate a non number 'kjabndfojb' as false" do
      expect(SaVatValidation::valid?("kjabndfojb")).to be_falsy
    end

  end
end
