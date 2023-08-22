
class Quiz {
  String category;
  String question;
  bool correctAnswer;

  Quiz(this.category, this.question, this.correctAnswer);

  static List<Quiz> samples = [
    Quiz("History", "The first televised presidential debate was between Jimmy Carter and Gerald Ford.", false),
    Quiz("Sports", "Soccer player Cristiano Ronaldo opened a museum dedicated to himself.", true),
    Quiz("Entertainment: Video Games", "In the game \"Melty Blood Actress Again Current Code\", you can enter Blood Heat mode in Half Moon style.", false),
    Quiz("History", "Brezhnev was the 5th leader of the USSR.", true),
    Quiz("Politics", "Russia passed a law in 2013 which outlaws telling children that homosexuals exist.", true),
    Quiz("Vehicles", "When BMW was established in 1916, it was producing automobiles.", false),
    Quiz("Geography", "\"Mongolia\" was a part of the now non-existent U.S.S.R.", false),
    Quiz("History", "The United States of America declared their independence from the British Empire on July 4th, 1776.", true),
    Quiz("Entertainment: Japanese Anime & Manga", "Throughout the entirety of \"Dragon Ball Z\", Goku only kills two characters: a miniboss named Yakon and Kid Buu.", true),
    Quiz("Entertainment: Video Games", "The names of Tom Nook&#039;s cousins in the Animal Crossing franchise are named \"Timmy\" and \"Jimmy\".", false),
    Quiz("Entertainment: Video Games", "In Pok&eacute;mon Sun and Moon, a male Salandit can evolve to a Salazzle.", false),
    Quiz("General Knowledge", "Fast food restaurant chains Carl&#039;s Jr. and Hardee&#039;s are owned by the same company.", true),
    Quiz("History", "Kublai Khan is the grandchild of Genghis Khan?", true),
    Quiz("Entertainment: Film", "Actor Tommy Chong served prison time.", true),
    Quiz("General Knowledge", "The scientific name for the Southern Lights is Aurora Australis?", true),
    Quiz("Entertainment: Television", "An episode of \"The Simpsons\" is dedicated to Moe Szyslak&#039;s bar rag.", true),
    Quiz("Mythology", "Janus was the Roman god of doorways and passageways.", true),
    Quiz("General Knowledge", "Vietnam&#039;s national flag is a red star in front of a yellow background.", false),
    Quiz("Entertainment: Music", "John Williams composed the music for \"Star Wars\".", true),
    Quiz("Entertainment: Video Games", "In the video game \"Splatoon\", the playable characters were originally going to be rabbits instead of squids.", true),
  ];
}