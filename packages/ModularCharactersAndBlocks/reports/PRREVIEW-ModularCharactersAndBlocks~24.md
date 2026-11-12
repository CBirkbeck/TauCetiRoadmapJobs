# Review of ModularCharactersAndBlocks (pull request #1775 at 82701b2)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

:robot: Independent AI review (Claude Fable 5.2). This is a full review of `82701b2`. Nine of the ten findings of the previous review (at `11fcc6f`) are repaired; the family-index finding is not and is carried as R03. There are four findings: one P2 and three P3.

## R01 (P2) — The agreement of defect groups with defect classes is stated without a splitting hypothesis

**Location.** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:968–971`: “Prove that this agrees with the definitions by vertices of `e k[G]` … and by defect classes and central characters (Martínez, Definition 3.2 and Theorem 4.3, pp. 17 and 24).”

**Claim.** `IsDefectGroup` is defined over every field (`Suggested.lean:252`), and the bullets that follow in §6.2 each say which fields they cover. This sentence names none. The first two comparisons (vertices, relative traces) hold over every field of characteristic `p`. The third does not make sense there: a defect class of `B` is a class `C` with `a_B(C) λ_B(K_C) ≠ 0`, where `λ_B : Z(k[G]) → k` is the central character of `B` (martinez line 695–702, over the algebraic closure of `𝔽_p`, martinez line 132). That homomorphism exists only when the residue field of `Z(k[G]) e_B` is `k`.

**Witness.** `G = C₃`, `k = 𝔽₂`, `e = r + r²`: `Z(k[G]) e = k[G] e ≅ 𝔽₄`, which has no `𝔽₂`-algebra homomorphism to `𝔽₂`. So this block has no central character and no defect class, although its defect group is `1`.

**Repair.** Split the sentence: “Prove, for every field `k` of characteristic `p`, that this agrees with the definitions by vertices … and by minimality of `P` … . Over a field `k` of characteristic `p` that splits `G`, so that every block has a central character `λ_B : Z(k[G]) → k` (§4.2), prove that it agrees with the definition by defect classes (Martínez, Definition 3.2 and Theorem 4.3, pp. 17 and 24, over the algebraic closure of `𝔽_p`).” Add the witness to the existing negative-control Check on `𝔽₂[C₃]`. Tested:
- `𝔽₄[C₃]`, block `e_α = 1 + α² r + α r²`: on the class `{r}`, `a = α²` and `λ = α`, product `1 ≠ 0`; the Sylow `2`-subgroup of `C_G(r) = C₃` is `1`, the defect group.
- `𝔽₂[S₃]` (which splits `S₃`), `e = 1 + r + r²`: on the class `{1}`, `a = 1` and `λ = 1`; the Sylow `2`-subgroups of `C_G(1) = S₃` are the three subgroups of order `2`, the defect groups.

## R02 (P3) — The `p ∤ |G|` bullet of §2.4 goes beyond its locator

**Location.** `README.md:645–646`: “When `p ∤ |G|`, `d` is an isomorphism and the decomposition matrix is a permutation matrix (Webb, Theorem 9.4.11, p. 155).”

**Claim.** §2.4 defines `d` for every `p`-modular system and says so twice. The cited theorem assumes a splitting system.

**Witness.** Webb Theorem 9.4.11 begins with a splitting `p`-modular system (webb line 6518). The statement does hold without splitting, but no locator supports that.

**Repair.** Begin the bullet with “For a splitting system (§1.1) and `p ∤ |G|`,”. Alternatively keep the generality and add the argument: `O[G]` is then a separable `O`-algebra, so reduction is a bijection on simple modules. Tested on the non-splitting system `O = ℤ₂`, `G = C₃`: the simple `ℚ₂[C₃]`-modules have dimensions `1, 2`, the simple `𝔽₂[C₃]`-modules have dimensions `1, 2`, and `D` is the `2 × 2` identity; over `ℤ₂[ζ₃]` it is the `3 × 3` identity, the case the locator covers.

## R03 (P3) — The family index still assigns Brauer characters to this roadmap

Re-raised: H02. This head leaves the sentence unchanged. The files directly in `TauCetiRoadmap/RepresentationTheory/` are this pull request's own, and the pull request wrote the sentence.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim.** The folder imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (`README.md:97–106` of the folder). The index names this roadmap as their owner. “Both” follows three named roadmaps.

**Witness.** The supplier's §R17.5.11 at its open head, README line 2938: “Modular characters and their projective pairing are owned here.”

**Repair.** Replace the sentence with: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes these foundations, imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns the Brauer-character basis theorem, decomposition matrices, Brauer reciprocity and blocks with defect.” In the dependency bullet at lines 78–81, add SemisimpleAlgebras Layers 0–2, which §§2.2–2.3 consume. Tested: the imported objects match the supplier's §R17.5.11, and the owned ones match §§2.2, 2.4, 3.1 and Layers 4–7.

## R04 (P3) — Seven subsections have no *Needs:* line

**Location.** §§0.2, 4.3, 6.1, 6.2, 7.1, 7.3 and 8.1 (`README.md:303, 854, 929, 964, 1047, 1113, 1141`).

**Claim.** The other fourteen target subsections end with a *Needs:* line. These seven fall back on their layer's *Dependencies*, which is coarser than what they use. An implementer of §6.1 is placed behind Layer 4, which relative traces and the Brauer projection do not use.

**Witness.** `README.md:1043`: “Layers 0 and 4; Mathlib `IsPGroup`, `Sylow`, …” is the only dependency statement for §6.1. `brauerProjection_mul` and `isDefectGroup_conj` (`Suggested.lean:243, 261`) mention nothing from Layers 1–4.

**Repair.** Add these lines:
- §0.2: “*Needs:* Tau Ceti `TauCeti.IsPrimitiveIdempotent`, `TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent`; Mathlib `Subalgebra.center`, `CompleteOrthogonalIdempotents`.”
- §4.3: “*Needs:* §§0.2, 4.2; Mathlib `MonoidAlgebra.lift`.”
- §6.1: “*Needs:* Mathlib `MonoidAlgebra`, `Subgroup.centralizer`, `IsPGroup`.”
- §6.2: “*Needs:* §§0.2, 0.3, 6.1; Mathlib `Sylow`; for the defect-zero bullet §§1.1, 2.3, 4.2.”
- §7.1: “*Needs:* §§2.3, 6.1–6.3.”
- §7.3: “*Needs:* §§4.3, 6.1, 7.1.”
- §8.1: “*Needs:* §§0.2, 2.1.”

Tested against the Lean signatures: `brauerProjection_mul` uses `MonoidAlgebra`, `Subgroup.centralizer`, `IsPGroup` and `CharP` only, and `isDefectGroup_iff_sylow_of_augmentation_ne_zero` adds `Sylow`, `IsBlockIdempotent` (§0.2) and `brauerProjection` (§6.1).

## Previous findings

| Previous | Subject | Status at `82701b2` | Passage |
| --- | --- | --- | --- |
| R01 | defect zero needs splitting | repaired | `README.md:981`: “Defect zero, over a field `k` of characteristic `p` that splits `G`”; Check at `:999–1006` |
| R02 | central-character headline statable | repaired | `Suggested.lean:198` states `exists_blockIdempotent_iff_centralCharacter_congr`; `README.md:789`; the docstring bullet is gone |
| R03 | second owner of the `p'`-core | repaired on this side | §0.3 (`README.md:331–375`) defines `O_π(G)` with the full API; `README.md:30–33` records ownership |
| R04 | `M0`–`M8` mapping, inflation law | repaired | `README.md:265–266`; inflation at `:1157–1165` and in §8.4 |
| R05 | family index | not repaired | carried as R03 |
| R06 | nilpotent ideal in the radical | repaired | `README.md:582–584` cites `TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul` and the two Mathlib lemmas |
| R07 | `Br_D(e_B)` bullet | repaired | `README.md:986`: “Over a field `k` of characteristic `p` that splits `G` and all its subgroups” |
| R08 | §4.1 locator | repaired | `README.md:764`: Webb, Theorem 3.6.2, p. 42 |
| R09 | §6.1 locator | repaired | `README.md:933–935`: Lemma 11.3.1, pp. 194–195, and Proposition 12.4.1 |
| R10 | process remarks, Serre uncited | repaired | Serre is cited at `README.md:615, 625`; the parentheticals are gone |

## Verified sound

**Gate and build.**
- The worker's gate at this head passes every check, including the targeted build.
- Dependency check with the candidate order: `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`. No UPWARD or CYCLE line. This roadmap is at line 102, after ArithmeticGaloisDuality (62) and GL2AutomorphicRepresentationsAndTransfer (101); OddOrderTheorem is at 401.
- `lake env lean` on `Suggested.lean` exits 0 with 13 warnings, all `sorry`.

**Signatures and padding.**
- A scratch copy with `#check @name` for the 18 declarations (13 theorems, 5 definitions) elaborates. The file has no `variable` block; every binder is in its own signature and appears in the printed type, including `CharZero O`, `hζ`, completeness, `IsAlgClosed`, `M.IsMaximal` and `hpM`.
- One-tactic probe on a scratch copy, each theorem with `first | (simp; done) | rfl | infer_instance | (exact?; done)`: 11 fail with “`exact?` could not close the goal” and 2 time out. None closes, so none is padding.

**Lean form.** One `import Mathlib` and seven `TauCeti.*` modules; no `set_option`, no `lemma`, no sorry'd data; the five definitions have real bodies; every declaration has a docstring; layer comments follow README order.

**Library declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`):
- `TauCeti.cartanMatrix` (`RepresentationTheory/GrothendieckGroup/CartanMatrix.lean:138`; its docstring says rows simples, columns projectives, and `cartanMatrix_apply` at `:147` gives `[P j : S i]`)
- `TauCeti.ClassFunction.comap` (`RepresentationTheory/CharacterTable/ClassFunction.lean:120`, along `φ : H →* G`)
- `TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul` (`RingTheory/Jacobson/Basic.lean:101`)
- `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` (`RepresentationTheory/Induction/Cyclotomic/SplittingField.lean:107`)
- `TauCeti.Representation.primitiveCentralIdempotent` (`CharacterTable/CentralIdempotent.lean:301`, with `IsAlgClosed`)
- `TauCeti.Cyclotomic.complexRoot` (`RingTheory/Cyclotomic/Basic.lean:536`)
- `TauCeti.pSectionIndicator` (`RepresentationTheory/Induction/PElementary.lean:91`)
- `TauCeti.exists_projective_quotient_smul_top_linearEquiv` (`Algebra/Module/Projective/Lift.lean:89`)
- `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` (`RingTheory/Idempotents/Simple.lean:93`)
- Mathlib `Representation.ofQuotient` (`RepresentationTheory/Basic.lean:352`; it descends a representation trivial on `S` to `G ⧸ S`, the direction opposite to inflation, as §8.2 says)
- Mathlib `IntermediateField.adjoin.finiteDimensional` (`FieldTheory/IntermediateField/Adjoin/Basic.lean:486`)

Neither pin defines a `p`-core or a `π`-core. The worker's resolver reports no unresolved Lean name and no unresolved citation.

**Cross-roadmap citations resolved.**
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and §R17.5.12 exist at its open head (README lines 2928 and 2943), and §R17.5.11 states the pairing, the duality and the independence that §§2.2 and 3.1 import.
- ArithmeticGaloisDuality §R02.4.4 and its target *Surjectivity of the decomposition map* exist at its open head (README lines 3506 and 3636).
- CharacterTheory §§3.5, 4.3, 4.5, QuiverRepresentations Layer 3, GrothendieckEulerForms Layers 2 and 4, ModularInduction Layers 0, 1, 3, InductionRestriction Layer 6 and SemisimpleAlgebras Layers 0–2 are on main and unchanged since the previous review.

**Ownership and overlaps.**
- `roadmaps grep` over main and the 439 open heads for defect groups, Brauer maps, Brauer pairs, block idempotents, decomposition matrices, the principal block and the cores. The block-theory objects have no other owner.
- The cores are also written out in OddOrderTheorem §1.1 (its README lines 317–334) and in LocalFiniteGroupTheory, and GlaubermanZStar (its README line 45) attributes `O(G)` to LocalFiniteGroupTheory. This roadmap is the earliest of these in the merge order, §0.3 has the complete API those texts list, and *Scope and ownership* records it. The remaining change is theirs: cite §0.3. No fully qualified name coincides.
- The `Mk` ↦ Layer `k` sentence was checked against every GlaubermanZStar citation (`M1`, `M2`, `M4`, `M5`, `M7`, `M8`, its README lines 49–53 and 142–155): each cited item is in the mapped layer, with block-section orthogonality at §7.2 as the sentence says.
- The overlap report lists no dropped id, no revision-only id and no other pull request changing this folder. The description states the rebase order for the family-index conflict.

**Description.** Checked against the head: thirteen theorems and five definitions; the two not-statable headlines; the suppliers; the family-index changes. No wrong sentence found.

**Seeded source sample.** Printed pages follow the page markers: Webb PDF − 7, Martínez PDF − 8, Sambale PDF − 0, Craven PDF − 5.

| Target | Locators checked (source line) | Result |
| --- | --- | --- |
| 0.2 | Webb P12.1.1 p.227 (webb 9585), C12.1.3 p.228 (9608); Martínez T2.11 p.15 (martinez 648) | supports |
| 0.3 | Webb §6.2 p.88 (webb 3700, 3726); proof of C12.3.4 p.236 (9972–9977) | supports |
| 1.1 | Webb §9.4 p.148 (webb 6211–6232); L10.1.1 p.170 (7143) | supports (source issue) |
| 1.2 | Webb T9.4.8 p.153 (6434); Martínez T1.7, L1.8 p.4 (189, 196) | supports |
| 2.2 | Webb L9.3.1 p.145 (6093), L9.3.2 and P9.3.3 p.146 (6121, 6130), L9.3.5 and T9.3.6 p.147 (6161, 6167), T10.2.2 p.176 (7438); Martínez P1.5 p.3 (174), T1.9 p.5 (219) | supports |
| 2.3 | Webb T9.2.7 p.144 (6054) and remark (6057–6060); P9.2.5 pp.142–143 (5972) | supports (source issue) |
| 3.1 | Martínez P1.12 p.5 (264), C1.13 p.6 (300); Webb P9.5.1 p.157 (6623), T9.5.4 p.159 (6670), C9.5.6 p.160 (6712), P10.2.1 p.174 (7383), C10.3.3 p.183 (7720) | supports (source issue) |
| 4.1 | Webb T3.6.2 p.42 (1907) | supports |
| 4.3 | Sambale D1.2 p.14 (sambale 335) | supports |
| 6.1 | Webb L11.3.1 p.194 (8191), P12.4.1 p.238 (10047), L12.5.3 p.245 (10341), C12.5.4 p.246 (10365), L11.6.8 p.215 (9091); Martínez T4.1 p.23 (894) | supports |
| 6.2 | Webb T12.5.2 p.244 (10292), C12.5.5 p.246 (10384), C12.3.2 p.235 (9906), C12.3.4 pp.236–237 (9969), T12.4.5 p.241 (10173), C12.4.7 and C12.4.8 p.242 (10199, 10209), T9.6.1 p.161 (6800), T12.6.4 p.250 (10524); Martínez D3.2 p.17 (703), T4.3 p.24 (948), C3.9 p.21 (869), C2.9 p.15 (630); Sambale D1.4, P1.5 p.14 (350, 353) | R01 |
| 7.1 | Sambale D1.10, P1.11, T1.12 p.16 (424, 438, 442); Martínez T4.5, C4.6 p.26 (1004, 1055), T4.10 p.27 (1085); Webb T12.6.4 p.250 (10524) | supports |
| 7.2 | Sambale T1.13 p.16 (445), T1.14 p.16 (465); Martínez C2.4 p.11 (451) | supports |
| 8.1 | Martínez T1.14 p.6 (316), C8.2 and P8.4 p.51 (1895, 1907), T8.5 p.52 (1928); Sambale T1.23 p.18 (542) | supports |
| 8.2 | Webb §4.2 p.53 (2348–2356); Martínez §8.1 p.51 (1878–1881), T8.5(iii) p.52 (1933), D7.3 and Pb7.4 p.44 (1638, 1642), T7.7 p.45 (1710); Sambale T1.24 p.18 (547) | supports |

Outside the sample: Webb §12.2 pp.231–232 (webb 9767–9776) for modules belonging to a block of `O[G]`; Sambale T1.15 p.17 (sambale 478, both directions); Martínez T2.12 pp.15–16 (663) and C5.9 p.35 (1370, one direction; the README's “exactly when” rests on Sambale); Craven L2.7 p.23, L2.9 p.24, T2.11–2.12 p.25 (craven 823, 856, 891, 897); Webb T9.4.11 p.155 (6518, R02). The two Axiom statements (`axiom-third` line 45, `axiom-section` line 17) have the hypotheses the README gives: `P ≤ H`, `C_G(P) ≤ H ≤ N_G(P)`, and non-conjugate `p`-parts, for every maximal ideal containing `p`.

**Adversarial table.** Notation: `r = (123)`, `t = (12)`, `α² + α + 1 = 0` in `𝔽₄`, `e₀ = 1 + r + r²`, `e₁ = r + r²`.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| H01 | `complete_blockIdempotents_unique` | `𝔽₃[C₂]`; `G = 1` | `e₊ = 2 + 2t`: `e₊² = 8 + 8t = e₊`; families `(e₊, e₋)`, `(e₋, e₊)` matched by the swap; `{1}` vs `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; `ℤ₂[C₂]`; `ℚ[[T]][C₂]` | `(1+r+r²)/3 ↦ e₀`, `(2−r−r²)/3 ↦ e₁` (as `1/3 ≡ 1`, `2/3 ≡ 0`); only `1 ↦ 1`; `(1±t)/2 ↦ (1±t)/2` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` | `S₃` at `2`, `3`; `G = 1`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` | Pass | none |
| H04 | `span_decompositionRows_eq_top` | `S₃` at `3`; `C₂` at `2`; `ι` empty; `κ` empty | rows `(1,0), (0,1), (1,1)` span `ℤ²`; `(1), (1)` span `ℤ`; `ℤ⁰ = ⊤`; `hexh` fails on the trivial module | Pass | none |
| H05 | `cartanMatrix_eq_transpose_mul_decomposition` | `S₃` at `3`, `2`; control `C₄/ℤ₂` | `[P₁ : 1] = 2`, `[P₁ : sgn] = 1`: `[[2,1],[1,2]]` both sides; `diag(2,1)`; `1 + 1 + 4 = 6 ≠ 4` | Pass | none |
| H06 | `exists_blockIdempotent_iff_centralCharacter_congr` | `S₃/ℤ₂[ζ₃]`: (1, sgn), (1, std); `C₃/ℚ(ζ₃)[[T]]`; `G = 1`; control `C₄/ℤ₂` | `3·2 = 6 ∈ m`, `2·0 = 0`: T ↔ T; `3(1 − 0) = 3 ∉ m`: F ↔ F; `1 − ζ₃ ∉ (T)`: F ↔ F; `0`: T ↔ T; control: one block but `1·(0/2 − 1) = −1 ∉ 2ℤ₂` | Pass; `hζ` needed | none |
| H07 | `brauerProjection_mul` | `S₃`, `p = 2`, `P = ⟨t⟩`: `x = y = e₁`; `x = r, y = r²`; over `ℚ`; `P = C₃`, `x = ∑` transpositions | `0 = 0`; `1 ≠ 0`; `x² = 2 + r + r²`, `2 ≠ 0`; `x² = e₀`, `e₀ ≠ 0` | Pass; all three hypotheses needed | none |
| H08 | `isDefectGroup_conj` | `𝔽₂[S₃]`, `e₀`, `e₁` | `Br_⟨t⟩(e₀) = 1`: the three subgroups of order `2`, conjugate; `Br_⟨t⟩(e₁) = 0`: only `1` | Pass | none |
| H09 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `𝔽₂[S₃]` `e₀`; `𝔽₂[C₃]` `e₀`; non-splitting `k` | `aug = 3 = 1`; defect `1` = Sylow `1`; `aug Br_S(e) = aug e` in characteristic `p`, no splitting used | Pass | none |
| H10 | `brauer_first_main` | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1`; no block of defect `D` | `N = D`, `1 ↦ e₀`, `Br_D(e₀)·1 = 1`; identity on `{e₁}`, `e₁e₁ ≠ 0`; both sets empty | Pass | none |
| H11 | `sum_sameBlock_mul_conj_eq_zero` | `S₃`, `p = 2`: `B₀`, `(1, t)`, `(r, t)`; `{std}`, `(1, t)`; `p = 3`, `(1, r)`; control `g = h = t` | `1 − 1 = 0`, `1 − 1 = 0`; `2·0 = 0`; `1 + 1 − 2 = 0`; `1 + 1 = 2 ≠ 0` | Pass | none |
| H12 | `brauer_third_main_local` | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1`, `b = e₁`, `b = e₀` | `Br_P(e₀) = 1`, `aug 1 = 1`; `e₀e₁ = 0`, `aug e₁ = 0`; `e₀ ≠ 0`, `aug = 1` | Pass | none |
| H13 | `mem_pPrimeCore_iff_forall_principalBlock` | `S₃` at `2`, `3`; `A₄` at `2`, `3` | `C₃ = C₃`; `1 = 1`; one block, faithful degree-`3` character, `1 = 1`; `Irr(B₀) = {1, ω, ω̄}`, `V₄ = V₄` | Pass | none |
| D01 | `IsBlockIdempotent` | `𝔽₂[C₂]`; `𝔽₃[C₂]` | only `1`; `1 = e₊ + e₋` not primitive | Pass | none |
| D02 | `pPrimeCore`, `O_π` | `S₃`, `A₄`; `π = ∅`; image law | `C₃, 1`; `1, V₄`; `1`; sign map: `1 ≠ C₂`; `S₃ → S₃ ⧸ C₃`, `π = {3}`: `C₃ ↦ 1 = O_3(C₂)` | Pass | none |
| D03 | `SameBlock` | `A₄`, `M ∋ 3`: (1, ω), (1, χ₃); `S₃`, `M ∋ 2` | `4(ω − 1) ∈ M` as `(1 − ω)² = −3ω`; `3(−1/3 − 1) = −4 ∉ M`; `−6 ∈ M`, `−3 ∉ M` | Pass | none |
| D04 | `brauerProjection`, `IsDefectGroup` | `C₃`, `p = 2`, `e₀`, without `IsPGroup` | wrong model gives `C₃`; the definition gives `1` | Pass | none |
| S0.2 | blocks of `𝔽₂[S₃]`; scalar extension | sum, product; `𝔽₂ ⊆ 𝔽₄` | `e₀ + e₁ = 1`, `e₀e₁ = 0`; `e_α + e_{α²} = (α + α²)(r + r²) = e₁` | Pass | none |
| S0.1 | section count | `S₃`, `p = 3` | `2 + 1 = 3` classes; sections of sizes `4`, `2` | Pass | none |
| S1.1 | splitting system | `e = 3`, `p = 2, 3`; `e = 1`, `p = 5` | `k = 𝔽₄`; `k = 𝔽₃`, `e' = 1`; `2` roots in `ℚ`, `4` in `ℚ₅` | Pass | none |
| S1.2 | lattice independence | `C₂`, `p = 2` | both reductions have class `2` | Pass | none |
| S2.2 | route by `T(A)` | `S₃`, `p = 2`; identity | `(t − 1)² = 0`, codim `T = 2`, codim `[A, A] = 3`; `(s(u − 1))^{p^n} = s^{p^n}(u^{p^n} − 1)` | Pass | none |
| S2.3 | residue splitting | `C₃` over `𝔽₄`, `𝔽₂`, `𝔽₄(T)`; route | dims `1,1,1`; `1,2`; `1,1,1`; `[k₁:k₀]² = [k₁:k₀]` forces `1` | Pass | none |
| S2.4 | `p ∤ |G|` | `C₃` over `ℤ₂` and `ℤ₂[ζ₃]` | `D = I₂`; `D = I₃` | true beyond the locator | R02 |
| S3.1 | pairing | `S₃`, `p = 2`; `C₂`, `P = U = k[C₂]` | `(2 + 4)/6 = 1`, `(4 − 4)/6 = 0`; `2·2/2 = 2 = dim End` | Pass | none |
| S4.1 | `e_χ` | `C₂/ℚ₂` | `e₊e₋ = (1 − t²)/4 = 0`, `e₊ + e₋ = 1` | Pass | none |
| S4.3 | principal block | `𝔽₂[S₃]`; `𝔽₄[C₃]` | `aug e₀ = 1`, `aug e₁ = 0`; `aug e_α = 1 + α² + α = 0` | Pass | none |
| S5.2 | orthogonality | `S₃`, `p = 3` | columns `(1,0,1), (0,1,1), (1,1,−1)`: Gram `[[2,1,0],[1,2,0],[0,0,3]]`, `det Q = −3`, `9 = 3·3` | Pass | none |
| S6.1 | traces | `S₃`, `𝔽₂`, `P = ⟨t⟩` | `Tr_1^P(r) = r + r²`; `Tr_1^P(1) = 0` | Pass | none |
| S6.2 | defect classes | `𝔽₂[C₃]` `e₁`; `𝔽₄[C₃]` `e_α`; `𝔽₂[S₃]` `e₀` | `Z e₁ ≅ 𝔽₄`, no `λ_B`; `α²·α = 1 ≠ 0`, Sylow of `C₃` is `1`; `1·1 ≠ 0`, Sylow of `S₃` has order `2` | Fails without splitting | R01 |
| S7.1 | block induction | `S₅`, `p = 3`, `D = ⟨(123)⟩`, `s = (45)` | `(4,1)` and `(1⁵)` have `3`-core `(1,1)`; `χ_{(4,1)}(s) = 2`, eigenvalues `1,1,1,−1`, both projections nonzero | Pass | none |
| S7.2 | block form | `S₃`, `p = 2` | `d^t = (1, −1, 0)`; block sums `2` and `4`, total `6` | Pass | none |
| S7.3 | third main | `A₄`, `p = 2`, `P = V₄` | `C_G(P) = P`, one block on both sides | Pass | none |
| S8.1 | domination | `S₃`, `p = 3`, `N = C₃` | `1 ↦ e₊ + e₋`, two blocks | Pass | none |
| S8.2 | inflation; covering | `S₃`, `N = C₃` | `⟨1, sgn⟩`: `0` and `(1 − 3 + 2)/6 = 0`; `⟨sgn, sgn⟩`: `1` and `6/6 = 1`; orbit sums `e₀`, `e₁` | Pass | none |

**Headlines.** The README's end theorems (`README.md:12–23`): eleven are stated, with the uniqueness of the block decomposition and the multiplicativity of the Brauer map also stated on the five definitions. The Brauer-character basis, the orthogonality of generalized decomposition numbers and the second main theorem are named in the module docstring as not statable, each for want of Brauer characters, which neither pin defines and which another roadmap owns.

## Not verifiable

- Navarro (`navarro`), Theorem 6.10: settled as uncertified, cited by locator. The statement was checked by computation (row H13) and by its route, not against the text.
- Serre (`serre`), Part III, §15.2 and §16.1, Theorem 33: settled as uncertified, cited by locator at §2.4.
- The extractions of Sambale Theorem 1.14 (sambale line 470) and Martínez Corollary 2.4 lose the complex-conjugation bar. The README's conjugate form was confirmed by computation (row S5.2 and `C₃`: `3` with the bar, `0` without).
- Ownership against open pull requests covers the 439 heads in the index of 2026-11-11T03:47:36Z.

## Source issues

- **Error** in webb at §9.4, printed p. 148 (webb line 6229–6232): the source says that a primitive `m`-th root of unity in `F`, `m` the exponent, gives one in `k`; it should say only the `p′`-part of `m` survives reduction; affects nothing.
- **Misprint** in webb at the remark after Theorem 9.2.7, printed p. 144 (webb line 6057–6060): the source says `𝔽_p(ζ)` with `ζ` a primitive `m`-th root of unity is a splitting field; it should take `ζ` of order the `p′`-part of `m`; affects nothing.
- **Gap** in webb at Corollary 9.5.6, printed p. 160 (webb line 6712–6713): the source states `C = DᵀD` for every splitting `p`-modular system, though Theorem 9.5.4 behind it assumes `R` complete; it should assume completeness or pass to the completion; affects nothing.
