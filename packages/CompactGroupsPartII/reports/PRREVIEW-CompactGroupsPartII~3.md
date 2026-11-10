# Review of CompactGroupsPartII (pull request #1047 at e899a9d)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

This is an incremental re-review of the 20 lines changed since f4dbe70. Two P3 findings remain, and
both carry over from the previous report unchanged. Neither is in the roadmap folder: one is in the
family index, which this pull request also changes, and one is in the generated block of the
description. Nothing blocks.

## R01 (P3) — the family index still describes representation rings and a highest-weight supplier

Previous R02, not repaired: the family index is identical to f4dbe70.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md` lines 52–53: "compact abelian Fourier
theory, global forms and representation rings, and unitary SU(2) actions". Lines 100–102: "the
Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral
classification".

**Claim.** The index describes this roadmap and its suppliers.

**Witness.** Roadmap `README.md` lines 56–61: "this roadmap constructs no Grothendieck ring of
representations". Lines 274–277: LieHighestWeight supplies only Layer 10, "not through a layer of
LieHighestWeight". The index names neither ConvexityToric T1 (line 270) nor OperatorIdeals Part C
(line 278).

**Repair.** Lines 52–53: "… compact abelian Fourier theory, global forms and their formal
characters, and unitary SU(2) actions." Lines 99–102: "… and for its global forms the Lie-groups
roadmap's compact structure theory, maximal tori and coverings, ConvexityToric's period dictionary
of a torus and the highest-weight roadmap's coroot-lattice comparison for simply connected compact
groups; OperatorIdeals supplies Hilbert–Schmidt operators." Checked against the head: each named
item is a supplier the roadmap README lists at lines 255–279, and none is missing.

## R02 (P3) — the generated `roadmap-summary` block still describes the earlier roadmap

Previous R03, not repaired.

**Location.** The pull request description, block `roadmap-summary`: "the representation ring of a
compact connected group with its restriction to a maximal torus and the classical global forms";
"The global forms use the Lie-groups roadmap's maximal tori and coverings and the highest-weight
roadmap's dominant integral classification."

**Witness.** Roadmap `README.md` lines 56–61: no Grothendieck ring is built, and Layer 6 states its
results on formal characters. Lines 274–277: the highest-weight theory comes from pinned
declarations. The author's own paragraphs above the block already say this.

**Repair.** Regenerate the block from this head, so that it matches the author's paragraph: "for a
compact connected Lie group, the finite central cover, the classification of irreducible
representations by dominant characters of a maximal torus, the basis of the Weyl-invariant integral
group algebra of the character lattice given by their formal characters, and the classical global
forms". In the approach paragraph of the block, use the author's sentence on Layer 6's suppliers
(LieGroups Layers 5A, 6, 7; ConvexityToric T1; LieHighestWeight Layer 10).

## Previous findings

- R01 — repaired: `README.md` lines 161–174 and 433 now read `ContRepresentation.gramOperator`,
  `ContRepresentation.isUnitarizable`, `ContRepresentation.exists_isUnitary_congr`,
  `ContRepresentation.IsUnitary`, …, `ContRepresentation.exists_linearIsometryEquiv_congr_eq`. No
  `TauCeti.ContRepresentation` is left in the folder or the family index.
- R02 — not repaired: family index lines 52–53 still read "global forms and representation rings",
  and lines 100–102 still read "the highest-weight roadmap's dominant integral classification".
  This report raises it again as R01.
- R03 — not repaired: block `roadmap-summary` still reads "the representation ring of a compact
  connected group with its restriction to a maximal torus". This report raises it again as R02.
- R04 — repaired: `Suggested.lean` line 139, `/-! ## Layer 4: characters of arbitrary products -/`,
  matches `README.md` line 665. All seven section comments now match the README layer titles
  (lines 42, 58, 117, 139, 189, 228, 246 against README lines 386, 511, 598, 665, 741, 821, 1326).

Neither repair introduced a new problem. I found no repair report that marks R02 or R03 as not
actionable.

## Verified sound

**Gate.** The worker's gate at e899a9d passes every check. I ran it twice:

- The command exactly as the brief gives it reports `depcheck: NOT IN ORDER: CompactGroupsPartII`
  and `outside-folder: TauCetiRoadmap/RepresentationTheory/README.md`. The first comes from the
  configured merge order, which does not list this roadmap yet. The brief says that is not a
  finding.
- With the candidate merge order added (`--order`, `--pr 1047 --build`), every check passes except
  `outside-folder`: `depcheck=0`, `build=0` (the targeted build
  `TauCetiRoadmap.RepresentationTheory.CompactGroupsPartII.Suggested`).

The remaining `outside-folder` hit is the family index. The brief names it as this pull request's
own, so it is not a finding, but its wording is R01. Outside the roadmap folder and the family
index, the pull request changes nothing. The head merges cleanly into main (8101f2c).

**Dependency check** (`--movable`, candidate order, `--pr 1047`):
`depcheck: 228 roadmaps, 2122 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Elaboration and probe.** `lake env lean` on `Suggested.lean` gives exactly 13 `sorry` warnings
and nothing else. I made a scratch copy with each of the 13 `sorry`s replaced by
`first | (simp; done) | rfl | infer_instance | (exact?; done) | sorry` and elaborated it: no errors
and 13 `sorry` warnings, so no theorem closes in one tactic. The only Lean change since f4dbe70 is
the section comment, so the 16 elaborated types equal those in the previous report.
`compactCharacter` keeps only `[CommGroup G] [TopologicalSpace G]`, which is all its body uses.

**Renamed supplier names: all 11 resolve at the pinned Tau Ceti.** I elaborated a scratch file
that imports the nine pinned modules and `#check`s each name. All 11 elaborate:

- `ContRepresentation.gramOperator` (`Compact/Unitarizable.lean:122`) and `.isUnitarizable` (:241).
  Both are in `namespace ContRepresentation` (:65) at the root.
- `.exists_isUnitary_congr` (`Compact/UnitaryModel.lean:88`).
- `.IsUnitary` (`Continuous/Unitary/Basic.lean:49`).
- `.IsUnitary.exists_orthogonal_irreducible_decomposition` (`Continuous/OrthogonalDecomposition.lean:192`).
- `.matrixCoeff` (`Continuous/MatrixCoefficient.lean:70`) and `.matrixCoeffLp`
  (`Compact/MatrixCoefficient.lean:72`).
- `.schur_orthogonality_self` and `.schur_orthogonality_basis`
  (`Compact/SchurOrthogonality.lean:104, 122`), which take `hunitary : IsUnitary π` and
  `hirr : … IsIrreducible`, as the README says.
- `.exists_linearIsometryEquiv_congr_eq` (`Continuous/Unitary/Equivalence.lean:51`).
- `.exists_eq_smul_one_of_isIrreducible` (`Continuous/Schur.lean:86`), the unchanged control.

**§1.2, the sentence the diff touches** (`README.md` line 433). The pinned
`exists_linearIsometryEquiv_congr_eq` needs `[RCLike 𝕜] [IsAlgClosed 𝕜]`, unitary `π` and `ρ`, and
irreducible finite-dimensional `π`. These hold for §1.2's complex irreducible case. Its proof sets
`e = (√‖c‖)⁻¹ • T` where `T†T = c·1` (Equivalence.lean lines 66–117).

Take `T = id` from `(V, h₁)` to `(V, h₂)` with `h₂ = c·h₁`. Then `T† = c·I`, so the theorem's
isometry is `c^(-1/2)·I`, which is the README's map. At `c = 4`: `e = I/2` and
`h₂(v/2, v/2) = 4·(1/4)·h₁(v, v) = h₁(v, v)`. This matches the README's own Check
"h₂(v/2,v/2)=h₁(v,v)". The comparison of normalisations that §1.2 asks for is therefore consistent.

**Seeded sample, where it falls in the change.**

- §1.2: Knapp, Corollary 4.9, p.240 (`Knapp2021` lines 10115–10120, on file page 258 = printed
  page 240) is read from the author's legal edition. It states that an intertwiner of a
  finite-dimensional irreducible representation is scalar. That is the input §1.2 names.
- §4.1: only the matching Lean section comment changed. Conway is under Not verifiable.
- The other sampled targets (§§0.1, 0.2, 1.1, 1.3, 2.1, 3.1, 6.1, 6.2, 6.4, 6.6, 6.8, 6.9, 7.1) are
  in passages the diff leaves untouched. Their locator checks are carried from the previous report.

**Citations, ownership, overlaps.** The changed passages cite no other roadmap and own no new
object. Run against main 8101f2c and 437 open heads, `roadmaps resolve` finds no unresolved
citation or name in the README. The overlap report lists no open pull request that changes this
roadmap, no dropped id and no id only an open revision defines.

**Adversarial table.** The new rows (marked "new") cover the passages the diff changes. Every other
row is carried from the previous report (f4dbe70), whose statements the diff leaves untouched.

| Statement | Instances | Values | Result | Row |
| --- | --- | --- | --- | --- |
| §1.2 sentence: compare `exists_linearIsometryEquiv_congr_eq` with the scalar map | `h₂ = c h₁`, `T = id`; `c = 4`; `c = 1` | `T†T = c`, `e = c^(-1/2) I`; `e = I/2`, `h₂(v/2,v/2) = h₁(v,v)`; `e = I` | consistent | new |
| From Tau Ceti: 10 renamed names | `#check @ContRepresentation.<name>` at the pin; the `TauCeti.`-prefixed form | 10 of 10 elaborate; the prefixed form was "Unknown identifier" at f4dbe70 | correct | new |
| Lean Layer 4 section comment | compared with README `## Layer 4` | `characters of arbitrary products` on both sides | agree | new |
| `positive_selfIntertwiner_existsUnique_scalar` (§1.2) | `T = 2I` on ℂ; `V = 0`; trivial ℂ² with `diag(1,2)` | `⟪1,2⟫ = 2 > 0`, `c = 2`; `V = 0` and ℂ² fail `IsIrreducible` | holds | f4dbe70 |
| §1.1 Gram convention | `T = 2I`, `h(1,i)`; swap on ℂ² with `diag(1,2)` | `2i` (wrong slot `−2i`); `h(πe₁,πe₁) = 2 ≠ 1` | Checks correct | f4dbe70 |
| §1.3 block change | `U = diag(1,i)`, `A = [[1,1],[1,2]]` | `UAU† = [[1,−i],[i,2]]`; `U†AU = [[1,i],[−i,2]]` | correct | f4dbe70 |
| §0.1 comparison | C₃ character ω | tensor square ω², dual ω⁻¹ = ω², original ω | Checks correct | f4dbe70 |
| §0.2 norm identity | two points of mass 1/2, `k = 1`; `k(1,2) = i`; `μ = 0` | `1 = 4·1/4`; entry `i/2`, both sides `1/4`; `0 = 0` | holds | f4dbe70 |
| `gFiniteSubmodule_dense` (§2.1) | `E = 0`; rotations on `C(S¹)`; ℤ on `ℓ²(ℤ)`; S₃ covariance | dense; `‖R_θ − 1‖ = 2`, orbit maps continuous; non-compact, excluded; `(12)(23) = (123)` | holds | f4dbe70 |
| `secondCountable_iff…`, `separable_L2_iff…` (§3.1) | trivial group; `Circle^J`, J uncountable | both sides true; `‖χ_j − χ_k‖² = 2`, both sides false | hold | f4dbe70 |
| `character_finite_coordinates`, `exists_productDualEquiv`, `circleProduct_character` (§4.1) | `J = ∅`; `Circle²`, `(1,−1)` at `(i,−1)`; `S₃ × C₃`; `J = ℕ` at the constant tuple −1 | trivial; `i·(−1)⁻¹ = −i`; `sign·ω ↦ −ω`; `χ_n = −1` for all n | hold | f4dbe70 |
| `exists_irrepClass_characterEquiv`, `compactCharacter_span_dense`, `exists_characterBasis` (§5.1) | trivial group; Circle at `i`; C₃; `f = c_χ + 2c_ψ` | one class; scalar `i`, coefficient `−i`; `(1+ω+ω²)/3 = 0`; `1 + 4 = 5` | hold | f4dbe70 |
| §6.1 formal character | `z ↦ z⁻¹` at `i`; trivial ℂ²; `−e⁰` | weight −1, trace `−i`; `2e⁰`, trace 2; no representation | correct | f4dbe70 |
| §6.2 `ℓ_χ`, `λ_χ` | Circle, `χ = zⁿ`; functional 1/2; `χ = z⁻¹`, `θ = π/2` | `ℓ_χ(2π) = 2πn`; `exp(iπ) = −1`; `−i` (without the factor i: `exp(−π/2)`) | correct | f4dbe70 |
| §6.4 left Weyl action | `(w₁w₂)·χ` versus `w₁·(w₂·χ)`; SU(3), `s₁ = (12)`, `s₂ = (23)`; wall weight `(1,1,0)` | both `χ((n₁n₂)⁻¹ t n₁n₂)`; `(s₁s₂)·e₁ = e₂`, `(s₂s₁)·e₁ = e₃`; orbit of size 3 | correct | f4dbe70 |
| §6.5 coroot and dominance | SU(2): `α_ℝ∨ = diag(i,−i)`; `χ = zⁿ`; `λ(H) = 1/2`; U(2) kernel `(−1,−I)` | `H = −i·α_ℝ∨ = diag(1,−1)`, `α(H) = 2`; `λ(H) = ℓ_χ(α_ℝ∨) = n`; value `iπ ∉ 2πiℤ`; `(−1)^(q−a)`: `(1,1)` descends, `(0,1)` does not | correct | f4dbe70 |
| §6.6 descent | SU(2) → SO(3), weights 1, 2; U(2), `(1,0)` and `(2,1)` at `z = i` | `−I ↦ −1, +1`; central scalars `i`, `i³ = −i` | correct | f4dbe70 |
| §6.7 orbit-sum expansion and basis | trivial group; Circle; SU(2), `χ₂`; `t² + t⁻²` | ℤ; `tⁿ`; `(t² + t⁻²) + 1`; `χ₂ − χ₀`, a negative coordinate | correct | f4dbe70 |
| §6.8 U(n) congruence | U(3), `λ = (2,1,−1)`; `(1,0)` with `q = 0`; U(2) | `q = 2`, `a₁ + 2a₂ = 5 ≡ 2`; `ζ⁻¹ ≠ 1`; `t₁t₂·(t₁t₂)⁻¹ = 1` | correct | f4dbe70 |
| `u2_weight_character_iff` (§6.9) | `f = 0`; `(2,0),(1,1),(0,2)` with `1,2,1`; `(1,−1),(−1,1)`; `det⁻¹` at `diag(i,−1)` | `n = 0`; differences 1, 1, dimension 4; `1 ≤ 0` fails at `(0,0)`; trace `i` | holds, both directions | f4dbe70 |
| `su2_multiplicities_and_faithfulness`, `exists_su2_of_multiplicities` (§7.1) | `n = 0`; `Sym¹`; `Sym²` at `−I`; `n = 2, 3, 4` | `m = 0`, not injective; kernel `{I}`; `(−1)² = 1`, kernel `{±I}`; `p − p_odd = 1, 1, 3` | hold | f4dbe70 |

**Headline theorems** are unchanged since f4dbe70.

- Stated in `Suggested.lean`: §1.2, §2.1, §3.1 (two), §4.1 (three), §5.1 (three), §6.9 and §7.1
  (two).
- Named in the docstring as not statable: the Layer 6 classification and formal-character basis,
  the §1.3 comparison and the §0.2 norm identity.
- No declaration is padding (probe above).

**Remark** on untouched text (no change requested). At the pin, `gramOperator` and
`isUnitarizable` assume compact `G` and `[CompleteSpace V]` (Unitarizable.lean lines 96–98), not
finite dimension. The README's "for finite-dimensional actions" (line 162) describes the case it
consumes, not the pin's generality.

## Not verifiable

- Conway, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (§§4.1 and 5.1). It is behind
  the publisher's paywall, and the README records it as a locator-only (uncertified) citation. The
  statements were checked by computation (table rows for §§4.1 and 5.1).

## Source issues

- none
