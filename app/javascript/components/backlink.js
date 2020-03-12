const backLinkMadeClickable = () => {
  document.querySelectorAll(".backlink-div").forEach((div) => {
        div.addEventListener("click", (e) =>  {
            let url = e.target.dataset.url
            window.location = url

        })
    })
}

export { backLinkMadeClickable };
