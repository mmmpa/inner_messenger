require 'rails_helper'

describe 'initialize' do
  context 'default' do
    let(:config) { InnerMessenger::Engine.configuration }
    it { expect(config.klass).to eq(User) }
    it { expect(config.sendable).to eq(User.all) }
    it { expect(config.identifier(config.sendable.first)).to eq(1) }
  end
end
