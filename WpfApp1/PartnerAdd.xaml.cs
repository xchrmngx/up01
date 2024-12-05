using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для PartnerAdd.xaml
    /// </summary>
    public partial class PartnerAdd : Window
    {
        MasterFloor2Entities db = new MasterFloor2Entities();
        public PartnerAdd()
        {
            InitializeComponent();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            var addressInput = adres.Text;                  
            var addressParts = addressInput.Split(',')          // разделение слов с помощью запятой для корректного заполнения данных в бд
                .Select(part => part.Trim())
                .ToArray();

            var directorname = director.Text;
            var directorParts = directorname.Split(' ')         // разделение слов с помощью пробела для корректного заполнения данных в бд
                .Select(part => part.Trim())
                .ToArray();
            

            try
            {
                if (combobox.SelectedItem != null && partner_name.Text != "" && director.Text != ""
                && email.Text != "" && phone.Text != "" && adres.Text != "" && rate.Text != "")             // проверка отсутствия отсутствования данных в элементах ввода информации
                {
                    if (email.Text.Contains("@") && email.Text.Contains(".ru") || email.Text.Contains(".com"))  // проверка на наличие символов в поле ввода для почты
                    {
                        if (addressParts.Length !=5)                    // если адрес введен не полностью (меньше 5 слов)
                        {
                            MessageBox.Show("Введите адресс корректно");
                        }
                        else if (directorParts.Length != 3)             // если фио директора введено не полностью
                        {
                            MessageBox.Show("Введите ФИО директора полностью");
                        }
                        else
                        {
                            var contacts = new partnerContact
                            {
                                email = email.Text,                                 // разделение слов по пробелам и последующее сохранение конкретных данных в бд
                                telephone = phone.Text,
                                fathername = directorParts[0],
                                name = directorParts[1],
                                lastname = directorParts[2]
                            };

                            var adress = new adress
                            {
                                postalCode = addressParts[0],            // разделение слов по запятой и последующее сохранение конкретных данных в бд
                                area = addressParts[1],
                                city = addressParts[2],
                                street = addressParts[3],
                                houseNumber = addressParts[4],
                            };
                            var user = new partners
                            {
                                name = partner_name.Text,
                                rating = Convert.ToInt32(rate.Text),
                                id_adress = adress.id,
                                id_contact = contacts.id,
                                id_partnerType = (int)combobox.SelectedValue,
                                inn = inn.Text
                            };
                            db.adress.Add(adress);                                      // добавление всех данных в нужные таблицы
                            db.partnerContact.Add(contacts);
                            db.partners.Add(user);
                            db.SaveChanges();
                            MessageBox.Show("партнер добавлен");
                        }
                            
                    }
                    else
                    {
                        MessageBox.Show("Проверьте корректность ввода электронного адреса");
                    }
                }
                else
                {
                    MessageBox.Show("Заполните все поля");
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }



        private void phone_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if ((e.Key < Key.D0 || e.Key > Key.D9) && e.Key != Key.Back)
            {
                e.Handled = true;
            }
        }


        private void director_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if ((e.Key < Key.A || e.Key > Key.Z) && e.Key != Key.Back && e.Key != Key.Space)
            {
                e.Handled = true;
            }
        }

        private void combobox_Loaded(object sender, RoutedEventArgs e)
        {
            combobox.ItemsSource = db.partnerType.ToList();
            combobox.DisplayMemberPath = "name";
            combobox.SelectedValuePath = "id";
        }

        private void button2_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = new MainWindow();
            window.Show();
            this.Close();
        }

        private void inn_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if ((e.Key < Key.D0 || e.Key > Key.D9) && e.Key != Key.Back)
            {
                e.Handled = true;
            }
        }

        private void rate_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if ((e.Key < Key.D0 || e.Key > Key.D9) && e.Key != Key.Back)
            {
                e.Handled = true;
            }
        }
    }
}
