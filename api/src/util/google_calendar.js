const { google } = require("googleapis");
const fs = require("fs");
const ical = require("node-ical");

// 認証情報ファイルのパス
const CREDENTIALS_PATH = "./credentials.json";

// 認証情報ファイルを読み込む
const credentials = JSON.parse(fs.readFileSync(CREDENTIALS_PATH));

// OAuth2クライアントを作成する
const { client_secret, client_id, redirect_uris } = credentials.web;
const oAuth2Client = new google.auth.OAuth2(
  client_id,
  client_secret,
  redirect_uris[0]
);

const MAX_RESULT = 250;

// https://developers.google.com/calendar/api/v3/reference/events/list?hl=ja
// カレンダーのイベントを取得する
// eslint-disable-next-line require-jsdoc
const listEvents = async (auth, email) => {
  const calendar = google.calendar({ version: "v3", auth });

  const res = await calendar.events.list({
    calendarId: email,
    timeMin: new Date().toISOString(),
    maxResults: MAX_RESULT,
    singleEvents: true,
    orderBy: "startTime",
  });

  const events = res.data.items;
  if (events.length) {
    console.log("Upcoming events count:" + events.length);
    return events;
  } else {
    console.log("No upcoming events found.");
    return [];
  }
};

// トークンを読み込む
const getUserCalendars = async (accessToken, email) => {
  try {
    oAuth2Client.setCredentials({access_token: accessToken});
    return await listEvents(oAuth2Client, email);
  } catch (e) {
    console.error("The API returned an error: " + e);
    return [];
  }
};

module.exports = {
  getUserCalendars,
};
