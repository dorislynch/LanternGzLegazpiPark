
# react-native-lantern-gz-legazpi-park

## Getting started

`$ npm install react-native-lantern-gz-legazpi-park --save`

### Mostly automatic installation

`$ react-native link react-native-lantern-gz-legazpi-park`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-lantern-gz-legazpi-park` and add `RNLanternGzLegazpiPark.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNLanternGzLegazpiPark.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNLanternGzLegazpiParkPackage;` to the imports at the top of the file
  - Add `new RNLanternGzLegazpiParkPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-lantern-gz-legazpi-park'
  	project(':react-native-lantern-gz-legazpi-park').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-lantern-gz-legazpi-park/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-lantern-gz-legazpi-park')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNLanternGzLegazpiPark.sln` in `node_modules/react-native-lantern-gz-legazpi-park/windows/RNLanternGzLegazpiPark.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Lantern.Gz.Legazpi.Park.RNLanternGzLegazpiPark;` to the usings at the top of the file
  - Add `new RNLanternGzLegazpiParkPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNLanternGzLegazpiPark from 'react-native-lantern-gz-legazpi-park';

// TODO: What to do with the module?
RNLanternGzLegazpiPark;
```
  