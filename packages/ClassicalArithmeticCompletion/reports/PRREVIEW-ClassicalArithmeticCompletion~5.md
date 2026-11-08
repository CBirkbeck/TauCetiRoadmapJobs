# Review of ClassicalArithmeticCompletion (pull request #1409 at c725fa7)

**Verdict:** needs changes

🤖 Independent AI review. This is an incremental re-review of 140 changed lines since 121997a. All seven previous findings are repaired. The gate passes, the module builds and elaborates, and the dependency check is clean. Two P3 findings remain, both introduced by the R02/R03 repair:

- Four clauses of the new local-field contract cite a pinned declaration for more than it states, or without its hypotheses.
- Two rewritten proof steps name the residue field where they mean the field.

Neither finding is blocking. This verdict means the folder is not yet ready for a human's final approval; the AI never approves or merges.

## R01 (P3) — Four local-field contract clauses cite a pinned declaration for more than it states, or without its hypotheses

**Location:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md`:

- `:176`: “for L/K unramified the residue correspondence `TauCeti.residueFieldAutEquiv` … the unique unramified intermediate field of degree f (`TauCeti.existsUnique_isUnramified_finrank_eq`)”.
- `:178`: “the Teichmüller section `TauCeti.teichmuller` … of a Henselian local ring”.
- `:180`: “stability of tameness in towers (`TauCeti.IsTamelyRamified.tower_bot`)”.

The same citations recur elsewhere:

- `Suggested.lean:570–573` repeats `tower_bot` as a “tower … theorem”.
- §1.43 (`:1455`, `:1468`, Layer 1 list `:2434`) and §7.38 (`:14784`, `:14799`) cite the bare definition `TauCeti.unramifiedExtension` where they use that it *is* unramified of the stated degree.

**Claim:** The contract states what each declaration provides and under which hypotheses. Four clauses misstate this at the pin:

1. **Missing hypotheses on `residueFieldAutEquiv`.** It also takes `[FiniteDimensional K L] [IsGalois K L]` (`TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:150`, via section variables). No pinned instance derives `IsGalois` from `IsUnramified`: a grep of `Unramified/*.lean` and `LocalField/*.lean` finds instances only for `unramifiedExtension`, `maximalUnramifiedExtension` and a private level. Every finite unramified extension of local fields is Galois, so the prose is true. But a consumer must supply the instance, and §7.51 does, having it as a hypothesis.
2. **`existsUnique_isUnramified_finrank_eq` and the bare definition are cited for facts they do not state.**
   - The pinned statement (`Unramified/Existence.lean:386`) is `∃! E, ∃ _ : FiniteDimensional K E, IsUnramified K E ∧ finrank K E = f`. It never names `unramifiedExtension`; only its docstring does. The definition `TauCeti.unramifiedExtension` asserts nothing.
   - The facts actually used are proved by three other theorems: `TauCeti.isUnramified_unramifiedExtension` (`:367`; `[IsSepClosed Ω]`, `f ≠ 0`), `TauCeti.finrank_unramifiedExtension` (`:378`) and `IntermediateField.eq_unramifiedExtension_finrank` (`:329`).
   - §1.43 needs exactly the first of these: it concludes that `K_v(ⁿ√w) ⊆ K_v(μ_{q^f−1})` is unramified.
3. **`tower_bot` is only the lower step.** It passes tameness of M/K down to L/K. The two-sided tower statement the contract describes is `TauCeti.isTamelyRamified_tower_iff` (`RamificationIndex.lean:587`).
4. **Missing hypothesis on the Teichmüller lift.** `TauCeti.teichmuller` and `TauCeti.residue_teichmuller` take `[Finite (ResidueField R)]` (`TauCeti/RingTheory/Henselian/Teichmuller.lean:94, :119`; their docstring says “with finite residue field”).

**Witness:** At the pin, `#check @TauCeti.residueFieldAutEquiv` gives “… → [FiniteDimensional K L] → [IsGalois K L] → [TauCeti.IsUnramified K L] → Gal(L/K) ≃* Gal(𝓀[L]/𝓀[K])”, and `#check @TauCeti.IsTamelyRamified.tower_bot` ends “IsTamelyRamified K M → IsTamelyRamified K L”.

**Exact repair:**

- **`:176`, residue correspondence:** write “for L/K finite, Galois and unramified” before `TauCeti.residueFieldAutEquiv`.
- **`:176`, unramified extension:** replace “and, for Ω separably closed and f ≥ 1, the unique unramified intermediate field of degree f (`TauCeti.existsUnique_isUnramified_finrank_eq`)” by:
  > for Ω separably closed and f ≥ 1, unramified of degree f over K (`TauCeti.isUnramified_unramifiedExtension`, `TauCeti.finrank_unramifiedExtension`), every unramified intermediate field E being `TauCeti.unramifiedExtension K Ω [E : K]` (`IntermediateField.eq_unramifiedExtension_finrank`), so that it is the unique one (`TauCeti.existsUnique_isUnramified_finrank_eq`)
- **`:178`:** “of a Henselian local ring with finite residue field”.
- **`:180` and `Suggested.lean:572`:** cite `TauCeti.isTamelyRamified_tower_iff` (a tower is tame exactly when both steps are). `tower_bot` may stay as its lower-step corollary.
- **§1.43 (`:1455`, `:1468`, `:2434`) and §7.38 (`:14784`, `:14799`):** add `TauCeti.isUnramified_unramifiedExtension` and `TauCeti.finrank_unramifiedExtension` beside `TauCeti.unramifiedExtension`.

**Tested:**

- ℚ₃ ⊂ ℚ₃(√3) ⊂ ℚ₃(3^{1/4}) has e = 2, 2, 4 and residue characteristic 3. `isTamelyRamified_tower_iff` gives both steps tame from the top step; `tower_bot` gives only the lower one.
- ℚ₃(i)/ℚ₃ is finite, Galois and unramified with f = 2, so every hypothesis of `residueFieldAutEquiv` holds. σ: i ↦ −i reduces to x ↦ x³ on 𝔽₉, since i³ = −i.

## R02 (P3) — Two rewritten proof steps write the residue field where the field is meant

**Location:**

- `README.md:14784` (§7.38): “To prove this, l′/K is Galois as the compositum of L with the unramified (hence Galois) extension `L′_0` of K of degree ef”.
- `README.md:15132` (§7.52): “To prove this, l/K is a cyclic Kummer extension: K contains a primitive e-th root of unity ζ”.

**Claim:** In this layer, l and l′ denote residue fields: §7.51 at `:15107` writes “reduction identifies G with Gal(l/k)” and calls l/k “a finite Galois extension of finite fields”. A residue field is not an extension of K, so “l′/K is Galois” and “l/K is a cyclic Kummer extension” do not parse. The statements of §7.38 and §7.52 make clear that L′/K and L/K are meant. Both lines are rewritten by this diff (the slip predates it), so they are within this review.

**Witness:** §7.38's own statement, `:14776`: “Then L′/K is Galois and tame”. §7.52's own statement, `:15124`: “Let L/K be a totally and tamely ramified Galois extension”.

**Exact repair:** At `:14784`, replace “l′/K” by “L′/K”. At `:15132`, replace “l/K” by “L/K”.

## Previous findings

- R01 — repaired: `Suggested.lean:1–6` now reads “module / public import Mathlib / public import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints …”, and `:44` reads `@[expose] public section`. The worker's build is 0. A scratch module importing it elaborates `Iff.rfl` through `IsRational`'s body.
- R02 — repaired: `README.md:172–180` cites pinned declarations. `TauCeti.map_normUnits_unitFiltration` replaces `map_norm_unitFiltration_zero`. No `#layer-2-…`/`#layer-3-…` link to LocalFieldsRamification remains (grep: 0).
- R03 — repaired, by citing the library instead: `README.md:228–230` cites `TauCeti.IntegralLattice.specialOrthogonalGroupEquivNormOneUnits` and `TauCeti.BinaryQuadraticForm.stabilizerEquivNormOneUnits`. No `layer-b-binary`/B4 citation remains, so no open revision is cited.
- R04 — repaired: `README.md:9–12`, under Scope and ownership, now reads: “layer-7-topic-4 → §7.4 (`#74-orders-in-finite-dimensional-algebras`). layer-7-topic-72 → §7.72 (`#772-ideles-and-lattice-gluing-for-an-arithmetic-order`).”
- R05 — repaired: `Suggested.lean:74–78`: “[Field F] [Finite F] … a ^ ((Nat.card F - 1) / (Nat.card F - 1).gcd n) = 1”.
- R06 — repaired: `Suggested.lean:81–84`: “[Field F] [Finite F] … = (Nat.card F - 1).gcd n”.
- R07 — repaired: `Suggested.lean:140`: “theorem christol {K : Type*} [Field K] [Finite K] {p : ℕ}”.

## Verified sound

**Scope.** I checked head `c725fa7a482e76b75825e9cab8b243cc4d8941e5`:

- the 140-line diff (`scratch/changes.md`) and every passage it touches;
- the seven previous findings;
- every pinned declaration the diff newly cites;
- the gate, the elaboration, the dependency check and the overlap facts.

`git diff --stat origin/main...HEAD` outside the folder is empty. The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (checked with `git rev-parse HEAD` in `.lake/packages`).

**Gate, build, dependency check.**

- **My gate run:** every check reported 0, ending “OK” (`set_option=0 … statement-hygiene=0 … residue=0 … readme-ids-missing=0 … depcheck=0 … dirty=0 outside-folder=0 source-material=0`). The worker's run on this head adds `build=0` (`scratch/gate.md`).
- **Elaboration:** `lake env lean …/Suggested.lean` exited 0 in 24 s with 45 warnings, all `declaration uses sorry`. The only other output is the two `#check` lines pinning `pow_card_eq_one'` and `pow_ne_of_irreducible_X_pow_sub_C`.
- **Importer probe:** a scratch `module` importing the built `TauCetiRoadmap.ClassicalArithmeticCompletion.Suggested` sees the theorems publicly. It elaborates `public theorem … : Sequences.IsRational f ↔ ∃ P Q, … := Iff.rfl`, so `@[expose]` exports the definition bodies. `#check @` of the three re-bindered theorems shows `[Finite F]`/`[Finite K]` and `Nat.card F` as intended.
- **Dependency check, output verbatim:**

  ```text
  depcheck: 244 roadmaps, 2488 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. This roadmap is not listed in `ORDER.txt`, so it is checked as placed after its last supplier; that is not a finding.

**Newly cited pinned declarations, opened and elaborated.** I built the five Tau Ceti modules that lacked object files with `lake build`:

- `…Unramified.Rigidity`
- `…TamelyRamified.Galois`
- `…IntegralLattice.Binary.NormOne`
- `…BinaryQuadraticForm.Stabilizer`
- `…QuadraticOrder.NormOne`

Then I ran `#check @` on all 43 Tau Ceti names the diff adds, plus `IsNonarchimedeanLocalField`. All 43 resolve; `IsNonarchimedeanLocalField` is Mathlib's (`Mathlib/NumberTheory/LocalField/Basic.lean:46`), as §7.53's new `*Needs:*` says. The two `Multiquadratic` names in the diff are only reordered list lines, and the previous report verified them. The statements the README attributes to them:

| README claim | Pinned declaration, file:line | Agrees |
|---|---|---|
| `IsTamelyRamified`: residue characteristic ∤ e | `RamificationIndex.lean:161`, `¬ ringChar 𝓀[K] ∣ ramificationIndex K L` | yes |
| `IsTotallyRamified`: e = [L : K] | `RamificationIndex.lean:199` | yes |
| e ∣ #𝓀[L] − 1 for L/K Galois and tame | `TamelyRamified/Basic.lean:119`; takes `[Module.Finite K L] [IsGalois K L]` | yes (§7.19 has Galois) |
| totally and tamely ramified ⇒ K(α), αᵉ = π | `TamelyRamified/Basic.lean:133` | yes |
| Galois ⟺ primitive e-th root in K | `TamelyRamified/Galois.lean:74` | yes |
| `Gal(L/K) ≃* μ_e(K)`, σ ↦ σ(α)/α | `TamelyRamified/Galois.lean:87`; `Φ : (L ≃ₐ[K] L) ≃* rootsOfUnity e K` | yes |
| Eisenstein characterisation, degree = e, `𝒪_K[π] = ⊤`, valuation of `Σ cᵢπⁱ` | `Eisenstein/TotallyRamified.lean:180, :153`, `Eisenstein/PowerBasis.lean:139, :148` (`⨅ (e·v_K(cᵢ) + i)`) | yes |
| monogenic integer rings | `Monogenic.lean:54` | yes |
| `v_K(N x) = f·v_L(x)` | `Norm/Basic.lean:130` (multiplicative form, exponent `inertiaDegree`) | yes |
| `N(U(L,i)) = U(K,i)` for unramified L/K | `Norm/Unramified/Basic.lean:126`; `U(K,0)` is the image of `𝒪[K]ˣ` (`UnitFiltration/Basic.lean:104`) | yes |
| `U(K, i + v_K(n)) ⊆ (Kˣ)ⁿ` under `v_K(p) < (p−1)i` | `UnitFiltration/Pow/Basic.lean:309`, hypotheses exactly as written | yes |
| `unramifiedExtension K Ω f` = adjoin roots of `X^(q^f) − X`, Galois | `Unramified/Existence.lean:85, :210` | yes |
| L totally ramified over `unramifiedExtension K L (inertiaDegree K L)` | `Unramified/Factorization.lean:142` | yes |
| rigidity of unramified extensions | `Unramified/Rigidity.lean:164` | yes |
| `basisOfResidueBasis` returns the lifts | `Unramified/Basic.lean:303`, `coe_basisOfResidueBasis` = `x` | yes (§7.51 “returns that basis directly”) |
| tame character, kills G₁ | `UnitFiltration/RamificationGroup.lean:566`; graded version injective (`:612`) | yes |
| `IsLocalRing.ramificationGroup G S i`, i : ℤ | `TauCeti/RingTheory/LocalRing/RamificationGroup.lean:118` (namespace `TauCeti.IsLocalRing`) | yes |
| SO(L) ≃* norm-one units of `ℤ[(Δ+√Δ)/2]`, matrix `!![x−by, −2cy; 2ay, x+by]` | `IntegralLattice/Binary/NormOne.lean:72, :83` (`hL : L.form ≠ 0`, carrier basis, Δ primitive) | yes |
| stabiliser of primitive f in SL(2,ℤ) ≃* norm-one units, same matrix | `BinaryQuadraticForm/Stabilizer.lean:360, :371`; action `γ • f = f ∘ γ⁻¹` (`Basic.lean:66, :454`) | yes |
| `pellToNormOneUnits` injective; infinitely many for D > 0 nonsquare | `QuadraticOrder/NormOne.lean:431, :445, :458` | yes |
| `residueFieldAutEquiv`, `teichmuller`, `existsUnique…`, `tower_bot` | see R01 | hypotheses or content misstated |

**Other changed passages.**

- The old → new id lines point at existing headings: `### 7.4 Orders in finite-dimensional algebras` (`:13816`) and `### 7.72 Ideles and lattice gluing for an arithmetic order` (`:15596`), whose GitHub slugs are the quoted ids.
- The `IsTamelyRamified` docstring's claim that it agrees with `TauCeti.IsTamelyRamified` on integer rings of local fields holds. There is exactly one nonzero prime, the residue extension of finite fields is separable, and `ramificationIdx` is e (rows below).
- The Layer 1, 4 and 7 dependency lists gained exactly the names the `*Needs:*` lines added, and lost the two LocalFieldsRamification layer links.
- The scope sentence “IntegralLattices owns … their binary-form/order dictionary” is true of main's `TauCetiRoadmap/IntegralLattices/README.md` (Layer B at `:981`, B4 at `:2273`). The library citation is still the right one, since the declarations are pinned.

**Padding probe on the re-bindered theorems.**

- `exists_pow_eq_iff_pow_eq_one`: `first | simp | exact?` fails.
- `card_nonzero_pow_roots`: `exact?` fails, and `simp` leaves the goal open.
- `christol`: Mathlib at the pin has no Christol (grep: 0), and `IsAutomatic` is this roadmap's definition.

None closes in one tactic, so none is padding.

**Seeded sample.** None of the fifteen seeded targets falls in the diff, and none cites a changed passage. A grep of each section for the changed anchors, the `TauCeti.` local-field and binary names, LocalFieldsRamification and IntegralLattices found no hit. The targets are §§2.18, 3.29, 3.52, 3.55, 3.58, 4.51, 4.52, 4.85, 4.87, 4.115, 6.34, 6.41, 7.7, 7.66 and 7.107. Following the incremental instruction, they were not re-sampled. The README flags no locator as unverified.

**Overlaps and ownership.**

- `scratch/overlaps.md` lists no other open pull request changing this roadmap. It also lists no dropped id that this roadmap cites, no revision-only id, and no dropped id of this roadmap that others cite.
- The diff adds no object of its own; it repoints supplier citations to the pinned library. So ownership against the closest roadmaps (#1046, #1408, #1335, #1126, #1712) is unchanged from the previous reports.
- Ownership against open pull requests without a supplied checkout was not checked beyond the roadmaps tool's grep.
- `scratch/citations.md` lists 44 Lean names. Every one is this roadmap's own `Suggested.lean` declaration, and the gate's `readme-ids-missing=0` confirms them.

**Adversarial computations for the changed statements.**

| Statement/object | Instances and computed values on both sides | Result |
|---|---|---|
| `exists_pow_eq_iff_pow_eq_one` (`[Finite F]`, `Nat.card`) | F₇, n = 2: exponent 6/gcd(6,2) = 3. a = 2: 2³ = 1 and 2 = 3². a = 3: 3³ = 6 ≠ 1, a non-square. n = 0: exponent 6/6 = 1, so both sides say a = 1. F₄, n = 3: exponent 1, and the cubes of F₄ˣ are {1}. F₂: exponent 1/1 = 1. | holds |
| `card_nonzero_pow_roots` | F₇, n = 3, a = 1: {1, 2, 4}, count 3 = gcd(6,3). n = 0, a = 1: all 6 units = gcd(6,0). n = 2, a = 2: {3, 4}, count 2 = gcd(6,2). | holds |
| `christol` with `[Finite K]` | Binder change only. Finite fields of characteristic p are exactly `[Finite K] [CharP K p]`. Thue–Morse over 𝔽₂ carried from the earlier reports. | holds |
| `IsTamelyRamified` docstring ≡ `TauCeti.IsTamelyRamified` | ℚ₃(√3)/ℚ₃: e = 2, 3 ∤ 2, tame on both sides. ℚ₂(√2)/ℚ₂: e = 2, 2 ∣ 2, wild on both. ℚ₂(ζ₃)/ℚ₂: e = 1, 𝔽₄/𝔽₂ separable, tame on both. | agrees |
| tower stability (R01) | ℚ₃ ⊂ ℚ₃(√3) ⊂ ℚ₃(3^{1/4}): e = 2·2 = 4, 3 ∤ 4. `tower_iff` gives both steps; `tower_bot` gives the lower only. | R01 |
| `unitFiltration_le_range_powMonoidHom` at depth 1 (§1.43, contract) | ℚ₅, n = 2: v₅(2) = 0 < (2−1)·1, so U(ℚ₅,1) = 1 + 5ℤ₅ ⊆ squares. Control ℚ₂, n = 2: v₂(2) = 1 forces i ≥ 2, giving U(ℚ₂,3) = 1 + 8ℤ₂ ⊆ squares; 5 ∈ U(ℚ₂,2) is not a square, so i = 1 must fail, and the hypothesis excludes it. | holds |
| `map_normUnits_unitFiltration` at depth 0 (§7.60) | ℚ₉ = ℚ₃(i)/ℚ₃: N(1+i) = 2, the nonsquare class of ℤ₃ˣ; N(1) = 1, the square class. Both classes are hit. | holds |
| `normalizedValuation_norm` (§7.60) | ℚ₃(√3): f = 1, N(√3) = −3, v = 1 = 1·1. ℚ₉: f = 2, N(3) = 9, v = 2 = 2·1. | holds |
| e ∣ q^f − 1 (§7.19 via library) | ℚ₇(7^{1/3}): Galois since 7 ≡ 1 (mod 3); 3 ∣ 6. Control ℚ₅(5^{1/3}): tame but not Galois; 3 ∤ 4, so the Galois hypothesis is needed, and §7.19 states it. | holds |
| Galois ⟺ μ_e ⊆ K (§7.52) | ℚ₇(7^{1/3}): cube root of unity in ℚ₇, Galois. ℚ₅(5^{1/3}): 5 ≡ 2 (mod 3), not Galois. | holds |
| Eisenstein inputs (§§7.38, 7.52) | X² − 3 over ℤ₃: natDegree 2 = e and `𝒪 = ℤ₃[√3]`. v_L(3 + √3) = min(2·1+0, 2·0+1) = 1, matching N(3+√3) = 6 with v₃ = 1 and f = 1. | holds |
| `basisOfResidueBasis` (§7.51) | ℚ₂(ζ₃)/ℚ₂, residue normal basis {ω, ω²}: the lifts ζ, ζ² have coordinates (0,1), (−1,−1) in {1, ζ}, with det 1, so they form a ℤ₂-basis. {1, ω} is not normal, since Frobenius fixes 1. | holds |
| `residueFieldAutEquiv` (§7.51) | ℚ₃(i)/ℚ₃: σ(i) = −i reduces to x ↦ x³ on 𝔽₉ (i³ = −i). Galois holds, as R01 asks to state. | holds |
| tame character | ℚ₃(√3)/ℚ₃, G = G₀ = C₂, G₁ = 1: σ(√3)/√3 = −1, residue 2 ∈ 𝔽₃ˣ, injective on G₀/G₁. | holds |
| §4.0 new Check, ε₅ on Q = [1,1,−1] | Matrix [[(3−1)/2, 1], [1, (3+1)/2]] = [[1,1],[1,2]], det 1. Q(x+y, x+2y) = x² + xy − y². Library at x = 3/2, y = 1/2: [[1,1],[1,2]]. | holds |
| §4.0 new Check, side of the action, ε₁₂ on Q = [1,0,−3] | D = 0 + 12. Library at x = 2, y = 1/2: [[2,3],[1,2]], taking (1,0) ↦ (2,1) with Q = 1. Transpose: (1,0) ↦ (2,3), Q = −23. Library action γ•f = f∘γ⁻¹, so stabilisers satisfy f(γv) = f(v). | holds, consistent with the library |
| lattice contract and Pell map | D = 12: Pell (7,2) with 49 − 48 = 1 maps to 7 + 2√12 = (2+√3)² ∈ normOneUnits 12; D > 0 nonsquare gives infinitely many. Square Δ = 1 (hyperbolic plane) gives SO = {±1}, per the library docstring. | holds |
| old → new ids | `### 7.4 …` and `### 7.72 …` give the slugs `74-orders-in-finite-dimensional-algebras` and `772-ideles-and-lattice-gluing-for-an-arithmetic-order`. | holds |

**Carried adversarial evidence for untouched statements.** The diff leaves the remaining statements untouched, so their rows carry unchanged from [the previous report][previous] and the reports it carries. That covers its table for the 121997a increment (§§1.7, 1.51, 1.18a, 2.21, 2.43, 2.57, 3.61, 6.34, 7.44) and its seven carried rows, from compatible CRT through the Fröhlich–Taylor endpoint. Their computed values stand as recorded there. Two examples: CRT with m = 6, n = 9, a = 1, b = 4 gives x = 13 mod 18; normEDS(2,3,2) = n with gcd(W₋₆, W₉) = 3 = |W₃|.

[previous]: packages/ClassicalArithmeticCompletion/reports/PRREVIEW-ClassicalArithmeticCompletion~4.md

## Not verifiable

No source was needed for this increment. The changed passages repoint supplier citations to pinned declarations, and no seeded target falls in the diff. The source limitations recorded in the earlier reports are carried, not reopened.

## Source issues

- none
