<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6905557787 -->
Red team round 2 pass a (claude) of 4e42d33

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the Layer 9 gap does not ask for the integral cusp parameter that §9.2 uses

   **Location.** `packages/ModularFormsPartII/README.md:108` (gap:udc-all-prime-cuspidal-model-of-full-level: "… with the cusp `∞` extending to a section through the smooth locus and the component of the smooth locus of each closed fibre through that section") and the same sentence in `design/plan.json`, `gaps[1].needs`; `README.md:1015` ("A connected finite étale cover gives, along the section ε, a formal germ with algebraic-integer coefficients of a modular function") and `README.md:1017` (*Needs* of §9.2).

   **Claim.** The gap, with ModularCurvesPartII §6.3, supplies what §9.2 needs to feed a germ along ε to §§6.5–6.6.

   **Witness.** Étaleness along ε gives coefficients in `𝓞_L[[s]]`, s a formal parameter of the model. With `s = q_N/π` (ε blown up at π), `Σ sⁿ = Σ π⁻ⁿ q_Nⁿ` has unbounded denominators. No cited section relates s to `q_N`.

   **Repair.** Same slug, one clause added, in `README.md:108` and in `gaps[1].needs`: after "through that section" append

   > ", and such that, for `N ≥ 6`, every function regular on the formal completion of the model along that section has an expansion with coefficients in `𝓞_K` in the Tate parameter `q_N = exp(2πiτ/N)` of the cusp `∞` (§§4.8, 4.11): the completion of the cyclotomic full-level curve of §4.11 along `∞` is `𝓞_K[[q_N]]` at every prime, and the minimal regular model receives the resolved curve by a contraction that is an isomorphism over K"

   In §9.2 replace "gives, along the section ε, a formal germ with algebraic-integer coefficients" by "gives, along the section ε, a germ whose expansion in the Tate parameter `q_N` has coefficients in the integers of a finite extension of K (gap:udc-all-prime-cuspidal-model-of-full-level)", and add "ModularCurvesPartII §§4.8, 4.11" to the *Needs* of §9.2 and to the Layer 9 Dependencies. Tested on the witness: a contraction replaces `q_N` by `s = πq_N`, and `𝓞[[πq_N]] ⊆ 𝓞[[q_N]]`, so the clause holds for the minimal model; the blown-up model, with `s = q_N/π`, fails it, as it must (§9.1 excludes that model).

2. **F02** (P3) §9.2: the step that makes the cover geometrically trivial is not in the plan, and `N ≤ 5` is not separated

   **Location.** `README.md:1015` ("Étaleness over the cuspidal model at every finite place then forces the congruence cover to be arithmetically constant, and it descends to `𝓞_K`") and `README.md:1017` (*Needs:* §§6.5, 6.6, 9.1; …).

   **Claim.** After §§6.5–6.6, étaleness at the finite places finishes the proof.

   **Witness.** `X₁(11) → X₀(11)`, the 5-isogeny `11a3 → 11a1` with constant kernel, is a congruence cover étale at every finite place of the connected Néron model. Only cusp widths N with §1.8 exclude such covers of `X(N)`.

   **Repair.** Replace the two sentences from "Étaleness over the cuspidal model" to "descends to `𝓞_K`" by:

   > "The cover is étale over the generic fibre `X(N)_K`, cusps included, so its subgroup `H ≤ ±Γ(N)` has every signed cusp width equal to N: every conjugate of `T^N` lies in `±H`, and `L(H) ∣ N` (§1.3). H being congruence, §1.8 gives `Γ(N) ≤ ±H`, so the cover is geometrically trivial: it is `X(N)_L` for a finite extension `L/K`. Its pullback along ε is `Spec 𝓞_L → Spec 𝓞_K`, finite étale; the cover and `𝒳_cusp(N) ×_{𝓞_K} 𝓞_L` are both normal and finite over `𝒳_cusp(N)` with function field that of `X(N)_L`, so they are equal. For `N ≤ 5` no germ is needed: `X(N)` has genus 0, and an unramified cover of degree d of a compact curve of genus 0 has genus `1 − d ≥ 0`, so `d = 1` (Riemann–Hurwitz, FuchsianOrbifolds Layer 5); the cover is again `X(N)_L` and the same pullback along ε applies."

   Add "§§1.3, 1.8" and "FuchsianOrbifolds Layer 5" to the *Needs* of §9.2, and "Layer 1 (§§1.3, 1.8)" and "FuchsianOrbifolds Layer 5" to the Layer 9 Dependencies; in "How to read the build", "Layers 7–9 depend on Layer 6" gains "and Layer 9 also uses §§1.3 and 1.8". Tested on the witness: the cusp of `X₀(11)` at `∞` has width 1 and the cover is unramified there, so no width condition constrains it; for a cover of `X(11)` étale at the cusps every signed width is 11, `L(H) ∣ 11`, and §1.8 gives `H = ±Γ(11)`: the analogue of the witness cannot occur.

3. **F03** (P3) the signed width, `±G` and irregular cusps exist in pinned Mathlib and are defined again without citation

   **Location.** `README.md:41` ("For a subgroup G, `±G = ⟨G, E⟩`"), `README.md:75` ("`TauCeti.Subgroup.integerCuspWidth` … a strict width at `∞`; §1.3 distinguishes it from the signed width"), `README.md:205` ("define the signed width `w_g(Γ)` as the least `m > 0` with `gT^m g⁻¹ ∈ ±Γ`"), `README.md:227–229` (§1.4, irregular cusps).

   **Claim.** The pinned libraries supply only the strict width; the signed width and `±G` are this roadmap's.

   **Witness.** Pinned Mathlib: `Subgroup.adjoinNegOne` (`NumberTheory/ModularForms/ArithmeticSubgroups.lean:220`, carrier `{g | g ∈ 𝒢 ∨ -g ∈ 𝒢}`); `Subgroup.periods`, `Subgroup.IsRegularAtInfty`, `Subgroup.strictWidthInfty`, `Subgroup.widthInfty := 𝒢.adjoinNegOne.strictWidthInfty` (`Cusps.lean:234, 243, 318, 329`). Pinned Tau Ceti: `ModularForm.discriminant_slash`, `ModularForm.mulDiscriminant` (`MulDiscriminant.lean:72, 49`).

   **Repair.** Add to "From Mathlib":

   > "`Subgroup.adjoinNegOne` (`ArithmeticSubgroups.lean`): the subgroup `{g | g ∈ 𝒢 ∨ −g ∈ 𝒢}`, the `±G` of Conventions. `Subgroup.strictPeriods`, `Subgroup.periods`, `Subgroup.strictWidthInfty`, `Subgroup.widthInfty`, `Subgroup.IsRegularAtInfty`, `Subgroup.isRegularAtInfty_of_neg_one_mem` (`Cusps.lean`), for `𝒢 ≤ GL₂(ℝ)`: the translations in `𝒢` and in `±𝒢`, the positive generators of the two groups (0 when the group is not discrete), and regularity at `∞`, their equality. Assumed for the image of a finite-index `Γ ≤ SL₂(ℤ)`: the signed width `w_g(Γ)` of §1.3 is `Subgroup.widthInfty` of the image of `g⁻¹Γg`, and the strict width is `Subgroup.strictWidthInfty`, equal to `TauCeti.Subgroup.integerCuspWidth`; these are real numbers, and §1.3 proves they are positive integers at finite index."

   In `README.md:41` write "`±G = ⟨G, E⟩` (Mathlib `Subgroup.adjoinNegOne`)"; in §1.3 open with "the signed width `w_g(Γ)` (Mathlib's `Subgroup.widthInfty` of `g⁻¹Γg`; its `Subgroup.strictWidthInfty` is the strict width)" and add the Mathlib names to its *Needs*; in §1.4 add to *Needs* "Tau Ceti `ModularForm.discriminant_slash`, `ModularForm.mulDiscriminant` (`TauCeti/NumberTheory/ModularForms/MulDiscriminant.lean`)". `Suggested.lean` may keep `G ⊔ Subgroup.zpowers (-1)`; if the worker replaces it by `G.adjoinNegOne` in `wohlfahrt_Gamma_le` and `ihara_generation`, the types are re-checked with `#check`. Tested on `H′`, `g = [[1, 0], [1, 1]]`: `g⁻¹H′g` contains `−T²` and `T⁴`, not `T²`; strict periods `4ℤ`, periods `2ℤ`: `strictWidthInfty = 4`, `widthInfty = 2`, the two values of the Check of §1.3.

4. **F04** (P3) the reduction factor `h₀` of §6.2 has no Check

   **Location.** `README.md:603` ("Let `h₀(τ) = λ(τ)/(16 η(τ/2)²)` … has weight `−1` … its expansion is `q^(11/12)` times an integral power series with constant term 1"); the Layer 6 Examples (`README.md:682–686`) do not mention `h₀`.

   **Claim.** Every definition has at least three discriminating Checks.

   **Witness.** §§6.3, 6.5, 6.6 and 7 pass through `h₀`; neither its weight sign, the argument `τ/2`, the exponent `11/12` nor the period 24 is pinned by a computed value. Count for `h₀`: 0 Checks.

   **Repair.** Add under §6.2:

   > "**Checks.**
   > - `h₀ = q^(11/12)(1 − 6q + 33q² − ⋯)` and `h₀⁻¹ = q^(−11/12)(1 + 6q + 3q² + ⋯)`, from `x/q = 1 − 8q + 44q²` and `∏(1 − qⁿ)⁻² = 1 + 2q + 5q²`; both are integral.
   > - The weight is `−1`, not `+1`: for `f = η(τ/2)²`, of weight 1, `f·h₀ = λ/16` has weight 0, while `f·h₀⁻¹` would have weight 2.
   > - The period is 24 and not 12: `q^(11/12) = exp(2πi·11τ/24)` is multiplied by `exp(11πi) = −1` under `τ ↦ τ + 12`. For `f = 1`, `k = 1`, `h = 1`, the product `f·h₀` has an expansion in `exp(2πiτ/24)` and none in `exp(2πiτ/12)`."

   Computed here: `(1 − 8q + 44q²)(1 + 2q + 5q²) = 1 − 6q + 33q²`; `(1 − 6q + 33q²)⁻¹ = 1 + 6q + 3q²`.

One P2 and three P3 findings (S01–S04). No statement of `packages/ModularFormsPartII/Suggested.lean` and no bold target of `packages/ModularFormsPartII/README.md` was refuted. All eleven findings of round 1 are repaired at this head, and no repair introduced an error.

## Round 1 findings at this head

| Round 1 id | Status | Witness at 4e42d33 |
|---|---|---|
| 1a/F01 (generation identity absent) | repaired | `Suggested.lean:168` `theorem ihara_generation … (hle : G ≤ Gamma N ⊔ Subgroup.zpowers (-1 : SL(2, ℤ)))`; module docstring lines 20–22; `README.md:517` "`ihara_generation`: let G be a normal finite-index subgroup …". Recomputed below: true on `G = ±Γ(N)` and by the kernel argument in general. |
| 1a/F02 (`hneg` redundant, strict form owned on main) | repaired | `Suggested.lean:79–82`: hypothesis and conclusion in `G ⊔ Subgroup.zpowers (-1 : SL(2, ℤ))`, no `hneg`; `README.md:259` "The strict form … is NoncongruenceModularForms §3.3 and is not stated here"; `README.md:25` names the consumer. |
| 1a/F03, 1b/F04 (retired ModularForms labels) | repaired | `README.md:11`: "(§0.2), the complex modular curve (Layer 10), … (§§8.0–8.1)"; no occurrence of "ModularForms Layer 0", "Layer 4" or "Worked examples" as a ModularForms label remains (grep: 0). The four Tau Ceti names exist at the pin (table below). |
| 1a/F04 (η multiplier cited to QSeries §5.2) | repaired | `README.md:605`: "the η multiplier ε of ModularForms §0.2 with `ε(γ)²⁴ = 1`"; "QSeriesPartitionsAndMockModularForms §5.2" and `ν_η`: 0 occurrences. `README.md:851`: `ρ = ε⁴`, `ρ(−I) = (−i)⁴ = 1`, `ρ(T) = exp(πi/3)`, recomputed. |
| 1a/F05, 1b/F05 (ModularCurvesPartII §5.13 without contract) | repaired | `README.md:104`: "§5.13: for `N ≥ 1` and a ring R with a ring map `ζ : ℤ[ζ_N] → R`, the fixed-pairing compactified curve `X(N, ζ)_R`, smooth and proper over `ℤ[1/N, ζ_N]`"; §4.10 added; both agree with the supplier's open head. |
| 1b/F01 (§6.4 absent) | repaired | `Suggested.lean:218` `theorem rational_unbounded_denominators`; docstring line 28; `README.md:624`; three Checks at `README.md:632–634`, recomputed (`Δ⁻¹/11`: `1, 24, 324` after `D = 11`). |
| 1b/F02 (compound gap, "globally nilpotent") | repaired | `README.md:130` and `design/plan.json` `gaps[2].needs` carry the single composite (Galochkin ⇒ regular singular, rational exponents ⇒ quasi-unipotent); "globally nilpotent": 0 occurrences in README. |
| 1b/F03 (pinned coefficient subfield not cited) | repaired | `README.md:82` contract entry; `README.md:402` (§3.1, inclusion) and `README.md:543` (§5.1, equality). `Subgroup.CompactifiedQuotient.coeffSubfield` is at `TauCeti/NumberTheory/ModularForms/QExpansion/FunctionField.lean:209`. |
| 1b/F06 (two unused `*Needs:*` edges) | repaired | "GeometryOfNumbers…" and "§1.5 (All-weight …)": 0 occurrences; §8.3 names its theta step, recomputed (`θ_q x = xθ₄⁴`, both `q − 16q² + ⋯`; Sturm bound `2·6/12 = 1` against `sturm_bound_finiteIndex_SL2Z`, `(k * Γ.index).toNat / 12`). |

## Dependency check

```
depcheck: 240 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap. `git diff --stat origin/main...HEAD` changes 13 files, all under `packages/ModularFormsPartII/`.

## Verified sound

Counts: 24 declarations read (every line of `Suggested.lean`); 64 README targets read (every line of the README); 41 source locators checked against the text (39 in CDT25, 2 in KSV10); 52 Checks, Examples and witnesses recomputed; 47 supplier sections resolved in 13 roadmaps at main or at their open heads; 44 pinned declarations opened at the pins. Elaborated signatures: the 24 types of the worker's `signatures.md` were compared one by one with the README statements; all agree; the file has no `variable` or `include`, so no binder can be lost; nothing changed. No Lean was run in this pass.

### Suggested.lean: declarations, context and computed instances

No section variables; opens `UpperHalfPlane CongruenceSubgroup Matrix`, scoped `MatrixGroups ModularForm Manifold`; imports `Mathlib` and `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent` (exists at the pin).

| Declaration (README §) | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `IsWeakForm` (1.1) | `Δ⁻¹`; `exp(j)`; odd k with `−I ∈ Γ`; growth filter | `exp(2π Im τ)` accepted; `exp(exp(2π Im τ))` rejected; `f = −f`; `atImInfty` is uniform in `Re τ` | sound |
| `wohlfahrt_Gamma_le` (1.8) | N = 0; N = 1; `H′`, N = 2 | `Γ(0) = ⊥` (`Gamma_zero_bot`); T and `STS⁻¹` generate, so `±G = SL₂(ℤ)`; `gT²g⁻¹ = [[−1,2],[−2,3]]`, negative in `H′`, `Γ(2) = ±H′` | true |
| `modularLambda` (2.1) | exponents; `ST⁻²S⁻¹`; `λ(τ + 1)` | `η(τ/2)⁸η(2τ)¹⁶/η(τ)²⁴`, `8(−1/24 + 2/12) = 1`; `[[1,0],[2,1]]`; `−16q − 128q² = −λ − λ²` | sound |
| `modularLambda_covering` (2.2) | boundary lines; `IsCoveringMapOn` | `u/(u−1) ∈ (−∞,0)`, `1/(1−u) ∈ (1,∞)` for `u ∈ (0,1)`; Mathlib asks evenly covered fibres over each point of the set | sound |
| `lambdaField`, `congruenceSpan`, `boundedDenominatorSpan` (3.0–3.2) | junk of `laurentQExpansion`; N = 0; `Γ₀(3)` | generators are `2N`-periodic with meromorphic cusp function, where the pinned definition (`cuspPoleOrder` twist) is the Laurent series; N = 0 excluded by `0 < N`; `[[1,0],[3,1]]·[[1,0],[2,1]]⁻¹ = [[1,0],[1,1]]` | sound |
| `nonabelian_ihara` (4.1) | both projections; `−I` | `D·(G ∩ Γ(N)) = Γ(N)` since `G ∩ Γ(N)` maps onto `SL₂(𝔽_p)`; `c(g) = [[a, pb],[c/p, d]] ∈ Γ(N)`; `−γ ∈ K ≤ Γ(N)` impossible for `N ≥ 3` | true as typed |
| `ihara_generation` (4.3) | `G = ±Γ(N)`; kernels | images `{1}×S×{1}` and `S×{1}×B` generate `S×S×B`; `ker(f₁, π) = G ∩ Γ(N) ∩ Γ(p) = G ∩ Γ(Np)`; third set is `±(A⁻¹GA ∩ D)` | true |
| `boundedDenominatorSpan_eq_congruenceSpan`, `…_finrank_le` (6.1) | both inclusions; N = 1 | stabilizer of an `R`-generator is congruence with `−I` and level `∣ 2N`; `1 ≤ C log 2` | sound |
| `unbounded_denominators`, `rational_…`, `algebraicInteger_…` (6.3, 6.4, 6.6) | `f = 0`; `Δ⁻¹/11`; `E₄η¹⁶` | trivial; `D = 11`; `1 + 248Q + 4124Q² + 34752Q³` (`6720 + 17280 + 10560 + 192`) | sound |
| `weakForm_galois_conjugate` (6.5) | `√2Δ⁻¹`; choice of cusp | conjugate `−√2Δ⁻¹`; two embeddings over the same `ℂ(j)` differ by `t ↦ ζt`, absorbed by `τ ↦ τ + m` | sound |
| `IsVectorValuedForm` (7.3) | cocycle; CDT Definition 7.3.1 | `(F∣γ)∣δ = ρ(γ)ρ(δ)F`; same law, semisimplicity and strip growth as CDT25 lines 3663–3680 | sound |
| `vectorValued_component_congruence`, `vectorValued_effective_mason` (7.11, 7.12) | `ρ = 1 ⊕ σ`; `F(hτ/2)` | `σ(R)`: trace −1, det 1; `σ(T) = [[2,1],[7,3]]`, `X² − 5X − 1`; `((c/M)(Mτ) + d) = cτ + d` | sound |
| `weakFormAlgebra`, `quasiModularWeakAlgebra`, `…_differential_closure` (8.1, 8.2) | `E₂`; D on generators | `E₂ ∣[2] S = E₂ + 6/(πiτ)`; `E₂ = (DΔ)Δ⁻¹`; `Df = ϑf + (k/12)E₂f` | sound |
| `HasCuspidalExpansionOver`, `congruenceKernel_no_deficient_place`, `exists_deficient_finite_place` (8.5–8.7) | `E₄`; odd k; clearing element | `240σ₃(m) > m^(3/2+ε)`; `F = 0`; one `d ∈ 𝓞_K` with `v(d)·C_v ≤ 1` on S | sound (8.7 rests on the `𝓞_K` form of §7.11, see Not verifiable) |

### README targets: values recomputed in this pass

| Statement | Instance | Values | Result |
|---|---|---|---|
| §1.2 zero insertion | `Q + |Q|²Q̄` | period 1: derivative 1 at 0, none elsewhere, series `t`; period 2: `0` | sound |
| §1.3 `H′` is a group | `a` modulo 4 | `(γγ′)₁₁ = aa′ + bc′ ≡ aa′` since b, c′ even | sound |
| §2.6 | ODE, `τ₀` | `z = 16x` in `z(1−z)F″ + (1−2z)F′ − F/4`; `2i/(4i+1) = (8+2i)/17`, factor `1 + 4i` | sound |
| §2.7 | `γ₂` from §5.1 formula | `8Γ(5/4)²/Γ(3/4)² = Γ(1/4)⁴/(4π²) ≈ 4.3769` | sound |
| §3.2 Check | Hauptmodul of `Γ₀(3)` | `Q^(12/24 − 36/24) = Q⁻¹` | sound |
| §3.4 | cusp parameter above `λ = 0` | width `w ∣ 2N`, `q^(2/w) = u^(2N/w)·unit`, `2N/w ∈ ℤ` | sound |
| §3.8, §6.1 | exponents | `log(1+A/N³) + log(1−A/(2N³)) ≈ A/(2N³)`; `N·C_B(log N)/N` | sound |
| §4.2 | Goursat on `(S×S)×B` | `T^N ↦ (1, 1, u)`, quotient of B factors through `B/U`, cyclic | sound |
| §5.2, §5.4 | exponent; degree | `q^(pn/N) = (q^(1/(Np)))^(p²n)`; `(8N³/12)(6/π²) = 4N³/π²` (CDT25 line 1843) | sound |
| §6.2 | `h₀` | `q^(1 − 1/12)`; `1 − 6q + 33q²` | sound; S04 |
| §6.8 | product for h | `(1+q^(2n))⁸(1−q^(2n−1))⁸(1+q^(2n−1))⁻¹⁶ = (1+q^(2n−1))⁻²⁴` by Euler | sound |
| §6.9 | 2-adic and 3-adic valuations | `(4−a)m − v₂(m!)`; `s₂(m) = 1,1,2,1,2,2,3,1,2`; `−m − v₃(m!) = −1,−2,−4,−5,−6,−8` | sound |
| §7.3 API | induced `ρ(T)` | `γT^Mγ⁻¹ ∈ Γ(M) ≤ Γ₀(M)`, blocks are images of parabolics | sound |
| Layer 7 Examples | `η⁴`; `μ = √2 − 1` | `1 − 4Q + 2Q² + 8Q³ − 5Q⁴`; `det ρ(T) = −1`, roots `is ± cos 2πμ` | sound |
| §8.3, §8.4 | first terms | `(1+2q)(1−8q+24q²) + 8q = 1+2q+8q²`, quotient `1 − 4q + 20q²`; `44 − 64 + 25 = 5` | sound |
| §9.1 | fibres of `𝒳_cusp` | connected, smooth, with the rational point `ε(v)`: geometrically connected | sound |
| §9.3 | why `X(N)` | all cusp widths N; Wohlfahrt kills unramified congruence covers | sound; S02 |

### Suppliers, ownership, policy

- Supplier sections read at main or at the open head and found to state what the contract says: SpecialFunctionsTheta §§2.2, 4.2, 6.1 (with the imaginary-axis results of its scope), 6.2, 6.4 and its Conventions (definitions of `θ₂`, `θ₄`, the region F); ModularCurvesPartII §§4.10, 5.13, 5.14, 6.3, 6.4, 6.5, 8.1, 11.4, 15.2, 15.3, 15.5, 15.6, 15.9, 15.10; DiophantineApproximationAndTranscendencePartII §§4.1, 4.5, 4.6, 4.7, 4.8; ConformalMappingPartII §§0.3, 0.5, 1.4, 1.8, 5.1, 5.5, 5.8, 9.19; QSeriesPartitionsAndMockModularForms §§8.1, 8.4a (eigenvalue real parts in `[0, 1)`); AlgebraicModularFormsAndSerreWeights §2.9; AutomorphicGaloisRepresentations §4.2; ModularForms §§0.2, 8.0, 8.1, Layer 10; NoncongruenceModularForms §§3.1, 3.3, 8.1, 8.2 and its use of W1.8 on full inverse images; headings of EtaleCohomologyFoundations §F.0.2, DiophantineApproximationAndTranscendence §§5.2–5.3, FuchsianOrbifolds Layers 2–6, BelyiMaps Layers 6, 9 (§9.1C), 11 (§11.1).
- SpecialFunctionsTheta is neither on main nor in the merge order; it is an open pull request that adds a new roadmap folder, which the brief allows, and the dependency check accepts it.
- The three declared gaps have the same slugs and sentences in `design/plan.json` and in the README, each with a named supplier; S01 concerns the precision of the second.
- Ownership: no declaration of `Suggested.lean` has the fully qualified name of a declaration of a roadmap read here (SpecialFunctionsTheta's `modularLambda` lives in another namespace and §2.1 targets the equality). The overlap list names no second plan; NoncongruenceModularForms (main) is a consumer.
- Pinned declarations opened: every Mathlib and Tau Ceti name of the two contract lists was found with the stated content, among them `Subgroup.goursat_surjective` (`GroupTheory/Goursat.lean:107`), `Chebyshev.pi_ge`, `Chebyshev.theta_ge`, `Chebyshev.theta_le_log4_mul_x`, `Derivative.normalizedDerivOfComplex` (`(2πi)⁻¹ · deriv`), `EisensteinSeries.E2`, `CongruenceSubgroup.IsCongruenceSubgroup` (`∃ N ≠ 0, Gamma N ≤ Γ`), `TauCeti.qExpansion_nat_mul` (periodic, bounded, holomorphic), `TauCeti.Subgroup.integerCuspWidth`, `ModularForm.sturm_bound_finiteIndex_SL2Z`, `HeckeRing.GL2.Newform.basis`, `TauCeti.cuspFormsOld`, `TauCeti.cuspFormsNew`, and the eight `laurentQExpansion` lemmas.
- No target of this roadmap is already proved at the pins (searched: Wohlfahrt, λ, weak forms, vector-valued forms, quasimodular, unbounded denominators). `TauCeti/NumberTheory/ModularForms/LevelOne/FunctionField.lean` has `ℚ(j)` at level one; it is not a target here.
- Headline theorems: §§1.8, 2.2, 4.1, 4.3, 6.1, 6.3–6.6, 7.11, 7.12, 8.2, 8.6, 8.7 are stated; §§5.3, 5.5, 7.1–7.2, 9.3 are named in the module docstring with their reasons, which hold. Padding: none; no `example`, `#check`, `lemma`, `set_option`.
- Policy: no pull-request number or process word in the README or in a docstring; every target has a locator; no algorithm.

Source independence: 9 passages compared with 2 sources (CDT25 lines 25–41, 1903–1915, 2018–2027, 3663–3680, 3766–3770, 3803–3816, 4055–4082, 4118–4133; KSV10 lines 234–260), none shared beyond formulas, hypothesis lists and standard terms; largest share CDT25, 64 of 68 locators; contents compared with CDT25: independent (Layer 1 ↔ §4.1, Layer 3 ↔ §3 with §4.2, Layer 4 ↔ §4.4 before Layer 5 ↔ §4.3, Layer 6 ↔ §6.3, Layers 7–9 are parts of §7 regrouped, Layer 2 has no section there, and its §§2, 5, 6 are other roadmaps'); Ihara1994 could not be read.

## Not verifiable

- README §7.11, API bullet (the `𝓞_K` form), on which `exists_deficient_finite_place` rests: no source states it. Each step of the roadmap's argument (descent of `L_j` to `K(x)`, conjugate operators, least common left multiple, traces) was checked here and none failed; it was not checked beyond the sketch.
- README §§9.2–9.3: Ihara1994 is uncertified and its text was not read; the mathematics of S01 and S02 was derived directly, not from that source.
- The corrected clause proposed in S01 for primes dividing N rests on the cyclotomic full-level curve being smooth along the cusps (ModularCurvesPartII §4.11 says so); the supplier's text was read, not its sources.
- No Lean was elaborated in this pass; the optional rewrite with `Subgroup.adjoinNegOne` in S03 is unchecked.
- Wohlfahrt's 1964 paper is cited through CDT25 and KSV10 only.

## Source issues

- **Misprint** in KSV10 at proof of Proposition 3, line after equation (1), arXiv v4 p.6: the source factors L as the transpose of T, a power of T, then the inverse transpose; it should be the inverse transpose first and the transpose last; affects nothing.
- **Error** in CDT25 at Corollary 7.3.4, printed p.691: the source concludes that the kernel of ρ contains a principal congruence subgroup and ρ has finite image; it should assume that the values of F span the whole space; affects a stated result.
- **Error** in CDT25 at §7.4.8, printed p.695: the source says a finite deficient place exists whenever the kernel of ρ is not congruence; it should require a component that is not a congruence form; affects a stated result.
- **Gap** in CDT25 at the passage before Theorem 7.3.3 and in its proof, printed p.690: the source asserts a free rank 6n bundle and reduces to an irreducible system; it should use the continuation span of the one component, of dimension at most n; affects the proof.
- **Error** in CDT25 at the sketch of proof of Theorem 7.4.10, printed p.696: the source takes power series in λ(τ/N)/16 as the formal ring at the cusp of level N; it should be the Tate parameter of width N, since that function starts with the half-period exponential, a parameter at level 2N; affects the proof.

## For the human reviewers

- **Licence.** CDT25 was read in the author's offprint (`sources.toml`, `licence_class = "author-page"`); each page carries the publisher's line that copyright restrictions may apply.
- **Not tested.** Ihara1994 (`sources.toml`, `status = "uncertified"`) is the only source of the route of README §9.2; wording and content of §§9.2–9.3 were not compared with it.
- **Scope.** README §§7.12, 7.13, 8.7 state corrected forms of CDT25 Corollary 7.3.4 and §7.4.8, and the `𝓞_K` form in §7.11 extends Theorem 7.3.3; no refereed source states these forms.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4e42d33b5d55216e8ef6c29e083fd14e80868211", "job": "RT-ModularFormsPartII~2a", "model": "fable", "worker": "chris-x89"} -->
