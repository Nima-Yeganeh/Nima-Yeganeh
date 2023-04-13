# https://cloud.google.com/docs/authentication/provide-credentials-adc#how-to
# https://cloud.google.com/sdk/docs/install

# pip install google-auth google-auth-oauthlib google-auth-httplib2
# pip install google-api-python-client

import os
import google.auth
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from google.oauth2.credentials import Credentials

# Replace YOUR_CLIENT_ID and YOUR_CLIENT_SECRET with your own values
client_id = 'YOUR_CLIENT_ID'
client_secret = 'YOUR_CLIENT_SECRET'

# Replace YOUR_ACCESS_TOKEN and YOUR_REFRESH_TOKEN with your own values
access_token = 'YOUR_ACCESS_TOKEN'
refresh_token = 'YOUR_REFRESH_TOKEN'

# Set up the credentials object
creds = Credentials.from_authorized_user_info(info={
    'client_id': client_id,
    'client_secret': client_secret,
    'token_uri': 'https://oauth2.googleapis.com/token',
    'access_token': access_token,
    'refresh_token': refresh_token
})

# Use the credentials object to make API requests


# Enter the video file path and YouTube channel ID
video_file_path = 'path/to/your/video.mp4'
channel_id = 'your-channel-id'

# Authenticate and authorize the API request
# creds = None
# if os.path.exists('token.json'):
#     creds = Credentials.from_authorized_user_file('token.json', ['https://www.googleapis.com/auth/youtube.upload'])
# if not creds or not creds.valid:
#     flow = google.auth.default(scopes=['https://www.googleapis.com/auth/youtube.upload'])
#     creds = google.auth.credentials.Credentials.from_authorized_user_info(flow.run_local_server()['credentials'])
#     with open('token.json', 'w') as token:
#         token.write(creds.to_json())

# Build the YouTube API client
youtube = build('youtube', 'v3', credentials=creds)

# Upload the video
try:
    # Insert the video resource
    insert_request = youtube.videos().insert(
        part='snippet,status',
        body={
            'snippet': {
                'title': 'My Video Title',
                'description': 'This is a description of my video',
                'tags': ['tag1', 'tag2', 'tag3'],
                'categoryId': '22'
            },
            'status': {
                'privacyStatus': 'public'
            }
        },
        media_body=googleapiclient.http.MediaFileUpload(video_file_path, chunksize=-1, resumable=True)
    )

    # Execute the request
    response = insert_request.execute()

    # Add the video to the playlist
    playlist_items_insert_request = youtube.playlistItems().insert(
        part='snippet',
        body={
            'snippet': {
                'playlistId': channel_id,
                'resourceId': {
                    'kind': 'youtube#video',
                    'videoId': response['id']
                }
            }
        }
    )
    playlist_items_insert_request.execute()

    print('The video was uploaded and added to your channel.')
except HttpError as error:
    print(f'An HTTP error occurred: {error}')
