# encoding: utf-8

require 'spec_helper'

describe Orc::Result do
  describe '.success' do
    subject { Orc::Result.success(object) }

    let(:object) { :object }

    it 'signals success' do
      expect(subject.success?).to be(true)
    end

    it 'returns :success state' do
      expect(subject.status).to be(:success)
    end

    it 'exposes the associated object' do
      expect(subject.object).to be(object)
    end
  end

  describe '.failure' do
    subject { Orc::Result.failure(status, context) }

    let(:status)  { :confused }
    let(:context) { :context }

    it 'signals failure' do
      expect(subject.success?).to be(false)
    end

    it 'returns :success state' do
      expect(subject.status).to be(status)
    end

    it 'exposes the associated context' do
      expect(subject.context).to be(context)
    end
  end
end
