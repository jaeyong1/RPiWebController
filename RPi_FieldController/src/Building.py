from com.jyp.rpi.gpio import BuildingType

class Building(BuildingType):
    def __init__(self, name, address, id):
        self.name = name
        self.address = address
        self.id = id
        print("Building constructor")
        print(self.name)

    def getBuildingName(self):
        return self.name

    def getBuildingAddress(self):
        return self.address

    def getBuldingId(self):
        return self.id
