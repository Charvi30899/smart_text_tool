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
<img width="1179" height="2556" alt="Simulator Screenshot - 16 - 2026-05-04 at 23 47 45" src="https://github.com/user-attachments/assets/e16f127a-c490-41be-a262-305c16205501" />
<img width="1179" height="2556" alt="Simulator Screenshot - 16 - 2026-05-04 at 23 55 39" src="https://github.com/user-attachments/assets/200cd252-30b8-402b-9c02-60c0a7b29bb7" />



## Architecture
- `lib/core/` — constants, enums
- `lib/data/` — Gemini repository
- `lib/bloc/` — BLoC events/states
- `lib/ui/` — screens and widgets
