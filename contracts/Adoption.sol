pragma solidity ^0.5.0;

contract Adoption {
    struct Pet {
        uint256 id;
        string breed;
        uint8 age;
        string location;
        address adopter;
    }

    mapping(uint256 => Pet) public pets;

    // Adopting a pet
    function adopt(uint256 petId, string memory breed, uint8 age, string memory location) public returns (uint256) {
        require(petId >= 0 && petId <= 15, "Invalid pet ID");
        require(pets[petId].adopter == address(0), "Pet already adopted");

        pets[petId] = Pet(petId, breed, age, location, msg.sender);

        return petId;
    }

    // Retrieving the adopters
    function getAdopters() public view returns (address[16] memory) {
        address[16] memory adoptersArray;
        for (uint256 i = 0; i < 16; i++) {
            adoptersArray[i] = pets[i].adopter;
        }
        return adoptersArray;
    }

    // Retrieving pet information
    function getPet(uint256 petId) public view returns (uint256, string memory, uint8, string memory, address) {
        Pet memory pet = pets[petId];
        return (pet.id, pet.breed, pet.age, pet.location, pet.adopter);
    }
}
