enum TextAction {
  summarize,
  improve,
  translate,
  fixGrammar,
  makeFormal,
  makeCasual;

  String get label {
    switch (this) {
      case TextAction.summarize:
        return 'Summarize';
      case TextAction.improve:
        return 'Improve';
      case TextAction.translate:
        return 'Translate';
      case TextAction.fixGrammar:
        return 'Fix Grammar';
      case TextAction.makeFormal:
        return 'Make Formal';
      case TextAction.makeCasual:
        return 'Make Casual';
    }
  }

  String buildPrompt(String text) {
    switch (this) {
      case TextAction.summarize:
        return 'Summarize the following text concisely:\n\n$text';
      case TextAction.improve:
        return 'Improve the writing quality of the following text:\n\n$text';
      case TextAction.translate:
        return 'Translate the following text to English:\n\n$text';
      case TextAction.fixGrammar:
        return 'Fix all grammar and spelling errors in the following text:\n\n$text';
      case TextAction.makeFormal:
        return 'Rewrite the following text in a formal tone:\n\n$text';
      case TextAction.makeCasual:
        return 'Rewrite the following text in a casual, friendly tone:\n\n$text';
    }
  }
}
