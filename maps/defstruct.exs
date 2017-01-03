defmodule Subscriber do 
  defstruct name: "", paid: false, over_18: true
end

defmodule Attendee do 
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do 
    attendee.paid && attendee.over_18
  end
end