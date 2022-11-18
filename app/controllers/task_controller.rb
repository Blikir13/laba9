# frozen_string_literal: true

# documentation
class TaskController < ApplicationController
  def input; end

  def show
    error(params[:number])
    @number = params[:number].split(' ')
    mas = @number.map(&:to_i)
    @array = edit(mas)
    @s = max(@array)
  end

  private

  # поиск максимальных подпоследователностей и вывод в строку
  def max(array)
    arr = array.clone
    s = ''
    arr.sort_by!(&:size).map { |el| s += "#{el.join(' ')}, " if el.size == arr[-1].size }
    s
  end

  # разделение последовательности на возрастающие подпоследовательнсоти
  def edit(mas)
    ar = []
    m = 0
    (0..mas.count - 2).each do |i|
      if mas[i] >= mas[i + 1]
        ar << mas[m..i]
        m = i + 1
      end
    end
    ar << mas[m..mas.count - 1]
    ar.select { |x| x.length > 1 }
  end

  # описание возможных ошибок
  def error(str)
    str.split(' ').each do |x|
      next unless x.match(/^-?[0-9]\d*$/).nil?

      flash[:notice] = 'Вы ввели не число'
    end
    flash[:notice] = 'Вы ввели меньше 10 чисел' if str.split(' ').size < 10
  end
end
