# Review of CompactGroupsPartII (pull request #1047 at bc17800)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 128 lines changed since `2a23724`. The roadmap folder itself has no finding left: the previous R01 (P2) and R04 are repaired, and the new §1.4 is correct. Two P3 findings remain, both outside the folder and both carried from the previous report: the family index (R01 here) and the generated `roadmap-summary` block of the description (R02 here). Neither was touched at this head.

Unless another path is given, README locations refer to `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md` and Lean locations to `Suggested.lean` in the same folder.

## R01 (P3) — The family index still says “representation rings” and names a highest-weight supplier (previous R02, not repaired)

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:52–53`: “global forms and representation rings, and unitary SU(2) actions”. Lines 99–102: “for its global forms the Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral classification”.

**Claim.** These lines describe this roadmap's scope and its suppliers.

**Witness.** The README says that this roadmap constructs no Grothendieck ring of representations and that the highest-weight theory is consumed only through pinned Mathlib and Tau Ceti declarations; the author-written description says the same (“Part II constructs no Grothendieck ring”; “consumes no LieHighestWeight target”). The index is unchanged since `2a23724`.

**Repair.**
- Replace “global forms and representation rings” with “global forms and their formal characters”, and add “unitary equivalence from characters” after “invariant Hermitian metrics”.
- Rewrite the dependency line to say that the global forms use LieGroups Layers 0, 2–5, 5A, 6 and 7, ConvexityToric T1's period dictionary and the pinned highest-weight modules, and that Layer 3 uses BanachSpaceTheory B5.

This file is outside the roadmap folder, so a repair confined to the folder cannot make the edit; it needs a commit to the family index on this branch.

## R02 (P3) — The generated `roadmap-summary` block still names the representation ring and the highest-weight roadmap (previous R03, not repaired)

**Location.** The `roadmap-summary` block of the description: “the representation ring of a compact connected group with its restriction to a maximal torus” and “the highest-weight roadmap's dominant integral classification”.

**Claim.** The block describes this roadmap's scope and its suppliers.

**Witness.** As in R01. The block also omits two stated headlines: §0.2's energy identity (`Suggested.lean:53`) and §1.4's unitary equivalence (`Suggested.lean:86`). The author-written part of the description is accurate at this head, including “three definitions and fifteen headline theorems” (I counted 3 and 15).

**Repair.** Regenerate `roadmap-summary` from this head. It should name:
- the formal-character basis of `ℤ[X]^W` in place of the representation ring;
- the continuous-kernel energy identity and unitary equivalence from equal characters, with the U(n)-conjugacy classification of unitary SU(2) actions;
- the actual suppliers: LieGroups Layers 0, 2–5, 5A, 6 and 7; ConvexityToric T1; BanachSpaceTheory B5; and the pinned highest-weight modules.

## Previous findings

- R01 — repaired: `Suggested.lean:86–93` states `exists_linearIsometryEquiv_of_character_eq` for any group and any two finite-dimensional unitary representations; README §1.4 (697–748) owns it and §7.1 (1638–1642) applies it at SU(2), V=W=ℂⁿ.
  - The author's statement is more general than the one I proposed (any group, two spaces V and W, no topology on the group). It is true at that generality, and it is placed in Layer 1, where it belongs. The proposed SU(2) statement is its instance, so nothing is lost.
  - The repair introduced no new problem: see the rows for §1.4 in the table below.
- R02 — not repaired: the family index lines 52–53 and 99–102 are unchanged. See R01.
- R03 — not repaired: the `roadmap-summary` block is unchanged. See R02.
- R04 — repaired: README:331–334 now reads “For U(n) they have element conjugacy into the diagonal torus, conjugacy of maximal tori and the Weyl group `Equiv.Perm (Fin n)` (next item), but no root characters and no positive system.”

## Verified sound

### Gate and dependency check

The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `outside-folder=0`).

I re-ran the gate with the brief's command. As in the previous round it printed `depcheck: NOT IN ORDER: CompactGroupsPartII` and `outside-folder: TauCetiRoadmap/RepresentationTheory/README.md`. Neither is a defect of the head: the gate's default order does not list this roadmap while the candidate order does (line 404), and the family index belongs to this nested pull request.

The dependency check against the candidate order printed:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line. §1.4 adds no roadmap supplier: its inputs are all pinned declarations.

No file outside the folder changed since `2a23724`. `git diff --stat origin/main...HEAD` still lists three files: the two roadmap files and the family index.

### Lean

- `lake env lean` on `Suggested.lean` gives 15 `sorry` warnings and nothing else.
- `#check @exists_linearIsometryEquiv_of_character_eq` gives implicit `G V W` in three universes, `[Group G]`, a finite-dimensional complex inner-product structure on each of V and W, both `IsUnitary` hypotheses and pointwise equality of characters. Every binder is explicit in the signature, so none is lost, and it matches README:699–702 (“of any group”, “Neither compactness nor continuity of the group parameter is assumed”).
- The other 17 declarations are untouched since the previous report, which compared each with its README statement.
- The file has 3 definitions and 15 theorems. The module docstring names the new headline.

### One-tactic probe

I replaced every `sorry` with `first | rfl | infer_instance | trivial | decide | simp | aesop`. All 15 theorems stay open, including the new one. No single pinned lemma closes it: the nearest, `ContRepresentation.exists_linearIsometryEquiv_congr_eq` (`TauCeti/RepresentationTheory/Continuous/Unitary/Equivalence.lean:51`), needs an irreducible source and a given equivalence. Nothing is padding.

### Headline theorems

Stated: §0.2, §1.2, §1.4 (new), §2.1 with its two definitions, §3.1 (two), §4.1 (three), §5.1 (three), §6.9, §7.1 (two; with §1.4 they give the U(n)-conjugacy classification, as README:1638–1642 says). Named as not statable, unchanged: §§6.5–6.7 and §1.3. No statable headline is absent.

### The changed passages

- **§1.4's proof route (README:707–717).** Every input is a pinned declaration, opened at the pin:
  - `ContRepresentation.IsUnitary.isSemisimpleRepresentation` (`TauCeti/RepresentationTheory/Continuous/InvariantComplement.lean:190`): `[Group G]`, finite-dimensional, no topology on G, as the contract at README:249–252 says.
  - `Representation.nonempty_equiv_of_character_eq_of_isSemisimpleRepresentation` (`TauCeti/RepresentationTheory/Semisimple.lean:63`): `[CharZero k]`, both spaces finite-dimensional, a monoid, both semisimple. The contract's wording (README:252–255) matches.
  - `ContRepresentation.nonempty_equiv_iff` (`TauCeti/RepresentationTheory/Continuous/Intertwining.lean:155`): complete nontrivially normed field, Hausdorff, finite-dimensional source; it holds here.
  - The `CStarAlgebra (E →L[ℂ] E)` instance (`Mathlib/Analysis/CStarAlgebra/ContinuousLinearMap.lean:20`, needs `[CompleteSpace E]`, which finite dimension gives).
  - `CFC.sqrt` (`Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean:232`, defined as `cfcₙ NNReal.sqrt a`, with `sqrt_mul_sqrt_self` at :261 for `0 ≤ a`).
  - `Commute.cfcₙ_nnreal` (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Commute.lean:200`): from `Commute a b` alone it gives `Commute (cfcₙ f a) b` for `f : ℝ≥0 → ℝ≥0`. Since `CFC.sqrt` is a `cfcₙ` of an `ℝ≥0` function, this is the right lemma, and it needs no hypothesis on `π(g)†`.
  - None of the inputs is derived from the target.
- **The algebra of the route.** With P self-adjoint and `P²=T†T`: `U†U=P⁻¹T†TP⁻¹=P⁻¹P²P⁻¹=1`, and `Uπ(g)=TP⁻¹π(g)=Tπ(g)P⁻¹=ρ(g)TP⁻¹=ρ(g)U`. P is invertible because `⟪v,T†Tv⟫=‖Tv‖²>0` for v≠0 in finite dimension. U is onto because T and P are.
- **The supplier contracts (README:178–185, 249–255, 331–334), the Scope sentence (README:93–95), the build paragraph (README:414–415), Layer 1's Dependencies (README:761–765) and §7.1's *Needs* and Dependencies (README:1684, 1705)** agree with §1.4 and with the pins.
- **Ownership.** A search of the roadmaps on main and the open heads for the name, for “unitarily equivalent” and for a polar-factor intertwiner finds no other owner of this statement. The pinned Tau Ceti `RepresentationTheory/` has no polar decomposition of an intertwiner beyond the irreducible case, so it is not already proved.

### Sources: the seeded sample

The README flags no locator as unverified. Of the sampled targets only §1.4 and §7.1 lie in changed passages. Both are stated as deductions from pinned declarations, and I checked every input above. The other sampled locators (§§0.2, 1.2, 1.3, 2.1, 4.1, 5.1, 6.1, 6.2, 6.4–6.6, 6.8, 6.9) are untouched; the previous report checked them against Knapp2021 and Etingof2024 and recorded the lines.

### Cross-roadmap citations

The diff adds none. The previous report's resolutions stand for the untouched text; the tools list no citation or Lean name found nowhere, and no overlap with an open pull request.

### Adversarial mathematics

Each row gives the values computed on each side. Rows marked “r9” are carried forward from the previous report for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_linearIsometryEquiv_of_character_eq` (new) | SU(2): g versus ḡ on ℂ² | traces a+ā both sides; J=[[0,−1],[1,0]]: Jg=[[−b,−ā],[a,−b̄]], JgJ⁻¹=[[ā,−b],[b̄,a]]=ḡ; at diag(i,−i), ḡ=diag(−i,i)≠g | true; e=J, not the identity | none |
| same | trivial ℂ² versus Sym¹ at −I | characters 2 and −2 | hypothesis fails, as it must | none |
| same | G=ℤ: diag(1,(−1)ⁿ) versus Sⁿ | characters 1+(−1)ⁿ both; B=[[1,1],[1,−1]], B†B=2I, ‖Be₁‖=√2; B·diag(1,−1)=[[1,−1],[1,1]], times B⁻¹=B/2 gives [[0,1],[1,0]]=S | B is not an isometry, B/√2 is | none |
| same, unitarity dropped | G=ℤ: [[1,n],[0,1]] versus trivial | characters 2 and 2; e₂↦(1,1) of length √2 at n=1; not semisimple | false without `IsUnitary`; the hypothesis excludes it | none |
| same, degenerate | V=W=0; trivial ℂ versus trivial ℂ²; G=1; S₃ sign versus trivial | 0=0 and the zero map is an isometry; characters 1≠2 at the identity; equal characters ⟺ equal dimension, any isometry works; characters −1≠1 at (12) | true | none |
| same, generality | README versus Lean | both: any group, no topology on G, V and W finite-dimensional complex, both unitary | agree | none |
| §1.4 bullets | converse; irreducible case | `tr(eπ(g)e⁻¹)=tr π(g)`; T†T=c·I, P=√c·I, U=c^(−1/2)T | as stated | none |
| §1.4 route | P=√(T†T) | U†U=P⁻¹P²P⁻¹=1; Uπ(g)=ρ(g)U (above) | as stated | none |
| §7.1 conjugacy sentence and new Check | same multiplicities ⟹ same character ⟹ conjugate; g versus ḡ | m=δ₁ for both; conjugate by J∈U(2) | as stated | none |
| U(n) sentence (README:331–334) | `Analysis/Matrix/UnitaryGroup/` | element conjugacy, torus conjugacy, Weyl group present; no root characters or positive system (r9 search) | wording now exact | none |
| `exists_kernelOperator_hilbertSchmidtEnergy` | r9 | energy 1 versus 4·¼=1; ¼ versus ¼; 36 versus 36 | true | none |
| `positive_selfIntertwiner_existsUnique_scalar` | r9 | c=2 for T=2I; c=1 gives 2≠1 | true | none |
| `IsGFinite`, `gFiniteSubmodule`, `gFiniteSubmodule_dense` | r9 | orbit-span dimensions 0, 1, 1, 2, ∞; ‖R_θ−I‖=2 | true | none |
| §3.1 criteria | r9 | 1 class; 3 classes; ‖χ_j−χ_k‖₂=√2 | agree | none |
| `character_finite_coordinates`, `exists_productDualEquiv`, `circleProduct_character` | r9 | F=∅, value 1; i·(−1)⁻¹=−i | true | none |
| `exists_irrepClass_characterEquiv`, `compactCharacter_span_dense`, `exists_characterBasis` | r9 | coefficient −i, trace i; (1+ω+ω²)/3=0; Parseval 1+4=5 | true | none |
| `u2_weight_character_iff` | r9 | m(1,1)=2−1=1, dimension 4; (−i)(−1)=i | both directions | none |
| `su2_multiplicities_and_faithfulness`, `exists_su2_of_multiplicities` | r9 | 2·2=4 injective; Sym² kernel {±I}; χ₂(diag(i,−i))=−1 | true | none |
| §§0.1, 1.1, 1.3, 2.1, 6.1, 6.2, 6.4–6.8, §7.1 count | r9 | as recorded there (for example n=2, 3, 4 give 1, 1, 3 embedding classes) | as stated | none |

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (§§4.1 and 5.1). The manifest records it as uncertified (paywalled), so it is cited by its locator alone. The passages are untouched at this head.

## Source issues

- none
