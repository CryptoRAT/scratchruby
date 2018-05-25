require File.expand_path(File.dirname(__FILE__) + '/neo')

def my_global_method(a,b)
  a + b
end

class AboutMethods < Neo::Koan

  def test_calling_global_methods
    # assert_equal __, my_global_method(2,3)
    assert_equal 5, my_global_method(2,3)
    # Lesson: Global methods go outside of a class definition.  Why would we use this?  When do you put more than one
    # class in a file?
  end

  def test_calling_global_methods_without_parentheses
    result = my_global_method 2, 3
    # assert_equal __, result
    assert_equal 5, result
    # Lesson:  Parentheses around arguments are optional.  If you look back through the koans already completed, you
    # will no doubt notice we haven't been using them.
  end

  # (NOTE: We are Using eval below because the example code is
  # considered to be syntactically invalid).
  def test_sometimes_missing_parentheses_are_ambiguous
    # eval "assert_equal 5, my_global_method 2, 3" # ENABLE CHECK
    eval "assert_equal 5, my_global_method(2, 3)" # ENABLE CHECK
    #
    # Ruby doesn't know if you mean:
    #
    #   assert_equal(5, my_global_method(2), 3)
    # or
    #   assert_equal(5, my_global_method(2, 3))
    #
    # Rewrite the eval string to continue.
    # I tried the following which also failed:
    #
    # eval "assert_equal 5, my_global_method (2, 3)" # ENABLE CHECK
    # Lesson:  Can't have a space between method and open parentheses.  Seems to confuse the compiler.
    #
    # This one works though:
    eval "assert_equal(5, my_global_method(2, 3))" # ENABLE CHECK
  end

  # NOTE: wrong number of arguments is not a SYNTAX error, but a
  # runtime error.
  def test_calling_global_methods_with_wrong_number_of_arguments
    # exception = assert_raise(___) do
    #   my_global_method
    # end
    exception = assert_raise(ArgumentError) do
      my_global_method
    end

    # Lesson: IntelliJ IDEA caught it.  Use better tools if you can.  I wonder if there is an automated checker,
    # maybe a gem, which will find these so that people not using such tools can avoid the mistake.

    # assert_match(/__/, exception.message)
    assert_match(/wrong number of arguments \(given 0, expected 2\)/, exception.message)
    # Lesson:  No quotes need around long matches.  How did I not figure this out by now?
    # Question:  How do I put the expected argument in a string or some such so I can reuse the pattern?

    exception = assert_raise(ArgumentError) do
      my_global_method(1,2,3)
    end
    assert_match(/wrong number of arguments \(given 3, expected 2\)/, exception.message)
    # Lesson: You also get an error for too many arguments provided.
  end

  # ------------------------------------------------------------------

  def method_with_defaults(a, b=:default_value)
    [a, b]
  end

  def test_calling_with_default_values
    # assert_equal [1, __], method_with_defaults(1)
    assert_equal [1, :default_value], method_with_defaults(1)
    # Lesson:  The method returns it's arguments in an array.  In this case, the second one is a default.

    # assert_equal [1, __], method_with_defaults(1, 2)
    assert_equal [1, 2], method_with_defaults(1, 2)
  end

  # ------------------------------------------------------------------

  def method_with_var_args(*args)
    args
  end

  def test_calling_with_variable_arguments
    # assert_equal __, method_with_var_args.class
    assert_equal Array, method_with_var_args.class
    # Lesson:  We are returning the arguments, which is an Array, being variable.

    # assert_equal __, method_with_var_args
    assert_equal [], method_with_var_args
    # Lesson:  When no arguments are passed in then we have an empty Array.

    # assert_equal __, method_with_var_args(:one)
    assert_equal [:one], method_with_var_args(:one)
    # Lesson: Labels can be arguments and even with one argument we get an Array of size 1.

    # assert_equal __, method_with_var_args(:one, :two)
    assert_equal [:one, :two], method_with_var_args(:one, :two)
    # Lesson: Can do more than one argument, still and array.  This just shows that it is variable since we have done
    # 0 to 2 arguments against the same method.
  end

  # ------------------------------------------------------------------

  def method_with_explicit_return
    :a_non_return_value
    return :return_value
    :another_non_return_value
  end

  def test_method_with_explicit_return
    # assert_equal __, method_with_explicit_return
    assert_equal :return_value, method_with_explicit_return
    # Lesson:  return is how we explicitly set a return value.
  end

  # ------------------------------------------------------------------

  def method_without_explicit_return
    :a_non_return_value
    :return_value
  end

  def test_method_without_explicit_return
    # assert_equal __, method_without_explicit_return
    assert_equal :return_value, method_without_explicit_return
    # Lesson: When there is no explicit return value, the last value in the method is returned.
    # Question:  What if there is no value, but a method call?  The result of the method call?
    # I added another method/test below to find out.  test_method_without_explicit_return_but_has_method_call
  end

  def method_without_explicit_return_but_has_method_call
    1 + 2
  end

  def test_method_without_explicit_return_but_has_method_call
    # assert_equal __, method_without_explicit_return_but_has_method_call
    assert_equal 3, method_without_explicit_return_but_has_method_call
    # Lesson:  Will return the result of the method call.
    # Question:  What if there is no method call, but a variable being set or some such?
    # Question:  What if the above is true, but prior to variable being set there is a method call?
    # See test_method_without_explicit_return_and_no_method_call for answers.
  end

  def method_without_explicit_return_and_no_method_call
    result = 1 + 2
  end

  def test_method_without_explicit_return_and_no_method_call
    # assert_equal __, method_without_explicit_return_but_has_method_call
    assert_equal 3, method_without_explicit_return_and_no_method_call
    # Lesson:  Will return the value of the variable we just set.  So anything before this won't be affecting the result
    # unless it changes the value of result some how...
  end

  # ------------------------------------------------------------------

  def my_method_in_the_same_class(a, b)
    a * b
  end

  def test_calling_methods_in_same_class
    # assert_equal __, my_method_in_the_same_class(3,4)
    assert_equal 12, my_method_in_the_same_class(3,4)
    # Lesson:  We can call other methods in the same class.  We have been doing this, so why not move this koan up?
    # Probably because we first need to learn how to call methods before we can show where we can call them from.

  end

  def test_calling_methods_in_same_class_with_explicit_receiver
    # assert_equal __, self.my_method_in_the_same_class(3,4)
    assert_equal 12, self.my_method_in_the_same_class(3,4)
    # Lesson:  self points to this instance of this class.
    # Question:  When will I find ambiguity such that I need to say self?  javascript coming to mind.  Need to look up
    # scope some more to answer this.
  end

  # ------------------------------------------------------------------

  def my_private_method
    "a secret"
  end
  private :my_private_method


  def test_calling_private_methods_without_receiver
    # assert_equal __, my_private_method
    assert_equal'a secret', my_private_method
    # Lesson:  Look how we defined a private method.  We defined the method, then separately defined it as private.
    # Question:  Can I say it's private before defining it?  Depends on the parser I guess. I tested it and it turns out
    # you can not.
    # I got the following error when I put the private declaration before defining the method:
    #
    # in `private': undefined method `my_private_method' for class `AboutMethods' (NameError)
  end

  def test_calling_private_methods_with_an_explicit_receiver
    # exception = assert_raise(___) do
    #   self.my_private_method
    # end
    #assert_match /__/, exception.message
    exception = assert_raise(NoMethodError) do
      self.my_private_method
    end
    assert_match /private method `my_private_method' called for/, exception.message
    # Lesson:  Can't use private methods with self...what?  Why?
    # There is also a protected.  I Think that can be used, but it says it is slow because of inline cache.
    # I have added test_calling_protected_methods_without_receiver and
    # test_calling_protected_methods_with_an_explicit_receiver below to try it out.  It's true, I can call it.
  end

  # ------------------------------------------------------------------

  def my_protected_method
    "a protected message"
  end
  protected :my_protected_method


  def test_calling_protected_methods_without_receiver
    # assert_equal __, my_protected_method
    assert_equal'a protected message', my_protected_method
  end

  def test_calling_protected_methods_with_an_explicit_receiver
    # assert_equal __, self.my_protected_method
    assert_equal'a protected message', self.my_protected_method
  end

  # ------------------------------------------------------------------
  class Dog
    def name
      "Fido"
    end

    private

    def tail
      "tail"
    end
  end

  def test_calling_methods_in_other_objects_require_explicit_receiver
    rover = Dog.new
    # assert_equal __, rover.name
    assert_equal 'Fido', rover.name
    # Lesson: You must specify a receiver for the method call (the message is sent to the receiver)
  end

  def test_calling_private_methods_in_other_objects
    rover = Dog.new
    # assert_raise(___) do
    assert_raise(NoMethodError) do
      rover.tail
    end
    # Lesson:  You can not call a private method in another class.
  end
end
