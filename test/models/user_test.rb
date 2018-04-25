require 'test_helper'

class UserTest < ActiveSupport::TestCase

  subject { users(:confirmed) }
  let(:klass) { ::User }

  test 'translations' do
    #Fields
    fields = [
        :password,
        :password_confirmation,
        :reset_password_token,
        :reset_password_sent_at,
        :sign_in_count,
        :current_sign_in_at,
        :last_sign_in_at,
        :current_sign_in_ip,
        :last_sign_in_ip,
        :confirmation_token,
        :confirmed_at,
        :confirmation_sent_at,
        :unconfirmed_email,
        :email,
        :tokens,
        :active
    ]

    fields.each do |field|
      assert_equal klass.human_attribute_name(field), I18n.t("activerecord.attributes.user.#{field.to_s}")
    end

    # assert_equal klass.human_attribute_name("created_at"), I18n.t('attributes.created_at')
    # assert_equal klass.human_attribute_name("updated_at"), I18n.t('attributes.updated_at')
    # assert_equal klass.human_attribute_name("deleted_at"), I18n.t('attributes.deleted_at')

    #Model name
    assert_equal klass.model_name.human, I18n.t('activerecord.models.user.one')
    assert_equal klass.model_name.human(:count => 2), I18n.t('activerecord.models.user.other')
  end

  test 'indexes' do
    indexes_with_where = ActiveRecord::Base.connection.indexes(klass.table_name).map { |index| { columns: index.columns, unique: index.unique, where: index.where}    }
    assert_includes indexes_with_where, {:columns=>["uid", "provider"], :unique=>true, :where=>"(deleted_at IS NULL)"}

    assert_equal ActiveRecord::Base.connection.index_exists?(klass.table_name.to_sym, :email), true
    assert_equal ActiveRecord::Base.connection.index_exists?(klass.table_name.to_sym, :active), true
    assert_equal ActiveRecord::Base.connection.index_exists?(klass.table_name.to_sym, :reset_password_token, unique: true), true
    assert_equal ActiveRecord::Base.connection.index_exists?(klass.table_name.to_sym, :confirmation_token, unique: true), true
  end

  test 'soft delete' do
    assert_respond_to klass, :with_deleted
    assert_equal ActiveRecord::Base.connection.index_exists?(klass.table_name.to_sym, :deleted_at), true
  end

  test 'fields' do
    assert_respond_to subject, :provider
    assert_respond_to subject, :uid
    assert_respond_to subject, :password
    assert_respond_to subject, :password_confirmation
    assert_respond_to subject, :encrypted_password
    assert_respond_to subject, :reset_password_token
    assert_respond_to subject, :reset_password_sent_at
    assert_respond_to subject, :sign_in_count
    assert_respond_to subject, :current_sign_in_at
    assert_respond_to subject, :last_sign_in_at
    assert_respond_to subject, :current_sign_in_ip
    assert_respond_to subject, :last_sign_in_ip
    assert_respond_to subject, :confirmation_token
    assert_respond_to subject, :confirmed_at
    assert_respond_to subject, :confirmation_sent_at
    assert_respond_to subject, :unconfirmed_email
    assert_respond_to subject, :tokens
    assert_respond_to subject, :email
    assert_respond_to subject, :active
  end



  ### VALIDATIONS ###
  # should validate_presence_of :provider
  should validate_presence_of(:password).on(:create)
  # should validate_confirmation_of :password
  should validate_length_of(:email).is_at_most(60)

  test 'should require password_confirmation if password present' do
    subject.password = nil
    subject.valid?
    assert_not_includes subject.errors[:password_confirmation], I18n.t('errors.messages.blank')

    subject.password = '123123123'
    subject.valid?
    assert_includes subject.errors[:password_confirmation], I18n.t('errors.messages.blank')
  end

  test 'email required if provider is email' do
    subject.provider = 'facebook'
    subject.email = nil
    subject.valid?
    assert_not_includes subject.errors[:email], I18n.t('errors.messages.blank')

    subject.provider = 'email'
    subject.email = nil
    subject.valid?
    assert_includes subject.errors[:email], I18n.t('errors.messages.blank')

    subject.provider = 'email'
    subject.email = 'foobar@foobar.com'
    subject.valid?
    assert_not_includes subject.errors[:email], I18n.t('errors.messages.blank')
  end

  test 'valid email' do
    subject.email = 'foo@bar+baz.com'
    subject.valid?
    assert_includes subject.errors[:email], I18n.t('errors.messages.invalid')

    subject.email = 'string'
    subject.valid?
    assert_includes subject.errors[:email], I18n.t('errors.messages.invalid')

    subject.email = 'EMAIL@EMAIL.COM'
    subject.valid?
    assert_equal subject.email, 'email@email.com'
    assert_not_includes subject.errors[:email], I18n.t('errors.messages.invalid')

    subject.email = 'foo@bar.com'
    subject.valid?
    assert_not_includes subject.errors[:email], I18n.t('errors.messages.invalid')
  end

  test 'if are displaying inactive users' do
    users = User.all
    assert_includes users, users(:confirmed)
    assert_includes users, users(:inactive)

    active_users = User.active(true).all
    assert_includes active_users, users(:confirmed)
    assert_not_includes active_users, users(:inactive)

    inactive_users = User.active(false).all
    assert_not_includes inactive_users, users(:confirmed)
    assert_includes inactive_users, users(:inactive)
  end

  test 'email unique with soft delete' do
    email = "foobar@bar.com"
    password = '123123123'
    provider = 'email'

    object_one = klass.create(email: email, password: password, password_confirmation: password, provider: provider)
    assert_not_nil object_one.id
    assert_not_includes object_one.errors[:email], I18n.t('errors.messages.taken')

    object_two = klass.create(email: email, password: password, password_confirmation: password, provider: provider)
    assert_nil object_two.id
    assert_includes object_two.errors[:email], I18n.t('errors.messages.taken')

    object_one.update_columns(deleted_at: DateTime.now)

    object_two.save
    assert_not_nil object_two.id
    assert_not_includes object_two.errors[:email], I18n.t('errors.messages.taken')
  end

end
