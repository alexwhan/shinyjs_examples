jsCode <- '
shinyjs.slideVals = function(params) {
var defaultParams = {
id : null,
vals : [0, 1]
};
params = shinyjs.getParams(params, defaultParams);

$("#" + params.id).data("ionRangeSlider").update({"values":params.vals});
}'
