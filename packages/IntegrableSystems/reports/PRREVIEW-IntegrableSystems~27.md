# Review of IntegrableSystems (pull request #2691 at b06cb27)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 45 lines changed since `bf1b893` found no false, unsupported or unowned statement. The two small corrections of the previous review are repaired (the Hausdorff hypotheses of §1.2 and §2.6; the collar cut-off of §5.1, whose new determinant bound was recomputed and holds), and the description was read against the head. There is one small correction (a sentence of the description about how Arnold is cited) and four format notes, three of them carried over; none blocks. One point is left to the human reviewers: Arnold's text could not be read.

## C01 — The description says Arnold is cited by chapter, but the Liouville–Arnold statements cite him by section

The description's locator paragraph says "Marsden–Ratiu (Chs. 7 and 11) and Arnold (Chs. 2 and 10) are cited by chapter". A reader checking locators from the description would look for chapter citations only, while the head cites Arnold by section at the two places that matter most: §2.1 (line 389, "Arnold, §49") and the headline `exists_actionAngle` of §2.4 (line 433, "Arnold, §§49–50"); only §§4.2–4.3 (lines 711, 751) and the reference list cite chapters.

The sentence would be right as: "Marsden–Ratiu (Chs. 7 and 11) and Arnold (Ch. 2 for central forces) are cited by chapter; the Liouville–Arnold statements of §§2.1 and 2.4 cite Arnold, §§49–50 (in Ch. 10)."

## N01 — §3.3's *Needs:* line omits the nondegeneracy of the canonical cotangent form

`TauCeti.SmoothTwoForm.IsMomentMap.poissonBracket_eq_zero_iff` assumes `σ.IsNondegenerate`; for T*Q that comes from `TauCeti.CotangentBundle.isSymplectic_symplecticForm`, which the Needs line (lines 626–628) and the Tau Ceti contract do not name.

## N02 — Layer 4's Dependencies name only HamiltonianReduction Layer 1

§4.2 (lines 703, 712) and the HamiltonianReduction contract use Layers 1 and 3; line 810 would read "HamiltonianReduction Layers 1 and 3".

## N03 — In the injectivity lemma of §5.4 the inclusion is a right inverse of r_t, not a left inverse

Lines 1110–1111 say the pair inclusion j : (P, L) → (P, E_t) is "a left inverse of r_t up to homotopy". What the next line uses is r_t ∘ j ≃ id on (P, L), so j^* r_t^* u = u: j is a right inverse (a homotopy section) of r_t.

## N04 — The collar step of §5.1 would say that the cut-off is applied one edge at a time

The new sentence (lines 897–900) uses u = n/ε for the normal coordinate of one edge, and the square has four. Applied edge by edge it works as written (after the first edge the map is the identity near it, so the next interpolation leaves it so, with b_min taken afresh along the next edge); the words "one edge after another" would say this.

## Previous findings

The previous review, of `bf1b893`, had no findings. Its small corrections and format notes at this head:

- C01 — repaired: line 154 reads "smooth functions on a Hausdorff symplectic manifold"; line 490 reads "Hausdorff symplectic manifold of dimension 2n onto a Hausdorff second-countable smooth n-manifold B".
- C02 — repaired: lines 897–902 require a profile with "−1/(R − 1) ≤ d(uχ₀)/du ≤ 1 for some R > 1/b_min" and say a thin collar alone does not suffice; recomputed below.
- N01 — not repaired: lines 626–628 unchanged (N01 above).
- N02 — not repaired: line 810 still reads "HamiltonianReduction Layer 1" (N02 above).
- N03 — not repaired: line 1111 still reads "left inverse" (N03 above).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.2 commuting flows on rectangles (sample; changed) | ℝ⁴ with f = p₁, g = p₂; T* of the line with doubled origin, f = p | ℝ⁴: both orders give x + se₁ + te₂. Doubled origin: two maximal curves of ∂_q through (−1, 0); now excluded by "Hausdorff" | true | none |
| §2.6 definition of a regular Lagrangian torus fibration (changed) | T*S¹ → ℝ, π = p; (doubled circle) × ℝ → ℝ | T*S¹: proper, surjective, circle fibres, Λ = 2πℤ·dp, B = ℝ Hausdorff second-countable: meets it. Doubled circle: total space not Hausdorff, now excluded | true | none |
| §5.1 collar interpolation (sample; changed) | b_min = ¼ with R = 5 and R = 4; b = 2; bump with χ₀(2) = 0, b = ¼ | D = d(uχ₀)/du ∈ [−1/(R−1), 1]. b ≤ 1: det ≥ (bR − 1)/(R − 1) = 1/16 at R = 5, 0 at R = 4 (strict R > 1/b_min needed). b = 2: det ≥ b + (1 − b)·1 = 1. Bump: D ≤ −1 somewhere, det ≤ 2b − 1 = −½ | true | N04 |
| §5.1 Smale's theorem as cited (sample; adjacent to the change) | `smale1959` lines 15–17 | Theorem B, first page (p. 621): diffeomorphisms of the unit square equal to the identity near the boundary form a contractible space; matches the README's use | true | none |
| `exists_actionAngle` (headline citing the changed Hausdorff convention) | n = 0; elaborated type | n = 0: L = {x₀}, clauses hold; the Lean signature carries T2 on M, as README line 434 does | true; Lean = README | none |

The rows for the untouched statements stand as in the previous review, of `bf1b893`.

- Source locators read against the text this round: 1 (`smale1959` line 15, Thm. B); the others stand from the previous review.
- §5.1 determinant: with H_t = h + tχ₀(n/ε)(id − h) and h = (s + an + O(n²), bn + O(n²)), ∂_nH^n = b + t(1 − b)D + O(ε), ∂_sH^s = 1 + O(ε), ∂_sH^n = O(ε), on n ≤ Rε; χ₀ = (uχ₀)/u ∈ [0, 1] since the slope of uχ₀ is ≤ 1, so H_t keeps the square.
- Cross-roadmap citations resolved again: CotangentLagrangian Layer 3 and §3.1 and HamiltonianReduction Layers 1 and 3 exist at the heads of their open revisions, which the description and its merge-order paragraph name; DifferentialGeometry 3.2 and 3.4 (commuting flows), SmoothBundlesConnections B6.1 and B6.6, AlgebraicTopology §2.6 on main.
- Automatic checks: all pass on the worker's run and on mine. Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the folder; the family index is unchanged.
- Elaboration: `Suggested.lean` gives exactly four `declaration uses sorry` warnings (lines 75, 110, 125, 153) and nothing else. The Lean file did not change since `bf1b893`; the elaborated signatures stand as compared there.
- Description against the head: 53 Checks counted, as stated; the Lean diff against main changes comments only, as stated; the twelve supplier subsections match the list; the old → new numbering sentence (line 1242) and the two anchors (lines 251, 548) are there; the Hausdorff and second-countability sentence matches lines 154, 370, 395 and 490; Sjamaar's pages match §§2.6–2.7. One sentence differs (C01).
- Headlines unchanged: Liouville–Arnold (stated), Legendre transform (two statements), Poincaré–Birkhoff (stated); global obstruction theory and pendulum monodromy named in the docstring as not statable.

Overlap check: read CotangentLagrangian (main and its open revision), HamiltonianReduction (main and its open revision), SymplecticGeometry, HamiltonianSystems and DGFloer as in the previous review; the changed passages add no object. Shared objects and owners unchanged: generating functions and the chain dictionary, CotangentLagrangian; moment maps and regular reduction, HamiltonianReduction; positive-period circles and the cup-length bound, this roadmap. Nothing has two owners.

Source independence: changed passages only: 3 passages compared with 3 sources (`smale1959`, `sjamaar2011`, `zung2003`), none shared; the new collar computation appears in no source read. Largest share as before: `sjamaar2011`, arnold-mmcm and `cds`, 4 each of 32 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again (independent in the previous review). Arnold's contents could not be read.

Research link: Layer 2 states the Liouville–Arnold theorem and the obstruction theory begun by Duistermaat (1980), in the Lagrangian-class form of Dazord–Delzant and Zung (2003) surveyed by Sjamaar (2011); §4.4 is the monodromy of Efstathiou–Giacobbe–Mardešić–Sugny (2017); Layer 5 is Poincaré–Birkhoff (Le Calvez–Wang 2010) by Conley–Zehnder's (1983) route. Rests on the README and the texts read.

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50 and Ch. 2; Marsden–Ratiu, Chs. 7 and 11: recorded as uncertified, cited by locator alone. That §§49–50 lie in Ch. 10 (C01) is from the README's own reference list, not from the text.
- Conley–Zehnder 1983, Epstein 1966, Thm. 6.4, and Spanier, Ch. 6: uncertified, cited by locator alone.

## Source issues

- none

## For the human reviewers

- Not tested: arnold-mmcm ties for the largest share of locators (4 of 32, with `sjamaar2011` and `cds`); its text and table of contents could not be read (uncertified), so wording and arrangement were not compared with it.
