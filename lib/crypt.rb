module Crypt
  class << self
    def encrypt(value)
      crypt(:encrypt, value)
    end

    def decrypt(value)
      crypt(:decrypt, value)
    end

    def encryption_key
      'a2d572e006b883451a51bdd9c502fc944aea7a2c13ec1b1d92ec126a3c848125'
    end

    ALGO = 'aes-256-cbc'.freeze
    def crypt(cipher_method, value)
      cipher = OpenSSL::Cipher.new(ALGO)
      cipher.send(cipher_method)
      cipher.pkcs5_keyivgen(encryption_key)
      result = cipher.update(value)
      result << cipher.final
    end
  end
end