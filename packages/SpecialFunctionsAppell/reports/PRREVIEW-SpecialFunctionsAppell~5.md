# Review of SpecialFunctionsAppell (pull request #2166 at 59ba724)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 68 lines changed since `6bb6712`, and all four points of the previous review are repaired without a new problem. The three relations added to 1.6 hold coefficient by coefficient for all parameters (also at the poles of `1/Γ`), and the shift counts now given in 3.1, 4.1 and 5.1 do end in the Euler regions; the two theorems of 6.4 carry the hypothesis on `γ′` and the absolute convergence the README attaches to them. There are no findings, no small corrections and no format notes; three questions of licence and of an unread source remain for the human reviewers, as before.

## Previous findings

- R01 — repaired: 1.6 now has "relations that raise that difference in every term, and these are targets as well", and 3.1, 4.1, 5.1 give the step counts, e.g. "`Re β > −p` and `Re(γ − β) > p − q`".
- R02 — repaired: `analyticOnNhd_appellF4Fibre` and `exists_isOpen_analyticOnNhd_appellF4Fibre` take `(hc' : ∀ k : ℕ, c' ≠ -k)`, and the first states `Summable fun m => ‖…‖` on the domain beside the analyticity.
- R03 — repaired: Scope has "whose results 1.1–1.4, 4.2 and 5.1 it consumes", and the contract has "Its 1.1: Euler's integral `E(a, b, c, z)` for `0 < Re b < Re c`, its holomorphy on the cut plane and its agreement with the series".
- R04 — repaired: the description now reads "in regularized form, except 16.16.10, stated in the classical form for the fibre sum, and Horn's 16.14.5–16.14.6, stated for non-integer parameters".

## Verified sound

Series values are double sums to total degree 70 in double precision; the Gauss fibres at large `y` by Pfaff's transformation in 500-digit decimal arithmetic.

| Statement | Instances | Values (left; right) | Result |
|---|---|---|---|
| 1.6, new relation of `𝐅₁` | coefficient of `xᵐyⁿ`; point of 1.1; `γ = −1` | `γ + m + n` times the coefficient of `𝐅₁(γ+1)`; `1.10277702137748 + 0.02905571804219 i` both; at `γ = −1`: `0.00477579562720 − 0.00306549661054 i` both | holds, also at a pole |
| 1.6, new relation of `𝐅₂` | coefficient; `β = 1`, `γ = ½`, `γ′ = 1.25`; `γ = 0` | `γ + m`; `0.66395753995101 + 0.06269197952790 i` both; at `γ = 0`: `0.06033945721724 + 0.05131154587901 i` both | holds; the Check's digits agree |
| 1.6, new relation of `𝐅₃` | coefficient; point of 1.1, `α′ = 0.55` | `(γ−α−α′) + (α+m) + (α′+n) = γ+m+n`; `1.07629168614229 + 0.04302189300230 i` both | holds |
| 1.6 Check, old relation in `γ` of `𝐅₂` | `β = 1`, `γ = ½` | right side `0.66395753995101 + 0.06269197952790 i`; its term `β 𝐅₂(β+1; γ+1)` has `γ − β = −½` | true as the Check says |
| 3.1 step count | relation in `α`; raising relation | `γ − α` changes by `−1, 0, 0`, `α` by `+1`; then `+1` in all three terms, `α` by `0, +1, +1` | `Re α > −p`, `Re(γ−α) > p − q` suffices |
| 5.1 step count | relation in `β`; raising relation; value check | `γ − β`: `−1, 0`; then `+1, +1`; `(β′, γ′)` untouched; relation in `β` both sides `0.66395753995101 + 0.06269197952790 i` | suffices in each pair |
| 4.1 step count | relations in `β`, `β′`; third relation | `γ − β − β′`: `−1, 0` each; then `+1` in all three terms, `β`, `β′` kept; relation in `β` both sides `1.07629168614229 + 0.04302189300230 i` | `Re(γ−β−β′) > p + p′ − q` suffices |
| 1.6, "the first is the third operator relation at `γ + 1`" | `ϑₓ 𝐅₁(γ+1)` by 1.4 | `x α β 𝐅₁(α+1; β+1, β′; γ+2)`; likewise in `y` | the two forms coincide |
| 6.4 `analyticOnNhd_appellF4Fibre`, the new `Summable` of norms | `(0.3, −6)`, `(1, −4.5)`, parameters of 1.1, 121 terms | sums of norms `0.768048153686`, `0.803730834473`; term ratios at `m = 120`: `0.03686`, `0.14538`, below `‖x‖/(1+‖y‖) = 0.04286`, `0.18182` | converges absolutely |
| 6.4, README against Lean | elaborated types of the two theorems | `(∀ k, c ≠ -k) → (∀ k, c' ≠ -k) → (∀ p ∈ U, Summable ‖…‖) ∧ AnalyticOnNhd …`; second with `hc'` | equal to "for `γ, γ′ ∉ {0, −1, …}` … converges absolutely and is analytic" |
| Supplier contract, 1.1 | SpecialFunctionsHypergeometric 1.1 on main | integrability for `0 < Re b < Re c`, holomorphy on `{0 < Re b < Re c} × {1 − z ∈ slitPlane}`, `E = 𝐅` for `‖z‖ < 1` | the contract line says what 1.1 states |

The rows of the previous review for the untouched statements stand as in that review, of `6bb6712`.

- Source locators checked against the text: none this round; the changed passages carry no locator.
- Library declarations: no new one cited; the `#check` lines of `Suggested.lean` elaborate at the pins.
- Cross-roadmap citations resolved on main: 1 (SpecialFunctionsHypergeometric 1.1, `### 1.1 Euler's integral`).
- Automatic checks at this head: all pass. Dependency check: `depcheck: 220 roadmaps, 2376 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed.
- `lake env lean` on `TauCetiRoadmap/SpecialFunctionsAppell/Suggested.lean`: 59 `sorry` warnings, no error, nothing else but the output of the `#check` lines. The elaborated types of the two changed theorems were read against 6.4; no binder lost.
- Padding: the two changed theorems were decided by reading (a `Summable` of norms on an open set and an `AnalyticOnNhd` of a `tsum`); neither is a one-tactic statement.
- Pull request text against the head: title, layer list, dependency list (now with 1.1), the sentence on regularized forms and "59 headline theorems" all agree with the head.

Overlap check: read SpecialFunctionsGeneralizedHypergeometric (open), SpecialFunctionsHypergeometric (main), EllipticIntegrals (main); nothing shared.

Source independence: changed passages only: 5 passages (the addition to 1.6, the existence paragraphs of 3.1, 4.1, 5.1, the contract line for 1.1), which carry no source locator and are derivations of the roadmap's own; compared with the one cross-roadmap text they cite, nothing shared. Largest share Matsumoto, 25 of 58 locators, whose text and table of contents could not be read; no layer was added, removed or reordered, so the arrangement was not compared again.

Research link: The headline targets are the Euler integrals, systems and transformations of Appell's `F₁`–`F₄` as surveyed by Matsumoto (2020) and Aomoto–Kita (2011), the base of the monodromy theory of these systems that the README places beyond itself; it names Carlson's symmetric integrals as a consumer. Rests on the README and its references.

## Not verifiable

- Matsumoto (Encyclopedia of Special Functions II, Ch. 3), all 25 locators: paywalled, no open copy found (as in the previous review); no changed passage cites it.
- Aomoto–Kita §3.1, Iwasaki–Kimura–Shimomura–Yoshida §3.9.1, Srinivasa Rao–Lakshminarayanan Ch. 7: paywalled, cited by locator alone; untouched by the change.
- The description's account of the author's local reviews: no record in the repository.

## Source issues

- none

## For the human reviewers

- **Not tested.** Matsumoto's chapter carries 25 of the 58 source locators and could not be read: the wording and the arrangement were compared with DLMF only (in the previous review).
- **Licence.** `TauCetiRoadmap/SpecialFunctionsAppell/README.md` "Prior formalization" names `lean-DLMF` (Apache-2.0, as stated there) as source material for Layers 1–7; `Suggested.lean` was not compared with that repository.
- **Licence.** DLMF was read on `dlmf.nist.gov`, a host the sources service places in no licence class; it was fetched as an institutional open copy.
