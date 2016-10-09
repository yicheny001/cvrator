import React, { Component } from 'react';
import axios from 'axios'
import './App.css';

const ROOT_URL = 'http://localhost:3000'

class App extends Component {

  makeRequest(){
    axios.get(`${ROOT_URL}/angelika`).then(response=>{
      let parsedData = response.data
      parsedData.playingTitles.map((movie)=>{
        console.log(movie)
        return <div> {movie} </div>
      })
    })
  }

  render() {
    return (
      <div className="App">
      <div>NOW PLAYING:</div>
      {this.makeRequest()}
      </div>
    );
  }
}

export default App;
