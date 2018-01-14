defmodule ZohoCRM.Account do
  @moduledoc """
  The Struct and type definition for a Zoho Accounts
  """

  @type t :: %ZohoCRM.Account{
                      response: %{}
  }

  defstruct           response: %{}

end
