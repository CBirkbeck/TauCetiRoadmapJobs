# FIX-DESIGN-SchattenClassesAndSchurMultipliers~6

Repair of the four findings (all P3) of review REV-DESIGN-SchattenClassesAndSchurMultipliers~5.
Files changed: `packages/SchattenClassesAndSchurMultipliers/design/README.md` and
`packages/SchattenClassesAndSchurMultipliers/design/plan.json`. `sources.toml` is unchanged: no
work was newly cited, so no text was fetched or requested. There is no `Suggested.lean` at the
design stage.

## F01 (P3) — applied

Confirmed. Take a discrete `X` with more than continuum many points, `μ = δ_{x₀}` and
`M = 1_{x=y}`. Then `M` is continuous, but it is not measurable for `𝔅(X) ⊗ 𝔅(X)`. At the pin,
`Prod.opensMeasurableSpace` (`Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean` line 406)
needs `SecondCountableTopologyEither`.

Changes:
- **§8.2 route.** After the passage to a finite Radon measure there is a new step: compacts `K_j`
  increasing with `μ(X ∖ K_j) < 1/j`, then Stone–Weierstrass on `K_j × K_j`, so `M · 1_{K_j×K_j}`
  is product-measurable and has `M · 1_N` as its everywhere limit, with a null complement.
- **§8.2 Checks.** New Check: the witness above, with a proof that the diagonal is not in the
  product σ-algebra, class `1` and `‖S_M‖_p = 1`.
- **Same gap in §8.1.** §8.1 integrates continuous compactly supported `F` against `μ ⊗ μ` and
  `μ_α ⊗ μ_α`, which has the same gap. It now proves that such `F` are product-measurable (by
  Stone–Weierstrass on `K × K`).
- **Supplier contract, Needs lines and plan.** Added to `From Mathlib`, to the Needs lines and
  plan prerequisites of 8.1 and 8.2, and to the Layer 8 Dependencies:
  - `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`, the complex
    version, which saves splitting `M` into its real and imaginary parts;
  - `exists_continuous_zero_one_of_isClosed`, which shows that continuous functions separate
    points on compact Hausdorff `K`.

## F02 (P3) — applied

Confirmed. `μ = 0` is σ-finite and atomless, and the only measure equivalent to it has mass `0`.

§7.3 route: "pass to an equivalent probability measure (§3.7, §7.1)" → "pass to an equivalent
finite measure (§3.7, §7.1; for `μ = 0` it is `0`, every `L²` space is `0` and both sides are
`0`)". The rest of the route needs only finiteness: §7.2 is stated for a finite measure, §7.1
splits sets of finite measure, and §5.2 needs `μ` σ-finite on each `𝓑_α`, which a finite measure
gives. Searched for "probability" across the README: §7.3 was the only reduction of this kind.
§6.4 ("finite measure") and §8.2 ("equivalent finite Radon measure") were already right.

## F03 (P3) — applied

Confirmed at the pin. `ProbabilityTheory.gaussianReal_zero_var`
(`Mathlib/Probability/Distributions/Gaussian/Real.lean` line 227) says `gaussianReal m 0 = δ_m`.

Layer 7 Examples: "Gaussian measures" → "Gaussian measures of nondegenerate covariance, for
instance `gaussianReal m v` with `v > 0`". These have null singletons
(`ProbabilityTheory.nullSingletonClass_gaussianReal`, line 233), so they are atomless on the
standard Borel `ℝ` by §7.1. Variance `0` is named as excluded (an atom, `L² = ℂ`). The three
Mathlib names are added to `From Mathlib` as "used only in the examples of Layer 7". The other
"Gaussian" occurrences (§9.4) are Gaussian functions, not measures, and were left alone.

## F04 (P3) — applied differently

Partly disputed. The review says V13b states no interface. In fact VonNeumannAlgebras
`TauCetiRoadmap/VonNeumannAlgebras/README.md` lines 5182–5185, in §13.2, builds "the Hilbert-space
ultraproduct of a sequence of counterexamples" and then says "Prove quotient inner product,
completeness, coordinate norm and action identities". So the three properties the contract named
are proved there. They are steps of a route (Haagerup's uniqueness of the injective III₁ factor,
lines 5145–5210), not API bullets.

Changes:
- **Contract.** It now says "V13b (§13.2)", gives the quotient description (bounded sequences
  modulo `lim_𝒰 ‖x_n‖ = 0`), names the route where V13b builds it and proves the three
  properties, and says that §6.4 uses it for a non-principal `𝒰`.
- **§6.4 route.** It states the three facts it consumes: `⟨[x_n],[y_n]⟩ = lim_𝒰⟨x_n,y_n⟩`,
  `‖[x_n]‖ = lim_𝒰‖x_n‖`, and completeness.
- **Non-principal ultrafilter.** The old text did not say that `𝒰` must be non-principal, though
  the route needs it twice: for `lim_𝒰 ‖ξ_n‖_∞ ≤ ‖S_M‖_∞^{1/2}` and for `lim_𝒰` to agree with the
  Lévy limit. It now says so.
- **Checks.** Added the reviewer's test on `K_n = ℂ` and a principal-ultrafilter negative control.
- **Plan.** The supplier `what` in plan.json is updated to match.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| §8.2 measurability step | discrete `X`, `\|X\| > 𝔠`, `δ_{x₀}`, `1_{x=y}` | `K_j = {x₀}`, `M·1_{K×K} = 1_{(x₀,x₀)}`, `μ⊗μ = δ_{(x₀,x₀)}`, class `1`; only `Σ ⊆ {x₀}`, `1 × 1` matrix `[1]`, norm `1 = ‖S_M‖_p` | sound; Check added |
| §8.2 measurability step | `μ = 0` | `K_j = ∅`, `N = ∅`, class `0`, every norm `0`; `supp μ = ∅`, only the empty matrix, norm `0 ≤ C` | sound |
| §8.2 measurability step | `μ = δ₀ + δ₁` on `ℝ`, `M(0,1) = M(1,0) = 2`, diagonal `1` | `K_j = {0,1}`, class is `[[1,2],[2,1]]`, `‖S_M‖_∞ = 2` (eigenvalues `3, −1`) | sound, agrees with the existing Check |
| §8.1 product measurability | discrete `X`, `\|X\| > 𝔠`, `F = 1_{(a,b)}` | `K = {a,b}`, `F = 1_{a}(x)1_{b}(y)`, a rectangle; `1_{x=y}` has non-compact support when `X` is infinite, so it is not a test function | sound, no conflict with the §8.2 Check |
| §6.4 ultraproduct facts | `K_n = ℂ`, non-principal `𝒰` | `⟨[1],[i]⟩ = conj(1)·i = i`; `‖[1+1/n]‖ = lim(1+1/n) = 1` | sound |
| §6.4 non-principal `𝒰` | principal at `k`; `[0,1]`, `M = 1_{x<y}`, dyadic `𝓑_n`, `k = 0`, `u = 1_{[0,1/2)}`, `v = 1_{[1/2,1]}` | `∫∫uvM = 1/4`; `M₀ = 1/2`, `∫∫uvM₀ = 1/8 ≠ 1/4`; and `‖a‖² ≤ ‖S_M‖ + 1/k` only | the hypothesis is needed; added |
| §6.4 bound `‖a‖‖b‖ ≤ ‖S_M‖_∞` | general | `‖a(u)‖ = lim_𝒰‖∫uξ_n‖ ≤ ‖u‖₁ lim_𝒰(‖S_M‖+1/n)^{1/2} = ‖u‖₁‖S_M‖^{1/2}`, the same for `b` | sound |
| §7.3 finite-measure reduction | `μ = 0`; Lebesgue on `ℝ`; Lebesgue on `[0,1]` | `0 = 0`; `w = e^{−x²}/√π`, total mass `1`, equivalent and atomless (§7.1 invariance); already finite | sound |
| Layer 7 Gaussian example | `gaussianReal 0 1`; `gaussianReal m 0` | density, `{x}` null, atomless; `= δ_m`, `{m}` an atom, `L² = ℂ`, `‖S_M‖ = ‖S_M‖_cb = \|M(m,m)\|` (conclusion true, hypothesis false) | sound; excluded case named |

## Checks run

- **Dependency check** (`tauceti-roadmap gate --only SchattenClassesAndSchurMultipliers`):

  ```
  candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
  depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line.
- **Citation resolve** (`roadmaps resolve` on the README): no unresolved cross-roadmap citation and
  no unresolved Lean name. The tool did not check names outside TauCetiRoadmap, so each new
  Mathlib name was located at the pin by hand, with its namespace confirmed:
  - `Topology/ContinuousMap/StoneWeierstrass.lean` 399 (root, the `ContinuousMap` namespace closes
    at 351);
  - `Topology/UrysohnsLemma.lean` 322 (root);
  - `Topology/Separation/Regular.lean` 606 (`NormalSpace.of_compactSpace_r1Space`);
  - `Probability/Distributions/Gaussian/Real.lean` 220, 227, 233 (`ProbabilityTheory`);
  - `MeasureTheory/Constructions/BorelSpace/Basic.lean` 406.
- **Other mechanical checks:**
  - The Needs lines of 6.4, 7.3, 8.1 and 8.2 match their plan prerequisites (script).
  - `plan.json` parses.
  - The README has no LaTeX delimiters and no machine paths.
  - The number of lines over 102 characters is unchanged (11 before, 11 after).
- **`#check` audit:** not applicable. There is no Lean file at the design stage, and no Lean
  process was started.

## Notes for the maintainer

- No id this roadmap defines was renamed or removed, and no other roadmap cites this one.
- Ownership: the Hilbert-space ultraproduct stays with VonNeumannAlgebras V13b. Mathlib at the pin
  has only model-theoretic ultraproducts and `Filter.Germ` products, and Tau Ceti has none.
  CStarClassification §5.1 owns C*-ultrapowers and CategoricalOperatorAlgebras owns tracial and
  Ocneanu ultrapowers; neither is the Hilbert-space object.
- F04 note: VonNeumannAlgebras proves the ultraproduct's properties inside one route rather than
  as an API. A future revision of that roadmap that lifts them into a named API target would let
  this contract cite that target directly. This is not a defect here.
