# Review of YoungIntegrationAndRoughPaths (pull request #2497 at 1826128)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons: three targets stated in prose (in §1.1, §1.2 and §4.1) are false as written, each for a missing hypothesis, and the README points at a formalisation by a path in the author's home directory. The Lean statements were recomputed by hand and no false one was found; the file elaborates with `sorry` as its only warning. There are five small corrections and three format notes, none blocking. None of the three cited books could be read legally, so no locator was checked against its text and one question (the constant of the extension theorem) is left open; the humans who approve have four points to decide.

## R01 (P2) — Three targets stated in prose are false as written, each for a missing hypothesis

An implementer who takes these sentences as targets is asked to prove false statements.

In §1.1 (line 192) the paths of finite `p`-variation are said to form a Banach space "for a normed space `E`". Take `E` incomplete and constant paths `Xₙ ≡ xₙ` with `(xₙ)` Cauchy and not convergent: `|Xₙ a − Xₘ a| + V_p(Xₙ − Xₘ) = |xₙ − xₘ| → 0`, and there is no limit. Write "for a Banach space `E`".

In §1.2 (lines 223–225) the piecewise linear interpolations "of a path of finite `p`-variation" are said to converge to it in `q`-variation. Take `X = 1_{[1/2, 1]}` on `[0, 1]`, of `1`-variation `1`. For a partition with `1/2` in the interior of a piece, the interpolation is continuous across `1/2`, so `X^D − X` jumps by `1` there, and its `q`-variation is at least its oscillation, `1`, for every mesh. Write "of a continuous path of finite `p`-variation".

In §4.1 (lines 575–578) "an `α`-Hölder rough path in the sense here and a weakly geometric `1/α`-rough path of §3.3 determine each other". Forwards: `d = 1`, `X ≡ 0`, `XX s t = t − s` satisfies Chen and both bounds at `α = 1/2`, but `M [0] · M [0] = 0` while the shuffle identity asks for `2 M [0, 0] = 2(t − s)`. Backwards: `d = 1`, `X t = t^(1/4)` on `[0, 1]` with `M [0, 0] = (ΔX)²/2` is a weakly geometric `2`-rough path (control a multiple of `(ΔX)²`, superadditive because `X` is monotone), and `|X t − X 0| = t^(1/4)` is not `O(t^(1/2))`. The true statement: a weakly geometric `α`-Hölder rough path gives a weakly geometric `1/α`-rough path through `M [i] = ΔXⁱ`, `M [i, j] = XX (i, j)`, and conversely when the control satisfies `ω(s, t) ≤ C (t − s)`.

## R02 (P2) — The README locates its prior formalisation by a path in the author's home directory

A reader cannot open what is cited, and a machine path does not belong in a published roadmap. In *Prior formalization* (line 1089) the CKMA files are introduced with a path under the author's home directory; the proof route of §2.1 (line 305) and the coverage list (lines 1096–1101) then lean on those files and on entry numbers `09.21`–`09.60` of a list that is cited nowhere, and line 1077 speaks of "the charter's RDE items" with no charter defined. Remove the path. If CKMA is public, give its repository and say what the entry numbers index; if it is not, describe in one sentence what was formalised and drop the entry numbers and "the charter".

## C01 — `rEVariationOn_one` closes in one tactic

On a copy of the file, `simp [rEVariationOn, eVariationOn]` proves it: at `r = 1` the definition is Mathlib's supremum with exponents `1`. As a target it asks an implementer for nothing. If it is kept as the check that the definition extends Mathlib's, say so in its docstring; otherwise it reads better as a Check of §1.1.

## C02 — `tendsto_isYoungSolution` does not assume that the drivers have finite `p`-variation

§2.3 states continuity for the setting of the existence theorem, drivers continuous of finite `p`-variation. The Lean statement (lines 216–228) assumes continuity of `X` and `Xn n` and `V_p(Xn n − X) → 0`, which does not make `V_p(X)` finite. I found no counterexample (for `p = 1` a bounded-variation solution forces the driver to have bounded variation wherever `f(Y) ≠ 0`), but the statement is then wider than the cited theorem. Adding `rEVariationOn (ENNReal.ofReal p) X (Icc 0 T) ≠ ⊤` makes the two agree.

## C03 — The constant of Gubinelli's theorem depends on `d`, not on `α` alone

§4.2 (line 601) says "there is `C = C(α)`". With the Hilbert–Schmidt norm on `Ten2 d` it cannot be: take `α = 1/2`, `X ≡ 0`, `XX s t = (t − s) I` (so `Kxx = √d`), `Y ≡ 0`, `Y' t = √t ⟪·,·⟫` (so `Kd = 1`, `Kr = 0`). The germ is `d √u (v − u)`, the integral over `[0, t]` is `(2/3) d t^(3/2)`, and the bound reads `(2/3) d ≤ C √d`, so `C ≥ (2/3)√d`. The Lean statement is right, since `C` is chosen after `d`; write `C = C(α, d)`. The sentence of the Conventions that the estimates of the sources hold "with the same exponents" is accurate, and could add that the constants pick up a power of `d`.

## C04 — `TauCeti.HolderSpace` is said to carry the fixed point of §2.3, which is taken in `p`-variation

The supplier contract (lines 147–149) names it as the carrier of "the Young and RDE fixed points of §2.3 and §5.1". The route of §2.3 runs in the space of paths of finite `p`-variation, and its *Needs:* line does not list the Hölder space. Keep §5.1 in that sentence and drop §2.3.

## C05 — The negative control for `p < 2` uses a path that is not at `p = 2`

The last Check of Layer 2 (line 398) says "with `p = 2` the Young integral … against a Brownian path is not defined". Brownian paths have infinite `2`-variation almost surely, so they are no instance of the excluded case `p = 2`; they have finite `p`-variation exactly for `p > 2`. Write "for `p > 2`".

## N01 — Pull-request numbers of Mathlib in the README and in docstrings

README lines 138–143, 188, 211–212, 228 and 1102, and `Suggested.lean` lines 24–25, 48 and 69, identify the shapes of `rEVariationOn` and `ControlOn` by pull-request number. A reader a year on cannot tell what those numbers held; describe the shape in words (as the definitions already do) and name the Mathlib declaration once it exists.

## N02 — Process wording

"replaced by Mathlib's when they land" and "is not waited for" (lines 141–143), and the heading "Beyond this roadmap (a roadmap for a roadmap; do not implement)" (line 1056), read as instructions about the present state. "Beyond this roadmap" alone says it.

## N03 — Two points of Lean form

The last section header of `Suggested.lean` (line 785) has only `#check` lines under it. `IsBrownian` is described as a local copy of the vector Brownian motion of StochasticCalculus §1.2, whose own prototype is `IsBrownianVector P B` with `B : Fin d → ℝ≥0 → Ω → ℝ`; naming it in the docstring would let a reader match the two.

## Questions for the author

- In §3.2, `lyonsBeta p` has the exponent `(p + 1)/p`. Is the exponent in Lyons–Caruana–Lévy, Theorem 3.7, not `(⌊p⌋ + 1)/p`? The route's first sewing step is at `θ = (⌊p⌋ + 1)/p`, and the two exponents agree only for integer `p`, which is where both values in the Checks (`p = 1`, `p = 2`) sit. At `p = 2.9` they give `2^θ ζ(θ) ≈ 8.8` against `≈ 61`, so the constant here would be about six times smaller than the one a proof at `θ = 3/2.9` supports. I could not read the book, nor Lyons' 1998 paper, to settle it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `rEVariationOn_anti` | tent path on `[0,2]`; empty `s`; `edist = ⊤` | values `2, √2, 1` at `r = 1, 2, ⊤`; `0 ≤ 0`; `⊤ ≤ ⊤` | true | none |
| 1.1 `rEVariationOn_one` | unfold at `r = 1` | `toReal 1 = 1`, both exponents `1`; closes by one `simp` | true, padding | C01 |
| 1.1 Banach space (prose) | constant paths in incomplete `E` | norm of difference `|xₙ − xₘ| → 0`, no limit | false as written | R01 |
| 1.2 Controls and Hölder paths (sampled): `ControlOn`, `exists_controlOn_rEVariationOn` | `t − s`, `(t − s)²`, `(t − s)^(1/2)`; `a > b` | superadditive: yes, yes, `1 + 1 > √2` no; empty interval vacuous | true for `p ≥ 1` | none |
| 1.2 `rEVariationOn_inv_le_of_holderOnWith` | `√t` on `[0,1]`, `α = 1/2`, `C = 1` | `∑(Δ√t)² ≤ ∑Δt = 1`, trivial partition gives `1`; bound `1` | true, attained | none |
| 1.2 interpolation (prose) | `1_{[1/2,1]}`, `p = 1` | `V_1 = 1`; `X^D − X` jumps by `1` at `1/2` for every mesh | false without continuity | R01 |
| 2.1 Sewing (sampled): `sewing_spec` | `Ξ = s(t − s)`; `s = u = t`; `γ = 3/2, 2, 3`; no continuity of `Ξ` | defect `(s−u)(t−u)`; `Ξ s s = 0` forced; sewing `(t²−s²)/2`, error `(t−s)²/2 ≤ 2(t−s)²`; constants `3.414, 2, 4/3`; refinement bound `C' mesh^(γ−1)(t−s)` | true | none |
| 2.1 `sewing_spec_control` | `s = t`; mesh → 0 | `Ξ s s = 0`; `∑ω^θ ≤ max ω^(θ−1) ω(s,t) → 0` by continuity of `ω` | true given the cited constant | none |
| 2.1 negative control `γ = 1` | entropy germ | defect `−L H(λ)`, `|·| ≤ L log 2`; dyadic sum `h(n log 2 + log(1/h)) → ∞` | Check true | none |
| 2.2 Young integration (sampled): `youngIntegral_holder` | defect of `Y u (X v − X u)` | `(Y s − Y u)(X t − X u)`, norm `≤ Cx Cy (t−s)^(α+β)`; constant `Cx Cy/(1 − 2^(1−α−β))` | true | none |
| 2.2 `youngIntegral_variation` | exponents of the product control | `1/(pθ) + 1/(qθ) = 1`; `ω^θ = V_p(X) V_q(Y)` | true given the cited constant | none |
| 2.2 `youngIntegral_eq_intervalIntegral` | `X = Y = t` | `1/2` both sides; Riemann–Stieltjes sums converge for `Y` continuous | true | none |
| 2.3 `exists_unique_isYoungSolution` | `f ≡ 0`; `f = sin`, `ξ = π/2`, `ΔX = log 3` | `Y ≡ ξ`; `2 arctan 3 = 2.4981` | consistent | none |
| 2.3 `tendsto_isYoungSolution` | `p = 1`, driver not of bounded variation | a BV solution needs `f(Y) X` BV; no counterexample found | wider than README | C02 |
| 3.1 `sigCoord`, Chen, shuffle | `d = 1`, `w = [0,0]`, `[0,2]` at `1`; `X = (t, t²)` | `2 = 1/2 + 1 + 1/2`; `S[0,1] = 2/3`, `S[1,0] = 1/3`, sum `1 = 1·1` | true, order of letters consistent with §4.1 | none |
| 3.1 `levelNorm_sigCoord_le` | `X = t v`; `n = 0`; `d = 0` | `|v|ⁿ/n!` attained; `1 = L⁰/0!`; `0` | true | none |
| 3.2 `lyonsBeta`, `exists_unique_extension` | `p = 1, 2, 2.9`; `X = t v`, `p = 1` | `7.580`, `33.56`; at `2.9`: `2^θζ(θ) ≈ 8.8` vs `≈ 61` for `θ = 3/2.9`; needs `β ≥ 1` at `n = 2` | open | Question |
| 3.3 Weakly geometric `p`-rough paths (sampled) | `p < 2`; Itô lift `d = 1`; rescaling of `ω` | total length `≤ 1` trivial (`M [] = 1`); `ΔB² ≠ ΔB² − Δt`; `β` can be traded for `c ω`, `c ≥ (β/β')^p` | definition determines its object | none |
| 3.3 `shuffle_of_extension`, `sigCoord_isMultiplicative` | `p < 2` | extension is the signature; shuffle from §3.1 | consistent | none |
| 4.1 Level-2 rough paths (sampled): `IsHolderRoughPath`, `IsWeaklyGeometric`, `canonicalLift` | `X = (t, t²)`; pure area; `s = u = t`; reversed times | entries `1/2, 2/3, 1/3, 1/2`; `2/3 + 1/3 = 1`; distance `√2`; `XX s s = 0`; `XX t s = −XX s t + ΔX⊗ΔX` | true | none |
| 4.1 `IsGeometric.isWeaklyGeometric` | `s < t`, `s = t`, `t < s` | limit of the identity; `0 = 0`; from Chen at `(s, t, s)` | true | none |
| 4.1 comparison with §3.3 (prose) | `X ≡ 0`, `XX = t − s`; `X = t^(1/4)` | `0 ≠ 2(t − s)`; `t^(1/4)` not `O(t^(1/2))` | false both ways as written | R01 |
| 4.2 Controlled paths and the rough integral (sampled): `roughIntegral_spec` | defect; pure area with `Y' ≡ B`; `XX = (t−s) I`, `Y' = √t ⟪·,·⟫` | `−R_{s,u} X_{u,t} − Y'_{s,u} XX_{u,t}`; integral `1`; `(2/3) d ≤ C √d` | true; `C` depends on `d` | C03 |
| 4.3 Stability and consistency (sampled) | `C¹` driver | `Y' XX = O((v−u)²)`, sums to `0`; rest is Riemann–Stieltjes; no `Y 0` term needed in the estimate | true for consistency; stability not checked against source | none |
| 4.4 Composition (sampled): `IsControlled.comp` | Taylor at order two | remainder `Dφ(Y s) R + O(|ΔY|²) = O(|t−s|^(2α))`; `Y'` bounded on `[0,T]` | true | none |
| 5.1 Existence and uniqueness (sampled): `rdeDeriv`, `IsRDESolution` | pure area, `f₀ = e₀`, `f₁ = sin(y₀) e₁` | germ `(v − u) cos(Y₀) e₁`; `Y = (0, t)`; `Y 0 = ξ` from `XX 0 0 = 0` | consistent | none |
| 5.2 `rdeSolution_lipschitz` | `R < 0`; `T = 0` | hypotheses force zero increments; suprema empty | no degenerate failure; not checked against source | none |
| 5.3 `hasDerivWithinAt_of_isRDESolution_canonicalLift` | `f` only `C³` | image of `[0,T]` compact, local bounds suffice; then §4.3 and FTC | true | none |
| 5.4 The geometric chain rule (sampled) | Taylor of `F(Y)`; `F` linear; Itô lift, `F = y²` | `D²F` term is symmetric, picks `Sym XX = ½ΔX⊗ΔX`; `D²F = 0`; missing `t` | true | none |
| 6.1 Hölder–Besov spaces (sampled): `testBall`, `IsRescaled`, `IsHolderBesov` | `δ₀`; bounded `g`; `α = −2` | `λ^(−m) φ(−x/λ)`; `‖g‖_∞ vol(B₁)`; `r = 3` | true | none |
| 6.2 `RegStructure`, `IsModel`, `IsModelled`, reconstruction | polynomial model; wrong sign; `ι` empty; `γ < 0` | `(·−x) + (x−y) = ·−y`; wrong sign gives `(·−x) + (y−x)`; `Rf = 0` unique; `f = 0`, non-unique | true; boundedness of `f` on `K` follows from the bound | none |
| 6.3 `exists_unique_holderBesov_mul` | `ξ = g` continuous; `β < α` oscillations | `|∫(f(y) − f(x)) g φ^λ_x| ≤ C λ^β`; `2^(n(α−β)) → ∞` | true | none |
| 7.1 Kolmogorov criterion (sampled) | exponents; `T < 0`; reversed times | `E|XX|^(q/2) ≤ C|t−s|^(βq)` is `L^(q/2)` norm `≤ C|t−s|^(2β)`; vacuous; from Chen | true | none |
| 7.2 Brownian rough paths (sampled) | `d = 1`; `d = 2` second moment; Lévy area | `((ΔB)² − Δt)/2`; `4 · 1/2 = 2`; variance `1/4`; level differences have variance `L² 2^(−n−2)`, summable | true | none |
| 7.3 Wong–Zakai (sampled) | `n = 0`; kinks of the interpolation | linear path, zero area; `deriv` is `0` on a null set, lift unchanged | true | none |
| 7.4 Gaussian rough paths (sampled) | `R = min`; `H = 1/2`; `ρ = 3/2` | `rectVariation 1 = t − s`; `(1 + 2 − 1)/2 = 1`; interval `(1/3, 1/3)` empty | true | none |

- Source locators checked against the text: 0 of 125 (no text readable).
- Library declarations opened at the pin: `eVariationOn` (`Mathlib/Topology/EMetricSpace/BoundedVariation.lean:61`), `IsBrownianReal` (`Mathlib/Probability/BrownianMotion/Basic.lean:302`, almost surely continuous paths), `Distribution.ofFun` (`Mathlib/Analysis/Distribution/Distribution.lean:303`), `TauCeti.HolderSpace` (`TauCeti/Analysis/Holder/Normed.lean:60`); the ten Mathlib files and two Tau Ceti files named in the contracts exist.
- Duplication by object: no `p`-variation for `p ≠ 1`, control, sewing or rough path in Mathlib or Tau Ceti at the pins (the only "sewing" hit is in Floer theory).
- Cross-roadmap citations resolved: StochasticCalculus §1.1 and §1.2 and PDE §§7.1–7.3, all on main.
- Dependency check: `depcheck: 213 roadmaps, 2282 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: exit 0, 37 `sorry` warnings and nothing else; `#check @name` run for all 83 declarations on a copy, every hypothesis is a binder of its own declaration, nothing changed.
- Headlines: all 37 named theorems of the README are stated; the module docstring names none as not statable, correctly. One-tactic probe: only `rEVariationOn_one` closes.
- Pull-request text against the head: 37 theorems, seven layers, the suppliers and the sources agree; no correction.

Overlap check: read StochasticCalculus, DysonBrownianMotion, PDE; Brownian motion and Kolmogorov–Chentsov are owned by StochasticCalculus Layer 1 and cited; the dyadic Besov scale and the paraproduct form of the product are owned by PDE Layer 7 and cited, this roadmap keeping the local scaled-test-function form; nothing else shared. No open pull request states sewing, signatures, rough paths or regularity structures.

Source independence: 0 passages compared with 3 sources, since no text could be read; largest share Friz–Hairer, 63 of 125 locators; contents not opened; by the README's own locators Layer 2 draws on its Ch. 4, Layer 4 on Ch. 2, 4, 7, Layer 5 on Ch. 7, 8, Layer 6 on Ch. 13, Layer 7 on Ch. 3, 9, 10, which is not a one-to-one run.

Research link: Layers 4–5 are the controlled rough path theory and Layer 6 the reconstruction theorem as given in Friz–Hairer (2020); Layer 3 is the extension theorem of Lyons–Caruana–Lévy (2007); Layer 7's Gaussian lifts are those of Friz–Victoir (2010). Rests on the README's references and its closing section on singular SPDE.

## Not verifiable

- Friz–Hairer 2020: no legal copy found (the DOI is paywalled, two author-page addresses returned nothing, not held locally); all its locators, including the sampled 2.1, 4.1–4.4, 5.1, 5.4, 6.1, 7.1–7.4.
- Friz–Victoir 2010: no legal copy found; its locators in the sampled 1.2, 2.1, 2.2, 3.3, 7.1, 7.2, 7.4.
- Lyons–Caruana–Lévy 2007: no legal copy found; its locators in the sampled 1.2, 2.1, 3.3 and the constant of Theorem 3.7.
- Lyons 1998 (tried for that constant): the open record was read, its full text could not be reached.
- The stability estimates of §4.3 and §5.2 with one exponent `α` on both sides: not recomputed, and their source unread.

Automatic checks set aside as false positives: the lead that the README name `IsGeometric.isWeaklyGeometric` is declared nowhere; it is declared in `Suggested.lean`, line 396.

## Source issues

- none

## For the human reviewers

- Not tested: Friz–Hairer 2020 (63 of 125 locators), Friz–Victoir 2010 and Lyons–Caruana–Lévy 2007 could not be read; wording, arrangement and every locator are unchecked against them.
- Licence: README lines 1089–1095 say the statements of §2.1–§2.2 are adapted from the CKMA formalisation, cited by a home-directory path; whether it is public and under which licence is not stated.
- Licence: `rEVariationOn` and `ControlOn` (`Suggested.lean` lines 51–56, 71–80) are said to reproduce the definitions of two open Mathlib pull requests.
- Scope: the identifications rough integral = Itô or Stratonovich integral and RDE = SDE solution are listed as beyond the roadmap (README lines 1058–1065) with no owning roadmap named, although StochasticCalculus is on main.
