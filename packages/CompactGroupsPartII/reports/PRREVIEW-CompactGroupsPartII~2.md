# Review of CompactGroupsPartII (pull request #1047 at f4dbe70)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

Four findings, all P3, none blocking. The gate passes at this head, the thirteen sorried theorems
survive the one-tactic probe, the dependency check reports no problem, and every sampled locator
that can be read legally is correct. The mathematics of the rewritten Layer 6 was recomputed and
no statement was refuted. What remains is text: ten supplier names with a namespace prefix the pin
does not have, and three places that still describe the roadmap as it was before the repair.

**The previous review's findings at this head.**

- R01 (representation ring): repaired in the folder. `README.md` lines 56–61: "this roadmap
  constructs no Grothendieck ring of representations and no target here uses that carrier";
  §§6.1, 6.7 and 6.8 are stated in `AddMonoidAlgebra ℤ X`. The family index was not updated: R02
  below.
- R02 (compact structure theory): repaired. `README.md` lines 991–1008: "The following are
  supplied and are not targets here. LieGroups Layer 5A … Layer 6 (compact real roots and the Weyl
  comparison) … Layer 7 (compact semisimple integration)".
- R03 (period lattice): repaired. Lines 886–887: "The 2π-normalized period and weight dictionary
  of T is ConvexityToric T1 and is not proved again here"; lines 1034–1042 read the two lattice
  statements off ConvexityToric T1 and LieHighestWeight Layer 10.
- R04 (LieHighestWeight Layers 1, 2, 4): repaired. The README cites only Layers 7, 9 and 10 of
  LieHighestWeight, which the open revision of that roadmap keeps, and the pinned declarations by
  name (lines 234–253, 275–277).
- R05 (docstring and supplier list): repaired. `Suggested.lean` lines 18–28 name the root
  characters, the finite central cover and the integral operator of a continuous kernel as the
  missing carriers; the README lists the Hilbert–Schmidt and torus declarations (lines 215–233).
- R06 (control theorem): repaired. The theorem and both instances are gone; §3.1 line 640 says the
  circle product "is their instance at `G_J` and is not a separate signature".
- R07 (`diag(−1,1,1)`): repaired, lines 977–979.
- R08 (page range, process word): repaired, lines 105–107 and 1421.

## R01 (P3) — ten supplier names carry a `TauCeti.` prefix that the pinned declarations do not have

**Location.** `README.md` lines 161–174 and 433: `TauCeti.ContRepresentation.gramOperator`,
`.isUnitarizable`, `.exists_isUnitary_congr`, `.IsUnitary`,
`.IsUnitary.exists_orthogonal_irreducible_decomposition`, `.matrixCoeff`, `.matrixCoeffLp`,
`.schur_orthogonality_self`, `.schur_orthogonality_basis`, `.exists_linearIsometryEquiv_congr_eq`.

**Claim.** These are the names of the pinned declarations.

**Witness.** At the pinned Tau Ceti the ten files open `namespace ContRepresentation` at the root
(for example `TauCeti/RepresentationTheory/Compact/Unitarizable.lean:65`,
`…/Continuous/Unitary/Equivalence.lean:38`). `#check @TauCeti.ContRepresentation.gramOperator`
gives "Unknown identifier" for all ten; `#check @ContRepresentation.gramOperator` elaborates for
all ten. `Suggested.lean` line 253 already writes `_root_.ContRepresentation.IsUnitary`.

**Repair.** Drop the `TauCeti.` prefix from these ten names, as the README already does for
`ContRepresentation.exists_eq_smul_one_of_isIrreducible`, `ContRepresentation.integratedOperatorL1`
and the Frobenius–Schur names. Checked on the refuting instance: the ten names without the prefix
elaborate against the imports of `Suggested.lean`.

## R02 (P3) — the family index still describes representation rings and a highest-weight supplier

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md` lines 52–53: "global forms and
representation rings, and unitary SU(2) actions"; lines 100–102: "the Lie-groups roadmap's maximal
tori and coverings and the highest-weight roadmap's dominant integral classification".

**Claim.** The index describes this roadmap and its suppliers.

**Witness.** `README.md` lines 58–61: no Grothendieck ring is constructed and Layer 6 states its
results on formal characters. Lines 275–277: the highest-weight theory "is consumed through the
Mathlib and Tau Ceti declarations listed above, not through a layer of LieHighestWeight"; only
Layer 10 of that roadmap is a supplier, and ConvexityToric T1 and OperatorIdeals Part C are
suppliers the index does not name. The pull request description itself says the line "should
read" otherwise.

**Repair.** Line 52–53: "global forms and their formal characters, and unitary SU(2) actions".
Lines 99–102: "… and for its global forms the Lie-groups roadmap's compact structure theory,
maximal tori and coverings, ConvexityToric's period dictionary of a torus and the highest-weight
roadmap's coroot-lattice comparison for simply connected compact groups; OperatorIdeals supplies
Hilbert–Schmidt operators."

## R03 (P3) — the generated summary block of the description describes the earlier roadmap

**Location.** Pull request description, block `roadmap-summary`: "the representation ring of a
compact connected group with its restriction to a maximal torus and the classical global forms"
and "The global forms use the Lie-groups roadmap's maximal tori and coverings and the
highest-weight roadmap's dominant integral classification."

**Witness.** The head constructs no representation ring (`README.md` lines 56–61) and consumes
the dominant integral classification from the pinned declarations, not from a layer of the
highest-weight roadmap (lines 275–277). The author's own text above the block is correct.

**Repair.** Regenerate the block from the head, so that it agrees with the paragraphs above it:
"for a compact connected Lie group, the finite central cover, the classification of irreducible
representations by dominant characters of a maximal torus, the formal-character basis of the
Weyl invariants, and the classical global forms".

## R04 (P3) — the Layer 4 section comment of `Suggested.lean` has a different title from the README

**Location.** `Suggested.lean` line 139: `/-! ## Layer 4: duals of arbitrary products -/`.

**Witness.** `README.md` line 665: `## Layer 4: characters of arbitrary products`. The six other
section comments repeat the README titles exactly.

**Repair.** Use one title in both files (either one; "duals of arbitrary products" is also the
wording of the module docstring).

## Verified sound

**Gate, build, dependency check.** The worker's gate at f4dbe70 passes every check, the targeted
build included. Dependency check output: `depcheck: 229 roadmaps, 2144 edges, 0 problem(s)` (no
UPWARD or CYCLE line). Outside the folder the pull request changes only the family index
`TauCetiRoadmap/RepresentationTheory/README.md` (eight added lines; see R02).

**One-tactic probe and signatures.** A scratch copy of `Suggested.lean` with every `sorry`
replaced by `first | (simp; done) | rfl | infer_instance | (exact?; done) | sorry` was elaborated
with `lake env lean`: no error, 13 `sorry` warnings, so none of the 13 theorems closes. The 16
elaborated types were compared with the README statements. `compactCharacter` keeps only
`[CommGroup G] [TopologicalSpace G]`, which is all its body needs; every theorem carries its
hypotheses in its own signature or in the section it sits in. The description's count (three
definitions, thirteen theorems) is right. The library near-matches contain no statement of a
target (the closest, Mathlib `span_fourier_closure_eq_top`, is the single circle).

**Sources (sample; Knapp2021 file page = printed page + 18).** Read at the locator:
Prop. 4.8 and Cor. 4.9, p.240 (Knapp2021 lines 10109–10120; §§1.2, 1.3); Thm 4.29, pp.250–251
(line 10549; closed derived subgroup, commuting product); Prop. 4.58, pp.264–265 (lines
11115–11136; conditions (i)–(ii), "analytically integral"); Prop. 4.59, p.265 (lines 11137–11141;
integrality in the form `2⟨λ,α⟩/|α|²`); Prop. 4.67, p.267 (line 11241; index equals the order of
the covering kernel); Thm 5.107, p.334 (line 14142); the dominance remark on p.335 (lines
14200–14202: dominance depends only on the derived Cartan); Thm 5.110 and its proof, pp.335–336
(lines 14203–14247; the uniqueness argument uses the central scalar and the derived highest
weight, as §6.6 says). Knapp descends from the universal cover `ℝⁿ × G̃_ss`; the README's finite
cover `Z(K)⁰ × K_der,sc` is its own route and is stated as a target, not attributed. Etingof2024
§37.1 p.199 (lines 6–11) and Thm 37.5 p.202 (lines 151–152), both under a countable base, as
§3.1 says; the notes end on p.203 (line 219). §§0.1, 0.2, 1.1, 2.1, 6.4, 6.8, 6.9 and 7.1 attribute
nothing to a source beyond these and are presented as deductions.

**Library declarations opened at the pins (71).** All names of "From Tau Ceti" exist at the pin
(ten under a different namespace: R01). Statements read: `TauCeti.formalCharacter_eq_orbitSum_add_lower`
(`TauCeti/Algebra/Lie/HighestWeight/OrbitSum.lean:89`: for a finite-dimensional module generated
by a highest weight vector, `ch M = m_lam + Σ c_mu m_mu` over dominant integral `mu ≠ lam` below
`lam`; it needs `IsAlgClosed K` and a finite Weyl group, both true for the complexified derived
pair); `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`
(`…/HighestWeight/Existence.lean:234`); `TauCeti.finiteDimensional_irreducibleQuotient_of_isDominantIntegral`
(`…/FiniteDimensional.lean:136`); `TauCeti.IsDominantIntegral` (`…/Basic.lean:286`: natural-number
values on the simple coroots; no integrality on other coroots is part of the definition);
`TauCeti.formalCharacter_coeff_weylGroup_smul` (`TauCeti/Algebra/Lie/Weights/FormalCharacter.lean:498`);
`TauCeti.Lie.IsTorus` and `IsMaximalTorus` (`TauCeti/Geometry/Lie/Subgroup/Torus.lean:82, 88`:
compact, connected, commutative; no closedness field);
`TauCeti.Lie.IsTorus.nonempty_continuousMulEquiv_pi_circle` (:241);
`TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient` (`…/Weyl/Finite.lean:194`);
`ContinuousLinearMap.hilbertSchmidtEnergy` (`…/HilbertSchmidt/Basic.lean:89`, takes the Hilbert
basis as an argument) and `hilbertSchmidtNorm` (:212); `TauCeti.convolutionOperator`
(`TauCeti/RepresentationTheory/Compact/Convolution.lean:320`, kernel `k(x·y⁻¹)`, as §0.2 writes).
The pinned `Geometry/Lie/Subgroup` has no root character of a compact group, so the docstring's
"not statable" list for Layer 6 is accurate.

**Cross-roadmap citations resolved (11).** On main: LieGroups Layer 5A (README lines 641–658:
invariant form, `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]`, negative-definite Killing form); LieGroups Layer 6, compact
real roots and the Weyl comparison (`t = z(g) ⊕ t_ss`, `dχ_α = iα`, multiplicity one, comparison
with `rootSystem`; its calibration `dν_alg(1) = −iα∨` agrees with `H_α = −i·α_ℝ∨` of §6.5);
LieGroups Layer 7, compact semisimple integration (lines 883–891: finite π₁, compact universal
cover); ConvexityToric T1 (lines 40–51: characters by `(1/i)dχ`, `α_χ(λ)/(2π) ∈ ℤ`, `2πα∨ ∈ ker exp`,
the central-isogeny comparison); LieHighestWeight Layer 10 (`Y = Q∨` in the simply connected
case; present on main and in the open revision of that roadmap, which also keeps Layers 7 and 9);
TopologicalKTheory T6 (owner of R(G), consumer of §2.1, not a supplier here); OperatorIdeals
Part C; AutomorphicFormsOnReductiveGroups §§2.1, 2.7; SmoothBanachRepresentations §4.1;
CharacteristicClasses §C5.1; Completed/OrthogonalL2Bases Part B. Ownership against the open pull
requests was checked with the roadmap search: no other roadmap states Banach G-finite density,
the product-dual theorem or the classification of irreducible representations of a compact
connected Lie group by dominant characters of a maximal torus (LieGroups Layer 7 only compares
that classification with the Lie-algebra one; ClassicalGroups states the theorem of the highest
weight for the classical Lie algebras). The overlap report lists no conflicting head and no
dropped id.

**Adversarial table.**

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `positive_selfIntertwiner_existsUnique_scalar` (§1.2) | `T = 2I` on ℂ; `V = 0`; trivial ℂ² with `diag(1,2)` | `⟪1,2⟫ = 2 > 0`, `c = 2`; `V = 0` and ℂ² fail `IsIrreducible` | holds |
| §1.1 Gram convention | `T = 2I`, `h(1,i)`; swap on ℂ² with `diag(1,2)` | `2i` (wrong slot `−2i`); `h(πe₁,πe₁) = 2 ≠ 1` | Checks correct |
| §1.3 block change | `U = diag(1,i)`, `A = [[1,1],[1,2]]` | `UAU† = [[1,−i],[i,2]]`; `U†AU = [[1,i],[−i,2]]` | correct |
| §0.1 comparison | C₃ character ω | tensor square ω², dual ω⁻¹ = ω², original ω | Checks correct |
| §0.2 norm identity | two points of mass 1/2, `k = 1`; `k(1,2) = i`; `μ = 0` | `1 = 4·1/4`; entry `i/2`, both sides `1/4`; `0 = 0` | holds |
| `gFiniteSubmodule_dense` (§2.1) | `E = 0`; rotations on `C(S¹)`; ℤ on `ℓ²(ℤ)`; S₃ covariance | dense; `‖R_θ − 1‖ = 2`, orbit maps continuous; non-compact, excluded; `(12)(23) = (123)` | holds |
| `secondCountable_iff…`, `separable_L2_iff…` (§3.1) | trivial group; `Circle^J`, J uncountable | both sides true; `‖χ_j − χ_k‖² = 2`, both sides false | hold |
| `character_finite_coordinates`, `exists_productDualEquiv`, `circleProduct_character` (§4.1) | `J = ∅`; `Circle²`, `(1,−1)` at `(i,−1)`; `S₃ × C₃`; `J = ℕ` at the constant tuple −1 | trivial; `i·(−1)⁻¹ = −i`; `sign·ω ↦ −ω`; `χ_n = −1` for all n | hold |
| `exists_irrepClass_characterEquiv`, `compactCharacter_span_dense`, `exists_characterBasis` (§5.1) | trivial group; Circle at `i`; C₃; `f = c_χ + 2c_ψ` | one class; scalar `i`, coefficient `−i`; `(1+ω+ω²)/3 = 0`; `1 + 4 = 5` | hold |
| §6.1 formal character | `z ↦ z⁻¹` at `i`; trivial ℂ²; `−e⁰` | weight −1, trace `−i`; `2e⁰`, trace 2; no representation | correct |
| §6.2 `ℓ_χ`, `λ_χ` | Circle, `χ = zⁿ`; functional 1/2; `χ = z⁻¹`, `θ = π/2` | `ℓ_χ(2π) = 2πn`; `exp(iπ) = −1`; `−i` (without the factor i: `exp(−π/2)`) | correct |
| §6.4 left Weyl action | `(w₁w₂)·χ` versus `w₁·(w₂·χ)`; SU(3), `s₁ = (12)`, `s₂ = (23)`; wall weight `(1,1,0)` | both `χ((n₁n₂)⁻¹ t n₁n₂)`; `(s₁s₂)·e₁ = e₂`, `(s₂s₁)·e₁ = e₃`; orbit of size 3 | correct |
| §6.5 coroot and dominance | SU(2): `α_ℝ∨ = diag(i,−i)`; `χ = zⁿ`; `λ(H) = 1/2`; U(2) kernel `(−1,−I)` | `H = −i·α_ℝ∨ = diag(1,−1)`, `α(H) = 2`; `λ(H) = ℓ_χ(α_ℝ∨) = n`; value `iπ ∉ 2πiℤ`; `(−1)^(q−a)`: `(1,1)` descends, `(0,1)` does not | correct |
| §6.6 descent | SU(2) → SO(3), weights 1, 2; U(2), `(1,0)` and `(2,1)` at `z = i` | `−I ↦ −1, +1`; central scalars `i`, `i³ = −i` | correct |
| §6.7 orbit-sum expansion and basis | trivial group; Circle; SU(2), `χ₂`; `t² + t⁻²` | ℤ; `tⁿ`; `(t² + t⁻²) + 1`; `χ₂ − χ₀`, a negative coordinate | correct |
| §6.8 U(n) congruence | U(3), `λ = (2,1,−1)`; `(1,0)` with `q = 0`; U(2) | `q = 2`, `a₁ + 2a₂ = 5 ≡ 2`; `ζ⁻¹ ≠ 1`; `t₁t₂·(t₁t₂)⁻¹ = 1` | correct |
| `u2_weight_character_iff` (§6.9) | `f = 0`; `(2,0),(1,1),(0,2)` with `1,2,1`; `(1,−1),(−1,1)`; `det⁻¹` at `diag(i,−1)` | `n = 0`; differences 1, 1, dimension 4; `1 ≤ 0` fails at `(0,0)`; trace `i` | holds, both directions |
| `su2_multiplicities_and_faithfulness`, `exists_su2_of_multiplicities` (§7.1) | `n = 0`; `Sym¹`; `Sym²` at `−I`; `n = 2, 3, 4` | `m = 0`, not injective; kernel `{I}`; `(−1)² = 1`, kernel `{±I}`; `p − p_odd = 1, 1, 3` | hold |

**Headline theorems.** Stated: the scalar metric classification (§1.2), Banach G-finite density
(§2.1), the two countability criteria (§3.1), the product dual and torus characters (§4.1), the
abelian character bijection, density and basis (§5.1), the U(2) criterion (§6.9), SU(2)
multiplicities, faithfulness and realization (§7.1). Named in the docstring as not statable: the
Layer 6 classification by dominant characters and the formal-character basis (no root characters
with a positive system, no finite central cover, no formal character of a continuous
representation at the pins), the multiplicity-space comparison (§1.3) and the continuous-kernel
norm identity (§0.2). No declaration of `Suggested.lean` is padding: none restates a definition,
mirrors a Check or closes in one tactic. `hunitary` in `su2_multiplicities_and_faithfulness` is
not needed for the statement's truth; it matches the README's "unitary SU(2) actions" and is not
raised.

## Not verifiable

- Conway, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (§§4.1 and 5.1): behind the
  publisher's paywall and recorded by the README as a locator-only citation; the exercise numbers
  were not checked. The statements were checked by computation (table above).
- Whether ConvexityToric T1's "finite-index lattice comparison under a central isogeny" is
  intended to include the equality of the index with the order of the kernel, which §6.5 reads
  off it, is not stated in T1 in so many words; its U(2) index-two Check is consistent with that
  reading.

## Source issues

- none
