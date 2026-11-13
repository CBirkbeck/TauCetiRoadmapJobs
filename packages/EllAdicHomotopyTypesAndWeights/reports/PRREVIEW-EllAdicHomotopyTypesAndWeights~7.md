# Review of EllAdicHomotopyTypesAndWeights (pull request #1644 at 284a816)

**Verdict:** needs changes

## R01 (P3) — The dependency paragraph describes the former supplier contracts

**Location:** Pull request description, Dependencies paragraph: “Twelve of its supplier contracts are extensions it requests from six of these: five from AlgebraicTopologyPartII (polynomial forms and Sullivan theory)”.

**Claim:** The head replaces AlgebraicTopologyPartII with RationalHomotopyModels and replaces those five gap requests with section citations. The description omits this replacement; its counts also classify DiamondsAndVStacks as open although it is on main.

**Witness:** `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:63–75` cites RationalHomotopyModels; seven `gap:` contracts remain. Supplier headings resolve to nine roadmaps on main and eight open roadmaps. `TauCetiRoadmap/RationalHomotopyModels/README.md:49–54` at #2298 explicitly owns the five contracts.

**Repair:** Replace the dependency paragraph with: “The README consumes nine roadmaps on main: DGAInfinity, AlgebraicTopology, DerivedModuleAlgebra, AdicSpacesPartII, EtaleCohomologyFoundations, SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero, ReductiveGroups and DiamondsAndVStacks. Eight open suppliers merge first: RationalHomotopyModels, AnabelianGeometryAndNonabelianChabauty, ArithmeticLocallySymmetricSpaces, ComplexComparisonPartII, DeligneWeightsAndPurity, DerivedDeRhamCohomology, EtaleHomotopyTypes and MotivicEtaleKTheory. RationalHomotopyModels §§1.1–1.3, 2.1–2.4, 3.1–3.5 and 4.1–4.4 replace the five polynomial-form and Sullivan requests to AlgebraicTopologyPartII. Seven extension contracts remain: three from DeligneWeightsAndPurity and one each from EtaleHomotopyTypes, ComplexComparisonPartII, MotivicEtaleKTheory and AnabelianGeometryAndNonabelianChabauty. MixedHodgeModulesAndIrregularHodgeTheory is named for scope only. No consumer roadmap is named, and Lean imports none of these roadmaps.”

## Previous findings

- R01 — repaired: The description explicitly lists prerequisite roadmaps and says the Downstream consumers section names no roadmap. The subsequent supplier replacement leaves the separate discrepancy reported above.
- R02 — repaired: The description says `Suggested.lean` has no declarations, lists 21 headline theorems with missing carriers, and builds without warnings; the file and rerun agree.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Polynomial-form contract, line 67 | Δ⁰; Δ¹; simplicial circle | Δ⁰: H⁰=K on both sides. Δ¹: H¹=0 on both. Circle: ∫dt=1, generating H¹=K. | RationalHomotopyModels §§4.1–4.4 supply the contract. |
| Minimal-model contract, line 69 | K; Λ(x₂,y₃), dy=x²; Λ(u₁,v₂), du=v | Empty model: H⁰=K. Sphere model: H*=K[x]/(x²). Linear differential: Q(d)(u)=v≠0, excluded by minimality. | §§1.1–1.3, 3.1–3.2 supply full and 1-minimal models. |
| Rigidity contract, line 71 | Λ(a₁), a↦2a; non-minimal augmentation | H¹ map is 2, inverse 1/2. Λ(u₁,v₂), du=v → K has H*=K but nonzero source v; minimality excludes it. | §3.3 supplies rigidity. |
| Homotopy contract, line 73: endpoints and cohomology | M=Λ(e₁), A=K[s,ds], H(e)=d(st) | H(e)=t ds+s dt; endpoints 0,ds; ds=d(s), so induced H¹ maps both vanish. Constant paths have equal endpoints. | The stated Sullivan and commutative hypotheses match §§2.1–2.3. |
| Same: transitivity and composition | Paths 0→ds and ds→2ds | H(e)=(1+t)ds+s dt gives ds→2ds; 2d(st) gives 0→2ds. Pre/postcomposition preserves both endpoint identities. | A single polynomial homotopy suffices. |
| Same: homotopy classes and automorphism lifts | Λ(a₁)→Λ(a₁,u₁,v₂), du=v; sphere automorphism x↦2x | Both homotopy-class sets from Λ(e₁) equal K. Sphere lift y↦4y gives d(4y)=4x²=(2x)². | §§2.4, 3.4 give the required bijection and individual lifts. |
| Scalar-extension contract, line 75 | ℚ→ℚ(√2), M=Λ(a₁,b₁), d=0 | H¹ dimensions 2→2; H² dimensions 1→1. Generator differential remains 0. | §3.5 supplies both model variants. |
| §2.5, changed supplier | Point, stabilization n=0,1,2 | γ₀↦1, γ₁↦1, γ₂↦1/2; tγ₁=2γ₂ maps to 1 on both sides. | New polynomial-form supplier preserves normalization. |
| §4.2, changed model-lifting supplier | Λ(x₂,y₃), dy=x², x↦λx | d(λ²y)=λ²x²=β(dy), for λ≠0; assigning λy instead fails at λ=2: 2x²≠4x². | Individual lifts use the new supplier. |
| §4.4, changed proof route and seeded target | X=Spec ℂ; X=ℙ¹ | Point: H⁰=ℚ_ℓ on both sides. ℙ¹: both models have H*=ℚ_ℓ[x]/(x²), with Betti ranks (1,0,1). | Comparison, scalar extension and rigidity compose. |
| §§6.1–6.2, changed suppliers | M=Λ(a₁,b₁), constant filtration; L=ℚ(√2) | Degree dimensions (1,2,1); a↦a, b↦b+√2a has determinant 1 and preserves the extended block. | Filtration and scalar-extension inputs agree. |
| §6.4, changed supplier | Sphere model, σx=2x, σy=4y | y has eigenvalue 4=2·2; cohomology degree sum 2+2=4≥3. Unit: eigenvalue 1, empty degree sum 0. | Minimality input agrees. |
| §8.2, changed supplier | ℙ¹; 𝔾_m negative control | ℙ¹: φ(dy)=[x]²=0=dφ(y). For 𝔾_m the degree-diagonal projection kills nonzero H¹ of weight 2. | Proper smooth hypotheses retained. |
| §8.3, changed supplier and seeded target | dc=ab; 1-minimal model of ℙ¹ | [A,B]=−C gives dc(A,B)=1=−c([A,B]). For ℙ¹, H²(K)=0 injects into H²(ℙ¹)=K. | Sign and 1-minimal interface agree. |
| Description dependency paragraph (R01) | Contract and supplier counts at head | Description: 12 gaps, 8 main/9 open suppliers. README: 7 gaps, 9 main/8 open suppliers; RationalHomotopyModels replaces AlgebraicTopologyPartII. | Update paragraph. |

The rows for untouched statements stand as in the previous review, of `2e22a16`.

- Sources: 6 source-bearing changed passages compared with 4 texts; checked Morgan Definitions 5.1–5.3, Proposition 5.5, Theorems 5.6–5.7 and Proposition 5.9 (morgan lines 1017–1164), DGMS Theorem 2.1 and §§1.2–1.6 (dgms lines 331–367, 448), Sullivan Theorem 7.1 and examples (sullivan lines 1121–1200), and Weil II Construction 5.2.5 (weil-II lines 3844–3862).
- Dependent seeded targets: §4.4 checked at weil-II line 3844; §8.3 checked at morgan lines 1175 and 2245 and poids line 164. Additional changed dependency uses agree with weil-II lines 3867–3928 and 3947–3955.
- Supplier resolution: all 16 cited sections of RationalHomotopyModels §§1.1–1.3, 2.1–2.4, 3.1–3.5, 4.1–4.4 opened at #2298; all five contract addresses resolve. Seven remaining gap slugs match `packages/EllAdicHomotopyTypesAndWeights/design/plan.json`.
- Pinned declarations opened: 2, `TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:206` and `TauCeti/Algebra/Homology/DG/Algebra/Hom/Basic.lean:50`; DG grading, differential and maps impose no Sullivan ordering or decomposability. No newly statable headline or duplicate Sullivan carrier found.
- Gate rerun: every scanner reports 0; `depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Worker gate also reports `build=0`; outside-folder diff has 0 paths.
- Dependency check output: `depcheck: 239 roadmaps, 2168 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Targeted build: exit 0, `Build completed successfully (18239 jobs).` Direct `lake env lean` elaboration: exit 0, no output or warning. Zero declarations require signature or one-tactic probes; the docstring lists 21 unavailable headlines.

Overlap check: read RationalHomotopyModels, EtaleHomotopyTypes, MotivicEtaleKTheory, AnabelianGeometryAndNonabelianChabauty, DerivedModuleAlgebra and StableHomotopyKTheory. RationalHomotopyModels owns the five generic contracts; EtaleHomotopyTypes owns rigid types; MotivicEtaleKTheory owns the smooth mixed-Hodge realization; AnabelianGeometryAndNonabelianChabauty owns the geometric unipotent category; DerivedModuleAlgebra owns divided powers and derived completion. StableHomotopyKTheory shares no owned target. RationalHomotopyModels §5.3's finite-type homotopy Lie algebra and this roadmap's §8.3 pronilpotent stage tower use the same negative-transpose convention.

Source independence: changed passages only; 6 passages compared with 4 sources, no copied expression or reused source material found. Largest share: weil-II, 64 of 111 explicit source-line locators. No layer was added, removed or reordered; arrangement comparison was not reopened.

## Not verifiable

- `sga5` and `miller` remain settled as uncertified; neither is cited in the changed passages.

## Source issues

- none

## For the human reviewers

- none
