require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutKeywordArguments < Neo::Koan

  def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

  def test_keyword_arguments
    # assert_equal __, method_with_keyword_arguments.class
    assert_equal Array, method_with_keyword_arguments.class
    # Lesson: Arguments is still an Array when using keywords, same as when not.

    # assert_equal __, method_with_keyword_arguments
    assert_equal [1, 'two'], method_with_keyword_arguments
    # Lesson: If the arguments aren't specified, then the default value is used.  Defaults are required for keyword
    # arguments.

    # assert_equal __, method_with_keyword_arguments(one: 'one')
    assert_equal ['one', 'two'], method_with_keyword_arguments(one: 'one')
    # Lesson: You can override the default value of any one, or all, keywords by specifying the keywords.
    # Note that you can also change the class type of the value.  Something to be wary of?

    # assert_equal __, method_with_keyword_arguments(two: 2)
    assert_equal [1, 2], method_with_keyword_arguments(two: 2)
    # Lesson: You can override the default value of any one, or all, keywords by specifying the keywords.
  end

  def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
    [one, two, three]
  end

  def test_keyword_arguments_with_wrong_number_of_arguments
    # exception = assert_raise (___) do
    #   method_with_keyword_arguments_with_mandatory_argument
    # end
    # assert_match(/__/, exception.message)
    exception = assert_raise (ArgumentError) do
      method_with_keyword_arguments_with_mandatory_argument
    end
    assert_match(/wrong number of arguments \(given 0, expected 1\)/, exception.message)
    # Lesson:  You can mix and match required arguments and keyword arguments.
    # It appears, that all keyword arguments must have a default value.
  end

  # THINK ABOUT IT:
  #
  # Keyword arguments always have a default value, making them optional to the caller

end
