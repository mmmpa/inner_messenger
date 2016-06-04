require 'rails_helper'

describe 'initialize' do
  context 'default' do
    let(:scope) { DummyInnerMessengerScope.new }
    it { expect { scope.klass }.to raise_error(InnerMessenger::ScopeAbstract::ImplementRequired) }
  end
end

class DummyInnerMessengerScope
  include InnerMessenger::ScopeAbstract
end