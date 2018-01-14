defmodule ZohoCRM.Deal do
  @moduledoc """
  The Struct and type definition for a Zoho Deal
  """

  @type t :: %ZohoCRM.Deal{
                      response: %{}
  }

  defstruct           response: %{}

end
