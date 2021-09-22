module TestsHelper
  TEST_LEVEL = {0 => 'Очень простой', 1 => 'Легкий', 2 => 'Средний', 3 => 'Сложный'}

  def test_level(test)
    TEST_LEVEL[test.level] || 'Хардкор'
  end
end