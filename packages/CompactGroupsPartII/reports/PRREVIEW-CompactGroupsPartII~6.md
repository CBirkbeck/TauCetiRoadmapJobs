# Review of CompactGroupsPartII (pull request #1047 at 7f7f06f)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 56 README lines changed since `aafe102`. There are two findings, both P3 and neither blocking. Both are carried over from the previous report: the README repairs are correct, but the family index and the pull-request description were not updated to match them.

Unless another path is given, README locations refer to `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md`.

## R01 (P3) — The family index still describes a representation ring and a highest-weight supplier

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:52–53`: “global forms and representation rings, and unitary SU(2) actions”; lines 99–102: “for its global forms the Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral classification”.

**Claim.** These two entries describe this roadmap's scope and the suppliers of its global-form layer.

**Witness.** README:62–63 says that this roadmap constructs “no Grothendieck ring of representations and no target here uses that carrier”. README:314–317: “The semisimple highest-weight theory is consumed through the Mathlib and Tau Ceti declarations listed above”. Both index lines are unchanged since `aafe102`.

**Repair.** In the first entry, replace “representation rings” by “their formal characters”. Rewrite the dependency line so that the global forms use the following: the Lie-groups roadmap's compact structure, maximal tori, real roots and covers; ConvexityToric T1's period dictionary; BanachSpaceTheory B5; and OperatorIdeals Part C. The highest-weight modules come from the pinned libraries. Tested on the refuting instance: §6.7's object is a ℤ-basis of `ℤ[X]^W` (for SU(2), `t²+1+t⁻²` and `1`, README:1296), not the ring R(G) that TopologicalKTheory T6 owns (README:60).

## R02 (P3) — The description still names the representation ring, and it reports the index defect instead of repairing it

**Location.** Pull-request description. (a) The generated block `roadmap-summary` reads “the representation ring of a compact connected group with its restriction to a maximal torus” and “the highest-weight roadmap's dominant integral classification”. (b) The author text reads “Both wordings are inaccurate: the scope is global forms and their formal characters … The roadmap README is the authority on both points.”

**Claim.** (a) states the scope and the supplier route. (b) describes a known defect in a file that the pull request changes.

**Witness.** (a) is contradicted by README:62–63 and 314–317, as in R01. (b): the two index lines it calls inaccurate are still at `RepresentationTheory/README.md:53` and `:101` at this head.

**Repair.** Regenerate the `roadmap-summary` block from the head so that it names the formal-character basis of the Weyl invariants and the actual suppliers (LieGroups Layers 0, 2–5, 5A, 6 and 7; ConvexityToric T1; pinned highest-weight modules). Once R01 is applied, replace paragraph (b) with one sentence saying that the family index gains the Part II entry and a dependency line.

## Previous findings

- R01 — not repaired: `RepresentationTheory/README.md:52–53` still reads “global forms and representation rings, and unitary SU(2) actions”, and lines 99–102 still name “the highest-weight roadmap's dominant integral classification”.
- R02 — partly repaired: the gate sentence is gone (Validation now reads “The dependency check against the candidate merge order reports no problems”). The `roadmap-summary` block still names “the representation ring”, and the author text says “Both wordings are inaccurate”.
- R03 — repaired: README:187–204 cite `ContRepresentation.tprod`, `continuous_tprod`, `linHom`, `continuous_linHom`, `character_linHom`, `character_trivial`, `TauCeti.integral_haarProb` and `inner_gramOperator_eq_inv_mul_sum`. §0.1 (README:350–385) names the carriers, and §1.3 (README:565–569) cites the average.
- R04 — repaired: References (README:1502–1508) list Proposition 4.8, Corollary 4.9, Theorem 4.29, Propositions 4.58–4.59, Proposition 4.67, Theorem 5.107 and Theorem 5.110. These are exactly the eight locators the body cites (README:493, 523, 961, 1092, 1095, 1104, 1113, 1122).

## Verified sound

**Scope.** I read the diff `aafe102..7f7f06f`, which changes only the README, by 44 insertions and 12 deletions. I read every changed passage in full, together with the text that cites it: README:28, 330 and §6.1's *Needs* (README:933). `Suggested.lean` and the family index are unchanged since `aafe102` (`git diff aafe102 HEAD --stat`). No file outside the roadmap folder and the family index changed (`git diff --stat origin/main...HEAD` lists three files). The library checkouts are at the manifest pins (Tau Ceti `2fd255d`).

**Gate.** The worker's gate at this head passes every check. I also ran the brief's gate command myself, and it printed:

```text
gate CompactGroupsPartII: … depcheck=1 … outside-folder=1 … FAIL
  depcheck: NOT IN ORDER: CompactGroupsPartII (insert it after its last supplier)
  outside-folder: TauCetiRoadmap/RepresentationTheory/README.md
```

Neither line is a finding:

- The configured order does not list the roadmap. The candidate merge order lists it at line 402, and the dependency check against that order is clean (below).
- The one file outside the folder is the family index, which this nested pull request owns.

My run stopped before its build step, so I elaborated the file separately (see the Lean paragraph below). The dependency check, run for this review, printed:

```text
depcheck: 222 roadmaps, 2027 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line.

**Lean.** `lake env lean` on `Suggested.lean` exits 0 with 13 `sorry` warnings and nothing else. I made a scratch copy with `#check @name` for all 16 declarations. The elaborated types are those the previous report compared with the README, and the file has not changed since. `compactCharacter` keeps only `CommGroup` and `TopologicalSpace`, which is sound because its body is a real composition. A second scratch copy replaced each `sorry` by `first | simp | rfl | infer_instance | aesop`. All 13 theorems stayed open, so nothing is padding. The headline list is unchanged from the previous report: §§1.2, 1.3, 2.1, 3.1, 4.1, 5.1, 6.5–6.7, 6.9 and 7.1. The module docstring names the three that are not statable at the pins.

**Declarations opened at the pins for the changed passages (9 files):**

| Pin and file | What it says, and what it does not |
| --- | --- |
| Tau Ceti `RepresentationTheory/Continuous/TensorProduct.lean:52–54,57,69,74` | `tprod` needs `InnerProductSpace 𝕜` on both factors; it acts by `TensorProduct.mapL (π g) (ρ g)`; `continuous_tprod` assumes continuity of both. A grep of all of Tau Ceti finds no `character_tprod`, so the README's “no character identity for this carrier is supplied” is correct and the tensor-character bullet is rightly a target. |
| Mathlib `Analysis/InnerProductSpace/TensorProduct.lean:603,610`; `RepresentationTheory/Character.lean:69` | `mapL_apply` reduces to `TensorProduct.map`, and `Representation.char_tensor` then gives `χ_Vχ_W`. This is the route §0.1 names. |
| Tau Ceti `Continuous/LinHom.lean:87–88,96,113,123,128,254–281` | `linHom` is defined on normed spaces for a `Group G` and acts by `T ↦ ρ g ∘ T ∘ π g⁻¹`. `continuous_linHom` adds `IsTopologicalGroup`. `character_linHom` (line 276) needs finite dimension and a complete field, and gives `χ_π(g⁻¹)·χ_ρ(g)`. The README states these hypotheses. |
| Tau Ceti `Continuous/Character.lean:120`; Mathlib `RepresentationTheory/Continuous/Basic.lean:439` | `character_trivial` is the constant function `finrank`, which is 1 on the line ℂ. `ContRepresentation.trivial` is `ofMonoidHom 1`. |
| Tau Ceti `Compact/Finite.lean:256–266` | `integral_haarProb` needs `Fintype`, `DiscreteTopology` and `BorelSpace`, and gives `(Nat.card G)⁻¹ • Σ g, F g`. |
| Tau Ceti `Compact/Finite.lean:721–739` | `inner_gramOperator_eq_inv_mul_sum`: `⟪v, gramOperator w⟫ = (Nat.card G)⁻¹ * Σ ⟪π g v, π g w⟫` on a complete inner-product space, with no finite-dimension hypothesis. The Gram slot matches the convention `h(v,w)=⟨v,Tw⟩`. |
| Tau Ceti `Continuous/Intertwining.lean:153–157` | `nonempty_equiv_iff`: a continuous equivalence exists exactly when an algebraic one does, for finite-dimensional Hausdorff representations. This carries §0.1's model change to the algebraic images, as claimed. |
| Tau Ceti `Compact/UnitaryModel.lean:88` | `exists_isUnitary_congr` conjugates by some `e : V ≃L V`. I read §0.1's “unitarized model … by the identity” as V with the averaged inner product, for which the identity intertwines. `tprod` needs only an inner product, not unitarity, so either model serves. |

**Dependents of the changed text.** §6.1's *Needs* (README:933) cites “§0.1's tensor and dual comparisons”. On `linHom` into the trivial line, a weight vector `e_χ` gives `f(π(t⁻¹)e_χ) = χ(t)⁻¹ f(e_χ)`, so the dual has weight −χ. This matches §6.1's `e^χ ↦ e^(−χ)`. README:28 (“§0.1 adds only tensor and dual compatibility”) and README:330 are still accurate. The description's own sentences on §0.1 (“on the pinned continuous carriers `ContRepresentation.tprod` and `ContRepresentation.linHom`”) and on the Lean file (three definitions, thirteen theorems) match the head.

**Sources: the seeded sample.** No README locator is flagged unverified.

| Sampled target | Changed here? | Outcome |
| --- | --- | --- |
| §0.1 tensor and dual compatibility | yes | A deduction with no textbook locator. Every pinned carrier it now cites was opened above. |
| §1.3 multiplicity metrics | yes (finite-group paragraph) | Knapp2021 lines 10109–10120 (file page 258 = printed p.240): Proposition 4.8 says an intertwiner between irreducibles is zero or bijective, and Corollary 4.9 says a self-intertwiner is scalar. This supports the blockwise statement. The new paragraph cites only pinned declarations. |
| §§0.2, 1.1, 1.2, 2.1, 4.1, 6.1–6.4, 6.6–6.9 | no | Carried from the previous report's sample table: each locator was opened there and found correct. |

**Ownership.** A `roadmaps grep` for the newly cited names finds them only here and in ArithmeticGaloisRepresentations (`README.md:389, 957, 967, 4583`), which cites `ContRepresentation.linHom` as the same pinned carrier. No other roadmap owns it. `scratch/overlaps.md` lists no competing change, no dropped id and no id defined only by an open revision.

**Adversarial mathematics.** The first eight rows have been computed again for the changed statements. The remaining rows are carried from the previous report (r5) for untouched statements; that report computed their values.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: `tprod` acts by π(g)⊗ρ(g) | trivial ℂ with intertwiners 2I, 3I; C₃ character ω on ℂ⊗ℂ; V=0 | `mapL(2I,3I)(1⊗1)=2⊗3=6(1⊗1)`; `ω·ω=ω²`; V⊗W=0 | matches `tprod_apply` and `mapL_tmul` | none |
| §0.1 tensor character χ_Vχ_W of `tprod` | g=1 with trivial ℂ² and ℂ³; C₃; S₃ standard ⊗ sign | `6=2·3` (the wrong model χ_V+χ_W gives 5); `ω²`; 3-cycle `(−1)·1=−1`, transposition `0·(−1)=0` | true via `char_tensor`; not pinned for the continuous carrier | none |
| §0.1 dual as `linHom` into the trivial line | C₃; g=1; S₃ standard; the wrong rule f↦f∘π(g) on S₃ | `ω⁻¹·1=ω²`; `1·1=1=dim`; `χ(c⁻¹)=−1=χ(c)`, `χ(t⁻¹)=0`; for g=(12), h=(23): `hg=(132)`, `gh=(123)`, so the rule without inverse is not a left action | correct, and the dual character is cited | none |
| `character_trivial` on the line | trivial ℂ, ℂ², 0 | constants 1, 2, 0 | constant `finrank` | none |
| §0.1 inner-product models | ℂ² with sup norm; C₂ swap with `⟪v,w⟫=v̄₁w₁+2v̄₂w₂` | no `InnerProductSpace` instance, so use the coordinate map to `EuclideanSpace ℂ (Fin 2)`, which is continuous in finite dimension; the averaged form is `(3/2)(v̄₁w₁+v̄₂w₂)`, swap-invariant, and the identity intertwines | both models exist; `nonempty_equiv_iff` transports | none |
| §1.3 `inner_gramOperator_eq_inv_mul_sum` | C₃ trivial; trivial group; C₂ swap with diag(1,2) | `(1/3)·3h=h`, unnormalized 3h; `|G|=1` gives h and h; `⟪e₁,Te₁⟫=⟪e₂,Te₂⟫=(1+2)/2=3/2`, `⟪e₁,Te₂⟫=0`, so T=(3/2)I | true; `Nat.card G≥1`, so the inverse is never a junk value | none |
| `integral_haarProb` | C₃ with F=δ₁; F=1 | `1/3=(1/3)·1`; `1=(1/3)·3` | probability normalization | none |
| References versus body (Knapp) | the 8 locators | body cites 4.8, 4.9, 4.29, 4.58, 4.59, 4.67, 5.107, 5.110; the list holds the same 8 | equal sets | none |
| Conventions: coefficient versus trace (r5) | scalar circle action at i | coefficient −i; trace i | conjugate | none |
| §0.2 norm identity (r5) | two points of mass 1/2, k=1; k₁₂=i; μ=0 | `1=4·1/4`; `i/2` and `−i/2`, both 1/4; 0=0 | equal | none |
| §1.1 Gram form (r5) | T=2I; T=0; swap with diag(1,2) | h(1,i)=2i; 0 not positive; 2≠1 | conventions fixed | none |
| §1.2 `positive_selfIntertwiner_existsUnique_scalar` (r5) | ℂ, T=2I; trivial ℂ², diag(1,2); V=0 | c=2; reducible; fails irreducibility | true | none |
| §1.3 block change (r5) | U=diag(1,i), A=[[1,1],[1,2]] | `UAU†` entry (1,2) is −i; `U†AU` has +i | direction fixed | none |
| §2.1 `IsGFinite`, `gFiniteSubmodule` (r5) | 0; 𝔽₂; C(S¹) modes; ℓ²(ℤ) | dimensions 0, 1, 2, ∞ | as defined | none |
| §2.1 `gFiniteSubmodule_dense` (r5) | E=0; C(S¹) rotations | closure of 0 is 0; `‖R_θ−I‖=2` | orbit continuity suffices | none |
| §3.1 two Lean headlines (r5) | trivial; C₃; `Circle^J` with J uncountable | true, true, false on both sides | agree | none |
| §4.1 `character_finite_coordinates` (r5) | empty J; `Circle²` at (i,−1); S₃×C₃ | 1; `−i`; `−ω` | true | none |
| §4.1 `exists_productDualEquiv` (r5) | generator at j | `χ(x_j)`; product `∏χ_i(x_i)` | pins e | none |
| §4.1 `circleProduct_character` (r5) | n=±1 at i; n=0 | −i versus i; 1 | n unique | none |
| §5.1 `exists_irrepClass_characterEquiv` (r5) | C₃; trivial group | 3 classes of dimension 1; 1 class | true | none |
| §5.1 `exists_characterBasis` (r5) | Circle at i; C₃ | `c_χ` belongs to χ⁻¹; `(1+ω+ω²)/3=0` | orthonormal | none |
| §5.1 `compactCharacter_span_dense` (r5) | trivial group; C₃ | 1=1; 3=3 | true | none |
| §6.1 formal character (r5) | `z↦z⁻¹`; trivial ℂ²; `t·t⁻¹` | −i at i; `2e⁰`; i·(−i)=1 | pinned | none |
| §6.2 period map (r5) | Circle, `zⁿ`; n=−1 at π/2 | `ℓ(2π)=2πn`; `−i` | T1 normalization | none |
| §6.3 conjugation (r5) | `v=e₁−ie₂` | weights +1 and −1 | semilinear | none |
| §6.4 Weyl action (r5) | SU(3), s₁ s₂ | `(s₁s₂)·e₁=e₂`, `(s₂s₁)·e₁=e₃` | left action | none |
| §6.5 `Y = Q∨` (r5) | SU(2); SO(3); trivial | `exp(πα∨)=−I`, so `Y=ℤα∨`; SO(3) gives `(1/2)ℤα∨`; 0=0 | needs simple connectedness | none |
| §6.5 cover and descent (r5) | U(2); SO(3) | `(−1)^(q+a)`; kernel sizes 1, 2 | congruence | none |
| §6.6 descent (r5) | SU(2)→SO(3) weights 1, 2; U(2) | −I acts by −1, +1; i versus −i | central character | none |
| §6.7 basis (r5) | SU(2) | `χ₂=m₂+m₀`, det 1 | integral basis | none |
| §6.8 U(n) congruence (r5) | U(3), λ=(2,1,−1) | `5≡2 mod 3` | as stated | none |
| §6.9 `u2_weight_character_iff` (r5) | (2,0),(1,1),(0,2); δ at (1,0); f=0 | dimension 4; symmetry fails; n=0 | both directions | none |
| §7.1 `su2_multiplicities_and_faithfulness` (r5) | n=0; Sym¹⊕Sym¹; Sym² | m=0; 4, kernel {I}; kernel {±I} | true | none |
| §7.1 `exists_su2_of_multiplicities` (r5) | m=0; m₁=2 | dimensions 0, 4 | realized | none |

No counterexample to any changed statement was found.

**Remarks on untouched text (no change requested).**

- Layer 0's `### Dependencies` (README:447–450) names neither the base roadmap's comparison targets nor the pinned tensor and dual carriers that §0.1's *Needs* line now lists.
- The contract bullet for `ContRepresentation.gramOperator` (README:172–174) says “for finite-dimensional actions”. At the pin, the declaration needs a compact group and a complete inner-product space, not finite dimension (`Compact/Unitarizable.lean:97–99,122`).

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (§§4.1, 5.1): the manifest records it as uncertified (paywalled), so it is cited by locator alone. It is not touched by this change.
- Ownership against board packages: the board lists no package that plans compact-group representation theory. Open pull requests were searched through the roadmap index of 2026-11-10 only.

## Source issues

- none
