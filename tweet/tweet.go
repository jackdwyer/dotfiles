package main

import (
	"github.com/dghubble/go-twitter/twitter"
	"github.com/dghubble/oauth1"
	"gopkg.in/ini.v1"
	"log"
	"fmt"
	"time"
	"os"
)


func main() {
	cfg := ini.Empty()
	err := cfg.Append(fmt.Sprintf("%s/.config/twitter/auth.conf", os.Getenv("HOME")))
	if err != nil {
		log.Fatalf("Failed to load config file")
	}

	consumer_key        := cfg.Section("twitter").Key("consumer_key").String()
	consumer_secret     := cfg.Section("twitter").Key("consumer_secret").String()
	access_token_key    := cfg.Section("twitter").Key("access_token_key").String()
	access_token_secret := cfg.Section("twitter").Key("access_token_secret").String()
	config := oauth1.NewConfig(consumer_key, consumer_secret)
	token := oauth1.NewToken(access_token_key, access_token_secret)

	httpClient := config.Client(oauth1.NoContext, token)
	client := twitter.NewClient(httpClient)
	client.Statuses.Update(fmt.Sprintf("Heart is beating #_%d", time.Now().Unix()), nil)
}
