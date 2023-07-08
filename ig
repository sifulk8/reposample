var SpreadsheetApp = SpreadsheetApp || require('google-apps-script').SpreadsheetApp;

function script() {
  var url = "https://scraper-api.smartproxy.com/v1/scrape";
  var headers = {
    "Accept": "application/json",
    "Authorization": "Basic UzAwMDAxMTAwMDA6UCRXMTMxMjczNzcxMTI2NjhkZjg3ZTM0NWIwNzNjNTY1YzEx",
    "Content-Type": "application/json"
  };

  var urls = [
    "https://www.instagram.com/reel/CtBdvTJhw1y/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBeSNxJvc2/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBd89KN0sU/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBee9ZrfoY/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBewYSJTjB/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBdj5QOdgx/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBfbkQO2gd/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBcXnNL6La/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBg4y9ukk0/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBgFRopIll/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBksgNO7uc/?igshid=ZWQyN2ExYTkwZQ==",
    "https://www.instagram.com/reel/CtBltbeA7SZ/?igshid=ZWQyN2ExYTkwZQ==",
    "https://www.instagram.com/reel/CtBmiUyJiaH/?igshid=MzRlODBiNWFlZA==",
    "https://www.instagram.com/reel/CtBb6nlO4wu/?igshid=ZWQyN2ExYTkwZQ==",
    "https://www.instagram.com/reel/CtBcRr_pjzT/?igshid=ZWQyN2ExYTkwZQ==",
    "https://www.instagram.com/reel/CtBdkv1gkWZ/?igshid=ZWQyN2ExYTkwZQ==",
    "https://www.instagram.com/reel/CtBgpvNAWg5/?igshid=MmJiY2I4NDBkZg==",
    "https://www.instagram.com/reel/CtBnzVcsHN6/?igshid=ZWQyN2ExYTkwZQ==",
  ];

  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var startRow = 2; // Starting row to populate data in the sheet

  for (var i = 0; i < urls.length; i++) {
    var payload = {
      "target": "instagram_reel",
      "url": urls[i],
      "locale": "en",
      "geo": "Indonesia"
    };

    var options = {
      "method": "POST",
      "headers": headers,
      "payload": JSON.stringify(payload)
    };

    var response = UrlFetchApp.fetch(url, options);
    var resultData = JSON.parse(response.getContentText());
    var desiredData_likes = resultData.data.content.likes;

    sheet.getRange("G" + (startRow + i)).setValue(desiredData_likes);
    Logger.log("Task completed!");
    Utilities.sleep(1 * 60 * 1000);
  }
}
