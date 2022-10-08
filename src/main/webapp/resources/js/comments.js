function addComment(accountId, coachlineId) {
    let textarea = document.getElementById('commentId');
    if (textarea.value.trim() !== '') {
        fetch("/coach-line/api/add-comment", {
            method: 'post',
            body: JSON.stringify({
                "content": document.getElementById("commentId").value,
                "coachlineId": coachlineId,
                "accountId": accountId
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function (res) {
            console.info(res)
            return res.json();
        }).then(function (data) {
            console.info(data);

            let area = document.getElementById("commentArea");
            moment.locale('vi');

            area.innerHTML = `                         
              <div class="row">
                <div class="media g-mb-30 media-comment w-100">
                    <img class="d-flex g-width-50 g-height-50 rounded-circle g-mt-3 g-mr-15"
                         src="${data.account.avatar}"
                         alt="Image Description">
                    <div class="media-body u-shadow-v18 g-bg-secondary g-pa-30">
                        <div class="g-mb-15 mb-2">
                            <h4 class="text-info g-color-gray-dark-v1 mb-0">
                                    ${data.account.fullName}
                            </h4>
                            <span class="g-color-gray-dark-v4 g-font-size-12"> ${moment(data.createdDate).fromNow()} </span>
                        </div>
                        <p style="font-weight: 400"> ${data.content} </p>
                    </div>
                </div>
            </div>  
        ` + area.innerHTML
        })
    }
}