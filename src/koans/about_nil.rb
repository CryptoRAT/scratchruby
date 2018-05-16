require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutNil < Neo::Koan
  def test_nil_is_an_object
    #assert_equal __, nil.is_a?(Object), "Unlike NULL in other languages"
    assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?

      # assert_equal __, ex.class
      assert_equal NoMethodError, ex.class

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)

      # undefined method `some_method_nil_doesnt_know_about' for nil:NilClass
      # assert_match(/__/, ex.message)
      # https://ruby-doc.org/core-2.5.0/Regexp.html
      assert_match(/undefined method/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    # assert_equal __, nil.nil?
    assert_equal true, nil.nil?
    # assert_equal __, nil.to_s
    assert_equal "", nil.to_s
    # assert_equal __, nil.inspect
    assert_equal 'nil', nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
    # Use obj.nil?, as all non-nil objects will return true to this.  It turns out, it as actually a more optimized
    # solution.  The docs say they are essentially the same, except that nil? is faster, and more ruby-esque.
  end

end
