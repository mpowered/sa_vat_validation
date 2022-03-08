require 'spec_helper'

describe SaVatValidation do
  it 'has a version number' do
    expect(SaVatValidation::VERSION).not_to be nil
  end

  context 'validates a South African VAT number' do
    it "should validate '4111111110' as true" do
      expect(described_class).to be_valid(4111111110)
    end

    it "should validate '0000000000' as false" do
      expect(described_class).not_to be_valid(0000000000)
    end

    it "should validate a non number 'kjabndfojb' as false" do
      expect(described_class).not_to be_valid("kjabndfojb")
    end
  end

  context "monkey patching" do
    describe "String" do
      context "when valid" do
        subject { "4111111110" }

        it { is_expected.to be_valid_sa_vat_number }
      end

      context "when invalid" do
        subject { "0000000000" }

        it { is_expected.not_to be_valid_sa_vat_number }
      end
    end

    describe "Numeric" do
      context "when valid" do
        subject { 4111111110 }

        it { is_expected.to be_valid_sa_vat_number }
      end

      context "when invalid" do
        subject { 0000000000 }

        it { is_expected.not_to be_valid_sa_vat_number }
      end
    end
  end
end
