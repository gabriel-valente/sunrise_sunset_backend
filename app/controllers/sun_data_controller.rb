class SunDataController < ApplicationController
  def index
    location = params[:location]
    start_date = params[:start_date]
    end_date = params[:end_date]

    return render json: { error: "MISSING_PARAMETERS" }, status: :bad_request if location.blank? || (start_date.blank? && end_date.blank?) # We need the location and at least one date

    records = SunriseSunset.where(location: location, date: start_date..(end_date || start_date)).order(:date).to_a

    # An array of the dates that are not present in the database
    # Date.parse(end_date || start_date) = If we dont have an end date it used the start date
    missing_dates = (Date.parse(start_date)..Date.parse(end_date || start_date)).to_a - records.pluck(:date)
    missing_dates.map! { |date| date.strftime('%Y-%m-%d') }

    if missing_dates.empty? # If the array is empty, it means we have every date we needed
      render json: records.as_json(except: [:id, :created_at, :updated_at])
    else
      # Call the API for the range of dates we need
      # This is a pessimistic call, because we will get the dates in between the start/end even if we already have them
      data = SunriseSunsetService.fetch_data(location, missing_dates[0], missing_dates[-1])

      if data["status"] == "OK"
        # Adds the new data to the database and to the return array
        missing_dates.each do |miss_date|
          result = data["results"].detect { |res| res["date"] == miss_date }

          records << SunriseSunset.create(
            location: location,
            date: result["date"],
            sunrise: result["sunrise"],
            sunset: result["sunset"],
            golden_hour: result["golden_hour"]
          )
        end

        render json: records.sort_by(&:date).as_json(except: [:id, :created_at, :updated_at])
      else
        render json: { error: data["message"] }, status: :unprocessable_entity
      end
    end
  end
end
