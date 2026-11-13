# Review of RationalHomotopyModels (pull request #2298 at b464a71)

**Verdict:** needs changes

## R01 (P1) — 2.5: cofibrant objects are not the retracts of Sullivan algebras

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 389–390 and 396: "cofibrant objects are the retracts of Sullivan algebras"; "`K → Λ(t, dt)` is an acyclic cofibration (a Sullivan extension by `t`, `dt`, with `H = K`)".

**Claim:** With this roadmap's convention (Sullivan generators of degree `≥ 1`, Conventions and `deg_pos`), the characterisation is false, and the section's own first Check refutes it.

**Witness:** A Sullivan algebra `S` has `S⁰ = K`, so every retract `R` has `R⁰ = K`. `Λ(t, dt)` is cofibrant (the Check) and `Λ(t, dt)⁰ = K[t]`. Hess2007 line 230 allows `V⁰ ≠ 0`; this roadmap does not.

**Repair:** Replace by: "every Sullivan algebra is cofibrant (2.2), and the cofibrant objects with `A⁰ = K` are exactly the retracts of Sullivan algebras". In the Check write "(free on `t` of degree `0` and `dt`; not a Sullivan extension, whose generators have degree `≥ 1`)". Do not widen to "retracts of free algebras on generators of degree `≥ 0`": `K[x, y]/(xy)` in degree `0` is cofibrant (maps from it land in `Z⁰ = H⁰`) and embeds in no polynomial ring.

## R02 (P1) — 6.2: `π_n⟨ΛV⟩ ≅ Hom(Vⁿ, ℚ)` fails for non-minimal Sullivan algebras

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 700–701: "For a simply connected Sullivan algebra `(ΛV, d)` of finite type, prove that the unit `ΛV → A_PL⟨ΛV⟩` is a quasi-isomorphism and `π_n⟨ΛV⟩ ≅ Hom(Vⁿ, ℚ)`".

**Claim:** The second conclusion needs minimality; the cited Hess, Theorem 1.24 has the same omission (Source issues).

**Witness:** `Λ(u₂, v₃)`, `du = v` (the algebra of 1.2, second Check, shifted): Sullivan, `V¹ = 0`, finite type, quasi-isomorphic to `ℚ`, so `⟨ΛV⟩` is contractible and `π₂ = 0`, while `Hom(V², ℚ) = ℚ`.

**Repair:** "For a simply connected Sullivan algebra `(ΛV, d)` of finite type, prove that the unit `ΛV → A_PL⟨ΛV⟩` is a quasi-isomorphism; if `(ΛV, d)` is moreover minimal, prove `π_n⟨ΛV⟩ ≅ Hom(Vⁿ, ℚ)`." Add the witness as a Check.

## R03 (P2) — 3.5: the quasi-isomorphism half is statable at the pins and absent

**Location:** `TauCetiRoadmap/RationalHomotopyModels/Suggested.lean` lines 48–49: "the quasi-isomorphism half of README 3.5, lacking the base change of a `TauCeti.DGAlgHom`".

**Claim:** The half that the README states ("a full or `i`-minimal model `M → A` gives a full or `i`-minimal model `L ⊗_K M → L ⊗_K A`") needs no new carrier: the base-changed map is determined by its values on `1 ⊗ m`.

**Witness:** The statement below elaborates in `section Layer3` of a scratch copy at the pins with `sorry` as the only warning; it uses only `TauCeti.IsDGAlgebra.baseChange` (`TauCeti/Algebra/Homology/DG/Algebra/BaseChange.lean` line 77).

**Repair:** Add it to `Suggested.lean` (and its name to README 3.5), and delete the docstring clause quoted above:

```lean
theorem exists_baseChange_quasiIso (hA : IsDGAlgebra 𝒜 d)
    {M : Type*} [Ring M] [Algebra K M] {ℳ : ℤ → Submodule K M} [GradedAlgebra ℳ]
    {dM : M →ₗ[K] M} (hM : IsDGAlgebra ℳ dM)
    (f : DGAlgHom hM hA) (hf : Function.Bijective f.cohomologyMap)
    (L : Type*) [Field L] [Algebra K L] :
    ∃ F : DGAlgHom (hM.baseChange L) (hA.baseChange L),
      (∀ m : M, F ((1 : L) ⊗ₜ[K] m) = (1 : L) ⊗ₜ[K] f m) ∧
        Function.Bijective F.cohomologyMap := sorry
```

## R04 (P3) — 2.4 needs Layer 3, and 3.3 needs 2.4

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 368–372: "For a minimal model `ρ : M → A` of a connected `A` and a DG automorphism `α` … *Needs:* 2.2, 2.3; 3.3 for `β` an isomorphism."

**Claim:** One `*Needs:*` line covers two theorems; the second needs 3.1 (the model exists) and 3.3, both in a later layer, and 3.3 lists 2.4: a cycle 2.4 ↔ 3.3. Layer 2's Dependencies (line 409) names neither Layer 3 nor DerivedDeRhamCohomology §2.21, which 2.2 needs.

**Witness:** Line 454–455: "*Needs:* 1.2, 2.3, 2.4" under 3.3; line 409: "Layer 1; Tau Ceti DG tensor product; Mathlib model categories and localization."

**Repair:** Move the automorphism statement and its Check to 3.4 with "*Needs:* 2.4, 3.1, 3.3"; leave 2.4 with "*Needs:* 2.2, 2.3"; add "DerivedDeRhamCohomology §2.21" to Layer 2's Dependencies.

## R05 (P3) — 2.3, second Check: the chain-homotopy formula lacks a `d`

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` line 356: "`∫₀¹ (H(a)) + ∫₀¹ (H(da)) = f₁(a) − f₀(a)`".

**Claim:** The identity is false as written: the first term has degree `|a| − 1`, the right side degree `|a|`.

**Witness:** `M = Λ(e₁)`, `A = Λ(s, ds)` with `|s| = 0`, `H(e) = d(s ⊗ t) = ds ⊗ t + s ⊗ dt`: `f₀(e) = 0`, `f₁(e) = ds`; the left side is `±s`, the right side `ds`.

**Repair:** "`d ∫₀¹ H(a) + ∫₀¹ H(da) = f₁(a) − f₀(a)`"; on the witness `d(s) = ds`.

## R06 (P3) — 5.1, third Check: nothing is contradicted on `[x, [x, x]]`

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 617–618: "the plus sign would contradict `d² = 0` on `[x, [x, x]]`".

**Claim:** Conventions (line 117–118) prove `[x, [x, x]] = 0` for odd `x`, so every derivation rule gives `0` on it; the Check does not separate the two signs.

**Witness:** With the plus rule and `|x| = 1`: `d[x, x] = [dx, x] + [x, dx] = [dx, x] − [dx, x] = 0`, hence `d²[x, [x, x]] = 0` as well.

**Repair:** "for `x` of degree `2` and `u = dx` of degree `1`, antisymmetry gives `[x, u] = −[u, x]`; the signed rule gives `d[x, u] = [u, u]` and `d[u, x] = −[u, u]`, while the plus sign gives `[u, u]` for both and forces `2[u, u] = 0`, false in the free graded Lie algebra on `u`".

## R07 (P3) — 5.2–5.3: the structure-constant formula and the Checks disagree, and the sign is not pinned

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` line 628: "`dxᵢ = ∑ cⁱⱼₖ xⱼ xₖ` for `[eⱼ, eₖ] = ∑ cⁱⱼₖ eᵢ`"; lines 636, 652, 654: "`dz = ±xy`", "`[a, a] = ±2b`", "`[X, Y] = ±Z`".

**Claim:** Summed over all `j, k` the formula gives twice the Checks' value, and "±" leaves the convention of the duality between `d` and the bracket open in every Check of 5.2 and 5.3.

**Witness:** Heisenberg, `[X, Y] = Z`: `c^Z_{XY} = 1`, `c^Z_{YX} = −1`, so the formula gives `dz = xy − yx = 2xy`; the Check says `±xy`; Layer 1, Examples says `xy`.

**Repair:** Fix one convention, for instance `(dξ)(a, b) = −ξ([a, b])`: "`dxᵢ = −∑_{j<k} cⁱⱼₖ xⱼ xₖ`", so `dz = −xy` (isomorphic to the Layer 1 example by `z ↦ −z`), and compute the signs of `du′`, `[a, a]` and `[X, Y]` in the Checks of 5.2 and 5.3 from it.

## R08 (P3) — 7.1, first Check is false for the carrier `IsFormal` admits

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` line 773: "A DG algebra with `d = 0` is formal (`M = A`, …)".

**Claim:** `IsFormal hA` is defined for every `TauCeti.IsDGAlgebra`, commutative or not, and `M` must be graded-commutative; `M = A` is not available in general.

**Witness:** `A = M₂(K)` in degree `0`, `d = 0`: a quasi-isomorphism `M → A` gives `H⁰(M) ≅ M₂(K)`, but `H⁰(M)` is commutative. So `A` is not formal.

**Repair:** "A graded-commutative DG algebra with `d = 0` is formal (…); `M₂(K)` in degree `0` with `d = 0` is not, since `H(M)` is graded-commutative."

## R09 (P3) — Conventions: "connected" is not Morgan's definition, and the locator is wrong

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 102–103: "is connected when `H⁰(A) = K`, without requiring `A⁰ = K` (Morgan, §5)".

**Claim:** Morgan defines connected as `A⁰ = k`, in §2, and assumes `H⁰(A) = k` separately; §5 has no definition of the word.

**Witness:** Morgan1978 line 225 (p. 142): connected means `A⁰` is the ground field; line 227: `H⁰(A)` is always assumed to be the ground field.

**Repair:** "(the standing hypothesis `H⁰(A) = k` of Morgan, §2, p. 142, where the word 'connected' means the stronger `A⁰ = k`)".

## R10 (P3) — 3.5: Morgan, Definition 5.3 says nothing about extension of scalars

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` line 487 and `Suggested.lean` line 244: "(Morgan, Definition 5.3)".

**Claim:** The locator supports the definition of an `i`-minimal model only; neither the preservation of minimality nor of the cohomology conditions under `K → L` is stated there.

**Witness:** Morgan1978 lines 1036–1042: Definition (5.3) lists conditions a)–c) of an `i`-minimal model over one field.

**Repair:** "(the conditions of Morgan, Definition 5.3, which are preserved because `L ⊗_K −` is exact)"; the same wording in the docstring.

## R11 (P3) — Two Sullivan locators support different statements

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 326 and 452 (and the docstrings at `Suggested.lean` lines 168, 217): "Sullivan, Proposition (3.5)"; "Sullivan, Corollary (4.2)".

**Claim:** (3.5) is an obstruction statement for lifting up to homotopy, not the strict lift `π ∘ h = g`. (4.2) concerns free connected algebras with decomposable differential and assumes isomorphisms on cohomology with twisted coefficients.

**Witness:** Sullivan1977 lines 651–653 and 748–750. Ordinary cohomology does not suffice in Sullivan's class: `Λ(ω₃) → Λ(x₁, y₁, z₁)`, `ω ↦ xyz` (2.5, third Check).

**Repair:** In 2.2: "(Hess, Proposition 1.13; Sullivan, Proposition (3.5) for lifting up to homotopy)". In 3.3: "(Morgan, Proposition 5.9 with `i = ∞`; Hess, Proposition 1.18 for the relative form; Sullivan, Corollary (4.2) for the twisted-coefficient form without the ordering condition)".

## R12 (P3) — "Hess's `Λ(x₁, y₁, z₁)`" is not the algebra of Hess, Example 1.12

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 112–113, 262: "`dx = yz`, `dy = zx`, `dz = xy` … (Hess, Example 1.12)".

**Claim:** The source has `dz = yx = −xy`; the roadmap's cyclic algebra is the one dual to `𝔰𝔬(3)` (5.2, first Check), a different set of structure constants.

**Witness:** Hess2007 line 255 (the same in arXiv version 1): `dx = yz`, `dy = zx`, `dz = yx`.

**Repair:** "(a cyclic variant of Hess, Example 1.12, which has `dz = yx`; the argument is the same, `d` being injective on degree `1`)", and "the cyclic `Λ(x₁, y₁, z₁)`" for "Hess's `Λ(x₁, y₁, z₁)`" at lines 262, 399, 634.

## R13 (P3) — The README refers to open pull requests

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 846–847: "No roadmap on main or in the open pull requests cites RationalHomotopyModels. EllAdicHomotopyTypesAndWeights consumes, in its open pull request, the five contracts"; lines 49–55.

**Claim:** A README is timeless; these sentences describe the state of the repository on one day.

**Witness:** The house rule against pull-request references and process narrative in a README; the sentence at line 846 becomes false at the first citation.

**Repair:** Downstream consumers: "EllAdicHomotopyTypesAndWeights consumes `polynomial-forms-de-rham` (§§4.1–4.4), `sullivan-minimal-models` (§§1.1–1.3, 3.1, 3.2), `sullivan-quasi-isomorphism-rigidity` (§3.3), `sullivan-homotopy-lifting` (§§2.1–2.4) and `sullivan-scalar-extension` (§3.5)." In Scope, drop "requests … from AlgebraicTopologyPartII Layer 4. That layer consists of … and contains neither": keep the mapping and the sentence that AlgebraicTopologyPartII §§4.1–4.6 is not restated.

## R14 (P3) — The description names one of the suppliers that are not on main

**Location:** Pull request description, the paragraph "**Ownership.**" and the bullet "Graded commutativity, which is DerivedDeRhamCohomology §2.21's predicate".

**Claim:** A reader must know which roadmaps have to merge first; the description names DerivedDeRhamCohomology only.

**Witness:** README lines 182–183 and 190–191 cite ArithmeticLocallySymmetricSpaces §ALS.F.5 and StableHomotopyKTheory §3.36; neither folder is on main.

**Repair:** Add: "Suppliers: on main, DGAInfinity, AlgebraicTopology, GeneralizedCohomology, ComplexKahlerGeometry, DifferentialGeometry; not yet on main, and earlier in the merge order, DerivedDeRhamCohomology §2.21, ArithmeticLocallySymmetricSpaces §ALS.F.5 and StableHomotopyKTheory §3.36."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `existsUnique_algHom` | `ι = ∅`; one odd generator; `B = K[s]`, `\|s\| = 1`; char 2 | `A = K`; `2e² = 0` so `e² = 0`; `s² ≠ 0` fails `hB`; over `𝔽₂` `Λ(e) → 𝔽₂[s]` has no map | true with `[CharZero K]` | none |
| 1.2 `isMinimal_iff` | `ι = ∅`; `Λ(u₁, v₂)`, `du = v`; `Λ(x₂, y₃)` | both sides true; both false (`v ∉ A⁺·A⁺`); `d(xᵏy) = x^(k+2) ∈ A⁺·A⁺` | true; Morgan1978 lines 1024–1035 | none |
| 1.3 `exists_dgAlgHom_iff` | `Λ(x₂, y₃) → K[s]/(s²)`; `→ K[s]`; non-commutative `B` | `0 = s²` holds; `0 ≠ s²` fails; both sides `φ`-derivations with sign `(−1)ᵖ` | true, no characteristic needed | none |
| 2.2 `exists_lift` | `M = K`; `K → Λ(t, dt)`; `Λ(u, v) → Λ(u)` | unit; lift into `K¹ = 0`; `d(cu) = cv` forces `c = 0` | true; Hess2007 line 297 | R11 |
| 2.3 homotopy | `H(e) = d(s ⊗ t)` | left `±s`, right `ds` | formula false | R05 |
| 2.4 classes, automorphisms | `[Λ(e₁), Λ(a₁)]`; `x ↦ λx` on `K[x]/(x²)` | `H¹ = K`; `β(y) = λ²y` | true; needs 3.1, 3.3 | R04 |
| 2.5 model structure | `Λ(t, dt)`; `K[x, y]/(xy)` | `A⁰ = K[t] ≠ K`; cofibrant, not a domain | characterisation false | R01 |
| 3.1 `exists_minimalModel` | `A = K`; `K[x]/(x²)`; `K × K` | `ι = ∅`; `Λ(x₂, y₃)`; `finrank H⁰ = 2` excluded | true; Morgan1978 line 1064 with line 227 | R09 |
| 3.2 `exists_iMinimalModel` | `i = 0`; `T²`, `i = 1`; `S¹ ∨ S¹` | `M = K`, `H¹(K) = 0`; `Λ(a, b)`; `H²(Λ(a, b)) ∋ ab ↦ 0` so more generators | true; Morgan1978 lines 1036–1042, 1064 | none |
| 3.3 rigidity | `K → Λ(u, v)`; `e ↦ 2e`; `Λ(ω₃) → Λ(x, y, z)` | not onto, target not minimal; inverse `e/2`; target not Sullivan | true with degree-one generators; Morgan1978 line 1162 | R11 |
| 3.4 `exists_iso_of_minimalModels` | `ℂP²` with `dy′ = c x′³` | `y′ ↦ c⁻¹y′` | true; Morgan1978 lines 1064–1067 | none |
| 3.5 `baseChange` | arbitrary linear `d`; model half | `1 ⊗ d(xᵢ) ∈ (L ⊗ A)⁺·(L ⊗ A)⁺` without `IsDGAlgebra`; model half elaborates | true; half absent | R03, R10 |
| 4.1 simplices | `∂₀` on `Δ¹`; `s₀` on `Δ⁰` | `t₁ ↦ t₀ = 1`; `t₀ ↦ t₀ + t₁ = 1` | agrees with Hess2007 lines 382–401 | none |
| 4.2 Poincaré, extendability | `n = 1` over `𝔽_p`; `∂Δ²`, degree `0` | `t^(p−1) dt` not exact; `(a, b, c)` extends to `at₀ + bt₁ + ct₂` | true in characteristic `0` | none |
| 4.3 `A_PL(X)` | `Δ¹/∂Δ¹` | `p(0) = p(1)`; `∫₀¹ q` identifies `H¹ = K` | true; Hess2007 line 408, lines 654–692 | none |
| 4.4 de Rham | `Δ¹`, `t = t₁` | `∮(t dt) = 1/2`; cups `0` and `1` | Check sound; Hess2007 line 431 | none |
| 4.5 spaces | `T²` | `ab = −ba ≠ 0`, `a² = 0` | true; Hess2007 lines 410, 431 | none |
| 5.1 DG Lie | odd `x`; plus rule | `3[x, [x, x]] = 0`; `d[x, x] = 0` | Check vacuous | R06 |
| 5.2 cochains | Heisenberg; `⟨u₁, v₂⟩`, `d_L v = u` | formula `2xy`, Check `±xy`; `H = K` | mismatch | R07 |
| 5.3 homotopy Lie algebra | `Λ(x₂, y₃)` | `⟨y, [a, a]⟩ = ±⟨x², a ⊗ a⟩ = ±2` | sign unpinned; Sullivan1977 lines 440–446 | R07 |
| 6.1 realization | `Δ⁰`; `Λ(t, dt)` | `Hom(A, K)`; contractible | true; Hess2007 lines 445–460 | none |
| 6.2 generators | `Λ(u₂, v₃)`; `S²`; `ℂP²` | `π₂ = 0 ≠ Hom(V², ℚ)`; `V = ⟨x₂, y₃⟩`; `⟨x₂, y₅⟩` | false without minimality | R02 |
| 6.3, 6.4 | `S² × S⁴` and `ℂP³` | Betti `1, 1, 1, 1` in degrees `0, 2, 4, 6` for both; `x² = 0` against `x² ≠ 0` | Checks sound; Hess2007 line 556 | none |
| 7.1 `IsFormal` | `M₂(K)`; Heisenberg | not formal; `x·H¹ = 0` but `[xz] ≠ 0` | Check too wide | R08 |
| 7.2 `isFormal_of_complement` | `dn = p + q`, `p ∈ ΛC`, `q ∈ I(N)`; `Λ(x, y, ψ, φ)` | `q` closed, so exact, so `[p] = 0`; `d(xφ − yψ) = 0`, degree `4` all closed | true without nilpotence | none |
| 7.3 `isFormal_of_ddc` | `dᶜ = 0`; `dᶜ = d`; five steps on `ker dᶜ` | `d = 0` in both; each step uses `hddc` once on `dᶜa`, `a`, `da`, `a`, `da` | true; `[CharZero K]` not used | none |

- Source locators checked against the text: 39 (Hess2007 20, Morgan1978 10, Sullivan1977 9); 34 support the statement, 5 are R09–R12. Hess numbering is the same in arXiv versions 1 and 2 for every cited item.
- Library declarations opened at the pins: 33. `TauCeti.DGAlgHom` extends `𝒜 →ₐᵍ[R] ℬ` (`TauCeti/Algebra/Homology/DG/Algebra/Hom/Basic.lean` line 50), so morphisms preserve degree; `GradedLieAlgebra` (`Mathlib/Algebra/Lie/Graded.lean` line 55) has `lie_self`, no Koszul sign; `GradedAlgebra.baseChange` (`Mathlib/RingTheory/GradedAlgebra/TensorProduct.lean` line 37). No Sullivan algebra, `A_PL` or commutative formality at either pin.
- Cross-roadmap citations resolved: 13 sections (DGAInfinity Layers 1, 3, 8; DerivedDeRhamCohomology §2.21; ArithmeticLocallySymmetricSpaces §ALS.F.5; AlgebraicTopology §§4.7, 6.2, 8.3, 8.5; GeneralizedCohomology G2.1; StableHomotopyKTheory §§3.36, 3.37; ComplexKahlerGeometry §6.3; DifferentialGeometry 0.1), all present where cited.
- Dependency check: `depcheck: 240 roadmaps, 2178 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at this head: every check passed. `lake env lean` on `Suggested.lean`: 11 `sorry` warnings and nothing else. The 18 elaborated types were compared with the README statements: no binder lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `constructor <;> simp`, `trivial`) on the 11 theorems: none closes.
- Reference identifiers resolved: arXiv 2210.00607, 2104.04086, 1910.04746, 2011.13411, math/0010124 are the works cited.
- Overlap check: read EllAdicHomotopyTypesAndWeights, KanQuillen (none on main); polynomial forms, Sullivan minimal models, rigidity, homotopy lifting and scalar extension: owner RationalHomotopyModels, consumed by EllAdicHomotopyTypesAndWeights; the Kan–Quillen model structure: owners GeneralizedCohomology G2.1 and KanQuillen, cited and not built here.
- Source independence: 39 passages compared with 3 sources, none shared; largest share Hess2007, 23 of 77 locators; contents compared with Hess2007: independent (its §1 has the order lifting, minimal models, `A_PL`, realization that the *Needs:* lines of 2.2, 3.1 and 6.2 force; Layers 5 and 7 lie outside it); DGMS1975, FHT2001, Quillen1969 and BG1976 could not be read.

## Not verifiable

- DGMS1975 (§4 Definition, Theorem 4.1, p. 261, §6 Main Theorem and Corollary 1): Springer, paywalled; no open copy found. The "if" half of Theorem 4.1 and the `ddᶜ` argument were proved independently (table, 7.2 and 7.3).
- FHT2001 (§§3, 10, 12, 17, 21–24): Springer, paywalled.
- Quillen1969 (Part I, Appendix B, Theorem I): JSTOR landing page only.
- BG1976 (the model category of commutative DG algebras, §8): AMS Memoirs, no open copy.
- Morgan1978, Proposition (5.5): the displayed formula is damaged in the extraction; R05 rests on the degree count and the witness, not on the source's display.

## Source issues

- **Error** in Hess2007 at Theorem 1.24(2), p. 10: the source says the homotopy groups of the realization of any simply connected Sullivan algebra of finite type are dual to `V`; it should assume minimality, since `Λ(u₂, v₃)`, `du = v`, has contractible realization; affects a stated result.
- **Error** in Hess2007 at §1, the paragraph before Proposition 1.13, p. 6: the source says the cell maps are exactly the relative Sullivan algebras and the Sullivan algebras are the cofibrant objects; it should say cofibrant objects are retracts of cell objects, the generator `Λ(x₀) → ℚ` not being a free extension; affects a stated result.

## For the human reviewers

- **Ownership.** EllAdicHomotopyTypesAndWeights (its open pull request, README lines 67–75) addresses the five Sullivan gaps to AlgebraicTopologyPartII; this roadmap claims them (README lines 49–60). Which roadmap owns them, and the repointing of those gaps, is yours to settle.
- **Not tested.** DGMS1975, FHT2001, Quillen1969 and BG1976 (about 31 of 77 locators) were not read: wording and locators against them are unchecked. Hess2007, the largest share, was read in full for §§1–2.1.
- **Licence.** No reuse found; no public formalisation resembling `Suggested.lean` was looked for beyond the pinned libraries.
