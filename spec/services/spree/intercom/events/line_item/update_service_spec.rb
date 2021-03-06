require 'spec_helper'

RSpec.describe Spree::Intercom::Events::LineItem::UpdateService, type: :service do

  Spree::Config.intercom_access_token = ''
  Spree::Config.intercom_application_id = ''

  let!(:line_item) { create(:line_item) }
  let!(:order) { line_item.order }
  let!(:user) { line_item.order.user }
  let!(:variant) { line_item.variant }

  let!(:options) {
    {
      line_item_id: line_item.id,
      order_number: order.number,
      sku: variant.sku,
      user_id: order.user_id
    }
  }

  let!(:event_data) {
    {
      event_name: 'changed-product-quantity',
      created_at: line_item.updated_at,
      user_id: user.intercom_user_id,
      metadata: {
        order_number: order.number,
        product: line_item.name,
        sku: variant.sku,
        quantity: line_item.quantity
      }
    }
  }

  let!(:event_service) { Spree::Intercom::Events::LineItem::UpdateService.new(options) }
  let!(:intercom) { Intercom::Client.new(token: Spree::Config.intercom_access_token) }

  it 'is expected to define EVENT_NAME' do
    expect(described_class::EVENT_NAME).to eq('changed-product-quantity')
  end

  describe '#initialize' do
    it 'is expected to set @user' do
      expect(event_service.instance_variable_get(:@user)).to eq(user)
    end

    it 'is expected to set @line_item' do
      expect(event_service.instance_variable_get(:@line_item)).to eq(line_item)
    end

    it 'is expected to set @order_number' do
      expect(event_service.instance_variable_get(:@order_number)).to eq(options[:order_number])
    end

    it 'is expected to set @sku' do
      expect(event_service.instance_variable_get(:@sku)).to eq(options[:sku])
    end
  end

  describe '#perform' do
    before do
      allow_any_instance_of(Intercom::Client).to receive_message_chain(:events, :create).with(event_data) { 'response' }
    end

    it 'is expected to create event on Interom' do
      expect(intercom.events.create(event_data)).to eq('response')
    end

    after do
      event_service.perform
    end
  end

  describe '#register' do
    before do
      allow(event_service).to receive(:send_request).and_return(true)
    end

    it 'is expected to call send_request' do
      expect(event_service).to receive(:send_request).and_return(true)
    end

    after { event_service.register }
  end

  describe '#event_data' do
    it 'is expected to return hash' do
      expect(event_service.event_data).to eq(event_data)
    end
  end

end
