function Main()
{
  Preparation();
  var x = newOrder(); //x- количество заказов
  deleteOrder(x);
  cleanUp()
}

function Preparation() //запускаем программу
{
  TestedApps.Orders.Run();
}

function newOrder() //Создаем новые заказы и сравниваем имя
{  
  var driver = DDT.CSVDriver(Files.FileNameByName("Order.txt"));
  var j = 0; //переменная, для хранения текущего номера заказа
  while (!driver.EOF())
  {
      Aliases.ToolBar.ClickItem(4,false);
      for (var i = 1;  i < driver.Value(0);i++)
        Aliases.NewOrderForm.ProductQuantity.Up(); //записываем нужное количество, нажимая на кнопку "Up"
      Aliases.NewOrderForm.ProductCustomer.Click();
      Aliases.NewOrderForm.ProductCustomer.wText = driver.Value(0);//записываем имя
      Aliases.NewOrderForm.ProductStreet.Click();
      Aliases.NewOrderForm.ProductStreet.wText = driver.Value(1);//записываем улицу
      Aliases.NewOrderForm.ProductCity.Click();
      Aliases.NewOrderForm.ProductCity.wText = driver.Value(2);//записываем город
      Aliases.NewOrderForm.ProductState.Click();
      Aliases.NewOrderForm.ProductState.wText = driver.Value(3);//записываем страну
      Aliases.NewOrderForm.ProductZip.Click();
      Aliases.NewOrderForm.ProductZip.wText = driver.Value(4);//записываем индекс
      Aliases.NewOrderForm.ProductCardNum.Click();
      Aliases.NewOrderForm.ProductCardNum.wText = driver.Value(5);//записываем номер карты
      Aliases.NewOrderForm.OKButton.ClickButton(); //выходим из окна создания заказа  
      Aliases.OrdersList.SelectItem(j); //выбираем нужную строчку из списка заказов
      Delay(1000);
      if (Aliases.OrdersList.FocusedItem.Text.OleValue != driver.Value(0)) //сраниваем реальное и нужное нам значение
        Log.Error("The property value is incorrect!");
      else
        Log.Message("OK");
      driver.Next();
      j++;
  }
  DDT.CloseDriver("driver");
  return j;
}

function deleteOrder(j) //Удаляем все заказы
{               
  for (var i =0; i< j ; i++) 
  {
    Aliases.ToolBar.ClickItem(6, false);
    Aliases.OrdersApp.dlgConfirmation.btnYes.ClickButton();   
  }    
}

function cleanUp() //Закрываем приложение
{
  Aliases.OrdersApp.Close();
  Aliases.OrdersApp.dlgConfirmation.btnNo.ClickButton();    
}
