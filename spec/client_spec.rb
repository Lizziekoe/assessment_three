require('spec_helper')

describe(Client) do
  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the client's name") do
      client = Client.new({:name => "Sarita", :stylist_id => 1})
      expect(client.name()).to(eq("Sarita"))
    end
  end

  describe("#stylist_id") do
    it("returns the stylist_id") do
      client = Client.new({:name => "Sarita", :stylist_id => 1})
      client.save()
      expect(client.stylist_id()).to((eq(1)))
    end
  end

  describe("#save") do
    it("lets you save clients to the database") do
      client = Client.new({:name => "Sarita", :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name") do
      client1 = Client.new({:name => "Sarita", :stylist_id => 1})
      client2 = Client.new({:name => "Sarita", :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end
end