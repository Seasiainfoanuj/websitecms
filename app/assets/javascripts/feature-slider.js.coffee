ready = ->
  if $("#video-gallery").length > 0
    $("#video-gallery").royalSlider
      arrowsNav: false
      fadeinLoadedSlide: true
      controlNavigationSpacing: 0
      controlNavigation: "thumbnails"
      navigateByClick: false
      thumbs:
        autoCenter: false
        fitInViewport: true
        orientation: "vertical"
        spacing: 0
        paddingBottom: 0

      fullscreen:
        enabled: true
        nativeFS: false

      keyboardNavEnabled: true
      imageScaleMode: "fill"
      imageAlignCenter: true
      slidesSpacing: 0
      loop: false
      loopRewind: true
      numImagesToPreload: 3
      video:
        autoHideArrows: true
        autoHideControlNav: false
        autoHideBlocks: true

      autoScaleSlider: true
      autoScaleSliderWidth: 960
      autoScaleSliderHeight: 450

      imgWidth: 640
      imgHeight: 360

  if $("#gallery").length > 0
    $("#gallery").royalSlider
      arrowsNav: false
      fadeinLoadedSlide: true
      controlNavigationSpacing: 0
      controlNavigation: "thumbnails"
      navigateByClick: false
      thumbs:
        autoCenter: false
        fitInViewport: true
        orientation: "vertical"
        spacing: 0
        paddingBottom: 0

      fullscreen:
        enabled: true
        nativeFS: false

      keyboardNavEnabled: true
      imageScaleMode: "fill"
      imageAlignCenter: true
      slidesSpacing: 0
      loop: false
      loopRewind: true
      numImagesToPreload: 3
      video:
        autoHideArrows: true
        autoHideControlNav: false
        autoHideBlocks: true

      autoScaleSlider: true
      autoScaleSliderWidth: 870
      autoScaleSliderHeight: 448

  if $("#product-gallery").length > 0
    $("#product-gallery").royalSlider
      arrowsNav: false
      fadeinLoadedSlide: true
      controlNavigationSpacing: 0
      controlNavigation: "thumbnails"
      navigateByClick: false
      thumbs:
        autoCenter: false
        fitInViewport: true
        orientation: "horizontal"
        spacing: 2
        paddingBottom: 0
        arrowsAutoHide: true

      fullscreen:
        enabled: true
        nativeFS: false

      keyboardNavEnabled: true
      imageScaleMode: "fill"
      imageAlignCenter: true
      slidesSpacing: 0
      loop: false
      loopRewind: true
      numImagesToPreload: 3
      video:
        autoHideArrows: true
        autoHideControlNav: false
        autoHideBlocks: true

      autoScaleSlider: true
      autoScaleSliderWidth: 570
      autoScaleSliderHeight: 380

$(document).ready ready
$(document).on "page:load", ready
