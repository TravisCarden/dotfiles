module.exports = {
  defaultBrowser: "Google Chrome",
  // Find bundle IDs with this command:
  // $ osascript -e 'id of app "ReplaceWithAppName"'
  // @see https://superuser.com/q/346369/1109136
  handlers: [
    // Open links in Brave Browser when the option key is pressed.
    {
      match: ({ keys }) => keys.shift,
      browser: "com.brave.Browser"
    },
    // Open Mac app links in App Store app.
    {
      match: /apps.apple.com\/([^\/]*\/)?app\//,
      browser: "com.apple.AppStore"
    },
    // Open Zoom meeting links in Zoom app.
    {
      match: /zoom.us\/j\//,
      browser: "us.zoom.xos"
    }
  ]
};
