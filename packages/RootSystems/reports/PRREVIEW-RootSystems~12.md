# Review of RootSystems (pull request #1196 at 3e78a6d)
Folder: `TauCetiRoadmap/RepresentationTheory/RootSystems/`

**Verdict:** accepted

This is a full review of head `3e78a6d`, 220 changed lines after `976a24c`, the head the previous review read. Every passage was re-read. The previous review's one blocking finding and six of its seven notes are repaired; one note is unrepaired and restated below, one is a matter for the human approver and is restated, and two new notes are added. No P1 or P2 finding remains. The gate passes with every counter zero, the dependency check reports no problem, `Suggested.lean` elaborates with eight `sorry` warnings and nothing else, and no declaration closes under the one-tactic probe.

## R01 (P3) — Two chamber declarations are still cited in the wrong namespace

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:158` ("`RootPairing.dominantChamber` in `TauCeti/LinearAlgebra/RootSystem/Chamber.lean`"), `README.md:161` ("`RootPairing.openDominantChamber`"), and `README.md:678` ("the native `RootPairing.dominantChamber`").

**Claim:** At the pin both declarations live in namespace `TauCeti`: `TauCeti/LinearAlgebra/RootSystem/Chamber.lean:94` opens `namespace TauCeti`, and lines 137 and 140 define `dominantChamber` and `openDominantChamber` there. The three citations name constants that do not exist.

**Witness:** A scratch file importing `TauCeti.LinearAlgebra.RootSystem.Chamber`: `#check @RootPairing.dominantChamber` and `#check @RootPairing.openDominantChamber` fail with "Unknown constant"; `#check @TauCeti.dominantChamber` and `#check @TauCeti.openDominantChamber` elaborate.

**Repair:** Replace the three occurrences by `TauCeti.dominantChamber` and `TauCeti.openDominantChamber`. Restated from the previous review's R04, which this head did not touch; the other ninety cited supplier names resolve (list under Verified sound).

## R02 (P3) — Two open pull requests on this folder declare the same fully qualified name

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean:119–125`, `weylGroup_equiv_perm_of_typeA`.

**Claim:** Pull request #1278 (same author, head `f33895a`) also replaces this folder with a different layer structure, and its `Suggested.lean` declares `TauCetiRoadmap.RepresentationTheory.RootSystems.weylGroup_equiv_perm_of_typeA` (its line 121) and states the presentation completeness and the length formula under other names (`weylCoxeterHom_injective`, line 82; `presentation_length_eq_inversions`, line 90). Only one head can become the roadmap.

**Witness:** `roadmaps list` shows #1196 at `3e78a6d` and #1278 at `f33895a` both on `RootSystems`.

**Repair:** The author says which pull request is the roadmap's head and closes or rebases the other. A review cannot settle ownership between two heads of one folder; recorded for the human approver, not blocking. Restated from the previous review's R06.

## R03 (P3) — Change narrative in Downstream consumers, and a layer title narrower than its contents

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:662–673` ("formerly cited as a sixth layer", "formerly a second layer", "formerly fifth and sixth layers", "formerly a based factorization section", "formerly third and fourth layers"); `README.md:590` ("## Layer 5: the type A Weyl group") against `README.md:617` ("### 5.2 Type G₂").

**Claim:** "Formerly" describes the roadmap's own revision history, which the house style keeps out of the README; the introductory sentence at lines 652–654 already says, timelessly, that a consumer's older layer number maps to the native declaration or section named in the bullet. The layer title names type A only, but the layer also carries the G₂ worked example of §5.2.

**Witness:** `README.md:652–654`: "where a consumer names an earlier layer numbering of the root-systems roadmap, the object it consumes is the native declaration or the section named here."

**Repair:** Delete the five "formerly …" clauses, or replace each by what the consumer writes today ("cited by CFSGStatement as Layer 6"); rename Layer 5 "concrete Weyl groups" or move §5.2 under the layer's Examples. No mathematics changes.

## R04 (P3) — Unused finiteness hypothesis in the metric headline

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean:96`, `[Fintype ι]`; `README.md:435` ("for a finite irreducible spanning real root pairing").

**Claim:** The §3.2 route (set `c = C(α,α)/B(α,α)`, apply `RootPairing.InvariantForm.two_mul_apply_root` to both forms, let irreducibility make the radical of `C − cB` the whole module) uses no finiteness: `two_mul_apply_root` (`TauCeti/LinearAlgebra/RootSystem/InvariantForm/Basic.lean:40`) holds for every root pairing, and `RootPairing.IsIrreducible` carries no finiteness.

**Witness:** The values of the README's own Check: in A₁ with `B = xy`, `C = 3xy`, `c = 3/1 = 3`, `D = C − 3B = 0`; the computation is the same for an infinite index type.

**Repair:** None required; a note. If kept for readability, the README sentence may say that finiteness is a standing convention rather than an input of this theorem.

## Previous findings

- R01 (P2, companion file) — repaired: `InvariantMetricTargets.lean` is deleted; the folder holds `README.md` and `Suggested.lean` only (`stray-files=0`).
- R02 (G₂ headline pinned) — repaired: `weylGroup_equiv_dihedral_of_isG2` is gone from `Suggested.lean`; `README.md:177–183` cites `TauCeti.nonempty_dihedralGroup_mulEquiv_weylGroup_of_hasCartanType_G2` and `TauCeti.card_weylGroup_of_hasCartanType_G2`; §5.2 (`README.md:619–628`) is consumption plus a worked example with two Checks. Both names resolve at the pin (`Weyl/Dihedral.lean:138, 158`) with the hypotheses the README states (finite, characteristic-zero domain, crystallographic, reduced, a base of Cartan type G₂).
- R03 (two-length theorem pinned) — repaired: `squared_lengths_two_values` is gone; `README.md:104–110` cites `apply_eq_or` and `exists_apply_eq_or` with their exact hypotheses (`Mathlib/LinearAlgebra/RootSystem/Finite/Lemmas.lean:43, 76, 91, 275, 290, 294, 308`: finite, characteristic-zero domain, crystallographic, reduced, irreducible; `Nonempty ι` for the second). §3.2 keeps only the identification of `r` per Dynkin type.
- R04 (chamber namespace) — not repaired: current R01.
- R05 (§1.2 pinned length theorem) — repaired: `README.md:136–141` cites `TauCeti.wordProd`, `TauCeti.exists_wordProd_eq_and_length_eq_ncard_inversions` and `TauCeti.isLeast_ncard_inversions` (`Inversions/Length.lean:82–85, 142, 148`, exactly the hypotheses of `length_eq_inversions`); §1.2 (`README.md:257–270`) is the transfer through the marking, and "reduced words are precisely minimal expressions" is no longer a target.
- R06 (two pull requests) — unchanged: current R02.
- R07 (consumers cite removed layers) — repaired: `README.md:650–684` names, per consumer, the native declaration or section replacing each old layer; RootSystemsPartII is listed. Every consumer named exists on main with the cited layer: LieHighestWeight Layers 2, 6, 10 (`RepresentationTheory/LieHighestWeight/README.md:370, 773, 1623`), ClassicalGroups Layer 3 (`RepresentationTheory/ClassicalGroups/README.md:237`), CFSGStatement L0–L1 (`CFSGStatement/README.md:298, 489`), LieGroups Layers 6 and 8 (`RepresentationTheory/LieGroups/README.md:383, 428`), ReductiveGroups §9A.1a-L (`ReductiveGroups/README.md:1230`), ReductiveGroupsPartII (`README.md:371–375`, "layer 3 … layer 4" of RootSystems), TopologicalKTheory (`README.md:264`, "Layer 3 Coxeter exchange/deletion"), ConvexityToric (`SymplecticGeometry/ConvexityToric/README.md:37, 125`, "RootSystems Layer4"), RootSystemsPartII at its open head (`README.md:7, 113, 199, 289`).
- R08 (unused `1 ≤ n`) — repaired: the hypothesis is removed (`Suggested.lean:124`), and `README.md:596–598` says validity of Aₙ is a convention of the enumeration, with the n = 0 case computed.

## Verified sound

### Head, gate, build, signatures and padding probes

Head `3e78a6d8a9cfcc154297c10294fb7642cc466c96`; pins Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…` (confirmed by `rev-parse` in the worktree's package directory). The diff against `origin/main` outside the roadmap folder and the family index is empty; the family index files are unchanged.

Gate (worker's run at this head, data): every counter zero including `build=0`, OK. Dependency check, rerun with the `--movable` form the brief gives:

```text
depcheck: 204 roadmaps, 1659 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. RootSystems is on main; its README has no `From TauCetiRoadmap.<X>` section and no `*Needs:*` line names a roadmap, so no upward edge can arise. Its only Lean consumer on main, `CFSGStatement/Suggested.lean`, imports this module and was built by the gate's targeted build.

`lake env lean` on `Suggested.lean`: exit 0, exactly eight `sorry` warnings (lines 41, 48, 67, 75, 86, 96, 107, 119). A scratch file holding the whole of `Suggested.lean` plus `#check @name` for the nine declarations of the roadmap's own and the three `DynkinType` exports elaborated; each elaborated type was compared with its README statement and agrees in generality: `basedAut` keeps only `[CommRing R]` and the module instances, as its type needs; `weyl_based_complement` is over ℝ as §2.1 says; `existsUnique_basedAut_of_cartanMatrix`, `existsUnique_greatest_positive_root`, `weylGroup_equiv_perm_of_typeA` and the two Layer 1 theorems carry characteristic-zero domain, finite, spanning, crystallographic and reduced explicitly, the greatest-root theorem adds irreducible; `full_datum_complement` carries both finite-free lattice hypotheses and no spanning, as §2.3 says; `invariantMetric_unique_scale` carries irreducibility and both positive-definiteness hypotheses.

One-tactic probes on a scratch copy with `by first | rfl | infer_instance | (simp; done) | exact?`: none of the eight theorems closed (eight "could not close the goal"). `basedAut` has a real body on native carriers (`MulAction.stabilizer`, `Subgroup.comap`, `RootPairing.Equiv.indexHom`). Nothing in the file is padding; the two theorems that were one-term consequences of pinned results at the previous head are gone.

### The adversarial table (computed values)

Matrix convention throughout: `Cᵢⱼ = ⟨αᵢ, αⱼ∨⟩`, coefficient columns, `sᵢ` subtracts `ΣⱼCⱼᵢcⱼ` from entry `i`. Root sets, counts, greatest vectors, Weyl-group orders and inversion sets were recomputed from the Cartan matrices by closing the simple vectors under the coefficient reflections, independently of the README and of the previous review.

| Statement | Instances tried | Values computed on the two sides | Result |
|---|---|---|---|
| Conventions: B₂ column formula | C=`!![2,-2;-1,2]`, c=(1,0), short node 2 | entry 2: 0 − C₁₂·1 = 2, giving (1,2), and s₂(1,2) = (1,0); with C in place of Cᵀ: 0 − C₂₁·1 = 1, giving (1,1) | Pass; the witness distinguishes the transposes |
| Conventions: A₂ inversions of s₁s₂ (left action, s₂ first) | α₁, α₂, α₁+α₂ | inversions of s₁s₂ = {(0,1), (1,1)}; of s₂s₁ = {(1,0), (1,1)} | Pass; convention pinned |
| Conventions: coweight direction | σ=(123), permutation matrix P | weight map e₁↦e₂; the contravariant `coweightEquiv : N₂ ≃ₗ N` is the transpose, e₁↦e₃; its inverse e₁↦e₂; ⟨e₂,e₂⟩=1, ⟨e₂,e₃⟩=0 | Pass (`Hom.lean`) |
| Supplied conventions: finite type | [2]; empty; affine A₁ `!![2,-2;-2,2]` | q(1)=2>0; empty vacuous; affine value at (1,1) is 2−2−2+2=0 for every symmetrizer | Pass (`FiniteType/Basic.lean:121`) |
| Supplied conventions: validity | A₀, A₁, B₁, B₂, C₂, D₃ | `Valid` is 1≤n, 2≤n, 3≤n, 4≤n (`DynkinType.lean:156–161`): false, true, false, true, false, false | Pass |
| Supplied conventions: pinned matrices | Mathlib `B 2`, `C 4`, `G₂`, `E`; Tau Ceti `cartanMatrix` | `B n` has entry (n−2,n−1) = −2 (`Cartan/Basic.lean:128–134`) so B₂ = `!![2,-2;-1,2]`; `C n` has entry (n−1,n−2) = −2 (lines 137–143); `G₂ = !![2,-3;-1,2]` (line 114) and Tau Ceti uses `G₂ᵀ = !![2,-1;-3,2]` (`DynkinType.lean:231`); `E` has edges 0–2, 1–3, 2–3, 3–4, … (line 55–61); Coxeter entry of product 2 is 4, of product 3 is 6 | Pass; README lines 56–57 and 211–213 agree |
| Supplied conventions: length tables | `rootLength` (`RootLength.lean:123–128`) against ratios `Cⱼᵢ/Cᵢⱼ` from the matrices | computed relative squared lengths: B₂ (2,1), B₃ (2,2,1), C₄ (1,1,1,2), G₂ (1,3), F₄ (2,2,1,1), A₃ (1,1,1); pinned: B last 1 others 2, C last 2 others 1, G₂ (1,3), F₄ first two 2, ADE all 1 | Pass; "root-row Cartan convention" (line 186) holds |
| Supplied conventions: native A₁ datum | `typeASimplyConnectedRootDatum 1` | roots `e_a − e_b` in fundamental-weight coordinates, coroots in simple-coroot coordinates (`SimplyConnectedRootDatum/A.lean:303–313`): root (2), coroot (1), dot pairing 2; fundamental weight (1) pairs to 1 | Pass (README line 214–217) |
| Supplied conventions: H-model lowering fails | H=`!![2,-3;-3,2]`, norm-2 vectors as roots | (1,1) has height 2; s₁(1,1)=(2,1), s₂(1,1)=(1,2), heights 3; iterates of s₁s₂ on (1,0): (8,3), (55,21), (377,144), each of norm 2a²−6ab+2b² = 2 | Pass; finiteness needed |
| §1.1 `exists_marked_weylCoxeterSystem` | rank 0, A₁, A₂, A₃, B₂, G₂, D₄ | Weyl orders 1, 2, 6, 24, 8, 12, 192 on both sides; A₂ relations s₁²=s₂²=(s₁s₂)³=1 with Coxeter entry 3 | Pass; marking excludes the generator swap (α₁ ↦ α₁+α₂ instead of −α₁) |
| §1.2 `length_eq_inversions` | all six A₂ elements; s₁s₁ | words [], [1], [2], [1,2], [2,1], [1,2,1] have inversion counts 0,1,1,2,2,3 = least word lengths; s₁s₁ has 0 inversions and length 0 | Pass; `isLeast_ncard_inversions` is the pinned input |
| §1.2 longest element, Poincaré | empty, A₁, A₂, G₂ | longest lengths 0, 1, 3, 6 = positive counts 0, 1, 3, 6; coefficients by length A₁ (1,1), A₂ (1,2,2,1), G₂ (1,2,2,2,2,2,1) | Pass |
| §2.1 `basedAut` membership | A₁; A₂; empty | A₁: Aut={±1}, −1 sends the index of +1 to that of −1, excluded, stabilizer order 1; A₂: Cartan-preserving permutations 2 (identity, reversal), order 2; empty: Aut=1 | Pass; real subgroup body |
| §2.1 `weyl_based_complement` | A₁, A₂, empty | |Aut| = 2, 12, 1 = |W|·|based| = 2·1, 6·2, 1·1; a Weyl element preserving the positive system has 0 inversions and is 1 | Pass |
| §2.1 normality witness | A₂, δ reversal | δs₁δ⁻¹ = s₂; both send α₁ ↦ α₁+α₂, α₂ ↦ −α₂ | Pass (SGA 3 XXI 6.7.1) |
| §2.2 `existsUnique_basedAut_of_cartanMatrix` | empty, A₁, A₂, B₂, D₄ | Cartan-preserving permutations computed: 1, 1, 2, 1, 6 (D₄: the six permutations fixing node 2); the B₂ swap changes (−2,−1) to (−1,−2) and is excluded; uniqueness: a based g is determined on the simple-root basis of M (spanning) and the coweight side by the perfect pairing | Pass |
| §2.2 lattice stabilizer | D₄, discriminant (ℤ/2)² | S₃ permutes the 3 nonzero classes transitively; the stabilizer of one class has order 6/3 = 2 | Pass |
| §2.3 `full_datum_complement` | root-free rank 0, 1, 2; simply connected A₁ | W=1; Aut = 1, {±1}, GL₂(ℤ) (shear `!![1,1;0,1]` of infinite order); every g = 1·g; A₁: root coordinate 2 spans 2ℤ ⊊ ℤ, so spanning is correctly absent | Pass; no finiteness of Aut claimed |
| §2.3 central gluing | GL₂: root (1,−1), central (1,1) | determinant 1·1 − (−1)·1 = 2: index 2, no integral splitting | Pass (Milne C.43) |
| §3.1 components | A₂, A₁², empty | 1 block of dimension 2; 2 blocks of dimension 1; 0 blocks; (1,1) is a root of A₂ (positives (1,0),(0,1),(1,1)) and not of A₁² (positives (1,0),(0,1)) | Pass (Milne C.23, C.55) |
| §3.2 `invariantMetric_unique_scale` | A₁, B=xy, C=3xy | c = 3; c=2 fails at (1,1) (3≠2); c=0 fails positivity; zero space excluded by `Nontrivial M` in `IsIrreducible` (`Irreducible.lean:147–149`) | Pass; R04 notes finiteness unused |
| §3.2 derivation without reducedness | roots ±1, ±2, coroots ±2, ±1; α=2 | C(α,α)/B(α,α) = 12/4 = 3; D(x,2) = 6x − 6x = 0 | Pass |
| §3.2 r per type | A₃, B₂, B₃, C₄, F₄, G₂; A₁³ diag(1,2,5) | squared-length sets {1}, {1,2}, {1,2}, {1,2}, {1,2}, {1,3} from the ratio table above, r = 1, 2, 2, 2, 2, 3; A₁³ has {1,2,5}, three values, not irreducible | Pass as stated |
| §4.1 coefficient reflection | B₂ c=(1,0); A=2I−Cᵀ | s₂(1,0)=(1,2), s₂(1,2)=(1,0); ΣⱼA₂ⱼcⱼ − c₂ = 2 − 0 = 2 | Pass (SGA 3 XXI (1)–(3)) |
| §4.1 orbit union | A₁; B₂ | orbit of 1 is {±1}, positive part {1}; B₂ from both simples: 8 roots; the orbit of the long simple root alone: the 4 long roots | Pass |
| §4.2 `existsUnique_greatest_positive_root` | A₁, A₂, B₂, G₂, D₄, F₄ | greatest (1), (1,1), (1,2), (3,2), (1,2,1,1), (2,3,4,2), each dominating every positive coordinatewise | Pass |
| §4.2 negative controls | A₁²; empty | {(1,0),(0,1)} has no greatest member (computed: empty list); the empty system has no positive root; both fail `IsIrreducible` | Pass |
| §4.2 positive weighting | A₂ weights (2,1) | values 1, 2, 3 on (0,1), (1,0), (1,1); unique maximum 3 at (1,1) | Pass |
| §4.2 simply-laced unit ascent | A₂, A₇, D₄, E₆, E₇, E₈ | non-greatest positives lacking a height +1 simple reflection: 0 of 2, 27, 11, 35, 62, 119 | Pass (computed) |
| §4.2 non-simply-laced control | B₂ β=(1,1); G₂; C₄ | B₂: s₁β=(0,1) height 1, s₂β=β; β+α₂=(1,2) is a root; failures 2 of 3 in B₂, 2 of 5 in G₂, 4 of 15 in C₄ | Pass; hypothesis needed |
| §4.3 E-family transport | extra node r at chain node 3 | chain (1,2,…,r−1,r) ↦ Bourbaki (1,3,…,r,2): the extra node lands at Bourbaki 2 attached to 4, and Mathlib's `E` joins index 1 to index 3 (Bourbaki 2 to 4) | Pass (`Cartan/Basic.lean:55–61`) |
| §4.3 E counts | E₆, E₇, E₈ | 72/36, 126/63, 240/120 roots/positives; greatest (1,2,3,2,1,2), (2,3,4,3,2,1,2), (2,4,6,5,4,3,2,3); heights 11, 17, 29 | Pass (computed) |
| §4.3 A₇ | A₇ | 56 roots, 28 positives; greatest (1,…,1), height 7 | Pass |
| §4.3 C-family | C₄, C₉, C₁₃; Mathlib `C` | positives 16, 81, 169; greatest (2,…,2,1); the computed C₄ positive set equals the README's sixteen tuples exactly; Cₙ has C₍ₙ,ₙ₋₁₎ = −2 so A₍ₙ₋₁,ₙ₎ = 2, A₍ₙ,ₙ₋₁₎ = 1 | Pass |
| §5.1 `weylGroup_equiv_perm_of_typeA` | A₀, A₁, A₂, A₃; ℤ[1/2] model | |W| = 1, 2, 6, 24 = 1!, 2!, 3!, 4!; n=0: `(A 0).rank = 0`, empty base, M = 0 by spanning, W = 1 ≅ Perm (Fin 1); over ℤ[1/2] roots ±1, coroots ±2, pairing 2, 3R reflection-stable and 1 ∉ 3R | Pass; `1 ≤ n` correctly dropped |
| §5.2 G₂ worked example | G₂ `!![2,-1;-3,2]` | six positives (1,0),(0,1),(1,1),(2,1),(3,1),(3,2), greatest (3,2); s₁s₂ of order 6; |W| = 12; longest length 6; A₂ control: 3 positives, length 3; the transpose has the same Coxeter product 3 and makes the first root long (ratio table) | Pass; consumption of the pinned dihedral theorem |

Characteristic 2 and 3 and the zero ring are excluded by the characteristic-zero domain hypotheses; rank 0 is admitted and tested wherever irreducibility is not assumed; ℝ versus a general domain is explicit in each signature and matches the README sentence that introduces it.

### Pinned declarations opened

| Pinned file and line | What was confirmed |
|---|---|
| Mathlib `LinearAlgebra/RootSystem/Finite/Lemmas.lean:43, 76, 91, 275, 290, 294, 308` | section context `[Finite ι] [CharZero R] [IsCrystallographic] [IsDomain R] [IsReduced] [IsIrreducible]`; `apply_eq_or` (five alternatives, ratios 2 and 3 either way round); `exists_apply_eq_or [Nonempty ι]` |
| Mathlib `RootSystem/CartanMatrix.lean:324–360` | `equivOfCartanMatrixEq` under `[P.IsRootSystem] [IsCrystallographic] [IsReduced]`, `[CharZero R] [IsDomain R] [Finite ι]`, and `[Finite ι₂] [P₂.IsRootSystem] [P₂.IsReduced]` |
| Mathlib `RootSystem/Irreducible.lean:147–153` | `IsIrreducible`: `Nontrivial M`, `Nontrivial N`, invariant submodules ⊥ or ⊤ on both sides |
| Mathlib `RootSystem/RootPositive.lean:50–55` | `InvariantForm`: symmetric, nonzero root self-values, reflection-orthogonal; no positivity |
| Mathlib `LinearAlgebra/Matrix/Cartan/Basic.lean:55, 106, 114, 121, 128, 137` | `E`, `F₄`, `G₂`, `A`, `B`, `C` entries used in the table |
| Tau Ceti `RootSystem/InvariantForm/Basic.lean:34–41` | `two_mul_apply_root (x : M) (j : ι)` for every root pairing: `2·B(x, αⱼ) = ⟨x, αⱼ∨⟩·B(αⱼ, αⱼ)` |
| Tau Ceti `RootSystem/Inversions/Length.lean:82–85, 142, 148` | `exists_wordProd_eq_and_length_eq_ncard_inversions`, `isLeast_ncard_inversions` under finite, characteristic-zero domain, crystallographic, reduced |
| Tau Ceti `RootSystem/SimpleReflections.lean:55` | `wordProd b l` is the product of `weylGroup.ofIdx` over the word |
| Tau Ceti `RootSystem/Coxeter/Presentation.lean:50–58, 66, 79–82` | `weylCoxeterHom`, its generator equation, surjectivity with reducedness; the docstring names injectivity as the open target |
| Tau Ceti `RootSystem/RankTwo.lean:332, 354` | `isG2_of_hasCartanType_G2`; `hasCartanType_G2_of_isG2 [Finite ι] [CharZero R] [IsDomain R] (hG2 : P.IsG2) (b)` |
| Tau Ceti `RootSystem/Weyl/Dihedral.lean:52–55, 138, 158` | G₂ dihedral theorem and order 12 under finite, characteristic-zero domain, crystallographic, reduced, `HasCartanType P b .G2` |
| Tau Ceti `RootSystem/DynkinType.lean:135–147, 156–161, 222–231, 416–417` | `rank` (A n has rank n), `Valid`, `cartanMatrix` (G₂ as `G₂ᵀ`), `HasCartanType` as a relabelling with equal Cartan entries |
| Tau Ceti `RootSystem/RootLength.lean:123–128` | `rootLength` per type (table row above) |
| Tau Ceti `RootSystem/Chamber.lean:94, 137, 140`, `Weyl/Chamber.lean:96, 112` | namespace `TauCeti`; `dominantChamber`, `openDominantChamber`, `openWeylChamber` (R01) |
| Tau Ceti `SimplyConnectedRootDatum/Assembly.lean:79–94`, `A.lean:303–321` | `simplyConnectedRootDatum : RootDatum (Fin t.numRoots) (Fin t.rank → ℤ) (Fin t.rank → ℤ)` by cases; type A roots `e_a − e_b` in fundamental-weight coordinates with the dot pairing |

A scratch `#check` file over 92 cited names (every supplier name of the two contracts, the headline carriers, and the two Layer 5 consumption theorems) resolved every name except the two of R01.

### Ownership and duplication by object

Searched the pinned root-system directories of Mathlib and Tau Ceti for the objects, not only the names: greatest or highest positive roots, subgroup complements of the Weyl group, a Coxeter system on the Weyl group, Weyl groups as symmetric groups, unique scaling of invariant forms, irreducible components. Found at the pin and now cited as suppliers: the G₂ dihedral group, the two-length lemmas, the root-level least-length theorem. Not found at the pin: a `CoxeterSystem` on `P.weylGroup` (Tau Ceti's `BraidRelation.lean:70` and `LongestElement.lean:67` name `weylCoxeterSystem` as a target, and no declaration defines it), the Coxeter-length spelling, the based complement and its unique Cartan-preserving extension, the full-datum complement, the unique positive scale, the greatest root, and type A for general n (Tau Ceti's `DiagramPermutations.lean` has diagram permutations of `Fin t.rank`, not Weyl groups; `Weyl/Dihedral.lean` covers rank two only). Those remain this roadmap's.

Open roadmaps: RootSystemsPartII at its open head declares `stembridge_step`, `fixed_weyl_group`, `general_fold`, `invariant_step`, `ambient_coroot_step` and the like in namespace `TauCetiRoadmap.RootSystemsPartII`; no name collides, and it consumes rather than builds the based complement. Pull request #1278 on the same folder overlaps on one fully qualified name (R02). ReflectionInvariantTheory §§3–4 (`README.md:40, 68`), ReductiveGroups §9A.1a-L, ZigzagPreprojective Layer 0 (`README.md:205`), LieHighestWeight Layers 1–2 and 6 were opened and say what the Scope paragraph attributes to them; the anchors `#layer-2-weights-of-a-module-and-their-integrality` and `#4-crystallographic-weylcoxeter-dictionary` resolve to those headings. The board's package index lists no RootSystems package; ownership against open pull requests was checked through the supplied index and checkouts only.

### Shape, policy and the Lean form

README: title, Summary, Scope and ownership, Conventions with three convention Checks, Exact supplier contracts (From Mathlib, From Tau Ceti, with five Checks of the supplied conventions), How to read the build, Layers 1–5 with numbered prose subsections, `*Needs:*` lines, Examples and Dependencies, Downstream consumers, References. Every definition (based subgroup, lattice-preserving subgroup, component spaces, coefficient reflection) lists its API and at least three Checks that compute a value or give a non-example; every target carries a locator. No LaTeX, no pull-request numbers, no algorithm (the root enumeration is stated as equality of sets, line 515). Every backticked name of the roadmap's own in the README (`exists_marked_weylCoxeterSystem`, `length_eq_inversions`, `basedAut`, `weyl_based_complement`, `existsUnique_basedAut_of_cartanMatrix`, `full_datum_complement`, `invariantMetric_unique_scale`, `existsUnique_greatest_positive_root`, `weylGroup_equiv_perm_of_typeA`, `DynkinType`) is declared in `Suggested.lean`, and every Lean name appears in the README.

`Suggested.lean`: `import Mathlib` plus three existing Tau Ceti modules; one module docstring naming the two headlines that are not statable (the componentwise metric parameterization, lacking the family of irreducible root subspaces; the cylinder-chamber comparison for arbitrary finite-free data, lacking scalar extension beyond the dot-product base change) and recording that the G₂ Weyl group and the two-length theorem are pinned; `theorem` only; no `set_option`, no sorried data, no `#eval`, no `True` placeholder; the `export` lines alias native declarations for the consumer `CFSGStatement/Suggested.lean`.

### Seeded sample and sources

Printed pages recovered from the running heads: Milne's printed page is the PDF page minus 12 (printed 612 begins at milne17 line 25084); the SGA 3 re-edition's printed page is the PDF page plus 62 (printed 99 begins at sga3iii line 1372).

| Sample | Verification |
|---|---|
| 1.1 Completeness of the relations | milne17 line 25096, C.22 p. 612: bases correspond to chambers, W simply transitive on them, W a Coxeter group on the simple reflections, for root systems over a subfield of ℝ. Supports the real case; the domain case rests on the native Cartan comparison, as §1.1 says. |
| 1.2 Length and reduced expressions | Bourbaki VI §1 no. 6 and Björner–Brenti §2.2, Thm 3.3.1: uncertified (below). The computed A₂, G₂ values and the pinned `isLeast_ncard_inversions` support the statement. |
| 2.1 The actual base stabilizer | sga3iii line 1374, Prop. 6.7.2 p. 99: Aut(R) is the semidirect product of W(R) by the stabilizer E_Δ(R) of a simple system; line 1368, Lemma 6.7.1 p. 98: W normal, u sₐ u⁻¹ = s_{u(a)}; line 1051, Prop. 6.1.3 p. 90: simple systems, positive systems and chambers correspond bijectively and W-compatibly; milne17 line 25554, C.53 p. 624: A(R) = W(R) ⋊ D. As cited. |
| 2.2 Oriented diagrams and actual isogeny lattices | sga3iii line 1608, Prop. 7.3.2 pp. 104–105 (unique isomorphism inducing a Cartan-preserving bijection of simple systems, for simply connected or adjoint reduced data); line 1627, Cor. 7.3.4 p. 105; line 1654, Cor. 7.4.5 p. 105; line 1660, Rem. 7.4.6 p. 106. The README's restriction of the full integral identification to simply connected or adjoint data is the source's hypothesis. |
| 2.3 Full integral data and central directions | sga3iii lines 19–36, Def. 1.1.1 pp. 63–64 (finite free lattices in duality, (DR I), (DR II), no spanning); line 1374 as above; milne17 line 25314, C.43 p. 618 (Q ∩ X₀ = 0, Q + X₀ of finite index); line 25401, C.51 p. 620. |
| 3.1 Irreducible components | milne17 line 25102, C.23 p. 612 (direct sums, unique decomposition); line 25585, C.55 p. 625 (Coxeter graph connected iff indecomposable). |
| 3.2 Positive invariant forms and squared lengths | milne17 line 25421, p. 621 (invariant inner product unique up to scalar for an indecomposable system, in the reduced setting); lines 25438–25444, table (180) p. 621 (ratios 1, √2, √3); C.56 pp. 625–626 (the diagram list and the simply-laced equal-length remark, line 25617). The README's general metric theorem is derived independently and says so. |
| 4.1 Integral coordinates and reflection orbits | sga3iii lines 23–27, formulas (1), (1*) p. 63, and lines 39–42, Rem. 1.1.2 (2)–(3) p. 64: sₐ(x) = x − (a*, x)a; milne17 lines 25088, 25096, C.21–C.22 p. 612 for the positive-root identification. |
| 4.2 Greatest positive roots | milne17 line 25111, C.24 p. 612: for an indecomposable system a root whose coefficients dominate every root's, unique for the base. Bourbaki VI §1 nos. 3 and 8: uncertified. |
| 4.3 Numbered family comparisons | Bourbaki VI §4 Planches I–IX: uncertified; the E, A and C values were recomputed and agree with Mathlib's `E`, `A`, `C` conventions at the pin. |
| 5.1 Type A | milne17 line 25053, C.16 p. 611 (sum-zero model) and line 25116, C.25 pp. 612–613 (base e_i − e_{i+1}, W the symmetric group). The source's "i > j" misprint is not copied (Source issues). |
| 5.2 Type G₂ | milne17 lines 25476–25498, pp. 622–623: twelve roots, W(G₂) = D₆ of order 12, reflection product of order 6; `Weyl/Dihedral.lean:138` proves it and the README now consumes it. |

No locator in the README is flagged unverified. No manifest or file was edited; the worktree is unchanged.

## Not verifiable

- **bourbaki46**, N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4–6*, Springer 2002: settled as uncertified (paywalled). Chapter VI §1 nos. 3, 6, 8 and §4 Planches I–IX (cited in §1.2, §4.2, §4.3) were not read; the statements they are cited for were checked by computation and against Milne instead.
- **bjornerbrenti05**, A. Björner and F. Brenti, *Combinatorics of Coxeter Groups*, Springer 2005: settled as uncertified (paywalled). §2.2 and Theorem 3.3.1 (cited in §1.2) were not read; the subword criterion and Matsumoto's theorem are pinned Tau Ceti declarations, which is what §1.2 consumes.
- The eight admitted theorems were elaborated and audited by instance, not proved; the ℤ[1/2] model and the H-model are explicit calculations, not Lean countermodels.

## Source issues

- **Misprint** in milne17 at Example C.25, printed p. 612 (milne17 line 25120): the source says the positive roots for its chosen vector t are e_i − e_j with i > j; it should be i < j, since (t, e_i − e_j) = j − i; affects a stated result.
- **Misprint** in milne17 at Appendix C(g), printed p. 622 (milne17 line 25453): the source says two simple roots have both pairings n(α,β), n(β,α) negative; it should be nonpositive, both being zero for the A₁×A₁ system displayed beside it, and the preceding argument only excludes strictly positive values; affects nothing.
