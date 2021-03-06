require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('tells you its name') do
      stylist = Stylist.new({:name => "Aveda", :id => nil})
      expect(stylist.name()).to(eq("Aveda"))
    end
  end

  describe('#id') do
    it('sets its ID when you save it') do
      stylist = Stylist.new({:name => "Aveda", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('lets you save stylists to the database') do
      stylist = Stylist.new({:name => "Aveda", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID number") do
      test_stylist = Stylist.new({:name => "Aveda", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Dosha", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Aveda", :stylist_id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Ruby", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Sarita", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe('#==') do
    it('is the same Stylist if it has the same name') do
      stylist1 = Stylist.new({:name => "Aveda", :id => nil})
      stylist2 = Stylist.new({:name => "Aveda", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Aveda", :id => nil})
      stylist.save()
      stylist.update({:name => "Dosha"})
      expect(stylist.name()).to(eq("Dosha"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Ruby", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Sarita", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Dosha", :id => nil})
      stylist.save()
      client = Client.new({:description => "Ruby", :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:description => "Sarita", :stylist_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end