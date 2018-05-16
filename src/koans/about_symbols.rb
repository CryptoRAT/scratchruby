require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutSymbols < Neo::Koan
  def test_symbols_are_symbols
    symbol = :ruby
    # assert_equal __, symbol.is_a?(Symbol)
    assert_equal true, symbol.is_a?(Symbol)
  end

  def test_symbols_can_be_compared
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    symbol3 = :something_else

    # assert_equal __, symbol1 == symbol2
    assert_equal true, symbol1 == symbol2
    # assert_equal __, symbol1 == symbol3
    assert_equal false, symbol1 == symbol3
  end

  def test_identical_symbols_are_a_single_internal_object
    symbol1 = :a_symbol
    symbol2 = :a_symbol

    # assert_equal __, symbol1 == symbol2
    assert_equal true, symbol1 == symbol2
    # assert_equal __, symbol1.object_id == symbol2.object_id
    assert_equal true, symbol1.object_id == symbol2.object_id
  end

  def test_method_names_become_symbols
    symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }
    # This gives a fairly long list.  Each method name is a symbol, as well as many other things.
    # puts symbols_as_strings
    # assert_equal __, symbols_as_strings.include?("test_method_names_become_symbols")
    assert_equal true, symbols_as_strings.include?("test_method_names_become_symbols")
  end

  # THINK ABOUT IT:
  #
  # Why do we convert the list of symbols to strings and then compare
  # against the string value rather than against symbols?
  #
  # If we include the symbol, wouldn't we be calling it?

  in_ruby_version("mri") do
    RubyConstant = "What is the sound of one hand clapping?"
    def test_constants_become_symbols
      all_symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }

      # assert_equal __, all_symbols_as_strings.include?(__)
      assert_equal true, all_symbols_as_strings.include?("RubyConstant")
    end
  end

  def test_symbols_can_be_made_from_strings
    string = "catsAndDogs"
    # assert_equal __, string.to_sym
    assert_equal :catsAndDogs, string.to_sym
  end

  def test_symbols_with_spaces_can_be_built
    symbol = :"cats and dogs"

    # assert_equal __.to_sym, symbol
    assert_equal "cats and dogs".to_sym, symbol
  end

  def test_symbols_with_interpolation_can_be_built
    value = "and"
    symbol = :"cats #{value} dogs"

    # assert_equal __.to_sym, symbol
    assert_equal "cats and dogs".to_sym, symbol
  end

  def test_to_s_is_called_on_interpolated_symbols
    symbol = :cats
    string = "It is raining #{symbol} and dogs."
    # The key here is that symbol.to_s removes the :
    # assert_equal __, string
    assert_equal "It is raining cats and dogs.", string
  end

  def test_symbols_are_not_strings
    symbol = :ruby
    # assert_equal __, symbol.is_a?(String)
    assert_equal false, symbol.is_a?(String)
    # assert_equal __, symbol.eql?("ruby")
    assert_equal false, symbol.eql?("ruby")
  end

  def test_symbols_do_not_have_string_methods
    symbol = :not_a_string
    # assert_equal __, symbol.respond_to?(:each_char)
    assert_equal false, symbol.respond_to?(:each_char)
    # assert_equal __, symbol.respond_to?(:reverse)
    assert_equal false, symbol.respond_to?(:reverse)
  end

  # It's important to realize that symbols are not "immutable
  # strings", though they are immutable. None of the
  # interesting string operations are available on symbols.

  def test_symbols_cannot_be_concatenated
    # Exceptions will be pondered further down the path
    # assert_raise(___) do
    assert_raise(NoMethodError) do
      :cats + :dogs
    end
  end

  def test_symbols_can_be_dynamically_created
    # assert_equal __, ("cats" + "dogs").to_sym
    assert_equal :catsdogs, ("cats" + "dogs").to_sym
  end

  # THINK ABOUT IT:
  #
  # Why is it not a good idea to dynamically create a lot of symbols?
  # They are stored in memory and anything looking at this list will take longer and longer to run.
  #
  # Symbols are like strings but they are immutable - they can't be modified.
  #
  # They are only put into memory once, making them very efficient to use for things like keys in hashes but they stay in memory until the program exits. This makes them a memory hog if you misuse them.
  #
  # If you dynamically create lots of symbols, you are allocating a lot of memory that can't be freed until your program ends. You should only dynamically create symbols (using string.to_sym) if you know you will:
  #
  # need to repeatedly access the symbol
  # not need to modify them
end