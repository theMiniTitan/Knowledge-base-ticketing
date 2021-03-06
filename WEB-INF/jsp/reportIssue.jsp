<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <jsp:include page="includes/defaultHead.jsp" />
</head>

<body>

<jsp:include page="includes/header.jsp" />

<div class="container">
    <div class="starter-template">
        <h1>Report Issue</h1>
        <p class="lead">Enter relevant details to report issue.</p>
    </div>
</div><!-- /.container -->

<!-- Big form for lots of inputs-->
<div class="container">
    <form class="form-horizontal" action="SubmittedReport" method="POST">
        <!-- Dropdown menu for category-->
        <div class="row">
            <div class="form-group">
                <label for="category" class="col-sm-2 col-sm-offset-3 control-label">Category*</label>
                    <div class="col-sm-3">
                    <select name="category" class="form-control" id="category">
                        <option value="SelectACategory">Select a category...</option>
                        <option class="main-category" value="network" disabled>Network</option>
                        <option value="cant-connect">&nbsp;&nbsp;Can't connect</option>
                        <option value="speed">&nbsp;&nbsp;Speed</option>
                        <option value="constant-dropouts">&nbsp;&nbsp;Constant dropouts</option>
                        <option value="network-other">&nbsp;&nbsp;Other...</option>
                        <option class="main-category" value="software" disabled>Software</option>
                        <option value="slow-to-load">&nbsp;&nbsp;Slow to load</option>
                        <option value="wont-load">&nbsp;&nbsp;Won't load at all</option>
                        <option value="software-other">&nbsp;&nbsp;Other...</option>
                        <option class="main-category" value="hardware" disabled>Hardware</option>
                        <option value="wont-turn-on">&nbsp;&nbsp;Computer won't turn on</option>
                        <option value="blue-screens">&nbsp;&nbsp;Computer "blue screens"</option>
                        <option value="disk-drive">&nbsp;&nbsp;Disk drive</option>
                        <option value="peripherals">&nbsp;&nbsp;Peripherals</option>
                        <option value="hardware-other">&nbsp;&nbsp;Other...</option>
                        <option class="main-category" value="email" disabled>Email</option>
                        <option value="cant-send">&nbsp;&nbsp;Can't send</option>
                        <option value="cant-receive">&nbsp;&nbsp;Can't receive</option>
                        <option value="spam-phishing">&nbsp;&nbsp;SPAM/Phishing</option>
                        <option value="email-other">&nbsp;&nbsp;Other...</option>
                        <option class="main-category" value="account" disabled>Account</option>
                        <option value="password-reset">&nbsp;&nbsp;Password reset</option>
                        <option value="wrong-details">&nbsp;&nbsp;Wrong details</option>
                        <option value="account-other">&nbsp;&nbsp;Other...</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 col-sm-offset-3 control-label">Title*</label>
                        <div class="col-sm-3">
                            <input name="title" type="text" class="form-control" id="title" placeholder="Title">
                        </div>
                    </div>
                </div>
        <div class="row">
            <div class="form-group">
                <label for="location" class="col-sm-2 col-sm-offset-3 control-label">Location</label>
                <div class="col-sm-3">
                    <input name="location" type="text" class="form-control" id="location" placeholder="Location">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="browser" class="col-sm-2 col-sm-offset-3 control-label">Browser</label>
                <div class="col-sm-3">
                    <input name="browser" type="text" class="form-control" id="browser" placeholder="Browser">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="failed-website" class="col-sm-2 col-sm-offset-3 control-label">Failed Website</label>
                <div class="col-sm-3">
                    <input name="website" type="url" class="form-control" id="failed-website" placeholder="Website Address">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label class="col-sm-2 col-sm-offset-3 control-label">Are you able to access internal websites?*</label>
                <div class="col-sm-3">
                    <label class="radio-inline">
                        <input type="radio" name="internalAccess" id="yes-internal" value="yes"> Yes
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="internalAccess" id="no-internal" value="no"> No
                    </label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label class="col-sm-2 col-sm-offset-3 control-label">Have you tried using an alternate browser?*</label>
                <div class="col-sm-3">
                    <label class="radio-inline">
                        <input type="radio" name="alternateBrowser" id="yes-alternate" value="yes"> Yes
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="alternateBrowser" id="no-alternate" value="no"> No
                    </label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label class="col-sm-2 col-sm-offset-3 control-label">Have you tried restarting your computer?*</label>
                <div class="col-sm-3">
                    <label class="radio-inline">
                        <input type="radio" name="computerRestart" id="yes-restart" value="yes"> Yes
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="computerRestart" id="no-restart" value="no"> No
                    </label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="description" class="col-sm-2 col-sm-offset-3 control-label">Problem Description*</label>
                <div class="col-sm-5">
                    <div class="input-group">
                        <textarea class="form-control custom-control" name="description" rows="3" cols="50" style="resize:none" id="description" placeholder="Enter a detailed description..."></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="error-message" class="col-sm-2 col-sm-offset-3 control-label">Error Message</label>
                <div class="col-sm-5">
                    <div class="input-group">
                        <textarea class="form-control custom-control" name="errorMessage" rows="3" cols="50" style="resize:none" id="error-message" placeholder="e.g. HTTP Error 404 Not Found"></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <div class="col-sm-2 col-sm-offset-5">
                    <button type="submit" class="btn btn-default" onclick="return validateReportIssue()">Submit Report</button>
                </div>
            </div>
        </div>
    </form>
</div>


<jsp:include page="includes/bootStrapCoreJS.jsp" />
<!-- For client side validation-->
<script src="js/validate.js"></script>

</body>

</html>