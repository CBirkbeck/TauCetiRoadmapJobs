# Review of RealAnalyticGeometry (pull request #2634 at 38c4ef3)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 17 lines changed since `0ba0889` found no finding. The change adds section and proposition numbers to the two remaining citations of Grauert 1958 (the p-function and the Stein criterion) and keeps the old anchors of §3.0 and §3.1 as explicit anchors, so the link from ComplexComparisonPartII resolves again; no Lean statement changed. Two small corrections (the description still says that link breaks, and does not mention the new Grauert locators) and one format note remain, none blocking; nothing is left for a human to decide.

## C01 — The description says the link from ComplexComparisonPartII breaks, but this head keeps the old anchor

The description reads: "ComplexComparisonPartII links to the old anchor of §3.1 (`#r31-weighted-estimates-stein-criteria-and-approximation`); that link now lands at the top of the README". At this head the README carries `<a id="r31-weighted-estimates-stein-criteria-and-approximation"></a>` directly before the heading of §3.1 (line 1132) and `<a id="r30-global-complexification-and-tubes"></a>` before that of §3.0 (line 1041), so the link in ComplexComparisonPartII (line 245 on main, line 4744 at its open head) lands on §3.1, and a reader of the description would repair a link that is not broken.

Text that would be right: "The heading anchors change with the headings, and the two old anchors that other roadmaps link to, `#r30-global-complexification-and-tubes` and `#r31-weighted-estimates-stein-criteria-and-approximation`, are kept as explicit anchors before §3.0 and §3.1, so the links from ComplexComparisonPartII and Hyperfunctions still resolve."

## C02 — The description's list of changed citations omits the two new Grauert locators

Under "Statements whose content or citation changed" only "Grauert's embedding theorem (§4.2) is cited as Theorem 3, p. 470" appears. This head also cites §3, Propositions 6 and 7 for the p-function (§3.0, line 1085) and §2, Theorem 2 with §3 for the Stein criterion (the docstring of `isStein_of_strictlyPlurisubharmonic_exhaustion` and the References). One added clause would say so.

## N01 — The second Check of §2.1 counts the cells of one triangulation as if of all

"`B_1` is the image of two open edges and one vertex" (lines 916–918) holds for the triangulation with vertices `0`, `1/2`, `1`; a finer compatible one has more. "In the triangulation with vertices `0`, `1/2`, `1`" would say which is meant.

## Previous findings

The previous review, of `0ba0889`, had no finding; its one small correction and one format note are accounted for here.

- C01 — repaired: §3.0 reads "(Grauert, 1958, §3, Propositions 6 and 7)" (line 1085); the Stein-criterion docstring reads "Grauert 1958, §2, Theorem 2, for the relatively compact sublevel sets, and his §3 for their union"; the References agree. The paper could not be read (Not verifiable).
- N01 — not repaired: the Check is unchanged (now lines 916–918); carried as N01 above.

## Deferred findings

- D01 — resolved: the README keeps the old §3.1 anchor as an explicit anchor before the heading (line 1132), so ComplexComparisonPartII's link resolves unchanged.

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| Stein criterion `isStein_of_strictlyPlurisubharmonic_exhaustion` (docstring changed, statement not) | `E = 0`, `X` countable discrete, `q` with finite sublevels; `X = ℂ`, `q = |z|²`; compact torus; `ℂ² ∖ {0}`, `q = |z|²` | hull of `K` is `K`, `r = 0` coordinates: Stein; Levi form `1`, closed discs compact: Stein; no strictly psh function (maximum principle): vacuous; `{0 < |z|² ≤ c}` not compact: hypothesis fails | agrees with the README Checks of §3.0 (`ℂ² ∖ {0}` not Stein) and line 1261; Grauert 1958 §2, Theorem 2 not readable | sound; locator not verifiable |
| §3.0 p-function (locator added) | `M = ℝ ⊂ ℂ`, `p = y²` | `p ≥ 0`, zero set `ℝ`, `dp = 0` on `ℝ`, `i∂∂̄p = ½ > 0`: a p-function; `p = y⁴` has Levi form `3y²`, zero on `M`: excluded | Grauert 1958 §3, Propositions 6 and 7 not readable | sound; locator not verifiable |
| Kept anchors of §3.0 and §3.1 | the two links from other roadmaps | ids at lines 1041 and 1132, each directly before its heading; no clash with the heading anchors `30-…-r30`, `31-…-r31` | ComplexComparisonPartII line 245 (main) and 4744 (open head) use `#r31-…`; Hyperfunctions line 21 links `#r30-…` at a fixed commit | sound |

The rows for the untouched statements stand as in the previous review, of `0ba0889`.

- Source locators checked against the text: 0 of the 3 added (all in Grauert 1958, which is cited by locator alone); no seeded-sample section is touched by the diff.
- Library declarations opened at the pin: none new; the diff changes no statement and names no new declaration.
- Cross-roadmap citations resolved: 3 inbound links (ComplexComparisonPartII on main and at its open head, Hyperfunctions on main); the diff adds no outbound citation.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head; nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and no error; one docstring changed, so signatures and the one-tactic probe stand as before.
- Description read against the head: the anchor paragraph is contradicted (C01) and the Grauert locators are unstated (C02); the other sentences stand as in the previous review.

Overlap check: read AffineMorseLefschetz, ComplexKahlerGeometry and RealAlgebraicGeometry on main and StratifiedSpacesAndTameTopology, ComplexComparisonPartII and Hyperfunctions at their open heads, as in the previous review; the diff adds no object. Finite semialgebraic triangulation and semialgebraic dimension: AffineMorseLefschetz §5.1, cited here. Semianalytic decomposition, Łojasiewicz's theorems, complexification, the Stein predicate and Cartan A/B: this roadmap. Holomorphic structure sheaf: ComplexKahlerGeometry §4.1. No open pull request changes this roadmap or drops an id it cites, and this head drops no anchor another roadmap uses.

Source independence: changed passages only; 3 passages compared (the p-function sentence, the Stein-criterion docstring, the References entry), with 0 sources, since Grauert1958 could not be read; they add locators and no prose of the source's subject beyond a clause; largest share Lojasiewicz1964, as in the previous review; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: Theorems 1–4 are Łojasiewicz's 1964 simultaneous triangulation of locally finite semianalytic families, answering the question of Lefschetz, Koopman–Brown and Lefschetz–Whitehead (1930–33); Layers 3–4 give Cartan's theorems and Grauert's 1958 embedding, which the manifold theorem uses. Rests on Lojasiewicz1964 lines 25–42 and the README's consumers section.

## Not verifiable

- Grauert1958 (*Annals* 68): cited by locator alone, not readable; the added locators "§3, Propositions 6 and 7" (p-function) and "§2, Theorem 2" with "§3" (Stein criterion) could not be checked against the text, nor "Theorem 3, p. 470".
- Hormander1965 and Hormander1990: cited by locator alone; untouched by the diff.

## Source issues

- none

## For the human reviewers

- none
