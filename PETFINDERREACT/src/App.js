// import './App.css';
// import DisplayPets from './components/DisplayPets';
// import LoginForm from './components/Login';
// import SignupForm from './components/Signup';
// import './index.css'
// import { BrowserRouter, Routes, Route} from 'react-router-dom' 

// function App() {
//   return (
//     <div className="App">
//       <BrowserRouter>
//       <Routes>
//         <Route path="/Login" element={<LoginForm />} />
//         <Route path="/Signup" element={<SignupForm />} />
//         <Route path="/pets" element={<DisplayPets />} />
//       </Routes>
//       </BrowserRouter>
      
//     </div>
//   );
// }

// export default App;

import './App.css';
import DisplayPets from './components/DisplayPets';
import LoginForm from './components/Login';
import SignupForm from './components/Signup';
import './index.css'
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<LoginForm />} />
          <Route path="/signup" element={<SignupForm />} />
          <Route path="/pets" element={<DisplayPets />} />
          <Route path="/*" element={<Navigate to="/login" />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
