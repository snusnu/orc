# encoding: utf-8

require 'spec_helper'

describe Orc::Result do
  describe '.success' do
    subject { Orc::Result.success(object) }

    let(:object) { :object }

    it 'signals success' do
      expect(subject.success?).to be(true)
    end

    it 'returns :success status' do
      expect(subject.status).to be(:success)
    end

    it 'exposes the associated object' do
      expect(subject.object).to be(object)
    end
  end

  describe '.failure' do
    shared_context 'a failure result' do
      let(:status) { :confused }
      let(:object) { :context }

      it 'signals failure' do
        expect(subject.success?).to be(false)
      end

      it 'exposes the associated #object' do
        expect(subject.object).to be(object)
      end
    end

    context 'when no status is given' do
      subject { Orc::Result.failure(object) }

      include_context 'a failure result'

      it 'exposes a :failure status' do
        expect(subject.status).to be(:failure)
      end
    end

    context 'when status is given' do
      subject { Orc::Result.failure(object, status) }

      include_context 'a failure result'

      it 'exposes the given #status' do
        expect(subject.status).to be(status)
      end
    end
  end
end
