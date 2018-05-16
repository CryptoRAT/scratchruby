# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutRegularExpressions < Neo::Koan
  def test_a_pattern_is_a_regular_expression
    # assert_equal __, /pattern/.class
    assert_equal Regexp, /pattern/.class
  end

  def test_a_regexp_can_search_a_string_for_matching_content
    # assert_equal __, "some matching content"[/match/]
    assert_equal "match", "some matching content"[/match/]
    # assert_equal __, "text to find regexed data in"[/regex/]
    assert_equal "regex", "text to find regexed data in"[/regex/]
  end

  def test_a_failed_match_returns_nil
    # assert_equal __, "some matching content"[/missing/]
    assert_equal nil, "some matching content"[/missing/]
  end

  # ------------------------------------------------------------------

  def test_question_mark_means_optional
    # assert_equal __, "abbcccddddeeeee"[/ab?/]
    # Note that it only finds up to the regex.
    assert_equal "ab", "abbcccddddeeeee"[/ab?/]
    # assert_equal __, "abbcccddddeeeee"[/az?/]
    # The z is optional
    assert_equal "a", "abbcccddddeeeee"[/az?/]
    # What if there is more than one a?  Well, it only finds the first one.
    assert_equal "a", "abbcccddddeaeeee"[/az?/]
  end

  def test_plus_means_one_or_more
    # assert_equal __, "abbcccddddeeeee"[/bc+/]
    # Finds one or more c's after the b.
    assert_equal 'bccc', "abbcccddddeeeee"[/bc+/]
  end

  def test_asterisk_means_zero_or_more
    # assert_equal __, "abbcccddddeeeee"[/ab*/]
    assert_equal 'abb', "abbcccddddeeeee"[/ab*/]
    # assert_equal __, "abbcccddddeeeee"[/az*/]
    assert_equal 'a', "abbcccddddeeeee"[/az*/]
    # assert_equal __, "abbcccddddeeeee"[/z*/]
    # Since it is zero or more it is not considered "not found".  So instead of nil, we get empty string.
    assert_equal '', "abbcccddddeeeee"[/z*/]

    # THINK ABOUT IT:
    #
    # When would * fail to match?
    #
    # Nothing.  * always returns at least an empty string....right?
    assert_equal '', "abbc"[/4*/]
  end

  # THINK ABOUT IT:
  #
  # We say that the repetition operators above are "greedy."
  #
  # Why?

  # ------------------------------------------------------------------

  def test_the_left_most_match_wins
    # assert_equal __, "abbccc az"[/az*/]
    # Why say left most instead of first?
    assert_equal 'a', "abbccc az"[/az*/]
  end

  # ------------------------------------------------------------------

  def test_character_classes_give_options_for_a_character
    animals = ["cat", "bat", "rat", "zat"]
    # assert_equal __, animals.select { |a| a[/[cbr]at/] }
    # What are we selecting here?  All values (temporarily put in a)where a is equal to either 'c', 'b', or 'r', and is
    # followed by 'at'.  So no zat.
    assert_equal %W(cat bat rat), animals.select { |a| a[/[cbr]at/] }
  end

  def test_slash_d_is_a_shortcut_for_a_digit_character_class
    # assert_equal __, "the number is 42"[/[0123456789]+/]
    # List out all numbers in the match, 1 or more.
    assert_equal '42', "the number is 42"[/[0123456789]+/]
    # assert_equal __, "the number is 42"[/\d+/]
    # Use the \d shortcut, 1 or more.
    assert_equal '42', "the number is 42"[/\d+/]
  end

  def test_character_classes_can_include_ranges
    # assert_equal __, "the number is 42"[/[0-9]+/]
    assert_equal '42', "the number is 42"[/[0-9]+/]
  end

  def test_slash_s_is_a_shortcut_for_a_whitespace_character_class
    # assert_equal __, "space: \t\n"[/\s+/]
    assert_equal " \t\n", "space: \t\n"[/\s+/]
  end

  def test_slash_w_is_a_shortcut_for_a_word_character_class
    # NOTE:  This is more like how a programmer might define a word.
    # Contains 1 or more letters of the alphabet, numbers, and underscore?
    # assert_equal __, "variable_1 = 42"[/[a-zA-Z0-9_]+/]
    assert_equal "variable_1", "variable_1 = 42"[/[a-zA-Z0-9_]+/]
    # assert_equal __, "variable_1 = 42"[/\w+/]
    assert_equal "variable_1", "variable_1 = 42"[/\w+/]
  end

  def test_period_is_a_shortcut_for_any_non_newline_character
    # assert_equal __, "abc\n123"[/a.+/]
    assert_equal "abc", "abc\n123"[/a.+/]
  end

  def test_a_character_class_can_be_negated
    # assert_equal __, "the number is 42"[/[^0-9]+/]
    assert_equal "the number is ", "the number is 42"[/[^0-9]+/]
  end

  def test_shortcut_character_classes_are_negated_with_capitals
    # assert_equal __, "the number is 42"[/\D+/]
    # \D means non-digit character
    assert_equal "the number is ", "the number is 42"[/\D+/]
    # assert_equal __, "space: \t\n"[/\S+/]
    # \S means non-whitespace character
    assert_equal 'space:', "space: \t\n"[/\S+/]
    # ... a programmer would most likely do
    # assert_equal __, "variable_1 = 42"[/[^a-zA-Z0-9_]+/]
    # Everything but the alphanumerics
    assert_equal ' = ', "variable_1 = 42"[/[^a-zA-Z0-9_]+/]
    # assert_equal __, "variable_1 = 42"[/\W+/]
    # \W means a non-word character.  Same as the previous ultimately.
    assert_equal ' = ', "variable_1 = 42"[/\W+/]
  end

  # ------------------------------------------------------------------

  def test_slash_a_anchors_to_the_start_of_the_string
    # assert_equal __, "start end"[/\Astart/]
    assert_equal "start", "start end"[/\Astart/]
    # assert_equal __, "start end"[/\Aend/]
    # Wasn't found at the start, so nil.
    assert_equal nil, "start end"[/\Aend/]
  end

  def test_slash_z_anchors_to_the_end_of_the_string
    # assert_equal __, "start end"[/end\z/]
    assert_equal 'end', "start end"[/end\z/]
    # assert_equal __, "start end"[/start\z/]
    # Wasn't found at the end, so nil.
    assert_equal nil, "start end"[/start\z/]
  end

  def test_caret_anchors_to_the_start_of_lines
    # assert_equal __, "num 42\n2 lines"[/^\d+/]
    # Finds the left most value at the start of the line where it is a digit (1 or more).
    assert_equal "2", "num 42\n2 lines"[/^\d+/]
    assert_equal "37", "num 42\n37 lines"[/^\d+/]
    # Note that ^ is also the negation operator...To do use that, I think you have to use ^[pattern].  Will have to
    # experiment
  end

  def test_dollar_sign_anchors_to_the_end_of_lines
    # assert_equal __, "2 lines\nnum 42"[/\d+$/]
    assert_equal "42", "2 lines\nnum 42"[/\d+$/]
  end

  def test_slash_b_anchors_to_a_word_boundary
    # assert_equal __, "bovine vines"[/\bvine./]
    assert_equal "vines", "bovine vines"[/\bvine./]
  end

  # ------------------------------------------------------------------

  def test_parentheses_group_contents
    # assert_equal __, "ahahaha"[/(ha)+/]
    assert_equal "hahaha", "ahahaha"[/(ha)+/]
    # Without it, recall, we will get only the left most.
    assert_equal "ha", "ahahaha"[/ha+/]
  end

  # ------------------------------------------------------------------

  def test_parentheses_also_capture_matched_content_by_number
    # assert_equal __, "Gray, James"[/(\w+), (\w+)/, 1]
    # So what is really happening here?  It looks like it is saying:
    # word, word, give the first of those.
    assert_equal 'Gray', "Gray, James"[/(\w+), (\w+)/, 1]
    # assert_equal __, "Gray, James"[/(\w+), (\w+)/, 2]
    assert_equal 'James', "Gray, James"[/(\w+), (\w+)/, 2]
    # Let me try some others to see what happens.
    assert_equal 'Gray, James', "Gray, James"[/(\w+), (\w+)/]
    # So is it saying when you find these groups, give me the second group?
    # Let's create some other groups to find out.
    # assert_equal '35', "35"[/(\d+), (\d+)/]
    assert_equal '35', "35, 57, 91, 21"[/(\d+), (\d+), (\d+), (\d+)/, 1]
    assert_equal '57', "35, 57, 91, 21"[/(\d+), (\d+), (\d+), (\d+)/, 2]
    assert_equal '91', "35, 57, 91, 21"[/(\d+), (\d+), (\d+), (\d+)/, 3]
    assert_equal '21', "35, 57, 91, 21"[/(\d+), (\d+), (\d+), (\d+)/, 4]
    # Does it take a range? No it does not.  Also tried 3, 4, that doesn't work either.
    # assert_equal '21', "35, 57, 91, 21"[/(\d+), (\d+), (\d+), (\d+)/, 3..4]

  end

  def test_variables_can_also_be_used_to_access_captures
    # assert_equal __, "Name:  Gray, James"[/(\w+), (\w+)/]
    assert_equal "Gray, James", "Name:  Gray, James"[/(\w+), (\w+)/]
    # assert_equal __, $1
    assert_equal "Gray", $1
    # assert_equal __, $2
    assert_equal "James", $2
    # $~ is equivalent to ::last_match;
    # $& contains the complete matched text;
    # $` contains string before match;
    # $' contains string after match;
    # $1, $2 and so on contain text matching first, second, etc capture group;
    # $+ contains last capture group.
  end

  # ------------------------------------------------------------------

  def test_a_vertical_pipe_means_or
    grays = /(James|Dana|Summer) Gray/
    # assert_equal __, "James Gray"[grays]
    assert_equal 'James Gray', "James Gray"[grays]
    # assert_equal __, "Summer Gray"[grays, 1]
    assert_equal 'Summer', "Summer Gray"[grays, 1]
    # assert_equal __, "Jim Gray"[grays, 1]
    assert_equal nil, "Jim Gray"[grays, 1]
  end

  # THINK ABOUT IT:
  #
  # Explain the difference between a character class ([...]) and alternation (|).
  #
  # My thoughts: Alternates allows you to select from a known list, as opposed to any old word.
  # ------------------------------------------------------------------

  def test_scan_is_like_find_all
    # assert_equal __, "one two-three".scan(/\w+/)
    assert_equal %w( one two three ), "one two-three".scan(/\w+/)
  end

  def test_sub_is_like_find_and_replace
    # assert_equal __, "one two-three".sub(/(t\w*)/) { $1[0, 1] }
    assert_equal 'one t-three', "one two-three".sub(/(t\w*)/) { $1[0, 1] }
    # sub(pattern, replacement) → new_str
    # sub(pattern, hash) → new_str
    # sub(pattern) {|match| block } → new_str
    # In the block form, the current match string is passed in as a parameter, and variables such as $1, $2, $`,
    # $&, and $' will be set appropriately. The value returned by the block will be substituted for the match on each
    # call.
    #
    # So we are using the last form.
    #  pattern = "(t\w*)"
    #  block = "$1[0, 1]"
    #   Let's think of block as [start, numberToKeep]
    #
    # This means we are, for the left most found matched string, t followed by one or more characters and keeping the
    # characters from start to start + numberToKeep.
    #
    # For Example:
    # [start, numberToKeep]
    # [0,1] -> first character stays.  Start at 0, keep 1 character (first)
    # [0,2] -> first two characters.  Start at 0, keep 2 characters (first 2)
    # [2,4] -> third, fourth, fifth, and sixth characters.  Start at 2, keep 4 characters.
    # Here are some additional code samples
    assert_equal 'one -three', "one two-three".sub(/(t\w*)/) { $1[0, 0] }
    assert_equal 'one tw-three', "one two-three".sub(/(t\w*)/) { $1[0, 2] }
    assert_equal 'one two-three', "one two-three".sub(/(t\w*)/) { $1[0, 3] }
    assert_equal 'one o-three', "one two-three".sub(/(t\w*)/) { $1[2, 3] }
  end

  def test_gsub_is_like_find_and_replace_all
    # assert_equal __, "one two-three".gsub(/(t\w*)/) { $1[0, 1] }
    assert_equal 'one t-t', "one two-three".gsub(/(t\w*)/) { $1[0, 1] }
    # Here it seems to be finding each match and calling the block {$1[0,1]} on each match.  Maybe?
  end
end
