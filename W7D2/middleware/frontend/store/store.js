import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState,
    applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  console.log('Old State: ', store.getState());
  console.log('Action: ', action);
  next(action);
  console.log('New State: ', store.getState());
};

export default configureStore;
