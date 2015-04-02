<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="TicketingSystem.FAQs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center"><img src="images/faqs.jpg" /></div>
    <br />

    <!doctype html>
  <meta charset="utf-8">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
      $(function () {
          $("#accordion").accordion();
      });
  </script>


<div id="accordion">

  <h2 style="color:red; font-weight:bold;">Monitor out of adjustment?</h2>
  <div>
    <p>
    It may be that your Monitor is simply out of adjustment if you are experiencing any of the following symptoms: <br />
    •Excessive black areas around the picture <br />
    •Parts of the picture are missing around the edges <br />
    •Picture scrolls up and down <br />
    •Incorrect colors <br />
    •Image is too dark or too bright.
    </p>
  </div>

  <h2 style="color:red; font-weight:bold;">Fixing stuck pixels on your LCD monitor?</h2>
  <div>
    <p>
    A dead pixel is defined as: A pixel in a LCD display that is not functioning correctly. 
    Incorrect function can either be that the pixel is stuck in the lighted position or does not light up at all. To identify a stuck pixel, you can use a small utility such as: <br />
    Dead Pixel Locator: <br />   
    Dead Pixel Locator displays the faulty pixel in a color that will stand out against the background color.
    To repair the stuck pixel, try this handy tool: <br />
    JScreenFix: <br />
    JScreenFix will help fix stuck pixels on LCD screens. Most stuck pixels are repaired within 20 minutes. 
    Some users have reported that JScreenFix can even fix dead pixels!
    </p>
  </div>

  <h2 style="color:red; font-weight:bold;">My USB flash drive won't work on one machine but works fine on another?</h2>
  <div>
    <p>
        1. Go to Start>> Right click My Computer>> Manage>> Disk Management <br />
        2. Check to ensure that there is a drive letter assigned to the drive. If there is not, right click the drive and select "Change". <br />
         Then, see if you can assign a drive letter to this drive.
    </p> 
  </div>

   <h2 style="color:red; font-weight:bold;">USB device does not appear in "Safely Remove Hardware"?</h2>
  <div>
    <p>
        According to Microsoft the problem occurs when either of the two scenarios apply: <br />
        •The USB device contains an embedded USB hub. <br />
        •The embedded USB hub detects a device that is connected to the USB hub as being a non-removable device. <br />
        The work-a-round for this issue is to shut your system down before you remove the USB device.
    </p>
  </div>

</div>

</asp:Content>
