defmodule ZohoCRM.Deals do
  
  @loc "SalesOrders"
  @resource ZohoCRM.Deal
  
  use ZohoCRM.Resource


  #clean up strange data format
  def get_clean do
     data = ZohoCRM.Deals.get

     top = data.response["result"]["Deals"]["row"]
     if is_list top do
       data2 = top
       data3 = Enum.map(data2, fn(y) -> Enum.map(y["FL"], fn(x) -> %{x["val"] => x["content"]} end) end)
       Enum.map(data3, fn(y) -> Enum.reduce(y, %{}, fn (map, acc) -> Map.merge(acc, map) end) end)
     else
       data2 = top["FL"]
       Enum.map(data2, fn(x) -> %{x["val"] => x["content"]} end)
     end
  end

end
