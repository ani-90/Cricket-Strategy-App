# Cricket Strategizer

A Flutter app for cricket analytics — live scores, career-record leaderboards, statistical player comparison, and a natural-language Q&A interface over match context.

Built as a capstone project. Runs on Android, iOS, web, and desktop from a single Dart codebase.

---

## What it does

**Live scores** — Current international fixtures pulled from the CricAPI `currentMatches` endpoint, rendered as a swipeable carousel with per-innings scorecards (runs, wickets, overs, batter and bowler breakdowns for all four innings of a Test).

**Leaderboards** — Top run-scorers and top wicket-takers for the ICC World Test Championship cycle, scraped from public records pages and parsed into a sortable list with average, strike rate, and match count.

**Team standings** — WTC points-percentage table across the nine Test-playing nations.

**Player similarity** — Loads career batting records from a bundled CSV (Tests / ODI / T20, ~3,000 players), builds a numeric vector per player from matches, innings, runs, average, strike rate, and centuries, and ranks the three most similar players by cosine similarity. Enter a name, get the closest statistical analogues.

**Q&A interface** — A context-and-question form that posts to an extractive question-answering model served over HTTP. Paste a passage of match commentary or a player profile, ask a question in plain English, get the answer span back.

---

## Architecture

```
Flutter (Dart)
├── lib/livescores/      CricAPI client + innings scorecards
├── lib/statistics/      batting / bowling / team leaderboards (HTTP + HTML parsing)
├── lib/Comparisons/     CSV load → feature vectors → cosine similarity
├── lib/chat interface/  QA client (POST context+question → answer)
└── lib/styles/          shared text and colour tokens
```

The QA model runs outside this repo as a separate Python service exposing a single `POST /` endpoint that accepts `{"context": ..., "question": ...}` and returns `{"answer": ...}`. Any extractive QA model works — the app only depends on that contract.

**Data sources**

| Source | Used for | Type |
|---|---|---|
| CricAPI | Live and recent match scores | REST |
| Public records pages | WTC batting / bowling leaderboards | HTML scrape |
| `assets/{test,ODI data,t20}.csv` | Career records for similarity search | Bundled |
| Self-hosted QA service | Natural-language answers | REST |

---

## Tech stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3.x, Dart SDK ≥ 3.2 |
| Charts | `syncfusion_flutter_charts`, `fl_chart`, `wagon_wheel` |
| Networking | `http` |
| Data | `csv`, `excel` |
| UI | `carousel_slider`, `flutter_native_splash`, Material 3 |

---

## Setup

**Prerequisites:** Flutter 3.x, and a free [CricAPI](https://cricapi.com) key for live scores.

```bash
git clone https://github.com/ani-90/Cricket-Strategy-App.git
cd Cricket-Strategy-App
flutter pub get
```

Supply your API key at run time rather than hardcoding it:

```bash
flutter run --dart-define=CRICAPI_KEY=your_key_here
```

Read it in Dart with:

```dart
const apiKey = String.fromEnvironment('CRICAPI_KEY');
```

**Q&A endpoint.** Set the base URL of your QA service the same way:

```bash
flutter run --dart-define=QA_ENDPOINT=https://your-service-url
```

The service must accept `POST` with a JSON body of `context` and `question` and return JSON containing `answer`.

**Build a release APK:**

```bash
flutter build apk --release --dart-define=CRICAPI_KEY=your_key
```

---

## Design notes

**Why cosine similarity over a trained model?** Player comparison needs to answer "who else bats like this" from six career aggregates. With features on wildly different scales — matches in the hundreds, average in the tens, strike rate around 80 — direction in feature space captures playing profile better than absolute distance, and it needs no training data, no labels, and no inference cost. A K-nearest-neighbours model would produce nearly identical rankings with a training step attached.

**Why bundle CSVs instead of hitting an API?** Career records are effectively static — a player's Test average moves a few hundredths a year. Shipping ~460 KB of CSV removes a network dependency from the app's most-used screen and makes similarity search work offline.

**Why scrape leaderboards?** No free API exposes WTC-cycle records. Scraping is fragile by nature; the failure is contained to one screen and degrades to an empty list rather than crashing the app.


## Licence

MIT
