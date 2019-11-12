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
  handlers: [
    // Open Zoom meeting links in Zoom app.
    {
      match: /zoom.us\/j\//,
      browser: "us.zoom.xos"
    }
  ]
};
