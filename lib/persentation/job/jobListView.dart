import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itclub/data/job/JobService.dart';
import 'package:itclub/data/job/jobModel.dart';
import 'package:itclub/persentation/job/jobAddView.dart';
import 'package:itclub/persentation/resources/color_manager.dart';
import 'package:itclub/persentation/resources/routes_manager.dart';
import 'package:itclub/persentation/widget/jobCardWidget.dart';



class JobListView extends StatefulWidget {
  const JobListView({super.key});

  @override
  State<JobListView> createState() => _JobListViewState();
}

class _JobListViewState extends State<JobListView> {


  final JobService _jobService = JobService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (ctx) => JobAddView()));
        },


        child: Icon(Icons.add),
        backgroundColor: ColorManager.venus,
      ),

      appBar: AppBar(

        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.newhome);/// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.venus,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: Center(child: Text('Available Jobs',style: Theme.of(context).textTheme.labelLarge,)),
      ),

      body: Column(
        children: [
          FutureBuilder<List<JobModel>>(

            future: _jobService.jobListData(),


            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is being fetched
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // If an error occurs
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                // If no data is available
                return Center(child: Text('No jobs available'));
              } else {
                // If data is available, display the list of doctors
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      JobModel item = snapshot.data![index];
                      return JobCardWidget(item:item);
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
