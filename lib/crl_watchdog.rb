require 'openssl'

class CrlWatchdog

  VERSION = '0.0.1'

  attr_reader :crl

  def initialize crl_file
    ensure_file_exists! crl_file
    @crl = OpenSSL::X509::CRL.new File.read(crl_file)
  end

  def next_update
    crl.next_update
  end

  private

  def ensure_file_exists! file
    raise ArgumentError.new("File not found: #{file}") unless File.exists?(file)
  end
end
