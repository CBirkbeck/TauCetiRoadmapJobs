# Review of ModularCharactersAndBlocks (pull request #1775 at ab56c2d)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

Full review of `ab56c2d`. Three P3 findings, none blocking. R01: the new reciprocity headline is stated below the generality of the source it cites. R02: the family-index ownership sentence is still wrong (carried from the previous review). R03: one locator in §1.1 points at a page that does not contain the statement.

## R01 (P3) — Brauer reciprocity is stated below the generality of Webb's theorem

**Location:** `README.md:630–639`: “let `O` be a complete discrete valuation ring with `CharZero O` whose fraction field `K` contains a primitive `e`-th root of unity … Then `TauCeti.cartanMatrix P S …` equals `Dᵀ D`” and the Check at `:648`, “The root-of-unity hypothesis is needed”.

**Claim:** the root-of-unity hypothesis is the generality of `C = Dᵀ D`.

**Witness:** Webb's Theorem 9.5.4 and Corollary 9.5.6 assume only that `K` and `k` are splitting fields (`webb` 6228–6229, 6670–6671, 6712). `S₃` over `ℤ₂`: `ℚ₂` and `𝔽₂` split `S₃`, `ℚ₂` has no primitive 6th root, and `Dᵀ D = diag(2, 1) = C`.

The hypothesis is the one the previous review prescribed; it is sufficient, and the `C₄` control shows that some splitting hypothesis is needed, but it is not the source's. §2.2 and §7.1 already register their splitting-field forms; §3.1 does not.

**Repair:** keep the headline and its Lean statement, and register the general form in §3.1.
1. After the bullet `cartanMatrix_eq_transpose_mul_decomposition` add: “The same identity, with the same `D` and `C`, holds for every complete discrete valuation ring `O` with `CharZero O` whose fraction field `K` and residue field `k` are both splitting fields for `G` (Webb, Theorem 9.5.4 and Corollary 9.5.6, pp. 159–160, whose hypothesis this is): the proof uses the splitting only through `End_{K[G]}(T) = K` and `End_{k[G]}(S) = k` in `dim_K Hom_{K[G]}(K ⊗ P̂_S, T) = dim_k Hom_{k[G]}(P_S, T₀/mT₀)`. The root-of-unity hypothesis of the headline implies it (CharacterTheory §4.5 for `K`, §2.3 for `k`).”
2. Reword the Check at `:648` from “The root-of-unity hypothesis is needed” to “A splitting hypothesis is needed”, and add the Check: “`S₃` over `O = ℤ₂`: `ℚ₂` and `𝔽₂` split `S₃`, but `ℚ₂` contains no primitive sixth root of unity (`X² + X + 1` is irreducible modulo `2`); `D = [[1,0],[1,0],[0,1]]` and `Dᵀ D = diag(2, 1) = C`. The root-of-unity hypothesis is sufficient, not necessary.”

**Tested:**
- `S₃`, `O = ℤ₂`: trivial and sign reduce to the trivial module, the standard lattice to the 2-dimensional simple; `Dᵀ D = diag(1 + 1, 1) = diag(2, 1)`. `𝔽₂[S₃]` has `P₁` of dimension 2 with `[P₁ : 1] = 2` and the projective simple of dimension 2; `2 + 2·2 = 6`.
- The control stays excluded: `C₄` over `ℤ₂`, where `ℚ₂` does not split `C₄`, gives `Dᵀ D = 1 + 1 + 4 = 6 ≠ 4`. `Q₈` over `ℤ₂` gives `1 + 1 + 1 + 1 + 16 = 20 ≠ 8`, and over `ℤ₂[i]` it gives `4 + 4 = 8 = C`.

## R02 (P3) — The family index still names this roadmap the owner of Brauer characters

Re-raised: H01 (the previous review's R05; the passage is unchanged at this head)

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** this roadmap owns the Brauer character.

**Witness:** the folder imports the Brauer character, its projective pairing and the independence of the simple Brauer characters from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (`README.md:93–102`); that section's *Needs* says “Modular characters and their projective pairing are owned here”.

**Why it stands:** the index is one of this pull request's own files and this pull request already rewrites the sentence (24 changed lines), so the edit is part of the pull request whoever makes it. Merged as it is, the index and the folder name two owners for one object.

**Repair:** replace the sentence with: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes all three, takes the Brauer character and its projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and the decomposition map over finite extensions of `ℚ_p` containing the `|G|`-th roots of unity from ArithmeticGaloisDuality §R02.4.4, and owns the Brauer-character basis theorem, the decomposition map of an arbitrary `p`-modular system, decomposition matrices, Brauer reciprocity and blocks with defect.”

**Tested:** “all three” are named in the preceding sentences of the bullet (CharacterTheory, GrothendieckEulerForms, ModularInduction) and cited in the folder (`README.md:72–80`). Each owned item is a target of the folder (§§2.2, 2.4, 3.1, Layers 4–7), and each imported item is at the cited section of its open head.

## R03 (P3) — The root bijection of §1.1 is not at the cited page

**Location:** `README.md:335–336`: “reduction is a bijection from the `e'`-th roots of unity of `O` onto those of `k`, multiplicative and compatible with powers (Webb, §9.4, p. 148).”

**Claim:** Webb, §9.4, p. 148 states the bijection of roots of unity.

**Witness:** p. 148 (`webb` 6228–6234) only defines splitting systems and says that `R` and `k` contain the roots. The isomorphism `μ_F → μ_k` for the prime-to-`p` roots is Lemma 10.1.1, p. 170 (`webb` 7143–7158).

**Repair:** change the locator to “(Webb, §9.4, p. 148, for the splitting system; Lemma 10.1.1, p. 170, for the bijection of roots of unity)”.

**Tested:** Lemma 10.1.1 takes `a` the l.c.m. of the orders of the `p`-regular elements, which is `e'`; its part 2 is a group isomorphism, hence multiplicative and compatible with powers. GL2AutomorphicRepresentationsAndTransfer §R17.5.11 cites the same lemma for the root lifting.

## Previous findings

- **R01 (reciprocity and integral surjectivity absent): repaired.** `Suggested.lean:103` and `:139` state `span_decompositionRows_eq_top` and `cartanMatrix_eq_transpose_mul_decomposition`; `README.md:564` and `:630` name them; the docstring's first bullet is now the Brauer-character basis alone (`Suggested.lean:29–32`); the description says “twelve headline theorems”. Both elaborate. R01 above concerns the generality of the hypothesis, not the presence of the statement.
- **R02 (§2.2 below the source's generality): repaired.** `README.md:471–477`: “Over every splitting field `k` of characteristic `p` for `G` the count holds, and the Brauer characters … form the same basis”, with the `S₃` over `𝔽₂` Check at `:485–489`.
- **R03 (the count has no route): repaired.** `README.md:453–470` gives the route through `T(A)` with Webb's Lemmas 9.3.1–9.3.2, Proposition 9.3.3 and Lemma 9.3.5 and its own *Needs*; every step was read at `webb` 6093–6183.
- **R04 (index conflict, no order): repaired.** The description now says “Whichever of the two merges second is rebased on the other and keeps both changes”.
- **R05 (index ownership sentence): not repaired.** The index is unchanged; carried as R02.

## Verified sound

**Head, scope and diff.**
- The worktree is clean at `ab56c2d`. `git diff --stat origin/main...HEAD` lists the folder's `README.md` (+1159), `Suggested.lean` (+312) and the family index (24 lines); the brief's command for other changes prints nothing.

**Gate.**
- The worker's gate at this head: every counter `0`, `build=0`, `OK`.
- The brief's command, run here: `depcheck=1` (“NOT IN ORDER: ModularCharactersAndBlocks”, the default order does not list the roadmap) and `outside-folder=1` (the family index, which the brief makes this pull request's own). Every other counter is `0`. Neither is a finding: the candidate order lists the roadmap at line 102, after GL2AutomorphicRepresentationsAndTransfer (101) and ArithmeticGaloisDuality (62).

**Dependency check** (the brief's command), complete output:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean`: exit 0, 12 warnings, all “declaration uses `sorry`”, one per theorem.
- A scratch copy with `#check @name` for all 17 declarations elaborates. Each elaborated type was compared with its README statement:
  - the two new theorems carry `[CharZero O]`, the completeness instance, `hζ`, `[Fintype ι]` (and `[Fintype κ]` for reciprocity), the `Module.Free` and `Module.Finite` lattice binders and the exhaustion hypothesis `hexh` explicitly;
  - reciprocity adds `hirr` and `hnoniso`, which surjectivity rightly omits (`README.md:572–574`);
  - `IsDefectGroup` and `brauerProjection` keep `[Finite G]` and `[Field k]`; `IsAlgClosed k` sits only on the count, the first main theorem and the local third main theorem, as §§2.2, 7.1 and 7.3 say.
  - No binder is lost; nothing was changed.

**Padding probe.** Each of the 12 theorems with `first | rfl | infer_instance | simp | decide | aesop` fails (errors at probe lines 60, 75, 91, 123, 178, 214, 232, 242, 258, 273, 288, 306). No declaration restates a definition, mirrors a Check or computes a value. Neither new theorem is in the pinned libraries: `TauCeti.cartanMatrix_apply` gives only the entries `[P j : S i]`, and no pinned declaration relates `jordanHolderMultiplicity` of a reduced lattice to it.

**Headline inventory** (`README.md:12–22`).
- Stated (12): the count; integral surjectivity; reciprocity; uniqueness of the block decomposition; the block bijection between `O[G]` and `k[G]`; multiplicativity of the Brauer map; conjugacy of defect groups; Sylow defect groups of the principal block; the first main theorem; block-section orthogonality; the local third main theorem; the kernel theorem.
- Named as not statable, rightly: the Brauer-character basis (no Brauer character at either pin); generalized decomposition numbers, their orthogonality and the second main theorem (Brauer characters of centralizers); the agreement of `SameBlock` with the blocks of `O[G]` (`TauCeti.Representation.primitiveCentralIdempotent` needs an algebraically closed field).
- The count is stated in Lean over an algebraically closed field; the splitting-field form is registered separately at `README.md:471–477`, with its own hypotheses.

**Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`).
- `TauCeti.jordanHolderMultiplicity`: `RingTheory/CompositionSeries/Multiplicity.lean:217`. It needs `[IsNoetherian R M] [IsArtinian R M]`, which the Lean statements supply as binders, and it does not require `S` simple.
- `Representation.baseChange` (root namespace): `RepresentationTheory/BaseChange.lean:124`. It acts on `A ⊗[R] V` for any `R`-algebra `A`, so it forms both `K ⊗_O L` and `k ⊗_O L`.
- `TauCeti.cartanMatrix` and `cartanMatrix_apply`: `GrothendieckGroup/CartanMatrix.lean:138, 148`; the entry is `[P j : S i]`, as `README.md:134–135` says, and the section variables at `:59–67` are exactly the seven arguments the Lean statement passes.
- `TauCeti.IsExhaustiveSimpleFamily`: `GrothendieckGroup/SimpleBasis.lean:190`. `TauCeti.IsExhaustiveIndecomposableProjectiveFamily`: `GrothendieckGroup/ProjectiveBasis.lean:179`.
- `TauCeti.IsIndecomposableModule`: `RingTheory/KrullSchmidt/Indecomposable.lean:90`. `TauCeti.finiteProjectiveModules`: `Algebra/Category/ModuleCat/CartanMap/Basic.lean:129`.
- `TauCeti.IsProjectiveCover`: `Algebra/Module/ProjectiveCover/Basic.lean:106`. `TauCeti.exists_isProjectiveCover_of_finite`: `ProjectiveCover/Existence.lean:195`.
- `TauCeti.pFreePart`, `pPart`, `commute_pFreePart_pPart`, `pPart_mul_pFreePart`, `pFreePart_conj`, `pPart_conj`, `orderOf_pPart`: `GroupTheory/OrderOfElement/PPart.lean:69, 167, 185, 196, 205, 212, 240`. These are the *Needs* of the count's route.
- Mathlib: `Representation.IsIrreducible` (`RepresentationTheory/Irreducible.lean:29`, a simple order of subrepresentations, so the zero representation is excluded), `Representation.Equiv` (`RepresentationTheory/Intertwining.lean:320`), `Representation.asModule` (`RepresentationTheory/Basic.lean:142`), `IsPrimitiveRoot` (`RingTheory/RootsOfUnity/PrimitiveRoots.lean:63`), `Monoid.exponent` (`GroupTheory/Exponent.lean:72`).
- No defect group, block idempotent, Brauer character, Brauer pair or `p'`-core exists at either pin (grep by object).

**Cross-roadmap citations resolved (9).**
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and §R17.5.12 at its open head: the Brauer character for a fixed `τ`, value `n` at `1`, conjugacy invariance, additivity, the lattice comparison, recognition, the pairing with projective covers in its proof and “owned here” are all there.
- ArithmeticGaloisDuality §R02.4.4, *Surjectivity of the decomposition map*, at its open head: finite extensions of `ℚ_p`, well-defined by reduction of lattices, rational surjectivity only.
- On main (`5fc1aa8`): SemisimpleAlgebras Layers 0–2; QuiverRepresentations Layer 3; GrothendieckEulerForms Layers 2 and 4; ModularInduction Layers 0, 1 and 3; CharacterTheory §§3.5, 4.3 and 4.5 (§4.5 is Brauer's splitting field `ℚ(ζ_e)`, as the new Conventions sentence uses it); InductionRestriction Layer 6.

**Ownership.**
- `roadmaps grep` by object (defect group, `p'`-core, decomposition matrix or map, the main theorems, Brauer pair, block idempotent, reciprocity) over the heads of the index of 2026-11-10T23:08:12Z: no second owner beyond the two imported suppliers. The other hits are unrelated uses of the words (Mennicke defect groups, Brauer pairing on varieties, Hecke-algebra idempotents).
- LocalFiniteGroupTheory also defines a `p'`-core; the brief forbids it as a supplier, so §8.2 owns `O_{p'}`.
- `overlaps.md`: no other pull request changes the folder, no cited id is dropped, no id is defined only by a revision.
- GlaubermanZStar's open head cites this roadmap by labels “M1 … M8” that this README does not use; that is for the consumer to align, and §8.4 and *Downstream consumers* list the same 10 section references.

**Seeded sample: 15 targets, every locator read at the text.** Printed page = PDF page − 7 for Webb and − 8 for Martínez; Sambale's printed page is the PDF page.
- §0.1: Webb Lemma 9.3.4, p. 146 (`webb` 6147–6150).
- §1.1: Webb §9.4, p. 148 (`webb` 6228–6234) for the splitting system; the root bijection is elsewhere (R03).
- §1.2: Webb Thm 9.4.8, p. 153 (`webb` 6434–6437), for any `p`-modular system; Martínez Thm 1.7 and Lemma 1.8, p. 4 (`martinez` 189–203).
- §2.1: Webb Prop 10.1.3, pp. 170–171 (`webb` 7179–7192): tensor, dual, additivity, lift. Martínez Lemmas 1.1–1.2, pp. 2–3 (`martinez` 130–157): dual and restriction. The induction formula, p. 37 (`martinez` 1385–1388), matches `README.md:422`.
- §2.3: Webb Thm 9.2.7, p. 144 (`webb` 6054–6056); Ch. 9 Ex. 4 and 8(a), pp. 165–166 (`webb` 6974–6976, 7004–7008).
- §3.1: Martínez Prop 1.12, p. 5, and Cor 1.13, p. 6 (`martinez` 264, 300); Webb Thm 9.5.4, p. 159 (`webb` 6670–6676); Prop 9.5.1, p. 157 (`webb` 6623); Cor 9.5.6, p. 160 (`webb` 6712); Prop 10.2.1, p. 174 (`webb` 7383–7386); Cor 10.3.3, p. 183 (`webb` 7720).
- §4.1: the native formula at `CharacterTable/CentralIdempotent.lean:301`.
- §4.3: Sambale Def 1.2, p. 14 (`sambale` 335–337).
- §5.2: Sambale Thm 1.14, p. 16 (`sambale` 465–474).
- §6.3: Craven Lemmas 2.7 and 2.9 and Thms 2.11–2.12, pp. 23–25 (`craven` 823, 856, 891, 897).
- §7.1: Sambale Def 1.10, Prop 1.11 and Thm 1.12, p. 16 (`sambale` 424–444); Martínez Thm 4.5 and Cor 4.6, p. 26 (`martinez` 1004–1059); Thm 4.10, p. 27 (`martinez` 1085–1088); Webb Thm 12.6.4, p. 250 (`webb` 10524–10527), stated for `k` splitting `G` and all its subgroups, which is the hypothesis of the new bullet at `README.md:938–940`.
- §7.3: Sambale Thm 1.15, p. 17 (`sambale` 478–480); Martínez Cor 5.9, p. 35 (`martinez` 1370–1371).
- §8.1: Martínez Thm 1.14, p. 6 (`martinez` 316–317); Cor 8.2 and Prop 8.4, p. 51 (`martinez` 1895–1908); Thm 8.5, p. 52 (`martinez` 1928–1934); Sambale Thm 1.23, p. 18 (`sambale` 542–545).
- §8.2: Martínez Thm 8.5(iii), p. 52; Def 7.3 and Problem 7.4, p. 44 (`martinez` 1638–1648); Thm 7.7, p. 45 (`martinez` 1710–1715); Sambale Thm 1.24, p. 18 (`sambale` 547–549).
- §8.4: 10 of 10 section references agree with *Downstream consumers*.
- New locators of this head, outside the sample: Webb §9.2 and Prop 9.2.5, pp. 142–143 (`webb` 5942–5993); Lemmas 9.3.1–9.3.2 and Prop 9.3.3, pp. 145–146 (`webb` 6093–6143); Lemma 9.3.5 and Thm 9.3.6 with its proof, p. 147 (`webb` 6161–6183); the remark after Cor 10.2.4, p. 178 (`webb` 7520–7527), which asserts the surjectivity of `d` and says its proof, through Brauer's induction theorem, is omitted. §2.4 supplies that route with its own inputs.

**Adversarial table.** Notation: `r = (123)`, `t = (12)`, `α² + α + 1 = 0` in `𝔽₄`; in `𝔽₂[S₃]`, `e₀ = 1 + r + r²`, `e₁ = r + r²`.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| H01 | `complete_blockIdempotents_unique` | `𝔽₃[C₂]`; `G = 1` | `(2 + 2t)² = 8 + 8t = 2 + 2t`, `(2 + 2t)(2 − 2t) = 4 − 4 = 0`, sum `4 = 1`; `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(2 − r − r²)/3 ↦ r + r²`, `(1 + r + r²)/3 ↦ e₀`; `(1 ± t)/2 ∉ ℤ₂[C₂]`, only `1 ↦ 1` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` | `S₃` at 2, 3; `C_p`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` | Pass | none |
| H04 | `span_decompositionRows_eq_top` | `S₃` at 3; `C₂` at 2; `Q₈`, `O = ℤ₂[i]`; `G = 1`; `ι = ∅` | rows `(1,0), (0,1), (1,1)` span `ℤ²`; `(1), (1)` span `ℤ`; `(1)×4, (2)` span `ℤ`; `(1)`; `ℤ⁰ = ⊤` | Pass | none |
| H05 | `cartanMatrix_eq_transpose_mul_decomposition` | `S₃` at 3 and 2; `C₄`, `O = ℤ₂[i]`; `Q₈`, `O = ℤ₂[i]`; controls `C₄`, `Q₈` over `ℤ₂`; `G = 1` | `[[2,1],[1,2]]`; `diag(2,1)`; `4 = 4`; `8 = 8`; `6 ≠ 4`, `20 ≠ 8` (no `hζ`); `1 = 1` | Pass; hypothesis narrower than the source | R01 |
| H06 | `brauerProjection_mul` | `S₃`, `p = 2`, `P = ⟨t⟩`, `x = y = e₁`; same over `ℚ` | `x² = r² + 2 + r = e₁`, `Br(x²) = 0 = 0²`; `Br(2 + r + r²) = 2 ≠ 0` | Pass; control fails as the Check says | none |
| H07 | `IsDefectGroup`, `isDefectGroup_conj` | `𝔽₂[S₃]`; `𝔽₂[C₃]`, `Q = C₃` not a `2`-group | `Br_{⟨t⟩}(e₀) = 1`, three conjugate maxima; `Br_{⟨t⟩}(e₁) = 0`, defect `1`; defect `1` only because `Q` must be a `p`-group | Pass | none |
| H08 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `𝔽₂[S₃]`; `G = 1` | `aug e₀ = 3 = 1` → `⟨t⟩` and conjugates; `aug e₁ = 2 = 0` excluded; `⊥ = ⊥` | Pass | none |
| H09 | `brauer_first_main` | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1`; `G = C_p`, `D = 1` | `N = D`, block `1 ↔ e₀`, `Br_D(e₀)·1 = 1 ≠ 0`, `e₁` not in the image; identity on defect-zero blocks; both sides empty (`Br_{C_p}(1) = 1`) | Pass | none |
| H10 | `sum_sameBlock_mul_conj_eq_zero` | `S₃` at 2: `(g,h) = (1,t)`, `(r,t)`; at 3: `(1,r)`, `(t,r)`; control `g = h = 1` | `1 − 1 = 0`, `2·0 = 0`; `1 − 1 = 0`, `(−1)·0 = 0`; `1 + 1 − 2 = 0`; `1 − 1 + 0 = 0`; control `2 ≠ 0` | Pass | none |
| H11 | `brauer_third_main_local` | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1` | `Br_P(e₀)·1 = 1 ≠ 0` ↔ `aug 1 = 1`; `e₀e₁ = 0` ↔ `aug e₁ = 0` | Pass | none |
| H12 | `mem_pPrimeCore_iff_forall_principalBlock` | `S₃` at 2, 3; `G = 1` | `ker 1 ∩ ker sgn = C₃ = O_{2'}`; `std` faithful, `1 = O_{3'}`; `1 = 1` | Pass | none |
| D01 | `SameBlock` | `S₃`, `M ∋ 2`; `M ∋ 3` | `3(−1 − 1) = −6 ∈ M`, `3(0 − 1) = −3 ∉ M`; `−3` and `2(−1/2 − 1) = −3`, both in `M` | Pass | none |
| D02 | `pPrimeCore` | `S₃`; wrong model `O_p`; infinite `G` | `O_{2'} = C₃`, `O_{3'} = 1`; `O_p` gives `1`, `C₃`; `Nat.card = 0` is not coprime to `p`, so infinite `N` is excluded | Pass | none |
| S01 | §0.1 sections | `S₃` at 2; `C₆` | sections `3 + 3`, classes `3 = 2 + 1`; `g³ · g⁴ = g⁷ = g` | Pass | none |
| S02 | §1.1 system | `e = 3`, `p = 2`; `e = 1`, `p = 5` | `X² + X + 1` irreducible mod 2, residue field `𝔽₄`; `ℚ` has 2 roots of unity, `ℚ₅` has 4 | Pass | locator (R03) |
| S03 | §1.2 lattices | `C₂`, `p = 2`; `G = 1` | `O[C₂]` and `O(1+t) ⊕ O(1−t)` both reduce to class `2`; `O`, `m` both to class `1` | Pass | none |
| S04 | §2.1 induction formula | `Ind_1^{S₃}(1)`, `p = 2` | `(6, 0) = 2·(1, 1) + 2·(2, −1)` | Pass | none |
| S05 | §2.2 route | `S₃`, `p = 2` | `(t − 1)² = 2 − 2t = 0`, so `t ≡ 1`; `codim T = 2`, `codim [A, A] = 3` | Pass | none |
| S06 | §2.3 splitting | `C₃` over `𝔽₄`, `𝔽₂`, `𝔽₂(T)` | three 1-dimensional simples; dimensions `1, 2`; dimensions `1, 2` | Pass | none |
| S07 | §3.1 pairing | `S₃`, `p = 2`; `C₂`, `P = U = k[C₂]` | `(2·1 + 2·2·1)/6 = 1`, `(2·2 + 2·2·(−1))/6 = 0`; `2·2/2 = 2 = dim End` | Pass | none |
| S08 | §4.1 idempotents | `C₂/ℚ₂` | `e₊e₋ = (1 − t²)/4 = 0`, `e₊ + e₋ = 1` | Pass | none |
| S09 | §4.3 principal block | `𝔽₂[S₃]`; `𝔽₄[C₃]` | `aug e₀ = 1`, `aug e₁ = 0`; `aug(1 + α²r + αr²) = 1 + α² + α = 0` | Pass | none |
| S10 | §5.2 orthogonality | `S₃` at 3; `C₃`, `u = v = r` | columns `(1,0,1), (0,1,1), (1,1,−1)`: Gram `[[2,1,0],[1,2,0],[0,0,3]]`, `det Q = −3`, `9 = 3·3`; `1 + 1 + 1 = 3`, without conjugation `0` | Pass | none |
| S11 | §6.3 Brauer pairs | `S₃`, `p = 2`, `Q = ⟨t⟩` | `Br_Q(e₀)·1 = 1` (a `B₀`-pair); `Br_Q(e₁) = 0` (not) | Pass | none |
| S12 | §7.1 over splitting fields | `S₃` over `𝔽₄` (`e' = 3`), `D = ⟨t⟩`; `D = 1` | `N = D`, block `1 ↔ e₀`, `Br_D(e₀) = 1`, `e₁` not in the image, as over `𝔽̄₂`; `e₁ ↔ e₁` | Pass | none |
| S13 | §7.3 third main theorem | `A₄`, `p = 2`, `P = V₄` | `N(V₄) = A₄`, `C(V₄) = V₄`, single block ↔ itself | Pass | none |
| S14 | §8.1 domination | `S₃`, `p = 3`, `N = C₃` | block `1 ↦ 1 = e₊ + e₋` in `𝔽₃[C₂]`: two blocks, one dominating block | Pass | none |
| S15 | §8.2 covering | `S₃`, `N = C₃`, `k ⊇ 𝔽₄` | `e_α + e_{α²} = 2 + (α² + α)(r + r²) = r + r²` | Pass | none |
| S16 | §8.4 interfaces | §8.4 vs *Downstream consumers* | `10 = 10` section references | Pass | none |
| F01 | R01 general form | `S₃`, `O = ℤ₂` | `ℚ₂ ∌ ζ₆`; `Dᵀ D = diag(2, 1) = C` | Holds outside the stated hypothesis | add (R01) |
| F02 | R02 index sentence | index `:132–133` vs folder `:93–102` | “owns Brauer characters” vs “imported from §R17.5.11” | Mismatch | re-raised (R02) |
| F03 | R03 locator | `webb` 6228–6234 vs 7143–7158 | no bijection on p. 148; `μ_F ≅ μ_k` in Lemma 10.1.1, p. 170 | Wrong page | repoint (R03) |

## Not verifiable

- **Navarro (`navarro`), Theorem 6.10** (the kernel theorem, `README.md:1086`, `Suggested.lean:305`): settled as uncertified and cited by locator only; nothing was fetched. The statement was checked by computation instead (rows H12, D02).
- **Serre (`serre`)**: settled as uncertified; listed in References and cited at no claim, so nothing depends on it.
- **Ownership against open pull requests** rests on `roadmaps grep` and `overlaps.md` over the heads in the index of 2026-11-10T23:08:12Z; pull requests that index does not carry were not searched.

## Source issues

- **Gap** in webb at Proposition 9.2.5, printed pp. 142–143 (`webb` 5989–5993): the source proves that an absolutely simple module has endomorphism ring the ground field only over a perfect field and refers elsewhere for the rest; it should cover every field, as the statement does; affects the proof.
- **Misprint** in webb at §9.4, printed p. 148 (`webb` 6229–6231): the source says the residue field then contains a primitive `m`-th root of unity, `m` the exponent of `G`; it should be the `p′`-part of `m`; affects nothing.
- **Misprint** in webb at the remark after Theorem 9.2.7, printed p. 144 (`webb` 6057–6060): the source says `𝔽_p(ζ)` with `ζ` a primitive `m`-th root splits `G`; no such root exists when `p` divides `m`, so it should be the `p′`-part; affects nothing.
- **Misprint** in webb at Example 12.5.6, printed p. 246 (`webb` 10391–10392): the source says `e1` has defect group `1` right after giving it Sylow defect; it should be `e2`, the defect-zero block; affects nothing.
- **Misprint** in martinez at Theorem 4.10, Claim 2, printed p. 28 (`martinez` 1105–1106): the source says the defect groups of `b` lie in those of `b`; it should be those of `b^G`; affects the proof.
- **Misprint** in martinez at Theorem 5.8, printed p. 34 (`martinez` 1356): the source writes `e^G` in the conclusion; it should be `c^G`; affects a stated result.
