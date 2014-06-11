
import 'dart:html';
import 'dart:js' as js;

js.JsObject _webview;
js.JsObject _contentWindow;

void main() {
  querySelector("#button1").onClick.listen(sendMessage);
  var webview_el = querySelector('webview');
  assert(webview_el != null);
  window.onMessage.listen(onMessage);
  _webview = new js.JsObject.fromBrowserObject(webview_el);
  _webview.callMethod('addEventListener', ['exit', _dispatch]);
  _webview.callMethod('addEventListener', ['loadabort', _dispatch]);
  _webview.callMethod('addEventListener', ['loadcommit', _dispatch]);
  _webview.callMethod('addEventListener', ['loadredirect', _dispatch]);
  _webview.callMethod('addEventListener', ['loadstart', _dispatch]);
  _webview.callMethod('addEventListener', ['loadstop', _dispatch]);
}

void _dispatch(e) {    
  e = new js.JsObject.fromBrowserObject(e); 
  print(e['type']);
  if(e['type'] == 'loadstop') {
      _contentWindow = _webview['contentWindow'];
      _contentWindow.callMethod('postMessage', ['test message', '*']);
  }
}

void sendMessage(MouseEvent event) {
  assert(_contentWindow != null);
  _contentWindow.callMethod('postMessage', ['Click!', '*']);  
}

void onMessage(MessageEvent e) {
  e.stopPropagation();
  print(e.toString());
  if ((e.data == null) || ( e.data == '')) return;
  print(e.data);
}


