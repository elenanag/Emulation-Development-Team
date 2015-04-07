<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="TicketingSystem.FAQs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:400px;"><img src="images/faqs.jpg" /></div>
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
    
    <h2 style="color:red; font-weight:bold;">What is Ticket System?</h2>
  <div>
    <p>
    The Support Ticket System is a mailing list that allows us to track support incidents for our products. 
     A support staff member will be assigned to each ticket. New tickets appear in the system as [Open]. 
     Dialog between the customer and the assigned staff member is tracked in our system until the issue has been solved to the customer's 
     satisfaction, or it is determined that it can't be solved. The ticket is then marked [Closed]. Replying to a closed ticket will automatically reopen it.
    </p>
  </div>

    <h2 style="color:red; font-weight:bold;">Do I have to be a customer to use this system?</h2>
  <div>
    <p>
        Yes. Registered customer requests will be higher priority and get solved much sooner. <br /> 
        However, questions will also be answered, if possible, by contacting us.
    </p>
  </div>

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


    <h2 style="color:red; font-weight:bold;">Receive out of memory error with plenty of memory?</h2>
  <div>
    <p>
        May not be enough conventional memory not system memory. The computers memory is broken into different sections. 
        While you may have enough memory which the program requires you may not have enough conventional, upper, high or extended memory.

    </p>
  </div>


    <h2 style="color:red; font-weight:bold;">I am getting a memory parity error when I boot up?</h2>
  <div>
    <p>
        •If it crashes as soon as you turn it on, you are probably trying to run non-parity memory in a parity system. Replace it.  <br />
        •Make sure parity checking wasn't accidentally turned on in BIOS with non-parity memory in the slots.
    </p>
  </div>

    <h2 style="color:red; font-weight:bold;">I am getting parity errors during normal operation of the PC?</h2>
  <div>
    <p>
        If you just get them every once in a while, i wouldn't fret over it. Sometimes little errors occur in memory. <br />
        If you seem to be getting these associated with random lockups, I would check the rest of the system because many things could be bad. 
        Sometimes improper cooling, for example, can cause random errors that may look like something else is awry. It is starts to happen a lot and these other things aren't a factor, then you probably need to replace your memory.
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
        According to Microsoft the problem occurs when either of the two scenarios apply: <br /><br />
        •The USB device contains an embedded USB hub. <br />
        •The embedded USB hub detects a device that is connected to the USB hub as being a non-removable device.
         The work-a-round for this issue is to shut your system down before you remove the USB device.
    </p>
  </div>


     <h2 style="color:red; font-weight:bold;">USB drive is not recognized?</h2>
  <div>
    <p>
       There are two methods that I have seen work for this issue: <br />
         Method #1: <br />
        Go to Start ->
        In the Search field, type in: device manager ->
        Open device manager and navigate to your USB controller ->
        Right click the drive and select Properties ->
        Be sure that the option for "Write Caching" is enabled
        <br />
        Method #2: <br />
        Navigate to Device Manager using the above instructions ->
        Right click and Delete all of your USB controllers ->
        Reboot Vista
    </p>
  </div>
</div>

</asp:Content>
