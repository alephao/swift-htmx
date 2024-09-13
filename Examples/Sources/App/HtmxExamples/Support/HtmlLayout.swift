import Html

func htmlLayout(_ content: Node...) -> Node {
  .document(
    .html(
      .head(
        .script(attributes: [.src("https://unpkg.com/htmx.org@2.0.2")])
      ),
      .body(
        .header(
          .nav(
            attributes: [
              .style(
                unsafe: """
                  display: flex;\
                  align-items: center;\
                  height: 64px;\
                  gap: 16px;
                  """
              )
            ],
            .a(route: .swapHtml, .text("swap html")),
            .a(route: .swapHtmlOOB, .text("swap html oob")),
            .a(route: .swapHttp, .text("swap http"))
          )
        ),
        .main(
          .fragment(content)
        )
      )
    )
  )
}
