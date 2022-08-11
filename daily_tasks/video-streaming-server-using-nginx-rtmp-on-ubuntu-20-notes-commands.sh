# video-streaming-server-using-nginx-rtmp-on-ubuntu-20
# Most modern streaming tools support the RTMP protocol, which defines the basic parameters of an internet video stream. The Nginx web server includes a module that allows you to provide an RTMP stream with minimal configuration from a dedicated URL, just like it provides HTTP access to web pages by default. The Nginx RTMP module isn’t included automatically with Nginx, but on Ubuntu 20.04 and most other Linux distributions you can install it as an additional package.

sudo apt update
sudo apt install libnginx-mod-rtmp

# Installing the module won’t automatically start providing a stream. You’ll need to add a configuration block to your Nginx configuration file that defines where and how the stream will be available.

# Using nano or your favorite text editor, open Nginx’s main configuration file, /etc/nginx/nginx.conf, and add this configuration block to the end of the file:
sudo nano /etc/nginx/nginx.conf
sudo vi /etc/nginx/nginx.conf

rtmp {
        server {
                listen 1935;
                chunk_size 4096;
                allow publish 127.0.0.1;
                deny publish all;

                application live {
                        live on;
                        record off;
                }
        }
}

# listen 1935 means that RTMP will be listening for connections on port 1935, which is standard.
# chunk_size 4096 means that RTMP will be sending data in 4KB blocks, which is also standard.
# allow publish 127.0.0.1 and deny publish all mean that the server will only allow video to be published from the same server, to avoid any other users pushing their own streams.
# application live defines an application block that will be available at the /live URL path.
# live on enables live mode so that multiple users can connect to your stream concurrently, a baseline assumption of video streaming.
# record off disables Nginx-RTMP’s recording functionality, so that all streams are not separately saved to disk by default.

# This provides the beginning of your RTMP configuration. By default, it listens on port 1935, which means you’ll need to open that port in your firewall. If you configured ufw as part of your initial server setup run the following command.

sudo ufw allow 1935/tcp
sudo systemctl reload nginx.service

systemctl status nginx.service
journalctl -xeu nginx.service

# There are multiple ways to send video to your RTMP server. One option is to use ffmpeg, a popular command line audio-video utility, to play a video file directly on your server. If you don’t have a video file already on the server, you can download one using youtube-dl, a command line tool for capturing video from streaming platforms like YouTube. In order to use youtube-dl, you’ll need an up to date Python installation on your server as well.

sudo apt install python3-pip
pip install youtube-dl
sudo apt install ffmpeg

ffmpeg -re -i "test.mkv" -c:v copy -c:a aac -ar 44100 -ac 1 -f flv rtmp://localhost/live/stream

# This ffmpeg command is doing a few things to prepare the video for a streaming-friendly format. This isn’t an ffmpeg tutorial, so you don’t need to examine it too closely, but you can understand the various options as follows:
# -re specifies that input will be read at its native framerate.
# -i "Introducing App Platform by DigitalOcean-iom_nhYQIYk.mkv" specifies the path to our input file.
# -c:v is set to copy, meaning that you’re copying over the video format you got from YouTube natively.
# -c:a has other parameters, namely aac -ar 44100 -ac 1, because you need to resample the audio to an RTMP-friendly format. aac is a widely supported audio codec, 44100 hz is a common frequency, and -ac 1 specifies the first version of the AAC spec for compatibility purposes.
# -f flv wraps the video in an flv format container for maximum compatibility with RTMP.
# The video is sent to rtmp://localhost/live/stream because you defined the live configuration block in Step 1, and stream is an arbitrarily chosen URL for this video.

# While ffmpeg is running, you can connect to your RTMP stream from a video player. If you have VLC, mpv, or another media player installed locally, you should be able to view your stream by opening the URL rtmp://your_domain/live/stream in your media player. Your stream will terminate after ffmpeg has finished playing the video. If you want it to keep looping indefinitely, you can add -stream_loop -1 to the beginning of your ffmpeg command.

# Now that you have Nginx configured to stream video using the Nginx-RTMP module, a common next step is to enable the RTMP statistics page. Rather than adding more and more configuration details to your main nginx.conf file, Nginx allows you to add per-site configurations to individual files in a subdirectory called sites-available/. In this case, you’ll create one called rtmp:

sudo nano /etc/nginx/sites-available/rtmp

server {
    listen 8080;
    server_name  localhost;

    # rtmp stat
    location /stat {
        rtmp_stat all;
        rtmp_stat_stylesheet stat.xsl;
    }
    location /stat.xsl {
        root /var/www/html/rtmp;
    }

    # rtmp control
    location /control {
        rtmp_control all;
    }
}

# The stat.xsl file from this configuration block is used to style and display an RTMP statistics page in your browser. It is provided by the libnginx-mod-rtmp library that you installed earlier, but it comes zipped up by default, so you will need to unzip it and put it in the /var/www/html/rtmp directory to match the above configuration.

sudo mkdir /var/www/html/rtmp
sudo gunzip -c /usr/share/doc/libnginx-mod-rtmp/examples/stat.xsl.gz > /var/www/html/rtmp/stat.xsl

sudo ufw allow from your_ip_address to any port http-alt
sudo ln -s /etc/nginx/sites-available/rtmp /etc/nginx/sites-enabled/rtmp

sudo systemctl reload nginx.service

# You should now be able to go to http://your_domain:8080/stat in a browser to see the RTMP statistics page. Visit and refresh the page while streaming video and watch as the stream statistics change.

# As a final step, you may want to add support for newer streaming protocols so that users can stream video from your server using a web browser directly. There are two protocols that you can use to create HTTP-based video streams: Apple’s HLS and MPEG DASH. They both have advantages and disadvantages, so you will probably want to support both.

# The Nginx-RTMP module supports both standards. To add HLS and DASH support to your server, you will need to modify the rtmp block in your nginx.conf file. Open /etc/nginx/nginx.conf using nano or your preferred editor, then add the following highlighted directives:

sudo nano /etc/nginx/nginx.conf

. . .
rtmp {
        server {
. . .
                application live {
                    	live on;
                    	record off;
                        hls on;
                        hls_path /var/www/html/stream/hls;
                        hls_fragment 3;
                        hls_playlist_length 60;

                        dash on;
                        dash_path /var/www/html/stream/dash;
                }
        }
}
. . .

sudo nano /etc/nginx/sites-available/rtmp

. . .
server {
    listen 8088;

    location / {
        add_header Access-Control-Allow-Origin *;
        root /var/www/html/stream;
    }
}

types {
    application/dash+xml mpd;
}

sudo ufw allow 8088/tcp
sudo mkdir /var/www/html/stream
sudo systemctl reload nginx

