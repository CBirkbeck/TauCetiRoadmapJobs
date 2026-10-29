# Review of AlgebraicModuliForArithmeticGeometry (pull request #853 at 959c641)

**Verdict:** needs changes

The gate passes. Two P2 findings concern duplicated ownership and unnecessarily restricted generality; three P3 findings concern presentation and locators. No change to the pull request is requested outside this roadmap folder.

The five findings from the preceding review were checked first against this head:

| Previous finding | Disposition and current passage |
| --- | --- |
| R01, missing coherent dévissage headline | **Repaired.** `Suggested.lean:73` now states `coherentDevissage`; `README.md:1046` explains that the generic-stalk condition “say[s] exactly that it has length one”. The native stalk signature elaborates. |
| R02, dependency gate failure | **Repaired.** The recorded gate passes, and the independent dependency check reports zero problems. AlgebraicVectorBundles L0C remains a legitimate main-branch supplier. |
| R03, undeclared API/Check names | **Partly repaired.** Check labels were removed, but `README.md:313` still says “The API gives” followed by undeclared local Lean names. This remains current R03. |
| R04, future-pin contract | **Repaired.** The future-pin paragraph is gone. `README.md:594` cites “ModularCurves §0G” for the scheme carrier, alongside the pinned quotient-module Grassmannian. |
| R05, attribution of Frobenius equations | **Repaired.** `README.md:949` says “for the graph charts only; the source has no Frobenius statement” and identifies the semilinear equation as a deduction from graph charts and the zero-map locus, rather than as Görtz's chart lemma itself. The F₄ witness still gives 1, versus 0 for the ordinary identity equation. |

Locations below are relative to `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/` unless another roadmap or library is named.

## R01 (P2) — Import scheme fpqc descent instead of replanning it

**Location:** `README.md:1130`, `:1140`, `:1150`, `:1160`; at `:1166`, “declared here as an alias in the covering-family form”.

**Claim:** The four separate targets for faithfulness, fullness, effectivity and equivalence of scheme quasi-coherent descent repeat SchemeAndStackFoundations §1.1. The covering-family presentation does not create a new mathematical theorem: Mathlib already extracts exactly that presentation from its stack predicate. This violates the requirement to import existing roadmap work, even though the repeated statements are true.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2073` on main supplies `qcoh_fpqc_descent`. At the Mathlib pin, `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:70`, `Pseudofunctor.isEquivalence_toDescentData` gives the equivalence for any covering family.

**Repair:** Delete these four `Prove` blocks and their local dependency names. Cite the supplier's stack theorem and the pinned covering-family conversion in scope/contracts and consumers. Keep the genuinely additional tensor-overlap/coalgebra comparisons and algebraic-space extension. Test the import with ℝ→ℂ and conjugation descent: the equalizer is ℝ, its scalar extension is ℂ, and all real-linear maps descend, including the noninvertible zero map. The imported theorem gives the same result without a second owner.

## R02 (P2) — Separate general Betti semicontinuity from perfect Euler characteristic

**Location:** `README.md:8333`, “For a perfect complex K on an algebraic space Y”.

**Claim:** Combining Betti semicontinuity and Euler characteristic under the perfectness hypothesis excludes the general semicontinuity theorem supported by the cited source. Perfectness is needed for the finite Euler sum, but the Betti theorem requires only pseudo-coherence. Restricting the library to the perfect pushforwards used by this route is contrary to the required source-supported generality.

**Witness:** ref89 line 2903, Lemma 75.26.1, printed p.64, assumes pseudo-coherence. Over D=k[ε]/ε², K=k[0] is pseudo-coherent but not perfect; its derived fibre has βᵢ=1 for every i≤0 and βᵢ=0 for i>0.

**Repair:** State upper semicontinuity, étale-local constructibility and arbitrary-base-change compatibility for pseudo-coherent K. State locally constant Euler characteristic separately for perfect K, citing Lemma 75.26.3. Keep perfect proper pushforwards as an application. Add D,k[0] as the separating Check: the resolution with every differential multiplication by ε becomes zero after tensoring with k, so every nonpositive Betti number is 1. The repaired semicontinuity statement applies; no finite Euler sum is claimed for this example.

## R03 (P3) — Rewrite undeclared API names as prose bullets

**Location:** `README.md:313` and `:331`, for example `ProjectiveBundles.projectiveBundle.universalQuotient` and `ProjectiveBundles.projectiveBundle.twistingSheaf.add`.

**Claim:** The README's API lists still attach backticked local declaration names to facts absent from Suggested.lean. The paragraph at `:161` designating intended future names does not satisfy the required correspondence between API names and the acceptance file. The same issue recurs throughout the layers.

**Witness:** Suggested.lean contains five theorems and two predicates; neither quoted API name is declared. Its module docstring explicitly identifies projective bundles and twists as missing geometric carriers.

**Repair:** Make API lists prose bullets, retaining hypotheses and conclusions, and remove local declaration labels unless they really occur in Suggested.lean. Do not add an API catalogue to that file. Preserve the computed quotient-convention tests: P(L)=S with O(1)=L, P(0)=∅, and O(1)⊗O(−1)=O. This completes the unrepaired portion of previous R03; no settled “not actionable” disposition was found.

## R04 (P3) — Correct the marked-ideal and logarithmic supplier locators

**Location:** `README.md:9255`, the row assigning `weightedPresentation_commonMark` and `markedIdeal_rescale` to §1.4; also `:131`, the `LogCrystalline.divisorialLog`, `logDifferentials` and `logDeRham` supplier names.

**Claim:** The marked-ideal constructions are in §1.4, but the named full-test-equivalence theorems are in §1.7. CrystallineCohomology's cited sections contain the required mathematical targets under prose titles, not the claimed `LogCrystalline` declarations. The mathematics has owners; these are inaccurate locators, not unowned prerequisites.

**Witness:** `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:170` places both equivalence theorems in §1.7. `TauCetiRoadmap/CrystallineCohomology/README.md:8057` and `:8466` state “Divisorial log structures” and “Logarithmic differentials”; the advertised declaration names are absent.

**Repair:** Split the §9.1 row: the marked-ideal/common-mark construction cites §1.4, while equivalence and rescaling cite §1.7. Cite the actual prose targets in CrystallineCohomology §§CR.5:log-algebra.4 and CR.5.1, including “Log de Rham complexes” at line 8507. For (x²,2) and (x⁴,4), a controlled blowup divides by x² and x⁴ respectively and yields the unit ideal on both sides; this uses the §1.7 equivalence theorem. For the logarithmic comparison, retain dt=t·dlog(t) on the one-branch chart.

## R05 (P3) — Replace tautological fixture Checks with discriminating instances

**Location:** `README.md:3538`, the three Checks following `BandFixtures.constantSection`, including “Every slice arrow component is exactly the given full centre unit.”

**Claim:** These Checks restate the construction and its generic API laws without choosing any category, centre element or restriction arrow. Merely counting three bullets does not meet the requirement for three discriminating Checks. The identity and multiplication bullets alone also hold for the wrong constant-to-identity construction.

**Witness:** The map sending every centre unit to the identity section preserves identity and multiplication. On BC₃, however, it sends the generator 1 to 0, while the specified section evaluates to 1.

**Repair:** Replace this block with concrete computations: BC₃ with generator 1 gives 1 at every slice arrow, while the inverse gives 2; BS₃ has centre of size 1, not 6; on Discrete(Bool)×BC₃, input (1,2) evaluates to 1 and 2 on the two components, excluding a diagonal or one-component construction. Retain these as README Checks, without Lean declarations. Apply the same criterion to the analogous generic-law-only Check blocks in this fixture family.

## Verified sound

The head matches the requested commit. The outside-folder diff is empty and the worktree is unchanged. The recorded push gate reports every counter zero, including `depcheck`, `build`, `stray-files`, `outside-folder`, `sorry-data`, `imports` and `set_option`. No source text or computational implementation was added to the pull request. The nine-layer organization, reference section, layer examples and layer dependency sections are present. The API/Check exceptions are identified above.

The independent dependency command, with the supplied order, `--movable` and main content, returned:

```text
depcheck: 201 roadmaps, 1313 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. No declared gaps were supplied. Main-branch suppliers were distinguished from later revisions of existing roadmaps; the latter were not used to replace the main contracts. The within-roadmap construction order explicitly puts overlap comparisons before the descent equivalence, auxiliary band/Hom constructions before classification, and approximation/Artin criteria before algebraization. The resolution comparison layer consumes the earlier resolution owner rather than introducing another resolution algorithm.

The missing object file for `TauCeti.AlgebraicGeometry.Modules.Stalk` was built with the permitted module-specific build. The original Suggested.lean then elaborated with exactly five `sorry` warnings and no other diagnostics. A scratch copy with `#check @name` for all seven declarations elaborated: Noetherianity, Artinianity, finite generation, scalar tower, graded compatibility, henselianity and finite-presentation binders were retained where required. No signature change was needed. A second scratch copy tried `simp`, `rfl`, `infer_instance` and `assumption` as closing alternatives for each sorried theorem; all five remained unsolved. Inspection of the nearby library theorems did not provide a one-lemma proof of any entire headline. No Lean padding finding is raised.

The following twelve pinned API checks were made by opening their definitions or statements, not by using a newer library:

| Pinned file and line | What was verified |
| --- | --- |
| Mathlib `AlgebraicGeometry/Modules/Sheaf.lean:36` | `Scheme.Modules` is the category of module sheaves, not just coherent ones. Its abelian instance is at line 47. |
| Mathlib `AlgebraicGeometry/Modules/Sheaf.lean:89` | `Modules.presheaf` exposes the abelian presheaf whose stalks occur in dévissage. |
| Tau Ceti `AlgebraicGeometry/Modules/Stalk.lean:31` | `Scheme.Modules.stalkModule` supplies the module over the actual local ring. |
| Mathlib `Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:269` | Finite presentation is locally a finite module presentation and implies quasi-coherence. On a Noetherian scheme it is the needed coherent condition. |
| Mathlib `CategoryTheory/Sites/Descent/IsStack.lean:49` | `IsStack` imposes effective descent, not groupoid fibres or local nonemptiness; the separate gerbe requirements are necessary. |
| Mathlib `CategoryTheory/Sites/Descent/IsStack.lean:70` | A stack gives an equivalence for the actual covering-family descent functor; this is the witness for R01. |
| Mathlib `RingTheory/Grassmannian.lean:66` | The carrier is submodules with finite projective quotient of specified stalk rank, matching the quotient convention. It is not the relative scheme construction. |
| Mathlib `RingTheory/Polynomial/HilbertPoly.lean:116` | `hilbertPoly` constructs the eventual polynomial from a supplied numerator; it does not establish rationality for finite graded modules over Artinian rings. |
| Mathlib `RingTheory/RegularLocalRing/Defs.lean:92` and `RingTheory/AdicCompletion/Algebra.lean:177` | `IsRegularRing` includes Noetherianity and regular prime localizations; `evalOneₐ` is the completion's residue quotient. The pointed étale map has the asserted residue point. |
| Mathlib `RingTheory/Finiteness/Descent.lean:97` | Finite-presentation descent here is for algebras. It is not the arbitrary-module result planned in §3.1. |
| Tau Ceti `Algebra/Category/ModuleCat/Sheaf/Quasicoherent/FinitePresentationDescent.lean:80` | `of_coversTop` concerns restriction on a fixed ringed site; it does not already state arbitrary faithfully flat scalar-extension descent. |
| Tau Ceti `Algebra/AlgebraicGroup/CommHopfAlgCat/Flat.lean:136` | `faithfullyFlat_of_dominant` assumes algebraic closedness, finite type and reduced target. It does not subsume the unrestricted commutative Hopf-inclusion headline. |

Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The additional Tau Ceti extension-by-zero file was inspected: its preorder/lower-interval construction does not by itself provide the arbitrary-site localization theorem required in §4.20.

Ownership was searched by objects in main, the board packages and the indexed open work, then checked against the available supplier texts. No other declaration with any of this file's seven fully qualified names was found. The following concrete supplier resolutions explain the ownership boundaries; R01 and R04 identify the exceptions rather than treating search hits as missing dependencies:

| Supplier, repository-relative location | Resolved contract |
| --- | --- |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2071`, §1.1 | Scheme QCoh pseudofunctor and fpqc descent, including morphisms. |
| Same roadmap, §§1.10–1.11, at lines 2320 and 2390 | Small étale sites and QCoh on algebraic spaces; §3.1 uses their carriers. |
| Same roadmap, §2.6 at line 3437; §4.14 at line 5706 | Projective-space cohomology/Serre vanishing, and Hilbert/Quot representability. The additional Artinian Hilbert–Serre and explicit-bound comparisons are distinguished from those inputs. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:254`, L0C | Symmetric/exterior powers, determinant and pullback comparisons on main. |
| `TauCetiRoadmap/StableReduction/README.md:361`, Layer 2; Layer 4 | Relative coherent cohomology/base change and blowups, rather than higher-dimensional resolution. |
| `TauCetiRoadmap/JacobianChallenge/README.md:143`, Layer C | Proper scheme coherent cohomology and base change; the algebraic-space extension has a separate owner. |
| `TauCetiRoadmap/ModularCurves/README.md:427`, §0G | Relative Grassmannian charts, gluing and universal quotient for finite locally free input. Coherent input is the extension here. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:963`, RG2.0a.1 | Affine Weil-restriction functor/representing algebra. Algebraic-space representability is additional here. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1057`, E1.9 | Perfect proper-support pushforward and arbitrary derived base change, with target-flat coefficient complex and proper support. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md:2200`, §1.E.1; `:2290`, §1.M.2 | Compatible perfect-system effectivity; arbitrary-residue-field Matlis duality/completion. |
| `TauCetiRoadmap/AdicSpacesPartII/README.md:8968`, R1.3; `TauCetiRoadmap/AdicSpacesPartIII/README.md:11218`, R3.7 | Scheme analytification and proper coherent GAGA. The algebraic-space étale-quotient extension is additional here. |
| `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md`, §§1.1–1.10, 2.1–2.15, 4.1, 5.1–5.6, 6.2–6.3, 7.8 | Marked ideals, Samuel presentations, boundary history, resolution and compactification exports. The one misplaced subsection is R04. |
| `TauCetiRoadmap/CrystallineCohomology/README.md:8057`, CR.5:log-algebra.4; `:8466`, CR.5.1 | Divisorial log structures and logarithmic differential/de Rham objects; cite their actual target titles as R04 requests. |

The explicit open-head searches also found the supplied ArithmeticDynamics and TropicalAndBerkovichArithmetic consumers referring to this roadmap's Berkovich substrate, rather than independently constructing it. The later abelian-moduli, Shimura and complex-analytic developments are consumers or scope exclusions, not additional supplier edges. No ownership assertion is made about unprovided open-head files.

The README's headline inventory and acceptance-test treatment are:

| Layer/headline | Acceptance-test result |
| --- | --- |
| 1: P(E) universal property, twists/cohomology; coherent Grassmannians/flags; uniform regularity and Hilbert-polynomial boundedness | Missing relative geometric carriers are named in the module docstring. Hilbert–Serre is stated at line 48 on native graded modules, including negative degrees. |
| 2: Hom/Isom/Aut representability; coherent dévissage | Parameter functors are named as unavailable; dévissage is now stated at line 73 on native sheaves/stalks. |
| 3: algebraic-space fpqc descent; relative Hom and finite-source Weil restriction | Algebraic-space/site carriers are named as unavailable. Scheme descent is supplied, as R01 emphasizes. |
| 4: derived H² classification and neutrality; intrinsic band, profinite limits/images | Gerbe/banding/class-map carriers are named as unavailable; arbitrary Hopf-inclusion faithful flatness is stated at line 87. |
| 5: rigidification and level removal | Stack/inertia/quotient carriers are named as unavailable. |
| 6: Artin approximation and common étale neighbourhoods | Pointed étale and henselian approximation are stated at lines 119 and 131, using the two real predicates. Henselization/excellence-dependent formulations are named in the docstring. |
| 7: Artin criteria, Picard representability/lifting, group-space components, proper-space GAGA and cofinite coefficients | Algebraic spaces, Picard objects, obstruction theory, analytification and relative cohomology comparisons are named as unavailable. |
| 8: formal effectivity, versality, algebraization and completed comparisons | Framed deformation/formal-object carriers are named as unavailable. |
| 9: supplied resolution/SNC comparisons, Kawamata–Viehweg vanishing, Kollár–Matsusaka boundedness | Resolution/SNC, logarithmic complexes, positivity and intersection carriers are named as unavailable. No replacement scalar inequality is offered. |

Source keys used below: ref12, [Fundamental gerbes](https://arxiv.org/pdf/1610.07341v3); ref14, [The Stacks Project: Cohomology of Schemes](https://stacks.math.columbia.edu/download/coherent.pdf); ref15, [The Stacks Project, Stacks, Section 8.11: Gerbes](https://stacks.math.columbia.edu/tag/06NY); ref19, [Effective Bounds for Very Ample Line Bundles](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/very_ample.pdf); ref27, [Algebraic Geometry III: Grassmannians](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf); ref37, [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590); ref39, [Stacks (Math 274, Berkeley)](https://stacky.net/files/written/Stacks/Stacks.pdf); ref59, [The Picard functor](https://stacks.math.columbia.edu/tag/0D24); ref73, [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf); ref89, [The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf).

All fifteen seeded headings were checked. No README locator explicitly marked unverified was found. Source retrieval used the sources service; a successful download was not treated as verification of text that the extraction did not contain. Exact source evidence for the seeded sample is:

| Sample | Locator/text inspected and result |
| --- | --- |
| §2.2 Automorphisms and bounded quotients | ref37 lines 1182–1237, Theorems 6.5–6.6 and Aut exercise, pp.30–31; lines 959–1108, Theorem 5.2/Grassmann embedding, pp.24–28. Projective flat source, quotient flatness and the uniform twist bound are retained; arbitrary tests use the roadmap's limit-descent extension. |
| §4.1 Gerbes and relative locality | ref15 lines 977–1088, Definition 8.11.1, Lemmas 8.11.2–8.11.7, pp.22–24. Local lifting of every target isomorphism is present, not just local lifting of objects. |
| §4.8 Constant/connected/varying fixtures | ref15 lines 1124–1173, Lemma 8.11.8, pp.25–26. The finite diagrams are correctly described as authored deductions, not a theorem printed there. Their changing restriction maps were computed below. |
| §4.10 Banded transformations/composition | ref39 lines 5351–5406, Definition 31.1 and Lemma 31.3, pp.122–123. Fixed-band equivariance and full faithfulness match the torsor argument. The actual-functor identities are deductions. |
| §4.17 Local covers/chart comparisons | ref15 lines 977–985 and 1138–1173. Object/isomorphism covers and independence of local connecting arrows use gerbe locality and abelian conjugation. The exact canonical sieves are authored constructions. |
| §4.19 Affine stabilizer quotients | ref12 lines 380–440, Definition 3.8 and Proposition 3.9/proof, pp.8–9. Arbitrary affine gerbes, kernel quotient and affine descent match; the source's wrong final-Hom codomain is not adopted. |
| §4.21 Intrinsic band on slices | ref15 lines 1124–1173. The roadmap supplies the varying-base compatibility that the source explicitly leaves unwritten. It does not assume a terminal site object. |
| §7.1 Formal points, gluing, obstructions | ref73 lines 485–550 (98.9.1/98.9.4/98.9.5, pp.11–14), 1281 onward (98.18.1), 1522–1529 (98.20.3, pp.33–34), 1816–1861 (98.22.1–2, pp.39–40). Complete towers, square-zero RS*, every pairwise transition kernel in strong effectivity, and countable-product obstruction hypotheses are retained. |
| §7.2 Perfect-complex rank loci | ref89 lines 2902–3007, Lemmas 75.26.1–8, pp.64–66. Rank and universal-function hypotheses match. R02 concerns the unnecessarily narrow first theorem. The H⁰/Hᵃ misprint is corrected in the roadmap. |
| §7.6 Picard sheafification/section splitting | ref59 lines 1235–1345, Situation 99.11.1 and Lemmas 99.11.3–7, pp.27–30. Universal structure-sheaf isomorphism and section hypotheses are retained. |
| §7.6.1 Relative classes/rigidifications | Same text, particularly ref59 lines 1251–1283 and 1304–1345. Raw classes, sheafified classes and framed line bundles are kept distinct. |
| §7.6.1a Rigidified representatives | ref59 lines 1286–1303, Lemma 99.11.4 proof, pp.28–29. The inverse on αⱼ is restored, and descent of the trivializations is explicitly included. |
| §9.1 Marked ideals/transforms/tests | Supplier §§1.1–1.9 resolved; numerical transform tests below recomputed. Full published ref06 §§4.1–4.10, pp.241–244, was not available in the retrieved excerpt. R04 fixes the supplier subsection. |
| §9.1a Order/marked sums | Supplier §1.10 resolved; opposite exponents and regularity tested below. Full ref06 pp.241,247 not verified. |
| §9.2 Contact/coefficients/Samuel presentations | Supplier §§2.1–2.14 resolved; coefficients and Samuel lengths tested below. Full ref06 §§4–5 and 7–9, pp.241–253 and 262–283 not verified. |

The 154 adversarial calculation rows follow. D means k[ε]/ε²; Cₙ is written additively. These are computed witnesses, not proofs of universal theorems. Related transport laws use the same specified nontrivial examples; an empty carrier is not silently replaced by a nonempty torsor.

| Statement | Instances tried | Values on the two sides / separating value | Result; change |
| --- | --- | --- | --- |
| §1.1 projective quotient | E=0 on nonempty S | Invertible quotients=∅; P(0)=∅ | Agrees; none. |
| §1.1 quotient convention | E=L=O(1) on P¹ | P(L)=S; universal line=L=O(1), not O(−1) | Agrees; preserve in R03. |
| §1.1 integer tensor twists | a=1,b=−1; E=L | O(1)⊗O(−1)=O(0); rank-one restrictions L⊗L⁻¹=O | Agrees. |
| §1.2 dimension-zero cohomology | P⁰_A, m=−2,0,2 | H⁰=A in all three cases; higher groups=0 | No conflicting degree-0/top-degree branches. |
| §1.2 negative cohomology | P¹_k, m=−2 and −1 | h¹=1 and 0; Laurent basis at −2 is x⁻¹y⁻¹ | Agrees. |
| §1.2 determinant twist | E=O(1)⊕O over P¹, m=−2 | R¹π_*O(−2)=det(E)⁻¹=O(−1), not O(1) | Quotient convention consistent. |
| §1.2 positive multiplication | P¹, degrees 1+1 | x·y=xy; degree-2 basis x²,xy,y² has dimension 3 | Agrees. |
| §1.3 Grassmann extreme ranks | Gr₀(k²), Gr₁(0) | Point and empty space respectively | Agrees. |
| §1.3 Grassmann tangent | Gr₂(k⁴) at standard quotient | Hom(k²,k²) dimension 4 =2(4−2) | Agrees. |
| §1.3 Plücker relation | Rows (1,0,1,2),(0,1,3,4) | Minors 1,3,4,−1,−2,−2; relation −2+6−4=0; also 0 mod 2 | Sign convention passes. |
| §1.3 flags | Empty flag; full flag in k³ | S; dimension 1·2+1·1=3 | Nested-kernel convention retained. |
| §1.4 relative versus absolute ampleness | id:P¹→P¹, L=O(−1) | Relatively very ample; H⁰(Lᵐ)=0 for m>0 | Source proof correction needed, not a false relative target. |
| §1.5 Hilbert–Serre | k[x,y], degree d≥0 | Length d+1; series 1/(1−T)²; P(d)=d+1, degree 1<2 | Headline passes. |
| §1.5 Hilbert–Serre Artinian length | A=D, M=A[x] | Each piece length_A=2; series 2/(1−T); P=2 | Uses length, not residue-field rank of a free A-piece. |
| §1.5 Hilbert–Serre shift | k[x] generated in degree −2 | Unshifted series T⁻²/(1−T); d₀=−2 gives numerator 1 | Negative degrees retained. |
| §1.5 Hilbert–Serre zero variables | M=k in degree 0, e=0 | Series numerator 1; eventual P=0 with degree −∞<0 | No natural-degree truncation bug. |
| §1.5 CM regularity | O(a) on P¹ | H¹(O(a+m−1))=0 iff a+m≥0; O(−2) fails m=1 | Discriminates off-by-one bound. |
| §1.5 quotient regularity | O→O_Z, length d on P¹ | Kernel O(−d); at m=d kernel is O and quotient has h⁰=d | Same m controls kernel and quotient. |
| §1.6 support parameters | Double line versus reduced line | Same support; degrees 2 and 1 | Multiplicities not replaced by support. |
| §1.6 bigness | P¹, O and O(1) | h⁰ powers 1 versus m+1; top growth 0 versus 1 | Correct positive-dimensional distinction. |
| §1.7 rank locus | Matrix [ε] over D, rank≤0 | Defining ideal (ε)≠0; geometric rank is 0 everywhere | Scheme structure retained. |
| §1.7 incidence rank cutoff | a=0,b=1,k=1 | No intersection of dimension≥1; defining ideal is unit | Avoids natural subtraction turning an impossible condition into 0. |
| §1.7 Frobenius stability | F₄, t²=t+1 | t²−t=1; ordinary identity equation=0 | Repaired attribution, same formula. |
| §1.7a coefficient cutoff | Degree bound 0 | Constant coefficients add a+b; discarded positive terms contribute 0 | No out-of-range coefficient used. |
| §2.1 Hom graph | P¹→P¹ identity | Graph projects isomorphically, fibres length 1; two-sheet cover has length 2 | Graph locus distinguishes extra finite cover. |
| §2.2 automorphisms | P¹; elliptic E | PGL₂ dimension 3; translation subgroup E dimension 1 | Neither is claimed finite. |
| §2.2 Quot embedding | n=0, E=kᵖ, rank r | Quot=Grᵣ(kᵖ); r=0 gives one quotient and one Grassmann point | Bound and zero quotient agree. |
| §2.3 coherent dévissage | X=∅, P constantly false | Generic/conditional exact hypotheses vacuous; P(0)=false | Explicit zero hypothesis excludes counterexample. |
| §2.3 coherent dévissage | Spec k, P=even dimension | Length-one witness k has dimension 1; P(k)=false | Generic condition excludes wrong parity model. |
| §2.3 coherent dévissage | Spec k, P=finite dimension | Generic witness length 1; extension dimensions add r+s | Native signature matches theorem. |
| §3.1 scheme fpqc descent | ℝ→ℂ, conjugation | Fixed module ℝ; ℂ⊗ℝℝ=ℂ | True but already supplied; R01. |
| §3.1 full/faithful descent | Same cover, map 0:ℝ→ℝ | Pullback map 0:ℂ→ℂ; unique descended zero map | Noninvertible maps included; R01. |
| §3.2 overlap/coalgebra coordinates | Tensor (s⊗m)⊗t | Image s⊗(t⊗m); inverse returns (s⊗m)⊗t | Actual scalar order retained. |
| §3.3 arbitrary-map limitation | ℤ→F₂ | ℤ and F₂ both extend to F₂; not an equivalence on modules | Faithful flatness needed for effectivity, not just coaction syntax. |
| §3.4 Weil restriction | Empty finite source; two split points | Res=point; Res(A¹)=A² | Rank 0 and split rank 2 agree. |
| §4.1 gerbe locality | BC₃; discrete two objects | Isom set size 3; cross-object Isom=∅ | Second fibre category is not a gerbe on point site. |
| §4.1 relative gerbe | B1→BC₂ | Objects lift; map on automorphisms 1→2 not surjective | Isom-lifting hypothesis is material. |
| §4.2 band preservation | BC₃, inversion | Generator 1 maps to 2≠1 | Unbanded equivalence excluded. |
| §4.3 root-gerbe class | Square roots of O(1),O(2) on P¹ | Degrees 1/2 impossible versus root O(1); classes 1 and 0 mod 2 | Neutrality direction passes. |
| §4.3 injective band | Injective I | H¹(I)=H²(I)=0; boundary H¹(I/A)→H²(A) is iso | Classification does not assume its conclusion. |
| §4.4 profinite stages | ∏C₂ and projection to first factor | Stage n kernel order 2^(n−1); full kernel infinite | Finite-stage properness not confused with finite type of limit. |
| §4.5 twisted inertia | μ₃ over F₂/F₄ | Rational μ₃ points have sizes 1 and 3 | Constant C₃ and μ₃ are distinguished. |
| §4.5 twist direction | μ₅ over F₂ | Frobenius exponent 2; inverse exponent 3 mod 5 | Two directions not interchanged. |
| §4.6 centre | BS₃; BQ₈ | Centres have orders 1,2; automorphism groups orders 6,8 | Full automorphism group is wrong carrier. |
| §4.7 local conjugation | Abelian C₃, e=1 and e=2 | e+a−e=a for both choices | Canonical transport independent of local arrow. |
| §4.8 constant section | BC₃, z=1 | Every component=1; wrong zero/inverse gives 0/2 | R05 supplies discriminating Check. |
| §4.8 disconnected section | Discrete(Bool)×BC₃, z=(1,2) | Centre order 9; evaluations 1,2; one-component evaluation has kernel order 3 | R05; connectedness matters. |
| §4.8 varying restrictions | C₄→C₂→C₂, reductions | 1↦1↦1; 2↦0↦0; section counts 4→2 | Restriction need not be injective. |
| §4.8 no terminal object | Two disjoint opposite Fin3 chains | No object receives arrows from both components | Fixture genuinely avoids a terminal object. |
| §4.9 action/difference | C₅, p=1,a=2,q=4 | act(1,2)=3; diff(1,4)=3; act(1,3)=4 | Positive action sign passes. |
| §4.9 difference cocycle | C₅, p=1,q=4,r=0 | diff(1,0)=4 =3+1 mod 5 | Composition order passes. |
| §4.9 empty Isom | No global arrow x→y | Both principal-action products empty; Nonempty remains false | No global torsor inferred from conditional freeness. |
| §4.10 map_act | Fixed-band identity on BC₅ | map(1+2)=3 =map(1)+2 | Coefficient unchanged. |
| §4.10 map_difference | Same, p=1,q=4 | diff(images)=3=diff(p,q) | Injectivity witness retained. |
| §4.10 anchored inverse | Anchor p₀=0, target q=4 in C₅ | Difference=4; lifted arrow 0+4=4 | Surjectivity uses actual anchor. |
| §4.10 composition | Two fixed-band identities, a=2 | Composite sends 2→2→2 | Inversion sends 2→3 and fails the band equation. |
| §4.11 restriction action | C₄→C₂, p=1,a=2 | Restrict(1+2)=1; restrict(p)+restrict(a)=1+0=1 | Nonidentity coefficient restriction retained. |
| §4.12 overlap cocycle | C₅ local comparisons e₁=1,e₂=3,e₃=4 | Differences 2,1,3; 2+1=3 | Lifted cocycle has same values under fully faithful functor. |
| §4.12 inverse banding | Identity equivalence of BC₃ | Inverse sends generator 1 to 1; unit/counit conjugations fix 1 | Fixed band retained. |
| §4.13 modification inversion | BC₅, component m=2 | Inverse component 3; 2+3=0 | Modification groupoid retains actual inverse. |
| §4.13 self transport | Identity X, e=1 or 3, p=2 in C₅ | −e+p+e=2 in both cases | Choice independence passes. |
| §4.13 wrong self map | X inversion on C₃, p=0 | Transport for e=0 gives 0; e=1 gives 1 | Band preservation necessary for independence. |
| §4.14 Hom restriction | C₄→C₂, p=3, identity comparison | Restricted arrow=1; restricted coefficient/action gives 1 | Hom-sheaf restriction agrees. |
| §4.15 base-change coefficient | Two charts over same test T, a=1∈C₃ | Both actions add 1; a spurious restriction-to-zero would add 0 | Same-T coefficient convention passes. |
| §4.16 endpoint transport | Identity X on BC₅, e=2,d=1,p=3 | −d+p+e=4; inverse transport −(−1)+4−2=3 | Both endpoint factors required. |
| §4.17 object/isom covers | BC₃ on point site | Both canonical sieves maximal; objects nonempty and Isom size 3 | Cover property passes. |
| §4.17 negative isom cover | Discrete two objects | Cross-object isom sieve empty, not covering | Rejects disconnected wrong gerbe. |
| §4.17 chart refinement | C₃ self-transport, independent arrows 1 and 2 | For p=1, both transitions and their composite give 1 | No compatible-choice assumption needed. |
| §4.18 orbit injection | BC₃ self identity | Three raw classes, chart injection 3→3 | Does not collapse automorphisms to one class. |
| §4.18 empty fibre | Empty fibre over U | Raw chart-pair set and quotient both ∅ | Sheafification need not stay empty. |
| §4.19 affine factor | BC₄→BC₂ | Kernel C₂; middle BC₂; final map identity | Correct quotient/image. |
| §4.19 source misprint control | B1→BC₂ | Quotient Isom size 1; target Isom size 2 | Middle B1, not BC₂; source issue recorded. |
| §4.20 lifting-gerbe sign | 0→ℤ→ℚ→ℚ/ℤ, lifted value 1/2 | Translation by 1 changes lift to 3/2, same quotient class | Positive kernel action retained. |
| §4.21 slice compatibility | ℤ restrictions ×2 then ×3 | Generator 1 goes 1→2→6; direct map gives 6 | Varying-base law is nonconstant. |
| §4.21 intrinsic versus global band | μ₃ over ℝ/ℂ | Section groups sizes 1 and 3 | Global sections cannot stand for the sheaf. |
| §4.22 Hopf inclusion | k[tᵖ]⊂k[t], p=2,3 | Free bases {1,t}, {1,t,t²}; ranks 2,3 | Faithfully flat even inseparable. |
| §4.22 nonreduced Hopf | k→k[t]/tᵖ | Free rank p>0; t nilpotent | Reducedness cannot be added to headline. |
| §4.22 normal quotient | GL₂/B | Quotient P¹, not affine; B nonnormal | Normality of subgroup is essential. |
| §4.23 index category | Empty category; monoid {1,0} | Empty fails nonemptiness; absorbing 0 equalizes arrows but End has size 2 | Ordinary cofilteredness does not imply poset equivalence. |
| §4.23 finite synchronization | Relations involving coordinates 1 and 2 in ∏C₂ | Both detected at n=2; coordinate 2 invisible at n=1 | Common finite stage required. |
| §5.1 rigidification | BC₄ by C₂ | Inertia 4→2; removed kernel order 2 | Quotient, not subgroup selection. |
| §5.1 normality | S₃, subgroup ⟨(12)⟩ | Conjugation by (123) gives ⟨(23)⟩≠⟨(12)⟩ | Excluded. |
| §5.1 nonsmooth kernel | Bμ₂→point in char 2 | Kernel tangent dimension 1; quotient stack point | Stack smoothness not group smoothness. |
| §5.2 level removal | G-torsor over BG | Fine atlas point; quotient [point/G]=BG; inertia remains G | Level and rigidification distinguished. |
| §5.3 fppf versus pointwise surjection | Squaring Gₘ over ℝ | Fibre at −1 has no ℝ-point, two ℂ-points | Correct sheaf interpretation. |
| §5.3 coarse product warning | point→BG←point, nontrivial finite G | Stack product=G; product of coarse points=point | No fibre-product preservation promised. |
| §5.4 schematic closure | Spec ℤ[1/p]→Spec ℤ | Closure whole Spec ℤ; fibre at p of source empty | Nonflat base change excluded. |
| §5.4 normalization | xy=0; Spec D | Two branches; reduced normalization of D is Spec k | Nonreduced structure treated explicitly. |
| §6.0 approximation at a field | A=k, m=0 | For n≥1 difference must be 0; n=0 modulus is unit ideal | Total exponent-0 value harmless. |
| §6.0 complete positive model | A=k[[t]] | Completion=A; ψ=φ gives difference 0 at every n | Native predicate agrees. |
| §6.1 henselian hypothesis | ℚ[t]_(t), z²=1+t | Formal root 1+t/2−t²/8+…; rational root impossible since ord_(t+1)=1 | No A-valued conclusion here. |
| §6.1 pointed étale form | Same formal root near z=1 | Derivative 2z reduces to 2≠0; étale neighbourhood contains root | Headline retains correct alternative. |
| §6.1 arithmetic roots | z²=2 over ℤ₇ and ℤ₂ | 3²≡2 mod 7 with derivative 6≠0; mod 8 squares 0,1,4≠2 | Equal/mixed-characteristic distinctions retained. |
| §7.1 formal tower | x=0 versus x=ε over D | Equal mod m; unequal mod m² | Formal point includes all jets. |
| §7.1 RS* negative control | D×ₖD | Diagonal dimension 2; full pullback dimension 3; both projections D | Set-of-subsets functor fails injectivity. |
| §7.1 tangent fibre | A¹ over F₂ at 0 | Two framed lifts 0,ε; four total D-points | Fibre, not whole F(D). |
| §7.1 obstruction | x²=0, ε modulo ε² lifted modulo ε³ | Square becomes ε²≠0 | Nonzero obstruction excludes lift. |
| §7.1 strong effectivity | A⊕∏ₙk·uₙ, square-zero ideal | Every product uᵢuⱼ=0; infinitely generated ideal | Strong condition is not only complete Noetherian local effectivity. |
| §7.2 Betti jump | [k[t] —t→ k[t]], degrees 0,1 | Away: (0,0); at 0: (1,1); Euler 0=0 | Upper semicontinuity and Euler agree. |
| §7.2 pseudo-coherent separation | D, K=k[0] | βᵢ=1 for all i≤0, 0 for i>0; infinite Tor amplitude | R02: include Betti theorem, exclude finite Euler assertion. |
| §7.2 single-degree locus | k[0], (i,r)=(0,1),(1,1) | Loci point and empty | Requires all cohomological degrees. |
| §7.2 universal rank stratum | [D —ε→ D], a=0,r=1 | Kernel (ε) not free; residue kernel k has rank 1 | Pointwise rank alone insufficient. |
| §7.2 lowest-degree sign | k[−1], a=b=1 | H¹=k, H⁰=0 | Corrects source H⁰ misprint. |
| §7.2 universal functions | Spec D and Spec k over k | H⁰ dimensions 2 and 1 | Connectedness alone insufficient. |
| §7.3 relative module Hom | F=k[t,x]/x, G=k[t,x]/(x−t) | Hom generic 0, special A¹; equation tz=0 | Representability does not imply flatness. |
| §7.3 relative module Isom | Same F,G | Generic empty; special Gₘ; z must be invertible | Isom openness in Hom retained. |
| §7.3 Picard lifting | Smooth curve genus g, kernel k | Obstruction H²=0; lift differences H¹ dimension g; Inf dimension 1 | Scalars not deleted. |
| §7.4 proper GAGA | Proper point over complete K | Both coherent categories finite K-modules; H⁰=K, Hⁱ=0 for i>0 | Identity comparison passes. |
| §7.5 inseparable finite normalization | k[t]⊂k[u], t=uᵖ | Module rank p; du≠0 in relative Ω¹ | Finite need not be étale. |
| §7.5 empty valuation family | Intersection over ∅ | Base intersection=F; extended intersection=E | Empty convention agrees. |
| §7.5 K/O boundary | DVR, element [π⁻¹] | Nonzero class killed by π; [π]=0 | Correct inverse-uniformizer normalization. |
| §7.5 cofinite criterion | (K/O)² | Socle dimension 2; Matlis dual O² | No finite residue-field hypothesis needed. |
| §7.6 relative Picard | id:P¹→P¹ | Raw Pic=ℤ; relative sheaf=0 | Base classes killed after sheafification. |
| §7.6 section split | P¹→Spec k with section | Pic(P¹)=ℤ; Pic(k)=0; kernel=ℤ | All degrees survive rigidification. |
| §7.6.1 rigidified automorphisms | Universal functions, scalar λ | Rigidification condition λ=1; automorphism group trivial | Arbitrary scalar is not allowed. |
| §7.6.1a overlap normalization | αᵢ=2, αⱼ=3, φ=5 over ℚ | Unit=10/3; corrected φ=(3/10)·5=3/2; (3/2)·2=3 | Source inverse repaired. |
| §7.6.1a wrong normalization | Same values, omit αⱼ inverse | Scalar 30; corrected φ=1/6, so (1/6)·2=1/3≠3 | Negative control passes. |
| §7.9 component hypotheses | Constant C₂ over k; nonreduced D | Identity component has 1 point versus 2 in the whole group; dim H⁰(D)=2 versus 1 for Spec k | Reducedness and component distinction retained. |
| §7.10 finite invariants | C₂ acting by x↦−x, char≠2 | Invariants k[x²]; free rank 2 over them | Uses finite invariants, not pointwise orbit identification. |
| §8.1 framed deformation | A¹ at 0 over D | Lifts x↦aε indexed by k | Framing retains tangent parameter. |
| §8.2 formal effectivity | t mod tⁿ | Every truncation nilpotent; limit t not nilpotent | Effectivity is not automatic for arbitrary functor. |
| §8.2 versality versus hull | A¹→point | Atlas tangent dimension 1; target tangent dimension 0 | Smooth atlas not claimed minimal hull. |
| §8.3 infinitesimal stabilizer | BGₘ over D | Kernel {1+aε}; product coefficient a+b | Composition agrees with vector addition. |
| §8.3 tangent exact sequence | point×_(BGₘ)point=Gₘ | 0→Inf(BGₘ)=k→T(Gₘ)=k→0, boundary identity up to chosen sign | Dimension/exactness passes. |
| §8.3 nonsmooth lifting | μₚ, zᵖ=1+ε in char p | (a+bε)ᵖ=aᵖ; ε coefficient 0≠1 | No spurious lift. |
| §8.3 coarse completion | Sign quotient x↦x² over D | All x=aε map to 0; coarse point t=ε exists | Coarse deformation is not stack deformation. |
| §8.3 completed local ring | Node xy=0 | Completion k[[x,y]]/(xy); x,y nonzero, product 0 | Not confused with smooth power-series ring. |
| §9.1 controlled transform | (x²,y³), mark 2; x=u,y=uv | Total u²(1,uv³); controlled ideal (1,uv³)=O | Division exponent correct. |
| §9.1 test equivalence | (x²,2),(x⁴,4) | One Cartier controlled transform gives O on both; powers remain proportional | R04 cites §1.7. |
| §9.1 normalized orders | (x²y³,2), boundary x=0 | Point order 5/2; exceptional 1; residual 3/2 | Generic and point orders differ. |
| §9.1a marked sum | (x²,2)+(y³,3) | Ideal (x⁶,y⁶), mark 6; cosupport={origin} | Opposite exponents, no mark truncation. |
| §9.1a degenerate orders | Unit, zero, and D's maximal ideal | Orders 0,∞,1; ord((ε)²)=∞≠2 | Regularity needed for power formula. |
| §9.2 maximal contact | z²+x³ in char 0 | ∂z=2z order 1; coefficient x³ with mark 2, normalized 3/2 | Char 2 gives ∂z=0 and is excluded. |
| §9.2 Samuel diagram | Ideal (x²,y³) | Standard monomials 1,x,y,xy,y²,xy²; cumulative lengths 1,3,5,6 | Correct local-length indexing. |
| §9.4 unit principalization | Ideal O | Exceptional divisor 0; weak transform O | Degenerate supplied theorem consistent. |
| §9.4 generic nonzero | Ideal zero on one irreducible component | Pullback still zero there, hence not invertible | Excluded hypothesis is necessary. |
| §9.5 Cartier separation | Divisors 2[0],3[0] | Common part 2[0]; residuals 0,[0]; reconstructed 3[0] | Multiplicity retained. |
| §9.5 SNC compactification | Gₘ² in P¹×P¹ | Four boundary components and four double crossings | Labels not collapsed into two. |
| §9.6 companion branches | b=3,c=2; b=2,c=3 | Complementary mark 1 in first; no negative mark −1 in second | Guarded branches retained. |
| §9.7 boundary transversality | y=x² against x=0 and y=0 | First transverse multiplicity 1; second tangent multiplicity 2 | Preserve only resolved pair locus. |
| §9.7 component exclusion | X=(x=0), boundary (x=0) | Restriction equation 0, not Cartier | Exclusion material. |
| §9.10 logarithmic differential | One branch x=0 | dx=x·dlog x; d(xᵖ)=0 in char p | R04 supplier convention consistent. |
| §9.10 residue sign | dlog x∧dlog y | resₓ=dlog y; reversed order gives −dlog y | Sign fixed. |
| §9.10 relative SNC | Base ℚ[t], X=base, D=(t) | Ω¹log=base/(t); ideal image=0 but tensor with (t)≅base/(t) | Absolute SNC alone insufficient; relative charts required. |
| §9.10 regular-base condition | Base cusp ℚ[u,v]/(v²−u³), X=A¹ | Local dimension 2, embedding dimension 3 | Cannot infer regular total space over singular base. |
| §9.10 compact Frobenius quotient | p=2 and p=3, one boundary | Differential matrices (1) and diag(1,2) invertible | Acyclic quotient, not zero termwise. |
| §9.10 compact versus ordinary labels | P¹, one marked point | Compact sole Hodge group H¹Ω¹=k, total degree 2; ordinary H⁰O=k, degree 0 | Twist distinguishes the two complexes. |
| §9.10 cyclic cover normalization | z²=x³, character 1 | floor(3/2)=1; normalized generator z/x, residue 1/2 | Floor and sign agree. |
| §9.10 adjoint vanishing | P¹, L=O(m) | m>0: h¹(O(m−2))=0; m=0: h¹(O(−2))=1 | Positivity material. |
| §9.10 multiplier ideal | (x²), c=1/2 and 1/3 | Floors 1 and 0; ideals (x) and O | Correct order of multiplication and rounding. |
| §9.10 crossing multiplier | (xy), c=1 | Ideal (xy), not (x,y) or O | Both boundary components retained. |
| §9.11 numerical very ampleness | P¹,L=O(1), v=1,w=−2,m=1 | mv=1=w+3; h⁰=2=mv+1 | Small dimension passes. |
| §9.11 dimension zero | Geometrically integral point | Exponent 1; degree 1; h⁰=1 | Separate boundary case stays in README. |
| §9.11 polarized boundedness | Principally polarized abelian surface | L²=2, K·L=0; (mL)²=2m² | Numerical dependence retained. |

## Not verifiable

- **ref06, full Bierstone–Milman 1997 article.** The DOI resolution supplied arXiv `alg-geom/9508005v2`, a 53-page Chapter I excerpt. It does not contain the published chapters carrying the sampled §§4–5 and 7–9 locators. The source excerpt's numbering cannot certify published pp.241–283. The supplier statements and calculations were checked, but they do not replace those missing pages.
- **ref05, Bierstone–Milman 1989.** DOI/AMS landing-page and explicit publisher PDF attempts through the service did not yield readable article text. Its theorem locators remain unverified.
- **ref18, Chow–van der Waerden.** The legal GDZ item supplies an image-viewer extraction, not readable Satz 1 on pp.695–697; OCR is unavailable. This is not a theorem-text certification.
- **ref40, Romagny, Group actions on stacks and applications.** The cited author URL timed out on retry. A bibliographic service lookup found no legal text. The independent rigidification mathematics was checked, but the exact paper locators were not.
- **ref91, Atiyah–Macdonald.** The service found no legal text for Chapter 11, Theorem 11.1, p.117. The Hilbert–Serre signature and explicit length-series examples were checked independently.
- **Settled paywalls:** ref10 (Bresciani), ref29 (Groechenig–Wyss–Ziegler), and ref92 (Hartshorne I.7.7) resolve as `uncertified`. No bypass or renewed missing-text request is made. The readable Borne–Vistoli, Olsson and Stacks arguments were used where applicable; that does not certify the unread pages.

All reference-list entries were attempted through the source service, along with the four inline works Włodarczyk (ref90), Atiyah–Macdonald (ref91), Hartshorne (ref92) and Conrad (ref93). Publisher-open copies of Charles and Gao–Ge–Kühne were retrieved after identifying their legal publisher hosts. Access failures have been consolidated; no source file, extracted source passage or manifest modification is part of this review. The report's computations do not certify inaccessible source locators or replace a formal proof of the roadmap's general statements.

## Source issues

- **Error** in ref14 at Lemmas 30.12.6 and 30.12.8 (01YI, 01YM), printed pp.31–33: the source says its dévissage conditions suffice also for the empty scheme; it should be require P(0), or exclude the empty scheme; affects a stated result.
- **Error** in ref37 at proof of Theorem 6.5, printed p.30: the source says high powers of a relatively very ample bundle have globally generated pushforward; it should be use relative evaluation generation, since identity P¹ with O(−1) disproves global generation; affects the proof.
- **Error** in ref37 at the punctured-affine-space exercise, printed p.32: the source says a point over any ring has an invertible coordinate; it should be require coordinates generating the unit ideal, as (2,3) over ℤ shows; affects a stated result.
- **Misprint** in ref27 at proof of Proposition 5.17, printed p.62: the source says the standard basis of ℤⁿ ends at e_(n−1); it should be end at e_n; affects the proof.
- **Misprint** in ref39 at proof of Lemma 31.3, printed p.122: the source says its torsor map is invertible by Lemma 31.3 itself; it should be invoke the equivariant-map-between-torsors fact; affects the proof.
- **Misprint** in ref12 at proof of Proposition 3.9, printed p.9: the source says the kernel quotient of Isom identifies with Isom in the final target gerbe; it should be use the intermediate gerbe and its map g; affects the proof.
- **Misprint** in ref15 at proof of Lemma 8.11.5 (06R2), printed p.24: the source says the two fibre-product projections return the opposite components; it should be return y′ under F′ and x under G′, and conjugate the lifted arrow by the gluing isomorphisms; affects the proof.
- **Gap** in ref15 at proof of Lemma 8.11.8 (0CJY), printed p.26: the source says the intrinsic bands over varying base objects are canonically compatible but omits verification; it should be construct the restriction comparisons and prove their identity and composition laws; affects the proof.
- **Misprint** in ref89 at Lemma 75.26.6 (0D21), clauses (4)(b)–(c), printed p.65: the source says H⁰ controls the lowest-degree rank stratum for amplitude [a,b]; it should be use Hᵃ in both clauses; affects a stated result.
- **Misprint** in ref59 at proof of Lemma 99.11.4 (0D28), printed p.28: the source says the overlap-normalizing scalar uses αⱼ without inversion; it should be use αⱼ⁻¹ to obtain an endomorphism of the structure sheaf; affects the proof.
- **Misprint** in ref59 at the definition preceding Lemma 99.11.5 (0D29), printed p.29: the source says the base-changed arrow g′ runs from X_T′ to X_T; it should be run from X_T to X_T′ for g:T→T′; affects a stated result.
- **Misprint** in ref19 at proof of Theorem 2.4(a), printed p.10: the source says H⁰ vanishes for q≥1; it should be Hᵠ; affects the proof.
- **Error** in ref19 at the paragraph before Theorem 3.1, printed p.11: the source says the resolution pushforward canonical sheaf is always the usual dualizing sheaf; it should be distinguish the Grauert–Riemenschneider sheaf, which can be strictly smaller; affects a stated result.
- **Misprint** in ref19 at proof of Theorem 4.7, printed p.15: the source says L^(p−1) against a p-dimensional component is a positive degree; it should be use L^p; affects the proof.

- **Misprint** in ref73 at proof of Lemma 98.9.3 (07X5), printed p.12: the source says the lifted objects satisfy equations with the source and target families interchanged; it should be restrict ξₙ to ξₙ₋₁ and identify F(ξₙ) with ηₙ; affects the proof.
