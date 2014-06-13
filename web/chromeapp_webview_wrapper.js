var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

"use strict";
window.WebviewWrapper = (function() {
    WebviewWrapper.prototype.element = null;

    function WebviewWrapper(element) {
        this.postMessage = __bind(this.postMessage, this);
        this.element = element;
        if (this.element == null) {
            throw new Error('option element required');
        }
        this;
    }

    WebviewWrapper.prototype.postMessage = function(message, targetOrigin) {
        return this.element.contentWindow.postMessage(message, targetOrigin);
    };

    return WebviewWrapper;

})();
