# Review of ModularCharactersAndBlocks (pull request #1775 at 2da28cc)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

Incremental re-review of the 69 lines of `README.md` changed since `82701b2`. `Suggested.lean` and the family index are byte-identical to that head. Of the four previous findings, three are repaired. The family-index finding is not, and is carried as R03. The rewritten §6.2, §7.1 and §7.3 passages raise two new findings.

## R01 (P1) — The vertex comparison of §6.2 uses a notion that nothing owns

**Location.** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:986–989`: “Prove, for every field `k` of characteristic `p` and every block idempotent `e`, that this agrees with the definitions by vertices of `e k[G]` as a `k[G × G]`-module (Webb, Corollary 12.3.2, p. 235)”. The new *Needs:* line is at `:996`: “§§0.2, 0.3, 6.1; Mathlib `Sylow`; …”.

**Claim.** To state this target you need relative projectivity and the vertex of an indecomposable module: a minimal subgroup `H` such that the module is a summand of a module induced from `H`. To prove it you also need Green's theorem that vertices are `p`-subgroups, unique up to conjugacy. Nothing provides these: not the README, not a supplier on its *Needs:* line, not the pins. §6.1 has relative traces on `k[G]^P`, not relative projectivity of modules. Webb's corollary itself rests on Webb §11.3 and §11.6. The clause is older than this head, but this head rewrote the sentence and added the *Needs:* line. That line followed the previous report's proposal, which also missed vertices.

**Witness.** `roadmaps grep` over main and the 439 open heads for relative projectivity, Higman's criterion and vertices of indecomposable modules finds no owner for group algebras; StablePeriodicCurved's “relatively projective” is about differential modules. Neither pin declares relative projectivity.

**Repair.** Choose one:
- (a) Cut the clause. Replace “that this agrees with the definitions by vertices of `e k[G]` as a `k[G × G]`-module (Webb, Corollary 12.3.2, p. 235) and by minimality of `P`” with “that this agrees with the definition by minimality of `P`”. The trace comparison that remains needs only §6.1.
- (b) Own the notion. Add to §6.1: “A `k[G]`-module is **projective relative to** `H ≤ G` when it is a direct summand of a module induced from `H`. A **vertex** of an indecomposable module is a minimal such `H`. Prove Higman's criterion: `U` is projective relative to `H` exactly when `1_U ∈ Tr_H^G(End_{k[H]}(U))` (Webb, §11.3, p. 194, and Proposition 11.3.4, pp. 198–199). Prove that vertices are `p`-subgroups unique up to conjugacy (Webb, Theorem 11.6.1 and Proposition 11.6.2, pp. 209–211).” Then add Mathlib `Representation.ind` (`RepresentationTheory/Induced.lean:77`) to §6.1's *Needs:* line.

Tested on `𝔽₂[S₃]`. `e₀ k[G]` has vertex `δ(⟨(12)⟩)`. `e₁ k[G] = M₂(𝔽₂)` is a projective `k[G × G]`-module, so its vertex is `δ(1)`. Both agree with the Brauer-map defect groups `⟨(12)⟩` and `1`.

## R02 (P3) — No route from the sources' algebraically closed fields to splitting fields

**Location.** `README.md:1084–1088`: “Let `k` be a field of characteristic `p` that splits `G` and all its subgroups … (Sambale, Definition 1.10 and Proposition 1.11, p. 16; Martínez, p. 25)”. Also `:1153–1155`: “Over a field `k` of characteristic `p` that splits `G` and all its subgroups (§7.1): … (Sambale, Theorem 1.15, p. 17; Martínez, Corollary 5.9, p. 35 …)”. And `:993–996` for defect classes.

**Claim.** This head states block induction, the formula for `Br_P(e_B)`, the defect-class theorem and the third main theorem over splitting fields. Every source it cites for them works over an algebraically closed field. §7.1 notes this for Martínez only. §7.3 notes it for neither source. No passage from `k̄` down to `k` is given anywhere. The statements are true, but the step is missing. It is the same class as the previous report's R02, which this head repaired by adding a route. The step needs blocks of `k[H]` to stay blocks of `k̄[H]`, and §0.2 notes that this fails in general (`README.md:329–331`).

**Witness.** Sambale fixes `F` algebraically closed (sambale line 316). Martínez's `F` is the algebraic closure of `𝔽_p` (martinez line 132), with Theorem 4.5, Corollary 4.6 and Corollary 5.9 at martinez lines 1004, 1055 and 1370. Scalar extension `𝔽₂ ⊆ 𝔽₄` splits the block `r + r²` of `𝔽₂[C₃]` into `e_α + e_{α²}`.

**Repair.** In §6.2, after the definition of defect classes, add: “If `k` splits a subgroup `H`, then `Z(k[H]) e_b` is local with residue field `k`, so `k̄ ⊗_k Z(k[H]) e_b` is local with residue field `k̄`. Hence every block of `k[H]` remains a block of `k̄[H]`. The central characters, defect classes, `Br_P(e_b)`, defect groups and principal blocks are unchanged by scalar extension, so the statements over splitting fields in §§6.2, 7.1 and 7.3 follow from the algebraically closed case.” Add SemisimpleAlgebras Layer 2 to §6.2's *Needs:* line; it gives the residue-field claim through `k[H]/rad = ∏ M_n(k)`. In §7.1 and §7.3, mark the Sambale and Martínez locators “over an algebraically closed field”.

Tested:
- `𝔽₄ ⊆ 𝔽̄₂`, which splits `S₃`, `C₃`, `C₂` and `1`: the blocks `e₀, e₁` of `𝔽₄[S₃]`, `e_1, e_α, e_{α²}` of `𝔽₄[C₃]` and `1` of `𝔽₄[C₂]` are unchanged.
- `𝔽₂ ⊆ 𝔽₄`: `𝔽₂` splits `S₃` but not `C₃`, and the block `r + r²` splits. This shows why the hypothesis is “and all its subgroups”.

## R03 (P3) — The family index still names this roadmap as the owner of Brauer characters

Re-raised: H03. The repair report agrees the finding is correct. It leaves it open because the repair job may edit only the folder. That reason says who can make the edit, not that the sentence is right. The brief counts the files directly in `TauCetiRoadmap/RepresentationTheory/` as this pull request's own. The pull request wrote this sentence, so the author has to change it on the branch. The worker's push gate does not catch it; a bare gate rerun lists this file under `outside-folder`.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim.** The folder imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (folder `README.md:97–106`). “Both” follows three roadmaps that the sentence names. The dependency bullet at `:78–81` leaves out SemisimpleAlgebras Layers 0–2, which §§2.2–2.3 consume.

**Witness.** GL2AutomorphicRepresentationsAndTransfer at its open head, README line 2938, ends the §R17.5.11 *Needs* with: “Modular characters and their projective pairing are owned here.”

**Repair.** Replace the sentence with: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes these foundations, imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns the Brauer-character basis theorem, decomposition matrices, Brauer reciprocity and blocks with defect.” Add SemisimpleAlgebras Layers 0–2 to the bullet at `:78–81`. Tested: the imported items match §R17.5.11 at its head. The owned items match folder §§2.2, 2.4, 3.1 and Layers 4–7.

## Previous findings

- R01 — repaired: `README.md:986–996` splits the sentence. Vertices and trace minimality are claimed “for every field `k` of characteristic `p`”. Defect classes are claimed over a field that splits `G`, with `λ_B` and defect classes defined. Two Checks are added at `:1030–1038`.
- R02 — repaired: `README.md:647–657`, “When `p ∤ |G|`, for every `p`-modular system …”. It cites Webb Theorem 9.4.11 “for a splitting system” and gives the route without splitting. The Check at `:670–674` adds the `ℤ_(7)` negative control.
- R03 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md:133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect”. Carried as R03.
- R04 — repaired: *Needs:* lines now close §0.2 (`:310–312`), §4.3 (`:876`), §6.1 (`:954–955`), §6.2 (`:996`), §7.1 (`:1091–1092`), §7.3 (`:1156`) and §8.1 (`:1189`). The vertex gap in §6.2's line is R01.

## Verified sound

**Gate and build.**
- The worker's gate at this head passes every check, including the targeted build.
- My rerun with the candidate order and `--build` gives `depcheck=0` and `build=0`. It reports `outside-folder=1` for `TauCetiRoadmap/RepresentationTheory/README.md`. The brief names that file as this pull request's own, so the hit is not a finding in itself; its content is R03.
- A bare rerun on the configured order adds `depcheck: NOT IN ORDER: ModularCharactersAndBlocks`. That order does not list this roadmap; the candidate order does, at line 102.
- Dependency check with the candidate order and `--movable`: `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. ArithmeticGaloisDuality is at line 62, GL2AutomorphicRepresentationsAndTransfer at 101, this roadmap at 102 and OddOrderTheorem at 401.
- `lake env lean` on `Suggested.lean` exits 0 with 13 warnings, all `declaration uses sorry`, and no errors.

**Suggested.lean.**
- The file is byte-identical to `82701b2`. The previous report's `#check @name` comparison of all 18 declarations and its one-tactic probe (none closed) still apply.
- The worker's signature report finds no lost binder.
- No changed README passage names a Lean declaration of this roadmap, so README and Lean agree as before.

**Changed passages checked.**
- §2.4 route, step by step. Averaging makes every lattice projective when `|G| ∈ O^×`. §1.3 gives existence of lifts; Nakayama gives their uniqueness. `L ∩ V'` is a direct summand because `L/(L ∩ V')` is a torsion-free quotient, hence a lattice, hence projective. Lattices in one simple `V` are isomorphic because their reductions have the same class in the semisimple `k[G]`.
- §6.2 central characters. `J(Z(B)) = Z(B) ∩ J(B)`, so `Z(B)/J(Z(B))` embeds in `Z(B/J(B)) = kⁿ` and is `k`. `λ_B` is the unique algebra homomorphism with `λ_B(e_B) = 1`. A defect class exists because `1 = λ_B(e_B) = ∑_C a_B(C) λ_B(K_C)`.
- *Needs:* names at the pins: `TauCeti.IsPrimitiveIdempotent` (`RingTheory/Idempotents/Primitive/Basic.lean:89`), `TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` (`…/Primitive/Decomposition.lean:223`), Mathlib `CompleteOrthogonalIdempotents` (`RingTheory/Idempotents.lean:130`), `MonoidAlgebra.lift` (`Algebra/MonoidAlgebra/Basic.lean:231`), `Subalgebra.center` (`Algebra/Algebra/Subalgebra/Basic.lean:906`), `Subgroup.centralizer` (`GroupTheory/Subgroup/Centralizer.lean:30`), `Subgroup.normalizer` (`Algebra/Group/Subgroup/Defs.lean:663`), `IsPGroup` (`GroupTheory/PGroup.lean:45`), `Sylow` (`GroupTheory/Sylow.lean:54`). The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.
- Cross-roadmap: GL2AutomorphicRepresentationsAndTransfer §R17.5.11 resolves at its open head (README line 2927, *Needs* at 2938). The overlap report lists no dropped id, no revision-only id and no other pull request changing this folder. The resolver finds no unresolved name or citation. The changed passages introduce no new object (central characters over `k` and defect classes are block-theory notions), so the previous ownership search stands.

**Seeded sample.** Printed pages follow the page markers: Webb PDF − 7, Martínez PDF − 8, Sambale PDF − 0.

| Target | Locators checked (source line) | Result |
| --- | --- | --- |
| 2.4 (changed) | Webb T9.4.11 p.155 (webb 6518: splitting system, `p ∤ |G|`, D the identity); remark after it on `R`-forms (6551–6554) | supports “for a splitting system”; the route covers the rest |
| 4.3 (*Needs:* only) | Sambale D1.2 p.14 (sambale 335) | supports |
| 6.2 (changed, outside the sample) | Webb C12.3.2 p.235 (webb 9906, “or a field of characteristic `p`”), T12.4.5 p.241 (10173); Martínez D3.2 p.17 (martinez 703, with T3.1 at 700 for “any defect class”), T4.3 p.24 (948) | supports; R01 for vertices |
| 7.1 (changed) | Sambale D1.10, P1.11 p.16 (sambale 424, 438); Martínez p.25 (968–981), T4.5 and C4.6 p.26 (1004, 1055) | supports over an algebraically closed field: R02 |
| 7.3 (changed) | Sambale T1.15 p.17 (sambale 478, both directions); Martínez C5.9 p.35 (martinez 1370, one direction) | supports over an algebraically closed field: R02 |
| 8.1 (*Needs:* only) | carried from the previous report | supports |
| outside the changed passages | Webb L9.3.4 p.146 (6147), P9.4.3 p.149 (6276), P9.4.5 p.151 (6334), P10.1.3 p.170 (7179); Martínez L1.2 p.3 (150), D2.1 p.9 (365), T2.2 p.10 (375), T2.11–2.12 p.15 (648, 663); Sambale D1.4 p.14 (350), D1.6 p.15 (367), D1.9 p.15 (399), T1.23 p.18 (542) | supports (spot check of §§0.1, 1.3, 2.1, 4.2, 5.1, 6.2, 8.1) |

**Adversarial table.** Notation: `r = (123)`, `t = (12)`, `α² + α + 1 = 0` in `𝔽₄`, `e₀ = 1 + r + r²`, `e₁ = r + r²`, `e_α = 1 + α² r + α r²`. Class sums of `S₃` are `K_1 = 1`, `K_r = r + r²` and `K_t`, the sum of the transpositions. Rows N01–N09 cover the changed statements, with values computed for this review. The rows after them are carried from the previous report (PRREVIEW r24, at `82701b2`) for statements this head leaves untouched, with that report's values.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| N01 | §2.4 `p ∤ |G|` bijection, every system | `C₃/(ℚ₂, ℤ₂, 𝔽₂)`; `C₃/ℤ₂[ζ₃]`; `C₂ × C₂/ℤ₃`; `G = 1`; control `ℤ_(7)`, `C₃` | dims `(1, 2) ↦ (1, 2)`, `D = I₂`; `D = I₃`; `D = I₄`; `D = (1)`; control: `2` simples over `ℚ`, `3` over `𝔽₇` | Pass; completeness needed | none |
| N02 | §2.4 route step: `L` indecomposable ⇔ `K ⊗ L` simple | `ℤ₂[C₃]`; control `ℤ₂[C₂]` | `ℤ₂ε₀ ⊕ ℤ₂[C₃]ε₁`, with `ε₀ = (1+r+r²)/3`, `ε₁ = (2−r−r²)/3`: ranks `1, 2`, generic fibres `ℚ₂`, `ℚ₂(ζ₃)`; control: indecomposable lattice, `ℚ₂ ⊕ ℚ₂`; `L/(L ∩ ℚ₂(1+t))` is the sign lattice with trivial, non-projective reduction | Pass; `p ∤ |G|` needed | none |
| N03 | §6.2 `λ_B` exists over a splitting `k` | `𝔽₂[C₃] e₁`; `𝔽₄[C₃] e_α`; `𝔽₂[S₃] e₀`, `e₁` | `Z e₁ ≅ 𝔽₄`, no map to `𝔽₂`; residue field `𝔽₄ = k`; `λ_{B₀} = (1, 0, 1)` on `(K_1, K_r, K_t)`; `λ_{B₁} = (1, 1, 0)` | true with splitting, false without | none |
| N04 | §6.2 defect classes give the defect groups | `𝔽₄[C₃] e_α`; `𝔽₂[S₃] e₀`, `e₁` | `{r}`: `α²·α = 1`, Sylow of `C₃` is `1`; `e₀`: `{1}` gives `1·1`, Sylow of order `2`; `K_r` gives `1·0 = 0`; `e₁`: `K_r` gives `1·λ(e₁) = 1`, Sylow `1`, the defect group | Pass | none |
| N05 | §6.2 trace minimality, every `k` | `𝔽₂[C₃] e₁`; `𝔽₂[S₃]` | `Tr_1^{C₃}(e₁) = 3e₁ = e₁`, `P = 1`; `Tr_1^{S₃}(k[S₃]) = 𝔽₂ K_r` (since `Tr_1^G(g) = |C_G(g)| K_g`), so `e₁ ∈`, `e₀ ∉`; `Tr_{⟨t⟩}^{S₃}(e₀) = 3e₀ = e₀` | Pass | none |
| N06 | §6.2 vertex comparison | `𝔽₂[S₃]` | vertices `δ(⟨t⟩)` and `δ(1)` match the defect groups, but no layer, supplier or pin defines vertices | unowned | R01 |
| N07 | §7.1 `b^G` over a splitting `k` | `k = 𝔽₄`, `H = C₃ ≤ S₃`: `b = e_α`, `b = e_1`; `k = 𝔽₂` | `λ_b^G = (1, α + α², 0) = (1, 1, 0) = λ_{B₁}`, so `b^G` is the defect-zero block, as in §8.2's covering Check; `e_1`: `(1, 0, 0)`, but `K_t² = 1 + K_r` gives `1 ≠ 0²`, so `b^G` is undefined (`C_G(1) ≰ C₃`); over `𝔽₂`, `e₁` of `𝔽₂[C₃]` has no `λ_b` | Pass; “all subgroups” needed | none |
| N08 | §7.3 over a splitting `k` | `𝔽₄`, `H = D = ⟨t⟩`; control `H = C₃`, `D = 1` | `λ_b^G = (1, 0, 1) = λ_{B₀}`: principal on both sides; control: `C_G(1) = S₃ ≰ C₃`, and the principal block of `C₃` has no `b^G` | Pass | none |
| N09 | descent from `k̄` to `k` | `𝔽₄ ⊆ 𝔽̄₂`; `𝔽₂ ⊆ 𝔽₄` | blocks of `𝔽₄[S₃]`, `𝔽₄[C₃]`, `𝔽₄[C₂]` unchanged; `e₁ = e_α + e_{α²}` | true, not stated | R02 |
| H01 | `complete_blockIdempotents_unique` (r24) | `𝔽₃[C₂]`; `G = 1` | `e₊ = 2 + 2t`, `e₊² = e₊`; swap matches the two families | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` (r24) | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(1+r+r²)/3 ↦ e₀`, `(2−r−r²)/3 ↦ e₁`; only `1 ↦ 1` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` (r24) | `S₃` at `2`, `3`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `2 ≠ 3` | Pass | none |
| H04 | `span_decompositionRows_eq_top` (r24) | `S₃` at `3`; `C₂` at `2` | rows `(1,0), (0,1), (1,1)` span `ℤ²`; `(1), (1)` span `ℤ` | Pass | none |
| H05 | `cartanMatrix_eq_transpose_mul_decomposition` (r24) | `S₃` at `3`, `2`; control `C₄/ℤ₂` | `[[2,1],[1,2]]` both sides; `diag(2,1)`; `6 ≠ 4` | Pass | none |
| H06 | `exists_blockIdempotent_iff_centralCharacter_congr` (r24) | `S₃/ℤ₂[ζ₃]`; control `C₄/ℤ₂` | `6 ∈ m`: T ↔ T; `3 ∉ m`: F ↔ F; control `−1 ∉ 2ℤ₂` with one block | Pass | none |
| H07 | `brauerProjection_mul` (r24) | `S₃`, `p = 2`, `P = ⟨t⟩`; `x = r, y = r²`; over `ℚ` | `0 = 0`; `1 ≠ 0`; `2 ≠ 0` | Pass; hypotheses needed | none |
| H08 | `isDefectGroup_conj` (r24) | `𝔽₂[S₃]` `e₀`, `e₁` | the three subgroups of order `2`; only `1` | Pass | none |
| H09 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (r24) | `𝔽₂[S₃]` `e₀`; `𝔽₂[C₃]` `e₀` | `aug = 1`; Sylow `1` | Pass | none |
| H10 | `brauer_first_main` (r24) | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1` | `1 ↦ e₀`; identity on `{e₁}` | Pass | none |
| H11 | `sum_sameBlock_mul_conj_eq_zero` (r24) | `S₃`, `p = 2`, `(1, t)`; control `g = h = t` | `1 − 1 = 0`; `1 + 1 = 2 ≠ 0` | Pass | none |
| H12 | `brauer_third_main_local` (r24) | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1` | `aug 1 = 1`; `e₀e₁ = 0` | Pass | none |
| H13 | `mem_pPrimeCore_iff_forall_principalBlock` (r24) | `S₃` at `2`, `3`; `A₄` at `3` | `C₃ = C₃`; `1 = 1`; `V₄ = V₄` | Pass | none |
| D01–D04 | `IsBlockIdempotent`, `pPrimeCore`, `SameBlock`, `IsDefectGroup` (r24) | `𝔽₃[C₂]`; `S₃`, `A₄`; `A₄`, `M ∋ 3`; `C₃` at `2` | `1` not primitive; `C₃, 1` and `1, V₄`; `−4 ∉ M`; defect group `1`, not `C₃` | Pass | none |
| S0–S8 | the untouched prose targets of §§0.1–5.2, 6.1, 7.2, 8.1–8.2 (r24) | as in rows S0.1–S8.2 there | e.g. §5.2 `S₃` at `3`: Gram `[[2,1,0],[1,2,0],[0,0,3]]`, `det Q = −3`; §8.2 `⟨sgn, sgn⟩ = 6/6 = 1` | Pass | none |

**Headlines.** Unchanged from the previous report. Eleven end theorems and two definition-level statements are stated. The Brauer-character basis, the orthogonality of generalized decomposition numbers and the second main theorem are named in the module docstring as not statable, for want of Brauer characters at the pins.

**Remark on untouched text** (no change requested). §7.3's “exactly when” rests on Sambale Theorem 1.15. Martínez Corollary 5.9 gives only the direction from `b^G = B₀(G)` to `b = B₀(H)`.

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, and Serre (`serre`), Part III: settled as uncertified and cited by locator. Neither is in a changed passage.
- Ownership against open pull requests covers the 439 heads in the index of 2026-11-11T04:34:32Z.

## Source issues

- none
