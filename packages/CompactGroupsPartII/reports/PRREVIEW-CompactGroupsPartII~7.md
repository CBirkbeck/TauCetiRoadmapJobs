# Review of CompactGroupsPartII (pull request #1047 at 562ebbd)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 45 README lines changed since `7f7f06f`. The changed passages are correct and introduce no new problem. The two findings are the previous report's R01 and R02, both P3 and neither blocking: the family index and the pull-request description are unchanged at this head.

Unless another path is given, README locations refer to `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md`.

## R01 (P3) — The family index still describes a representation ring and a highest-weight supplier

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:52–53`: “global forms and representation rings, and unitary SU(2) actions”; lines 99–102: “for its global forms the Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral classification”.

**Claim.** These two entries describe this roadmap's scope and the suppliers of its global-form layer.

**Witness.** README:63 says the roadmap constructs no “Grothendieck ring of representations and no target here uses that carrier”. README:324 says “The semisimple highest-weight theory is consumed through the Mathlib and Tau Ceti declarations”. `git diff 7f7f06f HEAD` does not touch the index.

**Repair.** In the first entry, replace “representation rings” by “their formal characters”. Rewrite the dependency line so that the global forms use the Lie-groups roadmap's compact structure, maximal tori, real roots and covers, ConvexityToric T1's period dictionary, BanachSpaceTheory B5 and OperatorIdeals Part C, with the highest-weight modules coming from the pinned libraries. Tested on the refuting instance: §6.7's object is a ℤ-basis of `ℤ[X]^W` (for SU(2), `t²+1+t⁻²` and `1`, README:1323), not the ring R(G) that TopologicalKTheory T6 owns (README:60).

## R02 (P3) — The description still names the representation ring, and it reports the index defect instead of repairing it

**Location.** Pull-request description. (a) The generated block `roadmap-summary` reads “the representation ring of a compact connected group with its restriction to a maximal torus” and “the highest-weight roadmap's dominant integral classification”. (b) The author text reads “Both wordings are inaccurate: the scope is global forms and their formal characters … The roadmap README is the authority on both points.”

**Claim.** (a) states the scope and the supplier route. (b) describes a known defect in a file that the pull request itself changes.

**Witness.** (a) is contradicted by README:63 and README:324, as in R01. (b): the two index lines it calls inaccurate are still at `RepresentationTheory/README.md:53` and `:101` at this head.

**Repair.** Regenerate the `roadmap-summary` block from the head so that it names the formal-character basis of the Weyl invariants and the actual suppliers (LieGroups Layers 0, 2–5, 5A, 6 and 7; ConvexityToric T1; pinned highest-weight modules). Once R01 is applied, replace paragraph (b) with one sentence saying that the family index gains the Part II entry and a dependency line.

## Previous findings

- R01 — not repaired: `RepresentationTheory/README.md:52–53` still reads “global forms and representation rings, and unitary SU(2) actions”, and lines 99–102 still name “the highest-weight roadmap's dominant integral classification”.
- R02 — not repaired: the `roadmap-summary` block still names “the representation ring of a compact connected group”, and the author text still says “Both wordings are inaccurate”.

Both remarks the previous report made on untouched text (the `gramOperator` contract's “for finite-dimensional actions”, and Layer 0's thin `### Dependencies`) are answered by this head; see below.

## Verified sound

**Scope.** I read the diff `7f7f06f..562ebbd`: one file, the roadmap README, 36 insertions and 9 deletions in seven hunks. I read every changed passage and the text that cites it (§0.1, §1.2, §1.3, §2.1 and the *Needs* lines of §§6.1–6.9). `Suggested.lean` and the family index are unchanged since `7f7f06f`. `git diff --stat origin/main...HEAD` lists three files: the two roadmap files and the family index, which this nested pull request owns. The library checkouts are at the manifest pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).

**Gate.** The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `statement-hygiene=0`, `outside-folder=0`). The dependency check, run for this review, printed:

```text
depcheck: 233 roadmaps, 2109 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line.

**Lean.** `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else. The file is byte-identical to the one the previous report probed (16 declarations, `#check @name` types compared with the README, one-tactic probe leaving all 13 theorems open), so those results carry over. The one “lost binder” lead in the tool's signature list is `compactCharacter`, which the previous report settled: its body is a real composition and needs only `CommGroup` and `TopologicalSpace`. The headline list is unchanged: §§1.2, 1.3, 2.1, 3.1, 4.1, 5.1, 6.5–6.7, 6.9 and 7.1, with the three that are not statable named in the module docstring.

**Declarations opened at the pins for the changed passages (7 files):**

| Pin and file | What it says, compared with the changed README text |
| --- | --- |
| Tau Ceti `RepresentationTheory/Compact/Unitarizable.lean:97–100,122–125,241–245` | Section variables: `RCLike 𝕜`, a compact topological group with `MeasurableSpace` and `BorelSpace`, `InnerProductSpace 𝕜 V`, `CompleteSpace V`, and `hπ : Continuous π` into `V →L[𝕜] V`. There is no `FiniteDimensional`. `isUnitarizable` gives a self-adjoint S with `re⟪Sv,v⟫>0` for v≠0 and `(πg)†S(πg)=S`. README:172–177 now says exactly this. |
| Tau Ceti `Compact/UnitaryModel.lean:72–89` | `exists_isUnitary_congr` adds `FiniteDimensional 𝕜 V` and returns `e : V ≃L[𝕜] V` with `IsUnitary (congr e π)`. This matches README:177–180. |
| Tau Ceti `Continuous/Unitary/Equivalence.lean:40–54` | `exists_linearIsometryEquiv_congr_eq`: `RCLike 𝕜`, `IsAlgClosed 𝕜`, any `Group G`, V finite-dimensional, W only an inner-product space, both representations unitary, the source irreducible, and an `Equiv π ρ`; it returns `e : V ≃ₗᵢ[𝕜] W` with `congr e π = ρ`. README:211–215 states these hypotheses; it does not claim the target is assumed finite-dimensional. |
| Tau Ceti `Continuous/Intertwining.lean:153–157` | `nonempty_equiv_iff`, for finite-dimensional Hausdorff representations. §0.1's prose already used it (README:364); the *Needs* line and Layer 0's Dependencies now list it. |
| Tau Ceti `Continuous/Integrated/Basic.lean:144,181,191,211,437` | `integratedOperatorL1`, `integratedOperatorL1_toL1`, `norm_integratedOperatorL1_le`, `comp_integratedOperatorL1` (needs `CompleteSpace E`) and `tendsto_integratedOperatorL1_apply`. These are the “bound, covariance and convergence” that Layer 2's Dependencies now names. |
| Tau Ceti `Geometry/Hodge/Conjugation.lean:106,137–141` | `complexificationConjugation` on `ℂ ⊗[ℝ] V`; `map_eigenspace_baseChange` sends the z-eigenspace of `f.baseChange ℂ` to the `conj z`-eigenspace. Layer 6's Dependencies cites both, as §6.3 does. |
| Tau Ceti `Compact/Convolution.lean:320` | `TauCeti.convolutionOperator` of a continuous function, cited by §0.2 and now by Layer 0's Dependencies. |

**The four Dependencies paragraphs against the *Needs* lines of their layers.** Every item the new paragraphs name is used by a *Needs* line of that layer, and no item points to a later layer.

| Layer | Items named in Dependencies | Items of the *Needs* lines | Outcome |
| --- | --- | --- | --- |
| 0 (README:458–473) | 11 pinned names, the base roadmap's comparison targets, OperatorIdeals Part C, five Mathlib groups | §0.1: 11 names plus `LinearMap.continuous_of_finiteDimensional`; §0.2: 3 names, OI-C01–OI-C11, Stone–Weierstrass, Fubini, Parseval | all covered; the Mathlib continuity lemma appears as “topology” |
| 1 (README:598–604) | 3 pinned names, unitarization, complete reducibility, scalar Schur | §1.2: `exists_eq_smul_one_of_isIrreducible` and the unitary-intertwiner comparison; §1.3's finite-group paragraph: the two `Compact/Finite.lean` names | all covered |
| 2 (README:691) | `integratedOperatorL1` with bound, covariance, convergence | §2.1: the same four names and `representativeStarSubalgebra_dense` | all covered |
| 6 (README:1442) | §0.1, §4.1's `circleProduct_character`, Layer 5, the Hodge conjugation pair, `AddMonoidAlgebra`, LieGroups Layers 0, 2–5, 5A, 6, 7, ConvexityToric T1 | §§6.1–6.9 | the cross-layer edges 6→0, 6→4 and 6→5 of §§6.1–6.2 are now stated at layer level; Mathlib scalar extension (§6.3), scalar Schur (§6.6) and exterior powers (§6.8) stay item-level in their *Needs* lines, which is where an implementer reads them |

**Sources: the seeded sample.** No README locator is flagged unverified, and the diff changes no source locator.

| Sampled target | Changed here? | Outcome |
| --- | --- | --- |
| §0.1 tensor and dual compatibility | *Needs* line only | The added name `ContRepresentation.nonempty_equiv_iff` was opened above. The target has no textbook locator. |
| §§1.1, 1.3 | only Layer 1's Dependencies | No statement or locator changed; the three names were opened above. |
| §2.1 | only Layer 2's Dependencies | As above. |
| §§6.1, 6.3–6.7, 6.9 | only Layer 6's Dependencies | As above. |
| §§0.2, 3.1, 4.1, 5.1 | no | Carried from the previous reports' sample tables. |

**Ownership and overlaps.** `scratch/overlaps.md` lists no competing change, no dropped id and no id defined only by an open revision; the citation resolver lists no unresolved roadmap citation or Lean name. The diff adds no target, so no new ownership question arises.

**Adversarial mathematics.** The first five rows are computed for the passages this diff changes. The remaining rows are carried from the previous report (r6), which computed their values; the statements are untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: `gramOperator`, `isUnitarizable` with no finite dimension | trivial group on ℓ²; C₂ on ℂ² by `π(s)=[[1,1],[0,−1]]`; rotations on L²(S¹) | `S=I` on ℓ²; `π(s)²=I`, `π†π=[[1,1],[1,2]]`, `S=(I+π†π)/2=[[1,1/2],[1/2,3/2]]`, det 5/4, trace 5/2, and `π†Sπ=(π†π+I)/2=S`; `‖R_θ−I‖=2` for irrational θ, so the operator-norm hypothesis excludes it | hypotheses as at the pin; infinite dimension admitted | none |
| Contract: `exists_isUnitary_congr` | the same C₂ action | S positive definite, so some A has `A†SA=I` and `A⁻¹π(s)A` preserves the inner product; `π(s)` itself does not: `‖π(s)e₂‖²=2≠1` | conjugation needed and supplied | none |
| Contract: `exists_linearIsometryEquiv_congr_eq` | C₃ character ω on ℂ with φ=2·id; φ=2i·id | `e=φ/|φ|` is id, resp. i·id, an isometry, and `e∘ω∘e⁻¹=ω`; φ itself has norm 2 and is not an isometry | the rescaling is the content; hypotheses as at the pin | none |
| Layer 6 Dependencies: conjugation pair | rotation J on ℝ², `v=e₁−ie₂` | `Jv=e₂+ie₁=iv`; the conjugate `e₁+ie₂` has `J(e₁+ie₂)=−i(e₁+ie₂)` | eigenvalue i goes to −i, as `map_eigenspace_baseChange` says | none |
| Layer 2 Dependencies: bound and covariance | trivial action with a weight of mass 2; S₃ regular, h=(12), t=(23) | `T_f v=2v`; `π(h)T_{6δ_t}=π(ht)`, `ht=(123)≠(132)` | agrees with §2.1's Checks | none |
| Contract: `tprod` acts by π(g)⊗ρ(g) (r6) | 2I, 3I; C₃; V=0 | `6(1⊗1)`; `ω²`; 0 | matches | none |
| §0.1 tensor character (r6) | g=1 on ℂ²⊗ℂ³; S₃ standard ⊗ sign | `6=2·3`; `−1`, `0` | true via `char_tensor` | none |
| §0.1 dual as `linHom` into the line (r6) | C₃; S₃ | `ω⁻¹=ω²`; `χ(c⁻¹)=−1` | cited | none |
| §0.1 inner-product models (r6) | C₂ swap with `v̄₁w₁+2v̄₂w₂` | averaged form `(3/2)(v̄₁w₁+v̄₂w₂)` | both models exist | none |
| §1.3 `inner_gramOperator_eq_inv_mul_sum`, `integral_haarProb` (r6) | C₃ trivial; C₂ swap, diag(1,2); F=δ₁ | `(1/3)·3h=h`; `T=(3/2)I`; `1/3` | true | none |
| Conventions: coefficient versus trace (r6) | scalar circle action at i | −i; i | conjugate | none |
| §0.2 norm identity (r6) | two points of mass 1/2 | `1=4·1/4`; `1/4=1/4`; `0=0` | equal | none |
| §1.1 Gram form (r6) | T=2I; T=0; swap | 2i; not positive; 2≠1 | fixed | none |
| §1.2 `positive_selfIntertwiner_existsUnique_scalar` (r6) | ℂ, 2I; trivial ℂ²; V=0 | c=2; reducible; excluded | true | none |
| §1.3 block change (r6) | U=diag(1,i), A=[[1,1],[1,2]] | entry (1,2): −i versus +i | direction fixed | none |
| §2.1 `IsGFinite`, `gFiniteSubmodule`, `gFiniteSubmodule_dense` (r6) | 0; 𝔽₂; C(S¹); ℓ²(ℤ) | dimensions 0, 1, 2, ∞; `‖R_θ−I‖=2` | as defined | none |
| §3.1 two Lean headlines (r6) | trivial; C₃; `Circle^J`, J uncountable | true, true, false on both sides | agree | none |
| §4.1 `character_finite_coordinates`, `exists_productDualEquiv`, `circleProduct_character` (r6) | empty J; `Circle²` at (i,−1); n=±1 at i | 1; −i; −i versus i | true | none |
| §5.1 `exists_irrepClass_characterEquiv`, `exists_characterBasis`, `compactCharacter_span_dense` (r6) | C₃; trivial group; Circle at i | 3 classes; 1; `(1+ω+ω²)/3=0` | true | none |
| §6.1 formal character (r6) | `z↦z⁻¹`; trivial ℂ² | −i at i; `2e⁰` | pinned | none |
| §6.2 period map (r6) | Circle, `zⁿ` | `ℓ(2π)=2πn` | T1 normalization | none |
| §6.4 Weyl action (r6) | SU(3), s₁ s₂ | `e₂` versus `e₃` | left action | none |
| §6.5 `Y = Q∨`, cover and descent (r6) | SU(2); SO(3); U(2) | `exp(πα∨)=−I`; `(1/2)ℤα∨`; `(−1)^(q+a)` | needs simple connectedness | none |
| §6.6 descent (r6) | SU(2)→SO(3), weights 1, 2 | −I acts by −1, +1 | central character | none |
| §6.7 basis (r6) | SU(2) | `χ₂=m₂+m₀` | integral basis | none |
| §6.8 U(n) congruence (r6) | U(3), λ=(2,1,−1) | `5≡2 mod 3` | as stated | none |
| §6.9 `u2_weight_character_iff` (r6) | (2,0),(1,1),(0,2); δ at (1,0); f=0 | dimension 4; fails symmetry; n=0 | both directions | none |
| §7.1 `su2_multiplicities_and_faithfulness`, `exists_su2_of_multiplicities` (r6) | n=0; Sym¹⊕Sym¹; Sym² | m=0; kernel {I}; kernel {±I} | true | none |

No counterexample to any changed passage was found.

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (§§4.1, 5.1): the manifest records it as uncertified (paywalled), so it is cited by locator alone. This change does not touch it.
- Ownership against board packages: the board lists no package that plans compact-group representation theory. Open pull requests were searched through the roadmap index of 2026-11-10 only.

## Source issues

- none
