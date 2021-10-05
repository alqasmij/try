import 'package:flutter/material.dart';
import 'package:citylolo01/tools//toolsUtilities.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  //The controls of Text Editing
  TextEditingController nameTextControl = TextEditingController();
  TextEditingController phoneTextControl= TextEditingController();
  TextEditingController messageTitleTextControl= TextEditingController();
  TextEditingController contentTextControl= TextEditingController();

  @override
  void dispose() {
    nameTextControl.dispose();
    phoneTextControl.dispose();
    messageTitleTextControl.dispose();
    contentTextControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToolsUtilities.whiteColor,
      appBar: AppBar(
        title: Text('للتواصل معنا '),
        backgroundColor: ToolsUtilities.mainColor,
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: _contactUSCard(),
      ),
    );
  }

  Widget customTextField(String hitName,TextEditingController textEditingControl,int maxLine){
    return Padding(
      padding: const EdgeInsets.only(right:30,left: 30,top: 8),
      child: Container(
          child: TextField(
            maxLines: maxLine,
            controller:textEditingControl,
            decoration: InputDecoration(
              hoverColor: ToolsUtilities.secondColor,
              focusColor: ToolsUtilities.secondColor,
              focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(
                    color: ToolsUtilities.mainColor
                ),

              ),
              labelText: hitName,labelStyle: TextStyle(color: ToolsUtilities.secondColor),
            ),
          )),
    );
  }

  Widget _contactUSCard(){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ToolsUtilities.contactUsHeaderImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
        ),


        //name Of our Company or Brand
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
          child: Text('اتصل بنا ',style: TextStyle(color:ToolsUtilities.mainColor,fontSize: 20,fontWeight: FontWeight.bold),textAlign:TextAlign.start,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
          child: Text('ارسل رسالتك ',style: TextStyle(color:ToolsUtilities.secondColor,fontSize: 15),textAlign:TextAlign.start,),
        ),
        customTextField('الاسم',nameTextControl,1),
        customTextField('رقم الهاتف',phoneTextControl,1),
        customTextField('عنوان الرسالة',messageTitleTextControl,1),
        customTextField('نص الرسالة',contentTextControl,4),

        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width * 0.65,
            child: RaisedButton(onPressed: (){},
              color: ToolsUtilities.mainColor,
              elevation: 5,
              child: FlatButton.icon(onPressed: (){

                //Call Us via email
                var myEmail = ToolsUtilities.email;
                String subject = messageTitleTextControl.text;
                String body = "اسمي هو :" + nameTextControl.text + "\n " + " ورقم تلفوني هو: " + phoneTextControl.text + "\n " + contentTextControl.text;
                String mailUrl = Uri.encodeFull('mailto:$myEmail?subject=$subject&body=$body');
                customURlLaunch(mailUrl);

                nameTextControl.text = '';
                phoneTextControl.text = '';
                messageTitleTextControl.text = '';
                contentTextControl.text = '';



              }, icon: Icon(Icons.email,color: ToolsUtilities.whiteColor,), label: Text('ارسال بالبريد الإلكتروني',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: ToolsUtilities.whiteColor),)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),


            ),
          ),
        ),


      ],
    )
    );
  }


}
