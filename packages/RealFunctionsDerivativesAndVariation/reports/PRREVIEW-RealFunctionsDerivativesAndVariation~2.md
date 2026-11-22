# Review of RealFunctionsDerivativesAndVariation (pull request #2971 at c41aba9)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence: the proof route of the Denjoy–Young–Saks theorem (§3.2) says that a set is null which has positive measure for some continuous functions; the lemma it means has "the other side" where the text has "the same side". Both findings of the previous review are repaired, and every stated theorem, definition and Check survived the computed pass; the file elaborates with `sorry` as the only warning and no supplier is upward. There are two small corrections and one format note, none blocking. None of the nine cited books could be read legally, so no locator was verified; that, the licence of the prior formalization and the scope are left to the human reviewers.

## R01 (P2) — The proof route of §3.2 calls null the set where an upper Dini derivative is finite and differs from the lower one on the same side; that set can have positive measure

An implementer who follows the route would set out to prove a false lemma, and the sentence contradicts the theorem it stands under: alternatives two and three of `ae_dini_alternatives` are exactly points with a finite upper derivative on one side and lower derivative `-∞` on that side.

The sentence is in the proof route of §3.2 (line 313): "the remaining cases, a finite upper Dini derivative on one side with a different lower one on the same side, are shown null". A witness: let `E ⊆ [0, 1]` be a symmetric Cantor set of positive measure whose stage-`n` intervals have length at most `2⁻ⁿ` and lose a middle gap of length `c·4⁻ⁿ`; let `f = 0` on `E` and, on each gap `(u, v)`, a tent of height `(v − u)^{1/4}`. Then `f` is continuous and `f ≥ 0`. At a point `x ∈ E` the left quotients `f(y)/(y − x)` are `≤ 0` and vanish along `E`, so `D⁻f(x) = 0`; the gap of the stage-`n` interval containing `x` lies within `2⁻ⁿ` of `x` and carries height `c'·2^{-n/2}`, a quotient of size `c'·2^{n/2}`, and for almost every `x ∈ E` that gap is on the left for infinitely many `n`, so `D₋f(x) = -∞`. So `{D⁻f finite, D₋f ≠ D⁻f}` contains almost all of `E`. What the Vitali argument proves is the statement across the two sides: the set `{D⁺f < +∞, D₋f < D⁺f}` is null, with its three images under `f ↦ -f` and `x ↦ -x` (in the witness, `D⁻f = 0 = D₊f` on `E`, as it should be).

The smallest change: replace "on the same side" by "on the other side", for instance "the remaining cases, an upper Dini derivative `< +∞` on one side that is strictly above the lower one on the other side (and the three reflections), are shown null for each pair of rationals".

## C01 — The proof route of §2.2 takes the level outside `f(s)` and starts from `f x₁ > f x₂`, where the argument needs the function `f + εt`

In the route of §2.2 (lines 209–212) the last point is taken for `g t = f t + ε t`, and it lies in `s` only if its level is a value of `g` on `s`; so the level must avoid `g(s)`, not "the countable image `f(s)`", and it must lie between `g x₂` and `g x₁`, which requires `g x₁ > g x₂` (true for small `ε` when `f x₁ > f x₂`). The route of §2.3 already writes it with `g`. Write `g` in both places here too.

## C02 — "The continuous Jordan decomposition … is formalized in Tau Ceti" names no declaration, and I found none at the pin

*Scope and ownership* (line 750) says the continuous Jordan decomposition of a continuous function of locally bounded variation is formalized in Tau Ceti. The other Tau Ceti inputs are named by file under *Exact supplier contracts*; this one is not, and a search of the pinned Tau Ceti for "Jordan decomposition" of functions and for uses of Mathlib's `LocallyBoundedVariationOn.exists_monotoneOn_sub_monotoneOn` finds no such theorem (the nearest is the continuity of the variation function used in `TauCeti/Topology/MetricSpace/Arclength/Basic.lean`, line 87). Name the file and declaration, or say that the decomposition follows from Mathlib's decomposition and the continuity of the variation function, or drop the sentence; nothing in the layers uses it.

## N01 — The failure of normality in §7.3 still has a proof route and no locator

Every other headline of §7.3 carries a locator; a reference for the non-normality of the density topology would complete the list. The route given is sound (see the table).

## Previous findings

- R01 (density and Lebesgue's density theorem duplicated): repaired. `HasDensityZeroAt` is now "`abbrev` … `TauCeti.HasDensityAt volume s x 0`", `ae_isDensityPoint` is gone, §7.1 says "Not a target: Lebesgue's density theorem … is Tau Ceti's `TauCeti.ae_hasDensityAt_indicator`", and the file is under *From Tau Ceti* and *Scope and ownership*. In a scratch copy, `IsDensityPoint s x ↔ x ∈ TauCeti.essentialExterior volume sᶜ` closes by `TauCeti.mem_essentialExterior.symm`, as the Conventions claim.
- R02 (false Check on `x ↦ -x`): repaired. "`x ↦ -x` has `D⁺ = -1` everywhere, so it satisfies continuity, `D⁺ > -∞` and the existence of a derivative, and violates only the sign hypothesis".
- C01–C05: all applied (the backward direction of §3.1 with `K = 0`; the guide now says §2.3 uses §3.1; the values read `3.0, 4.5, 6.0`; Lusin's theorem and the Mathlib image estimate are named).
- N01, N02: applied (no pull-request number in the README; `Differentiable.isBaireOne_deriv` is in the roadmap's namespace). N03: not taken up (N01 above).
- The question on §2.3 is answered in the text: the route now uses only the set of last points, and that argument is correct (table).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Dini definitions, `hasDerivAt_iff_dini` | `\|x\|`, `x sin(1/x)`, `√\|x\|` at 0 | slopes `1`, `-1`; `sin(1/y)`: limsup `1`, liminf `-1`; `y^(-1/2)` → `⊤` | true | none |
| 1.2 `dini_bounds` | `x³` on `[-1,1]`; route with `z = sup{g ≤ g x}` | slope `x²+xy+y²`: sup `3`, inf `0`; `3x²`: sup `3` at `-1`, inf `0`; `g > g z` on `(z,y]` gives `D₊f(z) ≥ M`, `z < y ≤ b` | true | none |
| 1.2 measurability | `AEMeasurable f` for `volume` | is Lebesgue measurability; continuous case is a countable limsup over rational `h` | true | none |
| 1.3 Young | `-\|x\|` at 0; `g t = -f(-t)` | `D⁺ = -1 < 1 = D₋`; `slope g t s = slope f (-t) (-s)`, so `D⁺g(t) = D⁻f(-t)`, `D₋g(t) = D₊f(-t)` | true | none |
| 2.1 `risingSun` | `sin` on `[0,2π]`; `a ≥ b`; `d = b` | `E = (0,π/2) ∪ (π,2π)`; `0 < 1`; `0 = 0`; `E = ∅` vacuous; `Ioo c d ⊆ E` forces `a ≤ c`, `d ≤ b` | true | none |
| 2.2 countable exceptions | route with `g = f + εt`; Mathlib comparison lemma | last point `z ∈ (x₁,x₂)`, `g z = y₀`, `D⁺g(z) ≤ 0 < ε`, so `z ∈ s`, needs `y₀ ∉ g(s)`; lemma needs strict `f' < B'` | true; route slip | C01 |
| 2.3 a.e. criterion, Goldowski–Tonelli | `-C`; `-x`; `\|x\|` on `[0,1]`; route with `m t = sup g` on `[t,x₂]` | `-C`: derivative `0` a.e., falls `0 → -1`; `-x`: `D⁺ = -1`; slope of `m` at `z` lies in `[slope g, 0]`; `g(L)` is the whole interval of levels | true | none |
| 3.1 image estimate, null images | `x²`, `K = 2`; `K = 0`, `λ(A) = ∞`; Cantor function; forward direction by local inverse-Lipschitz pieces | `1 ≤ 2`; `0·⊤ = 0`; `C(A)` dyadic rationals; `λ*(Bₙ ∩ I) ≤ n·λ*(f(Bₙ ∩ I)) = 0` | true | none |
| 3.2 Denjoy–Young–Saks, corollary | `\|x\|` at 0; monotone `f`; tent function on a fat Cantor set | no alternative at 0; alternatives 2–4 have a lower derivate `-∞`; tents: `D⁻ = 0 = D₊`, `D₋ = -∞` on almost all of `E` | theorem true; route sentence false | R01 |
| 4.1 Helly | `sin(nx)` on `[0,π]` | variation `2n`; `∫(sin nx − sin mx)² = π/2 + π/2 = π` | true | none |
| 4.2 inequality, Tonelli, Fubini | `a > b`; `a = b`; jump at `a`; `x sin(1/x)`; signed `fₙ` | `0 ≤ 0`; `0 = 0`, AC; variation `> ∫` and not AC; both sides `⊤`; `fₙ − fₙ(-N) ≥ 0` reduces to the positive case | true | none |
| 4.3 property (N), Banach–Zarecki, images | Cantor function; `(x + C)/2`; `a = b` | `C(cantorSet) = [0,1]` (library); image of Cantor set has measure `1/2`; both sides true on a point | true | none |
| 4.4 singular, Weil | `∑ 2⁻ⁿ C(x − qₙ)`; `sin` indicatrix | `C = 0` on `x ≤ 0` (library), so `x ≤ qₙ < y` separates; `∫₋₁¹ 2 = 4` | true | none |
| 5.1 `IsBaireOne`, derivatives | indicator of `{0}`, of `ℚ` | tents `max 0 (1 − n\|x\|)`; continuous nowhere, excluded by Baire | true | none |
| 5.2 Lebesgue–Hausdorff, Baire | empty `X`; non-separable metrizable `X` for 24.14 | both sides vacuous; `f⁻¹(U) = ⋃ₖ⋃ₙ⋂_{m≥n} gₘ⁻¹(Fₖ)` needs no separability | true | none |
| 5.3 continuity sets | `x² sin(1/x)`; `A = [a,b]` | `ℝ∖{0}` dense `G_δ`; `F = x` | true | none |
| 6 Banach–Mazurkiewicz, typical functions | polynomials; Weierstrass; `b − a < 1/n` | meagre set dense; Mathlib's sequence lies in `(x, x + 3/(2bᵐ)]`, right quotients unbounded; `Eₙ = ∅` for small `n` | true | none |
| 7.1 density, approximate continuity | sparse set; `(0,∞)`; indicator of `ℚ`; library | ratio at `r = 0.1`: `(1/192)/0.2 = 0.026`; complement density `1/2`; `Iff.rfl` to `TauCeti.HasDensityAt` | true | none |
| 7.1 Denjoy, derivative, Baire one | `f` bounded by `C` | `\|∫ₓ^{x+h} f − h f x\| ≤ ε\|h\| + 2C·λ(A_ε ∩ B(x,\|h\|))` | true | none |
| 7.2 Lusin–Menchoff, Zahorski | `X = ∅`; `X = {0}`, `E = ℝ`; `E = ∅`; `E = ℝ` | `P = ∅` perfect in Mathlib's sense; `P = [-1,1]`; `f = 0`; `f = 1` | true | none |
| 7.3 density topology | order on topologies; null sets; measurability route; non-normality route | `<` is strictly finer; null `s` has density `0` everywhere; `U = Gᶜ ∪ (U ∩ G)`, `U ∩ G` null; at `q`: `1 + 3/4 > 1` | true | N01 |
| Scope: Jordan decomposition in Tau Ceti | search at the pin | no declaration found | unsupported pointer | C02 |

- Source locators checked against the text: 0 of about 85; the sources service found no legal copy of any of the nine books.
- Library declarations opened at the pin: 16 (`TauCeti/MeasureTheory/Covering/EssentialBoundary.lean` 81, 137, 151, 402; `TauCeti/MeasureTheory/Function/Lusin.lean` 138; `TauCeti/MeasureTheory/Function/MetricDerivative/Variation.lean` 141; `TauCeti/MeasureTheory/Function/AreaFormula/Curve.lean` 115; `TauCeti/Topology/EMetricSpace/BoundedVariation.lean` 49; `TauCeti/Analysis/SpecialFunctions/CantorFunction.lean` 162, 174, 226, 231, 245; `Mathlib/Analysis/Calculus/MeanValue.lean` 119; `Counterexamples/NowhereDifferentiable.lean` 109, 235); the 29 `#check` lines of `Suggested.lean` all elaborate.
- Cross-roadmap citations resolved: GeometricMeasureTheory G1, G3, G5 (README line 248), PDE §1.1 (line 677), Poincare3D §11.1 (line 1226), all on main; NonabsoluteIntegration at its open head cites this roadmap for §§1.1, 3.1, 4.3.
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, 50 `sorry` warnings and no other; no `sorry` in a definition, no `set_option`; nothing changed outside the roadmap folder.
- One-tactic probe on a scratch copy (13 attempts with `simp`, `rfl`, `infer_instance`, `simp` with the definitions unfolded, on the corollary, the density-topology statements, the Baire-class and property (N) checks, `hasDerivAt_iff_dini` and the variation inequality): none closes. The ten statements that mirror Checks are marked as sanity checks.
- Elaborated signatures compared with the README for all 62 declarations: same hypotheses and generality; no section binder lost.
- Mathlib and Tau Ceti searched by object for Dini derivatives, Helly selection, property (N), Baire class one, approximate continuity and the density topology: none found.

Overlap check: read NonabsoluteIntegration (open), GeometricMeasureTheory (main), YoungIntegrationAndRoughPaths and Isoperimetry (open, by search), GaussianIsoperimetryAndClusters (main, by search); NonabsoluteIntegration consumes the Dini derivatives and property (N) and names this roadmap as owner (its Lean file keeps local copies in its own namespace); density and Lebesgue's density theorem are owned by GeometricMeasureTheory G5 and cited here; nothing else shared.

Source independence: 0 passages compared with 0 sources, because none of the nine cited books could be read legally; largest share Bruckner, about 30 of 85 locators; its table of contents could not be read. By the README's own locators, Layers 1, 2, 5 and 7 draw on its Chapters IV, XI, III and II in that order, which is not a run of chapters in the source's order.

Research link: Layers 1–4 and 7 are prerequisites of the descriptive theory of the Denjoy, Perron and Henstock–Kurzweil integrals, planned in the open roadmap NonabsoluteIntegration, which cites §§1.1, 3.1, 4.3; Layers 5 and 7 of the Zahorski classes (Bruckner, 1978, Chapter VI). Rests on the README and on that roadmap's text.

## Not verifiable

- Every locator into Bruckner, Thomson, Hewitt–Stromberg, Benedetto–Czaja, Kechris and Kharazishvili, including all fifteen sampled targets: the publisher pages are paywalled and the texts are not held locally.
- Every locator into Leoni and Bourbaki: no legal copy found; Stein–Shakarchi: the lookup failed on a network error and no copy was found.
- What Bruckner, p. 189, states about property (N) on `{0 ≥ D⁺f > -∞}` (§2.3), and the attribution of the Goldowski–Tonelli proof to Saks (Thomson, §56).
- The content of the proposed Mathlib file named under *From Mathlib*: it is not in the pinned Mathlib.

Automatic checks set aside as false positives: the report of a section comment with no declaration under it, for the closing block of `Suggested.lean`, which holds only `#check` lines pinning library declarations, as is allowed.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bruckner, *Differentiation of Real Functions* (1978), has the largest share of the locators (about 30 of 85). Neither its text nor its table of contents could be read; wording and arrangement were compared with no source.
- **Licence.** README, *Prior formalization*: §§1.1, 2.1, 3.2, 5.1, 7.1 start from the author's Lean project CKMA (github.com/bjbraams/lean-CKMA, Apache 2.0 by the README's statement). `Suggested.lean` was not compared with its files.
- **Scope.** The sources are textbooks and monographs of 1975–2017 on classical real analysis; the only consumer found is the open roadmap NonabsoluteIntegration, by the same author.
