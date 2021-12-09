import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1 id="heading">Simple boilerplate for ReactJS Website hosted on S3 bucket and deployed using terrafomr and Github Actions</h1>
      </header>
    </div>
  );
}

export default App;
