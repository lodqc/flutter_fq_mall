import 'package:flutter/cupertino.dart';
import 'package:flutter_fq_mall/bean/category_bean.dart';
import 'package:flutter_fq_mall/net/retrofit_client.dart';

class ClassifyModel extends ChangeNotifier {
  CategoryBean categoryBean;
  CategoryBean secondCategory;
  CategoryData currentBean;

  getFirstCategory() {
    RetrofitClient().getFirstCategory().then((value) {
      categoryBean = value;
      currentBean = categoryBean.data[0];
      getSecondCategory();
    });
  }
  getSecondCategory({Function callBack}) {
    RetrofitClient().getSecondCategory(currentBean.id).then((value) {
      secondCategory = value;
      if(callBack!=null){
        callBack.call();
      }
      notifyListeners();
    });
  }

  selectClassiffy(int index) {
    currentBean = categoryBean.data[index];
    getSecondCategory(callBack: (){
      categoryBean = CategoryBean()
        ..data = categoryBean.data
        ..index = index;
    });
  }
}
