import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import '../pages/score_page.dart';


class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{

//  variables
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Cant live without Sidney ",true),
    new Question("You are urgly",true),
    new Question("No one likes you",true),
    new Question("you will be rich",false),
    new Question("Your parents know you are gay",true),
    new Question("You smoke",false)

  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overLayShouldBeVisible = false;


   @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
     isCorrect =  (currentQuestion.answer == answer);
     quiz.answer(answer);
     this.setState((){
       overLayShouldBeVisible = true;
     });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( //main page
          children:<Widget>[
           new AnswerButton(true, () => handleAnswer(true)),
           new QuestionText(questionText,questionNumber),
           new AnswerButton(false, () =>  handleAnswer(false))
          ],
        ),
        overLayShouldBeVisible == true ? new CorrectWrongOverlay(
            isCorrect,
            (){


              this.setState((){
                if(quiz.length == questionNumber){
                  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) =>  new ScorePage( quiz.score , quiz.length)),(Route route) => route == null);
                    return;
                }
                currentQuestion = quiz.nextQuestion;
                overLayShouldBeVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quiz.questionNumber;

              });

            }
        ) : new Container()
      ],
    );
  }
}