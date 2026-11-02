# GATE-RepresentationTheory~11: answers to the review of f236423

Commits on top of `f236423`: `1117800a` (supplier gaps, native isotypic API, period comparison, Checks), `8b200d14` (names the ClassicalGroups owner in §5.2) and `1b301bfa` (corrects one isotypic Check). Files changed: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` and `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/Suggested.lean` (module docstring only). Line numbers are at `1b301bfa`.

## H01 (CBirkbeck) — applied

The "external contracts" paragraph in Scope is replaced by four registered supplier gaps with exact contracts and witnesses in a new `### Supplier gaps` subsection of Exact supplier contracts (README.md:363–415): `gap:unitary-regular-complexification` (LieGroups; the U(1) character z↦z⁻¹ extends to t↦t⁻¹, value 1/2 at 2), `gap:compact-frobenius-schur` (CompactGroups; SU(2) standard indicator −1 with form [[0,1],[−1,0]], S¹ character z indicator 0), and `gap:skew-lr-tableaux` (SchurWeyl, the slug TensorProductCombinatorics already uses at its head; `s_(1)² = s_(2)+s_(1,1)`). The character-lattice part is LieGroups `gap:torus-period-lattice` (see H02), since maximal tori are LieGroups Layer 6. §5.1, §5.2, Layer 6, Layer 9 and Downstream consumers now cite the gaps by slug. The design's gap list is outside the two files this job may edit, so the worker must register the same four slugs there.

## H02 (CBirkbeck) — applied differently

Confirmed: main LieGroups README.md:383–426 constructs maximal tori and holomorphic complexification but no period lattice. §10.2 (README.md:2394ff.) now consumes `gap:torus-period-lattice` (README.md:378: Λ=ker(exp|𝔱), Y≅(2π)⁻¹Λ, X with dχ=iα, the integral pairing, SU(2)/SO(3) witnesses) and constructs here only the derived root-datum comparison, sending the dimensionless α∨ to 2π·α∨_comp. It adds the Checks SU(2) period 2π, root differential 2i, the wrong normalization α∨↦diag(i,−i) putting diag(e^i,e^(−i))≠1 in the kernel, center orders 2 (SU(2)) and 1 (SO(3)), and rank 0. The lattice itself exists for every compact torus and so belongs to LieGroups; only the comparison is owned here.

## H03 (CBirkbeck) — disputed

Restoring those imports breaks the binding direction check. RepresentationTheory is on main; TensorProductCombinatorics, LieGroupoidsPoisson and PseudodifferentialOperators are not (merge-order lines 275, 136 and 8). With §3.1 consuming LieGroupoidsPoisson and §6.2 consuming TensorProductCombinatorics §§1.6/2.6, depcheck reported `UPWARD: RepresentationTheory (on main) -> LieGroupoidsPoisson (#135)`, `UPWARD: RepresentationTheory (on main) -> TensorProductCombinatorics (#274)` and a `CYCLE among: LieGroupoidsPoisson, PseudodifferentialOperators, RepresentationTheory, TensorProductCombinatorics, VonNeumannAlgebras`, so the edit was reverted; main's imports at README.md:487/:870 are the upward edges f236423 removed, not a precedent. The duplication is real and is resolved on the consumer side: those roadmaps should import LieHighestWeight §§3.1 and 6.2.

## H04 (CBirkbeck) — answered

Confirmed: `Sl2TensorOrthogonalityTargets.lean:49` is `noncomputable def polynomialSymmetric … := by sorry`, and :31 and :72–79 admit data as well. The file is not one of the two this job may edit, so the worker has to delete it, together with the other companion files (H07). The README no longer links to any companion file, and the normalized monomial statement stays in Suggested.lean as `exists_polynomialSymmetric`, with no admitted data.

## H05 (CBirkbeck) — applied

The planned construction is replaced by citations of the native declarations, each checked at the pin: `LieModule.isotypicMultiplicity` (TauCeti/Algebra/Lie/Multiplicity.lean:126), `LieModule.isotypicComponent` (Isotypic.lean:97), `TauCeti.UniversalEnvelopingAlgebra.lieSubmoduleOrderIsoAsModule` (UniversalEnveloping/Module.lean:562), `LieModule.nonempty_lieModuleEquiv_isotypicComponent` and `LieModule.finrank_isotypicComponent` (UniversalEnveloping/Multiplicity.lean; :227 assumes `[IsAlgClosed K]`, finite-dimensional M with a `U(L)` scalar tower and a finite-dimensional irreducible S, but not complete reducibility). The native `TauCeti.nonempty_lieModuleEquiv_directSum_irreducibleQuotient` and `TauCeti.formalCharacter_eq_finsum_isotypicMultiplicity_smul` (HighestWeight/Decomposition.lean) are cited too (README.md:328–349). Layer 6 (README.md:1076) keeps only the non-native converse, that equal formal characters imply equivalence. Its Checks are V₂⊕V₀⊕V₀ (multiplicities 1, 2; dimensions 3, 2; orbit-sum coefficients 1, 3, so reading them as multiplicities is wrong), M=0, and V(1)⊗V(1)≅V(2)⊕V(0) against V(1)⊕V(1). No reductive central-semisimplicity claim was added.

## H06 (CBirkbeck) — applied differently

The docstring was wrong to call this identification unstatable. It is statable, but it is the headline of ClassicalGroups Layer 4 on main, stated there as `character_irreducible_eq_detTwist` (main `ClassicalGroups/Suggested.lean:215`): `char (irreducible n λ)(diagonal t) = (∏ tᵢ)^m · s_μ(t)` for every `DominantWeight n`, which covers the λ=(1,0) and λ=(−1,−1) instances. Stating it again here would give an owned theorem a second owner. Suggested.lean's docstring (:43–46) now says the identification is statable, is owned by ClassicalGroups Layer 4, and is proved independently here by the Haar route. §5.2 (README.md:875) names the owned statement and lists what this layer does own.

## H07 (CBirkbeck) — answered

Confirmed: `AffinePBWFirstOrderTargets.lean` and `ReductiveCenterTargets.lean` import Mathlib submodules and have no single `import Mathlib`. These files are outside the edit permission of this job. Their statable headlines are already in Suggested.lean (`exists_productCenterEquiv`, `exists_polynomialSymmetric`, `exists_pbwSymmetrization`), so the companion files should be deleted, not normalized. The worker has to do that, and README.md no longer references them.

## H08 (CBirkbeck) — answered

Confirmed for the cited lines, which are all in the companion files of H07, so deleting those files removes the padding. Suggested.lean has none of these declarations: no center-transport lemma, trace equation, generator coefficient or d=n=2 cross-product example.

## H09 (CBirkbeck) — applied differently

No exact locator could be verified for these blocks in a legally readable text. Etingof arXiv:2401.01446 was fetched and covers none of them. Each block now says it is a derived statement and names its inputs, as the repair allows:
- §0.1 (README.md:432) is a derived finite computation.
- §3.1 (README.md:690–697) derives the arbitrary-ring Rees/PBW statements from the native ordered PBW basis and cites Gutt only for the real characteristic-zero convention. §3.2 is derived from `X^bY^c=Y^c(X+cħ)^b`.
- §5.1 (README.md:834–843) gives the Tits-sign route through a principal sl₂ with semisimple element 2ρ∨. The top eigenvalue m=λ(2ρ∨) has multiplicity one, so V(m) occurs once and the form has sign (−1)^m. This gives −1 for SU(2) weight 1 and +1 for weight 2.
- §10.2 carries the derived comparison of H02.

## H10 (CBirkbeck) — applied

New per-definition Checks with Needs lines:
- Polynomial dictionary (README.md:460–472): the degree-0 unit; xy ↦ the coefficient-one tensor, whose averaged image (x⊗y+y⊗x)/2 has squared norm 1/2; rejection of `2·e`, whose image has squared norm 2.
- E/F/H (README.md:481): `E(xy)=x²`, `F(xy)=y²`, `H(xy)=0`, `H(x²)=2x²`.
- §3.2 products (README.md:746–756): `B_ord(x,y)=y`, `B_ord(y,x)=0`, `B_sym(x,y)=y/2`, `x⋆y=yx+ħy`.
- Compact Albert algebra (README.md:1951–1968): det diag(1,2,3)=6 with tr(A²)=14; diag(3,1,1) with x₁=1 gives 2 (3 without the norm terms); a nonzero split element with a null off-diagonal entry has trace(A∘A)=0.

§7.1's shared Needs line is split into one Needs line per definition.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| gap:unitary-regular-complexification | U(1), z↦z⁻¹, t=2; n=0 | extension t↦t⁻¹ = 1/2 at 2; n=0: trivial groups, extension = id_V | holds | none |
| gap:torus-period-lattice | SU(2), SO(3) | Λ=2πℤ·diag(i,−i); exp(2π·diag(i,−i))=1 so dφ(∂_θ)∈(2π)⁻¹Λ; dχ_α(diag(i,−i))=2i; ⟨χ_α,φ⟩=2; SO(3) rotation pairs to 1 | consistent with §10.2 (SU(2) center 2, SO(3) center 1) | none |
| gap:compact-frobenius-schur | SU(2) std, S¹ char z, trivial | SU(2): (2/π)∫₀^π 2cos2θ·sin²θ dθ = −1; S¹: ∫z² = 0; trivial: 1 | holds | none |
| gap:skew-lr-tableaux | λ=μ=(1); λ=∅ | c^(2)=c^(1,1)=1; λ=∅: count 1 iff ν=μ | holds | none |
| §10.2 center | SU(2), SO(3), rank 0 | SU(2): e^{2it}=1 ⇔ t∈πℤ, mod 2πℤ gives 2 points; SO(3): 1; rank 0: trivial; α∨↦diag(i,−i) puts diag(e^i,e^{−i})≠1 in the kernel | holds; wrong model excluded | Checks added |
| Tits sign route (§5.1) | SU(2) weights 1, 2; λ=0 | other weights λ−Σnᵢαᵢ have 2ρ∨-eigenvalue m−2Σnᵢ < m; m=1: alternating, −1; m=2: symmetric, +1; m=0: +1 | agrees with `invariantForm_isSymm_iff_tits_sign` | route added |
| Isotypic Checks | sl₂: V₂⊕V₀⊕V₀; M=0; V(1)⊗V(1) vs V(1)⊕V(1) | char e²+3+e⁻² = 1·(e²+e⁻²) + 3·1 = ch V₂ + 2 ch V₀; dims 3, 2; e²+2+e⁻² vs 2e+2e⁻¹ (both dim 4) | the earlier text gave orbit-sum coefficients as 1 and 2, but they are 1 and 3 | Check corrected (`1b301bfa`) |
| Polynomial dictionary | d=0; d=2, i=1; 2·e | 1↦1; ‖(x⊗y+y⊗x)/2‖² = 2/4 = 1/2; ‖x⊗y+y⊗x‖² = 2 | `exists_polynomialSymmetric` excludes 2·e | Checks added |
| E, F, H, d=2 | xy, x² | E(xy)=x·x=x²; F(xy)=y²; H(xy)=E(y²)−F(x²)=2xy−2xy=0; H(x²)=E(2xy)−0=2x² | matches `H e_i=(d−2i)e_i` (i=0: 2; i=1: 0) | Check added |
| B_ord, B_sym | (x,y), (y,x) | B_ord(x,y)=y, B_ord(y,x)=0; B_sym(x,y)=y/2, B_sym(y,x)=−y/2 | difference y = {x,y} both ways | Checks added |
| Product formula | a=0, b=1, c=1, d=0 | Σ_{n≤1} C(1,n)ħⁿ y x^{1−n} = yx+ħy | matches XY−YX=ħY | Check added |
| Compact Albert det/trace | diag(1,2,3); diag(3,1,1), x₁=1; split null x₀ | det=6, tr A²=1+4+9=14; det=3·1·1−a₁N(x₁)=3−1=2; tr(A∘A)=0+2·0=0 with A≠0 | holds; the split carrier fails positivity | Checks added |

Context and binders: no Lean declaration was added or changed, only the module docstring of Suggested.lean. The mechanical `#check @name` comparison was not rerun. The brief's signatures file was unavailable (exit 1), and `lake build` is the only Lean command this job may run. Because no signature changed, the binder comparison the review reports for f236423 (121 declarations, no binder lost) still applies.

Ownership against open work, checked by object: `gap:skew-lr-tableaux` matches TensorProductCombinatorics' slug at its head. `roadmaps grep` found no existing gap for regular complexification, the torus period lattice or Frobenius–Schur. CompactGroups' open revision plans Frobenius–Schur types, but a revision is never a dependency, so main CompactGroups is the cited supplier.

Sources: Etingof arXiv:2401.01446 was read through the sources service. There is no `sources.toml` in the folder, and this job may not create one. No text was reported missing.

The earlier attempt restored the family-index `TauCetiRoadmap/RepresentationTheory/Suggested.lean`. That restore is not included here, because the file is outside this job's edit permission and it made the gate report `outside-folder=1`. The earlier failed check listed `unusedSectionVars` warnings in `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`, which is outside this folder and imported by neither build target.

Suspicious passages: none.

## Build and gate

`lake build TauCetiRoadmap.RepresentationTheory.LieHighestWeight.Suggested TauCetiRoadmap.RepresentationTheory.AdoIwasawa.Suggested`: `Build completed successfully (9170 jobs).` It emits 37 warnings, all `declaration uses 'sorry'`, and no other warning.

Depcheck: `depcheck: 205 roadmaps, 1586 edges, 0 problem(s)` (no UPWARD or CYCLE line).

Gate: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
