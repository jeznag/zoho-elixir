defmodule ZohoCRM.Lead do
  @moduledoc """
  The Struct and type definition for a Zoho Lead
  """

  @type t :: %ZohoCRM.Lead{
                      response: %{}
  }

  defstruct           response: %{}

end
