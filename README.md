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

1. **Clone this repository**

```bash
git clone https://github.com/Snekutaren/docker-beammp-server.git
cd docker-beammp-server
```

2. **Run prepare.sh to set up folders and permissions**

```bash
chmod +x prepare.sh
./prepare.sh
```

3. **Adjust your settings**

- Edit `docker-compose.yml`
- Add your BeamMP auth key (get it here: [https://keymaster.beammp.com/login](https://keymaster.beammp.com/login))
- Change map or other variables as needed

4. **Start your server**

```bash
docker-compose up -d
```

That’s it. You’re ready to play.

---

## 📝 Configuration

- **Auth Key**: Required for server to appear on BeamMP.\
  Obtain yours at [https://keymaster.beammp.com/login](https://keymaster.beammp.com/login) and set it in `docker-compose.yml`.

- **Map selection**: Choose any map listed in configs. Defaults to `gridmap_v2`.

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
