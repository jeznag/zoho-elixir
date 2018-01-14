defmodule ZohoTest do
  use ExUnit.Case, async: false

  test "URLs" do
    assert ZohoCRM.Accounts.endpoint == "/Accounts/getRecords?authtoken=testkey&scope=crmapi"
    assert ZohoCRM.Accounts.postendpoint == "/Accounts/insertRecords?authtoken=testkey&scope=crmapi&xmlData="

    assert ZohoCRM.Contacts.endpoint == "/Contacts/getRecords?authtoken=testkey&scope=crmapi"
    assert ZohoCRM.Contacts.postendpoint == "/Contacts/insertRecords?authtoken=testkey&scope=crmapi&xmlData="

    assert ZohoCRM.Deals.endpoint == "/SalesOrders/getRecords?authtoken=testkey&scope=crmapi"
    assert ZohoCRM.Deals.postendpoint == "/SalesOrders/insertRecords?authtoken=testkey&scope=crmapi&xmlData="

    assert ZohoCRM.Leads.endpoint == "/Leads/getRecords?authtoken=testkey&scope=crmapi"
    assert ZohoCRM.Leads.postendpoint == "/Leads/insertRecords?authtoken=testkey&scope=crmapi&xmlData="    
  end

  test "Process Url" do
    assert ZohoCRM.process_url("/x") == "https://test.domain/crm/private/json/x"
  end

  test "can dynamically change domain via Application config" do
    Application.put_env(:zoho, :domain, "abc.def")
    assert ZohoCRM.process_url("/x") == "https://abc.def/crm/private/json/x"

    Application.put_env(:zoho, :domain, "test.domain")
    assert ZohoCRM.process_url("/x") == "https://test.domain/crm/private/json/x"
  end

  test "can dynamically change auth key" do
    Application.put_env(:zoho, :auth_key, "supersecret")
    assert ZohoCRM.Accounts.endpoint == "/Accounts/getRecords?authtoken=supersecret&scope=crmapi"

    Application.put_env(:zoho, :auth_key, "testkey")
    assert ZohoCRM.Accounts.endpoint == "/Accounts/getRecords?authtoken=testkey&scope=crmapi"
  end
end
