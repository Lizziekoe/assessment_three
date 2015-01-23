require('spec_helper')

describe(Client) do
  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the client's name") do
      client = Client.new({:name => "Sarita", :id => nil})
      expect(client.name()).to(eq("Sarita"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      client = Client.new({:name => "Sarita", :id => nil})
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save clients to the database") do
      client = Client.new({:name => "Sarita", :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name") do
      client1 = Client.new({:name => "Sarita", :id => nil})
      client2 = Client.new({:name => "Sarita", :id => nil})
      expect(client1).to(eq(client2))
    end
  end
end