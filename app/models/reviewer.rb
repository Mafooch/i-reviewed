class Reviewer < ActiveRecord::Base
  has_secure_password
  # says this model now has password virtual attribute (not stored on the db) and expects
  # a password_digest on this model. so when you're creating a user
  # you assign their password to password: (the virtual attribute) not the digest
  # You don't want your pass stored as clear text in the database
  # which is why you use a digest, a one-way hash. Even stronger than
  # encryption since that can be decrypted
  # the system will take the typed in password, encrypt it, and see if
  # they match
  # has_secure_password also enables the authenticate password
  has_many :books
end
