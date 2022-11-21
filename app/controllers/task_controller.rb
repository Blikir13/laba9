# frozen_string_literal: true

# documentation
class TaskController < ApplicationController
  before_action :error, only: :show
  def input; end

  def show
    @number = params[:number].split(' ')
    @array = edit(@number.map(&:to_i))
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
  def error
    params[:number].split(' ').each do |x|
      next unless x.match(/^-?[0-9]\d*$/).nil?

      return flash[:notice] = "Вы ввели не число: #{x}"
    end
    flash[:notice] = 'Вы ввели меньше 10 чисел' if params[:number].split(' ').size < 10
  end
end
