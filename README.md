# README.md

# BeamMP Server Docker

Welcome to the most user-friendly, beginner-proof BeamMP server image in the galaxy 🚀

Run your own BeamMP multiplayer server quickly and easily with zero guesswork.

Designed for everyone – from total beginners to experienced sysadmins.

## ✨ Key highlights

✅ Quick setup: Just run `prepare.sh` and `docker-compose up`\
✅ Preloaded map configs: No manual config file creation needed\
✅ Beginner-focused docs: Explains what, why, and how for every step\
✅ Permission-safe: Uses your UID/GID to avoid file permission headaches\
✅ Highly configurable: Choose maps and settings via environment variables\
✅ Zero guesswork: Clean examples and comments throughout

---

## 🚀 Getting started

1. **Download and unpack the files**

```bash
wget https://github.com/Snekutaren/docker-beammp-server/releases/latest/download/beammp-server.tar.gz
tar -xzvf beammp-server.tar.gz
```

2. **Run prepare.sh to set up folders and permissions**

```bash
chmod +x prepare.sh
./prepare.sh
```

3. **Adjust your settings**

- Edit `docker-compose.yml`
- Add your BeamMP auth key (get it here: [https://keymaster.beammp.com/login](https://keymaster.beammp.com/login))
- Change map or other variables as needed (See Configuration below)

4. **Start your server**

```bash
docker-compose up -d
```
Or if you prefer to not use compose

```bash
sudo docker run -it -d --name beammp-server \
    -p 30814:30814/tcp \
    -p 30814:30814/udp \
    -v ./beammp-server:/beamroot/beammp \
    -e HOST_UID="1000" \
    -e HOST_GID="1000" \
    -e BEAMMP_AUTH_KEY="your-key-goes-here" \
    -e MAP_NAME="gridmap_v2" \
    snekutaren/beammp-server:latest
```

That’s it. You’re ready to play.

To get to server console
```bash
sudo docker attach beammp-server
```
Type "help" for options, and ctrl+c to exit server console (ctrl+c doesn't always work when using docker run)

---

## 📝 Configuration

- **Auth Key**: Required for server to appear on BeamMP.\
  Obtain yours at [https://keymaster.beammp.com/login](https://keymaster.beammp.com/login) and set it in `docker-compose.yml`.

- **Map selection**: Choose any map listed in configs. Defaults to `gridmap_v2`.

- <details>
  <summary><b>MAP LIST</b></summary>
  <ul>
    <li>automation_test_track</li>
    <li>cliff</li>
    <li>derby</li>
    <li>driver_training</li>
    <li>east_coast_usa</li>
    <li>gridmap_v2</li>
    <li>hirochi_raceway</li>
    <li>industrial</li>
    <li>italy</li>
    <li>johnson_valley</li>
    <li>jungle_rock_island</li>
    <li>small_island</li>
    <li>smallgrid</li>
    <li>utah</li>
    <li>west_coast_usa</li>
  </ul>
</details>

- **UID/GID**: Uses your host user’s UID/GID to prevent permission issues. Change in `docker-compose.yml` if needed (use `id` to find yours).

---

## 💡 Tips

- See example configs and full instructions in this repository.
- For troubleshooting, check your logs with:

```bash
docker-compose logs -f
```

- Restart the server easily with:

```bash
docker-compose restart
```

---

## 🤝 Contributing

Issues, suggestions, and PRs are welcome. Help make this the most robust, user-friendly BeamMP server setup in existence.

---

## 📄 License

MIT License. See [LICENSE](LICENSE) for details.

---

Enjoy driving with your friends. For questions, open an issue or contact me on GitHub!
