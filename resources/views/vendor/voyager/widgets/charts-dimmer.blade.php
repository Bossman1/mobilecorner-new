<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="voyager-bar-chart"></i> Offers</h3>
            </div>
            <div class="panel-body" style="height:300px;">
                <canvas id="offersChart"></canvas>
            </div>
            <div class="panel-footer">
                <button id="downloadOfferReportBtn" class="btn btn-primary btn-sm">Download Detailed Report</button>
            </div>
        </div>
    </div>
</div>


<script>
    document.addEventListener("DOMContentLoaded", function () {

        var ctx = document.getElementById("offersChart").getContext("2d");
        var offerData = {
            labels: {!! json_encode(array_keys($offerData['counts'])) !!},
            datasets: [{
                label: 'Count',
                data: {!! json_encode(array_values($offerData['counts'])) !!},
                backgroundColor: ['#f04e89','#1f7f30','#ff8300','#ff0000'],
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        };

        new Chart(ctx, {
            type: 'pie',
            data: offerData,
            options: { responsive: true, maintainAspectRatio: false }
        });

        // Download detailed CSV
        document.getElementById('downloadOfferReportBtn').addEventListener('click', function () {
            var details = {!! $offerData['details']->toJson() !!};
            var csv = 'Offer ID,Project name,ID - Developer,ID - User,Offer Status,Created At\n';
            // console.log(details);
            details.forEach(function(item){

                var projectName = '';
                if(item.project && item.project.name) {
                    try {
                        projectName = item.project.name.ka || item.project.name.en;
                    } catch(e) {
                        projectName = item.project.name;
                    }
                    // console.log(projectName.ka);
                }


                csv += [
                    item.id,
                    projectName,
                    item.developer.id + ') '+item.developer.company_name,
                    item.user_request.user.id +') '+ item.user_request.user.name,
                    item.status,
                    item.created_at_formatted
                ].join(',') + '\n';
            });


            var bom = "\uFEFF";
            var blob = new Blob([bom + csv], { type: 'text/csv;charset=utf-8;' });
            var link = document.createElement("a");
            link.href = URL.createObjectURL(blob);
            link.setAttribute("download", "offers_detailed_report.csv");
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        });
    });
</script>
