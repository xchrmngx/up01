using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для Edit.xaml
    /// </summary>
    public partial class Edit : Window
    {
        MasterFloor2Entities db = new MasterFloor2Entities();
        public Edit()
        {
            InitializeComponent();
        }
        private void button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = new MainWindow();
            window.Show();
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var partner = db.partners.FirstOrDefault(x=>x.id == partnerid.id);                  // указание айди данных
            var type = db.partnerType.FirstOrDefault(x => x.id == partner.id_partnerType);
            var adress = db.adress.FirstOrDefault(x => x.id == partner.id_adress);
            var contact = db.partnerContact.FirstOrDefault(x => x.id == partner.id_contact);

            var nameinput = director.Text;                              // разделение слов по пробелу для корректного сохранения данных
            var nameparts = nameinput.Split(' ')
                .Select(part => part.Trim())
                .ToArray();

            var addressinput = adres.Text;                              // разделение слов по запятым для корректного сохранения данных
            var addressparts = addressinput.Split(',')
                .Select(address => address.Trim())
                .ToArray();

            try
            {
                if (partner_name.Text != "" && combobox.Text != "" && rate.Text != "" && adres.Text != "" && phone.Text != "" && email.Text != "" && director.Text != "")
                {
                    contact.name = nameparts[1];
                    contact.lastname = nameparts[0];
                    contact.fathername = nameparts[2];
                    adress.postalCode = addressparts[0];
                    adress.area = addressparts[1];
                    adress.city = addressparts[2];
                    adress.street = addressparts[3];
                    adress.houseNumber = addressparts[4];
                    contact.telephone = phone.Text;
                    contact.email = email.Text;
                    partner.rating = Convert.ToInt32(rate.Text);
                    partner.id_partnerType = Convert.ToInt32(combobox.SelectedValue);
                    partner.id_adress = adress.id;
                    partner.id_contact = contact.id;
                    partner.name = partner_name.Text;
                    db.SaveChanges();
                    MessageBox.Show("Партнёр " + partner.name + " изменен");


                }
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            combobox.ItemsSource = db.partnerType.ToList();
            combobox.DisplayMemberPath = "name";
            combobox.SelectedValuePath = "id";

            try
            {
                partnerid prt = new partnerid();
                var partner = db.partners.FirstOrDefault(x => x.id == partnerid.id);
                var partnertype = db.partnerType.FirstOrDefault(x => x.id == partner.id_partnerType);
                var adress = db.adress.FirstOrDefault(x => x.id == partner.id_adress);
                var contact = db.partnerContact.FirstOrDefault(x => x.id == partner.id_contact);

                partner_name.Text = partner.name;
                combobox.Text = partnertype.name;
                rate.Text = partner.rating.ToString();
                adres.Text = adress.postalCode.ToString() + ", " + adress.area + ", "
                    + adress.city + ", " + adress.street + ", " + adress.houseNumber;
                director.Text = contact.lastname + " " + contact.name + " " + contact.fathername;
                phone.Text = contact.telephone;
                email.Text = contact.email;
            }
            catch(Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void director_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if ((e.Key < Key.A || e.Key > Key.Z) && e.Key != Key.Back && e.Key != Key.Space)
            {
                e.Handled = true;
            }
        }

        private void phone_PreviewKeyDown(object sender, KeyEventArgs e)
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
