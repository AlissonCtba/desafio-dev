require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(password: 'password123', password_confirmation: 'password123')
    assert_not user.save, "O usuário foi salvo sem um email"
  end
  
  test "should not save user without password" do
    user = User.new(email: 'test@example.com')
    assert_not user.save, "O usuário foi salvo sem uma senha"
  end
  
  test "should not save user with mismatched password confirmation" do
    user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'wrongpassword')
    assert_not user.save, "O usuário foi salvo com senhas diferentes"
  end

  test "should save user with valid email and password" do
    user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    assert user.save, "Não foi possível salvar o usuário com atributos válidos"
  end

  test "should authenticate user with valid credentials" do
    user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    assert user.valid_password?('password123'), "O usuário deve ser capaz de autenticar com a senha correta"
  end

  test "should not authenticate user with invalid password" do
    user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    assert_not user.valid_password?('wrongpassword'), "O usuário não deve autenticar com senha incorreta"
  end
end
