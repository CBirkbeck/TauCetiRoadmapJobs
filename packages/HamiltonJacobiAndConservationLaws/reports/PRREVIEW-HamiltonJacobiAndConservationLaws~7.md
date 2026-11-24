# Review of HamiltonJacobiAndConservationLaws (pull request #2801 at 8fe03a5)

**Verdict:** accepted

**Summary.** Accepted: the change since the previous review is seven locator notes in the README (no statement, no layer and no Lean declaration changes), and none of them makes a stated result false; there are no findings, no small corrections and no format notes. The statements whose locators changed were recomputed: the decay bound of §5.5 holds for a `C²` uniformly convex flux without `f(0) = 0`, with `C = 2√(‖u₀‖₁/θ)`, so the roadmap's wider generality than the cited theorem is sound. Evans' book and Crandall–Evans–Lions could again not be read, so the corrected locators themselves are left to the human reviewers.

## Previous findings

- The previous report (of `9fa1382`) has no finding, small correction or format note; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.5 decay, `f ∈ C²` uniformly convex, no `f(0) = 0` (source: smooth, `f(0) = 0`) | general `f`; `f + c`; Burgers N-wave of mass `M` | `L(q) − L(σ) = ∫₀^u s f''(s) ds ≥ θu²/2` and `tL ≤ 2‖u₀‖₁` give `|u| ≤ 2√(‖u₀‖₁/(θt))`; `f + c` leaves `f'`, `G`, `y(t,x)` unchanged; N-wave max `√(2M/t) ≤ 2√(M/t)` | true as stated; `C` depends on `θ`, `‖u₀‖₁` only | none |
| §5.2 one-sided inequality (locator moved to §3.4.3) | Burgers, `θ = 1`: rarefaction `x/t`; shock `1 → 0` | rarefaction: `(x+z)/t − x/t = z/t`, equality; shock: difference `≤ 0 ≤ z/t` | holds, sharp | none |
| §5.3 uniqueness, `f ∈ C²` convex (source: smooth) | `f = 0`; Burgers datum `0 | 1` | `f = 0`: `u = u₀` only; Burgers: the jump solution has `u(x+z) − u(x) = 1` for all small `z`, fails `C(1 + 1/t)z`; rarefaction passes | consistent with §5.1 Checks | none |
| §5.5 N-wave (note only) | Burgers, `u₀ = 1_{[0,1]}` | `σ = 0`, `κ = 1`, `p = 0`, `q = 2`: the roadmap's `N` is `x/t` on `(0, √(2t))`; the source's case needs `p, q > 0`, as the note says | note accurate to the statement's range | none |
| §4.2 stability (locator reordered) | `Fₙ = |p| − 1 + 1/n`, `uₙ = −(1 − 1/n)|x|` | at `x ≠ 0`: `Fₙ = 0`; at `0`: `D⁺uₙ = [−(1−1/n), 1−1/n]`, `Fₙ ≤ 0`; limit `−|x|`: `D⁺ = [−1, 1]`, `|p| − 1 ≤ 0` | holds | none |
| §4.3 Cauchy comparison (note: source has `ω₁` linear, uniqueness only) | `H = ‖p‖`; `H = 0`, `u = v + c` | `H = ‖p‖`: `(S1)` with `ω₁ = 0`, Lipschitz constant 1; `H = 0`, `c > 0`: `u(0) ≤ v(0)` fails, as it must | the roadmap's statement is wider than the cited theorem and says so | none |

The rows for the untouched statements stand as in the previous review, of `9fa1382`.

- Source locators checked against the text: 0; all seven changed locators point to Evans or Crandall–Evans–Lions, neither readable (below). The seeded sample falls in the change at §4.2, §4.3 and §5.2 only.
- Library declarations opened at the pin: none; the change touches no library name and no Lean statement.
- Cross-roadmap citations: one in a changed passage (OptimalControlAndHamiltonJacobi 4.1, §4.3), reflowed only; the citation computation lists nothing unresolved, and the overlap computation no dropped or missing id.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing is changed outside the folder.
- Automatic checks: all passed at this head. Elaboration: `Suggested.lean` (unchanged since `9fa1382`) elaborates with 16 `sorry` warnings and nothing else.
- Internal consistency of the changed locators: §3.4.2 now carries Theorems 1–2 and §3.4.3 the Lemma and Theorem 3 in every place the README cites them (§5.2, §5.3); §10.1.1 is cited twice (§4.2) for the same vanishing-viscosity computation.
- Pull request text against the head: its last paragraph lists the four locator changes of this head, and each is in the diff; nothing contradicted or left unstated.

Overlap check: read OptimalControlAndHamiltonJacobi, ConvexAnalysisAndDuality, CompressibleEulerEquations, OptimalTransport, PDE (as in the previous review; the change touches no shared object); shared with OptimalControlAndHamiltonJacobi: the finite-horizon value function, dynamic programming, the Hamilton–Jacobi–Bellman theorem and comparison for continuous functions, owner OptimalControlAndHamiltonJacobi, consumed here by section; shared with ConvexAnalysisAndDuality: the gradient of the conjugate under strict and strong convexity, left to the human reviewers; nothing shared with the others.

Source independence: changed passages only; 7 changed passages read (the locator notes of §4.2, §4.3, §5.2, §5.3 and the two of §5.5, and the reflowed Cauchy statement), none comparable with a readable source, since their sources are Evans and Crandall–Evans–Lions; largest share Evans, 35 of 50 locators; contents not compared with Evans, whose text and table of contents could not be read. No layer was added, removed or reordered.

Research link: Layer 4 is the first-order viscosity theory of Crandall–Lions (1983), Crandall–Evans–Lions (1984) and Ishii (1987), the base of the second-order theory of Crandall–Ishii–Lions (1992); Layer 6 is Kružkov's (1970) entropy theory, the scalar foundation of Dafermos (2016). Rests on the README's references and on Crandall–Ishii–Lions.

## Not verifiable

- Evans, *Partial Differential Equations*, 2nd ed.: the locators changed in this round (§3.4.3, Lemma; §3.4.3, Theorem 3 and §3.4.5, Theorems 5 and 6, with their hypotheses on the flux; §10.1.1; §10.2, Theorem 1, with its hypotheses on `H`): no legal copy; the publisher's page is closed. The author compared them with a transcription, not the book.
- Evans, §3.2.2, Example 1: the author reports that the transcription has the opposite sign convention to the README's `x₁u_{x₂} − x₂u_{x₁} = u`; not checked against the book. The README's equation and its stated solution agree with each other.
- Crandall–Evans–Lions (1984), Theorem 1.2, now the first locator of the stability bullet of §4.2: no legal copy found (the journal's page could not be classified as open).
- The other texts listed as not verifiable in the earlier reviews (Ishii 1987, Kružkov 1970, Bardi–Evans 1984, Bardi–Capuzzo-Dolcetta 1997, and the arrangement against Evans' contents) stand as there; the change does not touch their locators.

## Source issues

- none

## For the human reviewers

- Not tested: Evans' book carries 35 of the 50 locators; its text and contents could not be read. The author states that §5.1–§5.5 follow the order of Evans §3.4.1–§3.4.5, and that no dependency forces the order of §5.4 and §5.5.
- Not tested: the Evans locators and hypothesis notes corrected in this round (README §4.2, §4.3, §5.2, §5.3, §5.5) were, by the author's statement, compared with a section-by-section transcription of Evans, not with the book.
- Ownership: §1.1 states the gradient of the conjugate under strict and uniform convexity; ConvexAnalysisAndDuality (open, 4.2–4.3) plans the general form. Neither is on main; the author asks the maintainers to name the owner.
- Ownership: this roadmap consumes OptimalControlAndHamiltonJacobi (open) for §4.3 and §4.6, so it merges after it; both define first-order viscosity sub- and supersolutions, one for a single equation and one for a general `F`.
