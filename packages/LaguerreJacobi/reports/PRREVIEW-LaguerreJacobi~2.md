# Review of LaguerreJacobi (pull request #117 at b01ad60)

**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` is absent; the gate fails

**Location:** folder `TauCetiRoadmap/LaguerreJacobi/` (only `README.md`, `metadata.toml`); gate: `missing-files: TauCetiRoadmap/LaguerreJacobi/Suggested.lean`.
**Claim:** the roadmap can ship README-only; its headlines need not be stated.
**Witness:** at the pins, a scratch file with the A1 and C2 sums as definitions, both measures, B3 and F1's Legendre orthogonality elaborates with only `sorry` warnings. The README's 26 backticked names of this roadmap's own are declared nowhere.
**Repair:** add `TauCetiRoadmap/LaguerreJacobi/Suggested.lean` with `import Mathlib` and `import TauCeti.Analysis.InnerProductSpace.WeightedOrthogonalBasis`, the four definitions below (tested), and these sorried headlines: B3; D3 with `jacobiNormSq` covering `n = 0, α + β = −1`; B4 and D4 with their `coe_` pins; F1's Legendre orthogonality; F3's identification with `Polynomial.Chebyshev.T` and `measureT`. Then delete from the README every backticked name of this roadmap's own that the file does not declare.

```lean
open Polynomial MeasureTheory

noncomputable def laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) : R[X] :=
  ∑ k ∈ Finset.range (n + 1),
    ((-1 : R) ^ k * (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      (ascPochhammer R (n - k)).smeval (α + k + 1))) • X ^ k

noncomputable def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

noncomputable def laguerreMeasure (α : ℝ) : Measure ℝ :=
  (volume.restrict (Set.Ioi 0)).withDensity fun x => ENNReal.ofReal (x ^ α * Real.exp (-x))

noncomputable def jacobiMeasure (α β : ℝ) : Measure ℝ :=
  (volume.restrict (Set.Ioo (-1) 1)).withDensity
    fun x => ENNReal.ofReal ((1 - x) ^ α * (1 + x) ^ β)

theorem integral_laguerre_mul_laguerre_laguerreMeasure (α : ℝ) (hα : -1 < α) (m n : ℕ) :
    ∫ x, (laguerre α m).eval x * (laguerre α n).eval x ∂(laguerreMeasure α) =
      if m = n then Real.Gamma (n + α + 1) / n.factorial else 0 := by
  sorry
```

## R02 (P1) — the degree hypothesis for `gegenbauer` is false

**Location:** README lines 502–506: "The leading coefficient of the sum carries the factor `(2λ)ₙ` … Carry the algebraic hypothesis `(ascPochhammer R n).smeval (2*lam) ≠ 0`".
**Claim:** `(2λ)ₙ ≠ 0` implies `degree (gegenbauer lam n) = n`.
**Witness:** the line-487 sum over `ℚ` at `λ = −1`, `n = 2`: `(2λ)₂ = 2 ≠ 0` but `(λ)₂ = 0`, and `C₂ = 1` has degree 0. The leading coefficient is `2ⁿ(λ)ₙ/n!` (DLMF Table 18.3.1); at `λ = 3`: `6, 24, 80`, while `(6)ₙ = 6, 42, 336`.
**Repair:** use the hypothesis `(ascPochhammer R n).smeval lam ≠ 0` (over `ℝ` it follows from `0 < lam`). Replace the sentence with "The leading coefficient of the sum is `((2^n : ℚ) / n!) • (ascPochhammer R n).smeval lam`." Add the negative-control Check `gegenbauer (−1) 2 = 1`.

## R03 (P2) — C1 restates a Mathlib lemma and claims a gap that does not exist

**Location:** README lines 330–333: "What is genuinely missing is the **real interval integral itself**. … nothing in Mathlib identifies that with the real-variable, `Real.rpow` integrand".
**Claim:** Mathlib at the pin lacks the real Beta interval integral.
**Witness:** `ProbabilityTheory.lintegral_betaPDF` (`Mathlib/Probability/Distributions/Beta.lean` line 78) gives `∫⁻ x in Ioo 0 1, ofReal (1/beta α β * x^(α−1) * (1−x)^(β−1))` (`Real.rpow`); `lintegral_betaPDF_eq_one` (line 108, `0 < α`, `0 < β`) shows it equals `1`.
**Repair:** under "What Mathlib already has", cite `ProbabilityTheory.lintegral_betaPDF`, `lintegral_betaPDF_eq_one`, `betaMeasure` (line 132) and `isProbabilityMeasureBeta` (line 135). Restate C1 as their corollary in Bochner interval-integral form, with those four as its `*Needs:*`. Delete the quoted sentences. Prove D1's `IsFiniteMeasure` from `isProbabilityMeasureBeta` after the substitution `x = 2t − 1`.

## R04 (P3) — wrong name for the bounded-support exponential-moment lemma

**Location:** README lines 206 and 414: `TauCeti.Integrable.exp_abs_smul_of_ae_abs_le`.
**Claim:** the cited Tau Ceti declaration exists under this name.
**Witness:** at the pin, `#check @TauCeti.Integrable.exp_abs_smul_of_ae_abs_le` fails with "Unknown identifier". The declaration is `MeasureTheory.Integrable.exp_abs_smul_of_ae_abs_le` (`TauCeti/MeasureTheory/Function/BoundedSupportExponential.lean` line 56).
**Repair:** rename it at both places. The lemma takes `Integrable g μ` (here `g = 1`), so add D1's `IsFiniteMeasure` to D2's `*Needs:*`.

## R05 (P3) — a hypothesis of `integrableOn_rpow_mul_exp_neg_mul_rpow` is misquoted

**Location:** README lines 154–155: "`-1 < s → 1 ≤ p → 0 < b → …`. Note `1 ≤ p`, so `p = 1` is the boundary case and is covered."
**Claim:** the lemma requires `1 ≤ p`.
**Witness:** at the pin the elaborated type is `-1 < s → 0 < p → 0 < b → IntegrableOn (fun x => x ^ s * Real.exp (-b * x ^ p)) (Set.Ioi 0) volume` (`GaussianIntegral.lean` line 74).
**Repair:** quote `0 < p` and delete the sentence "Note `1 ≤ p`, so `p = 1` is the boundary case and is covered."

## R06 (P3) — a foreign revision pin, a URL and process narrative

**Location:** README lines 183–192: "These names are read from Tau Ceti at `0a9009b` … deliberately not done in this pull request". Lines 562–579: "mathlib4 #41840", "Tau Ceti #1474", "merged 2026-07-30", "introduced to each other on Zulip".
**Claim:** the roadmap's contract is Tau Ceti `0a9009b`.
**Witness:** `lake-manifest.json` pins Tau Ceti at `a91d3aa`. The cited declarations are there: `WeightedOrthogonalBasis.lean` lines 169, 180, 193; `PolynomialCompleteness.lean` line 165; `Determinacy.lean` line 243. The house style excludes pull-request numbers, dates and handles.
**Repair:** replace lines 183–192 with an `## Exact supplier contracts` subsection `From Tau Ceti` that names each declaration and its file at the pin. Delete the `0a9009b` sentence and the URL. Delete "Coordination and what is already in motion"; if the fact that `OrthogonalL2Bases` Part A owns Hermite is wanted, state it in the scope section.

## R07 (P3) — the block quote attributes absent sentences to `OrthogonalL2Bases`

**Location:** README lines 17–21: "That roadmap is [LaguerreJacobi] … consumes this area's completeness toolkit (B1) and bridge (B2) … (The source roadmap has since been completed and archived to [Completed/OrthogonalL2Bases](…).)"
**Claim:** the block reproduces `OrthogonalL2Bases`.
**Witness:** on main (`c9dea9d`), the passage in `Completed/OrthogonalL2Bases/README.md` (lines 387–389) ends at "not here."; the last two quoted sentences are not in it. The link now resolves. "Has since been" is process narrative.
**Repair:** replace lines 13–21 with: "`OrthogonalL2Bases` ([Completed](../../Completed/OrthogonalL2Bases/README.md)) leaves the Laguerre and Jacobi families to a separate roadmap, since Mathlib defines neither; this is that roadmap, and it consumes that roadmap's completeness toolkit (B1) and bridge (B2)."

## R08 (P3) — five targets are named without a statement

**Location:** README line 250, `laguerre_add_one_sub` "relating …"; line 389, `jacobi_one`; line 393, `jacobi_succ_succ`, "the three-term recurrence"; line 471, `shiftedLegendre_eq_jacobi_comp` "relating them"; line 472, `integral_shiftedLegendre_mul_shiftedLegendre` (no constant).
**Claim:** the names fix their statements.
**Witness:** Mathlib's `shiftedLegendre 1 = 1 − 2X`, but `(jacobi 0 0 1).comp (2X − 1) = 2X − 1`. Exact over `ℚ` for `n ≤ 5`, `shiftedLegendre n = Pₙ(1 − 2X)` always, while `Pₙ(2X − 1)` agrees only for even `n`. So "relating" admits a false reading.
**Repair:** state each target:
- `laguerre α (n+1) = laguerre (α+1) (n+1) − laguerre (α+1) n` (DLMF 18.9.13);
- `jacobi α β 1 = C (α+1) + ((1:ℚ)/2) • (C (α+β+2) * (X − 1))`;
- for `1 ≤ n`, with `s = 2n+α+β`: `C (2(n+1)(n+α+β+1)s) * P_{n+1} = C (s+1) * (C ((s+2)s) * X + C (α²−β²)) * Pₙ − C (2(n+α)(n+β)(s+2)) * P_{n−1}` (DLMF 18.9.2);
- `(shiftedLegendre n).map (Int.castRingHom R) = (jacobi 0 0 n).comp (1 − 2 • X)`;
- `∫ x in (0:ℝ)..1, P̃ₘ(x) P̃ₙ(x) = if m = n then 1/(2n+1) else 0`.

## R09 (P3) — ring division inside `C` contradicts the ℚ-scalar convention

**Location:** README line 394: `derivative (Pₙ₊₁^{(α,β)}) = C ((n + α + β + 2)/2) * Pₙ^{(α+1,β+1)}`.
**Claim:** the display typechecks over `[CommRing R] [Algebra ℚ R]` (lines 231–235).
**Witness:** at the pin, `example {R : Type*} [CommRing R] [Algebra ℚ R] (a : R) : R[X] := C (a / 2)` fails: "failed to synthesize `HDiv R ℕ R`". The ℚ-scalar form `((1 : ℚ) / 2) • C a` elaborates.
**Repair:** write `derivative (jacobi α β (n+1)) = ((1 : ℚ) / 2) • (C (n + α + β + 2) * jacobi (α+1) (β+1) n)`, and `((1 : ℚ) / 2^n) •` at line 367.

## R10 (P3) — the README is not in roadmap shape, and no target has a locator

**Location:** the whole README; its headings are `## Overview`, `## Scope boundary …`, `## Generality bar …`, `## Part A` … `## Part F`, `## Anti-vacuity`, `## Dependency ordering`, `## Coordination …`.
**Claim:** the README is in roadmap form.
**Witness:** none of these appears: `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## Layer k`, `*Needs:*`, `**Checks.**`, `### Dependencies`, `## Downstream consumers`. No target carries a locator. `laguerre`, `laguerreMeasure`, `jacobiMeasure` and `jacobiNormSq` have no Checks.
**Repair:** restructure Parts A, B, C, D and E/F into `## Layer 1`–`## Layer 5` with `### k.n` subsections. Give each target one `*Needs:*` line and a locator, and each definition a `**Checks.**` list (A4 and the Anti-vacuity section supply the material). Cite DLMF chapter 18, which is open, in References with these locators:
- Table 18.3.1: weights, `hₙ`, `kₙ`;
- 18.5.5 with Table 18.5.1: Rodrigues;
- 18.5.8, 18.5.10, 18.5.12: the explicit sums;
- 18.6.1 and Table 18.6.1: special values and reflection;
- 18.7.1 and 18.7.3: Gegenbauer and Chebyshev;
- 18.9.2, 18.9.13, 18.9.15: recurrences and derivatives.

## R11 (P3) — the measures are not the bridge's, so B4 and D4 are not instantiations

**Location:** README lines 279–280: "`(volume.withDensity fun x => ENNReal.ofReal (x ^ α * Real.exp (-x))).restrict (Set.Ioi 0)`"; lines 307–308: "these are instantiations, not proofs"; the same at lines 407–408 and 452–453.
**Claim:** B4 and D4 instantiate `TauCeti.hilbertBasisOfWeightedMeasure` at `Lp 𝕜 2 (laguerreMeasure α)` and `Lp 𝕜 2 (jacobiMeasure α β)`.
**Witness:** the bridge's type ends in `Lp 𝕜 2 (μ.withDensity fun x => ENNReal.ofReal (w x))`. At the pin, `rfl` fails for `(volume.withDensity w).restrict (Ioi 0) = (volume.restrict (Ioi 0)).withDensity w`; only `MeasureTheory.restrict_withDensity` proves it, and it needs `MeasurableSet`.
**Repair:** define both measures in the bridge's shape, as in R01's tested definitions, so that B4 and D4 are literal instantiations. Otherwise keep the current shape and name the `Lp` transport as a step of B4 and D4.

## R12 (P3) — the pull request description contradicts the head

**Location:** description: "the diff touches two lines: the top-level roadmap list, and the sentence in `OrthogonalL2Bases/README.md`"; "since Mathlib has only `Complex.betaIntegral`"; "Every Mathlib and Tau Ceti declaration cited … was checked to exist".
**Claim:** the description states this head's change.
**Witness:** `git diff --stat origin/main...HEAD` touches only the folder, and it adds `metadata.toml`, which "Markdown only" omits. README lines 143–147 consume `ProbabilityTheory.beta`. `TauCeti.Integrable.exp_abs_smul_of_ae_abs_le` is an unknown identifier (R04). `RepresentationTheory` and `OneParameterSemigroups` carry a `Suggested.lean` on main.
**Repair:**
- Replace the Scope section with "Adds `TauCetiRoadmap/LaguerreJacobi/` (`README.md`, `metadata.toml`, `Suggested.lean`); nothing outside the folder changes."
- Replace the Beta bullet with "The real Beta constant and its probability measure are consumed from Mathlib (`ProbabilityTheory.beta`, `lintegral_betaPDF_eq_one`); C1 is their interval-integral corollary."
- Rename the lemma as in R04.
- Delete the README-only precedent sentence and the "checked to exist" sentence.

## Previous findings

- R01 — not repaired: the folder holds only `README.md` and `metadata.toml`; the gate reports `missing-files: TauCetiRoadmap/LaguerreJacobi/Suggested.lean`.
- R02 — not repaired: line 502 "The leading coefficient of the sum carries the factor `(2λ)ₙ`"; line 505 "`(ascPochhammer R n).smeval (2*lam) ≠ 0`".
- R03 — not repaired: lines 330–333 "What is genuinely missing is the **real interval integral itself** … nothing in Mathlib identifies that with the real-variable, `Real.rpow` integrand".
- R04 — not repaired: lines 206 and 414 "`TauCeti.Integrable.exp_abs_smul_of_ae_abs_le`".
- R05 — not repaired: lines 154–155 "`-1 < s → 1 ≤ p → 0 < b → …`. Note `1 ≤ p`, so `p = 1` is the boundary case".
- R06 — not repaired: lines 183–184 "read from Tau Ceti at [`0a9009b`](https://github.com/…)"; lines 570 and 577 "mathlib4 #41840", "Tau Ceti #1474".
- R07 — partly repaired: line 21's link is now `../../Completed/OrthogonalL2Bases/README.md` and resolves; lines 17–21 still quote sentences the source lacks.
- R08 — not repaired: line 250 "`Polynomial.laguerre_add_one_sub` relating `Lₙ₊₁^{(α+1)}` to …"; line 393 "`Polynomial.jacobi_succ_succ`, the three-term recurrence."
- R09 — not repaired: line 394 "`C ((n + α + β + 2)/2) * Pₙ^{(α+1,β+1)}`".
- R10 — not repaired: the headings are still `## Overview` … `## Coordination and what is already in motion`, with no `*Needs:*` line and no locator per target. Its request for a folder `sources.toml` is withdrawn: no roadmap folder on main carries one.
- R11 — not repaired: lines 279–280 "`(volume.withDensity fun x => …).restrict (Set.Ioi 0)`"; line 307 "these are instantiations, not proofs".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Line 21 link (the change) | resolved from `TauCetiRoadmap/LaguerreJacobi/` | `../../Completed/OrthogonalL2Bases/README.md` exists at the head and on main; the old `../Completed/…` pointed to the absent `TauCetiRoadmap/Completed/…` | link holds | R07 (rest) |
| Quote, lines 15–21 | `Completed/OrthogonalL2Bases/README.md` lines 387–389 on main | sentences 1–2 present; "That roadmap is …" and "(The source roadmap has since …)" absent | misattributed | R07 |
| B2 bridge as cited by B4 | `μ = volume.restrict (Ioi 0)`, `w = x^α e^{−x}` | bridge measure `μ.withDensity (ofReal ∘ w)`; README's is `(volume.withDensity …).restrict (Ioi 0)`; `rfl` fails | needs a transport | R11 |
| B3 statable | scratch file at the pins | `laguerre`, `jacobi`, both measures and the B3 statement elaborate; only `sorry` warnings | statable | R01 |
| F1 Legendre orthogonality | `m, n ≤ 3`, exact over `ℚ` | `∫₀¹ P̃ₘP̃ₙ`: diagonal `1, 1/3, 1/5, 1/7`; off-diagonal `0`; the statement elaborates | holds, statable | R01, R08 |
| F1 transport | `n ≤ 5` | `shiftedLegendre n = Pₙ(1−2X)` for all `n`; `= Pₙ(2X−1)` only for even `n`; at `n = 1`: `1−2X` vs `2X−1` | orientation must be stated | R08 |
| A2 `laguerre_add_one_sub` | `α ∈ {0, ½, −⅓, 3}`, `n ≤ 3` | `L₂^{(0)} = 1 − 2X + X²/2 = L₂^{(1)} − L₁^{(1)}`; all 16 cases equal | holds | R08 |
| C3 `jacobi_one` | 5 parameter pairs | `P₁ = (α+1) + ½(α+β+2)(X−1)`; at `(0,1)`: `(3X−1)/2` | holds | R08 |
| C3 recurrence (multiplied out) | 5 pairs, `n = 1..3` | at `(0,0)`, `n = 1`: `16P₂ = 24X² − 8`, so `P₂ = (3X²−1)/2`; all 15 cases equal | holds | R08 |
| C3 `derivative_jacobi` | 5 pairs, `n = 0..3` | `P′ₙ₊₁ = ½(n+α+β+2)Pₙ^{(α+1,β+1)}`; `(0,1)`, `n = 0`: `3/2 = 3/2`; `C (a / 2)` fails, `HDiv R ℕ R` | identity holds; display ill-typed | R09 |
| F2 degree | `λ = −1`, `n = 2` | `(2λ)₂ = 2`, `(λ)₂ = 0`, `C₂ = 1`, degree 0 | false | R02 |
| F2 leading coefficient | `λ = 3`, `n = 1..5` | `6, 24, 80, 240, 672 = 2ⁿ(λ)ₙ/n!`; `(2λ)ₙ = 6, 42, 336, 3024, 30240` | README's factor wrong | R02 |
| F2 Gegenbauer–Jacobi identity | `λ = −1`, `n = 2` | LHS `(−½)₂ · 1 = −¼`; RHS `2 · P₂^{(−3/2,−3/2)} = 2 · (−⅛) = −¼` | holds | — |
| C1 Beta integral | `(u,v) = (2,3)`, `(½,½)` | `∫₀¹ x(1−x)² = 1/12 = Γ(2)Γ(3)/Γ(5)`; `Γ(½)² = 3.14159 = π` | holds; already in Mathlib | R03 |
| B2 exponential moment | `α = −½`, `a = ½` | lemma value `(½)^{−½} Γ(½) = 2.50663 = √(2π)`; elaborated hypothesis `0 < p` | holds | R05 |
| D2 exponential moment | `α = β = 0`, `a = 1` | `∫₋₁¹ e^{|x|} = 2(e−1) = 3.43656` (quadrature `3.43656`); the cited name is an unknown identifier | holds; name wrong | R04 |
| Tau Ceti pin | manifest vs README | manifest `a91d3aa`; README `0a9009b`; bridge declarations at `a91d3aa` lines 169, 180, 193 | foreign pin | R06 |
| Checks per definition | 6 definitions | `jacobi` 3 (lines 360–368), `gegenbauer` 3 values (490–491); `laguerre`, `laguerreMeasure`, `jacobiMeasure`, `jacobiNormSq` 0 | below three | R10 |
| Description vs head | outside-folder diff; README line 143 | diff empty vs "touches two lines"; `ProbabilityTheory.beta` consumed vs "Mathlib has only `Complex.betaIntegral`" | contradicted | R12 |

The rows for untouched statements stand as in the previous review, of `5aad605`.

- Gate at `b01ad60`: `missing-files=1 FAIL` (R01); no other rule fails. Depcheck (`--movable`): `depcheck: 230 roadmaps, 2065 edges, 0 problem(s)`, with no UPWARD or CYCLE line; `LaguerreJacobi` is line 407 of the merge order, and its supplier `OrthogonalL2Bases` is on main (Completed: B1 line 250, B2 line 275, B3 line 318).
- Outside the folder, `git diff --stat origin/main...HEAD` is empty. The pins are unchanged since `5aad605`: Mathlib `6b7abb3`, Tau Ceti `a91d3aa`.
- Elaboration: there is no `Suggested.lean`. One scratch file was elaborated with `lake env lean` after `lake build` of the two Tau Ceti modules it imports. It held 8 `#check`s, 2 R09 examples, the R11 `rfl` and the R01 skeleton (4 definitions, 2 sorried theorems). Only the expected errors and `sorry` warnings appeared.
- Library declarations opened at the pins: 11. Mathlib: `Beta.lean` lines 78, 108, 132, 135; `GaussianIntegral.lean` line 74; `restrict_withDensity`. Tau Ceti: `BoundedSupportExponential.lean` line 56; `WeightedOrthogonalBasis.lean` lines 169, 180, 193; `PolynomialCompleteness.lean` line 165; `Determinacy.lean` line 243.
- Seeded sample: no sampled target falls in the changed line. The targets a finding touches have rows above; the others stand as in the previous review.
- Overlaps: `overlaps.md` lists none. NoncompactQuantumSymmetry, QuantumFoundations and SpecialFunctionsBessel (open) consume A–B and F2; none of their citations breaks under these repairs.
- Remark: the open SpecialFunctionsLegendre §7.3 also states DLMF 14.17.6, whose `m = 0` case is F1's Legendre orthogonality. LaguerreJacobi is earlier in the merge order, so that roadmap should cite F1.

## Not verifiable

- Szegő, *Orthogonal Polynomials* §4.3: paywalled at the AMS landing page. D3's constant and `𝒜₀` were checked in DLMF Table 18.3.1 instead (previous review).
- Abramowitz–Stegun ch. 22: not re-read for this change. Its formulas were checked in the DLMF equations that cite them (previous review).
- Thangavelu, Temme, Askey: paywalled; cited as background only.
- Ownership against open pull requests outside the `roadmaps grep` index: not checked.

## Source issues

- none
