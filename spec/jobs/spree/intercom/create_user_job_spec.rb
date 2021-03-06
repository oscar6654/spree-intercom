require 'spec_helper'

RSpec.describe Spree::Intercom::CreateUserJob, type: :job do
  include ActiveJob::TestHelper
  Spree::Config.intercom_access_token = ''
  Spree::Config.intercom_application_id = ''

  let!(:user) { create(:user) }
  let!(:user_service) { Spree::Intercom::CreateUserService.new(user.id) }

  subject(:job) { described_class.perform_later(user.id) }

  it 'is expected to queue the job' do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is expected to be in default queue' do
    expect(Spree::Intercom::CreateUserJob.new.queue_name).to eq('default')
  end

  describe 'perform' do
    before do
      allow(Spree::Intercom::CreateUserService).to receive(:new).with(user.id).and_return(user_service)
      allow(user_service).to receive(:create).and_return(true)
    end

    it 'is expected to execute perform' do
      expect(Spree::Intercom::CreateUserService).to receive(:new).with(user.id).and_return(user_service)
      perform_enqueued_jobs { job }
    end

    it 'is expected to call create' do
      expect(user_service).to receive(:create).and_return(true)
      perform_enqueued_jobs { job }
    end

    after do
      clear_enqueued_jobs
      clear_performed_jobs
    end
  end

end
