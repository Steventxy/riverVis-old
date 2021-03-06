/*
 * Copyright 2015-2017 WorldWind Contributors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @exports CompassLayer
 */
define([
        '../shapes/Compass',
        '../layer/RenderableLayer'
    ],
    function (Compass,
              RenderableLayer) {
        "use strict";

        /**
         * Constructs a compass layer.
         * @alias CompassLayer
         * @constructor
         * @augments RenderableLayer
         * @classdesc Displays a compass. Compass layers cannot be shared among WorldWindows. Each WorldWindow if it
         * is to have a compass layer must have its own. See the MultiWindow example for guidance.
         */
        var CompassLayer = function () {
            RenderableLayer.call(this, "指北针");

            this._compass = new Compass(null, null);

            this.addRenderable(this._compass);
        };

        CompassLayer.prototype = Object.create(RenderableLayer.prototype);

        Object.defineProperties(CompassLayer.prototype, {
            /**
             * The compass to display.
             * @type {Compass}
             * @default {@link Compass}
             * @memberof CompassLayer.prototype
             */
            compass: {
                get: function () {
                    return this._compass;
                },
                set: function (compass) {
                    if (compass && compass instanceof Compass) {
                        this.removeAllRenderables();
                        this.addRenderable(compass);
                        this._compass = compass;
                    }
                }
            }
        });

        return CompassLayer;
    });