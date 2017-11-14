const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  let newState;
  switch(action.type) {
    case 'SWITCH_CURRENCY':
      newState = {
        baseCurrency: action.baseCurrency,
        rates: action.rates
      };
      return newState;
    default:
      return state;
  }
};

export default reducer;
