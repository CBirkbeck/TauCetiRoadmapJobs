# Review of ClassFieldTheory (pull request #1215 at c00ad42)

**Verdict:** needs changes

Seven findings, all P3; none blocking. The mathematics of the seven `Suggested.lean` declarations and of the sampled README sections survived the adversarial pass (table below). What remains is pull-request hygiene, two inaccurate prose claims, and three contract or dependency lines that disagree with the pin or with the README itself. The folder is unchanged since `71f4111`; this is a full review of the head.

## R01 (P3) — Edit outside the declared folders: `Completed/LocalGaloisGroups/Suggested.lean`

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` (62 insertions, 50 deletions), for example line 345 `ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ` and the `TauCeti.ClassFieldTheory.*` rewrites around lines 245–470 and 1630–1930.

**Claim.** The pull request edits a Completed roadmap. That folder is neither this one nor one of the two folders it declares as its own (GlobalQuadraticForms, QuadraticFormInvariants), so nobody reviews the edit. The edit is forced. That file imports this roadmap's `Suggested.lean`, which no longer declares the names it used. So the edit cannot be split off. This was also the previous review's R02 at `b94cfcc`, and it is still unrepaired.

**Witness.** Running `git diff --stat origin/main...HEAD` with the three declared folders excluded prints `Completed/LocalGaloisGroups/Suggested.lean | 112`. That file imports `TauCetiRoadmap.ClassFieldTheory.Suggested` (line 12) and calls `ClassFieldTheory.cyclotomicCharacter_artinMap` (line 345).

**Repair.** Declare `Completed/LocalGaloisGroups` as a folder of this pull request in its description. Add one sentence saying that the edit only re-points references from this roadmap's former `Suggested.lean` declarations to Tau Ceti's names, plus the one open target `cyclotomicCharacter_artinMap`, so that the folder gets its own review. Test: after the change, the brief's `git diff --stat` command, with that folder excluded too, prints nothing.

## R02 (P3) — Two other open pull requests rewrite this roadmap; no order is stated

**Location.** The pull request description, and this folder's `README.md` and `Suggested.lean` as a whole.

**Claim.** #617 and #1411 each rewrite this README and `Suggested.lean`, and each differs from this head. At their heads the README has 1095 and 2473 lines; each differs from main by more than 3000 changed lines, and from this head's 2271-line README as well. The description does not say which merges first. This was also the previous review's R03 at `b94cfcc`, and it is still unrepaired.

**Witness.** `roadmaps overlaps ClassFieldTheory` reports: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `…/Suggested.lean`" and "#1215 and #1411 conflict in …". The description names neither pull request.

**Repair.** State in the description that this pull request merges first, and that #617 and #1411 then rebase on it, keeping only the ClassFieldTheory edits this head lacks. This head already carries #1411's Layer 7 subject as `normResidue_map_unitFiltration` and `closure_map_artinMap_unitFiltration_eq_upper`, with the old names mapped in the Section and name correspondence (README lines 278–279).

## R03 (P3) — Layer 8: the openness justification is false in characteristic `p`

**Location.** `README.md:1407–1409`: "local existence needs no openness hypothesis, an open subgroup of finite index being exactly a subgroup of finite index containing a power subgroup."

**Claim.** A subgroup of index `n` always contains `(Kˣ)ⁿ`. So the clause says that every finite-index subgroup of `Kˣ` is open. That holds in characteristic zero, and for index prime to `p`, but it fails for a local field of characteristic `p`. The conclusion, that neither existence statement needs an openness hypothesis, is still right in the two ranges stated. Only the reason given is too general.

**Witness.** Take `K = 𝔽_p((t))`. Then `U¹ ≅ ℤ_p^ℕ` maps onto `(ℤ/p)^ℕ`. The kernel of a functional that kills `⊕` but not `∏` is a non-open subgroup of index `p` (milne-adt line 1078–1083, I §2, footnote 6, p. 26).

**Repair.** Replace the clause with: "in characteristic zero, and for index prime to the residue characteristic in every characteristic, a subgroup of finite index `n` contains the open subgroup `(Kˣ)ⁿ` and so is open". Test: the `𝔽_p((t))` subgroup has index `p` divisible by `p`, so the corrected clause no longer covers it.

## R04 (P3) — The claim that FunctionFieldArithmetic imports Layer 7's comparisons is false at its head

**Location.** `README.md:186–188`: "…the characteristic-`p` cases of Layer 7's `normResidue_map_unitFiltration` and `closure_map_artinMap_unitFiltration_eq_upper`, which it imports rather than proves". The same claim is at `README.md:2016–2019` ("are not proved a second time there").

**Claim.** The ownership is right: ClassFieldTheory is on main, and FunctionFieldArithmetic comes later in the merge order. But the cited consumer does the opposite of what is written here, so the two READMEs carry the same derivation twice. The review at `024927f` raised the FunctionFieldArithmetic side and asked that this coordination be named in the description. It is not named.

**Witness.** FunctionFieldArithmetic (head `76ed4c1`), README lines 1146–1160, derives finite and infinite unit-filtration reciprocity "from suppliers … not a target here", using only Tau Ceti theorems and `artinMap_restrict`. Neither Layer 7 name appears in its README or `Suggested.lean`.

**Repair.** Keep the ownership. Name the coordination in this pull request's description: FunctionFieldArithmetic §4.2 replaces its derivation (its README lines 1146–1160) with a citation of `normResidue_map_unitFiltration` and `closure_map_artinMap_unitFiltration_eq_upper`. Test: on `y² − y = t⁻¹` over `𝔽₂((t))`, both texts give `Art(U¹) = C₂ = G¹` and `Art(U²) = 1 = G²`. After the repair, only the cited Layer 7 theorem gives it.

## R05 (P3) — Layer 8's conductor-compatibility bullet restates Tau Ceti theorems without naming them

**Location.** `README.md:1457–1463`: "the compatibility of the Layer 7 conductors with existence: … for `K = ℚ₂`, `U(K,0) = U(K,1)`, so `U(K,1)·⟨2⟩ = Kˣ` has trivial class field and conductor zero."

**Claim.** Every other law in the Layer 8 contract names its Tau Ceti declaration. This one is stated in prose only, and it is missing from the Layer 8 row of From Tau Ceti (line 612). A reader cannot tell that it is already proved, or that it carries `[CharZero K]`.

**Witness.** `TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/Conductor.lean` has `conductorExponent_localClassField_le_iff` (line 66), `conductorExponent_localClassFieldPrimeToResidueCharacteristic_le_iff` (line 74), `conductorExponent_localClassField_unitFiltrationSupZpowers` (line 113) and `conductorExponent_localClassField_unitFiltrationSupZpowers_one_eq_zero` (line 123). None of them occurs in the README.

**Repair.** Name these four declarations in the bullet and in the Layer 8 row of From Tau Ceti. Note that all but the prime-to-residue-characteristic one assume `[CharZero K]`. Test: the `ℚ₂` example is exactly `…_one_eq_zero` at `Nat.card 𝓀[ℚ₂] = 2`.

## R06 (P3) — `continuous_artinMap` is described more narrowly than the pinned theorem

**Location.** `README.md:1169–1170`: "and continuous for finite extensions of `ℚ_p` (`continuous_artinMap`)".

**Claim.** The contract understates the supplier: the pinned theorem has no characteristic hypothesis. A reader of Layer 7, or of FunctionFieldArithmetic, would conclude that continuity in equal characteristic is missing.

**Witness.** `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:248` proves `Continuous (artinMap K)` under the variables of line 106 only (`[IsNonarchimedeanLocalField K]`). So it covers `𝔽_p((t))`.

**Repair.** Write "continuous for every nonarchimedean local field (`continuous_artinMap`)".

## R07 (P3) — The Layer 7 prerequisites omit ProfiniteProPGroups Layer 0

**Location.** `README.md:1158`: "*Prerequisites:* Layers 5, 6; `LocalFieldsRamification` (…)".

**Claim.** `README.md:2211` says that each row of Dependency order lists "exactly the prerequisites stated at the head of that layer". The Layer 7 row (line 2219) adds "ProfiniteProPGroups Layer 0", which the head line lacks.

**Witness.** ProfiniteProPGroups Layer 0 appears in Layer 7's Dependencies (line 1395), in the absolute target's *Needs:* (lines 1338–1339) and in the absolute-filtration API (line 1284), but not at line 1158.

**Repair.** Add "ProfiniteProPGroups Layer 0 (closed subgroups of a profinite group are determined by their finite images)" to line 1158.

## Verified sound

**Gate and build.**
- The worker's gate at `c00ad42` reports every check `0` and `build=0 OK`.
- My rerun (`gate … --base origin/main`) differs only in `outside-folder=5`. It lists the five files of GlobalQuadraticForms and QuadraticFormInvariants because my invocation did not pass this pull request's folder list.
- Dependency check: `depcheck: 239 roadmaps, 2316 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean …/Suggested.lean` exits 0 in 31 s with exactly six `declaration uses sorry` warnings (lines 79, 95, 125, 140, 151, 165) and nothing else.

**Signatures (`#check @name`).** All seven declarations were elaborated in one scratch copy.
- Each type has the README's hypotheses, and no section binder is lost (the file has no `variable` block).
- `cyclotomicCharacter_artinMap`: `[Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]`, `u` with valuation `1`, and `σ` with `↑σ = artinMap F u`. There is no `ValuativeExtension`, which matches line 1193.
- `normResidue_map_unitFiltration`: local fields `K` and `L`, `[ValuativeExtension K L] [Module.Finite K L] [IsGalois K L] [IsMulCommutative Gal(L/K)]`, and `n : ℕ`. This matches lines 1218–1221.
- `localAbsoluteUpperRamificationGroup`: `RamificationIndexDomain → Subgroup (Field.absoluteGaloisGroup K)`, where `RamificationIndexDomain` is `Set.Ici (-1 : ℝ)` (`TauCeti/NumberTheory/LocalField/RamificationGroup.lean:86`).
- `closure_map_artinMap_unitFiltration_eq_upper`: any nonarchimedean local `K`, with no `CharZero`.
- `isPrincipal_map_hilbertClassField`: `[NumberField K]` only.
- `count_relDiscr_eq_finsum_abelianConductor_exponent` and `abelianConductor_eq_lcm`: `[IsAbelianGalois K L]`, with `ψ : Gal(L/K) →* ℂˣ`.

**One-tactic probe.** I tried `first | rfl | simp | infer_instance` on a scratch copy, adding `exact localCyclotomicCharacter_artinMap_unit` for the first theorem and `exact map_artinMap_unitFiltration_zero K` for the absolute one. All six theorems fail, the first because no instance supplies `ValuativeExtension ℚ_[p] F`. Nothing is padding.

**Headline theorems.** The README's open headlines are:
- the unit cyclotomic normalization;
- the finite upper-numbering theorem;
- absolute unit-filtration reciprocity;
- the principal ideal theorem;
- the conductor–discriminant formula, product half and lcm half.

All are statable at the pins and all are stated, with one simple definition that has a real body. Every headline the module docstring lists as proved at the pin exists there: `tateIso`, `Rep.projective_of_isZero_res`, `invMap`, `eulerCharacteristic_mixed`, `cohomologicalDimensionAt_absoluteGaloisGroup_eq_two`, `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two`, `conductorExponent_fixedField_ker`, `localAbelianExistence`, `localAbelianExistence_primeToResidueCharacteristic`, `localWeilArtinEquiv`, `localWeilArtinEquiv_compat`, `brLocalization_injective`, `range_brLocalization`, `exists_br_of_sum_eq_zero`, `globalArtinMap`, `globalAbelianExistence`, `cyclicHasseNorm`, `kroneckerWeber` and `hilbertProductFormula`. A grep finds no `sorry` in `TauCeti/NumberTheory/ClassFieldTheory` or `TauCeti/NumberTheory/LocalField`.

**Library declarations.** All 590 distinct backticked identifiers in the README were checked mechanically against the pinned Tau Ceti and Mathlib sources. Every one resolves except module and file names, notation (`G_K`, `C_K`, `W_K`, …), and `cup_add_left`, which is a name of the ProfiniteCohomology roadmap (its README line 228). I opened these declarations and checked their hypotheses against the README's description:
- `localCyclotomicCharacter_artinMap_unit` (`…/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311`, which assumes `ValuativeExtension ℚ_[p] F`), and `localCyclotomicCharacter_artinMap_padic` in the same file;
- `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`, `conductorExponent_le_iff_upperRamificationGroup_eq_bot` and `conductorExponent_fixedField_ker` (`…/Local/Conductor/UpperNumbering.lean:64, 121, 130`);
- `unitFiltration` (`…/LocalField/UnitFiltration/Basic.lean:104`, with `U(K,0) = 𝒪[K]ˣ`);
- `Ideal.ramificationGroup` (`TauCeti/RingTheory/Ideal/RamificationGroup.lean:60`, `(Q^(i+1)).inertia`, Serre's `G_i`), so `upperRamificationGroup K L ⟨n,_⟩ = G_{ψ(n)}` as the probe output shows;
- `normResidue` (`…/Local/Reciprocity.lean:162`);
- `relDiscr` (`TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean:33`, the relative norm of the different);
- `abelianConductor` (`…/Global/AdmissibleModulus/Basic.lean:193`, which has no hypothesis on `L/K`);
- `hilbertClassField` (`…/ClassFields/RayClassField.lean:241`, `rayClassField (Modulus.one K)`);
- `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`…/Formation/PrincipalIdeal.lean:67`);
- `map_artinMap_unitFiltration_zero` (`…/Local/Unramified.lean:475`);
- `continuous_artinMap` (`…/Local/ArtinMap.lean:248`);
- `Rep.projective_of_isZero_res` (`…/TateCohomology/Projective/Basic.lean:232`) and `Rep.projective_ker_of_isZero_res` (`…/NakayamaRim.lean:117`, with `[IsDomain k] [IsPrincipalIdealRing k] [CharZero k]` at line 75), which match README line 264;
- `kummerEquivOfCharZero` (`…/MuNRep.lean:358`), `h2EquivZModOfMuNRepIso` (`…/Brauer/RootsOfUnity.lean:156`) and `h2MuEquivZMod_mixed` (same file, line 145);
- `tateDualityPairing_perfect` and `tateDualityPairing_perfect_mixed` (`…/Local/Duality/Perfect.lean:242, 280`), `eulerCharacteristic_mixed` and `eulerCharacteristic_finrank_fp` (`…/EulerCharacteristic/Theorem.lean:98, 110`), and `finite_H` (`…/FiniteCohomology/DegreeTwo.lean:97`), with the instance and explicit-argument split exactly as lines 170–176 and 1043–1063 say;
- `globalAbelianExistence` (`…/GlobalExistence/Existence.lean:213`, which assumes open and finite index), `globalNormSubgroup_kummerLayer_sUnits` (`…/GlobalExistence/Kummer.lean:83`, index `p^(#S + r₁ + r₂)`), `exists_sq_sub_mul_sq_iff_forall_completion`, `finrank_le_index_range_ideleClassNormMap`, `hilbertSymbol_productFormula`, `kroneckerWeber` and `mem_support_of_ramified`;
- Mathlib's `hensels_lemma` (`Mathlib/NumberTheory/Padics/Hensel.lean:460`), `Valuation.exists_map_pow_eq_map_algebraMap_of_isAlgebraic` (`Mathlib/RingTheory/Valuation/Algebraic.lean:28`), `CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`, `MonoidHom.domRestrict_surjective` and `CommGroup.card_domRestrictHom_ker` (`Mathlib/GroupTheory/FiniteAbelian/Duality.lean:63, 107, 133`), and `continuousCohomology` (`…/ContCohomology/Basic.lean:131`).

**Seeded source sample (0.1–14.1).**
- **milne-cft** (v4.03): 31 locators land on the stated theorem and printed page:
  - Chapter II: Thm 3.11, p. 84 (line 3911).
  - Chapter III: Prop 1.9, p. 102 (4641); Thm 3.1, p. 107 (4822); Lemma 3.2, pp. 107–108 (4844).
  - Chapter V: Ex 3.2, p. 157 (7004); Thm 3.5, p. 158 (7041); Ex 3.11, p. 159 (7121); Thm 3.17, p. 161 (7252); Thm 3.27, Rem 3.28 and Exs 3.29–3.30, p. 165 (7423–7447).
  - Chapter VII: §4 / Cor 4.4, p. 211 (9619); Thm 5.1, p. 212 (9665); Prop 7.2 and Lemma 7.3, p. 220 (9996, 10007); Thm 8.1(b), Ex 8.2 and Lemmas 8.4–8.6, pp. 221–223 (10042–10175); Lemmas 9.1, 9.3, 9.4 and Thm 9.5, pp. 223–226 (10189–10287).
  - Chapter VIII: Thm 3.1 and Rem 3.2, p. 234 (10629, 10642); Thm 4.7, p. 242 (11011).
  - The README's remark that Milne counts infinite places in `S` matches line 10221.
- **milne-adt**: I Thm 2.1, p. 26 (1073); Cor 2.3, p. 28 (1138); Thm 2.8, p. 31 (1227, giving `χ = (R:mR)⁻¹`); Lemmas 2.10 and 2.12, pp. 32 and 34 (1266, 1350).
- **serre1961**: n° 3.1 is stated for totally ramified `L/K` (line 862). Proposition 3 and the following paragraph on p. 128 (931–938) define the upper groups of an infinite extension by passage to the limit, as cited.
- **kopp-lagarias**: Thms 1.1–1.3, pp. 3–4 (lines 128, 160, 174). Thm 1.2 at `m = O` places the ring class field inside the ray class field of `f(O)`, and Thm 1.3 gives `Gal ≅ Pic O`.
- Sections 0.1, 1.1, 3.1, 4.1, 8.1, 9.1, 11.1 and 14.1 carry no source locator. They consume pinned declarations, whose existence I checked above.

**Adversarial pass.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `cyclotomicCharacter_artinMap` | `F = ℚ₃`, `u = 4`; `ℚ₂`, `u = −3`; `F = ℚ₂(i)`, `u = i` | `4⁻¹ ≡ 7 (mod 9)`, against geometric `4`; `−3 ≡ 5`, `5·5 = 25 ≡ 1 (mod 8)`; `N(i) = 1`, so `χ = 1 = Art_ℚ₂(1)` | holds; inverse direction pinned |
| Route: `ValuativeExtension` automatic | `a ∈ 1 + pℤ_p`, `X^{ℓ^k} − a` at `1` | `‖1 − a‖ ≤ p⁻¹ < 1 = ‖ℓ^k‖²`; `v(1 − p) = 0` forces `v(p) > 0` | holds |
| `normResidue_map_unitFiltration` | `ℚ₂(i)`, `n = 1, 2`; `ℚ₃(ζ₉)`, `n = 2`; `L = K` | `U¹ = ℤ₂ˣ ↦ G` (`−1` is not a norm), `G¹ = G`; `1 + 4ℤ₂ ↦ 1 = G²`; `Art(U²) = 1 = G²`, while `#G₂ = 3`; trivial = trivial | holds |
| `localAbsoluteUpperRamificationGroup` | identity layer; unramified cubic; `ℚ₂(ζ₈)`; `X³ − 5` over `ℚ₅` | `{1}` at every depth; depth −1: 3, depth 0: 1; `{1,3,5,7}`, `{1,3,5,7}`, `{1,5}`, `{1}` at depths 0–3; `S₃`, `C₃`, `1`, with `C₃ = [S₃,S₃]` invisible in the abelianization | holds; the abelian-only wrong model is excluded |
| `closure_map_…_eq_upper` | `n = 0`; `ℚ₃(ζ₉)` at `n = 2` | Tau Ceti `map_artinMap_unitFiltration_zero` (units onto inertia), with `G_K^0` = inertia; the projection is `1 = G²` | holds |
| `isPrincipal_map_hilbertClassField` | `K = ℚ`; `ℚ(√−5)`, `𝔭 = (2, 1+√−5)`; `I = 0` | `H = ℚ`; `𝔭² = (2) = ((1+i)²)` in `K(i)`, so `𝔭𝒪_H = (1+i)`; `(0)` is principal | holds |
| `count_relDiscr_…` | `ℚ(i)`; `ℚ(ζ₈)`; `ℚ(ζ₅)` (repeated kernels) | `0+2 = 2 = v₂(4)`; `0+2+3+3 = 8 = v₂(2⁸)`; `0+1+1+1 = 3 = 5−2`; `finsum` is over the finite type `Hom(G,ℂˣ)`; `relDiscr ≠ ⊥` | holds; no junk value |
| `abelianConductor_eq_lcm` | `ℚ(ζ₈)`; real place | `max(0,2,3,3) = 3`, conductor `(8)·∞`; `∞` divides `(4)·∞` and `(8)·∞`; `⨆` over a nonempty finite family in `ℕ` is a max | holds |
| 0.1 Nakayama–Rim, Ĥ⁰ | `ℤ[C₂]`; trivial `ℤ`; `⊕ 2ℤ eᵢ` | `ℤ(1+g)` = norms, so `Ĥ⁰ = 0`; `Ĥ⁰ = ℤ/2`; free on `{2eᵢ}`, infinite rank | holds |
| 1.1 formations | `S₃`, `V = 1`; `V = G` | `G^ab = C₂`, fixed by `A₃`; degree 1, norm quotient `0` | holds |
| 2.1 fundamental class | cyclic of degree 4; restriction to index 2; inflation to degree 8 | `inv(res u) = 2·¼ = ½ = 1/[U':V]`; `inv(cor res u) = ½`; `inf u = 2u`, `2/8 = ¼` | holds |
| 3.1 Tate | unramified cubic | `Frob ↦ class(π)`, `Frob² ↦ class(π²)` ↔ `2 mod 3` | holds |
| 4.1 abstract Artin | degree 2; Klein four | kernel = norms; three non-norm cosets with three distinct values | holds |
| 5.1 duality / Euler | `ℚ₂`: `𝔽₂`, `𝔽₃`, `0`, `ℤ/3(χ)`; `𝔽₂((t))`; `ℚ₇`, `μ₃` | `8 = 2·2·2¹`; `3 = 3·1·2⁰`; `1 = 1·1·2⁰`; `#H⁰ = 1` vs `3` for its dual; odd pole orders vs even for `x² − x`; `inv(7 ∪ δχ) = 1·⅓`, geometric `⅔` | holds |
| 6.1 local reciprocity, cd | `ℚ₂`, `𝔽₂((t))`; `ℚ₃` unramified quadratic; `ℚ₂(ζ₅)` | `cd = 2`, `cd₂ = 1`; `4` is a norm, `Art(3)` has order 2; order of `2 mod 5` is 4, `ζ₅ ↦ ζ₅²` vs geometric `ζ₅³` | holds |
| 7.1 conductor Checks | `ℚ₃(ζ₉)`; `ℚ₂(ζ₁₂)`; `ℚ₂(√2)`; `ℚ_p(μ_p)`; AS `y² − y = t⁻¹` | lower orders `6,3,3,1`, `φ(2) = (3+3)/6 = 1`, conductors sum `9 = 12 − 3`, lower-numbering model `13`; `0+0+2+2 = 4 = f·d`; units `±1 mod 8`, conductor `3 = δ`; `p − 2` vs max `1`; break `1`, conductor `2 = δ` | holds |
| 8.1 local existence | `ℚ₂`, `U¹·⟨2⟩`; `𝔽_p((t))` openness | `𝔽₂ˣ = 1`, so `U⁰ = U¹` and conductor `0`; non-open index-`p` subgroup | holds; R03, R05 |
| 9.1 Weil group | `𝔽₂((s))/𝔽₂((t))`, `t = s²`; `ℚ₂(i)`; unramified quadratic | no `K`-embedding, index `1 ≠ 2`; `f = 1`, index 2; `deg_K = 2·deg_L` | holds |
| 10.1 Brauer / lifting | `ℚ(√13,√17)`; `(−1,−1)/ℚ` | `(17/13) = (4/13) = 1`, `(13/17) = 1`; `2` is inert in `ℚ(√13)` (13 ≡ 5 mod 8) and split in `ℚ(√17)`; lcm of local degrees `2 < 4`; `½ + ½ = 0` | holds |
| 11.1 global Artin | `ℚ(ζ₅)`, `(2)(3)` | `σ₂σ₃ = σ₆ = σ₁` | holds |
| 12.1 Kummer case | `ℚ(ζ₃)`, `p = 3`, `S = {(1−ζ₃)}` | `#U(S)/U(S)³ = 3·3 = 9`; local indices `9/3⁻² = 81` and `9/9 = 1`; `81/9 = 9 = 3^{1+1}`, and `3` without `r` | holds |
| 12.1 composita | two `D₄` fields sharing `B` | `|D₄ ×_{V₄} D₄| = 16`, `[G,G]` = diagonal `C₂`, abelianization `8` vs `[B:K] = 4` | holds |
| 13.1 quadratic Hasse | `ℚ`, `d = −1`; `ℚ(√2)`, `d = a = −1` | `5 = 1+4`, `(−1,3)₃ = −1`; at the place above 2: `2·½ = 0`; both real places ramified | holds |
| 13.1 ring class | `ℤ + 2ℤ[i]`; `ℚ(ζ₇)⁺` | `2/(1·2) = 1`; `(3!/27)·7 = 14/9 < 2` | holds |
| 14.1 Hilbert / QR | `(−1,−1)`; `p=3, q=7` | `½ + ½ = 0`; `(7/3)(3/7) = −1 = (−1)^{1·3}` | holds |
| W.3–W.6 | `ℚ₂(ζ₅)`; `ℚ(ζ₈)`; `ℚ(√5) ⊂ ℚ(ζ₅)` | `2⁻¹ ≡ 3 mod 5`; `Art(3,5,7)` gives `ζ₈^{3,5,7}`; split iff `ℓ ≡ ±1 mod 5` | holds |
| R06 `continuous_artinMap` | `𝔽_p((t))` | the pinned statement has no characteristic hypothesis | R06 |

**Cross-roadmap citations resolved.**
- On main: ProfiniteCohomology Layers 0–12 (Layer 12 at its README line 2091) and the `cup_add_left` row; ProfiniteProPGroups Layer 0; LocalFieldsRamification's contract names at the pin; GlobalNumberFields Layers 0–11 (Layer 7 at its line 459, Layer 11 at 571); NumberFieldArithmetic Layer 2 (§2.5 `artinHomAway`), §4.1 (line 1092), §4.2 (1123), §5.9 (1687), §5.10 (1714).
- At this head: GlobalQuadraticForms §4.2 (line 450) and §4.3 (line 505), which consume `finrank_le_index_range_ideleClassNormMap` and `exists_sq_sub_mul_sq_iff_forall_completion`; QuadraticFormInvariants (lines 88–91, 323–331).
- At their heads: RamificationOfCompleteDiscretelyValuedFields §4a.1 (#1410, head `8917bb8`), which cedes the local-field filtration to Layer 7; FunctionFieldArithmetic §4.2 (R04); LocalAnabelianGeometry (cites `cyclotomicCharacter_artinMap`); PadicPeriodRings (cites `map_unitFiltration_normResidue`, mapped at line 278).

**Overlaps.**
- The dropped ids §2.5 and §2.6 (cited by AnticyclotomicLocalUnits and EllipticCurveModularityWild3Adic) are mapped by "§2.1–§2.7 are C.1–C.7" (lines 250–251). Their content, arithmetic Frobenius and `χ_cyc(Art(u)) = N(u)⁻¹`, is C.6.
- Of the 445 declarations of main's `Suggested.lean`, 87 are neither at the pin nor in this README. Only `muNRepCoeffDictionary_continuous` and `muNRepCoeffDictionary_equivariant` are cited elsewhere (QuadraticFormInvariants on main). They are mapped at line 268 and are gone from that folder at this head.
- No id this roadmap cites is dropped by an open pull request, and none is defined only by an open revision.

**Ownership.** I searched main and all 468 open heads for the principal ideal theorem, the conductor–discriminant formula, unit-filtration reciprocity and the absolute upper filtration. The hits are:
- consumers (ArithmeticGaloisDuality, SmallRamificationAndAbelianVarietyBaseCases);
- the two competing ClassFieldTheory revisions (R02);
- ArithmeticGaloisRepresentations §3.5 (the local Artin-representation formula `a_K(Ind 1) = δ`, a different object);
- RamificationOfCompleteDiscretelyValuedFields §4a.1 (the general valuation-subring filtration, which agrees on local fields and says so).

No object has two owners. No `Suggested.lean` declaration reuses a fully qualified name of a readable roadmap.

## Not verifiable

- **artin-tate** (waived): XIV §§1–6, p. 163; XIII; XII; XV; XI §5; V–VIII. The manifest records a waiver; I did not fetch it.
- **serre-local-fields** (uncertified, paywalled): IV §§1, 3 Prop 14; V §§3, 6; VI §2; IX §8; XI–XIV; XIV §3; XV §2 Thm 2 and Cor 3 to Thm 1. These are cited by locator only, as the manifest settles.
- **neukirch-ant** (uncertified): V Thm 6.2; VI §7.
- **nsw** (uncertified): (7.1.8)(i), (7.2.5), (7.2.6), (7.3.1)–(7.3.4).

## Source issues

- **Misprint** in milne-cft at VII Theorem 9.5, p. 226: the source says every finite-index subgroup of the idele class group is a norm group; it should say every open finite-index subgroup, as §9's opening sentence (line 10185) and Lemma 9.3 require; affects nothing.
