import './App.css';
import DisplayPets from './components/DisplayPets';
import LoginForm from './components/Login';
import SignupForm from './components/Signup';
import './index.css'
import { BrowserRouter, Routes, Route} from 'react-router-dom' 

function App() {
  return (
    <div className="App">
      <BrowserRouter>
      <Routes>
        <Route path="/Login" element={<LoginForm />} />
        <Route path="/Signup" element={<SignupForm />} />
        <Route path="/pets" element={<DisplayPets />} />
      </Routes>
      </BrowserRouter>
      
    </div>
  );
}

export default App;
