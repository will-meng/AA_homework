import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {searchTerm: ''};
  }

  handleChange() {
    return e => {
      this.setState({ searchTerm: e.currentTarget.value });
    };
  }

  handleSubmit() {
    return e => {
      e.preventDefault();
      const searchTerm = this.state.searchTerm.split(' ').join('+');
      this.props.fetchSearchGiphys(searchTerm);
      this.setState({ searchTerm: '' });
    };
  }

  render() {
    return (
      <div>
        <form className="search-bar">
          <input type="text" onChange={this.handleChange()}
            value={this.state.searchTerm}/>
          <button type="submit" onClick={this.handleSubmit()}>
            Search Giphy</button>
        </form>
        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
