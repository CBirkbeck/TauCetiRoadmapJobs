# Review of DerivedModuleAlgebra (pull request #1701 at 4349f3f)

**Verdict:** needs changes

Six findings: one P1, two P2 and three P3. The gate passes. The blocking issues are duplicated ownership of the generic tower theory already on main and omitted, statable K-flat replacement and simplicial tensor-comparison headlines. This is repairable without replacing the roadmap's scope.

## R01 (P1) — Import the existing generic tower theory

Location: `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1451–1458`, especially “The cofinal-shift and specified-homotopy-square comparisons are owned by §1.1 here”; also the ownership table at line 20, §§1.T.1/1.1 and the tower declarations in `Suggested.lean:173–246`.

Claim: AlgebraicTopology receives its generic tower foundation from this roadmap and owns only the topological adapters.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md:954–996` on main explicitly owns the module-tower difference map, six-term sequence, Mittag–Leffler vanishing, Milnor sequences, derived-limit cone and specified-homotopy-square comparisons. It calls these its shared generic tower API.

This is an object-level collision, not just matching terminology. Both statements use `ℕᵒᵖ ⥤ ModuleCat R`, `δ(x)_n = x_n − f_n(x_(n+1))` and the shifted cone. The main roadmap even names the same CharacteristicClasses C3, AffineMorseLefschetz A4 and CStarClassification CL8 consumers. The linked Stage 6 item 1 does not supersede Stage 6 item 0. No instruction in a later checkout can change this ownership on main.

Repair: cite AlgebraicTopology **Stage 6, item 0** as the supplier of these generic operations; delete their repeated construction targets and acceptance declarations here. Repoint the completion, Hom and effectivity dependencies to that contract. Retain only additional derived-category localization/comparison results whose extra content is stated explicitly. Update Scope and Exact supplier contracts: “There are no roadmap dependencies” will then be false. This direction does not introduce a reverse dependence in the main AlgebraicTopology text. A relocation instead would require an actual ownership change to the existing roadmap; this folder cannot accomplish it by describing that roadmap as a consumer.

Test of the repair: the multiplication-by-p tower has `lim = 0`, `lim¹ = ℤ_p/ℤ` in both statements; the sequence `pⁿℤ → ℤ → ℤ/pⁿ` has connecting map `ℤ_p → ℤ_p/ℤ` in both. Importing the existing contract preserves these maps, rather than retaining two owners for them.

## R02 (P2) — State the K-flat replacement headline

Location: `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean:15–18`, “the unbounded module derived tensor … with its K-flat models”; `README.md:661–670` promises K-flat resolutions for every unbounded module complex.

Claim: the absence of a derived tensor bifunctor prevents stating this headline at the pins.

Witness: Mathlib's `HomologicalComplex.tensorObj` (`Mathlib/Algebra/Homology/Monoidal.lean:48`) and `HomologicalComplex.Acyclic` (`Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:701`) already express the K-flat condition. A scratch signature using them elaborated under the defaults.

Repair: add a real-bodied K-flat predicate on native cochain complexes and the existence of a quasi-isomorphism from a termwise flat K-flat complex. For example, the following predicate and conclusion elaborated together with the submitted file:

```lean
def KFlat (R : Type u) [CommRing R]
    (P : CochainComplex (ModuleCat.{u} R) ℤ) : Prop :=
  ∀ N : CochainComplex (ModuleCat.{u} R) ℤ,
    N.Acyclic → (HomologicalComplex.tensorObj N P).Acyclic

-- For every K : CochainComplex (ModuleCat.{u} R) ℤ:
-- ∃ (P : CochainComplex (ModuleCat.{u} R) ℤ) (f : P ⟶ K),
--   QuasiIso f ∧ KFlat R P ∧ ∀ i, Module.Flat R (P.X i)
```

State the theorem with `sorry`, and leave only the unavailable derived bifunctor itself in the docstring's exclusion. The source is StacksMA Lemma 15.60.10, Tag 06Y4, p.146; its K-flat definition is 15.60.1. Also correct the docstring's section reference: the K-flat construction is §0.2, while §0.I.1 is the point-site K-injective clause.

Test of the repair: for `K = ℤ/p[0]`, the two-term free resolution `[ℤ →p ℤ]` qualifies. The acyclic, bi-infinite multiplication-by-2 complex over `ℤ/4` does not: tensoring with `F₂` gives `F₂` cohomology in every degree. Thus the predicate states K-flatness, not merely termwise flatness or a bounded substitute.

## R03 (P2) — State the native simplicial tensor comparison

Location: `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean:19–21`, “the shuffle map and the diagonal of a bisimplicial object are not constructed at the pin”; `README.md:738–758`.

Claim: the shuffle/Alexander–Whitney homotopy equivalence cannot be stated because the maps have not been constructed.

Witness: `AlgebraicTopology.alternatingFaceMapComplex` (`Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean:160`), native simplicial tensor products, `HomologicalComplex.tensorObj` and `HomotopyEquiv` (`Mathlib/Algebra/Homology/Homotopy.lean:740`) already provide both complexes and the equivalence carrier. A scratch existence signature elaborated successfully.

Repair: state the existence of the natural shuffle/Alexander–Whitney homotopy equivalence on these native complexes, with its stated normalizations and naturality. Its underlying pointwise conclusion is already expressible without a new definition:

```lean
Nonempty (HomotopyEquiv
  (HomologicalComplex.tensorObj
    ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).obj X)
    ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).obj Y))
  ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).obj (X ⊗ Y)))
```

Here `X Y : SimplicialObject (ModuleCat R)` over an arbitrary commutative ring. Bind the comparison maps together when stating their naturality; do not use unrelated pointwise choices as a substitute for the natural theorem. There is no need for sorry'd map definitions: the theorem can existentially supply the native maps and homotopies. Remove this tensor-comparison exclusion from the module docstring. This finding does not assert that the separate bisimplicial diagonal functor is already constructed.

Test of the repair: constant modules give the ordinary tensor product in degree zero; two degree-one Dold–Kan generators give the signed two-shuffle formula and interchange acts by −1 on degree two. Both cases use exactly the native chain-complex types in the successful probe, including characteristic two. A general theorem, rather than either example, belongs in the acceptance file.

## R04 (P3) — Remove the two Check theorems and unused scaffolding

Location: `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean:83` (`exists_homogeneous_ground_zero_ne_zero`) and line 135 (`dp_two_not_mem_span_dp_one`); their README Checks are at lines 74–85 and 339–340/401–402.

Claim: these are acceptance-test headlines.

Witness: the README explicitly calls the finite-field polynomial-law example its second Check. The divided-power statement is exactly the degree-two characteristic-two negative control. Their values are `X^p − X ≠ 0` and `γ₂(1) ∉ (γ₁(M))`.

Repair: **delete them from `Suggested.lean`**; keep the mathematics and negative controls in the README. Remove definitions and examples left without a headline use, including `IsHomogeneousOfDegree` if no general representability headline uses it. `IsMultiplicative` at line 67 already has no headline use. The proved identity-law example is a direct evaluation of the predicate and does not test a nontrivial construction.

The scratch one-tactic probe tried `simp`, `rfl` and `infer_instance` on all 21 admitted theorems; all 21 remained admitted. These two are padding because they mirror Checks, independently of whether their proofs require several tactics. No repair should replace their `sorry` with a proof in place.

## R05 (P3) — Correct the remaining source locators

Locations: `TauCetiRoadmap/DerivedModuleAlgebra/README.md:906`, “Lemma 3.4, Tag 08S9, p.4”; line 969, “Remark 2.4, Tag 08S3”; line 1014, “Lemma 11.3, Tag 08RB, p.22”; `Suggested.lean:291`, “Definition 15.64.1, Tag 064Q”.

Claim: these page/tag/number combinations locate the cited statements.

Witness: StacksCt line 108 places Lemma 3.4 on p.3; StacksDefos line 177 labels Remark 2.4 `0GPU`; StacksCt lines 933–948 place Lemma 11.3 entirely on p.21; StacksMA line 7432 labels `064Q` Definition 66.1.

Repair: use p.3, Tag 0GPU, p.21 and Definition 15.66.1, respectively. The first two repairs already appear correctly at other occurrences in this README, so make the repetitions agree. These corrections change no hypotheses or computed examples.

## R06 (P3) — Finish the README and Lean form repair

Location: `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1`, “# Derived module algebra”; lines 763–764, “*Lean:* `DerivedDeRham.simplicialTensorComparison` …”; the API and Check blocks throughout the file.

Claim: backticked names identify declarations supplied by this acceptance file, and the layers have the required roadmap shape.

Witness: `simplicialTensorComparison` is absent from `Suggested.lean` and is explicitly excluded in its docstring. The README has no `## Layer k:` headings or per-layer `### Examples`/`### Dependencies`; numerous Checks still carry invented declaration names.

Repair: retain API facts and computations as prose, removing own declaration names that the Lean file does not declare, including the “Lean names” catalogues for unavailable constructions. Use `# Roadmap: derived module algebra`, group the existing sections into layers, and add the required layer examples and dependencies. Match the Lean layer comments and order to the README: the finite-model block currently precedes the completeness block in Lean despite following it in the README. Keep only the few native definitions needed by retained headlines. Also name homogeneous Roby representability and its unavailable homogeneous-piece carrier in the module docstring: that headline is not covered by the present cotangent/power exclusions. The zero counters from the mechanical gate do not establish these prose/form conditions.

## Verified sound

The review covered both complete files, not just the change from the previous head. I read the normative repository README and CONTRIBUTING, and compared main-roadmap shape with EnhancedDerivedSheaves and Completed/OrthogonalL2Bases. No change was made to the pull-request worktree. Its head is the requested commit, and the diff outside this roadmap folder is empty.

**Previous findings, checked first.** The nine findings of the previous review were compared with this head before the full audit. The quoted passages below are from the repaired files.

| Previous finding | Passage/evidence at this head | Disposition |
| --- | --- | --- |
| R01, module-system build | `Suggested.lean:1–4`: `module`, `public import Mathlib`, the individual injective-envelope import | Repaired; actual elaboration and supplied targeted-build gate pass. |
| R02, 33 sorry'd data declarations | Docstring lines 13–35: “Headline theorems that are not statable at the pins”; all remaining definitions have bodies | Repaired as to sorry'd data. Twenty-one admitted theorems remain; no admitted data or admitted examples. The separate native headline omissions are R02–R03 above. |
| R03, nonexistent Koszul supplier | `README.md:559–575`: “Construct the general linear-functional complex” and its contraction/homotopy contracts | Repaired; the construction is owned here rather than attributed to a missing pinned declaration. |
| R04, Matlis missing | `Suggested.lean:431,444`: `biduality_of_finite`, `biduality_of_artinian` | Repaired; completeness, Noetherian locality and an essential injective envelope occur in both full signatures; arbitrary residue field. |
| R05, padding | The 49 admitted examples and the old one-tactic API catalogue are absent; line 83 now states the ground-zero Check, and line 135 retains the degree-two Check | Partly repaired; R04 above identifies the remaining instances. |
| R06, catalogue/docstring | Lines 9–11: “The README carries every target, API list and Check”; lines 13–35 name unavailable constructions | Repaired as to the catalogue and docstring form. The K-flat and shuffle exclusions are too broad (R02–R03). |
| R07, two page slips | `README.md:622` has “p.2”; line 1153 has “pp.3, 17–19” | Both requested occurrences repaired. A repeated p.4 locator survives at line 906; R05 records it and other residual slips. |
| R08, unnecessary finite generation | `isDerivedCompleteRadical` and `isDerivedCompleteCohomology`, lines 376–386, have no `I.FG`/`J.FG` hypotheses | Repaired; arbitrary ideals match the README and source. |
| R09, shape | `README.md:40`: “How to read the build”; line 2458: “Downstream consumers” | Partly repaired. Layer headings, layer endings and undeclared own names remain R06. |

**Gate, dependencies and signatures.** The supplied gate reports every counter zero, including `build`, `depcheck`, `outside-folder`, `stray-files`, `sorry-data`, `sorry-examples`, `set_option` and imports: `OK`. I independently ran the requested dependency check, whose complete output was:

```text
depcheck: 205 roadmaps, 1556 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. I read every `*Needs:*` line and the supplier table. The declared library inputs are at the pins; the ownership issue R01 is invisible to an edge checker because the submitted README calls AlgebraicTopology a consumer. No supplier gaps are declared. This review does not introduce a new gap or move an ownership contract.

The requested `lake env lean` elaboration of the submitted module completed with only the 21 `sorry` warnings. I compared all **44 elaborated declaration signatures** with the README and appended `#check @name` for all 44 to a scratch copy; no binder disappeared. The K-flat, simplicial tensor-comparison and full six-term native signature probes also elaborated without overrides. The six-term probe uses the kernel of the existing shift and an induced map on kernels, demonstrating that its left half needs no heavy carrier; under R01, however, that theorem belongs to the imported tower contract rather than another local target.

The tactic probe retained all 21 admissions after trying each of `simp`, `rfl`, `infer_instance`. Reading the definitions and the relevant pinned statements did not reveal an additional one-library-lemma closure. This is evidence about those tests, not a proof that every possible short proof was exhausted.

**Headline inventory and Lean coverage.** The README's end results are homogeneous Roby representability and augmentation theory; linear-functional Koszul theory; unbounded K-injective/K-flat replacement and tensor–Hom; Lazard and simplicial tensor/diagonal comparison; the full cotangent calculus, integral powers/décalage and deformation obstruction; tower/lim¹/Milnor theory; derived completeness and its reflector/Koszul and ordinary-tower comparisons; simplicial algebra completion; complete flatness, Tor amplitude and descent; perfect finite models and inverse-system effectivity; Matlis biduality; and the convergent double-complex spectral sequence.

The file states the two augmentation-ideal results, K-injective replacement, Lazard, ML/right-half exactness, four perfectness closure/finite-model results, ring-tower unit reflection, the residue criterion, four completeness results, flat-implies-completely-flat and the two Matlis results. The two Check theorems are R04. R01 removes repeated tower ownership; R02–R03 identify native missing headlines. Full cotangent objects, the general derived functors/reflector, algebra-completion models, effectivity and abutment are named in the docstring with their unavailable constructions. The homogeneous Roby carrier needs an explicit docstring exclusion (R06). This review does not ask for placeholder definitions or special-case replacements for those constructions.

**Seeded source sample: 15 of 15 targets read at their locators.** Source references below use the sources service's numbered extractions. There are no README locators flagged “unverified”. Definitions, hypotheses and source edition were compared, including steps invoked inside proofs. Page numbers are printed/chapter-local pages, not browser PDF indices.

| Sampled target | Text read and hypothesis comparison | Outcome |
| --- | --- | --- |
| 0.1 Simplicial polynomial resolutions | StacksCt lines 81–128, 144–199, 360–403: Definitions 3.1–3.2, Remark 5.5 and Lemmas 4.1–4.3/5.6–5.7, pp.2–5,9–10. Degreewise polynomial plus augmentation equivalence gives the required resolution condition. | Supported. The complex-valued extension uses the stated projective-presheaf/direct-sum totalization argument; the source first states the module-valued construction. |
| 0.2 Derived tensor | StacksMA lines 6709–6850: Definition 15.60.1, Lemmas 15.60.7/10/12 and Definition 15.60.13, pp.144–147. Arbitrary commutative rings and unbounded complexes; bounded-above flat models are a sufficient special case. | Supported; R02 concerns its missing Lean headline. |
| 0.3 Non-additive derived functors | DoldPuppe lines 919–967, §§4.1–4.7, pp.227–228, together with its homotopy and Dold–Kan arguments; SAG lines 62226–62253, Proposition 25.2.1.2/Corollary 25.2.1.3, pp.1698–1699. | Supported via bounded-above projective models. Dold–Puppe's numbered statements are initially for single shifted objects, not a verbatim theorem about every connective complex; the README gives the extension argument. The filtered-colimit qualification matters. |
| 0.6 Cotangent universal property | StacksCt lines 206–223 and 933–948; StacksDefos lines 161–176, Lemma 2.3; Bhatt12 lines 1185–1208, Remark 6.6/(6), p.25, with trivial monoids. | Ext-zero, Ext-one and negative-Ext vanishing supported. Correct the p.22 locator to p.21 (R05). |
| 0.8 Transitivity | StacksCt lines 704–715, Proposition 7.4, Tag 08QX, p.16. | Full ring-map triangle supported; the first term is derived tensor. The pinned cone sign is checked below. |
| 0.11 Localization/colimits | StacksCt lines 108–128, 779–847: Lemma 3.4 p.3, Lemmas 8.1/8.6 pp.17–19; localization vanishing also in 8.4. | Supported, including filtered systems without finite-presentation restrictions. |
| 0.12 Smooth cotangent | StacksCt lines 847 onward, Lemma 9.1, Tag 08R5, p.19. Polynomial calculation at lines 224–232. | Smooth gives the finite-projective degree-zero differential module; arbitrary polynomial algebras give free differentials without a finiteness assertion. |
| 0.14 Exterior powers | SAG lines 62288–62305, 62365 onward, 62405–62436, pp.1700–1704; DoldPuppe §4. | Supported with the README's explicit correction of signed coinvariants to the alternating quotient. See Source issues. |
| 0.15 Symmetric powers | SAG lines 62262–62287 and 62412–62436, Construction 25.2.2.1 and Proposition 25.2.3.4(1), pp.1699,1703–1704; DoldPuppe Example 4.10, pp.229–230. | Supported. Agreement with underived powers is restricted to flat discrete inputs; no division by factorials. |
| 0.25 Square-zero obstruction | StacksCt lines 1388–1432, Situation 16.0.1/Lemma 16.1, pp.31–32; StacksDefos §2; StacksAlg Lemma 10.99.8. | General A-linear kernel map is allowed. Flat lifting additionally uses the canonical induced isomorphism `J ⊗ B → N`, not an unmarked isomorphism of modules. |
| 1.3 Completion reflector | StacksMA lines 12163–12179, 12293–12322, 12344–12395: Lemmas 15.93.10/18/20/21, pp.264–268. | Supported for finitely generated I, with unit and adjunction; colimits are in the complete category. |
| 1.4 Koszul completion tower | StacksMA lines 12293–12322, Lemma 15.93.18, p.267, and its preceding Situation 15.93.15. | Supported; degree −1 transition is multiplication by the generator, not the identity. |
| 1.5 Ordinary quotient towers | StacksMA lines 12520–12534, Lemma 15.95.2, p.271; lines 12703–12765, Lemma 15.96.1 and Proposition 15.96.2, pp.275–276. | Supported with bounded power torsion in the principal case or Noetherianness in the general claim. The README correctly limits the square-zero example's splitting to D(ℤ_p). |
| 1.6 Simplicial algebra completion | Prisms lines 395–446, §1.2 and footnotes 5–6, pp.10–11; StacksCt Definitions/Remark 3.1/5.5. | The Koszul-derived algebra tower is supported. The strict-model descent, localized adjunction and adapters are construction targets elaborating this argument, not a verbatim theorem numbered in Prisms. |
| 1.9 Complete faithful-flat descent | BMS19 lines 751–765 and 973–977, Theorem 3.1 proof and Remark 4.9, printed pp.217,223; Lemmas 4.6–4.7 and Corollary 4.8. | Supported: the proof expressly supplies arbitrary-module fpqc descent; bounded p-power torsion permits the mod-pⁿ limit argument. No hyperdescent is claimed. |

**Adversarial calculations.** The following 117 rows record values, not merely elaboration. They cover every numbered section, the seeded sample, all Lean theorem families and the additional constructions used in findings. Related naturality/composition laws are tested on the displayed maps. “Retain” means the calculation did not refute the stated mathematics; it does not override an ownership or form finding. Here `k` is a field, `p` is prime, and shifts use `Hⁱ(M[1]) = Hⁱ⁺¹(M)`.

| Statement | Instances tried | Computed values on the two sides / wrong model | Result; change |
| --- | --- | --- | --- |
| 0.DP.1 Homogeneity | Identity, zero law; scalar 2 over ℤ | `id(2x)=2id(x)`; zero law gives `0=2ⁿ0` for every n. Degree need not be unique for zero. | Retain definition; R04 removes unused Lean scaffolding. |
| 0.DP.1 Ground evaluation | p=2 and p=3, law `x^p y−xy^p` | Every ground value is 0; at `(X,1)` the value is `X²−X` or `X³−X`, each with leading coefficient 1. | True Check; delete Lean theorem, R04. |
| 0.DP.1 Multiplicativity | Identity, determinant on 2×2 matrices, zero law | `id(1)=1`; `det(diag(a,b))=ab`; zero law sends 1 to 0 in a nonzero target and is excluded. | Retain README definition. |
| 0.DP.2 Homogeneous pieces | M=0; a free line; d=0,1,2 | `Γ⁰(0)=A`, `Γᵈ(0)=0` for d>0; `Γ¹(M)=M`; line's `Γ²=Aγ₂`. | Retain; degree-zero unit prevents zero-object substitute. |
| 0.DP.2 Integral relations | M=ℤ/2 over ℤ | `Γ²(M)=ℤ/4`; treating Γ² as Sym² instead gives ℤ/2. | Retain integral divided powers. |
| 0.DP.2 Homogeneous grading | Free line over ℤ and F₂ | `γ₁(e)²=2γ₂(e)`; after reduction mod 2 the left side is 0 while `γ₂(e)≠0`. | Retain; no factorial inversion. |
| 0.DP.2 Universal law | Rank two, degree two | Coefficient of TU in `γ₂(Te+Uf)` is `γ₁(e)γ₁(f)`; pure coefficients are `γ₂(e)`, `γ₂(f)`. | Retain representability normalization. |
| 0.DP.2 Base change | ℤ→F₂, a free line | `Γ²_ℤ(ℤ)⊗F₂=F₂γ₂=Γ²_F₂(F₂)`; γ₁² maps to 0. | Retain. |
| 0.DP.2 Tensor map | Two free lines, degree two | `γ₂(e)⊗γ₂(f)` maps to `γ₂(e⊗f)` with coefficient 1, not 2. | Retain. |
| 0.DP.2 Roby internal product | Rank-one algebra, d=2 | Internal product has `γ₂(1)⋆γ₂(1)=γ₂(1)`; graded product is `6γ₄(1)`. | Retain distinction. |
| 0.DP.2 Symmetric-tensor comparison | Free rank two, d=2 over ℤ | Invariant basis `e⊗e`, `e⊗f+f⊗e`, `f⊗f`; three divided monomials map to these, without 1/2. | Retain flat hypothesis. |
| 0.DP.3 Augmentation | Scalars; γ₀ and γ₁/γ₂; M=0 | ε(r)=r, ε(γ₀)=1, ε(γₙ)=0 for n>0; M=0 gives ε=id_A. Evaluation of γ₂ at 1 over ℚ gives 1/2 and is not ε. | Retain; source/target fixed. |
| 0.DP.3 Positive ideal | Free line, n=1,2; scalar 1 | Positive generators have ε=0; ε(1)=1 in a nonzero ring. Zero ring gives ideal=0=top. | Retain. |
| 0.DP.3 Positive remainder | `x=3+γ₂(e)` over ℤ | `x−ε(x)=γ₂(e)`; for x=3 the remainder is 0. | Retain. |
| 0.DP.3 Kernel/span equality | Same x and arbitrary positive monomials | Both contain γ₂(e); neither contains 3 over ℤ; killing all positive generators leaves exactly A. | Retain `augmentationIdeal_eq_span_dp`. |
| 0.DP.3 Splitting | Scalar r and u in ker ε | Maps send `r+u ↦ (r,u) ↦ r+u`; scalar projection of u is 0. | Retain; canonical augmentation excludes arbitrary splitting. |
| 0.DP.3 Extended ideal remainder | I=(2), x=2+2γ₁(e) | x lies in IΓ; its remainder is 2γ₁(e), again in IΓ; the scalar part is 2. | Retain. |
| 0.DP.3 Intersection/product | I=(2), free line; I=0,A | Both sides have degree-zero part 0 and degree-n part `2ℤγₙ` for n>0; boundaries give 0 and Γ₊ respectively. | Retain `map_inf_augmentationIdeal`; splitting removes need for flat M. |
| 0.DP.3 Degree-two detector | F₂, target F₂[ε]/ε² | γ₂(1) maps to ε; γ₁(1), γ₄(1) map to 0; ε²=0 matches `6γ₄→0`. | Retain README construction. |
| 0.DP.3 Degree-one insufficiency | F₂ line | Degree-two part of `(γ₁(M))` is 0; γ₂ maps to ε≠0 in the detector. | True Check; R04 deletes Lean copy. |
| 0.K.1 Finite Koszul complex | Empty tuple; (1); (2) over ℤ | Empty gives A[0]; (1) is contractible; `[ℤ →2 ℤ]` has H⁻¹=0,H⁰=F₂. | Retain. |
| 0.K.1 Regularity hypothesis | (2) over ℤ/4 | H⁻¹=ann(2)=F₂ and H⁰=F₂, versus the regular-sequence prediction H⁻¹=0. | Excluded by weak regularity; retain. |
| 0.K.1 Differential and null-homotopy | Two generators x,y | `d(e₁∧e₂)=x e₂−y e₁`; `d(e₁∧v)+e₁∧dv=xv`. The opposite sign leaves an unwanted 2-term over ℤ. | Retain signs and maps. |
| 0.I.1 K-injective existence | ℤ[0], field complexes, zero | Resolution `[ℚ→ℚ/ℤ]` has H⁰=ℤ,H¹=0; Hom from F_p has H¹=F_p. Zero resolves to zero. | Retain native headline. |
| 0.1 Standard resolution | A→A; A→A[t] | Empty-variable constant resolution has value A; polynomial constant resolution has A[t]; standard P₀=A[B], P₁=A[A[B]] realizes B. | Retain. |
| 0.1 Resolution non-example | A[t]→A[t]/t², A≠0 | Constant source has H⁰=A[t]; augmentation kernel `(t²)` is nonzero, so it is not equivalent to the quotient. | Retain discrimination. |
| 0.1 Resolution independence | Identity F and constant F=A | Both resolutions give B for identity underlying value; constant simplicial A realizes A[0], with no positive simplicial homology. | Retain comparison in derived category. |
| 0.2 K-flat replacement | ℤ/p; bi-infinite ×2 over ℤ/4 | Free two-term model resolves ℤ/p. Bi-infinite complex has H=0 but its F₂ tensor has Hⁱ=F₂ for every i. | True headline absent; R02. |
| 0.2 Derived tensor unit/zero | R[0], M; zero factor | `R⊗ᴸM=M`; `0⊗ᴸM=0`; ordinary tensor gives the same on these models. | Retain. |
| 0.2 Tor and flat models | F_p⊗ᴸ_ℤF_p, p=2,3 | H⁰=F_p and H⁻¹=F_p; underived tensor only has H⁰. | Retain bounded-flat comparison. |
| 0.2 K-flat closure | Shifts, cone of id_R, filtered finite free sums | Shift moves the lone R term; cone(id_R) has H=0 after every tensor; colimit of Rⁿ is ⊕R and tensor distributes over that sum. | Retain closure and realization route. |
| 0.2 K5 specialization | Two based unknots, W=DualNumber R | Underlying tensor `W⊗_W W=W`; quantum shifts give `1+1−1=1`; zero factor gives 0. | Mathematics agrees; K5 on main constructs its bounded theory, so do not describe it as an already-adopted supplier change. |
| 0.2.1 Lazard | R⁰,R¹,ℚ over ℤ,F₂ over ℤ | Constant diagrams give 0,R; denominator map `a↦a/d` and transition `a↦(e/d)a` agree; ×2 is injective on ℤ but zero on F₂. | Retain headline, exclude nonflat F₂. |
| 0.2.2 Shuffle (R03) | Two degree-one generators | Shuffle is `s₁x⊗s₀y−s₀x⊗s₁y`; factor interchange acts by −1 on H⁻²=A. In F₂, −1=1. | Retain integral sign, no division; add the native headline (R03). |
| 0.2.2 Flat versus constant model | Simplicial free resolution of F₂; constant F₂ | Free model's self-tensor has H⁰=H⁻¹=F₂; constant model's underived tensor has only H⁰=F₂. | Retain flatness qualification. |
| 0.2.2 Bisimplicial diagonal | Constant A; external degree-one objects | Constant diagonal and total each give A[0]; two degree-one objects give A in total degree −2 with transposition −1. | Retain comparison. |
| 0.3 Additive/constant functor | F=id; constant F=R′; input 0 | Lid(M)=M; Lconstant(M)=R′[0], including M=0, whereas a falsely additive model would send 0 to 0. | Retain. |
| 0.3 Nonadditive square | M=F₂ over ℤ | Derived tensor square has H⁰=H⁻¹=F₂; the ordinary square is F₂[0]. | Retain. |
| 0.3 Infinite-rank extension | V=⊕ℕF₂; double dual | Finite-dimensional values equal V_i; their colimit is V. The given all-projective functor gives V** with evaluation not onto. | Retain filtered-colimit hypothesis. |
| 0.4 Full cotangent model | Identity; polynomial; ℤ→F_p | L_id=0; L_(A[t]/A)=A[t]dt[0]; L_(F_p/ℤ)=F_p[1]. | Retain; truncated substitute fails later examples. |
| 0.4 Nonreduced model | B=k[ε]/ε² | Differential `[B→B dε]` is multiplication by 2ε. If char k≠2, H⁻¹=kε,H⁰=k; in char 2 both are B. | Retain full Jacobian, including p=2. |
| 0.5 Exal and Baer law | A=ℤ,B=F_p,M=F_p | Ext¹=F_p; ℤ/p² is the nonzero normalized class, split F_p[ε] is 0; adding a class p times gives 0. | Retain p=2 and p=3 normalization. |
| 0.5 Split multiplication | B⊕M with M²=0 | `(b,m)(c,n)=(bc,bn+cm)`; the kernel product is 0 and quotient product bc. | Retain identified kernel, not arbitrary ideal. |
| 0.5 Automorphisms | B=A[t], split extension | Automorphism fixing kernel/quotient sends `t↦t+m`; composition adds m; for B=A only m=0. | Retain derivation parameter. |
| 0.7 Low truncations | Identity; ℤ→F_p | Both truncations vanish for identity; quotient has F_p in degree −1 and no degree 0. | Retain. |
| 0.7 Lichtenbaum–Schlessinger | B=k[x,y]/(x,y)² | Two syzygies modulo Koszul relations give a degree−2 kernel k; naive two-term truncation has H⁻²=0. | Retain full-complex negative control. |
| 0.6 Ext-zero/Ext-one | Polynomial B=A[t]; ℤ→F_p | Polynomial gives Hom(L,M)=M and Ext¹=0; regular quotient gives Hom=0, Ext¹(F_p[1],F_p[0])=F_p. | Retain target shifts. |
| 0.6 Negative Ext and normalization | L connective; ℤ→F₃ | Hom(L,M[−n])=0 for n>0; the conormal generator 3 maps to 1, while multiplication by 2 sends it to 2. | Retain chosen comparison; R05 locator only. |
| 0.8 Transitivity | A=B; B=C | First term 0 gives L_(C/A)→L_(C/B)=id; third term 0 gives the first map an isomorphism. | Retain general triangle. |
| 0.8 Cone sign | Zero map ℚ[0]→ℚ[0] | Cone=ℚ[1]⊕ℚ[0]; its shifted-source summand maps to ℚ[1] by −1 in the pinned triangle. | Retain negative convention. |
| 0.9 Simplicial cotangent/diagonal | Constant rings; identity simplicial map | Constant realization recovers ordinary L; identity has L=0; constant ℤ→F_p retains F_p in degree −1. | Retain. |
| 0.10 Base change | Polynomial flat square; ℤ→F_p twice | Flat square transports dt to dt. Ordinary self-base-change gives L_(F_p/F_p)=0 but base-changed L_(F_p/ℤ)=F_p[1]. | Tor₁=F_p excludes the latter from the ordinary square assertion. |
| 0.11 Localization | A=k[t], invert t; invert 1 | L_(A[1/t]/A)=0; absolute differentials remain A[1/t]dt. Inverting 1 is identity and relative L=0. | Retain. |
| 0.11 Filtered colimits | Polynomial rings in first n variables | Both sides are `⊕ᵢ B dtᵢ` in degree 0; an infinite product would add nonexistent infinite-support differentials. | Retain. |
| 0.12 Smooth computation | A[t₁,…,t_r], r=0,1,2; infinite variables | Finite ranks are 0,1,2 in degree 0; infinite polynomial case is an infinite direct sum, not finite-projective. | Retain the separate polynomial generality. |
| 0.13 Regular quotient | f=t² in k[t]; empty sequence | Model `[B→Bdt]` has differential 2t; char 2 gives zero. Empty quotient's relative complex is 0. | Retain. |
| 0.14 Exterior weights | M=0; line; n=0,1,2 | `L∧⁰(0)=B`, `L∧¹(M)=M`, `L∧²(B)=0`. Signed coinvariants of the line give ℤ/2 or F₂ instead. | Retain README correction of SAG. |
| 0.14 Exterior base change | ℤ²→F₂², n=2 | Both sides have rank 1, generated by e∧f; e∧e=0 on both. | Retain. |
| 0.15 Symmetric powers | Zero, line, rank two; n=0,1,2 | Weight zero=B, weight one=M; Sym²(line)=B; Sym²(B²) has basis e²,ef,f², rank 3 even in F₂. | Retain. |
| 0.16 Divided powers | Flat line in char p | Γ⁰=B, Γ¹=B, Γᵖ=Bγ_p; `γ₁^p=p!γ_p=0` in F_p while γ_p≠0. | Retain integral structure. |
| 0.17 Triangle filtration | Split B²=Be⊕Bf, n=2 | Graded pieces are 0, B(e∧f), 0; total exterior square is B. Zero end gives the remaining exterior power. | Retain finite filtration. |
| 0.17 Décalage | M=ℤ, n=2; also F₂ | `L∧²(M[1])=Γ²(M)[2]=M[2]`; `LSym²(M[1])=∧²(M)[2]=0`. | Retain the two distinct formulas. |
| 0.25 Obstruction/flat lift | ℤ/4→F₂, B=F₂[t], canonical c | Lift ℤ/4[t] has kernel 2ℤ/4[t]=F₂[t] and Tor₁ against F₂ is 0; smooth Ext²=0. | Retain. |
| 0.25 Kernel-map non-example | Same base, B=F₂,N=F₂,c=0 | F₂[ε] solves arbitrary-c extension problem, but Tor₁ over ℤ/4 against F₂ is nonzero; canonical c would be 1↦ε, not 0. | Retain exclusion from flat claim. |
| 0.25 Morphism lifts | k[x]→k, x↦0; k[ε]→k | Lifts x↦0 and x↦ε differ by derivation ε; Ext¹=0 does not mean one lift as a map. | Retain torsor, not unique element. |
| 0.25 Conormal boundary and lift sign | k[x]/x³→k[x]/x²→k; translation over ℚ[ε] | The next conormal map sends x² to 0 in (x)/(x²), so the preceding boundary surjects onto k. Separately, h₁(X)−X=ε, its inverse gives −ε, and h_a h_b=h_(a+b). | Retain nonzero boundary and the marked translation sign; no unchosen generator sign is inferred. |
| 1.T.1 Shift and maps | Identity tower; zero-transition tower | δ=(a_n−a_(n+1)) has diagonal kernel A and is onto; δ=id for zero transitions, giving kernel=cokernel=0. | Sound; import owner under R01. |
| 1.T.1 Non-ML tower | ℤ with transitions ×p | Kernel=0; cokernel=ℤ_p/ℤ via Σpⁿa_n; telescoping sends δ(a) to a₀∈ℤ. | Sound; R01. |
| 1.T.1 Tower functor/composition | Constant ℤ; maps ×2 then ×3 | Product and induced maps are ×2,×3 and composite ×6; zero map induces 0; identity induces id. | Sound native definitions; R01. |
| 1.T.1 ML vanishing | Quotients ℤ/pⁿ; constant A | lim=ℤ_p,A respectively; lim¹=0 in both, with surjective shift. | Sound headline; R01 imports it. |
| 1.T.1 Converse not asserted | ℤ_p with transitions ×p | Images pᵐℤ_p do not stabilize; shift is onto by convergent sums, so lim¹=0 nonetheless. | Retain one-way ML implication. |
| 1.T.1 Six-term boundary | pⁿℤ→ℤ→ℤ/pⁿ; split towers | Boundary is quotient ℤ_p→ℤ_p/ℤ, nonzero; for split constant towers it is 0. | Sound; the imported contract includes this left half. |
| 1.T.1 Milnor degree | K_n=[ℤ→ℤ/pⁿ], degrees 0,1 | H⁰(K_n)=pⁿℤ,H¹=0; Rlim has H¹=ℤ_p/ℤ, matching lim¹H⁰. | Sound; R01. |
| 1.1 Strict derived limit | Constant complex M, zero transitions | Constant identity tower gives Rlim=M; zero transitions give fib(id)=0. | Sound; generic cone owned on main. |
| 1.1 Levelwise triangles limitation | V=⊕ℕk; tails A_n; C_n=kⁿ | lim A=0, lim V=V, lim C=∏k, lim¹A=(∏k)/(⊕k)≠0. | Retain strict/coherent input; levelwise triangles alone lose the boundary. |
| 1.1 Homotopy-square map | Differential convention δ′u−vδ=dh+hd | On fib(δ), `(x,y)↦(ux,vy+hx)` satisfies the chain equation; replacing +h by −h leaves `2(dh+hd)` over ℤ. | Sound; import its existing owner. |
| 1.1 Cofinal shift | Multiplication-by-p tower, omit r stages | Tail sum becomes p⁻ʳ times the original class modulo ℤ after the finite integral correction. Constant tower remains id. | Retain normalization in imported comparison. |
| 1.1.1 Derived Hom | L=A; L=F_p,M=ℤ; L=ℤ[1/p],M=ℤ | RHom(A,M)=M; for F_p, H⁰=0,H¹=F_p; for ℤ[1/p], H⁰=0,H¹=ℤ_p/ℤ. | Retain nonperfect generality. |
| 1.2 Completeness definition | I=0, I=A; ℤ_p and ℚ_p | I=0 tests Hom(0,M)=0 for all M; I=A forces M=0; ℤ_p is p-complete, ℚ_p is not since Hom(ℤ[1/p],ℚ_p)≠0. | Retain native predicate. |
| 1.2 Generators/radical | (p) and (p²); empty generating set | Both localization tests use ℤ[1/p]; empty set spans 0 and both conditions are vacuous. | Retain finite generator theorem; radical theorem needs no FG. |
| 1.2 Cohomology/triangles | ℤ_p[1]; cone(×p on ℤ_p) | Only H⁻¹=ℤ_p in first; cone has only H⁰=F_p. Both are derived complete, as are their shifts. | Retain both Lean theorems. |
| 1.3 Reflector/unit/idempotence | ℤ,F_p,ℤ[1/p]; I=0,A | Λ_p values ℤ_p,F_p,0; Λ_pℤ_p=ℤ_p. Λ₀=id and Λ_A=0; unit sends 1 to 1 for ℤ→ℤ_p. | Retain FG and actual unit. |
| 1.3 Adjunction/Nakayama | Complete N=ℤ_p; M=F_p or ℤ[1/p] | Hom(Λℤ,N)=Hom(ℤ,N)=ℤ_p; F_p reduction is F_p≠0. ℤ[1/p] has zero reduction but is not complete. | Retain completeness in Nakayama. |
| 1.3 Complete-category colimits | I=0; multiplication-by-2 on ℤ | Reflector is id, and cokernel in the complete derived category is cone(2), with H⁰=F₂. Ordinary module-only colimits would use the wrong category. | Retain. |
| 1.4 Koszul tower | f=p; f=0; empty tuple | p-tower has maps (p,id) in degrees −1,0. For f=0 the −1 maps are 0, so Rlim leaves M; empty tuple is constant M. | Retain. |
| 1.5 Noetherian comparison | A=ℤ_p,M=A; finite A-module F_p | Both Koszul and quotient completion give ℤ_p or F_p in degree 0. | Retain. |
| 1.5 Non-Noetherian boundary | A=ℤ_p⋉ℚ_p/ℤ_p, M=A | Koszul completion has H⁻¹=ℤ_p,H⁰=ℤ_p; ordinary quotient tower gives only H⁰=ℤ_p. | Retain the counterexample to unrestricted quotient completion. |
| 1.5 Module action on that example | Same A; R=ℤ_p | After restriction to R it splits as R[1]⊕R. In D(A), Hom(ΛA,R[1])=Hom(A,R[1])=0; a split object would have a nonzero projection. | Retain the README's restricted splitting. |
| 1.6 Algebra localization | Polynomial resolution P→0 with P₀≠0 | Strict Hom(0,P) is empty, whereas Hom(A,P) has the structure map; after localization P≃0, both relevant maps to P are unique. | Retain localization before algebra adjunction. |
| 1.6 Completion models | I=0, I=A; ℤ[d],I=(p,d) | Values are B,0 and ℤ_p[[d]], respectively; the last retains d, unlike reduction to ℤ_p. | Retain finite ideal and derived models. |
| 1.6 Generator independence/naturality | Empty tuple versus single zero generator; identity map | Extra negative Koszul term has zero transitions and limit 0; both completions are id. Identity ring map induces identity on completed coefficients. | Retain. |
| 1.7 Complete flatness | ℤ,ℤ_p,F_p as ℤ-modules; I=(p) | First two have Tor₁=0 and flat reduction F_p; F_p has Tor₁(F_p,F_p)=F_p and is excluded. | Retain native predicate and flat implication. |
| 1.7 Unit ideal | I=A | A/I=0, all higher Tor=0 and reduction=0, so every module is I-completely flat; completeness would force zero but is not in this predicate. | Retain deliberate distinction. |
| 1.8 Tor amplitude/torsion | M=∏ₙℤ/pⁿ | Derived p-complete with p-complete amplitude in [−1,0], but torsion exponents are unbounded. | Retain bounded-torsion hypotheses where used; no claim amplitude alone bounds torsion. |
| 1.9 Descent | ℤ_p→ℤ_p×ℤ_p; identity | Split Čech augmentation contracts onto M, giving Tot=M; identity does the same. | Retain full M, not only flat M. |
| 1.9 Negative descent control | ℤ_p→F_p | Mod-p map is faithfully flat as F_p→F_p, but Tor₁^ℤ_p(F_p,F_p)=F_p. | Excluded by complete flatness. |
| 1.E.0 Perfect definition | A=k×k, e=(1,0), M=eA | M is finite projective of ranks (1,0). Any bounded finite-free complex has equal Euler ranks at the two factors. | Retain projective rather than finite-free perfection. |
| 1.E.0 Pseudo-coherent definition | Same eA | Alternating e and 1−e gives a bounded-above rank-one free resolution of eA; a finite free replacement is not required. | Retain `isPerfect_isPseudoCoherent`. |
| 1.E.0 Retracts | Projection e on A; zero retract | Image eA is perfect; image 0 is zero/perfect. The inclusion and projection composite is id on the image. | Retain actual retraction hypothesis. |
| 1.E.0 Shifts | A[0], shift n=−1,0,1 | Supports are {1},{0},{−1}; each is bounded finite-projective. | Retain shift theorem. |
| 1.E.0 Triangles | Cone(×2 on ℤ[0]) | Third vertex has finite-free two-term model and H⁰=F₂, despite F₂ not projective. | Retain distinguished-triangle hypothesis. |
| 1.E.0 Finite free model | Zero, A[0], unbounded free terms | Bounds b=0 admit first two; a nonzero term at b+1 makes the third fail. | Retain real bound predicate. |
| 1.E.0 Ring-tower limit/unit reflection | k[t]/tⁿ, limit k[[t]] | 1+t has inverse Σ(−t)ⁿ and constant term 1; t maps to 0 at the first residue stage and is not a unit. | Retain full compatible-family universal property. |
| 1.E.0 Locally nil transition kernels | Infinitely generated ideal with generators xᵢ²=0 | Each finite-support element is nilpotent; products x₁⋯x_n survive for every n. | Retain elementwise nilpotence, not uniform nilpotence. |
| 1.E.0 Residue-field criterion | [k[[t]]→t k[[t]]]; k over k[ε]/ε² | First residue complex has H⁻¹=k,H⁰=k, giving interval [−1,0]. Second has Torᵢ(k,k)=k for every i and fails any fixed interval. | Retain pseudo-coherence and common interval. |
| 1.E.0 Zero ring/universes | R=0; surjections onto fields | No such field quotient exists, but every unital R-module is zero, so conclusion is also zero; residue fields of nonzero R fit the chosen universe. | No vacuity defect. |
| 1.E.0 Compatible models | Constant A and A[0]; shifted [A→t A] modulo tⁿ | Constant matrices commute identically; reductions of ×t agree stagewise; individual choices without the transition equality need not define a tower. | Retain strict compatibility requirement. |
| 1.E.0 Strict finite-model limit | [A/tⁿ→t A/tⁿ] over k[[t]] | Finite-stage H⁻¹=k has zero transition, so its limit is 0; limit complex has H⁰=k,H⁻¹=0. | Retain Rlim/Milnor comparison. |
| 1.E.1 Effectivity | Same compatible two-term system; constant projective eA | Effectivizations are [A→t A] and eA[0], with the common interval unchanged; varying bounds alone would not give one finite interval. | Retain uniform amplitude. |
| 1.M.1 Arithmetic Matlis | R=ℤ_p,E=ℚ_p/ℤ_p; M=R,E | D(R)=E, D(E)=R; evaluation on each identifies it with its double dual. | Retain; finite residue hypothesis belongs only to arithmetic specializations. |
| 1.M.2 General Matlis | Any field k, M=kʳ, r=0,1,2 | D(M)=kʳ and the evaluation matrix is identity of size r; artinian and finite coincide. | Both native headlines retain arbitrary k. |
| 1.M.2 Completeness necessity | R=k[x]_(x), E its residue hull | End_R(E)=k[[x]], strictly larger than R; evaluation of R has image R inside its completion. | Retain completeness in Lean. |
| 1.M.2 Finiteness necessity | M=⊕ℕk | Dual is ∏ℕk, and evaluation into M** is not onto; finite-dimensional tests would miss this. | Retain finite/Artinian hypotheses. |
| S.1 Pages/abutment | One row, one column; acyclic identity square | Row gives E₂^(p,0)=Hᵖ(Tot); column gives E₂^(0,q)=H^q(Tot); identity square has E₂=H(Tot)=0. | Retain first quadrant. |
| S.1 Filtration normalization | Single nonzero total degree n | Row has FⁿHⁿ=Hⁿ,Fⁿ⁺¹=0; column has F⁰Hⁿ=Hⁿ,F¹=0. | Retain actual abutment filtration. |
| S.1 Stabilization bound | (p,q)=(0,1) | At r=2 an outgoing map to (2,0) can exist; for r>2 both potential source/target outside the quadrant vanish. | Retain strict bound `r>max(p,q+1)`. |
| S.1 Five-term/extended sequence | Only A^(0,0)=ℤ; n=0,1 | At n=0 both edge maps are id_ℤ, composite id≠0; at n=1 all positive-degree terms are 0. | Retain n≥1; source locator remains unverified below. |

These checks also cover zero modules, zero/unit ideals, the zero ring, characteristic 2 and 3, nonreduced rings, nonflat base change, infinite rank, non-Noetherian torsion and the signs of tensor, cone and conormal maps. No claim here is narrowed to “good” primes or finite residue fields to evade these examples.

**Pinned-library audit.** Mathlib is `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti is `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, checked in the manifest. I searched by tensor, acyclicity, cotangent/conormal, divided-power, completion, tower and injective-envelope objects, not just proposed declaration names. The following opened declarations distinguish the existing inputs from the proposed additions:

| Pinned file and line | Declaration/content checked |
| --- | --- |
| `Mathlib/RingTheory/PolynomialLaw/Basic.lean:77` | `PolynomialLaw` supplies scalar-extension functions and naturality; it does not supply homogeneity or multiplicativity. Its scalar algebra universe equals the base universe, as the Lean predicate does. |
| Same file:118,232,271 | `PolynomialLaw.id`, `ground`, `comp`; ground evaluation alone is weaker than a law. |
| `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:147,171,235,316,346,364,431` | `induction_on`, `dp_mul`, `algHom_ext`, `lift'`, `lift`, `lift_apply_dp`, `map_apply_dp`; the real augmentation body uses the last universal-property interface, not opaque data. |
| `Mathlib/RingTheory/DividedPowers/Basic.lean:95` | `dividedPowersBot`; zero-ideal lift gives precisely the desired scalar retraction. |
| `Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean:160`; `Mathlib/Algebra/Homology/Homotopy.lean:740` | Native alternating-face complexes and `HomotopyEquiv`, including both maps and both homotopies; enough to state the tensor comparison of R03. |
| `Mathlib/Algebra/Homology/Monoidal.lean:48` | `HomologicalComplex.tensorObj` is the total tensor of native complexes; enough for R02 without a derived bifunctor. |
| `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:701` | `Acyclic` means exact at every degree. |
| `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:42,133` | `IsKInjective` tests maps from acyclic complexes by null-homotopy; the bounded-below injective result is not unbounded replacement existence. |
| `Mathlib/RingTheory/Flat/EquationalCriterion.lean:270` | `Module.Flat.exists_factorization_of_finitePresentation` factors a map from a finitely presented module through a finite free module; it does not yet state the filtered-diagram colimit headline. |
| `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:324,578` | `exact_cotangentComplex_toKaehler`, `Algebra.Generators.equivH1Cotangent`; these provide the low truncation, not the full cotangent object. |
| `Mathlib/RingTheory/Derivation/ToSquareZero.lean:116` | `derivationToSquareZeroEquivLift` includes the scalar-tower and square-zero assumptions; it classifies lifts relative to a supplied lift. |
| `Mathlib/CategoryTheory/CofilteredSystem.lean:125,137` | Eventual range and `Functor.IsMittagLeffler`; no finiteness is built into the condition. |
| `Mathlib/CategoryTheory/Functor/OfSequence.lean:154` | `Functor.ofOpSequence`, direction n+1→n. |
| `Mathlib/Algebra/Homology/HomotopyCategory/Pretriangulated.lean:54,60` | `mappingCone.triangle`, `inl_v_triangle_mor₃_f`; the third map is the negative shifted projection. |
| `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:327` | `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`; finite module and Noetherian assumptions are retained. |
| `Mathlib/LinearAlgebra/Dual/Defs.lean:216` | `Module.bijective_dual_eval` is the finite-dimensional field duality, not general complete-local-ring Matlis duality. |
| `Mathlib/Algebra/Homology/Embedding/Basic.lean:225` | `embeddingDownNat`, converting homological n to cohomological −n. |
| `Mathlib/Algebra/Homology/HomotopyCategory/SpectralObject.lean:46` | `spectralObjectMappingCone`, a spectral object of complexes. |
| `Mathlib/CategoryTheory/Triangulated/SpectralObject.lean:246` | `mapHomologicalFunctor`, passing to the abelian spectral object. |
| `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:176,394` | `coreE₂CohomologicalNat`, `IsFirstQuadrant`; explicit quadrant vanishing. |
| `Mathlib/Algebra/Homology/SpectralObject/SpectralSequence.lean:480` | `spectralSequence` records pages and next-page homology isomorphisms, not the requested filtration on the given total cohomology. |
| `TauCeti/RingTheory/Ideal/ArtinRees.lean:78` | `TauCeti.ArtinRees.exists_controlled_lift`, finite module over a Noetherian ring, with one shift uniform in depth and surjection. |
| `TauCeti/Algebra/Module/Injective/Envelope/Basic.lean:101,172` | `IsInjectiveEnvelope` contains injectivity of the ambient module, injectivity of the map and essentiality of its range; `exists_linearEquiv` gives uniqueness. Arbitrary injective modules are not interchangeable with envelopes. |

No pinned linear-functional Koszul construction or full cotangent/derived-completion functor was found. The finite/projective/perfect and Matlis headlines are not replaced by the pinned finite-dimensional dual lemma. There is no duplicated fully qualified namespace declaration in another searched roadmap: the namespace search returns this folder at the reviewed head and its own version on main.

**Ownership and citation resolution.** Searches used `roadmaps grep` on both the open-head index and main, supplemented by the board packages and the supplied checkout files. Broad capped searches were followed by narrower object searches. Existing-roadmap revisions were not treated as new suppliers; the main text was used. This found the R01 collision. The rest of the ownership division has concrete evidence:

| Roadmap / current text | Resolved contract |
| --- | --- |
| `TauCetiRoadmap/AlgebraicTopology/README.md:954–996`, main | Generic towers and derived-limit cones are explicitly owned there. Item 1 follows at line 1011; citing it does not erase item 0. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:29–32,443–453`, main | Ordinary module replacements, cotangent/powers and completion are supplied by DerivedModuleAlgebra; ringed-site enhancement and point/affine comparison are the sheaf roadmap's additions. No reverse supplier edge is needed here. |
| `TauCetiRoadmap/KhovanovHomology/README.md:518,704–720`, main | K5 constructs the bounded projective tensor model over W=DualNumber R and quantum/connected-sum comparisons. The unbounded arbitrary-ring tensor in §0.2 is broader; its comparison with K5 is a distinct compatibility target. Main K5 does not yet say it consumes this new bifunctor. |
| `TauCetiRoadmap/PerfectoidSpaces/README.md:2334` (P0.19), and its supplier rows at 797–799 and 336, main | Ordinary cotangent and marked obstruction/sign laws are expressly consumed from this roadmap; P0.20 adds almost mathematics. P0.22 consumes the ordinary polynomial-lift normalization. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1295–1319`, main | F.10.3 consumes the ordinary perfectness predicate and its alias, adding DG/dualizable comparisons and traces. It does not own a second ordinary perfectness predicate. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:720`, main; `TauCetiRoadmap/AffineMorseLefschetz/README.md:208–228`, main | C3 and A4 exist and use cochain/Milnor or supported/exhaustion comparisons. Their generic tower supplier is AlgebraicTopology, consistent with R01. |
| `TauCetiRoadmap/DGFloer/README.md:554,647`, main | Complete inverse cochain filtrations and their Milnor inputs occur at the cited application. |
| `TauCetiRoadmap/CStarClassification/README.md:1402–1428`, supplied open head | CL8 §8.6 has the KK telescope/Milnor application and explicitly consumes AlgebraicTopology Stage 6.0's generic lim¹. Its ×2 tower gives lim¹=ℤ₂/ℤ, the same normalization tested here. |

All roadmap names in the downstream paragraph were found in the available main/open index. Names without a section there were treated as consumer descriptions, not prerequisites. The examples above are the specific section-level citations actually used in the text. Generic ordinary module constructions remain appropriately here except for R01's already-owned tower block; no later roadmap is silently used as a supplier.

**External formalization and additional sources.** AffineCrystalline v1.0.0 was fetched through the sources service from its public repository, without executing its code. In the extraction of `AffineCrystalline/Envelope/FreeConstruction/DPAlgebraAugmentation.lean`, lines 83,113,119,128,131,136,157,185 give the stated augmentation, generator/scalar values, span ideal, containment, remainder and span=kernel results, with `CommRing R`, `AddCommGroup M`, `Module R M` in one universe. These are external reference proofs, not pinned-library imports.

In its `Cohomology/Cech.lean`, AffineCrystalline line 88 defines `CechNerveData` with nonempty S(Z) and `Hom(X[n],Z) ≃ (Fin(n+1)→S(Z))`; `CechDerived.lean` line 74 states `rightDerivedLimIsoCech` with the module/smallness assumptions. At n=0 this requires a weakly initial object, which ℕᵒᵖ lacks: n has no map to n+1. Thus it is not an immediate generic countable-tower replacement. `Homology/TotM.lean` lines 915 and 1059 and `Homology/TotQuasiIso.lean` line 553 have the claimed exact-augmented-column/row and columnwise quasi-isomorphism hypotheses on `RawBi`. The README correctly calls them proof references requiring adaptation to Mathlib's carrier. Its manifest, AffineCrystalline line 12, pins Mathlib `c026161a…`; the repository licence is Apache-2.0.

StacksDual lines 456–469, Proposition 47.7.8 (Tag 08Z9), verifies both Matlis headlines with a complete Noetherian local ring and arbitrary residue field. Lines 470–477 give the completion-side addendum. The author errata IllusieI and IllusieII were also read; they were not treated as a substitute for reading the unavailable monograph passages. No source prose was copied into the report or worktree, and fetched text supplied no instructions used in the review.

## Not verifiable

- **IllusieCC**, *Complexe cotangent et déformations I*, LNM 239, the monograph locators cited for the full cotangent/power theory: the DOI route through the sources service returned an uncertified/paywalled source. I did not bypass access restrictions. The overlapping sampled mathematics was checked in StacksCt, DoldPuppe, SAG and Bhatt12; the original monograph pages themselves are not certified. Its separately accessible author errata were read.
- **NSW**, *Cohomology of Number Fields*, Proposition 2.1.1, printed p.99, and Lemma 2.2.4, printed p.105: both requests to the author-hosted PDF through the sources service, including a download-query retry, returned the author landing page rather than the book. These precise locators remain uncertified. The spectral-sequence calculations and pinned-carrier audit above were completed independently. The missing-source record names this work once.
- The AffineCrystalline source declarations and licence were verified at the cited release; this review did not build that external project or certify a port to the present pins. No such port is claimed complete in the README.

## Source issues

- **Error** in SAG at Construction 25.2.2.2, printed p.1700: the source says signed-permutation coinvariants are exterior powers; it should be the alternating quotient also killing repeated factors; affects a stated result. Witness: SAG lines 62288–62295; a rank-one ℤ-module gives ℤ/2 by coinvariants and 0 by exterior square. The README already corrects this.
- **Error** in SAG at Proposition 25.2.3.4(2), printed p.1703: the source identifies flat-module exterior powers with signed-permutation coinvariants; it should identify them with the alternating quotient; affects a stated result. Witness: SAG lines 62415–62418 and the same flat rank-one example.
- **Misprint** in StacksCt at Lemma 92.16.1 proof, printed p.32: the source reverses A and A′ in the parenthetical truncation identification; it should use the cotangent complex of A over A′; affects the proof. Witness: StacksCt lines 1424–1428; the given ring map is A′→A.
- **Misprint** in StacksMA at Lemma 15.93.21 proof of (2), printed p.268: the source says the completed cone vanishes below r; it should say below −r; affects the proof. Witness: StacksMA lines 12392–12395; the Koszul complex occupies [−r,0].
- **Error** in StacksMA at §15.96 opening example, Tag 0BKH, printed p.275: the source states a split completion in the ambient D(A); it should assert the split form only after restriction to D(ℤ_p); affects a stated result. Witness: StacksMA lines 12704–12713; for A=ℤ_p⋉ℚ_p/ℤ_p, adjunction gives Hom(ΛA,ℤ_p[1])=0, excluding the split projection. The README already makes this distinction.
- **Misprint** in Bhatt12 at Remark 6.6, printed p.25: the section-space target is written with N mapping to P; it should use N mapping to B; affects nothing. Witness: Bhatt12 line 1202 compared with its defining equivalence at line 1191.
