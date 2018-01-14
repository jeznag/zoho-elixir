defmodule ZohoCRM.Contact do
  @moduledoc """
  The Struct and type definition for a Zoho Contacts
  """

  @type t :: %ZohoCRM.Contact{
                      response: %{}
  }

  defstruct           response: %{}

end
