# react-native-adyen2

## Getting started

`$ npm install react-native-adyen2 --save`

### Mostly automatic installation

`$ react-native link react-native-adyen2`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-adyen2` and add `Adyen2.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libAdyen2.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.reactlibrary.Adyen2Package;` to the imports at the top of the file
  - Add `new Adyen2Package()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-adyen2'
  	project(':react-native-adyen2').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-adyen2/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-adyen2')
  	```


## Usage
```javascript
import Adyen2 from 'react-native-adyen2';

// TODO: What to do with the module?
Adyen2;
```
