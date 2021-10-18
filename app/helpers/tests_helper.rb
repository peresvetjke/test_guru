module TestsHelper
  # TEST_LEVEL = {0 => 'Очень простой', 1 => 'Легкий', 2 => 'Средний', 3 => 'Сложный'}
  TEST_LEVEL = {0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three'}

  def test_level(test)
    TEST_LEVEL.keys.include?(test.level) ? t("helpers.level.#{TEST_LEVEL[test.level]}") : t("helpers.level.other")
  end

  def publication_status(test)
    test.published? ? t('tests.test.published_true') : t('tests.test.published_false')
  end
end