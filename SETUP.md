# XREAL Companion — Project Setup Notes

## Install Flutter SDK (required once)

Flutter is not yet installed on this machine.
Run the following to install it via Homebrew:

```bash
brew install --cask flutter
# Verify
flutter doctor
```

Or download from https://docs.flutter.dev/get-started/install/macos

Then, from the project root, run:

```bash
flutter pub get
```

---

## Activate the Python virtual environment

```bash
source .venv/bin/activate
```

## Start the Django dev server

```bash
cd backend
python manage.py runserver
```

## Start Django Channels (WebSocket) — needs Redis running

```bash
# Start Redis (if not already running)
brew services start redis

# Then run the ASGI server
cd backend
uvicorn config.asgi:application --reload
```

## Run Celery worker

```bash
cd backend
celery -A config worker --loglevel=info
```
