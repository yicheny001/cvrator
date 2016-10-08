import React, { Component } from 'react';
import axios from 'axios'
import './App.css';

class App extends Component {

  makeRequest(){
    axios.get('http://localhost:8081/scrape').then(response=>{
      debugger
      var parsedData = JSON.parse(response.data)
    })
  }

  render() {
    return (
      <div className="App">
      {this.makeRequest()}
      {parsedData.title}
      </div>
    );
  }
}

export default App;
