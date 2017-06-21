'use strict';

import React from 'react';
import ReactNative, {
  StyleSheet,
  Text,
  View,
  NavigatorIOS,
  TouchableOpacity,
  NativeModules,
} from 'react-native';
const Rating = require('./Rate');

const { AddRatingManager } = NativeModules;

class AddRatingApp extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      identifier: props.identifier,
      currentRating: props.currentRating,
    }
  }

  onRatingSelected(selectedRating, navigator) {
    this.setState({
      currentRating: selectedRating,
    });
    navigator.replace({
      component: MyScene,
          passProps: { 
            currentRating: this.state.currentRating,
            ratingSelectionHandler: this.onRatingSelected.bind(this)
          },
          title: 'Add Rating',
          titleTextColor: 'white',
          rightButtonTitle: 'Add',
          onRightButtonPress: () => {
            console.log('Save')
            AddRatingManager.save(
              this.props.rootTag,
              this.state.currentRating,
              this.state.identifier
            );
          },
          barTintColor: '#25507b',
          tintColor: 'white',
          leftButtonTitle: 'Cancel',
          onLeftButtonPress: () => AddRatingManager.dismissPresentedViewController(this.props.rootTag),
    })
  }

  render() {
    return (
      <NavigatorIOS
        debugOverlay={false}
        style={styles.container}
        initialRoute={{
          component: MyScene,
          passProps: { 
            currentRating: this.state.currentRating,
            ratingSelectionHandler: this.onRatingSelected.bind(this)
          },
          title: 'Add Rating',
          titleTextColor: 'white',
          rightButtonTitle: 'Add',
          onRightButtonPress: () => {
            console.log('Save')
            AddRatingManager.save(
              this.props.rootTag,
              this.state.currentRating,
              this.state.identifier
            );
          },
          barTintColor: '#25507b',
          tintColor: 'white',
          leftButtonTitle: 'Cancel',
          onLeftButtonPress: () => AddRatingManager.dismissPresentedViewController(this.props.rootTag),
        }}
      />
    );
  }
}

module.exports = AddRatingApp;

class MyScene extends React.Component {

  render() {
    console.log('My Scene rendered')
    return (
      <Rating
        rating={this.props.currentRating}
        navigator={this.props.navigator}
        ratingSelectionHandler={this.props.ratingSelectionHandler}
      />
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'green',
  },
  welcome: {
    fontSize: 20,
    color: 'white',
  },
});