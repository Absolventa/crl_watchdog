require 'spec_helper'

describe CrlWatchdog do
  let(:crl_file) { File.expand_path("../support/crl.pem", __FILE__) }

  subject { described_class.new crl_file }

  context 'with file input' do
    it 'requires an existing file' do
      expect do
        described_class.new '/does/not/exist.pem'
      end.to raise_error ArgumentError
    end

    it 'requires a valid certificate revokation list' do
      expect do
        described_class.new __FILE__
      end.to raise_error OpenSSL::X509::CRLError
    end

    it 'does not complain about a valid crl file' do
      expect do
        described_class.new crl_file
      end.not_to raise_error
    end

    it 'assigns OpenSSL::X509::CRL object to #crl' do
      expect(subject.crl).to be_instance_of OpenSSL::X509::CRL
    end
  end

  describe '#next_update' do
    it 'forwards to crl instance' do
      expect(subject.next_update).to be_instance_of Time
    end
  end

end
