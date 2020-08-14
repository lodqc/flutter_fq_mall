import 'package:flutter/cupertino.dart';
import 'package:flutter_fq_mall/bean/category_bean.dart';
import 'package:flutter_fq_mall/net/retrofit_client.dart';

class ClassifyModel extends ChangeNotifier {
  CategoryBean categoryBean;
  CategoryBean secondCategory;

  getFirstCategory() {
    RetrofitClient().getFirstCategory().then((value) {
      categoryBean = value;
      notifyListeners();
    });
  }
  getSecondCategory(int id,{Function callBack}) {
    RetrofitClient().getSecondCategory(id).then((value) {
      secondCategory = value;
      if(callBack!=null){
        callBack.call();
      }
      notifyListeners();
    });
  }

  selectClassiffy(int index) {
    getSecondCategory(categoryBean.data[index].id,callBack: (){
      categoryBean = CategoryBean()
        ..data = categoryBean.data
        ..index = index;
    });
  }
}
