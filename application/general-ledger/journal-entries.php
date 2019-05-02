<?php
    include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
    include("../../config/checklogin.php");
    include("../../config/functions.php");
?>

<div class='header-page' >
    <div class='header-page-inner'>
        Journal Entries
    </div>

</div>
<div class="container-fluid">
    <div class="pageContent">
        <div class="panel panel-primary mypanel">
            <div class="panel-body">
       
                <div class='transaction-wrapper journalentries-content'>

                        <div class='col-md-12 no-padding margin-bottom-sm topbuttonsdiv'>
                            <div class='padded-with-border-engraved topbuttonswrapper'>
                                <div class='button-group'>
                                    <div class='button-group-btn active' title='New' id='journalentries-trans-newbtn' data-toggle='modal' href='#newjournalentriesmodal'>
                                        <img src="../resources/img/add.png">
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class='journalentries-inputfields'>
                                <input type='hidden' id='pgtxnjournalentries-id'>
                                <div class='col-lg-2'>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <div class='col-md-12'>
                                                <label class='control-label'>Journal ID</label>
                                                <input type='text' class='form-input form-control transactionnumber' value='00000000001'>
                                            </div>
                                                
                                        </div>
                                    </div>
                                    <div class="firstprevnextlastbtn">
                                        <div class="btn-group btn-group-justified btn-group-sm margin-bottom-xs stock-item-refbuttons" role="group" aria-label="...">
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-default stock-item-firstbtn" data-info='first'>
                                                    <span class="glyphicon glyphicon-fast-backward" aria-hidden="true"></span>
                                                </button>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-default" data-info='second'>
                                                    <span class="glyphicon glyphicon-backward" aria-hidden="true"></span>
                                                </button>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-default" data-info='third'>
                                                    <span class="glyphicon glyphicon-forward" aria-hidden="true"></span>
                                                </button>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-default" data-info='fourth'>
                                                    <span class="glyphicon glyphicon-fast-forward" aria-hidden="true"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class='transaction-status-div margin-bottom-xs statusdiv'>LOGGED</div>
                                    <div class='button-group-btn fluid searchbtn active' data-toggle='modal' href='#journalentries-searchmodallookup'>
                                        <!--<i class='fa fa-search fa-lg fa-space'></i>-->
                                        <img src="../resources/img/search.png">&nbsp;&nbsp;Search
                                    </div>
                                    <br>
                                </div>
                                <div class="col-lg-10">

                                    <div class='col-md-12 no-padding margin-bottom-xs margin-top-sm'>

                                        <div class="panel-group classictheme margin-bottom-sm" id="journalentries-paneldetails-wrapper" role="tablist" aria-multiselectable="true">

                                            <div class="panel panel-default">
                                                <div class="panel-heading" role="tab" data-toggle="collapse" href="#journalentries-paneldetails">
                                                    &nbsp;
                                                </div>
                                                <div id="journalentries-paneldetails" class="panel-collapse collapse in" role="tabpanel">
                                                    <div class="panel-body">
                                                        <div class='row'>
                                                            <div class="col-md-12">
                                                                <div class="details-errordiv"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-horizontal">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Journal Type</label>
                                                                    <div class="col-lg-9">
                                                                        <input type='text' class='form-control journalentries-journaltype alwaysdisabled' disabled="true" value='General Journal'>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Transaction Type</label>
                                                                    <div class="col-lg-9">
                                                                        <input type='text' class='form-control journalentries-transactiontype alwaysdisabled' disabled="true" value='Credit Memo'>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Reference</label>
                                                                    <div class="col-lg-9">
                                                                        <input type='text' class='form-control journalentries-reference alwaysdisabled' disabled="true" value='CM00002391'>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Description</label>
                                                                    <div class="col-lg-9">
                                                                        <textarea class='form-control alwaysdisabled journalentries-description' disabled="true" rows='3'></textarea>
                                                                    </div>
                                                                </div>
                                                                <!--<div class="form-group">
                                                                    <label class='control-label col-lg-3'></label>
                                                                    <div class="col-lg-9">
                                                                            
                                                                            <input type='checkbox' class='journalentries-closed' > <span class='' style='font-size: 12px; font-weight: 600'>&nbsp;Closed</span>
                                                                    </div>
                                                                </div>-->




                                                            </div>
                                                            <div class='col-md-6'>
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Date</label>
                                                                    <div class="col-lg-9">
                                                                        <input type='text' class='form-control journalentries-date alwaysdisabled' disabled="true" value='09/12/2018'>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Debit Amount</label>
                                                                    <div class="col-lg-9">
                                                                        <input type='text' class='form-control journalentries-debitamount alwaysdisabled' disabled="true" value='22,224.7800'>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Credit Amount</label>
                                                                    <div class="col-lg-9">
                                                                        <input type='text' class='form-control journalentries-creditamount alwaysdisabled' disabled="true" value='22,224.7800'>
                                                                    </div>
                                                                </div>

                                                               
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Updated Date</label>
                                                                    <div class="col-lg-9">
                                                                        <input type='text' class='form-control journalentries-updateddate alwaysdisabled' disabled="true">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class='control-label col-lg-3'>Updated by</label>
                                                                    <div class="col-lg-9">
                                                                        <input type='text' class='form-control journalentries-updatedby alwaysdisabled' disabled="true">
                                                                    </div>
                                                                </div>




                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class='margin-top-sm'>
                                            <table id='journalentriestable'>
                                                <tbody></tbody>

                                            </table>
                                        </div>


                                    </div>

                                </div>
                        </div>

                </div>
            </div>
        </div>


    </div>
</div>


<script type="text/javascript">
    $(document).ready(function(){

        var tabJOURNALENTRY = "#journalentries-menutabpane";

        

        $(tabJOURNALENTRY+" #journalentriestable").flexigrid({
                url: 'loadables/ajax/general-ledger.journal-entries.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Detail ID', name : 'id', width : 70, sortable : true, align: 'left'},
                        {display: 'Debit Account No.', name : 'debitaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Debit Account Name', name : 'debitaccountname', width : 250, sortable : true, align: 'left'},
                        {display: 'Debit Amount', name : 'debitamount', width : 150, sortable : true, align: 'right'},
                        {display: 'Credit Account No.', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Credit Account Name', name : 'creditaccountname', width : 250, sortable : true, align: 'left'},
                        {display: 'Credit Amount', name : 'creditamount', width : 150, sortable : true, align: 'right'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add addlinejournalentrybtn', onpress : ''},
                        {separator: true},
                        {name: 'Delete', bclass: 'delete deletelinejournalentrybtn', onpress : ''}
                        /*{separator: true},
                        {name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
                ],
                searchitems : [
                        {display: 'Account No.', name : 'accountnumber', isdefault: true},
                        {display: 'Account Name', name : 'accountname'},
                        {display: 'Type', name : 'type'},
                        {display: 'Header Account', name : 'headeraccount'}
                ],
                sortname: "accountnumber",
                sortorder: "asc",
                usepager: true,
                title: "",
                useRp: true,
                rp: 15, //rows per page
                showTableToggleBtn: false,
                resizable: false,
                //width: 800,
                height: 300,
                singleSelect: true
        });

    
        

        
        userAccess();
            

        
    });
    
</script>