using Telerik.WebAii.Controls.Html;
using Telerik.WebAii.Controls.Xaml;
using Telerik.WebAii.Controls.Xaml.Wpf;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

using ArtOfTest.Common.UnitTesting;
using ArtOfTest.WebAii.Core;
using ArtOfTest.WebAii.Controls.HtmlControls;
using ArtOfTest.WebAii.Controls.HtmlControls.HtmlAsserts;
using ArtOfTest.WebAii.Design;
using ArtOfTest.WebAii.Design.Execution;
using ArtOfTest.WebAii.ObjectModel;
using ArtOfTest.WebAii.Silverlight;
using ArtOfTest.WebAii.Silverlight.UI;


namespace Telerik_Demo_App
{

    //
    // You can add custom execution steps by simply
    // adding a void function and decorating it with the [CodedStep] 
    // attribute to the test method. 
    // Those steps will automatically show up in the test steps on save.
    //
    // The BaseWebAiiTest exposes all key objects that you can use
    // to access the current testcase context. [i.e. ActiveBrowser, Find ..etc]
    //
    // Data driven tests can use the Data[columnIndex] or Data["columnName"] 
    // to access data for a specific data iteration.
    //
    // Example:
    //
    // [CodedStep("MyCustom Step Description")]
    // public void MyCustomStep()
    // {
    //        // Custom code goes here
    //      ActiveBrowser.NavigateTo("http://www.google.com");
    //
    //        // Or
    //        ActiveBrowser.NavigateTo(Data["url"]);
    // }
    //
        

    public class Saving_a_New_Contact_with_valid_values_shows_user_on_grid : BaseWebAiiTest
    {
        #region [ Dynamic Pages Reference ]

        private Pages _pages;

        /// <summary>
        /// Gets the Pages object that has references
        /// to all the elements, frames or regions
        /// in this project.
        /// </summary>
        public Pages Pages
        {
            get
            {
                if (_pages == null)
                {
                    _pages = new Pages(Manager.Current);
                }
                return _pages;
            }
        }

        #endregion

        [CodedStep(@"New Coded Step")]
        public void Clear_foo_contacts_from_database()
        {
            ContactFactory.Delete_all_Foo_contacts_from_database();
        }
        
        // Add your test methods here...
    
        //[CodedStep(@"New Coded Step")]
        //public void Saving_a_New_Contact_with_valid_values_shows_user_on_grid_CodedStep()
        //{
            
            
            //THIS IS C# CODE HERE!!
            
            //stand up a web service call
            //call to delete the record we just made
        //}
    
        //[CodedStep(@"Validate user was correctly created in DB")]
        //public void Verify_new_record_appears_in_database()
        //{
            
            //// -- move these to a support framework / API
            //// open a connection to the database
            //// select newly created user from the database
            //// verify information is correct
            
            
            ////TestingFramework.ValidateNewUser(.....)
            
            ////Assert.AreSame();
        //}
    }
}
