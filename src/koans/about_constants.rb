require File.expand_path(File.dirname(__FILE__) + '/neo')

C = "top level"

class AboutConstants < Neo::Koan

  C = "nested"

  def test_nested_constants_may_also_be_referenced_with_relative_paths
    # assert_equal __, C
    assert_equal 'nested', C
    # Lesson: Constants in the class come before globals...referenced by just using the name.

  end

  def test_top_level_constants_are_referenced_by_double_colons
    # assert_equal __, ::C
    assert_equal 'top level', ::C
    # Lesson: Use :: to get top level constants.

  end

  def test_nested_constants_are_referenced_by_their_complete_path
    # assert_equal __, AboutConstants::C
    assert_equal 'nested', AboutConstants::C
    # Lesson: Using :: with the class name gets you the class constant.

    # assert_equal __, ::AboutConstants::C
    assert_equal 'nested', ::AboutConstants::C
    # Lesson: The class is not a global constant, so using :: in front of it doesn't affect it.  You still get the
    # constant defined in the class

  end

  # ------------------------------------------------------------------

  class Animal
    LEGS = 4
    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      # Note that this class is nested inside of Animal class.
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  def test_nested_classes_inherit_constants_from_enclosing_classes
    # assert_equal __, Animal::NestedAnimal.new.legs_in_nested_animal
    assert_equal 4, Animal::NestedAnimal.new.legs_in_nested_animal
    # Lesson: We can reference constants in classes we are nested in.
    # Question:  Can we override them?

  end

  # ------------------------------------------------------------------

  class Reptile < Animal
    # < says that Reptile inherits from Reptile
    def legs_in_reptile
      LEGS
    end
  end

  def test_subclasses_inherit_constants_from_parent_classes
    # assert_equal __, Reptile.new.legs_in_reptile
    assert_equal 4, Reptile.new.legs_in_reptile
    # Lesson: Intherited constants are visible.

  end

  # ------------------------------------------------------------------

  class MyAnimals
    LEGS = 2

    class Bird < Animal
      def legs_in_bird
        LEGS
      end
    end
  end

  def test_who_wins_with_both_nested_and_inherited_constants
    # assert_equal __, MyAnimals::Bird.new.legs_in_bird
    assert_equal 2, MyAnimals::Bird.new.legs_in_bird
    # Lesson: Nested constants are winners over inherited constants.

  end

  # QUESTION: Which has precedence: The constant in the lexical scope,
  # or the constant from the inheritance hierarchy?
  #
  # Constant in the lexical scope has precedence over inheritance hierarchy.

  # ------------------------------------------------------------------

  class MyAnimals::Oyster < Animal
    # Says that Oyster is in the MyAnimals package?  Definitely in lexical scope (from what I ready below)
    # From what I have read when we define Oyster we are still in the global scope.
    def legs_in_oyster
      LEGS
    end
  end

  def test_who_wins_with_explicit_scoping_on_class_definition
    # assert_equal __, MyAnimals::Oyster.new.legs_in_oyster
    assert_equal 4, MyAnimals::Oyster.new.legs_in_oyster
    # Lesson: There is something called explicit scoping.  I need to look this up.

  end

  # QUESTION: Now which has precedence: The constant in the lexical
  # scope, or the constant from the inheritance hierarchy?  Why is it
  # different than the previous answer?
  #
  # Inheritance hierarchy has precedence over lexical scope.
end
