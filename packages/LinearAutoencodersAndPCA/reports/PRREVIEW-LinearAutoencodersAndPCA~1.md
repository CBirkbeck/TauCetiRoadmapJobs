# Review of LinearAutoencodersAndPCA (pull request #2986 at cc108fa)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of Layers 1–3 was recomputed at degenerate sizes (`p = 0`, `n = 0`, `m = 0`, `p ≥ n`, singular and repeated-eigenvalue data, `𝔽₂`), every route proved in the README was re-derived by hand, every printed number in a Check was recomputed, and every locator into Zhou–Liang and Marchetti et al. was read at the cited page; nothing false was found. There are three small corrections and one format note, none blocking. For the humans: the two sources read are arXiv preprints, the one refereed reference (Baldi–Hornik) was not readable, and five statements are proved in the README with no source stating them.

## C01 — The citation "the converse is their choice `L₁ = 0`" gives a critical point whose product is `P·XX†`, not `P`

In the source paragraph of 2.1 (README line 254–255) the converse, "every orthogonal projection `P` of rank at most `p` commuting with `Σ` equals `BA` at a critical point", is attributed to Zhou–Liang's choice `L₁ = 0`. With `Y = X` that choice gives the pair `(C⁻¹VᵀUᵀXX†, UVC)` (ZhouLiang2017 line 177), whose product is `UVVᵀUᵀ·XX† = P·XX†`. This equals `P` only when the range of `P` lies in the column space of `X`; for `X = diag(1, 0)` and `P = e₂e₂ᵀ` it is `0`. A reader who follows the citation obtains `BAX = PX`, not `BA = P`.

The statement itself is correct: the README's own construction (`B` an orthonormal basis of the range of `P` padded by zero columns, `A = Bᵀ`) gives `BA = P` and both gradients vanish, which I rechecked. The smallest change is to say that Zhou–Liang's `L₁ = 0` gives a critical point with `BAX = PX`, and that the equality `BA = P` comes from the choice `A = Bᵀ` of the route.

## C02 — 3.1 does not say that the two data sets have the same number of points, which the Lean statement requires

In 3.1 (README line 428) `X'` is "new data with `Σ' = X'X'ᵀ`", with no size given; `rankOne_minimizers_perturbation` takes `X X' : Matrix (Fin n) (Fin m) ℝ`, the same `m` for both. A reader comparing the two takes the prose to allow a different sample size. Nothing is lost mathematically (zero columns can be appended without changing `Σ`, the loss or the condition `BAX = PX`), so either add "with the same number `m` of columns" to the prose, or give `X'` its own `m'` in the Lean signature.

## C03 — The description says `Suggested.lean` imports four Tau Ceti modules; it imports three

The description says: "`Suggested.lean` elaborates against current main with `import Mathlib` and four Tau Ceti `Neuromanifold` modules". The file at this head imports three: `TauCeti.Geometry.Neuromanifold.Dense`, `.Neurovariety` and `.MLP.Symmetry`. The text that would be right: "and three Tau Ceti `Neuromanifold` modules". The rest of the description (a new roadmap, 10 theorems and 8 definitions, the suppliers, the scope) agrees with the head.

## N01 — One sentence of the scope section describes the state of another roadmap's pull request

"A revision of the Neuromanifolds text that is not on main records the width-one network …" (README lines 486–488) will be out of date once that revision merges. The fact itself is right (the example stands under the Examples of Layer 2 of the open Neuromanifolds revision and has no declaration). A timeless wording: "Neuromanifolds records the width-one network from `K²` to `K²` as an example without a declaration; that is the case `n = 2`, `p = 1` of 1.1 and 1.3."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 realized maps = rank ≤ `p` | `n=2,p=1`; `p=0`; `p≥n` | `[[1,2],[2,4]]` rank 1 realized, `I` rank 2 not; `p=0` only `0`; `p≥n` all | true; library lemmas at `Dense.lean:115`, `Rank.lean:321` | none |
| 1.2 image = zero locus of `(p+1)`-minors, `IsAlgebraicImage` | `n=2,p=1`; `p≥n`; `n=0`; finite `K` | minor `z₁₁z₂₂−z₁₂z₂₁`: 0 at `[[1,2],[2,4]]`, 1 at `I`; `p≥n`: no injective index maps, ideal `⊥`, locus everything = image | true; `determinantalIdeal` spans minors over all index maps (`DeterminantalIdeal.lean:84`), non-injective ones are 0 | none |
| 1.3 `IdentifiableAt … glSetoid q ↔ rank(BA) = min p n` | `p=0`; `n=0`; `n=1,p=2`; `n=p=2` rank 1; `n=2,p=1` zero | `p=0`, `n=0`: point, rank `0 = min`; `C=[[1,1],[1,0]]`: `Ca=(1,1)ᵀ`, `C⁻¹=[[0,1],[1,−1]]`, `bC⁻¹=(0,1)`; `diag(1,0)` encoders rank 1, 2 | true both directions; three cases of the route re-derived | none |
| 1.4 hidden symmetries identifiable ↔ `p ≤ 1` (`n ≥ 1`, maximal rank) | `p=0`; `p=1` over `𝔽₂`; `n=p=2`; `n=1,p=2`; `n=0,p=2` | `p=1`: `GL₁` = rescalings (`scaleHidden` uses `Kˣ`, `Symmetry.lean:195`); shear not monomial; `Ca=(1,1)ᵀ` off axis; `n=0`: point, identifiable with `p=2` | true; `n ≥ 1` needed | none |
| 2.1 critical ⇒ `P` (`PB=B`, `PΣ=ΣP`, `BAX=PX`, loss `tr Σ − tr PΣ`) | `X=diag(3,2,1)`, `p=1`; `(0,e₁)`; `X=diag(1,0)`, `A=(1,1)`, `B=e₁`; `m=0` | values 5, 10, 13, 14; `∇_A` at `(0,e₁)` = `(−18,0,0)`; `BAX = X`, loss 0, `BA` not symmetric | true; gradient algebra re-derived | none |
| 2.1 converse, `BA = P` critical | `diag(1,0,1)`, `diag(0,1,0)`, `0`, `I`; `X=diag(1,0)`, `P=e₂e₂ᵀ` | values 4, 10, 14, 0; `A=Bᵀ`: `∇_A=−2Bᵀ(I−P)Σ=0`, `∇_B=−2Σ(I−P)B=0`; source's `L₁=0` product is `P·XX† = 0 ≠ P` | statement true; citation loose | C01 |
| 2.2 `isLeast_loss` = `Σ_{j≥p} eigenvalues₀ j` | `X=diag(3,2,1)`, `p=0..3`; `n=0`; `m=0`; sample pair | 14, 5, 1, 0; empty sum 0 = loss; `A=(1,2,3)`, `B=(1,0,1)ᵀ` gives 58 > 5 | true | none |
| 2.2 `isMinOn_loss_iff` under count `= p` | `p=0`; `p=n`; `diag(2,2,1)`, `p=1`; `diag(1,0,0)`, `p=2`; threshold `c=4` vs `(4,9]` | `p=0`: `P=0`, both sides always hold; `p=n`: `P=I`, loss 0 ⇔ `BAX=X`; counts `0,2,3` exclude repeated case; `c=4` gives `diag(1,1,0)` | true both directions | none |
| 2.3 local min ⇒ global | `(e₂ᵀ,e₂)`; rank-deficient `p=2`; `(0,0)`; `Σ=diag(1,0)`, `A=(0,1)`, `B=e₂` | `10−5t²+9t⁴`; `5−8t²+4t⁴`; `13.8209 < 14 < 14.1809`; `1−t²+t⁴`; `H = α−β` and `‖(AX)ᵀc‖²−2s‖c‖²β` re-derived | true | none |
| 2.3 no local max (`p ≥ 1`, `X ≠ 0`) | `AX≠0`; `B≠0`; `AX=0,B=0`; `p=0`; `X=0` | quadratic with leading `‖B'AX‖²>0`; `tr Σ + 2t²uᵀΣu + t⁴‖uuᵀX‖²`; constants for `p=0`, `X=0` | true; both hypotheses needed | none |
| 3.1 rank-one stability | `X=diag(2,1)` rotated by `(99/101, 20/101)`; `‖P‖=ν/2` case; `√2` constant | `‖P‖=60/101`; residual `(0, 5940/10201)`; `4/101 ≤ 7840800/37957921`; `Σ'=I/2` repeated; `2 sin(φ/2) ≤ √2 sin φ`, `tan φ ≤ ‖p̃‖/(ν−2‖P‖)` | true; prose omits equal `m` | C02 |
| Supplier `fpca_optimal` (MathematicalStatisticsNonparametric 8.3) | three parts against route steps 1 and 3 | covariance of `±x_t` uniform on `Fin m × Bool` is `Σ/m`; gap `lam p < lam (p−1)` gives uniqueness | matches `Suggested.lean` 2722–2738 on main | none |
| Supplier `leading_eigenvector_perturbation` (MathematicalStatisticsHighDimensional 8.1) | hypotheses and bound | same `hgap`, `‖P‖ < ν/2`, `√2` bound, uniqueness up to sign | matches `Suggested.lean` 1146–1152 on main | none |

- Source locators checked against the text: 14 (ZhouLiang2017: pp. 2–3 lines 94, 153–158; Theorem 1 line 165; Propositions 1–2 lines 183, 193; Proposition 3 and Theorem 2 lines 223, 237; Lemma 1 and eqs. (25)–(27) lines 508–535; eq. (28) line 591; proofs lines 581, 604, 616. MarchettiEtAl2025: §4.3 lines 509–565; Appendix A lines 1036–1048).
- Library declarations opened at the pins: 30 Tau Ceti (all cited names found in the files the README gives), 16 Mathlib (including `uniformOfFinset_apply` at `Probability/Distributions/Uniform.lean:244`, `eigenvalues₀_antitone` at `Analysis/Matrix/Spectrum.lean:63`).
- Cross-roadmap citations resolved: Neuromanifolds §1–§4 on main; MathematicalStatisticsNonparametric 8.1–8.3; MathematicalStatisticsHighDimensional 8.1; all on main.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Elaboration of `TauCetiRoadmap/LinearAutoencodersAndPCA/Suggested.lean`: 10 `declaration uses sorry` warnings, nothing else. `#check`-level signatures compared with the README for all 18 declarations; `encoderWeight` and `decoderWeight` carry no `[Field K]` because their types do not need it, which is harmless.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `simp` with the roadmap's definitions unfolded, `infer_instance`): none of the 10 theorems closes. No padding.
- Automatic checks: all passed on this head; no change outside the roadmap folder.
- Overlap check: read Neuromanifolds (main and its open revision), RobustnessCertificates, UniversalApproximation, ReLUNetworkExpressivity, ConditioningAndPerturbation; nothing shared (Neuromanifolds owns the model vocabulary and excludes dimension, singularities and optimisation; its width-one example is the case `n = 2`, `p = 1` and has no declaration).

Source independence: 13 passages compared with 2 sources, none shared; largest share ZhouLiang2017, 14 of 20 locators; contents compared with ZhouLiang2017: independent (only 2.1–2.3 touch its §2, in the order the dependency lines "2.2 uses 2.1, 2.3 uses 2.1–2.2" force; Layers 1 and 3 are not in it).

Research link: Layer 2 is the landscape theorem of Baldi–Hornik (1989) in the generality of Zhou–Liang (2017, Theorems 1–2); Layer 1 is the determinantal neuromanifold of Marchetti–Shahverdi–Mereta–Trager–Kohn (2025, Appendix A); Layer 3 applies Davis–Kahan. Rests on the README's references and on ZhouLiang2017, MarchettiEtAl2025 as read.

## Not verifiable

- Baldi–Hornik, Neural Networks 2 (1989): paywalled, not read. The README cites it only for the attribution Zhou–Liang give (ZhouLiang2017 lines 94, 153–155), which was read.

## Source issues

- **Error** in ZhouLiang2017 at the two categories following Proposition 2, p. 4: the source says every critical point that is not a global minimizer is of non-optimal or of optimal order; it should also list full-rank critical points that capture a zero singular value while missing a positive one (`Σ = diag(1, 0)`, `d₁ = 1`, `p₁ = 0`, `p̄ = 1`); affects the proof.

## For the human reviewers

- **Scope.** The two sources read are arXiv preprints (ZhouLiang2017, MarchettiEtAl2025); the README cites no refereed version of either. The one refereed reference, Baldi–Hornik (1989), is marked "Not consulted" in the README references.
- **Scope.** Five statements are proved in the README with no source stating them: the exact fibre criterion (1.3), 1.4, the minimizer characterization of 2.2, the route of 2.3, and 3.1. I re-derived each by hand; no refereed text was compared.
- **Not tested.** Baldi–Hornik (1989) could not be read; the wording and arrangement checks were made against ZhouLiang2017 and MarchettiEtAl2025 only.
