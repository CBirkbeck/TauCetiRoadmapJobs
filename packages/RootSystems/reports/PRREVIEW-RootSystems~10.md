# Review of RootSystems (pull request #1196 at 976a24c)
Folder: `TauCetiRoadmap/RepresentationTheory/RootSystems/`

**Verdict:** needs changes

This is a full review of the same head the previous review read (`976a24c`); the change set since that review is empty, so every passage was re-read. One blocking finding is carried forward unrepaired; seven P3 findings are new or restated. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with ten `sorry` warnings and nothing else.

## R01 (P2) — Delete the companion Lean file that breaks the binding form rules

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/InvariantMetricTargets.lean:13`, `set_option autoImplicit false`; lines 1–5, five `Mathlib.*` submodule imports; lines 22 and 28, two admitted theorems.

**Claim:** A `set_option` is a blocking finding by the review's principles, submodule imports are refused by the Lean form rules, and the two admissions (`invariantForm_existsUnique_positiveScale`, `squaredRootLengths_twoValued`) restate `invariantMetric_unique_scale` and `squared_lengths_two_values` of `Suggested.lean` under names that the README never mentions. The gate's `set_option=0` and `imports=0` counters inspect only `Suggested.lean`, so the passing gate is not evidence here.

**Witness:** The file elaborates on its own (two `sorry` warnings, exit 0), so the defect is form, not a build failure. Its first theorem is `Suggested.lean:95–100` with `Fintype ι` moved into a `variable` line; its second is `Suggested.lean:103–110` verbatim in content.

**Repair:** Delete `InvariantMetricTargets.lean`. Nothing else changes: `Suggested.lean` builds independently and keeps both metric headlines. Carried from the previous review's R01 (unrepaired: the folder has no change since).

## R02 (P3) — The G₂ headline is already a pinned Tau Ceti theorem

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean:137–141`, `weylGroup_equiv_dihedral_of_isG2`; `README.md:580–587` ("prove `weylGroup_equiv_dihedral_of_isG2`: its Weyl group is isomorphic to `DihedralGroup 6`").

**Claim:** Tau Ceti at the pin proves `TauCeti.nonempty_dihedralGroup_mulEquiv_weylGroup_of_hasCartanType_G2` (`TauCeti/LinearAlgebra/RootSystem/Weyl/Dihedral.lean:139`, hypotheses finite, characteristic-zero domain, crystallographic, reduced, a base of Cartan type G₂, conclusion `Nonempty (DihedralGroup 6 ≃* P.weylGroup)`), and its own docstring says it proves "the Weyl-group clause of the G₂ worked example" of this README. Composed with `TauCeti.hasCartanType_G2_of_isG2` (`RankTwo.lean:354`), which the README already cites, the headline closes by one term.

**Witness:** A scratch copy of the declaration with the two extra imports `TauCeti.LinearAlgebra.RootSystem.Weyl.Dihedral` and `RankTwo`, body `⟨(TauCeti.nonempty_dihedralGroup_mulEquiv_weylGroup_of_hasCartanType_G2 P b (TauCeti.hasCartanType_G2_of_isG2 ‹_› b)).some.symm⟩`, elaborated with no error.

**Repair:** Delete `weylGroup_equiv_dihedral_of_isG2` from `Suggested.lean` and from the module docstring's list. In the From Tau Ceti contract add the dihedral theorem (and `card_weylGroup_of_hasCartanType_G2`) beside the G₂ recognition theorem; rewrite §5.2 as consumption: the Weyl group of a G₂ system is supplied, and what remains of the roadmap's own in §5.2 (six positive roots, longest length 6 via §1.2) is a Check or an Example. The README keeps the G₂ example.

## R03 (P3) — `squared_lengths_two_values` restates Mathlib's two-length lemmas

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean:103–110`; `README.md:423–427` ("there are s>0 and r∈{1,2,3} with each squared root length equal to s or rs").

**Claim:** Mathlib at the pin has `RootPairing.InvariantForm.exists_apply_eq_or` (`Mathlib/LinearAlgebra/RootSystem/Finite/Lemmas.lean:308`: for a finite reduced irreducible crystallographic pairing with any invariant form, two indices whose lengths cover every root) and `apply_eq_or` (line 294: any two root lengths are equal or in ratio 2 or 3, either way round). Positive definiteness is not needed there; the headline adds it only to make `s > 0` and to pick the smaller length. The statement is a repackaging of pinned results, not a deep result the roadmap reaches.

**Witness:** Take `i, j` from `exists_apply_eq_or`, `s` the smaller of their two self-values (positive by `hB`), `r` from `apply_eq_or i j`; every root's length is `s` or `r·s`. On A₁, B₂, G₂ this gives `(s, r) = (1,1), (1,2), (1,3)` with length sets `{1}, {1,2}, {1,3}`, the values the README's Checks use.

**Repair:** Delete the declaration from `Suggested.lean`; cite the two Mathlib lemmas with file and line in the From Mathlib contract; keep in §3.2 only what is new, the identification of `r` per Dynkin type (A, D, E → 1; B, C, F₄ → 2; G₂ → 3) against the native length tables, which no pinned declaration states.

## R04 (P3) — Two chamber declarations are cited in the wrong namespace

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:142` ("`RootPairing.dominantChamber` in `TauCeti/LinearAlgebra/RootSystem/Chamber.lean`") and `README.md:145` ("`RootPairing.openDominantChamber`").

**Claim:** At the pin both are in namespace `TauCeti`: `TauCeti/LinearAlgebra/RootSystem/Chamber.lean:94` opens `namespace TauCeti`, and lines 137 and 140 define `dominantChamber` and `openDominantChamber` there.

**Witness:** `#check @RootPairing.dominantChamber` and `#check @RootPairing.openDominantChamber` fail with "Unknown constant" in a scratch file that imports `TauCeti.LinearAlgebra.RootSystem.Chamber`; `#check @TauCeti.dominantChamber` and `#check @TauCeti.openDominantChamber` succeed.

**Repair:** Replace the two names by `TauCeti.dominantChamber` and `TauCeti.openDominantChamber`. The other sixty-odd supplier names in the two contracts resolve (list under Verified sound).

## R05 (P3) — §1.2 does not name the pinned root-level length theorem it rewrites

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:235–243` ("Deduce that reduced words are precisely minimal simple-reflection expressions … *Needs:* §1.1; inversion exchange; `CoxeterSystem.length`; native longest element; abstract Matsumoto") and the From Tau Ceti contract, lines 122–125.

**Claim:** `TauCeti/LinearAlgebra/RootSystem/Inversions/Length.lean` already proves `TauCeti.isLeast_ncard_inversions` (the inversion count is the least length of a word in the simple reflections spelling `w`) and `TauCeti.exists_wordProd_eq_and_length_eq_ncard_inversions`, under exactly the hypotheses of `length_eq_inversions`. With the marking `hcs`, `cs.length w` is that least length by Mathlib's definition of `CoxeterSystem.length`, so the headline is the Coxeter-length spelling of a pinned theorem and the "reduced words are minimal expressions" deduction is supplied, not planned.

**Witness:** `#check @TauCeti.isLeast_ncard_inversions` elaborates to `IsLeast {n | ∃ l, TauCeti.wordProd P b l = w ∧ l.length = n} (TauCeti.inversions P b w).ncard` with `[Finite ι] [CharZero R] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]`.

**Repair:** Cite both declarations (file `Inversions/Length.lean`) in the From Tau Ceti contract and in §1.2's *Needs:* line; state §1.2 as the transfer of that root-level least-length statement through the marking of §1.1, and drop "Deduce that reduced words are precisely minimal simple-reflection expressions" as a target. The headline `length_eq_inversions` may stay: it needs the marking and is not one tactic.

## R06 (P3) — Two open pull requests rewrite this folder with overlapping headlines

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean:128–134` (`weylGroup_equiv_perm_of_typeA`), 40–44 and 47–53.

**Claim:** Pull request #1278 (same author, head `f33895a`) also replaces this folder, with a different layer structure. Its `Suggested.lean` declares the same fully qualified name `TauCetiRoadmap.RepresentationTheory.RootSystems.weylGroup_equiv_perm_of_typeA`, and states the presentation completeness and the length formula under other names (`weylCoxeterHom_injective`, `presentation_length_eq_inversions`). Only one head can become the roadmap; the README and the pull-request text say nothing about which supersedes which.

**Witness:** `roadmaps list` shows #1196 and #1278 both on `RootSystems`; `roadmaps show RootSystems --pr 1278 --file Suggested.lean` lists the three declarations above at its lines 82, 90 and 121.

**Repair:** The author says which pull request is the roadmap's head and closes or rebases the other; the surviving README absorbs or deliberately omits the other's targets (geometric faithfulness, classification independent of a base). A review cannot settle ownership between two heads of one folder; this is recorded for the human approver and does not block on its own.

## R07 (P3) — Consumers cite layers that this rewrite removes

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:599–607` (Downstream consumers) against `TauCetiRoadmap/CFSGStatement/README.md:197` ("Layer 6 of the root-systems roadmap"), `TauCetiRoadmap/ReductiveGroups/README.md:654, 1132, 1274` ("RootSystems Layers 1–4", "Layers 5–6", "RootSystems 4A"), and RootSystemsPartII at its open head, `README.md:7, 289` ("RootSystems, Layers 1–6", "RootSystems Layers 5–6").

**Claim:** The roadmap on main has six layers (root combinatorics; Coxeter system; Coxeter combinatorics; chambers; classification; numbering and integral data). This head has five with different content, so every citation above points at a section that will not exist after merge; the supplied objects (classification, numbered data, chambers) are now native Tau Ceti declarations, which the Scope paragraph says in general but without the sections consumers name. RootSystemsPartII is cited in Scope but not listed as a consumer.

**Witness:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:356` on main is `### Layer 6: the Bourbaki numbering and integral root data`; this head's last layer heading is `## Layer 5: concrete Weyl groups` (line 557).

**Repair:** In Downstream consumers, add RootSystemsPartII (it consumes the based automorphisms of §2.1–§2.2 and native positive roots, chambers and classification) and, for CFSGStatement and ReductiveGroups, name the native declarations that replace the former layers they cite, so each consumer can repoint in one edit. No edit outside the folder.

## R08 (P3) — Unused hypothesis in the type A headline

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean:133`, `(hn : 1 ≤ n)`; `README.md:561` ("base of native type Aₙ, n≥1").

**Claim:** At n = 0, `TauCeti.HasCartanType P b (.A 0)` gives `b.support ≃ Fin 0`, so the base is empty, `M = 0` by spanning, no roots exist, `W = 1`, and `Perm (Fin 1)` is trivial: the conclusion holds. The hypothesis excludes nothing the statement needs.

**Witness:** Values at n = 0: `|W| = 1 = 1! = |Perm (Fin 1)|`. At n = 1 over ℤ[1/2] (README Check, line 572): `|W| = 2 = 2!`.

**Repair:** None required (a note). If kept for readability, say in the README that validity of `A n` is a convention of the native enumeration, not a hypothesis the theorem uses.

## Previous findings

- R01 — not repaired: `InvariantMetricTargets.lean` is unchanged (`set_option` at line 13, submodule imports at lines 1–5, two duplicate admissions). Current R01.
- R02 — closed as far as the package can act. The source records now exist: during this review the sources service recorded `milne17` and `sga3iii` as certified texts and `bourbaki46`, `bjornerbrenti05` as uncertified (paywalled DOI prefix) in `packages/RootSystems/sources.toml`. No roadmap folder on main carries a `sources.toml`, so "the folder has no `sources.toml`" was not a defect of the folder. The §1.2 locators are theorem and section numbers (Bourbaki VI §1 no. 6; Björner–Brenti §2.2, Theorem 3.3.1), which is what an uncertified citation is cited by; printed pages cannot be verified without the texts and are not demanded.

## Verified sound

### Head, gate, build, signatures and padding probes

Head `976a24c9a3481396762adf43c451e53fb0d1fe75`; pins Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…` (confirmed by `rev-parse` in the worktree's `.lake/packages`). The outside-folder diff against `origin/main` is empty; the family index files (`TauCetiRoadmap/RepresentationTheory/README.md`, `STATUS.md`, `PROGRESS.md`, `metadata.toml`) are unchanged.

Gate (worker's run at this head, data): every counter zero including `build=0`, OK. Dependency check, rerun:

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. RootSystems is on main, so it is a supplier to everything; its README cites no roadmap as a supplier (no `From TauCetiRoadmap.<X>` section, no `*Needs:*` line names a roadmap), so no upward edge can arise.

`lake env lean` on `Suggested.lean`: exit 0, exactly ten `sorry` warnings (lines 40, 47, 66, 74, 85, 95, 103, 116, 128, 137). A scratch file with `#check @name` for all eleven declarations (ten theorems and `basedAut`) plus `DynkinType` and `DynkinType.Valid` elaborated; each elaborated type was compared with its README statement and agrees in generality (table below). In particular `basedAut` keeps only `[CommRing R]` and the module instances, as its type needs; every theorem carries its finiteness, spanning, crystallographic, reduced, irreducible, positivity and lattice hypotheses explicitly.

One-tactic probes on a scratch copy with `by first | rfl | infer_instance | (simp; done) | exact …`: none of the ten theorems closed by `rfl`, `infer_instance` or `simp`. The G₂ theorem closed by one `exact` from the pinned library once the two Tau Ceti modules are imported (R02). The two-length theorem is a few-line repackaging of pinned lemmas (R03), not a one-tactic closure.

### The adversarial table (computed values)

Matrix convention throughout: `Cᵢⱼ = ⟨αᵢ, αⱼ∨⟩`, columns of simple-root coefficients, `sᵢ` subtracts `ΣⱼCⱼᵢcⱼ` from entry `i`. Root sets were generated by closing the simple vectors under the coefficient reflections; counts and greatest vectors were recomputed independently of the README.

| Statement | Instances tried | Values computed on the two sides | Result |
|---|---|---|---|
| Conventions: B₂ column formula | C=`!![2,-2;-1,2]`, c=(1,0), short node 2 | 0 − C₁₂·1 = 0 − (−2) = 2, giving (1,2); using C in place of Cᵀ gives 0 − C₂₁ = 1, giving (1,1) | Pass; witness distinguishes the transposes |
| Conventions: A₂ inversions of s₁s₂ (left action, s₂ first) | α₁, α₂, α₁+α₂ | images (0,1), (−1,−1), (−1,0): inversions {α₂, α₁+α₂}; the reversed product s₂s₁ gives {α₁, α₁+α₂} | Pass; convention pinned |
| Conventions: coweight direction | σ=(123), permutation matrix P | weight map e₁↦e₂; Mathlib `coweightEquiv` is the transpose P_{σ⁻¹}: e₁↦e₃; its inverse e₁↦e₂; pairings ⟨e₂,e₂⟩=1, ⟨e₂,e₃⟩=0 | Pass (Hom.lean:305 is `N₂ ≃ₗ N`) |
| Supplied conventions: finite type | [2]; empty; affine A₁ `!![2,-2;-2,2]` | q(1)=2>0; empty positivity vacuous; affine value at (1,1) is 2−2−2+2=0 for every symmetrizer | Pass (FiniteType/Basic.lean:121) |
| Supplied conventions: validity | A₀,A₁,B₁,B₂,C₂,D₃ | `Valid` = 1≤n, 2≤n, 3≤n, 4≤n: false,true,false,true,false,false | Pass (DynkinType.lean:156) |
| Supplied conventions: B₂ matrix, Coxeter entry | Mathlib `CartanMatrix.B 2`, G₂ | B(0,1)=−2, B(1,0)=−1 → `!![2,-2;-1,2]`; product 2 ↦ Coxeter 4; A₁ Coxeter matrix [1]; G₂ `CartanMatrix.G₂ᵀ` = `!![2,-1;-3,2]`, product 3 ↦ 6 | Pass (Cartan/Basic.lean:114,128; Coxeter/Matrix.lean:278) |
| Supplied conventions: H-model lowering fails | H=`!![2,-3;-3,2]`, roots of norm 2 | (1,1) has height 2; s₁(1,1)=(2,1), s₂(1,1)=(1,2), heights 3; iterates of s₁s₂ on (1,0): (8,3),(55,21),(377,144), all norm 2 | Pass; finiteness needed |
| §1.1 `exists_marked_weylCoxeterSystem` | rank 0, A₁, A₂ | orders 1,2,6 on both sides; A₂ relations s₁²=s₂²=(s₁s₂)³=1 with Coxeter entry 3 | Pass; marking excludes the generator swap (α₁ ↦ α₁+α₂ instead of −α₁) |
| §1.2 `length_eq_inversions` | all six A₂ elements; s₁s₁ | lengths 0,1,1,2,2,3 equal inversion counts 0,1,1,2,2,3; s₁s₁ has length 0 and 0 inversions | Pass; R05 names the pinned supplier |
| §1.2 longest element, Poincaré | empty, A₁, A₂, G₂ | longest lengths 0,1,3,6 = positive counts 0,1,3,6; A₂ polynomial 1+2q+2q²+q³, value 6 at q=1 | Pass |
| §2.1 `basedAut` membership | A₁; A₂; empty | A₁: Aut={±1}, −1 sends index of +1 to −1, excluded, stabilizer order 1; A₂: reversal δ preserves {1,2}, order 2; empty: Aut=1 | Pass; genuine subgroup body |
| §2.1 `weyl_based_complement` | A₁, A₂, empty | |Aut| = 2, 12, 1 = |W|·|based| = 2·1, 6·2, 1·1; intersections trivial | Pass |
| §2.1 normality witness | A₂, δ reversal | δs₁δ⁻¹ = s₂; both sides send α₁ ↦ α₁+α₂, α₂ ↦ −α₂ | Pass (SGA 3 XXI 6.7.1) |
| §2.2 `existsUnique_basedAut_of_cartanMatrix`, existence | empty, A₁, A₂, D₄ | Cartan-preserving permutations 1,1,2,6; based automorphisms 1,1,2,6 | Pass |
| §2.2 uniqueness and marking | A₂ identity, reversal | basis images (e₁,e₂) or (e₂,e₁); unique matrices I, `[[0,1],[1,0]]`; coweight map determined by the perfect pairing | Pass |
| §2.2 oriented diagram | B₂ node swap | entries (−2,−1) become (−1,−2) ≠ (−2,−1) | Pass; swap excluded |
| §2.2 lattice stabilizer | D₄, discriminant (ℤ/2)² | S₃ permutes 3 nonzero classes transitively; stabilizer of one class has order 6/3 = 2 | Pass |
| §2.3 `full_datum_complement` | root-free rank 0,1,2 | W=1; based = Aut = 1, {±1}, GL₂(ℤ) (shear `[[1,1],[0,1]]` of infinite order); every g = 1·g | Pass; no finiteness of Aut claimed |
| §2.3 central gluing | GL₂: root (1,−1), central (1,1) | determinant 1·1−(−1)·1 = 2: index 2, no integral splitting | Pass (Milne C.43) |
| §2.3 integral spanning not assumed | simply connected A₁ | roots generate 2ℤ ⊊ ℤ; coroots generate ℤ | Pass; `IsRootSystem` correctly absent |
| §3.1 components | A₂, A₁², empty | 1 block of dim 2; 2 blocks of dim 1; 0 blocks, dim 0; (1,1) is a root of A₂ only | Pass (Milne C.55) |
| §3.2 `invariantMetric_unique_scale` | A₁, B=xy, C=3xy | c = 3/1 = 3; c=2 fails at (1,1) (3≠2); c=0 fails positivity | Pass |
| §3.2 derivation without reducedness | roots ±1,±2, coroots ±2,±1; α=2 | C(α,α)/B(α,α)=12/4=3; D(x,2)=6x−6x=0; radical ∋ 2 ≠ 0, reflection-stable | Pass; hypotheses as stated |
| §3.2 zero space | M=0 | B=C=0; c=1 and c=2 both satisfy C=cB; `IsIrreducible` requires `Nontrivial M` | Pass; excluded |
| §3.2 `squared_lengths_two_values` | A₁, B₂, G₂; A₁³ diag(1,2,5) | length sets {1},{1,2},{1,3} with (s,r)=(1,1),(1,2),(1,3); A₁³ gives {1,2,5}, three values, not irreducible | Pass as stated; R03: pinned |
| §3.2 ordinary vs squared | B₂, G₂ | squared ratios 2,3; ordinary √2, √3 | Pass |
| §4.1 coefficient reflection | B₂ c=(1,0) | s₂(1,0)=(1,2), s₂(1,2)=(1,0); A=2I−Cᵀ gives ΣⱼA₂ⱼcⱼ−c₂ = 2−0 = 2 | Pass (SGA 3 XXI (1)–(3)) |
| §4.1 orbit union | A₁; B₂ | orbit of 1 is {±1}, positive part {1}; B₂ from both simples: 8 roots; from the long root alone: 4 | Pass |
| §4.2 `existsUnique_greatest_positive_root` | A₁, A₂, B₂, G₂ | greatest (1), (1,1), (1,2), (3,2); each dominates all positives coordinatewise | Pass |
| §4.2 negative controls | A₁²; empty | {(1,0),(0,1)} has no greatest member; empty has no positive root; both fail `IsIrreducible` | Pass |
| §4.2 positive weighting | A₂ weights (2,1) | values 2,1,3; unique maximum 3 at (1,1) | Pass |
| §4.2 simply-laced unit ascent | A₂, A₇, E₆, E₇, E₈ | non-greatest positives lacking a height +1 simple reflection: 0 of 2, 27, 35, 62, 119 | Pass (computed) |
| §4.2 non-simply-laced control | B₂ β=(1,1) | s₁β=(0,1) height 1, s₂β=β height 2; β+α₂=(1,2) is a root of height 3 | Pass |
| §4.3 E-family transport | extra node r at chain node 3 | r ↦ Bourbaki 2, 3 ↦ 4; Mathlib `CartanMatrix.E` has edges 0–2, 1–3, 2–3–4–…: Bourbaki 2 is attached to 4 | Pass (Cartan/Basic.lean:55) |
| §4.3 E counts | E₆, E₇, E₈ | 72/36, 126/63, 240/120 roots/positives; greatest (1,2,3,2,1,2), (2,3,4,3,2,1,2), (2,4,6,5,4,3,2,3); heights 11, 17, 29 | Pass (computed) |
| §4.3 A₇ | A₇ | 28 positives; greatest (1,…,1), height 7 | Pass |
| §4.3 C-family | C₄, C₉, C₁₃; Mathlib `CartanMatrix.C` | positives 16, 81, 169; greatest (2,…,2,1); C₄ printed sixteen tuples equal the computed set exactly; A₃₄=2, A₄₃=1 | Pass |
| §5.1 `weylGroup_equiv_perm_of_typeA` | A₁, A₂; ℤ[1/2] model; n=0 | |W| = 2, 6 = 2!, 3!; over ℤ[1/2] roots ±1, coroots ±2, pairing 2, s(3)=−3 ∈ 3R, 1 ∉ 3R (3a=2ᵏ has no solution): type A₁ without irreducibility; n=0: W=1 ≅ Perm(Fin 1) | Pass; R08 notes `hn` unused |
| §5.2 `weylGroup_equiv_dihedral_of_isG2` | G₂ coefficient matrices | S₁=`[[-1,3],[0,1]]`, S₂=`[[1,0],[1,-1]]`, S₁S₂=`[[2,-3],[1,-1]]`, cube −I, sixth power I; 12 elements; six positives (1,0),(0,1),(1,1),(2,1),(3,1),(3,2) | Pass; R02: pinned theorem |

Characteristic 2 and 3 and the zero ring are excluded by the characteristic-zero domain hypotheses; rank 0 is admitted and tested wherever irreducibility is not assumed; ℝ versus a general domain is explicit in each signature and matches the README sentence that introduces it.

### Pinned declarations opened

| Pinned file and line | What was confirmed |
|---|---|
| Mathlib `LinearAlgebra/RootSystem/Defs.lean:111, 120` | `RootDatum` is `RootPairing ι ℤ`; `IsRootSystem` is spanning of both modules only |
| Mathlib `RootSystem/IsValuedIn.lean:59, 80, 179` | `IsCrystallographic := IsValuedIn ℤ`; `pairingIn`; `rootSpanMem` |
| Mathlib `RootSystem/Base.lean:405, 457, 536` | `toWeightBasisInt` is a ℤ-basis of `rootSpan ℤ` indexed by `b.support`; `height`; `IsPos := 0 < height` |
| Mathlib `RootSystem/CartanMatrix.lean:52, 355` | `cartanMatrixIn i j = pairingIn S i j` (root rows, coroot columns); `equivOfCartanMatrixEq` over `[CharZero R] [IsDomain R] [Finite ι]`, spanning, crystallographic, reduced |
| Mathlib `RootSystem/Hom.lean:271, 305, 565, 674` | `Equiv` bundles bijective weight and coweight maps; `coweightEquiv : N₂ ≃ₗ N` is contravariant; `Aut := Equiv P P`; `Equiv.indexHom : Aut P →* (ι ≃ ι)` |
| Mathlib `RootSystem/WeylGroup.lean:55, 62` | `weylGroup : Subgroup (Aut P)`; `weylGroup.ofIdx` |
| Mathlib `RootSystem/RootPositive.lean:50` | `InvariantForm`: symmetric, nonzero root self-values, reflection-orthogonal; no positivity |
| Mathlib `RootSystem/Irreducible.lean:147` | `IsIrreducible`: `Nontrivial M`, `Nontrivial N`, invariant submodules are ⊥ or ⊤ |
| Mathlib `RootSystem/Finite/G2.lean:67` | `IsG2` extends crystallographic, reduced, irreducible, with a pairing −3 |
| Mathlib `RootSystem/Finite/Lemmas.lean:294, 308` | `InvariantForm.apply_eq_or`, `exists_apply_eq_or` (R03) |
| Mathlib `RootSystem/Finite/Nondegenerate.lean:205`, `Finite/CanonicalBilinear.lean:346` | `posRootForm_rootFormIn_posDef`; `posRootForm` |
| Mathlib `RootSystem/Chain.lean:110, 138` | `chainTopCoeff`; `root_add_nsmul_mem_range_iff_le_chainTopCoeff` with the linear-independence hypothesis in its section |
| Mathlib `GroupTheory/Complement.lean:53`, `SemidirectProduct.lean:238` | `IsComplement'`; `mulEquivSubgroup {H K} [H.Normal] (h : H.IsComplement' K)`, matching `P.weylGroup.IsComplement' (basedAut P b)` with W the normal factor |
| Mathlib `GroupTheory/Coxeter/Basic.lean:108, 187, 329`, `Length.lean:74` | `CoxeterMatrix.Group`, `simple`, `lift`; `length` is the least word length |
| Mathlib `LinearAlgebra/Matrix/Cartan/Basic.lean:55, 114, 128, 137` | `E`, `G₂ = !![2,-3;-1,2]`, `B`, `C` conventions used in the table |
| Tau Ceti `RootSystem/Coxeter/Presentation.lean:57, 66, 82` | `weylCoxeterHom`, `_apply_simple`, `_surjective` (reduced added for surjectivity); docstring names injectivity as the open target |
| Tau Ceti `RootSystem/Coxeter/Matrix.lean:278` | `coxeterMatrixOfBase` via `coxeterOrder` of the Cartan product |
| Tau Ceti `RootSystem/Inversions/Basic.lean:50`, `Exchange.lean:138`, `StrongExchange.lean:75`, `Length.lean` | `inversions`; `ncard_inversions_mul_ofIdx`; `exists_wordProd_eraseIdx_eq_mul_ofIdx`; `isLeast_ncard_inversions` (R05) |
| Tau Ceti `RootSystem/Weyl/Group.lean:153, 337` | `RootPairing.weylGroupToPerm_injective`, `RootPairing.finite_weylGroup` (namespace `RootPairing`, as cited) |
| Tau Ceti `RootSystem/SimpleReflections.lean:124` | `weylGroup_eq_closure_simple` |
| Tau Ceti `RootSystem/Chamber.lean:94, 137, 140` | namespace `TauCeti`; `dominantChamber`, `openDominantChamber` (R04) |
| Tau Ceti `RootSystem/Weyl/Chamber.lean:112, 187, 212, 243` | `openWeylChamber`; transitivity; `IsPretransitive`; uniqueness of the chamber element |
| Tau Ceti `RootSystem/FundamentalDomain.lean:186, 199` | `stabilizer_eq_closure_wallReflections`; `smul_eq_self_of_smul_mem_dominantChamber` |
| Tau Ceti `RootSystem/LongestElement.lean:194, 200, 235` | `longestElement`, `inversions_longestElement`, `longestElement_sq` |
| Tau Ceti `RootSystem/Lowering.lean:92`, `Positive.lean:114, 117` | lowering with `[Finite ι] [IsDomain R] [P.IsReduced]`; `posRoots`, `negRoots` |
| Tau Ceti `RootSystem/DynkinType.lean:108, 156, 222, 231, 416` | `DynkinType`; `Valid`; `cartanMatrix` by Mathlib families, G₂ as `G₂ᵀ`; `HasCartanType` as a Cartan-matrix relabelling |
| Tau Ceti `RootSystem/FiniteType/Basic.lean:121`, `Classification.lean:127`, `Irreducible.lean:255` | `IsFiniteType` (positive rational symmetrizer, positive-definite symmetrization); `existsUnique_dynkinType` with `[Nonempty ι] [IsIrreducible]`; `isIrreducible_of_connected_diagramGraph_cartanMatrix` over a field of characteristic zero |
| Tau Ceti `RootSystem/RankTwo.lean:332, 354` | `isG2_of_hasCartanType_G2`; `hasCartanType_G2_of_isG2 [Finite ι] [CharZero R] [IsDomain R] (hG2 : P.IsG2) (b)` |
| Tau Ceti `RootSystem/Weyl/Dihedral.lean:93, 139` | rank-two dihedral theorem; G₂ dihedral theorem (R02) |
| Tau Ceti `RootSystem/NumberOfRoots.lean:47`, `RootLength.lean:123, 241` | `numRoots`; `rootLength` (B: last node 1, others 2; C: last node 2; G₂: node 0 is 1, node 1 is 3); `IsLongSimpleRoot` |
| Tau Ceti `SimplyConnectedRootDatum/Assembly.lean:79, 94, 205, 498`, `Rational.lean:80, 87, 191`, `BaseChange.lean:124` | `simplyConnectedRootDatum : RootDatum (Fin t.numRoots) (Fin t.rank → ℤ) (Fin t.rank → ℤ)`; `simplyConnectedBase`; `simpleIndex`; `hasCartanType_…`; `rationalRootSystem` as the dot-product base change; `rootPairingBaseChange` |
| Tau Ceti `RootSystem/DiagramPermutations.lean:373`, `SimplyConnectedRootDatum/DiagramAutomorphism.lean:107, 267, 363` | `diagramSymmetry` (Cartan-preserving permutations); `rationalDiagramAut`, `diagramAut`, `diagramAutHom` |
| Tau Ceti `RootSystem/InvariantForm/Basic.lean:40` | `RootPairing.InvariantForm.two_mul_apply_root (x : M) (j : ι)` |
| Tau Ceti `GroupTheory/Coxeter/StrongExchange.lean:413`, `Matsumoto.lean:138`, `Bruhat.lean:159, 450`, `Poincare.lean:87, 92` | `CoxeterSystem.strongExchange`; `TauCeti.matsumoto`; `BruhatLE`; subword criterion for reduced words; `poincarePolynomial [Finite W]`, `_eq_sum [Fintype W]` |

A scratch `#check` file over 66 cited names (every supplier name of the two contracts and the headline carriers) resolved every name except the two of R04.

### Ownership and duplication by object

Searched the pinned root-system directories for the objects (not only the names): based stabilizers and complements, Cartan-preserving permutations, greatest positive roots, invariant-form scaling, two root lengths, Weyl groups as permutation and dihedral groups, irreducible components. Found at the pin: the G₂ dihedral group (R02), the two-length lemmas (R03), the root-level length theorem (R05), and the numbered diagram symmetries (correctly cited as suppliers). Not found at the pin: the marked Coxeter presentation, the Coxeter-length spelling, the based complement and its unique Cartan-preserving extension, the full-datum complement, the unique positive scale, the greatest root, and type A for general n (Tau Ceti has A₂, B₂ and G₂ in rank two only; `Weyl/Dihedral.lean:122, 130`). Those remain this roadmap's.

Open roadmaps: RootSystemsPartII at its open head (`rev/1731`) builds integral dominance, folds, fixed Weyl groups and the irreducible case theorem for based automorphisms; it consumes, and does not own, the general based complement or diagram identification. Pull request #1278 on the same folder overlaps on three headlines (R06). ReflectionInvariantTheory on main (§3 real reflection arrangements, §4 crystallographic dictionary with exponents and degrees), ReductiveGroups §9A.1a-L, ZigzagPreprojective Layer 0, LieHighestWeight Layers 2 and 6, ClassicalGroups Layer 3, CFSGStatement L0–L1 and LieGroups Layers 6 and 8 were opened and say what the Scope and Downstream sections attribute to them; the link anchor `#layer-2-weights-of-a-module-and-their-integrality` resolves (`LieHighestWeight/README.md:370`). The board's package index lists no RootSystems package; ownership against open pull requests was checked only through the supplied index and checkouts.

### Shape, policy and the Lean form

README: title, Summary, Scope and ownership, Conventions (with three convention Checks), Exact supplier contracts (From Mathlib, From Tau Ceti, with Checks of the supplied conventions), How to read the build, Layers 1–5 each with numbered prose subsections, `*Needs:*` lines, Examples and Dependencies, Downstream consumers, References. Every definition (based subgroup, lattice-preserving subgroup, component spaces, coefficient reflection) lists its API and at least three Checks that compute a value or a non-example. Every target carries a locator. No LaTeX, no process words, no pull-request numbers, no algorithm (the root enumeration is stated as equality of sets, line 482). Every backticked name of the roadmap's own is declared in `Suggested.lean`, and every Lean name appears in the README.

`Suggested.lean`: `import Mathlib` plus three existing Tau Ceti modules; one module docstring naming the two headlines that are not statable (componentwise metric parameterization; the cylinder-chamber comparison for arbitrary finite-free data) and what each lacks; `theorem` only; no `set_option`, no sorried data, no `#eval`, no `True` placeholders; `basedAut` has a real body on native carriers; the `export` lines alias native declarations for the consumer `CFSGStatement/Suggested.lean`, which imports this module and built in the gate.

### Seeded sample and sources

Printed pages were recovered from the running heads: Milne's printed page is the PDF page minus 12 (page 612 begins at milne17 line 25084); the SGA 3 re-edition's printed page is the PDF page plus 62 (page 99 begins at sga3iii line 1372).

| Sample | Verification |
|---|---|
| 1.1 Completeness of the relations | milne17 line 25096, C.22 p. 612: bases correspond to chambers, W is simply transitive on them, and W is a Coxeter group on the simple reflections (stated for root systems over a subfield of ℝ). Supports the real case; the domain case rests on the native Cartan comparison, as the README says. |
| 1.2 Length and reduced expressions | Bourbaki VI §1 no. 6 and Björner–Brenti §2.2, Thm 3.3.1: uncertified (below). The computed A₂ values and the pinned `isLeast_ncard_inversions` support the statement. |
| 2.1 The actual base stabilizer | sga3iii line 1374, Prop. 6.7.2 p. 99: Aut(R) is the semidirect product of W(R) by the stabilizer E_Δ(R) of a simple system, for a root datum on finite free lattices; line 1368, Lemma 6.7.1 p. 98: W normal, u sₐ u⁻¹ = s_{u(a)}; line 1051, Prop. 6.1.3 p. 90: simple systems, positive systems and chambers correspond bijectively and compatibly; milne17 line 25554, C.53 p. 624: A(R) = W(R) ⋊ D. All as cited. |
| 2.2 Oriented diagrams and actual isogeny lattices | sga3iii line 1608, Prop. 7.3.2 pp. 104–105 (unique isomorphism inducing a Cartan-preserving bijection of simple systems, for simply connected or adjoint reduced data); line 1627, Cor. 7.3.4 p. 105 (E_Δ(R) is the Cartan-preserving permutation group there); line 1654, Cor. 7.4.5 p. 105 (Dynkin-diagram automorphisms); line 1660, Rem. 7.4.6 p. 106. The README's restriction of the full integral identification to simply connected or adjoint data, with lattice preservation otherwise, is exactly the source's hypothesis. |
| 2.3 Full integral data and central directions | sga3iii lines 19–36, Def. 1.1.1 pp. 63–64 (finite free lattices in duality, axioms (DR I), (DR II), no spanning); line 1374 as above; milne17 line 25314, C.43 p. 618 (Q ∩ X₀ = 0, Q + X₀ of finite index, no integral splitting); line 25401, C.51 p. 620. |
| 3.1 Irreducible components | milne17 line 25102, C.23 p. 612 (direct sums, unique decomposition); line 25585, C.55 p. 625 (Coxeter graph connected iff indecomposable; components correspond). |
| 3.2 Positive invariant forms and squared lengths | milne17 line 25421, p. 621 (invariant inner product unique up to scalar for an indecomposable system; stated in the reduced setting of §g); line 25438–25444, table (180) p. 621 (ratios 1, √2, √3). The README's general metric theorem is derived independently and says so. |
| 4.1 Integral coordinates and reflection orbits | sga3iii lines 23–27, formulas (1), (1*) p. 63, and line 39–42, Rem. 1.1.2 (2)–(3) p. 64: sₐ(x) = x − (a*, x)a; substituting coefficient columns gives cᵢ − ΣⱼCⱼᵢcⱼ. milne17 lines 25088, 25096, C.21–C.22 p. 612 for the positive-root identification. |
| 4.2 Greatest positive roots | milne17 line 25111, C.24 p. 612: for an indecomposable system there is a root whose coefficients dominate every root's, unique for the base. Bourbaki VI §1 nos. 3 and 8: uncertified. |
| 4.3 Numbered family comparisons | Bourbaki VI §4 Planches I–IX: uncertified; the E, A and C values were recomputed and agree with Mathlib's `CartanMatrix.E`, `A`, `C` conventions at the pin. |
| 5.1 Type A | milne17 line 25053, C.16 p. 611 (sum-zero model) and line 25116, C.25 pp. 612–613 (W ≅ S_{n+1}, base e_i − e_{i+1}, highest root e₁ − e_{n+1}). The source's "i > j" misprint is not copied (Source issues). |
| 5.2 Type G₂ | milne17 lines 25476–25498, pp. 622–623: twelve roots, W(G₂) = D₆ of order 12, rotation order 6; `TauCeti/LinearAlgebra/RootSystem/Weyl/Dihedral.lean:139` proves it (R02). |

No locator in the README is flagged unverified. The sources service recorded the four works in `packages/RootSystems/sources.toml` (milne17 and sga3iii from the URLs the References give; the two books as uncertified); no other manifest or file was edited and the worktree is unchanged.

## Not verifiable

- **bourbaki46**, N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4–6*, Springer 2002: paywalled publisher, recorded uncertified. Chapter VI §1 nos. 3, 6, 8 and §4 Planches I–IX (cited in §1.2, §4.2, §4.3) were not read; the statements they are cited for were checked by computation and against Milne instead.
- **bjornerbrenti05**, A. Björner and F. Brenti, *Combinatorics of Coxeter Groups*, Springer 2005, DOI 10.1007/3-540-27596-7: paywalled, recorded uncertified. §2.2 and Theorem 3.3.1 (cited in §1.2) were not read; the subword criterion and Matsumoto's theorem are pinned Tau Ceti declarations, which is what §1.2 consumes.
- The ten admitted theorems were elaborated and audited by instance, not proved; the ℤ[1/2] model and the H-model are explicit calculations, not Lean countermodels.

## Source issues

- **Misprint** in milne17 at Example C.25, printed p. 612 (milne17 line 25120): the source says the positive roots for its chosen vector t are e_i − e_j with i > j; it should be i < j, since (t, e_i − e_j) = j − i; affects a stated result.
- **Error** in milne17 at Appendix C(g), printed p. 622 (milne17 line 25453): the source says two simple roots have both pairings n(α,β), n(β,α) negative; it should be nonpositive, both being zero for the A₁×A₁ system displayed beside it; affects a stated result.
