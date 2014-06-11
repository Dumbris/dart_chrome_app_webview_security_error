
chrome.app.runtime.onLaunched.addListener(function(launchData) {
  chrome.app.window.create('test_webview.html', {
    'id': '_mainWindow', 'bounds': {'width': 800, 'height': 600 }
  });
});
