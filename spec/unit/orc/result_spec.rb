# encoding: utf-8

require 'spec_helper'

describe Orc::Result do
  describe '.success' do
    shared_context 'a success result' do
      let(:status) { :alright }
      let(:object) { :context }

      it 'signals success' do
        expect(subject.success?).to be(true)
        expect(subject.failure?).to be(false)
      end

      it 'exposes the associated #object' do
        expect(subject.object).to be(object)
      end
    end

    context 'when no status is given' do
      subject { Orc::Result.success(object) }

      include_context 'a success result'

      it 'exposes a :success status' do
        expect(subject.status).to be(:success)
      end
    end

    context 'when status is given' do
      subject { Orc::Result.success(object, status) }

      include_context 'a success result'

      it 'exposes the given #status' do
        expect(subject.status).to be(status)
      end
    end
  end

  describe '.failure' do
    shared_context 'a failure result' do
      let(:status) { :confused }
      let(:object) { :context }

      it 'signals failure' do
        expect(subject.success?).to be(false)
        expect(subject.failure?).to be(true)
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

  describe '#update' do
    subject { result.update { |o| o + 1 } }

    let(:result) { Orc::Result.success(object, status) }
    let(:status) { :alright }
    let(:object) { 1 }

    it 'updates #object' do
      expect(subject.object).to be(2)
    end

    it 'does not change #status' do
      expect(subject.status).to be(status)
    end

    it 'does not change #class' do
      expect(subject.class).to equal(result.class)
    end
  end
end
