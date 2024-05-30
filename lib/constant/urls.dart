
const String categoryUrl = 'https://opentdb.com/api_category.php';

String getQuestions(int categoryId, String difficulty) => 'https://opentdb.com/api.php?amount=10&category=$categoryId&difficulty=${difficulty.toLowerCase()}&type=multiple';