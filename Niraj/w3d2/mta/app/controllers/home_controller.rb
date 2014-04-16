class HomeController < ApplicationController
  protect_from_forgery

  def index
    render 'index'
  end

  def train_calc

    @start_train = params[:start_train]
    @stop_a = params[:stop_b]
    @end_train = params[:end_train]
    @stop_b = params[:stop_b]

    n = ['ts', '34th', '28th-n', '23rd-n', 'us', '8th']
    l = ['8th', '6th', 'us', '3rd', '1st']
    s = ['gc', '33rd', '28th-s', '23rd-s', 'us', 'ap']

    mta = {}

mta[:n] = n
mta[:l] = l
mta[:s] = s



if start_train != stop_train
  intersection = (mta[start_train] & mta[stop_train]).first

  stop_a_index = mta[start_train].index(stop_a)
  stop_a_intersection_index = mta[start_train].index(intersection)
  trip_a_length = (stop_a_index - stop_a_intersection_index).abs

  stop_b_index = mta[stop_train].index(stop_b)
  stop_b_intersection_index = mta[stop_train].index(intersection)
  trip_b_length = (stop_b_index - stop_b_intersection_index).abs

  total_length_of_trip = trip_a_length + trip_b_length
else
  stop_a_index = mta[start_train].index(stop_a)
  stop_b_index = mta[stop_train].index(stop_b)
  total_length_of_trip = (stop_a_index - stop_b_index).abs
end

  @result ="\n\n Your journey will have a total of #{total_length_of_trip} stops"

end

 

end
