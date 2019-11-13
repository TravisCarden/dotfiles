module.exports = {
  defaultBrowser: "Google Chrome",
  rewrite: [
    // Redirect Amazon links to Amazon Smile.
    {
      match: finicky.matchDomains(["amazon.com", "www.amazon.com"]),
      url: ({url}) => ({
        ...url,
        host: "smile.amazon.com"
      })
    }
  ],
  // Find bundle IDs with this command:
  // $ osascript -e 'id of app "ReplaceWithAppName"'
  // @see https://superuser.com/q/346369/1109136
  handlers: [
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
