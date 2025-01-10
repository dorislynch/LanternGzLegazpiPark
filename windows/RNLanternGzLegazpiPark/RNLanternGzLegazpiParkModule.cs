using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Lantern.Gz.Legazpi.Park.RNLanternGzLegazpiPark
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNLanternGzLegazpiParkModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNLanternGzLegazpiParkModule"/>.
        /// </summary>
        internal RNLanternGzLegazpiParkModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNLanternGzLegazpiPark";
            }
        }
    }
}
