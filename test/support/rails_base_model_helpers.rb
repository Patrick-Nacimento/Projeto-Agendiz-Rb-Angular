class RailsBaseModelHelpers < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  extend ModelHelpers

  def should_active_inactive(subject, test_active_index = true)
    assert_respond_to subject, :active

    if test_active_index # case the indexes are not working correctly
      assert_equal true, ActiveRecord::Base.connection.index_exists?(klass.table_name.to_sym, :active)
    end

    subject.destroy
    assert_equal false, subject.reload.active?

    subject.restore
    assert_equal true, subject.reload.active?
  end

  def should_be_active(subject, association_sym, valid, invalid)
    subject.reload.send("#{association_sym}=".to_sym, invalid)
    assert_equal false, subject.valid?

    subject.reload.send("#{association_sym}=".to_sym, valid)
    assert_equal true, subject.valid?
  end
end