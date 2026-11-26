# Review of HardyHilbertAndCarlemanInequalities (pull request #3056 at a5e9b22)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 3 lines changed since `9e8362a` finds that the one remark of the previous review, a format note on a sentence of *Scope and ownership* that predicted future library work, is repaired, and that the repair introduces no defect. There is no finding, no small correction and no format note. As before, none of the six cited books could be read legally, so no locator is checked against its text; that, the licence of the prior formalization and the scope remain for the human reviewers.

## Previous findings

The previous review, of `9e8362a`, had no finding and no small correction; its one format note is accounted for here.

- N01 — repaired: *Scope and ownership*, line 696, now reads "the form with the measure `dt/t` used in real interpolation is not stated here"; no prediction remains, and no statement of the README or of `Suggested.lean` uses that measure for a Hardy inequality.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 `hardy_rpow_weight_le` (cited by the changed sentence) | `f = 1_{(0,1)}` with `p = 2`, `ε = 0` and with `p = 3`, `ε = 1/4`; `f = 0` | left `1/(pε+1) + 1/(p(1−ε)−1)` = `2` and `1.3714`; right `(1 − 1/p − ε)^(-p)/(εp+1)` = `4` and `7.8994`; `0 ≤ 0` | sound; weight is `x^(p(ε−1)) dx`, not `dt/t` | none |
| Changed sentence of *Scope and ownership* | every occurrence of `dt/t`, `dx/x`, `dy/y` in the folder | `dx/x`, `dy/y` occur only in the Schur-test route of §1.2 (lines 144–146); `dt/t` only at line 696; none in `Suggested.lean` | true as written; agrees with *Downstream consumers*, lines 657–659 | none |

The rows for the untouched statements stand as in the previous review, of `9e8362a`.

- Source locators checked against the text: 0 (the change touches no locator; no cited book could be read legally).
- Library declarations opened at the pin: 0 new; the changed sentence names none (the Grönwall declaration named in the same bullet is untouched and resolves in the elaboration).
- Cross-roadmap citations near the change: 1 (UnboundedOperators §4.8, UO-D07), present under that heading at line 649 of its README.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: no error, 45 `sorry` warnings and no other warning. `Suggested.lean` is unchanged since `9e8362a`.
- Automatic checks: all passed; none set aside. No file changed outside the folder.
- Pull request text: read against this head; the change alters nothing the title or description states (counts 48 declarations, 45 with `sorry`, five imports, and the ownership paragraph still agree).
- Seeded sample: none of the sampled targets lies in the changed passage.

Overlap check: read MeansMajorizationAndDiscreteInequalities, DiracScatteringAndNonlinearFourierTransform, Isoperimetry; nothing shared.

Source independence: changed passages only; 0 passages compared with 0 sources, because the one changed sentence is ownership bookkeeping with no source locator and none of the six cited books could be read; largest share Hardy–Littlewood–Pólya, 51 of 103 source mentions in the layers; its contents page was not read. The change adds, removes and reorders no layer.

Research link: Layer 5 is the Muckenhoupt criterion for weighted Hardy operators as cited from Edmunds–Evans (2004) and Balinsky–Evans–Lewis (2015); §2.3 supplies the Hardy inequality that UnboundedOperators §4.8 uses for Sturm–Liouville operators. This rests on the README's references and its section on downstream consumers, not on a source text.

## Not verifiable

- Hardy–Littlewood–Pólya, *Inequalities*: the locators of 1.1–1.4, 2.1, 2.2, 3.1–3.3, 4.1, 4.2; no legal copy found.
- Balinsky–Evans–Lewis (2.2, 2.3, 5.1, 5.2) and Edmunds–Evans (5.1, 5.2): paywalled publisher.
- Garling (2.1, 3.1, 4.1), Mitrinović (6.1), Pachpatte (6.2): no legal copy found.
- The wording and arrangement comparison with the sources, for the same reason.

## Source issues

- none

## For the human reviewers

- **Not tested.** Hardy–Littlewood–Pólya has the largest share of the locators (51 of 103 mentions); neither its text nor its contents page could be read, so wording, arrangement and every locator are unchecked against it and the other five books.
- **Licence.** The README's section "Prior formalization" names the author's repository lean-CKMA (Apache 2.0, commit f4bd822) as the starting point for §§2.1, 3.1, 3.2 and 4.1; `Suggested.lean` was not compared with that repository.
- **Scope.** The headline results are classical (the main source is from 1934); the README connects them to current work only through the two monographs on Hardy operators (2004, 2015) and the consumer UnboundedOperators §4.8.
