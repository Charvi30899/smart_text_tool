# Smart Text Tool 🤖

An AI-powered Flutter app that processes text using Google Gemini API.

## Features

- Summarize long text
- Improve writing quality
- Translate to Hindi
- Fix grammar
- Make text formal or casual

## Tech Stack

- **Flutter** — UI framework
- **BLoC** — state management
- **Gemini API** — AI processing
- **Clean Architecture** — UI → BLoC → Repository → API

## Setup

1. Clone the repo
2. Get a free Gemini API key from [Google AI Studio](https://aistudio.google.com)
3. Create `.env` file in root:
GEMINI_API_KEY=your_key_here
4. Run `flutter pub get`
5. Run `flutter run`

## Screenshots


## Architecture
- `lib/core/` — constants, enums
- `lib/data/` — Gemini repository
- `lib/bloc/` — BLoC events/states
- `lib/ui/` — screens and widgets