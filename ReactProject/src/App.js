  import logo from './logo.svg';
  import './App.css';
  import { BrowserRouter, Route, Routes } from 'react-router-dom';
  import MoviesList from './Components/MoviesList';
  import NewMovie from './Components/NewMovie';
  import Details from './Components/Details';
  import EditList from './Components/EditList';

  function App() {
    
    return (
      <div className="App">
        <div>
          
        </div>
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<MoviesList />} />
            <Route path="/Components/NewMovie" element={<NewMovie />} />
            <Route path="/Components/NewMovie/Details/:id" element={<Details />} />
            <Route path="/Components/NewMovie/EditList/:id" element={<EditList />} />
          </Routes>
        </BrowserRouter>
      </div>
    );
  }

  export default App;
