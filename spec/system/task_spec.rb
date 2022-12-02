require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  # автоматически создаем значениe number
  let(:x_value) { '9 8 7 6 5 4 3 2 1 0' }

  scenario 'check' do
    visit root_path # переходим на страницы ввода
    fill_in :number, with: x_value # заполняем поле с name="number"
    find('#calculate-btn').click # нажимаем на кнопку с id="calculate_btn"
    # ожидаем найти в контенере вывода правильное содержимое
    expect(find('#resTable')).to have_text("введенная последовательность 9 8 7 6 5 4 3 2 1 0\nМаксимальная подпоследовательность Нет максимальной")
  end
  scenario 'new_check' do
    visit root_path # переходим на страницы ввода
    fill_in :number, with: '1 2' # заполняем поле с name="number"
    find('#calculate-btn').click # нажимаем на кнопку с id="calculate_btn"
    # ожидаем найти в контенере вывода правильное содержимое
    expect(find('#notice')).to have_text('Вы ввели меньше 10 чисел')
  end
end
