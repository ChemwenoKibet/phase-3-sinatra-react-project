import { useEffect, useState } from 'react';
import axios from 'axios';

const DisplayPets = () => {
  const [pets, setPets] = useState([]);
  const [newPetName, setNewPetName] = useState('');
  const [newPetBreed, setNewPetBreed] = useState('');
  const [newPetAge, setNewPetAge] = useState('');

  const handleAddPet = async () => {
    const result = await axios.post('http://localhost:9292/pets/addpet', {
      name: newPetName,
      breed: newPetBreed,
      age: newPetAge
    });
    setPets([...pets, result.data]);
    setNewPetName('');
    setNewPetBreed('');
    setNewPetAge('');
  };

  useEffect(() => {
    const fetchData = async () => {
      const result = await axios.get('http://localhost:9292/pets');
      setPets(result.data);
    };
    fetchData();
  }, []);

  return (
    <div className="centered">
      <nav>
        <button onClick={() => { window.location.href = 'http://localhost:3000/login' }}>Logout</button>
        </nav>
        <br />
        <nav>
        <form>
          <label htmlFor="search">Search:</label>
          <input type="text" />
          <button type="submit">Search</button>
        </form>
        <button>Delete Pet</button>
      </nav>

      {pets.map((pet) => (
        <div key={pet.id}>
          <p><strong>NAME: </strong>{pet.name}</p>
          <p><strong>BREED: </strong>{pet.breed}</p>
          <p><strong>AGE: </strong>{pet.age}</p>
          <button>Add Pet</button>
          <br />
        </div>
      ))}
      
      <div>
        <h2>Add a new pet:</h2>
        <form onSubmit={handleAddPet}>
          <label htmlFor="newPetName">Name:</label>
          <input type="text" id="newPetName" value={newPetName} onChange={(e) => setNewPetName(e.target.value)} />
          <label htmlFor="newPetBreed">Breed:</label>
          <input type="text" id="newPetBreed" value={newPetBreed} onChange={(e) => setNewPetBreed(e.target.value)} />
          <label htmlFor="newPetAge">Age:</label>
          <input type="number" id="newPetAge" value={newPetAge} onChange={(e) => setNewPetAge(e.target.value)} />
          <button type="submit">Add New Pet</button>
        </form>
      </div>
    </div>
  );
};

export default DisplayPets;




