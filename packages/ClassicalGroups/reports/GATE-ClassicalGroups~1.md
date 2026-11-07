# GATE-ClassicalGroups~1: answers to the human review of the ClassicalGroups revision

One comment (roed-math, 2026-11-06, overlap cross-check) makes four points, H01–H04. All edits are
in `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` and `Suggested.lean`, in one
commit, `a75ea798` on top of `4dcaac5`, not pushed.

## H01 (roed-math) — applied

§3A.3 now states the Sp interface that ClassicalGroupsPartII consumes, so its wording no longer
leaves the value to the reader. Old: "construct contraction with J and its equivariance … construct
contraction and inverse-form wedge maps and their commutator on each degree". New (README lines
806–825): explicit κ_k and L_k = left multiplication by `Ω_J=Σ f_i∧e_i` for the native
`Matrix.J`, and `κ_(k+2) ∘ L_k − L_(k−2) ∘ κ_k = (r−k)·id` on `⋀^k V` for every k≥0. κ_k is
surjective for k≤r+1, and for 1≤k≤r the kernel P_k is simple of highest weight ω_k, with highest
vector e₁∧⋯∧e_k and dimension binom(2r,k)−binom(2r,k−2). Downstream consumers (line 1889) now
lists ClassicalGroupsPartII CG.1.4–CG.1.5 and CG.1.7 as consuming these Sp statements and owning
only their GSp forms.

Evidence: ClassicalGroupsPartII at its current head `110ca61` already makes the matching
change in its Scope (§§3A.1–3A.3 own the Sp statements; CG.1.4–1.5 own only the ν-twisted GSp
form), and it states the commutator with exactly the normalisation (g−k)·id. The identity and
the kernel ranks were computed in the native convention for r=1,2,3 and every degree (table
below). The Sp Borel that "highest weight ω_k" needs was not specified anywhere in §3A.1. It is
now: block matrices `[[A,B],[0,(Aᵀ)⁻¹]]` with A upper triangular and A⁻¹B symmetric (line 673).

## H02 (roed-math) — applied

Old (Scope, old lines 46–48): "ClassicalGroupsPartII's Scope and ownership reserves the GSp
representation-ring and Levi-character theory". New (lines 52–57): ClassicalGroupsPartII owns the
multiplier-twisted contraction and primitive exterior powers (CG.1.4–CG.1.5), the rational GSp
highest-weight models (CG.1.7) and the integral GSp representation and character rings, and
consumes the Sp statements of §§3A.1–3A.3. The word "Levi" does not occur in the
ClassicalGroupsPartII README or Suggested.lean at head `110ca61`. No other roadmap owns a
GSp Levi-character theory that this one needs, so the claim was dropped and no owner was put in
its place.

## H03 (roed-math) — applied differently

The defect is real: on main, RootSystems has only Layers 1–3, so "Layers 1–4 and 6" did not
resolve there. The open revision of RootSystems has six layers again at its current head
`265d185`, with different content. The suggested repair cites that revision's §1.1 and §5.1 and
makes it a dependency. That is stale: those were the numbers at `3e78a6d`. At `265d185` the
marked presentation is §2.1 and the type A Weyl group is §3.2, the same numbers as on main.

So no dependency on the revision is needed. Every "RootSystems Layers 1–4 and 6" / "Layers
1–4" citation (old lines 43, 249, 477, plus the generic Layer 3, §3.4, §3A.1, §4.3, §5.1 and
construction-route mentions) now cites one of two things. The first is the pinned Tau Ceti
declarations, with file and line under *From Tau Ceti* (lines 239–260): `TauCeti.posRoots`,
`RootPairing.dominantChamber`, `TauCeti.openWeylChamber`, `TauCeti.longestElement`,
`TauCeti.HasCartanType`, `TauCeti.existsUnique_dynkinType`,
`TauCeti.DynkinType.simplyConnectedRootDatum`, `TauCeti.DynkinType.simplyConnectedBase` and
`TauCeti.DynkinType.typeAWeylGroupEquiv`. The second is RootSystems §3.2, for the type A Weyl
group (line 314), which is the same section on main and at `265d185`.

The reviewer's `RootPairing.dominantChamber` is the correct name at the pin. Main's RootSystems
contract calls it `TauCeti.dominantChamber`, which does not exist.

The same pattern had a second instance. ClassicalGroups cited "LieHighestWeight Layers 2–6" and
"Layer 2" (nine places), and LieHighestWeight's open revision drops Layers 1, 2 and 4 at its head
`beea1d2`. Its own Scope says consumers should cite the declarations, not a layer. These
citations now name the native `TauCeti.integralWeightLattice`, `TauCeti.exists_int_apply_coroot`,
`TauCeti.VermaModule`, `TauCeti.irreducibleQuotient`,
`TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`,
`TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector`,
`TauCeti.exists_isCompl_of_isKilling`, `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`
and `TauCeti.finrank_eq_prod_coweightPairing_div` (lines 262–283). LieHighestWeight Layer 9,
present on main and at `beea1d2`, is kept.

Two more supplier citations did not point at the content they claimed:

- **ReductiveGroups "Layer 5P (Cartier smoothness)".** On main, Layer 5P is the polynomial
  unipotent exp/log. It is replaced by the native `TauCeti.smoothCommHopfAlgProperty_of_charZero`.
  §3A.2 now also cites the native comodule-level stable-subspace theorem
  `Submodule.exists_subcomodule_iff_forall_differential_mem` and keeps its transport to the
  matrix-group carriers.
- **"SchurWeyl Layer 7's linear independence".** That is not a SchurWeyl target; it is the native
  `TauCeti.schurPolyBasis`.

## H04 (roed-math) — answered

No change is needed here, and none is needed in ClassicalGroupsPartII. §3.5 (line 593) and §5.1
(line 1072) still exist and send the SO/Sp classification and dimension statements to Layer 3A.
ClassicalGroupsPartII at its current head `110ca61` no longer cites Layer 3 or Layer 5 for them:
it cites §3A.1, §3A.2 and §3A.3 (and Layers 0, 1, 2 and 4 for the GL inputs).

Merge-order consequence: §3A exists only in this revision, not on main. ClassicalGroupsPartII is
line 193 of the merge order and this revision is not listed, so this revision must merge before
ClassicalGroupsPartII.

## Build and gate

- `lake build TauCetiRoadmap.RepresentationTheory.ClassicalGroups.Suggested` passed:
  "Build completed successfully (9078 jobs)". The only warnings are the expected
  "declaration uses `sorry`" on the 11 admitted theorems.
- Gate on the committed head: `gate ClassicalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0
  sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- The first gate run before committing reported `statement-hygiene=1`. This is a new check on
  unchanged content: `schurFunctor_iso_irreducible` concluded `Nonempty (… ≅ …)`. No canonical
  map exists at the pins, and the native library states its own isomorphism theorems with
  `Nonempty`. So the theorem was renamed by its conclusion to
  `nonempty_schurFunctor_iso_rationalWeylFDRep` in the Lean file and at README lines 564 and 1000.
  No other roadmap cites the old name.
- Direction check: `depcheck: 239 roadmaps, 2362 edges, 0 problem(s)`. There is no UPWARD, CYCLE
  or moved line.
- `roadmaps resolve` on the final README found no cross-roadmap citations and no Lean names that
  resolve nowhere. That tool did not check Tau Ceti names on this host. Every Tau Ceti name added
  here was checked by hand at the content pin (`2fd255d`), with the file and line given in the
  README.
- Signature check: a scratch file with `#check @name` for all 22 declarations of
  `Suggested.lean` was elaborated against the built final module, after the rename. It also
  checked the three Mathlib names newly used in the README: `RootPairing.weylGroup`,
  `UniversalEnvelopingAlgebra` and `Matrix.J`. Each elaborated type matches its README
  statement. The only Lean change is the rename above and one docstring sentence on the
  §3A.2 bridge, so no signature changed.

## Adversarial pass on the added or changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| κ₂(v∧w)=ω(v,w), native J | Sp₂: (f₁,e₁), (e₁,f₁) | J at (inr,inl) is +1 and at (inl,inr) is −1, so the values are 1 and −1 | consistent with `Matrix.J = fromBlocks 0 (-1) 1 0` |
| Ω_J=Σ f_i∧e_i is the bivector of every basis with ω(a_i,b_j)=δ_ij | bases (f_i,e_i) and (e_i,−f_i) | Σ f_i∧e_i, and Σ e_i∧(−f_i)=Σ f_i∧e_i | same bivector |
| κ_(k+2)L_k − L_(k−2)κ_k = (r−k)·id | r=1,2,3; every basis monomial of every degree k=0…2r | equality on all monomials. r=1,k=0 gives 1; r=1,k=2 gives −f₁∧e₁; r=2,k=1 on e₁ gives e₁ | holds; integer coefficient, not truncated (Check added) |
| sign of Ω_J | Sp₂, degree 0, with e₁∧f₁ in place of f₁∧e₁ | κ₂(e₁∧f₁)=−1 ≠ r | wrong sign excluded (Check added) |
| κ_k surjective for k≤r+1 | r=1: k=2,3; r=2: k=2,3,4; r=3: k=2…6 | ranks 1/1; 4/4 at r=2,k=3; 15/15 at r=3,k=4; 1/6 at r=2,k=4; 6/20 at r=3,k=5 | surjective exactly for k≤r+1 (Check added at Sp₄) |
| dim P_k = binom(2r,k)−binom(2r,k−2), 1≤k≤r | r=1,k=1; r=2,k=2; r=3,k=2,3 | 2=2; 5=6−1; 14=15−1; 14=20−6 | holds; −5 at r=2,k=4 shows the range bound |
| P_k has highest weight ω_k, vector e₁∧⋯∧e_k | r=2,k=2, Borel of §3A.1 | ω(e₁,e₂)=0, so the vector lies in P₂; weight (1,1); the unipotent radical acts unitriangularly on span(e₁,e₂) | holds |
| Sp Borel `[[A,B],[0,(Aᵀ)⁻¹]]`, A⁻¹B symmetric ⇔ MJMᵀ=J | general block; Sp₂ with M=[[1,1],[0,1]] and [[1,0],[1,1]] | MJMᵀ=[[BAᵀ−ABᵀ,−ADᵀ],[DAᵀ,0]]; M=[[1,1],[0,1]] gives J; the lower unipotent lies in Sp₂ but not in B | holds (Check added) |
| positive roots ε_i−ε_j, ε_i+ε_j (i<j), 2ε_i | C₂ | 1+1+2=4 = number of positive roots of C₂ | holds |
| C₂ has native type B₂ after interchanging nodes | Cartan entries ⟨α_i,α_j^∨⟩ | C₂ order (ε₁−ε₂, 2ε₂) gives [[2,−1],[−2,2]]; swapped gives [[2,−2],[−1,2]], which is `CartanMatrix.B 2` | holds (Check added) |
| D₃ has native type A₃ in the order ε₂−ε₃, ε₁−ε₂, ε₂+ε₃ | off-diagonal pairings | −1, 0, −1 | tridiagonal A₃ |
| B₁, C₁ have type A₁; valid native ranks B≥2, C≥3, D≥4 | `TauCeti.DynkinType.Valid` | B n needs 2≤n; the docstring states that C 2 is B 2 and D 3 is A 3 | holds |
| RootSystems §3.2 applies to the GLₙ coordinate roots | n=2; n=1,0 | main §3.2 Check: the comparison needs no spanning; n=1 has no roots and S₁ is trivial | applies for n≥2; ranks 0 and 1 stated as trivial |
| §3.2 dominance from positive roots eᵢ−eⱼ | GL₂: (2,0) against (1,1) | difference (1,−1) ∈ ℕ(e₁−e₂) | (2,0) > (1,1); central sum retained |
| §3A.2 subspace form is native (comodules) | char 3, Gₘ, t↦t³ at t=2; sign character of {±1} | the native theorem needs a characteristic-zero, algebraically closed field and a connected spectrum, and both Checks violate one of these | consistent with the existing §3A.2 Checks |
| native supplier hypotheses quoted | `TauCeti.longestElement` | the file's variables include `[P.IsRootSystem]` | "spanning" added to the README |
| `TauCeti.exists_int_apply_coroot` location | branch pin `a91d3aa` against content pin `2fd255d` | `Weights/Integrable.lean` against `Weights/Integrality.lean` | README cites the content pin |

## Ownership, overlaps and sources

- **Ownership.** No new construction is claimed. The Sp contraction statements were already
  §3A.3's; ClassicalGroupsPartII agrees at `110ca61`. Every repair either cites a native
  declaration or narrows a claim.
- **Overlap leads** (`scratch/overlaps.md`). "LieHighestWeight Layer 2 dropped by the open
  LieHighestWeight revision" was confirmed at `beea1d2` and resolved under H03 by citing native
  declarations, so that revision is not a dependency. No open pull request changes this roadmap.
  There is nothing to list under "only an open revision defines".
- **Sources.** No new source was cited and no text was fetched; `needs-references.toml` was not
  needed. Locators are unchanged except that §3A.2 now names the native theorem, alongside Milne
  Proposition 10.31 and Theorem 3.23.

## Outside the four points: pin skew, which needs a follow-up sync

These items are not part of the review. They need a separate job once the branch merges main;
none of them is repaired here.

- **Pin skew.** The branch's `lake-manifest.json` pins Tau Ceti `a91d3aa`, which is what the build
  above used. Main and the content pins use `2fd255d`.
- **Four headlines are already native at `2fd255d`:**
  - `rational_irreducible_classification` is `FDRep.existsUnique_nonempty_iso_rationalWeylFDRep`
    (`WeylModule/Classification.lean:113`).
  - `rational_dimension` is `TauCeti.finrank_rationalWeylFDRep` (`WeylModule/Dimension.lean:76`).
  - `rationalWeyl_branching` is `TauCeti.nonempty_equiv_rationalWeylRep_comp_glBlockSucc`
    (`Branching/Decomposition.lean:65`).
  - `schur_character` is `TauCeti.char_weylFDRepOfShape_diagonal_eq_eval_diagramSchurPoly`
    (`WeylModule/Character.lean:110`); `TauCeti.schurFunctor` is an abbreviation of
    `weylFDRepOfShape ℂ`.

  A native Littlewood–Richardson decomposition `TauCeti.nonempty_equiv_tprod_weylRepOfShape` also
  exists.
- **Three Tau Ceti names in the README contract are absent at `2fd255d`**, though present at
  `a91d3aa`:
  - `TauCeti.char_weylFDRepOfShape_diagonal_of_colLen_le_one` and
    `TauCeti.char_weylFDRepOfShape_diagonal_of_rowLen_le_one`, superseded by the full character
    theorem above.
  - `TauCeti.char_weylFDRepOfShape_diagramOf_diagonal_eq_sum_spechtChar`, now
    `TauCeti.char_weylFDRepOfShape_ofPartition_diagonal_eq_sum_spechtChar`
    (`WeylModule/SchurWeyl.lean:167`).

  These were 3 of the 13 citation leads; the other 10 are this roadmap's own `DiagonalOvergroups`
  names, declared in `Suggested.lean`.

Fixing these properly means deleting the four duplicated headlines and rewriting §§3.3, 4.2, 5.1
and 6.1 as consumption. That changes the roadmap's stated end theorems, so it was left for that
sync rather than done half-way here.
