# Review of AlgebraicModuliForArithmeticGeometry (pull request #853 at 9dcc97f)

**Verdict:** accepted

The gate passes, the independent dependency check reports no problem, `Suggested.lean` elaborates with exactly five `sorry` warnings, and no P1 or P2 finding survived verification. Six P3 notes follow; they are the author's to take or leave. No change outside the roadmap folder is requested (the outside-folder diff against `origin/main` is empty).

Locations are relative to `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/` unless another roadmap or library is named. Source ids are the keys under which this review fetched the texts; they are listed under *Verified sound*.

## Disposition of the previous review's findings

| Previous finding | Disposition at this head |
| --- | --- |
| R01 (P2), import scheme fpqc descent instead of replanning it | **Repaired.** `README.md:1145–1155` now says SchemeAndStackFoundations §1.1's `qcoh_fpqc_descent` already contains the covering-family form through Mathlib's `isEquivalence_toDescentData`, and “This roadmap states no second version of that theorem”; the four separate faithfulness/fullness/effectivity/equivalence targets are gone. One residual target still states a special case (see R01 below, P3). |
| R02 (P2), separate Betti semicontinuity from Euler characteristic | **Repaired.** `README.md:9249` states `fibre_betti_semicontinuity` for pseudo-coherent K with the D=k[ε]/ε², K=k[0] Check (“β_i=1 for every i≤0”), and `README.md:9265` states `fibre_euler_characteristic` separately for perfect K. |
| R03 (P3), undeclared API names | **Repaired.** API lists are prose bullets (“The API provides:” at `README.md:313`, `:331` and throughout); the convention paragraph at `README.md:160–164` says API facts carry no declaration names. |
| R04 (P3), marked-ideal and log supplier locators | **Repaired.** `README.md:10290` assigns `weightedPresentation_commonMark` and `markedIdeal_rescale` to §1.7, which is where ResolutionOfSingularitiesCharacteristicZero states them at its head (`TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:170`); `README.md:131–133` cite CrystallineCohomology's prose targets *Divisorial log structures*, *Logarithmic differentials* and *Log de Rham complexes*, which exist at `TauCetiRoadmap/CrystallineCohomology/README.md:8059`, `:8468`, `:8507`. |
| R05 (P3), tautological fixture Checks | **Partly repaired.** `README.md:3904–3914` now compute B(C₃) with z=1 (value 1, inverse 2, zero map excluded), B(S₃) (trivial centre) and Discrete(Bool)×B(C₃) with (1,2). The “apply the same criterion” clause was not carried to the other generic-law Check blocks of Layer 4 (R03 below). |

## R01 (P3) — Restate the affine descent target as the comparison it is

**Location:** `README.md:1210`, “Prove `affineFpqcQuasicoherentDescent`. For a finite standard fpqc covering {Ui→S} of an affine scheme S, the canonical functor from QCoh(S) to descent data for the cover is an equivalence.”

**Claim:** As written, the statement is the special case (affine S, finite standard covering) of the imported `qcoh_fpqc_descent`, which `README.md:1151` says this roadmap will not restate. The genuinely new content named in the proof sketch (identifying `affineModuleDescentEquivalence` with the restriction of the imported equivalence through `tildeEquiv` and the tensor pullback comparison) is not what the target asserts.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2074` on main proves `qcoh_fpqc_descent`; Mathlib `CategoryTheory/Sites/Descent/IsStack.lean:70` (`isEquivalence_toDescentData`) turns it into exactly the displayed equivalence for every covering family, with no affineness needed.

**Repair:** State the target as the compatibility: for a finite standard fpqc covering of affine S, the square formed by `tildeEquiv`, the module descent equivalence of `affineModuleDescentEquivalence` and the imported sheaf descent equivalence commutes up to the specified natural isomorphism, on objects and on all module maps. Keep the three Checks. Test: for the Zariski cover of Spec ℤ by D(2), D(3), both routes return ℤ as the equalizer of ℤ[1/2]×ℤ[1/3]⇉ℤ[1/6] (ℤ[1/2]∩ℤ[1/3]=ℤ in ℚ), and the comparison is the identity on ℤ; for ℝ→ℂ with conjugation both return ℝ and send the zero map to the zero map.

## R02 (P3) — The `IsGerbe` API and Checks restate theorems of §§4.3–4.4

**Location:** `README.md:1880–1895` (“The API provides”) and `README.md:1898–1910` (**Checks**) under “Define `IsGerbe`” (`README.md:1876`).

**Claim:** The API list of the predicate includes the derived H² classification, `classSitePullback`, the self-equivalence/torsor equivalence, the structure of fpqc 2-limit objects and the non-algebraicity of B(Ẑ); the Check list then repeats those same sentences verbatim. These are theorems owned by §§4.3, 4.4, 4.5 and 4.20, not API of the definition, and a Check that restates a theorem of another section is not a discriminating unit test of the predicate.

**Witness:** `README.md:1890` and `README.md:1905` are the same sentence (“band-preserving equivalence classes of A-gerbes correspond to derived H2(A)”); `h2Classification` is proved at `README.md:2262`.

**Repair:** Keep for `IsGerbe` the four structural API bullets (stack, groupoid fibres, local objects, local isomorphisms, invariance under equivalence) and the three discriminating Checks already present (BA is a gerbe; the two-object discrete groupoid on the point site is a stack with Isom(false,true)=∅, hence not a gerbe; the n-th root gerbe of O(1) on P¹ is a gerbe with no global object since n·deg M=1 is impossible for n>1). Delete the duplicated theorem sentences from both lists; they remain where they are proved.

## R03 (P3) — Generic-law Check blocks remain in §§4.7, 4.9–4.18

**Location:** `README.md:3388–3392` (coverCenter), `:3432–3435` (coverCenterAt), `:3475–3478` (glue), the Check blocks at `:4941`, `:4959`, `:4993`, `:5011`, `:5029` and `:5055` (pairPresheaf, actionPresheaf, principalPresheafIso, pairSheaf, actionSheaf, principalSheafIso), and the single-bullet Check blocks of §§4.11–4.18.

**Claim:** These Checks restate the definition's laws without choosing an instance (“the identity local sections give the identity centre unit”, “the actual centre unit constructed from inverse local sections is the inverse”, and “The principal sheaf morphism followed by its inverse is the identity on the action sheaf” repeated as a Check of four different definitions). Three bullets of this kind do not meet the three-discriminating-Checks requirement; the repaired §4.8 blocks show the intended shape.

**Witness:** The sentence “The principal sheaf morphism followed by its inverse is the identity on the action sheaf” occurs at `README.md:4944`, `:4962`, `:5014`, `:5031` and `:5061`.

**Repair:** Replace each such block by computed instances on the fixtures already in the file: on the point-site B(C₃) with its canonical band, coverCenter of the constant family z=1 is the unit with component 1 (inverse 2, so the inverse-family law is a computation, not a restatement); on the C₄→C₂→C₂ chain, coverCenterAt along the reduction arrow sends the source generator to 1 and the source element 2 to 0; for principalSheafIso on B(C₃), the section (p,a)=(1,2) goes to (1,0) and back. Keep these as README Checks only.

## R04 (P3) — Name and sentence consistency

**Location:** `README.md:483` (`def IsCMRegular` in the §1.1a signature block) versus `README.md:104`, `:802`, `:823`–`:847` (`cmRegularity`); `README.md:1611` (`QCohPseudofunctor` in the §3.3a block) versus `README.md:1157` (`quasicoherentPseudofunctor`); the six lines beginning “Throughout this topic,” at `README.md:1304`, `:1874`, `:5065`, `:8806`, `:9664`, `:9729`; `README.md:9731` (“PicX/`B(T)≅ker` σT*”).

**Claim:** The same target carries two names in two places, and the standing-hypothesis lines are lists glued with “.;” and a doubled full stop rather than sentences; one backtick span splits a formula. These are presentation defects only.

**Witness:** `grep -n -o 'IsCMRegular\|cmRegularity' README.md` returns one `IsCMRegular` (line 483) against seven `cmRegularity`; `README.md:8806` reads “Throughout this topic, To infer an algebraic space, trivial inertia is proved on all test schemes.; p is representable; all automorphism assertions are about sheaves..”.

**Repair:** Rename the block entries to `cmRegularity` and `quasicoherentPseudofunctor` (or the reverse, once), and rewrite the six standing-hypothesis lines as sentences (“Throughout this topic, S is a scheme, X and B are algebraic spaces over S, and f : X → B is a specified S-morphism. Test objects are schemes T → B …”). Fix the backticks at line 9731 to “`Pic_{X/B}(T) ≅ ker σ_T^*`”.

## R05 (P3) — A forward citation and an unnamed Suggested.lean

**Location:** `README.md:9747`, “(for instance by ComplexComparisonPartII §C3.2d.2 `relative_picard_algebraicSpace` when that space is a scheme, or by Kleiman …)”; `README.md:8881` and `:8901`, “Suggested.lean, relativeSpecUniversalProperty, relativeSpecPushforwardIso, relativeSpecBaseChangeIso and relativeSpecEquiv”.

**Claim:** ComplexComparisonPartII is later in the merge order (position 29 against 22 for this roadmap) and lists this roadmap among its suppliers, so naming its target as a provider of a hypothesis here reads as an upward citation even though the dependency check does not count it (it is inside a parenthesis, not a `*Needs:*` line). The relative-Spec names are declared in AlgebraicVectorBundles' acceptance file, which the sentence does not say.

**Witness:** `board/merge-order/ORDER.txt` lines 22 and 29; `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean:500–538` on main declares the four `relativeSpec*` names; this roadmap's `Suggested.lean` does not.

**Repair:** In §7.6.3 state representability of `Pic_{Y/S}` by a separated S-scheme as the hypothesis and cite Kleiman, Theorem 9.4.8, only; mention no later roadmap. In §5.3 write “AlgebraicVectorBundles L1A–L1B (`relativeSpecUniversalProperty`, … in its `Suggested.lean`)”. Test: with X=Y=P¹_k and L=M=O(1), every automorphism of P¹ preserves the sheafified class, so the subfunctor is Aut(P¹)=PGL₂ of dimension 3; the statement and proof route do not change.

## R06 (P3) — Repeated standing-hypothesis paragraphs and the size of Layer 4

**Location:** `README.md:1433–1580` (the paragraph “Here Commutative rings R,A in the universe, an arbitrary homomorphism `f:R→A` … unless the conclusion explicitly assumes faithful flatness.” repeated after each of ten targets of §3.3); `README.md:3282–3877` (“Here C is a small category with a fixed Grothendieck topology J …” repeated after every target of §4.7); Layer 4 as a whole, `README.md:1870–8644`, about 6,800 of the file's 10,707 lines.

**Claim:** House style states standing hypotheses once per subsection (which §§3.3, 4.7, 4.9 already do in their first paragraph) and says that an unwieldy roadmap is split into Parts. The per-target repeats carry no information and roughly double the length of these subsections; §§4.6–4.18 are transcribed Lean engineering (fibre Hom sheaves, endpoint transports, orbit presheaves) whose mathematical content is Stacks Lemma 8.11.8 and Olsson Lemma 31.3.

**Witness:** `grep -c '^Here Commutative rings R,A in the universe' README.md` returns 11; `grep -c '^Here C is a' README.md` returns 82.

**Repair:** Delete the per-target repeats where the subsection opens with the same standing hypotheses; keep a per-target “Here …” line only where it differs. Consider moving §§4.9–4.18 and §4.24 into an “AlgebraicModuliForArithmeticGeometry, Part II” whose introduction says the base roadmap stops at the intrinsic band (§4.6) and the classification (§§4.3, 4.20), leaving here the statements the classification consumes. No mathematics changes.

## Verified sound

**Head, gate, diff.** The worktree is at `9dcc97f46b5fbef9e322dc416f54b880ae731dbd`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry'` is empty. The worker's gate at this head reports every counter zero (`set_option`, `sorry-data`, `imports`, `depcheck`, `stray-files`, `outside-folder`, `build` among them). `Suggested.lean` is unchanged since the previous review's head `959c641`; the 1,892 changed lines are all in `README.md`.

**Dependency check (run by this review):**

```text
depcheck: 201 roadmaps, 1316 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier named in a `*Needs:*` line is on main (SchemeAndStackFoundations, ModularCurves, StableReduction, JacobianChallenge, AlgebraicVectorBundles, ReductiveGroupsPartII, EnhancedDerivedSheaves, DerivedModuleAlgebra, AdicSpacesPartII, AdicSpacesPartIII, GroebnerGeometry) or earlier in the merge order (ResolutionOfSingularitiesCharacteristicZero at position 6, CrystallineCohomology at 11; this roadmap is at 22). No declared gaps exist. Ownership against the sibling checkouts named in the brief and the indexed open pull requests was searched by object (`roadmaps grep` for banded gerbes, rigidification, Weil restriction, Artin approximation, coherent dévissage, Castelnuovo–Mumford regularity, Kollár–Matsusaka, Plücker, Artin's criteria): every other hit either cites this roadmap's layers (LefschetzPencilsAndVanishingCycles, ShimuraCompactifications, EtaleDualityAndPerverseSheavesPartII for Layer 6; SchemeKTheoryOperations and its Part II use coherent dévissage without restating it) or concerns a different object (Matsusaka–Mumford in K3SurfacesAndSymplecticBoundedness and AbelianSchemesAndArithmeticModuli). `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2067–2068` on main assigns banded gerbes and their H² classification to this roadmap, and `:6730` says this roadmap imports its locally-free projective bundle. Open pull requests whose files the brief did not provide were not checked.

**Elaboration.** The missing object file `TauCeti.AlgebraicGeometry.Modules.Stalk` was built with the permitted module build; `lake env lean` on `Suggested.lean` then produced exactly five `sorry` warnings (lines 48, 73, 87, 119, 131) and nothing else. A scratch copy with `#check @` on all seven declarations elaborated; the printed types retain `IsArtinianRing A`, `Fintype σ`, `IsScalarTower`, `Module.Finite (MvPolynomial σ A) M`, `DirectSum.Decomposition ℳ` (Hilbert–Serre), `IsNoetherian X` and `IsFinitePresentation` on all three terms (dévissage), `Field k`, `HopfAlgebra` on both algebras and injectivity (Hopf inclusion), `IsNoetherianRing A` with the formal-fibre predicate (pointed étale approximation) and `HenselianLocalRing A` (henselian approximation). Each README statement has the same generality; no signature change was needed. A second scratch copy replaced each `sorry` by `first | rfl | simp | infer_instance | assumption | trivial | (intros; simp_all) | (intros; infer_instance) | sorry`: every one of the five theorems fell through to `sorry` or stopped with unsolved goals, so no headline closes in one tactic and no padding finding is raised. The two definitions have real bodies on Mathlib carriers and are needed to state Layer 6's headlines.

**Headline inventory.** Statable at the pins and stated: Hilbert–Serre over Artinian coefficients (§1.5), coherent dévissage (§2.3), faithful flatness of commutative Hopf inclusions (§4.22), Artin approximation in pointed-étale and henselian forms (§6.1). Named in the module docstring as not statable, with the missing carrier: P(E) universal property and cohomology, coherent Grassmannians, regularity bounds (Layer 1); Hom/Aut representability (Layer 2); space descent, relative Hom, Weil restriction (Layer 3); H² classification, neutrality, profinite gerbes (Layer 4); rigidification (Layer 5); Artin criteria, Picard sheaves, proper GAGA, K/O coefficients (Layer 7); formal effectivity and algebraization (Layer 8); resolution comparisons, Kawamata–Viehweg, Kollár–Matsusaka (Layer 9). No stand-in is stated.

**Pinned declarations opened** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`):

| File and line at the pin | What it provides and what it does not |
| --- | --- |
| Mathlib `CategoryTheory/Sites/Descent/IsStack.lean:70` | `isEquivalence_toDescentData`: a stack gives an equivalence to descent data for a covering family; this is the witness for R01. |
| Mathlib `Algebra/Category/ModuleCat/Descent.lean:59`, `:42` | `comonadicExtendScalars (hf : f.FaithfullyFlat)` and `preservesFiniteLimits_extendScalars_of_flat`; the first needs faithful flatness, as §3.1 says. |
| Mathlib `Algebra/Module/FinitePresentation.lean:214` | `Module.FinitePresentation.fg_ker_iff`, the kernel criterion used in `finitePresentationModuleDescent`. |
| Mathlib `RingTheory/Finiteness/Descent.lean:34` | `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`: finite generation descends; finite presentation of modules does not exist at the pin, so §3.1's target is new. |
| Mathlib `RingTheory/Grassmannian.lean:185` | `Module.Grassmannian.functor : CommAlgCat R ⥤ Type`, the affine functor §1.3 compares with; no scheme is constructed there. |
| Mathlib `RingTheory/Polynomial/HilbertPoly.lean:22`, `:220` | `hilbertPoly` and `eq_hilbertPoly_of_forall_coeff_eq_eval` over a field of characteristic zero; the Artinian-length series is this roadmap's. |
| Mathlib `CategoryTheory/Center/Basic.lean:31` | `CatCenter C := End (𝟭 C)`, the carrier of `IntrinsicBandSections`. |
| Mathlib `CategoryTheory/Endomorphism.lean:155` | `autMulEquivOfIso : Aut X ≃* Aut Y`, used by `banding_iso_independent`. |
| Mathlib `CategoryTheory/Sites/LocallyBijective.lean:41` | `isLocallyBijective_iff_isIso`, used by `homSheafMap_isIso`. |
| Mathlib `CategoryTheory/MorphismProperty/Representable.lean:103` | `Functor.relativelyRepresentable`, the hypothesis of `relativeHom` and `weilRestriction`. |
| Mathlib `CategoryTheory/Sites/Descent/DescentDataPrime.lean:321` | `descentDataEquivalence`, the chosen-pullback descent equivalence of §3.3. |
| Mathlib `RingTheory/Valuation/LocalSubring.lean:116`, `:80` | `LocalSubring.exists_le_valuationSubring`, `ValuationSubring.isMax_toLocalSubring`, the prolongation inputs of §7.5. |
| Tau Ceti `Algebra/Category/ModuleCat/Sheaf/Stalk.lean:19` | `SheafOfModules.stalkModule`, the module structure on stalks that `coherentDevissage` uses. |
| Tau Ceti `Algebra/Category/ModuleCat/Sheaf/Invertible/FinitePresentation.lean:22` | `TauCeti.SheafOfModules.IsInvertible`. |
| Tau Ceti `AlgebraicGeometry/VectorBundle/Affine/Basic.lean:147` | `tildeFunctorCompPullbackIso`, the tilde/pullback comparison of §3.1. |
| Tau Ceti `AlgebraicGeometry/LineBundle/Rigidified/Basic.lean:30`, `LineBundle/Degree.lean:24` | `rigidifiedPicardFunctor`, `eulerCharBelow`. |

The worker's `roadmaps resolve` lists 382 unresolved backticked names, all of them this roadmap's own target names (none is claimed as a library declaration); no cross-roadmap citation is unresolved.

**Cross-roadmap citations resolved at their current text:**

| Citation | Where it resolves |
| --- | --- |
| SchemeAndStackFoundations §§0.3, 0.9, 0.12–0.15, 0.20–0.21, 1.1, 1.2, 1.10, 1.11, 1.13, 1.15, 1.17–1.21, 1.23, 2.1, 2.3, 2.4, 2.6, 2.9, 2.11, 2.18–2.21, 3.4, 3.6, 3.7, 4.2, 4.10, 4.12, 4.14, 4.17, 5.3, 5.4 | Headings at `README.md:551`–`6721` on main; exports `Descent.qcohPseudofunctor` (2073), `qcoh_fpqc_descent` (2074), `Spaces.QCoh`, `QCoh.presentationEquiv`, `QCoh.ofSchemeEquiv` (2392–2395), `NonabelianH1.equivSheafH` (2535), `mk_eq_one_iff` (3338), `projectiveSpace_cohomology` (3443), `ample_serre_vanishing` (3445), `hilbert_quot_schemes` (5709), `relativeProj_eq_stableReduction` (579), `projectiveBundle_dual_convention` (6565, 6727). |
| ModularCurves §§0C, 0E, 0F, 0G, 4C, 7B, 7D, 9D, 9E | Headings at `README.md:345`, `386`, `412`, `427`, `1100`, `1481`, `1500`, `1949`, `2008` on main. |
| StableReduction Layers 2 and 4; JacobianChallenge Layers A–D; AlgebraicVectorBundles L0A–L2B | Headings at `StableReduction/README.md:354`, `468`; `JacobianChallenge/README.md:111`–`218`; `AlgebraicVectorBundles/README.md:215`–`340`. |
| ReductiveGroupsPartII RG2.0a.1; EnhancedDerivedSheaves §E1.9 `perfect_proper_pushforward`; DerivedModuleAlgebra §1.E.1 `perfectInverseSystemEffectivity`, §1.M.2; AdicSpacesPartII R1.3; AdicSpacesPartIII F0.5–F0.7, R3.7; GroebnerGeometry G2, G4 | `ReductiveGroupsPartII/README.md:963`; `EnhancedDerivedSheaves/README.md:925`, `1057`; `DerivedModuleAlgebra/README.md:2200`, `2202`, `2290`; `AdicSpacesPartII/README.md:8968`; `AdicSpacesPartIII/README.md:2450`, `2729`, `3272`, `11218`; `GroebnerGeometry/README.md:103`, `252` (Hilbert functions and series at `:140–142`, `:350`). |
| ResolutionOfSingularitiesCharacteristicZero §§1.1–1.10, 2.1–2.15, 3.1–3.7, 4.1, 5.1–5.6, 6.1–6.3, 7.8 and the exports `resolution_field`, `relativeEmbeddedResolution`, `sncCompactification`, `cartierSeparation`, `localIsomorphismResolution`, `markedIdeal_rescale`, `weightedPresentation_commonMark` | At its open head (pull request listed in the index): headings `README.md:59`–`1017`; the two common-mark theorems in §1.7 (`:170`); §1.10's marked sum `I^b+J^a` with mark `ab` agrees with this roadmap's §9.1a ((y²,2)+(x³,2) gives (y⁴,x⁶), mark 4); §2.15's derivative-ideal iterate statement agrees with §9.2a. |
| CrystallineCohomology §CR.5:log-algebra.4, §CR.5.1 | At its open head: `README.md:8057`, `8059` (*Divisorial log structures*), `8466`, `8468` (*Logarithmic differentials*), `8507` (*Log de Rham complexes*). |
| AlgebraicVectorBundles `relativeSpec*` names (R05) | `Suggested.lean:500–538` on main. |

**Seeded sample, source text at the locator** (source ids are this review's fetch keys):

| Target | Source evidence and result |
| --- | --- |
| 1.2 Cohomology and multiplication | stacks_coherent lines 801–1030: Lemma 8.1 (01XT) p.16 and Lemma 8.4 (01XX) p.20 with rank n+1, n≥1, exactly the hypotheses of `relativeBundleCohomology`; stacks_constructions line 2137, Definition 21.1 (01OB) p.45, quotient convention and `π*E→O(1)` surjective; Lemmas 16.10–16.11 p.40 (lines 1870, 1889) give base change and invertibility for degree-one generation; Lemma 10.3 p.18 (line 809). All agree with §§1.1–1.2. |
| 1.7 Determinantal and Frobenius loci | goertz_ag3 lines 2321–2340: Lemma 5.8 and Theorem 5.9, p.58 (graph charts A^{r(n−r)}, smooth over ℤ, subspace convention); Theorem 5.10 p.59 (Plücker); Proposition 5.16 p.61 (lines 2442–2470, containment F⊆F′ as a closed condition by the chart matrix equation) and Proposition 5.17 pp.61–62. The source has no Frobenius statement, as the README says; the chart equation `c+d t^p−t(a+b t^p)` is a deduction. |
| 3.3 Chosen affine pullbacks | stacks_023F lines 177–184: Definition 3.1 (023G) p.4, `φ:N⊗A→A⊗N` with the cocycle; lines 227–257: Lemma 3.2 (023H) pp.5–6, the displayed σ00, δ11, δ21, δ22 and the proof of σ00∘δ11=id from the cocycle, which is `overlapDiagonal`; lines 341–351: Proposition 3.9 (023N) p.8, M={n : 1⊗n=φ(n⊗1)} and faithful flatness, with (2)–(3) stated and their proofs omitted, as §3.2 notes. |
| 3.3a Signatures of the descent carriers | Same text; the singleton `f.op` descent category and the coalgebra category are Mathlib's (`DescentDataPrime.lean:321`, `Descent.lean:59`); the relative Hom and Weil restriction signatures match Stacks Criteria §§10–11 as restated in §3.4 (not re-fetched; the previous review's resolution stands). |
| 4.2 Bandings | olsson_stacks_notes lines 5370–5406: Remark 31.2 and Lemma 31.3 p.122 (band compatibility forces commutativity; morphisms of μ-gerbes are equivalences); gwz_higgs line 339: Definition 2.6 (banding compatible with pullbacks); stacks_gerbes line 1124: Lemma 8.11.8 (0CJY) p.25, whose first paragraph is `banding_iso_independent`. |
| 4.7 Cover comparison | stacks_gerbes lines 1138–1173, Lemma 8.11.8 proof pp.25–26: conjugation independence by the displayed computation, gluing of Aut sheaves on a cover, and “the sheaves G constructed over varying U are compatible in a canonical manner. This is omitted.” The README's varying-base targets (`coverCenterAt_compatible`, `glue`, `isSheaf_of_prestack`) are exactly the omitted step. |
| 4.8, 4.8a Fixtures | Same lemma; the fixtures are authored deductions (B(C₃), B(S₃), Discrete(Bool)×B(C₃), the C₄→C₂→C₂ chain, the two-chain site) and their values are recomputed in the table below. |
| 4.9a Actual Hom products | olsson_stacks_notes lines 5384–5420: Lemma 31.3 (Isom sheaves as torsors in the full-faithfulness proof) and Remark 31.5 p.123 (Isom(α_U,y) is a μ-torsor). |
| 4.20 Derived classification | milne_ec4 lines 304, 412–452: Theorem 2.5 p.7 and its proof items (i), (i′), (i″) pp.8–9, including the lifting-gerbe boundary map and the injective case by the section G→π_*π^*G; breen_2gerbes lines 1626–1631: (2.13.4) and Proposition 2.14; olsson_stacks_notes lines 5429–5431 and 5485: Lemma 31.6 p.123 (with the author's note that the proof needs a terminal object, which §4.20's topos presentation addresses) and Theorem 31.7 p.124. |
| 5.1 Rigidification | aov_tame lines 1292–1332: setup pp.1086–1087 (G⊆I_X a flat finitely presented closed subgroup stack; normality is a consequence, lines 1312–1315) and Theorem A.1 p.1087 ((a) fppf gerbe, (b) Aut(ξ)→Aut(ρξ) surjective with kernel G_ξ; proper for finite G, étale for étale G), Remark A.2, proof pp.1088–1089; stacks_stacks_morphisms line 686: Lemma 101.6.2 (04YY); stacks_spaces_groupoids line 163: Lemma 78.6.1 (06P6) p.4; stacks_06E9 line 1874: Lemma 110.50.1 (06EA) p.41. borne_vistoli_fundamental lines 375–407: Remarks 3.6–3.7, Definition 3.8, Proposition 3.9 pp.8–9. |
| 5.2 Levels | aov_tame Theorem A.1(b) p.1087 for the stabilizer quotient; the elliptic rigidifier facts are ModularCurves §4C (`README.md:1100` on main). |
| 7.6.1a Rigidified representatives | stacks_picard lines 1276–1303: Lemma 99.11.4 (0D28) pp.28–29, split exact sequence, the normalisation scalar written as `α_j∘σ*φ_ij∘α_i` (ill-typed without inverting α_j) and “(small detail omitted)” for descending the trivialisations; the README restores the inverse and supplies the detail. Lines 1314–1326: Lemma 99.11.5 (0D29) p.29. |
| 9.2a Derivative ideals | bierstone_milman_1997 (arXiv alg-geom/9508005v2) contains only Chapter I (53 pages); Proposition 4.12 and Remarks 4.13 are in Chapter II and were not readable (see *Not verifiable*). The supplier's §2.15 statement at its head matches the README's. |
| 9.11 Uniform numerical boundedness | demailly_very_ample lines 57–79: Theorem 0.2(c), `λ_n = C(3n+1,n) − 2n`, as in §9.10; lines 293–321: Theorems 2.3 p.6 and 2.4 p.7; line 533: Theorem 3.1 p.11; lines 644–655: (4.7) p.14, m L very ample for m above a bound in n, L^n and L^{n−1}·K_X, exactly m₀(d,v,w). charles_annals lines 817–839: Lemma 3.5 pp.507–508 cites Kollár–Matsusaka for boundedness of (X,L) with K_X=0 and fixed L^{2n}. esnault_viehweg lines 1715–1727 (5.3, 5.4), 1877 (5.12), 3807–3811 (9.16–9.17: Ω•(A,B) twists the first label, so the README's label exchange is right), 4174, 4234, 4504 (10.16, 10.17, 10.23); printed pages are the PDF pages minus four and agree with the README. |

Also opened: stacks_coherent lines 1501–1506 and 1572–1577 (Lemmas 12.6, 12.8 (01YI, 01YM) pp.31–33 for §2.3), 1667 (14.1), 2015, 2058 (16.1–16.2 for §1.2); stacks_023N lines 790–794 (Lemma 5.1 (023S) p.17), 992–995 (7.3 (05B0) p.21), 1011–1016 (7.6 (05B2) p.22) for §3.1; nitsure_quot lines 403–409 (Lemma 2.1 p.10), 460–466 (Theorem 2.3 p.11), 959–965 (Theorem 5.2 p.24), 1182–1216 (Theorems 6.5–6.6 pp.30–31) for §§1.5, 2.1–2.2; stacks_artin tags 07X4, 07X7, 07X8, 07XB, 07XH, 0CXJ, 0CXK, 0CYF, 07T2, 07WT, 07WY, 07Y6, 07XF, each at the section number the README quotes.

**Adversarial table.** Cₙ is written additively; D = k[ε]/ε². Each row records the values computed on both sides.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| `hilbertSerre` (headline) | A=k, M=k[x,y] | length(M_d)=d+1; series 1/(1−T)²; P(d)=d+1, degree 1 < e=2 | Agrees; none. |
| `hilbertSerre` Artinian lengths | A=D, M=A[x] | length_A(M_d)=2 each; series 2/(1−T); P=2 | Length, not residue rank; none. |
| `hilbertSerre` negative degrees | k[x] generated in degree −2 | d₀=−2; shifted numerator 1; P(t)=1 | Shift retained; none. |
| `hilbertSerre` e=0, M=0 | σ=∅, M=k in degree 0; M=0 | series 1=h, P=0 with degree ⊥<0; all pieces ⊥, h=0 | No ℕ truncation; none. |
| `coherentDevissage` (headline) | X=∅, P≡false | (1),(2) vacuous; P(0) false | `hzero` needed and present; none. |
| `coherentDevissage` | Spec k, P=“even dimension” | G=k has length 1, P(k) false, so (2) fails | Generic-length condition excludes it; none. |
| `coherentDevissage` support | Z integral, G=O_Z | stalk at ξ is κ(ξ), length 1; support set = Z | Native signature matches; none. |
| `hopfInclusion_faithfullyFlat` (headline) | k[t^p]⊂k[t], p=2,3 | free bases {1,t}, {1,t,t²}; rank p | Inseparable case included; none. |
| `hopfInclusion_faithfullyFlat` | k→k[t]/t^p | free of rank p; t nilpotent | Reducedness not needed; none. |
| `polynomial_approximation` (headline) | ℚ[t]_(t), z²=1+t | formal root 1+t/2−t²/8+…; no rational root (odd valuation at t+1); derivative 2z↦2≠0, so an étale neighbourhood contains an exact root | Pointed étale form necessary; none. |
| `polynomial_approximation` arithmetic | z²=2 over ℤ₇, ℤ₂ | 3²≡2 (7), derivative 6 unit; squares mod 8 are 0,1,4 | Two primes behave differently; none. |
| `artinApproximation` (headline) | A complete; A a field | Â=A, exact match; m=0, n=1 modulus is A | Predicate correct; none. |
| §1.1 quotient convention | E=L=O(1) on P¹; E=0 | P(L)=S, universal line O(1); P(0)=∅ | Agrees with Stacks 21.1; none. |
| §1.1 twists | a=1, b=−1 | O(1)⊗O(−1)=O(0)=O | none. |
| §1.2 P⁰ multiplication | P⁰_A, m=−2,0,2; T₀·T₀⁻¹ | H⁰=A·T₀^m; product 1, nothing discarded | n=0 branch correct; none. |
| §1.2 Čech weight summand | P¹, e=(−1,0) | subsets {0},{0,1}: A→A, ±id, acyclic | none. |
| §1.2 H¹(O(−2)), H¹(O(−1)) on P¹ | e=(−1,−1); sum −1 | one basis vector; none | Agrees with Lemma 8.1; none. |
| §1.2 cup into zero group | x⁻¹y⁻¹ · x | exponent (0,−1) not all negative, lands in H¹(O(−1))=0 | Discarding rule consistent; none. |
| §1.2 H⁰(O(2)) on P¹ | (2,0),(1,1),(0,2) | dimension 3 | none. |
| `relativeBundleCohomology` | E=O(1)⊕O on P¹, m=−2 | Hom(Sym⁰E⊗det E, O)=det(E)^∨=O(−1) | Determinant twist direction right; none. |
| `grassmannSmoothness` | Gr₂(k⁴); Gr₁(O²) | 2·2=4; tangent Hom(O(−1),O(1))=O(2) | none. |
| `plucker` | rows (1,0,a,b),(0,1,c,d) | (1,c,d,−a,−b,ad−bc); ad−bc−c(−b)+d(−a)=0 | Sign convention passes; none. |
| `flagBundle` | type [] ; [a]; full in rank n | S; Gr_{n−a}; Σ(n−i)=n(n−1)/2 | none. |
| `relativeVeryAmple` | O on P¹_k | globally generated, h⁰(O(m))=1 for m>0, not very ample | none. |
| `hilbertPolynomial` | O_{P¹}(a) | t+a+1 for all integers t | none. |
| `cmRegularity` | O(a) on P¹ | H¹(O(a+m−1))=0 iff a+m≥0; O(−2) not 1-regular | none. |
| `uniformQuotientRegularity` | O→O_Z on P¹, length d | kernel O(−d) needs m₀≥d; O_Z m-regular for all m | none. |
| `bigLineBundle` | P¹×P¹, O(1,0) | h⁰(O(m,0))=m+1, growth m¹ not m² | Not big though globally generated; none. |
| `boundedSupportParameters` | smooth conic, D=1 | incidence hypersurface has bidegree (2,2) | No parameter of degree ≤1; hypothesis material. |
| `boundedSupportParameters` | X^p−tY^p over 𝔽_p(t) | reduced point of degree p; geometric fibre one point of multiplicity p | Reduction after algebraic closure; none. |
| `chowOpenAndEmbedding` | m c₁(L₁)=c₁(L₂)+c₁(A), A ample | (c₁(L₂)+c₁(A))^r·Z ≥ c₁(L₂)^r·Z | deg_{L₂}Z ≤ m^r deg_{L₁}Z; none. |
| `rankLocus` | [t], r=0; [ε] over D | ideal (t); ideal (ε)≠0 with all geometric ranks 0 | Scheme structure retained; none. |
| `incidenceLocus` | (n,a,b,k)=(2,1,1,1); (2,0,1,1); (3,2,1,2) | U=W locus; empty; rank ≥ a−b=1 = a−k+1 so unit ideal | No ℕ truncation; none. |
| `frobeniusStableLocus` | chart (1,t), Φ=[[a,b],[c,d]]; identity over 𝔽₄, t²=t+1 | c+dt^p−t(a+bt^p); t²−t=1 ≠ 0 | Semilinear equation, not linear; none. |
| `coefficientFrobeniusLattice` | p=3,N=3,j=2,coef 5; p=0,(a,b) | coefficient 5 at exponent 6; a+b at exponent 0 | none. |
| `hilbertFunctorAsQuot` | Hilb²_{P¹/k} | P² (=Sym²P¹) | none. |
| `hilbertDegreeOneAndNonFlatBase` | S=Spec D, X=Spec k | Hilb¹=X; universal family flat over X; X→S not flat | none. |
| `coherentModuleHom` | B=k[t], F=O/(x), G=O/(x−t) | maps = multiplication by b with tb=0: Spec k[t,z]/(tz) | Not flat over B; none. |
| `coherentModuleIsom` | same | b unit and tb=0: Spec k[t,z,z⁻¹]/(t) | none. |
| `universalFlatteningProperSupport` | Y=Spec k[t], F=k[t]/(t) | flattening = Spec k ⊔ (Y∖0), a bijective monomorphism, not an immersion | none. |
| §3.1 imported descent (R01) | ℝ→ℂ, conjugation; D(2),D(3) of Spec ℤ | equalizer ℝ, ℂ⊗ℝ=ℂ; ℤ[1/2]∩ℤ[1/3]=ℤ | Same values from the imported theorem; restate as comparison. |
| §3.1 right exactness | ℤ→𝔽₂, ×2 on O | monomorphism pulls back to the zero map on nonzero 𝔽₂ | none. |
| `canonicalOverlapFunctor` | (s⊗m)⊗t | s⊗(t⊗m), matching Stacks “can” a⊗m⊗a′↦a⊗a′⊗m | none. |
| `canonicalOverlapFunctor` faithfulness | ℤ→ℤ/2, maps ×2 and 0 | both extend to 0 | Not faithful, as stated; none. |
| `overlapPullbackCoordinates` | F₃×F₃ idempotents e₁,e₂ | c0 puts e₁⊗1 on N, c1 puts 1⊗e₂ on N | Swapping fails; none. |
| `descentEqualizerModuleCoordinates` | d(n)=1⊗n test; ℤ→𝔽₂ | M=ℝ for conjugation; for ℤ→𝔽₂, ℤ and 𝔽₂ both extend to 𝔽₂ | Faithful flatness needed for effectivity only; none. |
| `coactionTransitionMaps` | d(n)=Σaᵢ⊗nᵢ | θ(n⊗b)=Σaᵢ⊗bnᵢ=(1⊗b)·θ(n⊗1) | S⊗S-linearity consistent; none. |
| `relativeHom` | Z=B; Z=∅; Z=B⊔B | X; B; X×_B X | none. |
| `weilRestriction` | Z=X=∅; Z=B⊔B, X=X₁⊔X₂ | B; X₁×_B X₂ | Product, not coproduct; none. |
| `IsGerbe` (R02) | BA; discrete two objects on a point; root gerbe of O(1) | gerbe; Isom(false,true)=∅ not covering; n·deg M=1 impossible for n>1 | Three discriminating Checks suffice. |
| `AbelianBanding` | BC₃ with a↦−a; constant S₃ | 1↦2≠1; (123)(12)(123)⁻¹=(23)≠(12) | Band preservation and commutativity material; none. |
| `isomTorsor` | Isom(x,x) | trivial torsor, identity ↔ 0 | none. |
| `band_morphism_full_faithful` negative control | B1→BC₂ | Hom sizes 1 and 2; bands differ, so excluded | none. |
| `banding_iso_independent` | C₃, e=1,2 on a=1; S₃ | e+a−e=a; (01)(12)(01)=(02)≠(12) | Commutativity necessary; none. |
| `coverCenter` (R03) | BC₃ family z=1; inverse family | unit with component 1; inverse 2 | Computed instances replace generic laws. |
| `coverCenterAt` | C₄→C₂ reduction | 1↦1; 2↦0 | Restriction not injective; none. |
| `glue` | bottom topology, maximal sieve | restrictions of s=1 and s=3 differ at id, so glue recovers s | Separatedness from id∈R; none. |
| `constantSection` | BC₃, z=1; BS₃; Discrete(Bool)×BC₃, (1,2) | 1 everywhere, inverse 2, zero map gives 0; centre trivial; 1 at false, 2 at true | R05 repaired; none. |
| `componentCenter` | Bool, C₃, (1,2) | (id,1) at false, (id,2) at true; naturality 1+g=g+1 | none. |
| `componentCenterUnit` | (1,2); C₄ one point 1 | inverse (2,1), sum (0,0); inverse 3 | none. |
| `connectedCenterEquiv` | Bool, S₃; Q₈; I=∅, C₃ | centre of size 1; {±1}; all coefficients give one unit | Chosen i necessary; none. |
| `connectedAut` | S₃, g=(12), h=(23) | gh=(123), hg=(132) | Order fixed; none. |
| `connectedIso` | Bool, C₃ | iso false→true with component 0; with 1, 2 the other two | none. |
| chain fixtures | C₄→C₂→C₂; two chains | 1↦1↦1; 2↦0↦0; section counts 4,2,2; profile of 2 is (2,0,0); no terminal object | none. |
| §4.8a counts | B(C₃)⊔B(C₃); B(S₃)⊔B(C₃) | 9 sections; 3 sections; neither a gerbe | none. |
| `principalEquiv` | BC₃: (0,1); (1,2); inverse of (1,0) | (0,1); (1,0) since 1+2=0; (1,2) | none. |
| `difference_cocycle` | C₅, p=1,q=4,r=0 | diff(1,4)=3, diff(4,0)=1, diff(1,0)=4=3+1 | none. |
| empty Isom | no global arrow | Isom×A empty; Nonempty false | No global torsor inferred; none. |
| `liftingGerbe` boundary | b₀₁=2,b₁₂=3,b₀₂=1; coboundary aⱼ−aᵢ | 4; unchanged | Positive band convention; none. |
| `rootO1Nonneutral` | O(1), O(2) on P¹, n=2 | classes 1 and 0 mod 2 | none. |
| `liftingGerbe.neutral_iff_lift` | classifying topos of C₂, 0→ℤ→ℤ→ℤ/2→0 | Hom(C₂,ℤ)=0 so the regular torsor does not lift; δ: ℤ/2→ℤ/2 iso | Local existence ≠ neutrality; none. |
| `injectiveBoundaryBijection` | injective I | H¹(I)=H²(I)=0 ⇒ δ iso | none. |
| `changeBand` | A=0 | terminal gerbe, unique class | none. |
| `quotientInertiaComponents` | finite Γ on Y | ⊔_[γ][Y^γ/C_Γ(γ)] | Standard; none. |
| `TwistedInertia.finiteStagePairs` | X=B(C_ℓ), stage ℓ, k̄ | Hom(C_ℓ,C_ℓ) has ℓ elements, conjugation trivial: ℓ classes with Aut C_ℓ | none. |
| `locallyFull` | squaring Gₘ over ℝ | faithfully flat; −1 not a real square | Point surjectivity rejected; none. |
| `zHatNotFiniteType` | lim ℤ/m! | arbitrarily many orthogonal idempotents | none. |
| `NormalInertiaSubgroup` | ⟨(01)⟩⊂S₃; Gₐ/ℤ over char 0 | conjugate ⟨(12)⟩ differs; identity section not closed | none. |
| `Rigidification.stack` | BC₄▹C₂; Bμ_p▹μ_p (char p); Gₘ/μ₂ over ℝ | BC₂; Spec k; −1 a quotient section | none. |
| `affineKernelRigidification` | BC₄→BC₂; B1→BC₂ | kernel C₂, middle BC₂; middle B1 with Hom sizes 1 vs 2 | none. |
| `Rigidification.affine_gerbe` | B(Ẑ)_k identity | kernel trivial, closed, flat, f.p.; B(Ẑ) not algebraic | Algebraicity hypothesis material; none. |
| `rigidLevelStructure` | level 2, 2 invertible; ordinary E in char p; E×E, (1,N;0,1) | [−1] fixes E[2]; μ_p⊂E[p] not étale; fixes A[N] | none. |
| `levelRemovalQuotient` | P=BG, P_N=pt | [pt/G]=BG; coarse space pt | none. |
| `FiniteCorrespondence` | Spec(k×k) over k | degree 2 each leg, image one point | none. |
| `DMSchematicClosure` | Spec ℤ[1/p]→Spec ℤ | image Spec ℤ; mod p the source is empty | Nonflat base change excluded; none. |
| §6.0 predicate | ℚ[t]_(t), z²=1+t | formal root exists, no root in A | G-ring but not henselian; none. |
| `henselizationAlgebraicElements` | ℤ_(7), ℤ₂ | as above | none. |
| `StrongInfinitesimalGluing` | subset functor, D→ℚ twice | (ε,0) in the pullback set but not the diagonal, same projections | RS* fails; none. |
| `FormalPoint` | D, points 0 and ε; ℚ[t]/t³, 0 and t² | agree mod I, differ mod I²; agree mod I², differ mod I³ | Whole tower needed; none. |
| `TangentFiber` | A¹ over 𝔽₂ at 0 | framed lifts 0, ε: 2; total D-points 4 | none. |
| `ModuleObstructionTheory` | x²=0, lift ε to mod ε³ | (ε+cε²)²=ε²≠0 | Nonzero obstruction; none. |
| `openness_of_versality_strongEffective` | R_n=A⊕(κ(u₁)⊕…⊕κ(u_n)) | kernels square zero; limit A⊕∏κ(uᵢ) not Noetherian | Strong effectivity is stronger; none. |
| `fibre_betti_semicontinuity` | [k[t]→k[t]] by t; D, K=k[0] | (0,0)→(1,1) at t=0; βᵢ=1 for i≤0 | R02 repaired; none. |
| `fibre_euler_characteristic` | same complex; Spec(k×k) with k and k²[−1] | 0=0; χ=1 and −2 | Local, not global, constancy; none. |
| `PicardStackSpaces` | X=B=Spec k; two points | BGₘ with Pic sheaf 0; Aut = k^××k^× | none. |
| `relativePicardSheaf` | id: P¹→P¹ | raw Pic=ℤ, sheaf 0 | none. |
| `sectionPicardSplit` (7.6.1a) | αᵢ=2, αⱼ=3, φ=5 over ℚ | u=αⱼ⁻¹φαᵢ=10/3; φ′=(3/10)·5=3/2; αⱼ⁻¹φ′αᵢ=1 | Inverse on αⱼ restored. |
| `sectionPicardSplit` wrong normalization | omit the inverse | u=30, φ′=1/6, (1/3)(1/6)(2)=1/9≠1 | Negative control; none. |
| `polarisedIsomScheme` (R05) | X=Y=P¹, L=M=O(1) | all of PGL₂ preserves the class; dimension 3 | Statement unchanged by the repair. |
| `KOCoefficients` | O=ℤ, K=ℚ, M=ℤ, (1/2)⊗1 | nonzero class; 1⊗m zero | none. |
| `dvrTorsionCofiniteCriterion` | O=ℚ[[π]], M=(K/O)²; M=⊕k | r=2, D(M)=O²; dual ∏k not f.g. | Infinite residue field allowed; none. |
| `spaceSectionComponentCriterion` | μ₂ in char 2; Spec B_red→Spec B, B=D | component μ₂ with nilpotents; fibres smooth but not flat | none. |
| `deformationGroupoid` RS failure | ideal functor on k[ε₁,ε₂]/(ε₁²,ε₁ε₂,ε₂²) | (ε₁+ε₂) and (ε₁,ε₂) both project to (ε),(ε) | Not injective; none. |
| `formalObject` effectivity | Nil, tower t mod tⁿ over k[[t]] | every truncation nilpotent, t not | none. |
| `CompletedLocalRing` | node xy=0 | k[[x,y]]/(xy), x,y≠0, xy=0 | none. |
| `FamilyVersalAt` | A¹→pt; pt→A¹ at 0 | smooth, tangent k→0 not bijective (no hull); t↦ε does not lift | none. |
| `markedIdeal_rescale` (9.1) | (x²,2),(x⁴,4) | one controlled blowup divides by x², x⁴: unit ideal both | none. |
| controlled transform | (x²,y³) mark 2, chart x=u,y=uv | total u²(1,uv³), controlled (1,uv³)=O | none. |
| marked sum (9.1a) | (x²,2)+(y³,3); supplier's (y²,2)+(x³,2) | (x⁶,y⁶) mark 6; (y⁴,x⁶) mark 4 | Formula I^b+J^a, mark ab agrees with the supplier; none. |
| derivative ideals (9.2a) | (x³) over ℚ; (x²) in char 2 | (x²) then (x): order one after d−1=2 iterates; (x²) fixed | none. |
| `cartierSeparation` | 2[0], 3[0] on A¹ | F=2[0], D′₁=0, D′₂=[0]; 2[0]+[0]=3[0]+0 | none. |
| `sncCompactification` | Gₘ² in P¹×P¹ | four boundary components, four crossings | none. |
| `logDeRhamComplex` | base ℚ[t], X=base, D=(t); cuspidal base, X=A¹ | I_D·Ω¹=0 but Ω¹⊗O(−D)≅k/(t); local ring dimension 2, embedding dimension 3 | Both excluded by the hypotheses; none. |
| `compactBoundaryFrobeniusComparison` | A¹, B=(x), p=2,3 | quotient basis x^j, x^j dlog x, d(x^j)=j x^j dlog x with j a unit | Acyclic; none. |
| compact versus ordinary labels | P¹, one point as B; as A | [O(−1)→O(−2)]: H¹(O(−2))=k in (1,1); [O→O(−1)]: H⁰(O)=k in (0,0) | Twisted label material; none. |
| `algebraicMultiplierIdeal` | (x²), c=1/2, 1/3; (xy), c=1 | (x); O; (xy) | none. |
| `uniformAdjointVeryAmpleness` | λ₁, λ₂ | C(4,1)−2=2; C(7,2)−4=17 | Positive; matches Demailly 0.2(c); none. |
| `numericalVeryAmpleness` | P¹, L=O(1), v=1, w=−2; curve case | m=1 very ample, h⁰=2 ≤ 1·1+1; deg ≥ 2g+1 = deg K+3 | none. |
| `numericalVeryAmpleness` section bound | nondegenerate d-fold of degree δ in P^N | N ≤ δ+d−1 ⇒ h⁰ ≤ m^d v+d | none. |
| `smoothPolarizedBoundedness` | principally polarized abelian surface | K=0 so w=0; L²=2, (mL)²=2m² | none. |

**Suggested.lean form.** Single `import Mathlib` followed by one existing `TauCeti.*` module; one module docstring; `namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry`; docstrings on every declaration; `theorem` only; no `set_option`, `#eval`, `#print`, `lemma`, `True` placeholder or sorried data; every Lean name appears in the README (`README.md:9022–9025`, `:751`, `:1127`, `:7429`).

## Not verifiable

- **Bierstone–Milman 1997, §§4–5 and 7–9 (pp. 241–283), cited in §§9.1–9.3, 9.6 and 9.2a.** The arXiv text `alg-geom/9508005v2` fetched through the service is Chapter I only (53 pages); the Inventiones article behind the DOI was not retrievable legally. The supplier's statements at its head were checked instead.
- **Romagny, Group actions on stacks and applications, Theorem 5.1 (pp. 224–225), cited in §5.1.** The author's host `perso.univ-rennes1.fr` timed out on both attempts through the service. The rigidification statements were checked against Abramovich–Olsson–Vistoli Theorem A.1 and Remark A.2, which cover the same assertions.
- **Settled uncertified paywalls** (Bresciani; Groechenig–Wyss–Ziegler's Inventiones pagination, read in the arXiv version where Definition 2.6 agrees; Hartshorne I.7.7) are cited by locator only; no bypass was attempted.
- Not re-fetched this round and taken from the previous review's verification: Stacks Criteria §§9–11 (§3.4), Stacks spaces-perfect Lemmas 75.26.1–8 (§7.2), Stacks artin 98.9–98.22 statements beyond their tags (§7.1), Alper, Conrad–Temkin, Raynaud, Kleiman, Calegari–Geraghty, Boxer–Calegari–Gee–Pilloni, Dittmann–Pop, Chow–van der Waerden, Grothendieck FGA IV.

## Source issues

- **Misprint** in stacks_picard at Lemma 99.11.4 (0D28), printed p. 28: the source says the normalising unit is α_j∘σ*φ_ij∘α_i; it should be α_j⁻¹∘σ*φ_ij∘α_i, the only composite that is an endomorphism of the structure sheaf; affects the proof.
- **Gap** in stacks_gerbes at Lemma 8.11.8 (0CJY), printed p. 26: the source says the glued sheaves over varying base objects are canonically compatible and omits the verification; it should construct the restriction comparisons and prove their identity and composition laws; affects the proof.
- **Error** in stacks_coherent at Lemmas 30.12.6 and 30.12.8 (01YI, 01YM), printed pp. 31–33: the source says two-out-of-three plus generators on integral closed subschemes suffice for every Noetherian scheme; for the empty scheme both hypotheses are vacuous while the conclusion must hold for the zero sheaf, so a hypothesis P(0) or nonemptiness is needed; affects a stated result.
- **Gap** in olsson_stacks_notes at Lemma 31.6, printed p. 123: the source says every gerbe banded by an injective abelian sheaf is trivial and notes in the text that the argument needs a terminal object; it should pass to the terminal object of the sheaf topos, as §4.20 does; affects the proof.
