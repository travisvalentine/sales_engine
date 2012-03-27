require 'spec_helper'

describe SalesEngine::Invoice do
  param = {:id => 1, :customer_id => 1, 
           :merchant_id => 92, :status => "shipped", 
           :created_at => "2012-02-14 20:56:56 UTC", 
           :updated_at => "2012-02-26 20:56:56 UTC"}
  let(:invoice) {SalesEngine::Invoice.new(param)}
  #let(:invoice) { Fabricate(:invoice) }
  describe 'initialize' do
    context "when instantiating a new invoice" do
      it 'receives a hash as a param' do
        param.should be_a(Hash)
      end
      [:id, :customer_id, :merchant_id, :status, :created_at, :updated_at].each do |method|
        it "sets the invoice's attribute #{method} with the method #{method}" do
          invoice.send(method).should_not be_nil
        end
      end
    end
  end

  let(:collection) {SalesEngine::Database.instance.invoices}
  describe '.collection' do
    it 'creates an array' do
      collection.should be_a(Array)
    end
    it 'contains instances of the invoice class' do
      collection.first.class.should == invoice.class
    end
    it 'is not nil' do
      collection.should_not be_nil
    end
  end

  describe '.transactions' do
    pending
  end
  describe '.invoice_items' do
    pending
  end
  describe '.items' do
    pending
  end
  describe '.customer' do
    pending
  end


end