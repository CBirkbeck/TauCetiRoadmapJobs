# Port report: AdmissiblePairsAndPadicHodgeStructures

Branch: `roadmap/admissible-pairs-and-padic-hodge-structures`.
Head commit: dc906d7e368ff757ba5ecead08dc97d90de2da7f.

The checkout was clean at `cbb46c8`. The commit contains only
`TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md`,
`TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/Suggested.lean` and
`TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/metadata.toml`.
The package, other roadmaps, pins, merge order and generated roadmap list were not edited.

## Draft pull request body

Build the neutral Tannakian theory of admissible pairs and p-adic Hodge structures, including the two period lattices, connected linear groups, special loci and infinite-level period spaces. The roadmap reaches the two-lattice CM criterion, bi-analytic Ax–Lindemann and Hodge–Tate period-image density, then applies them to variations and Shimura uniformizations. The arbitrary-field full-rank de Rham criterion remains an explicit independent hypothesis of its consumers.

AI-assisted port and mathematical self-review by Codex (GPT-6). The accepted scope and nine explicit supplier obligations are retained.

## Validation

The command `lake build TauCetiRoadmap.AdmissiblePairsAndPadicHodgeStructures.Suggested` exited 0.

Exact module outcome:

```text
✔ [8976/8976] Built TauCetiRoadmap.AdmissiblePairsAndPadicHodgeStructures.Suggested (2.3s)
Build completed successfully (8976 jobs).
```

Warning count: **0**. No Lean process remains running.

Exact gate summary:

```text
gate AdmissiblePairsAndPadicHodgeStructures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency direction, from the required `gate --depcheck` command with `--movable`:

```text
depcheck: 49 roadmaps, 575 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The merge order was not edited.

The citation resolver found no cross-roadmap citation or Lean name found nowhere. Its catalogue identifies main as `c44faf6`, so all main-owned inputs and the main duplication sweep were also checked directly in the required `cbb46c8` checkout. Its notice that it did not inspect Lake packages was supplemented by direct inspection of the actual pins.

## Preservation, review notes and final reread

All **78 numbered targets**, **34 definition API blocks**, their **109 definition Checks**, additional theorem Checks, examples, hypotheses, locators and layer dependencies are retained. The opening Summary and all nine conditional supplier contracts remain. `metadata.toml` is the package's `topic = "math.NT"`, matching the one-key format on main.

The accepted review's four non-blocking notes were checked against the supplied package, rather than applied blindly:

- The §5.1 carrier already covers connected linear G/L over a p-adic field and includes reflex bases and base change, matching §5.3. The torus Check computes the base change from Spd L to Spd L′.
- §0.5 already requires C to be the completed algebraic closure of K0, fixes Gamma and the coefficient embedding, and includes twisted-invariant vanishing. No action on an arbitrary larger C was inferred.
- The four consumer pointers already name the roadmap's own consuming sections. All those headings and their mathematical uses were verified.
- The exact duplicated Needs entries reported by the review were already absent. The remaining blank lines splitting dependency lists were eliminated throughout; the sets of dependencies were preserved.

The final upstream-style reread made these further changes:

1. §3.1 now explicitly inverts the defining filtration cocharacter to obtain the lattice type. For a filtration jump a, the canonical lattice is Fil^-a; the added Q_p(1) computation has filtration jump −1 and lattice type +1. This removes the ambiguous phrase “good of its filtration type” and agrees with §§0.1–0.2 and HKI line 2030.
2. §12.3 now explicitly restricts the Igusa degree formula to **m≥1**, as HodgeTateAndCanonicalSubgroups §5.1 does. Direct unit counts are 1,2,4 for p=2 at levels 1,2,3; 2,6,18 for p=3; and the level-zero ring has one unit, outside the stated positive-level formula.
3. §6.4 calls its arbitrary-field criterion an independent hypothesis, replacing the time-dependent “open input”. Its conditional mathematical force is unchanged.
4. “How to read the build” states the pin limitation without “yet”.

No further mathematical correction was needed. In particular, the opposite-special conclusion, centrality in the ambient group, nonneutral subgroup pieces, both one-sided weight bounds, negative fractional lattices, inner-form level group, and arithmetic quotient corrections are preserved.

## Lean acceptance test and binder audit

`Suggested.lean` is byte-for-byte the accepted package file: one `import Mathlib`, the required namespace and the module docstring listing all missing headline carriers. It declares **zero definitions, instances, theorems or examples**. The four end theorems are §3.4 (CM), §11.5 (general Ax–Lindemann), §11.6 (minuscule Ax–Lindemann) and §11.7 (period-image density); all are listed in the docstring with the objects they lack.

The declaration inventory and the requested `#check @name` comparison therefore have an **empty domain**. No signature scratch declaration or binder repair is applicable. No headline statable using only a few simple native definitions was identified: the missing curve-with-bundles, diamonds, relative period-lattice categories and framed modification spaces require the library development specified in the README.

Nothing moved from Lean to README in this port. No admitted data, scalar substitute, API padding or computational example was added. No TauCeti import is needed.

## Pinned suppliers and ownership

The manifest and the installed package HEADs agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned input read | Evidence and boundary |
| --- | --- |
| `WittVector.Isocrystal`, `IsocrystalHom`, `IsocrystalEquiv` | `Mathlib/RingTheory/WittVector/Isocrystal.lean`, lines 113, 132, 138: Frobenius-semilinear module and compatible maps; finite dimension is extra. |
| `WittVector.StandardOneDimIsocrystal`, `frobenius_apply`, `isocrystal_classification` | Same file, lines 157, 172, 180: Frobenius p^m σ; classification assumes algebraically closed characteristic-p residue and rank one. |
| `BDeRhamPlus`, `BDeRham` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean`, lines 51, 75, 88: prime, p nonunit and p-adic completeness; absolute completion, no relative category or geometric DVR assertion. Characteristic-p input gives zero. |
| Baire inputs | `Mathlib/Topology/Baire/Lemmas.lean`, lines 141, 256, and `Mathlib/Topology/Baire/CompleteMetrizable.lean`, line 25: countable indices, Baire hypothesis, and nonempty space for the closed-cover conclusion. |
| `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`, line 138: reconstruction from a known commutative Hopf algebra, with its universe lift. |
| Finite subcomodules | `TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean`, lines 144, 292: commutative semiring and free coefficient coalgebra; over a field this supplies finite-dimensional exhaustion. |
| Exterior-line stabilizer | `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean`, line 101: field, commutative Hopf algebra, finitely generated Hopf ideal, subgroup character and equality over all commutative value algebras. |
| Frobenius quotient | `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean`, lines 15–26 and 57: topological orbit quotient; the sheafed curve is a distinct construction. |
| Classical Hodge theory | `TauCeti/Geometry/Hodge/`: complex Hodge structures, not the p-adic lattice categories. |

The supplier replacements already present in the package are retained: native finite-subcomodule exhaustion and the exterior-line theorem replace a new Chevalley/exhaustion development; the known-Hopf tensor-automorphism theorem is consumed directly; Mathlib supplies the rank-one isocrystal and Baire results. There is no additional replacement or mathematical deletion in this port.

Every named supplier contract and section was compared with its actual main or exposed head copy. The following table records the division of mathematical ownership.

| Owner | Sections consumed and boundary verified |
| --- | --- |
| RelativeFarguesFontaine | §§4.10–4.12, 6.6–6.9, 7.2, 7.4, 7.6: intrinsic Cartier completions, meromorphic patching and tensor gluing; reductive positive-torsor local triviality does not supply localized B_D module descent. |
| ReductiveGroups | Layers 1–3, 5, 6A, 7: representation/torsor dictionary, Lie theory, quotients, radical and characteristic-zero Levi/vector-layer series. The two stated extension obligations are not silently asserted as existing results. |
| HodgeTateAndCanonicalSubgroups | §§2.14, 5.1: exact tensor filtration splitting/type and flag schemes, ordinary dual-canonical Igusa tower with positive levels and all small primes. |
| AlgebraicModularFormsAndSerreWeights | R15.3, The Igusa interpretation: full finite-level unit monodromy, retaining auxiliary rigidifying level and p=2,3. |
| AdicSpacesPartII | R1.3, analytification-functor: finite-type schemes over a complete nontrivially valued rank-one field; native field/base hypotheses retained. |
| PadicPeriodRings | §§2, 4.1, 4.3: general perfect-residue Tate–Sen H⁰, cyclotomic graded twists and fixed coefficient inclusion. |
| VStackSheavesAndLisseCategories | VS4.0: reductive bundle, Newton and full automorphism constructions. |
| BunGAndNewtonStrata | BG0–BG3 named targets: reductive G-isocrystals/torsors, integral Kottwitz invariant, centralizer, bundle stack and basic/full automorphism interfaces. |
| VectorBundlesAndIsocrystals | VB0–VB2 and VB4 named targets: classification, slope reversal, Hom/Ext and pro-étale constant-slope splitting. Relative classification is not inferred from pointwise classification. |
| ReductiveGroupsPartII | RG2.0 point topologies/congruence/smooth openness; RG2.1 Steinberg with its field hypotheses. |
| MotivesAndAlgebraicCycles | §§6.1–6.3, 6.8: neutral reconstruction, subobject criteria and tensor-Isom torsors with commuting actions; a rational section is extra data. |
| DiamondsAndVStacks | D1–D6 named targets, especially D3.6/D3.9/D3.10, D5.10 and D6 seminormal full faithfulness: perfectoid pullback precedes torsor-level descent; profinite projection retains its chart universe; full faithfulness has L/Q_p. |
| HeckeStacksAndLocalShtukas | HS2.12, HS2.15: reductive arbitrary-type existence, classical points and connectedness; integral Kottwitz equality is retained. |
| AInfCohomology | AI.2.2–AI.2.3: valid BKF operations, crystalline-rigidified variant and finite-free classification; the rational rigidified modification equivalence is an explicit extension obligation. |
| PadicHodgeTheory | §§5.5, 7.1, 7.4, 2.2–2.3: perfect-residue functors, associated lattices, uniqueness and coefficient-site comparisons; neither strict-field openness nor the arbitrary-field full-rank criterion is inferred from these. |
| AdicSpacesPartV | RZ.0–RZ.6 named targets in `packages/AdicSpacesPartV/design/README.md`: exact dimension, rank, classical/Shilov, resolution and manifold hypotheses. This earlier accepted design is absent from the roadmap-show catalogue; its supplied package, not a guessed later source, was read. |
| PerfectoidSpaces | P4.15.6, P6.11: surjective universal perfectoid quotient, integral plus ring and transitive strong closedness. |
| GeometricSatakeAndFusion | GS0 loop geometry and Schubert smoothness/action targets: reductive Grassmannian, bounds and truncated smooth loops. Non-reductive extensions remain here. |
| DiamondSixOperations | S2.4, S3.2, S4.2–S4.3: shriek base change/projection, duality and smooth twists, retaining separatedness/compactifiability/local target dimension and ℓ≠p. |
| EndoscopicTransferAndUnitaryTraceComparison | §§12.5, 12.11: basic EL period comparison, duality and inverse-transpose convention transport. |
| IgusaVarietiesAndTorsionConcentration | IG.1: Igusa moduli and actions; the crystalline-frame comparison remains explicitly conditional. |
| PerfectoidShimuraVarieties | §§2.2, 3.1, 3.5: open Hodge-type tower over C and its right-action period dictionary, with small tame level; basic arithmetic uniformization is a separate hypothesis. |
| HilbertModularVarietiesAndShimuraCurves | R18.5.7, R18.5.15, R18.5.20, R18.5.21: actual arithmetic stabilizers, Čerednik–Drinfeld quotient, module-level and all-level comparison, with central-twisted descent. |
| AdicSpaces | Layer 6: the fixed sheafed Fargues–Fontaine curve, not only its pinned topological quotient. |
| AlgebraicVectorBundles | L0A–L0C, L2A–L2B: ordinary bundles, tensor operations and comparison; period descent remains with its period owner. |

Ownership was searched by object with `roadmaps list`, several `roadmaps grep` queries and `roadmaps show`, over all 354 indexed open heads and their main catalogue; additionally the actual main checkout, board packages and all 48 supplied sibling folders were searched directly. The supplied sibling sweep had no competing neutral-pair, bilattice, crystalline-frame or bi-analytic construction. Other Ax–Lindemann matches are complex or abelian; trace-filtration matches in SchurWeyl and the Habiro roadmaps concern different objects. References to Howe–Klevdal in curve, bundle and shtuka suppliers supply their own foundational constructions, not this roadmap's two-lattice categories or bi-analytic theorem.

The current roadmap therefore owns goodness, neutral period-latticed categories and their connected groups, connected-linear-group extensions, line loci and bi-analytic results. Generic reconstruction, reductive moduli, ordinary towers, period completions and rigid geometry retain the owners listed in Scope and ownership. No target already owned elsewhere was added, and no additional duplication removal was needed. There are zero declarations here whose qualified names could collide with another roadmap. Ownership against open work was checked through the supplied indexed heads; no undisclosed head was sought.

## Suppliers that are still pull requests

RelativeFarguesFontaine; HodgeTateAndCanonicalSubgroups; AlgebraicModularFormsAndSerreWeights; PadicPeriodRings; VStackSheavesAndLisseCategories; BunGAndNewtonStrata; VectorBundlesAndIsocrystals; ReductiveGroupsPartII; MotivesAndAlgebraicCycles; DiamondsAndVStacks; HeckeStacksAndLocalShtukas; AInfCohomology; PadicHodgeTheory; GeometricSatakeAndFusion; DiamondSixOperations; EndoscopicTransferAndUnitaryTraceComparison; IgusaVarietiesAndTorsionConcentration; PerfectoidShimuraVarieties; HilbertModularVarietiesAndShimuraCurves.

AdicSpacesPartV is an earlier accepted design/package supplier in the given order, not an indexed open roadmap. The five other supplier roadmaps are on main. No supplier was moved from later in the merge order.

## Sources and limits

All five cached PDFs match the SHA256 values of `packages/AdmissiblePairsAndPadicHodgeStructures/sources.toml`. I read all 168 distinct explicit source-line locators: HKI 42, HKII 119, Scholze 1, LiuZhu 3, BhattHansen 3. The two arXiv v2 records were also opened; the version date is 28 February 2025 (HKI line 5; HKII line 5). Numbered citations retain those versions, not differently numbered published versions. In particular, the full source passages were opened for the fixed-lattice argument (HKI line 1043, HKI line 1065, HKI line 1083), special notions and duality (HKII line 2338, HKII line 2353, HKII line 2412), and the closure/orbit proof (HKII line 2481, HKII line 2574).

The pre-commit gate runs reported only the new files as dirty; the final gate was run on the clean committed tree.

No fetched instruction requesting an action outside the brief was encountered. The source corrections preserved from the package include the stronger twisted-invariant hypothesis, the weight/bundle slope sign, the neutral subgroup piece, the corrected nonbasic upper-Borel datum and the diagonal arithmetic quotient. No source passage was copied into the roadmap.

The following nine accepted obligations remain unresolved as proofs, exactly as conditional contracts; this port does not claim to discharge them:

- `adjoint-kernel-and-orbit-differential` — ReductiveGroups.
- `observable-subgroup-embedding` — ReductiveGroups.
- `tannakian-canonical-reduction` — MotivesAndAlgebraicCycles.
- `strict-field-serre-openness` — PadicHodgeTheory.
- `arbitrary-field-full-rank-de-rham` — PadicHodgeTheory.
- `localized-period-module-descent` — RelativeFarguesFontaine.
- `rational-rigidified-bkf-modifications` — AInfCohomology.
- `ordinary-katz-igusa-monodromy` — IgusaVarietiesAndTorsionConcentration.
- `basic-hodge-type-uniformization` — PerfectoidShimuraVarieties.

LiuZhu line 86 restricts its base to a finite extension of Q_p. Resolution does not remove that restriction. The independent arbitrary-field criterion and every dependent statement keep their conditional force. The secondary theorems behind Serre openness and general Hodge-type uniformization were not independently proved or bibliographically expanded; they enter through those explicit contracts. There is no unresolved build, gate or dependency-order defect.

## Adversarial mathematics pass

This is a fresh computation ledger, not a claim that an admitted build proves truth. Each numbered target has a row; each defining API law has its own row in the second table. “Consistent” means the displayed instances agree with the stated hypotheses and conclusion. Conditional targets retain the nine independent inputs above. Purely categorical maps are tested by explicit fibres, groups, ranks or matrices rather than invented numerical invariants.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: prime and coefficient domain | p=2,3; p=1; R=F₂[[t]], a field, zero ring | 2,3 are prime; 1 is not. In F₂[[t]], t has valuation 1 and is not a unit; in a field every nonzero t is a unit; zero ring has 0=1 | Vector bilattices admit the first DVR; group characteristic-zero and nonfield assumptions exclude the other inputs | None |
| Conventions: strict field and algebraic closure | Q_p-breve; Q_p; transcendental c over C0 | Residues are F_p-bar and F_p; c lies outside C0bar even if c lies in C | Strictness and the uncompleted algebraic-closure notation distinguish these cases | None |
| Conventions: Tate signs | n=−1,0,1 | Isocrystal slopes 1,0,−1; bundle slopes −1,0,1; étale exponents −1,0,1; de Rham exponents 1,0,−1; weights 2,0,−2; modified slopes 0,0,0 | All six normalizations agree | None |
| Conventions: ramification and generator | a=1, t=u²; t′=v t, v a unit | Valuation becomes 2 under ramification; exponent stays 1 under unit rescaling; gr¹ coordinate scales by v-bar | Ramified and unit changes distinguished | None |
| Conventions: one-sided weights | GL₂ (1,0); mirabolic type and inverse | Ad weights {−1,0,1}; {0,1,−2} and {0,−1,2}; upper/lower answers are (yes,yes), (yes,no), (no,yes) | Opposite-special, not simultaneous specialness, is the general closure conclusion | None |
| Conventions: bases and size | Y=empty; Y=two points; index set beyond the chart universe | Empty base has 0 geometric evaluations; two-point base has 2 but a morphism is still 1 fixed map; a set of cardinality >κ is outside the κ-chart domain | Nonemptiness, fixed data and size restrictions are substantive | None |
| Conventions: closure | A=empty; empty container family; A={1} in Q_p× | Intersections give empty, M_C and {1}, respectively | Empty subset and empty indexing family are different operations | None |
| 0.1 Bilattice definition, strict exactness | Rank 0; rank 1 a=−1,0,1; multiplication by t | Types empty and (−1),(0),(1); jumps 1,0,−1. Image tR differs from R; lattice cokernel R/tR≠0 although K-cokernel=0 | Definition and strictness distinguish the models | None |
| 0.2 Goodness and exact filtrations | Split torus; G_a off-diagonal t^-1; quaternion PGL₂ torsor | Torus type a; G_a has only cocharacter 0 but vector type (1,−1), quotient Fil⁰ image 0≠k; Brauer invariant 1/2 becomes 0 over algebraic closure | Goodness is group-valued; residue trivialization cannot be omitted | None |
| 0.3 Specialization dominance | G_a extension; split diagonal (1,−1) | Levi (0,0) has first partial sum 0<1 and total 0=0; diagonal Levi and actual type both (1,−1) | Equality test has correct direction and both outcomes | None |
| 0.4 Exactness iff goodness, both BB functors | GL₂ standard type (1,0); G_a extension; swap lattices | Good types give BB types (−1,0) and (1,0); G_a gives quotient image 0 versus k; swapping exchanges those failures | Both equivalences and type signs consistent | None |
| 0.5 BB recovery and fixed lattices | GL₂ types (1,0),(2,0); gamma(u)=2u, gamma(t)=2t | First BB fibre is a point; second has parameter C. gamma(u/t)=u/t, but the canonical flag lattice contains t^-1 e1 and this lattice does not; C(chi^-1) has nonzero invariant u | Weight bound and twisted-invariant hypothesis exclude different wrong models | Retain stronger accepted hypothesis |
| 1.1 G-isocrystals and G-basicness | G_m b=p; upper Borel b=diag(p,1); b=1 | Torus slope 1 is central; Borel root slope 1≠0; identity root slopes 0 | Basicness differs from Levi basicness | None |
| 1.2 Levi invariance | Upper Borel; unipotent G_a | B(Borel) maps bijectively to B(T), but diag(p,1) has root slope 1; B(G_a) is singleton with slope 0 | Class bijection does not identify basic subsets | None |
| 1.3 Sigma-centralizer | GL₂ diag(p,1); simple slope 1/2; b=1 | Off-diagonal equations force 0, giving dimension 2 torus; simple slope 1/2 gives D× of dimension 4; b=1 gives G(Q_p) | Inner form needs basicness | None |
| 1.4 Bun for connected linear groups | G=1; reductive GL₁; Borel negative extension | Bun_1 has 1 object up to unique isomorphism; GL₁ imports line bundles; Ext¹(O(1),O)=H¹(O(−1))≠0 | General nonbasic bundles cannot be replaced by B(M) | None |
| 1.5 Basic stratum and full automorphisms | G_a,b=1; GL₂,b=diag(p,1) | H⁰(O)=Q_p, pro-étale-locally H¹(O)=0; nonbasic Ad bundle has slopes −1,0,1 and a positive-slope automorphism part | Basic constant-group statement has a negative control | None |
| 1.6 Inner twisting | b=[[1,1],[0,1]], x=diag(2,1); torus p^n | b x b^-1=[[2,−1],[0,1]]; b^-1 sigma_b(x)=x b^-1=[[2,−2],[0,1]]; torus slopes a become a−n | Noncommutative order and slope translation agree | None |
| 2.1 Pure and graded Hodge structures | Tate n=1; zero; O(1)⊕O(−1) | Weight −2 gives bundle slope 1; zero rank 0; mixed bundle has average 0 but slopes 1 and −1 | Purity is stronger than the degree condition | None |
| 2.2 Admissible pair and two lattices | Unit; Tate n=1; degree-zero mixed bundle | Unit V_et=Q_p and L_et=L_dR=B⁺; Tate exponents 1 and −1, modified slope 1−1=0; mixed slopes remain ±1 | Correct lattice orientation and admissibility | None |
| 2.3 Neutral Tannakian structure and connectedness | Unit sums; Tate generator; finite sign representation | Groups 1 and G_m have component group 1; abstract Rep(C₂) has component group of order 2 and is neutral | Neutrality alone cannot prove connectedness | None |
| 2.4 Basic-pair/Hodge equivalence | Unit plus Tate n=1; slope-mixing lattice | Weights are 0,−2 from isocrystal slopes 0,−1; mixing slopes gives no direct sum of lattice intersections | Graded inverse and basicness requirement agree | None |
| 2.5 MG/MT and canonical reduction | Unit, Tate, nonzero unit extension | Groups 1, G_m, G_a; unipotent u=1 fixes e1 but sends e2 to e2+e1 | Character lines and unipotent reductions both necessary | None; canonical reduction conditional |
| 2.6 Invariants and existence | G_m type a=1; wrong b=1; Borel inverse invariant (1,0) | Correct b=p^-1 has kappa −1 and weight −2; b=1 has kappa 0≠−1; Borel root Newton slope 1 is noncentral | Inverse type and G-basic qualification hold | None |
| 2.7 Rigidified BKF equivalence | Unit; two distinct slopes | Unit modification (O,O,id) with its trivial splitting; O⊕O(1) has prescribed slope pieces of ranks 1,1; dropping beta forgets the chosen splitting | Rational rigidification data retained | None; equivalence conditional |
| 3.1 Canonical good-reduction lattices | Filtration jump a=−1,0,1; nonzero unit extension | Canonical exponents 1,0,−1; nonzero t^-1 in B/B⁺ is outside good G_a type 0 | Analytic lattice is stronger than its flag | Explicit inverse filtration/lattice type |
| 3.2 Crystalline realization | Unit; Q_p(1) over strict K | D_cris ranks 1,1; Frobenius 1,p^-1; filtered jumps 0,−1; recovered lattice exponents 0,1 | Both realizations recover the specified objects | None |
| 3.3 Open Galois image | Q_p(n), n=0,1,2; p=2,3 | n=0 has image 1 and MG=1; n≠0 has image (Z_p×)^n of finite index in Z_p×, open in Q_p× | Open in MG, not surjectivity onto it | None; strict-field criterion conditional |
| 3.4 Two-lattice CM iff and nonbasic refinement | Unit; Tate; G_a extension | MG=1 and G_m are tori with canonical lattices; nonzero extension has parameter t^-1≠0 and MG=G_a, although its cocharacter is 0; unit graded pieces each have MG=1 | Both directions and nonsplitting distinction consistent | None |
| 4.1 Rigid analytic subdiamonds | Disc; transcendental C-point; characteristic-2 Frobenius; cusp | Finite field degree point is classical; transcendental degree>0 is not. A rigid square root would have 2 ord(f)=1. Cusp lacks u although seminormalization contains u | L/Q_p and seminormality have explicit controls | None |
| 4.2 Local systems and coefficient topology | Rank 0 and n; sign character; O(1) | Frame groups 1 and GL_n(Λ); monodromy {1,−1}≠{1}; cyclotomic weight 1 persists under finite extension | Fibres do not identify local systems or analytic vector bundles | None; localized descent conditional |
| 4.3 Integrality locus | Coordinates 0,1,t^-1; two successive ideals I,J | Integral answers yes,yes,no; inverse image of J in R cuts out the same closed quotient as R→R/I→(R/I)/J | Denominator bound and quotient transitivity consistent | None |
| 4.4 Relative trace/type | Rank-one a=±1; disc z=0 and z≠0 | Opposite jumps −a,a; at z=0 type (0,0), elsewhere (1,−1); gr¹ line twists by chi | Nonconstant type and graded Tate twist retained | None |
| 4.5 Relative goodness iff trace exactness | Constant diagonal family; jumping G_a disc | Diagonal (1,0) gives filtered ranks (1,2); G_a nonzero fibre gives quotient image 0≠k, while zero fibre is good | Fibrewise tensor compatibility is not exactness | None |
| 4.6 Trivial-filtration functor | Unit; flat line filtration jump a=−1,0,1 | M0=B⁺; M=Fil^-a gives exponents 1,0,−1; using M as M0 would give exponent 0 in every case | Both lattices are needed | None |
| 4.7 Lattice/filtered-flat equivalence | Trivial line; forbidden torus filtration | Unit recovers rank-one F⁰=E. For ∇e1=e2 dlog T and Fil¹=Fil²=Ee1, ∇Fil² is not in Fil¹⊗Ω¹ | Smoothness and Griffiths condition have controls | None |
| 5.1 Grassmannian and BB | G_m/L; G_a; field extension L′ | Cell a has one point over Spd L and becomes Spd L′; G_a includes t^-1≠0 but good cell={0} | General L carrier and non-exhaustion consistent | Accepted generality retained |
| 5.2 Subgroup immersions | H=U in SL₂; character chi(h)=h | SL₂/U=A²−{0} is quasi-affine, not affine; (2,1/2) fixes v while (2,2) gives 4v | Quasi-affine versus affine and inverse character distinguished | None |
| 5.3 Grassmannian geometry | G_m; GL₂ types (1,0),(2,0) | Dimensions 0,1,2; first two cells closed; (1,1)<(2,0) has equal total 2 and belongs to the latter's boundary | Local closedness does not imply global closedness | None |
| 5.4 Faithful cutout | G_a type 0 and t^-1 extension | Levi type (0,0); actual dominant type (1,−1) exceeds bound (0,0); intersection retains only parameter 0 | Both Levi condition and upper bound matter | None |
| 5.5 Rigid-source good factorization | G_a rigid source; nodal/cuspidal singular source | Classical G_a value is 0, forcing good cell {0}; cusp normalization parameters (u²,u³) recover the unique descended flag on seminormal source | Geometric t^-1 point is not a rigid point | None |
| 5.6 BB iff weight bound | GL₂ (1,0),(2,0); one-sided mirabolic | Ad weights {−1,0,1}, {−2,0,2}, {0,1,−2}; BB fibres point, nontrivial C, point; inverse mirabolic has weight 2 | Exact one-sided bound, including converse | None |
| 6.1 Neutral admissible family | Point; two-point base; isocrystal monodromy | Point gives original W; two-point morphism is (f,f), not arbitrary (f1,f2); nonidentity monodromy is not fixed W | Constant isocrystal is part of the object | None |
| 6.2 Family Tannakian theorem | Disconnected two-point base; rank-zero map | f=0 at one fibre forces fixed isocrystal map f=0 at both; zero kernel/cokernel rank stays 0 | Faithfulness on one fibre has its required global reason | None |
| 6.3 Canonical G-family reduction | Constant Tate; norm-one unramified quadratic torus in SL₂ | H=G_m for Tate; H¹(Q_p,T)=Q_p×/N(E×)=Z/2 while H¹(Q_p,SL₂)=1 | Disconnected components can have 2 different neutral forms | None; canonical reduction conditional |
| 6.4 Good type on rigid bases | Constant G_m exponent a; Spa L′ with degree 2 constants | Type is a at every point; constant field degree is 2 rather than 1; G_a disc types 0 and (1,−1) do not satisfy the neutral rigid conclusion automatically | Criterion used independently; no circular type assumption | Timeless wording |
| 6.5 b-admissible locus | G_m b=p^s and lattice t^a | Modified degree −s−a; s=−a gives 0, s=0,a=1 gives −1 | Representing open locus excludes wrong invariant | None |
| 6.6 Nonemptiness and rigid points | G_m a=1, s=−1 or 0 | Kottwitz equalities −1=−1 and 0≠−1 yield point and empty locus | Both directions of iff tested | None |
| 6.7 Connected products | X=Y=Spd C; X=two points outside hypothesis | H⁰ product F_ell⊗F_ell=F_ell, one component; (C⊔C)×C has 2 components | Nonempty connected and smooth hypotheses retained | None |
| 6.8 Geometric connectedness | Torus compatible/incompatible; U=G_a truncation | Compatible locus is one point, incompatible is empty; m-step additive truncation has m vector coordinates and one component | Connectedness asserted after nonemptiness | None |
| 7.1 Neutral Hodge families | Unit; Tate; order-two local system; nontrivial frame torsor | Weights 0,−2n; monodromies 1 and −1; nontrivial frame torsor has no global section | Fixed V and fixed isocrystal frame are distinct requirements | None |
| 7.2 Tannakian Hodge families | Unit sums and Tate generator | Fibre groups 1,G_m; finite component quotients both 1; rank-zero kernels remain zero | Connectedness uses fixed maps and pointwise result | None |
| 7.3 Hodge domain | G_m type 1; Borel inverse invariant (1,0) | L_dR exponent −1, isocrystal slope −1, weight −2; Borel root slope 1≠0 gives no central basic class | Weight 2nu and G-basic hypothesis retained | None |
| 7.4 HT line locus | n=−1,0,1; lattice exponent a=n or n+1 | Inclusion Fil^n⊂Fil^a is true for equality and false for a=n+1; n=−1,a=0 gives false while replacing by B⁺ gives true | Fractional powers and inequality direction correct | None |
| 7.5 Rigid closed HT locus | Fixed line e1 versus flag [a:c] | Incidence equation c=0; [1:0] passes and [1:1] fails | Closed flag condition is nonvacuous | None |
| 7.6 Special Hodge subvariety | Torus; weights {0,−1,2} or {0,1,−2} | Torus dimension 0; lower-bound answers yes,no; inversion gives upper-bound answers yes,no | Uses inverse BB and even rank-one weight 2n | None |
| 8.1 Hodge isocrystal-line locus | Tate n=−1,0,1 | Frobenius p,1,p^-1; intended exponents −1,0,1; wrong exponent-zero lattice fails when n=−1 | Isocrystal rational structure and Tate direction correct | None |
| 8.2 Functoriality | f=id,g=1; g=diag(u,1), sigma(u)≠u | L maps to L; b_G=diag(up/sigma(u),1), not diag(p,1) | Sigma-conjugation cannot be ordinary conjugation | None |
| 8.3 Closed subgroup locus and neutral piece | Norm-one quadratic torus T⊂SL₂; Borel example | H¹ kernel Z/2; neutral class 0 is one piece, nonneutral class 1 another; [1:1] is ambient-admissible but fails subgroup test | Full Hodge locus need not equal the chosen H-locus | None |
| 8.4 Special admissible subspaces | Torus compatible; incompatible b; weight 2 | Images point, empty, and excluded from rigid special definition | Nonempty, connected and upper-bound qualifications tested | None |
| 8.5 Torus/Lubin–Tate points | Quadratic F⊂D, ramified/unramified including p=2 | D is right F-space of dimension 2; D×/F×=P_F(D), Q_p-dimension 4−2=2 | Local field condition, not global CM condition | None |
| 8.6 Borel and parabolic boundary | Two opposite diagonals; GL₃ z=0,1 | For diag(p,1), [1:1] passes ambient but not H; for diag(1,p), x ranges A¹; GL₃ ambient type (1,0,−1), Levi types (0,0;0) and (1,−1;0) | Opposite data and jumping subgroup type distinguished | None |
| 9.1 Infinite-level modifications | Trivial group; G_m; two étale frames | Fibres point and Q_p×; quotient by Z_p× has valuations Z; frames 1 and p remain distinct before quotient | Isomorphism off divisor and both frames retained | None |
| 9.2 Two period maps and level torsors | G_m b=1,mu=0; GL₂ minuscule; nonbasic Borel | Torus target Spd L; level Z×Spd L pulls to Z×Spd C; GL₂ flag types oppose; nonbasic HT frame torsor is not asserted | Perfectoid pullback and descent repair retained | None |
| 9.3 Infinite-level functoriality | Identity; composite g2 f2(g1) | Identity preserves both frames; composite sends b_H to g2 f2(b_G) sigma(g2)^-1=b_G′ | Both period squares and sigma frame product agree | None |
| 9.4 Three special notions | Cubic mirabolic (1,1,−2), inverse, GL₄ (1,1,0,0) | Weight sets {0,1,−2}, {0,−1,2}, {−1,0,1}; answers H-only, HT-only, both | Three definitions are independent of closure theorem | None |
| 9.5 Special iff both | Same three weight sets | Intersection of upper/lower truth values is false,false,true; minuscule subgroup weights are subsets of {−1,0,1} | Both implications and minuscule agreement consistent | None |
| 9.6 Basic duality | Torus p^n; noncommuting b,x from 1.6 | n maps to −n; double inversion restores n; sigma_b(x)=[[2,−1],[0,1]], giving identical inverse-frame products [[2,−2],[0,1]] | Inverse, not transpose, with twisted Frobenius | None |
| 9.7 Hodge-domain connectedness | G_m type 1; GL₂ basic minuscule | Inner-form inverse locus has 1 component; torus quotient base point has 1 component | Duality used after admissible connectedness | None |
| 10.1 Generic/exceptional locus | Constant family; two distinct conjugate full quadratic tori in GL₂ | Constant family exceptional set empty; Lie spans I,A,B,[A,B] have dimension 4, although each torus has dimension 2 | Full joint group does not force a point of full group | None |
| 10.2 Countable closedness | Trivial group; G_m regular representation; compact versus discrete parameter | Exceptional set empty; monomial spaces dim 2i+1 exhaust all exponents; finite union Z1∪Z2 closed; p^n tends to missing 0 for discrete N | Countability is of compact bounds, not of Q_p | None |
| 10.3 Dense generic classical points | Gauss point; finite residue F_q; smooth point disc | Gauss norm of T^q−T is 1; integral L-points have norm ≤abs(pi)<1 in finite residue; infinite residue supplies a nonzero reduction outside any fixed polynomial zero set | Infinite residue in the Baire route is necessary | None |
| 11.1 Two analytic closures | Torus A={1},{1,p},1+p^m Z_p; empty | Intersections are {1},{1,p},1+p^m Z_p and empty; empty index gives all M_C | Both inclusion laws and empty cases consistent | None |
| 11.2 Analytic closedness of special loci | Torus component; mirabolic/inverse | Torus component point is closed both ways; upper-only and lower-only weight sets select their respective structures | No unsupported second closedness assertion | None |
| 11.3 Connected-component intersection | M=M1⊔M2, lifted Z⊂M1 | Nonempty cofinal component family intersects to M1; empty family gives M1∪M2 | Index nonemptiness cannot be dropped | None |
| 11.4 Generic orbit/submersion | GL₂/P=P¹; deficient constant map | Orbit derivative at identity sends E21 to coordinate derivative 1, target dimension 1; constant map rank 0 cannot contain an open GL₂(Q_p)-orbit | Translate and constant-rank stratum needed | None; stated input conditional |
| 11.5 General Ax–Lindemann | Mirabolic inverse; dual; empty container family | {0,−1,2} passes lower but fails upper; negation reverses these; empty intersection=M_C including all components | Opposite-special conclusion and both directions tested | None |
| 11.6 Minuscule theorem and algebraic input | GL₄ (1,1,0,0); [1:c], c outside reflex E | All adjoint weights in {−1,0,1}; X1−cX0=0 at [1:c] but c∉E prevents an E-model of that embedded point | Algebraic base L([mu]) and nonreductive subgroups retained | None |
| 11.7 HT period-image density | Actual torus group; GL₂ full group | Torus target dimension 0, nonempty image is whole point; GL₂ orbit differential rank 1 equals flag dimension 1 | Actual generic group prevents a vacuous larger flag claim | None; no basicness added |
| 11.8 Nonbasic Serre–Tate datum | Upper Borel b=diag(1,p), mu=(0,−1), x=0,1 | Root weight 1; Newton root slope −1; Hodge flags [0:1],[1:1], HT flags both point; x=0 is proper torus locus | Positive-dimensional ordinary direction has corrected diagonal order | None |
| 12.1 Variations | Unit; quadratic finite character; cubic at p=7 | Weights 0,0,0; monodromy sizes 1,2,3. f(2)=7 and f′(2)=5 for f=X²+X+1, giving nontrivial order 3 root in Q₇ | Finite character is not always a sign | None |
| 12.2 Crystalline frames | Constant basic; integral/rational rank-one frames; nonbasic | Frames G_b(Q_p); Q_p×/Z_p×=Z valuation components; nonbasic full automorphism has extra positive-slope part | Basic frame torsor and level map correctly scoped | None; Igusa identification conditional |
| 12.3 Katz–Igusa obstruction | p=2,3, m=0,1,2,3 | Actual unit counts p=2: 1,1,2,4; p=3: 1,2,6,18. At positive m these equal p^(m−1)(p−1); −1 mod 2=1, mod 4=3 | Infinite profinite fibre persists in each rational valuation component | Add m≥1 explicitly |
| 12.4 Basic Hodge-type transport | Gamma=1; free Gamma=Z | First quotient M/K; second identifies x and gamma x in Gamma-backslash(M/K), unlike the product's infinitely many labels | Conditional quotient hypothesis is concrete | None |
| 12.5 Quaternion products | Ram(D)={p,ell}; wrong extra q,r; n=0,1,2 | Invariants at (p,infinity,ell) change (1/2,0,1/2) to (0,1/2,1/2); extra q,r give nonzero mismatches. Product dimensions 0,1,2 | Actual inner form and arithmetic stabilizers retained | None |


### Defining API laws

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 API 1: A pair of finite free spanning R-submodules of V determines a bilattice. | R=k[[t]], a=1; rank 0; e=2 | (V,L1,L2)=(K,R,tR) has lattice ranks 1,1 and K-span K; zero triple has ranks 0,0 | Consistent on the displayed instances | None |
| 0.1 API 2: Short exactness is tested on both lattice sequences; tensoring with any bilattice and dualizing preserve these short exact sequences because all lattices are finite free. | R=k[[t]], a=1; rank 0; e=2 | Split R→R²→R gives ranks 1,2,1; tensor rank d gives d,2d,d; dual has the same ranks and zero homology | Consistent on the displayed instances | None |
| 0.1 API 3: trFil^i is the indicated image subspace of L1/tL1 and decreases with i. | R=k[[t]], a=1; rank 0; e=2 | At i=−1,0,1 the trace dimensions are 1,0,0, so the sequence decreases | Consistent on the displayed instances | None |
| 0.1 API 4: A bilattice isomorphism preserves elementary-divisor type. A complete-DVR extension of ramification index e multiplies every elementary divisor by e; in particular an index-one extension preserves type. | R=k[[t]], a=1; rank 0; e=2 | Type 1 is unchanged by a unit basis change; t=u² gives type 2=2·1 | Consistent on the displayed instances | None |
| 0.1 API 5: Exchanging L1 and L2 negates the elementary-divisor multiset. | R=k[[t]], a=1; rank 0; e=2 | Swapping R,tR gives type −1, the negative of 1 | Consistent on the displayed instances | None |
| 0.2 API 1: Goodness and [mu] are independent of a trivialization and of a splitting field. | G_m type 1; G_a t^-1; G_m→GL₂, z↦diag(z,1) | Multiplication by a unit leaves type 1; scalar extension keeps exponent 1 | Consistent on the displayed instances | None |
| 0.2 API 2: A homomorphism G→H sends a good object of type [mu] to a good object of induced type. | G_m type 1; G_a t^-1; G_m→GL₂, z↦diag(z,1) | Induced GL₂ elementary divisors (1,0) equal the cocharacter image | Consistent on the displayed instances | None |
| 0.2 API 3: For type [mu], BB1 has type [mu^-1] and BB2 has type [mu]. | G_m type 1; G_a t^-1; G_m→GL₂, z↦diag(z,1) | First/second trace jumps −1 and 1 are opposite | Consistent on the displayed instances | None |
| 0.2 API 4: The G-structure is retained as tensor data; an arbitrary faithful vector representation alone is not a definition of goodness. | G_m type 1; G_a t^-1; G_m→GL₂, z↦diag(z,1) | G_a cocharacter list {0} cannot produce actual GL₂ type (1,−1), despite a faithful embedding | Consistent on the displayed instances | None |
| 1.1 API 1: b defines the functor with Frobenius rho(b) sigma in every representation rho. | Tate n=1; Borel diag(p,1); identity | On the Tate line rho(b) sigma=p^-1 sigma and the Newton slope is −1 | Consistent on the displayed instances | None |
| 1.1 API 2: b and b′ define isomorphic functors iff b′=g b sigma(g)^-1. | Tate n=1; Borel diag(p,1); identity | For g=diag(u,1), b′=diag(up/sigma(u),1); dropping sigma changes the value when sigma(u)≠u | Consistent on the displayed instances | None |
| 1.1 API 3: b is basic iff the isocrystal Ad(b) is isoclinic of slope zero, using ker(Ad)=Z(G) (gap:adjoint-kernel-and-orbit-differential). | Tate n=1; Borel diag(p,1); identity | Borel root Ad eigenvalue p has slope 1≠0; b=1 has all slopes 0 | Consistent; conditional contract retained | None |
| 1.1 API 4: A homomorphism sends G-isocrystals to H-isocrystals, with transported Newton grading; basicness is asserted only when the transported grading is central. | Tate n=1; Borel diag(p,1); identity | Torus b=p is central; embedding diag(p,1) in GL₂ gives root slopes ±1 and loses basicness | Consistent on the displayed instances | None |
| 1.3 API 1: G_b(Q_p) is exactly the indicated sigma-centralizer. | GL₂ b=diag(p,1); b=1; coefficient Q_p[eps]/eps² | Off-diagonal centralizer entries are 0, diagonal entries Q_p×; dimension 2 | Consistent on the displayed instances | None |
| 1.3 API 2: Changing b by g b sigma(g)^-1 transports G_b by conjugation with g. | GL₂ b=diag(p,1); b=1; coefficient Q_p[eps]/eps² | Permutation matrix w exchanges diag(p,1) and diag(1,p), conjugating the two diagonal centralizers | Consistent on the displayed instances | None |
| 1.3 API 3: For basic b, descent on G(Q_p-breve) is sigma_b=Int(b)∘sigma. | GL₂ b=diag(p,1); b=1; coefficient Q_p[eps]/eps² | For b=[[1,1],[0,1]], sigma_b(diag(2,1))=[[2,−1],[0,1]] | Consistent on the displayed instances | None |
| 1.3 API 4: For each coefficient algebra, points represent tensor automorphisms of W_b after scalar extension. | GL₂ b=diag(p,1); b=1; coefficient Q_p[eps]/eps² | For G_m the unit 1+eps is a tensor automorphism with inverse 1−eps; its product is 1 | Consistent on the displayed instances | None |
| 1.4 API 1: The isocrystal-to-bundle functor applied representationwise produces E_b. | G_m Tate; base extension; Borel; nonbasic GL₂ | Isocrystal slope −1 yields E_b=O(1), of bundle slope 1 | Consistent on the displayed instances | None |
| 1.4 API 2: Bun_G and E_b commute with perfectoid base change. | G_m Tate; base extension; Borel; nonbasic GL₂ | Pulling O(1) from S to S′ gives O(1) with the same rank 1 and degree 1 on geometric fibres | Consistent on the displayed instances | None |
| 1.4 API 3: G→M induces Bun_G→Bun_M. | G_m Tate; base extension; Borel; nonbasic GL₂ | Upper triangular extension of lines maps to ordered Levi pair (L1,L2), retaining ranks (1,1) | Consistent on the displayed instances | None |
| 1.4 API 4: The automorphism sheaf is tensor automorphisms of E_b, not defined to be the constant group G_b(Q_p). | G_m Tate; base extension; Borel; nonbasic GL₂ | Nonbasic Ad bundle slopes −1,0,1 give a positive-slope part H⁰(O(1))≠0 beyond the diagonal constant group | Consistent on the displayed instances | None |
| 1.6 API 1: Twisting back by the inverse bitorsor is quasi-inverse to F_b. | G_m slopes n and a; noncommuting b,x; identity modification | Twist and inverse send a to a−n to a, so composite slope is a | Consistent on the displayed instances | None |
| 1.6 API 2: F_b(E_b)≅E_1. | G_m slopes n and a; noncommuting b,x; identity modification | Taking a=n gives a−n=0, the trivial bundle | Consistent on the displayed instances | None |
| 1.6 API 3: F_b(E_1)≅`E_{b^-1}` for sigma_b. | G_m slopes n and a; noncommuting b,x; identity modification | Taking a=0 gives −n, the b^-1 isocrystal class | Consistent on the displayed instances | None |
| 1.6 API 4: F_b carries an isomorphism off the untilt divisor to the corresponding twisted isomorphism. | G_m slopes n and a; noncommuting b,x; identity modification | Off-divisor scalar comparison c becomes its transported c; for c=1 the transported comparison is 1 | Consistent on the displayed instances | None |
| 2.1 API 1: The weight-w summand modifies to a semistable bundle of slope −w/2. | Tate n=−1,0,1; weights −2 and 2 | For w=2,0,−2 the modified slopes are −1,0,1, exactly −w/2 | Consistent on the displayed instances | None |
| 2.1 API 2: Q_p(n) has lattice Fil^-n and weight −2n. | Tate n=−1,0,1; weights −2 and 2 | For n=−1,0,1 lattice exponents are 1,0,−1 and weights 2,0,−2 | Consistent on the displayed instances | None |
| 2.1 API 3: Tensor weights add, dual weights negate, and the underlying Q_p-space forgetful functor preserves both. | Tate n=−1,0,1; weights −2 and 2 | Weights −2+2=0 under tensor; dual of weight −2 is 2; underlying ranks 1·1=1 | Consistent on the displayed instances | None |
| 2.1 API 4: Morphisms are graded Q_p-linear maps preserving the B_dR+-lattices. | Tate n=−1,0,1; weights −2 and 2 | Identity on Q_p in weight 0 is allowed; the same scalar map from weight 0 to weight 2 fails grading, whose morphism component is 0 | Consistent on the displayed instances | None |
| 2.2 API 1: V_et is finite dimensional and V_et⊗O_FF→`E(W)_{L_et}` is an isomorphism. | Unit and Tate n=1; sum of slopes 0 and −1 | Trivial modified line has H⁰=Q_p, rank 1; evaluation Q_p⊗O→O is identity | Consistent on the displayed instances | None |
| 2.2 API 2: c_dR identifies V_et⊗B_dR+ with L_et. | Unit and Tate n=1; sum of slopes 0 and −1 | For Tate choose c_dR(e)=t e_W; c_dR(B⁺e)=t B⁺e_W=L_et | Consistent on the displayed instances | None |
| 2.2 API 3: The de Rham lattice is c_dR^-1(W⊗B_dR+). | Unit and Tate n=1; sum of slopes 0 and −1 | With c_dR(e)=t e_W, inverse image of B⁺e_W is t^-1 B⁺e=L_dR | Consistent on the displayed instances | None |
| 2.2 API 4: Basicness is compatibility of L_et with the entire slope grading, rather than isoclinicity of W. | Unit and Tate n=1; sum of slopes 0 and −1 | Direct sum has distinct slopes 0,−1 but a graded lattice, hence basic; an off-diagonal t^-1 mixing these pieces fails that grading | Consistent on the displayed instances | None |
| 2.4 API 1: A basic pair maps to (V_et,L_dR) with weight 2nu on its slope-nu summand. | Unit plus Tate n=1; graded weights 0,−2 | Newton slopes 0,−1 map to weights 0,−2 by multiplication by 2 | Consistent on the displayed instances | None |
| 2.4 API 2: A graded Hodge structure supplies the unique slope-graded basic pair up to canonical isomorphism. | Unit plus Tate n=1; graded weights 0,−2 | Weight −2 has modified bundle O(1), giving Newton slope −1 and lattice exponent 1 on inverse construction | Consistent on the displayed instances | None |
| 2.4 API 3: Both composites are tensor naturally isomorphic to the identity. | Unit plus Tate n=1; graded weights 0,−2 | The Tate pair returns exponents (1,−1) after the round trip; the graded object returns weights (0,−2) | Consistent on the displayed instances | None |
| 2.4 API 4: The slope −n Tate isocrystal maps to Q_p(n) of weight −2n. | Unit plus Tate n=1; graded weights 0,−2 | n=−1,0,1 give Newton slopes 1,0,−1 and weights 2,0,−2 | Consistent on the displayed instances | None |
| 2.5 API 1: The group embeds as a closed subgroup of G and is unchanged by replacing a tensor generator. | Unit; Tate generator; nonzero unit extension | Tate and Tate⊕unit both generate G_m; unit sums give subgroup 1 | Consistent on the displayed instances | None |
| 2.5 API 2: A subgroup supports the object iff all its defining Chevalley lines become Hodge/Tate lines of the required weights. | Unit; Tate generator; nonzero unit extension | For G_a, line e1 is stable for every u while e2 maps to e2+u e1; u=1 violates trivial-subgroup support | Consistent on the displayed instances | None |
| 2.5 API 3: After a compatible fibre identification, the canonical group is contained in every subgroup supporting a reduction; extension of that canonical reduction gives the original G-object. | Unit; Tate generator; nonzero unit extension | The unit canonical group is 1⊂G; extending its reduction gives the trivial G-object | Consistent on the displayed instances | None |
| 2.5 API 4: Under the basic-pair equivalence MG identifies with MT via the same étale fibre functor. | Unit; Tate generator; nonzero unit extension | Tate basic-pair equivalence gives MG=MT=G_m, both acting by the same scalar a | Consistent on the displayed instances | None |
| 3.1 API 1: The finite sum of Fil^i B_dR times F^-i W_K is a full B_dR+-lattice. | Rank-one filtration jump a=−1,0,1; finite strict extension | The canonical lattice is t^-a R and spans K, with rank 1 for every a | Consistent on the displayed instances | None |
| 3.1 API 2: Its trace Hodge filtration is F on W_K after extension to C. | Rank-one filtration jump a=−1,0,1; finite strict extension | trFil^i(t^-a R) is k iff i≤a; thus jump is exactly a | Consistent on the displayed instances | None |
| 3.1 API 3: Good reduction is preserved by finite extension of the strict field of definition. | Rank-one filtration jump a=−1,0,1; finite strict extension | After K⊂K′, the same F has rank 1 and exponent −a; the canonical lattice is its scalar extension | Consistent on the displayed instances | None |
| 3.1 API 4: A C0bar-analytic G-admissible pair is good; if its defining filtration has splitting cocharacter class [lambda], its lattice type is [lambda^-1]. | Rank-one filtration jump a=−1,0,1; finite strict extension | A Tate filtration jump −1 gives canonical lattice tR of type +1, the inverse cocharacter; a nonzero G_a parameter t^-1 has actual type (1,−1), not analytic good type 0 | Consistent on the displayed instances | None |
| 4.1 API 1: A seminormal rigid variety and its locally closed rigid subspaces supply rigid analytic diamonds and subdiamonds. | Rigid disc; point T=0; finite extension; square-zero thickening | Disc has dimension 1; T=0 subdiamond has dimension 0 and is a locally closed representative | Consistent on the displayed instances | None |
| 4.1 API 2: Finite field extension transports a rigid analytic point and all represented subdiamonds. | Rigid disc; point T=0; finite extension; square-zero thickening | Point T=√p becomes rational over L′=L(√p), with degree at most 2 | Consistent on the displayed instances | None |
| 4.1 API 3: A closed rigid analytic subdiamond of S^diamond gives a Zariski closed subset of S. | Rigid disc; point T=0; finite extension; square-zero thickening | Closed point is cut out by (T), giving Zariski set {0} | Consistent on the displayed instances | None |
| 4.1 API 4: Morphisms between represented seminormal rigid diamonds over Spd L are the unique corresponding rigid morphisms. | Rigid disc; point T=0; finite extension; square-zero thickening | Map T↦T² has unique rigid counterpart; on L[eps]/eps² diamondification kills eps, explaining why the source must be seminormal | Consistent on the displayed instances | None |
| 4.2 API 1: Pullback preserves these local systems and tensor operations. | Trivial rank n; rank 0; sign character; Tate twist | Pullback of Λ^n has rank n; tensor ranks n·m match scalar-extension ranks nm | Consistent on the displayed instances | None |
| 4.2 API 2: On an affinoid perfectoid S, B-local systems identify with finite projective B(S)-modules for B=O, B_dR+ or B_dR. The B_dR case requires the localized-period module-descent extension specified in the supplier contracts. | Trivial rank n; rank 0; sign character; Tate twist | Rank-one B-system is B(S), finite projective rank 1; rank-zero system gives zero module, not rank 1 | Consistent; conditional contract retained | None |
| 4.2 API 3: G(Lambda)-torsors recover the constant-coefficient tensor functors by associated representations. | Trivial rank n; rank 0; sign character; Tate twist | Trivial G_m-torsor gives the standard line, and its tensor frames are Λ×; for GL₀ frame group is 1 | Consistent on the displayed instances | None |
| 4.2 API 4: On a perfectoid space O-local systems are vector bundles. On a rigid variety the essential image of analytic vector bundles consists exactly of the étale-trivializable O-local systems. | Trivial rank n; rank 0; sign character; Tate twist | Analytic line has étale local trivialization; O(1) at Spa L has nonzero cyclotomic weight 1 after every finite extension | Consistent on the displayed instances | None |
| 4.4 API 1: Lattices and trace filtrations commute with permitted base changes once local splitting/constant type is established. | Constant rank-one lattice t^a; disc jump; cyclotomic action | Ramification-index-one extension preserves a and trace dimensions; a=1 has jumps −1 on both bases | Consistent on the displayed instances | None |
| 4.4 API 2: Swapping L1,L2 negates type, and gr1^i≅gr2^-i(i) with the intrinsic Tate twist. | Constant rank-one lattice t^a; disc jump; cyclotomic action | Swap changes a to −a; gr¹ carries chi, whereas the unqualified degree-zero line carries 1 | Consistent on the displayed instances | None |
| 4.4 API 3: Locally constant type gives trace filtrations by local direct summands. | Constant rank-one lattice t^a; disc jump; cyclotomic action | For constant type (1,0), trace subspaces have dimensions 1 and 2 and are direct summands | Consistent on the displayed instances | None |
| 4.4 API 4: Trace filtration is compatible with tensor and dual; it is not asserted exact for arbitrary bilattices. | Constant rank-one lattice t^a; disc jump; cyclotomic action | Tensor a=1 with b=−1 gives a+b=0; dual gives −1; G_a quotient trace image is still 0≠k | Consistent on the displayed instances | None |
| 4.6 API 1: M0(E,∇)=M(E,∇,F_trivial). | Unit flat line and filtration jumps −1,0,1 | Trivial filtration has jump 0, so M=M0=B⁺ | Consistent on the displayed instances | None |
| 4.6 API 2: The canonical horizontal structural comparison reduces to M0(E)⊗O≅v^*E; its pushforward recovers E and its connection, naturally in horizontal maps. | Unit flat line and filtration jumps −1,0,1 | Reduction B⁺/Fil¹=C pulls back the unit E; connection is 0 on each side | Consistent on the displayed instances | None |
| 4.6 API 3: A map between M0 lattices comes uniquely from a horizontal map of flat bundles. | Unit flat line and filtration jumps −1,0,1 | Constant scalar 2 gives unique horizontal multiplication by 2; a varying scalar f has differential df and is horizontal only if df=0 | Consistent on the displayed instances | None |
| 4.6 API 4: M sends Griffiths-transversal filtered maps to lattice-preserving maps and respects tensor and dual. | Unit flat line and filtration jumps −1,0,1 | Tensor jumps 1 and −1 give exponent 0; dual exponent negates; scalar 2 preserves each t^aR | Consistent on the displayed instances | None |
| 5.1 API 1: On a strictly totally disconnected chart the quotient agrees with actual G(B_dR)/G(B_dR+) cosets. | G_m; G_a; unipotent h mod Fil¹; Borel→T | G_m(K)/G_m(R)=Z via valuation, while G_a quotient is K/R and contains t^-1 | Consistent on the displayed instances | None |
| 5.1 API 2: The lattice and torsor-with-trivialization presentations are naturally equivalent. | G_m; G_a; unipotent h mod Fil¹; Borel→T | Torsor with trivialization t^a has lattice t^aR, recovering the same coset a | Consistent on the displayed instances | None |
| 5.1 API 3: BB is G(B_dR+)-equivariant through reduction G(B_dR+)→G(O). | G_m; G_a; unipotent h mod Fil¹; Borel→T | For type (1,0), h=[[1,0],[c,1]] moves reduced flag [1:0] to [1:c], equal to BB(hL) | Consistent on the displayed instances | None |
| 5.1 API 4: G→M sends Gr_[mu] into Gr_[mu_M] and commutes with BB. | G_m; G_a; unipotent h mod Fil¹; Borel→T | Borel diagonal type (1,0) projects to torus type (1,0); both BB flags have first jump −1 | Consistent on the displayed instances | None |
| 6.1 API 1: omega_et is a pro-étale Q_p-local system with fibre V_et of the pointwise pair. | Point, disconnected pair of points, Tate comparison c=t | At a point the slope-zero modification has V_et=Q_p of rank 1 | Consistent on the displayed instances | None |
| 6.1 API 2: omega_Isoc is the specified fixed W and is faithful on morphisms. | Point, disconnected pair of points, Tate comparison c=t | Fixed isocrystal map f=2 evaluates to 2 on both components; pair (2,3) is not a morphism | Consistent on the displayed instances | None |
| 6.1 API 3: c_dR sends omega_et⊗B_dR+ onto L_et and L_dR onto W⊗B_dR+. | Point, disconnected pair of points, Tate comparison c=t | c=t sends R to tR and t^-1R to R, verifying both lattice images | Consistent on the displayed instances | None |
| 6.1 API 4: All three realizations and both lattices commute with pullback of the locally spatial base. | Point, disconnected pair of points, Tate comparison c=t | Pullback of the Tate family retains W slope −1, étale rank 1 and exponents 1,−1 | Consistent on the displayed instances | None |
| 6.3 API 1: MG is a closed connected subgroup, well-defined up to conjugacy before choosing a fibre trivialization. | Tate group and conjugate torus; disconnected quadratic forms | Tate MG=G_m has dimension 1 and one component; conjugation changes its embedding but not that dimension | Consistent on the displayed instances | None |
| 6.3 API 2: The H-reduction induces the original G-family and is tensor-generated by it. | Tate group and conjugate torus; disconnected quadratic forms | The canonical Tate reduction extended to GL₂ gives the same diag(a,1) action on unit⊕Tate | Consistent on the displayed instances | None |
| 6.3 API 3: On any Y, choose b_H and g with g f(b_H) sigma(g)^−1=b for the fixed H-isocrystal tensor functor; connectedness is needed for the étale neutral form, not for b_H. | Tate group and conjugate torus; disconnected quadratic forms | b_H=p^-1 exists independently of the number of components; H¹ kernel Z/2 supplies two possible étale forms | Consistent on the displayed instances | None |
| 6.3 API 4: The factorized classifying map pulls the universal H-pair back to the canonical reduction. | Tate group and conjugate torus; disconnected quadratic forms | For constant Tate classifying point, pulling back the universal H-pair yields exponent 1 and the same c=t | Consistent on the displayed instances | None |
| 6.5 API 1: Maps Y→`Gr_G^{b-adm}` are b-rigidified neutral G-pairs on Y. | G_m with b=p^-1, type 1; incompatible type 0 | A point of the represented locus gives rank-one neutral pair of degree 1−1=0 | Consistent on the displayed instances | None |
| 6.5 API 2: `Gr_G^{b-adm}` is open in Gr_G over Spd Q_p-breve. | G_m with b=p^-1, type 1; incompatible type 0 | Every fixed torus type cell is clopen; its compatible admissible locus is one such point | Consistent on the displayed instances | None |
| 6.5 API 3: Pulling the universal pair back gives the represented pair and its two realizations. | G_m with b=p^-1, type 1; incompatible type 0 | Universal Tate pullback has W slope −1, V_et rank 1 and lattice exponents 1,−1 | Consistent on the displayed instances | None |
| 6.5 API 4: The fixed-type locus is the fibrewise intersection with Gr_[mu], not a redefinition of the whole admissible functor. | G_m with b=p^-1, type 1; incompatible type 0 | Intersecting with type 0 instead gives degree 1 and empty admissible intersection, while full locus still contains type 1 | Consistent on the displayed instances | None |
| 7.1 API 1: Pullback retains the fixed graded V and pulls back only its lattice. | Constant unit/Tate; nontrivial order-two system and frame torsor | Pullback preserves V=Q_p, its weight −2n and lattice exponent −n | Consistent on the displayed instances | None |
| 7.1 API 2: A geometric fibre is exactly the pointwise HS object of Layer 2. | Constant unit/Tate; nontrivial order-two system and frame torsor | Geometric Tate fibre has weight −2 and modified bundle slope 1 | Consistent on the displayed instances | None |
| 7.1 API 3: The tensor-generated Mumford–Tate group is a closed subgroup in a chosen G-fibre trivialization. | Constant unit/Tate; nontrivial order-two system and frame torsor | Unit family MT=1⊂GL_n; nonzero Tate MT=G_m⊂GL₁ is closed | Consistent on the displayed instances | None |
| 7.1 API 4: A basic neutral admissible family with a chosen global constant étale frame gives a neutral Hodge family. Conversely a Hodge family gives a neutral admissible family only when its associated constant-slope bundle has globally constant isocrystal realization with a chosen frame. Fibrewise isocrystal classification supplies no such global frame; its obstruction is the corresponding G_b(Q_p)-frame torsor. | Constant unit/Tate; nontrivial order-two system and frame torsor | Trivial frame torsor has section 1 and gives a global inverse; nontrivial frame torsor has 0 global sections although each geometric fibre has a frame | Consistent on the displayed instances | None |
| 7.3 API 1: X_[mu] is open in Gr_[mu^-1]. | G_m mu=1 and Borel noncentral invariant | Torus inverse cell is Spd L, and X is that same open point | Consistent on the displayed instances | None |
| 7.3 API 2: Maps to X_[mu] classify neutral G-Hodge structures of this type with central weight homomorphism and the specified étale tensor identification. | G_m mu=1 and Borel noncentral invariant | Tate lattice t^-1R on standard étale line has weight −2 with central torus grading; Borel root slope 1 fails centrality | Consistent on the displayed instances | None |
| 7.3 API 3: On each representation the weight is twice the central Newton grading. | G_m mu=1 and Borel noncentral invariant | Newton −1 maps to weight 2·(−1)=−2; Newton 0 maps to 0 | Consistent on the displayed instances | None |
| 7.3 API 4: A geometric point is a lattice whose modified trivial bundle has the unique G-basic class prescribed by [mu]. | G_m mu=1 and Borel noncentral invariant | At the torus point the modified line is O(1), corresponding to the unique Newton class −1 | Consistent on the displayed instances | None |
| 7.4 API 1: HT(ell) is a closed subdiamond of Y. | Tate n=−1; unit line; flag [a:c] | Incidence c=0 cuts out a closed point [1:0] inside P¹ | Consistent on the displayed instances | None |
| 7.4 API 2: At a geometric point, membership is equivalent to the corresponding MT group stabilizing ell. | Tate n=−1; unit line; flag [a:c] | For diagonal torus MT, e1 is stable and [1:0] passes; for full GL₂ a chosen e1 is not stable and [1:1] fails incidence | Consistent on the displayed instances | None |
| 7.4 API 3: The locus pulls back under a map of bases with the fixed V data. | Tate n=−1; unit line; flag [a:c] | Pulling equation c=0 to a base keeps the identical zero set f^-1({c=0}) | Consistent on the displayed instances | None |
| 7.4 API 4: The locus depends on the line, not its choice of nonzero rational generator. | Tate n=−1; unit line; flag [a:c] | Replacing e1 by 2e1 leaves span Q_p e1 unchanged; the inclusion Fil^-1R=Fil^-1R still holds | Consistent on the displayed instances | None |
| 7.6 API 1: Compatible inclusions of groups and cocharacter classes induce the domain maps. | Identity subgroup, torus, mirabolic and inverse | Identity sends its torus point to itself with unchanged integer type 1 | Consistent on the displayed instances | None |
| 7.6 API 2: Levi-minuscule subgroup type gives the closed image via the defining Hodge line. | Identity subgroup, torus, mirabolic and inverse | For GL₂ type (1,0), defining line incidence c=0 is closed and has dimension 0 | Consistent on the displayed instances | None |
| 7.6 API 3: The lower adjoint bound ≥−1 on mu_H is the upper BB bound ≤1 on mu_H^-1. | Identity subgroup, torus, mirabolic and inverse | Negation sends {0,−1,2} to {0,1,−2}; min first set=−1 and max inverse=1 | Consistent on the displayed instances | None |
| 7.6 API 4: The restricted universal Hodge structure admits the indicated H-reduction. | Identity subgroup, torus, mirabolic and inverse | Restricted Tate object has H=G_m and scalar a action, giving the same one-dimensional H-representation | Consistent on the displayed instances | None |
| 8.1 API 1: Hdg(ell) is represented by a closed subdiamond, and by a closed rigid subspace on fixed-type seminormal rigid bases. | Tate n=1; swapped isocrystal frame; flag incidence | Incidence c=0 is closed on a fixed-type seminormal disc; [1:0] in and [1:1] out | Consistent on the displayed instances | None |
| 8.1 API 2: g:b→b′ carries Hdg(ell) to Hdg(g ell). | Tate n=1; swapped isocrystal frame; flag incidence | Permutation w sends ell=e1 to e2 and diag(p,1) to diag(1,p); moving only b leaves the wrong line | Consistent on the displayed instances | None |
| 8.1 API 3: A geometric point lies in Hdg(ell) iff the isocrystal-realized MG fixes ell. | Tate n=1; swapped isocrystal frame; flag incidence | Tate line Frobenius p^-1 and exponent 1 is a subpair; replacing exponent by 2 gives nonzero modified degree | Consistent on the displayed instances | None |
| 8.1 API 4: The same fixed line condition commutes with pullback of the family. | Tate n=1; swapped isocrystal frame; flag incidence | Pulling back tR⊂L preserves the same condition on each base; at the matching Tate point it is equality | Consistent on the displayed instances | None |
| 8.2 API 1: The represented lattice map is exactly g f_*L. | Identity; two permutation conjugations; torus embedding | g=1 gives L; for w swap, w(R e1+tR e2)=R e2+tR e1 | Consistent on the displayed instances | None |
| 8.2 API 2: Composition uses the product g2 f2(g1) and agrees with extension of tensor functors. | Identity; two permutation conjugations; torus embedding | Two swaps give w²=1 and the original lattice; with nonfixed coefficients the sigma product is g2 f2(g1) | Consistent on the displayed instances | None |
| 8.2 API 3: Pullback of the G-universal pair is f_* of the H-universal pair with the g-rigidification. | Identity; two permutation conjugations; torus embedding | Pullback on the torus standard line has exponent 1, matching f_* of that lattice | Consistent on the displayed instances | None |
| 8.2 API 4: A good H-type maps to its induced good G-type. | Identity; two permutation conjugations; torus embedding | z↦diag(z,1) maps good torus type 1 to good GL₂ type (1,0) | Consistent on the displayed instances | None |
| 8.4 API 1: The full special subdiamond is closed in `Gr_G^{b-adm}`. | Compatible/incompatible torus data; GL₂ weight bounds | Compatible torus image is the closed incidence point c=0; incompatible image is empty and closed | Consistent on the displayed instances | None |
| 8.4 API 2: The upper-bound special subvariety is represented by an open rigid subspace of Fl_[mu_H^-1]. | Compatible/incompatible torus data; GL₂ weight bounds | GL₂ type (1,0) has flag P¹ and admissible locus open in it; torus flag is one rigid point | Consistent on the displayed instances | None |
| 8.4 API 3: The Kottwitz-membership condition makes the subvariety nonempty and geometrically connected. | Compatible/incompatible torus data; GL₂ weight bounds | Torus kappa −1 equals −mu for a=1 and gives 1 component; wrong kappa 0 gives empty | Consistent on the displayed instances | None |
| 8.4 API 4: Changing g acts through the ambient G_b(Q_p)-action and transports the special space. | Compatible/incompatible torus data; GL₂ weight bounds | Permutation g=w sends special line e1 to e2 and its equation c=0 to a=0 | Consistent on the displayed instances | None |
| 9.1 API 1: M_b is the G(Q_p)-torsor of étale tensor frames of the universal pair on `Gr_G^{b-adm}`. | Torus compatible data, frames 1 and p, rank 0 | Étale frame fibre Q_p× acts freely transitively; rank-zero group is 1 | Consistent on the displayed instances | None |
| 9.1 API 2: The moduli functor equals modifications E_b⇢E_1 with both ends fixed. | Torus compatible data, frames 1 and p, rank 0 | Off-divisor comparisons 1 and p give different framed modifications although the two line bundles agree | Consistent on the displayed instances | None |
| 9.1 API 3: Changes of isocrystal and étale frames give commuting G_b(Q_p) and G(Q_p) actions. | Torus compatible data, frames 1 and p, rank 0 | Left scalar a and right scalar c give a c=c a for G_m; for matrix frames left/right multiplication gives (A X) B=A(X B) | Consistent on the displayed instances | None |
| 9.1 API 4: `M_{b,[mu]}` is the pullback of `Gr_[mu]^{b-adm}`. | Torus compatible data, frames 1 and p, rank 0 | Type-a pullback retains exponent a; incompatible torus type returns empty rather than an extra frame | Consistent on the displayed instances | None |
| 9.2 API 1: BB∘pi_Let lands in Fl_[mu^-1], with the Hodge rational structure W_b. | Tate n=1; torus level K=Z_p××I; nonbasic Borel | Étale lattice exponent 1 gives first trace jump −1, in inverse flag type | Consistent on the displayed instances | None |
| 9.2 API 2: BB∘pi_LdR lands in Fl_[mu], with the étale rational structure. | Tate n=1; torus level K=Z_p××I; nonbasic Borel | De Rham lattice exponent −1 gives opposite flag jump 1 | Consistent on the displayed instances | None |
| 9.2 API 3: The two torsor groups are G(Q_p) for pi_Let and G_b(Q_p) for pi_LdR when b is basic. | Tate n=1; torus level K=Z_p××I; nonbasic Borel | Basic torus groups on both sides are Q_p×; nonbasic Borel root slope −1 does not give the second asserted Hodge-domain torsor | Consistent on the displayed instances | None |
| 9.2 API 4: The imported compact-open quotient diagrams recover the respective pro-étale tower and its limit. | Tate n=1; torus level K=Z_p××I; nonbasic Borel | Compatible finite torus levels distinguish valuations Z and residue-unit cosets; their inverse intersection ∩(1+p^nZ_p)={1} | Consistent on the displayed instances | None |
| 9.3 API 1: The maps compose with the same sigma-conjugating product as in Layer 8. | Identity, two swaps, torus basic inner form | g2=g1=w gives product 1 and original b; composition is identity | Consistent on the displayed instances | None |
| 9.3 API 2: Both period squares commute, including their BB composites. | Identity, two swaps, torus basic inner form | Identity maps retain exponents (1,−1) on both period targets | Consistent on the displayed instances | None |
| 9.3 API 3: Actions transport under f and the induced f_b on inner forms. | Identity, two swaps, torus basic inner form | For basic torus f_b=f; nonbasic GL₂ diagonal centralizer has dimension 2 rather than ambient dimension 4 | Consistent on the displayed instances | None |
| 9.3 API 4: Compatible closed subgroup data induce the subgroup moduli image used to define infinite-level special spaces. | Identity, two swaps, torus basic inner form | Identity subgroup gives whole moduli image; torus subgroup gives a zero-dimensional period image with Q_p× frame fibre | Consistent on the displayed instances | None |
| 9.4 API 1: The upper bound ≤1 identifies the Hodge-special class. | Mirabolic type and inverse; minuscule GL₄; permutation conjugation | Weights {0,1,−2} have max 1, hence Hodge bound true | Consistent on the displayed instances | None |
| 9.4 API 2: When the ambient b is G-basic (and with the H-basic subgroup datum), the lower bound ≥−1 identifies the Hodge–Tate-special class. | Mirabolic type and inverse; minuscule GL₄; permutation conjugation | Inverse weights {0,−1,2} have min −1, hence HT bound true, for basic b=1 | Consistent on the displayed instances | None |
| 9.4 API 3: Special subgroup data satisfy both bounds. | Mirabolic type and inverse; minuscule GL₄; permutation conjugation | GL₄ type (1,1,0,0) has min −1 and max 1, hence both | Consistent on the displayed instances | None |
| 9.4 API 4: The rational group actions and compatible subgroup conjugations transport these subvarieties. | Mirabolic type and inverse; minuscule GL₄; permutation conjugation | Permutation conjugation only permutes weight spaces; multiset {−1,0,1} and both bounds stay unchanged | Consistent on the displayed instances | None |
| 10.1 API 1: Generic points are exactly those outside every non-global Hodge line locus. | Constant family; a generic point and an exceptional torus point | Constant family has no non-global Hodge line locus, so exceptional set empty and generic set Y | Consistent on the displayed instances | None |
| 10.1 API 2: At y, genericity iff MG_y equals the family group after the chosen fibre identification. | Constant family; a generic point and an exceptional torus point | At a full GL₂ point dimensions MG_y=4=dim G; at a torus point dim MG_y=2<4 | Consistent on the displayed instances | None |
| 10.1 API 3: A connected subfamily meeting the generic locus has full generic group. | Constant family; a generic point and an exceptional torus point | A connected subfamily containing the dimension-4 point has group containing GL₂ and contained in GL₂, hence equality | Consistent on the displayed instances | None |
| 10.1 API 4: A change of b-rigidification transports the exceptional and generic subsets. | Constant family; a generic point and an exceptional torus point | Permutation frame change takes ell=e1 to e2 and transports both corresponding incidence sets | Consistent on the displayed instances | None |
| 11.1 API 1: A is contained in each of its analytic closures. | Torus A={1}; A={1,p}; empty indexing family; basic inversion | Intersection of 1+p^nZ_p contains 1; union of the two cosets contains {1,p} | Consistent on the displayed instances | None |
| 11.1 API 2: Its closure is contained in every qualifying level-pullback that contains A. | Torus A={1}; A={1,p}; empty indexing family; basic inversion | Closure {1} lies in every coset 1+p^nZ_p; closure {1,p} lies in their two-coset unions | Consistent on the displayed instances | None |
| 11.1 API 3: If no qualifying closed rigid analytic subdiamond contains A, its analytic closure is the whole ambient space. | Torus A={1}; A={1,p}; empty indexing family; basic inversion | Intersection of zero subsets in the index family is ambient M_C, not empty | Consistent on the displayed instances | None |
| 11.1 API 4: Basic duality exchanges the two defining index systems and their closures. | Torus A={1}; A={1,p}; empty indexing family; basic inversion | Inversion sends {1,p} to {1,p^-1}; both defining towers give precisely those two-point closures | Consistent on the displayed instances | None |
| 12.1 API 1: The second lattice is M0 of the underlying flat bundle with trivial filtration. | Unit/Tate variation; finite monodromy; dual representation | Trivial-filtration lattice of unit is M0=B⁺; replacing a filtration jump 1 by trivial changes exponent −1 to 0 | Consistent on the displayed instances | None |
| 12.1 API 2: Pullback preserves the graded de Rham system and its weight conditions. | Unit/Tate variation; finite monodromy; dual representation | Finite étale pullback kills order-2 monodromy and retains weight 0; Tate weight remains −2n | Consistent on the displayed instances | None |
| 12.1 API 3: Tensor G-variations are independent of a chosen closed faithful representation for the de Rham test. | Unit/Tate variation; finite monodromy; dual representation | A faithful representation and its direct sum with its dual detect the same finite group action; tensor/dual ranks n and n² obey de Rham rank multiplication | Consistent on the displayed instances | None |
| 12.1 API 4: Each geometric fibre gives the pointwise HS object with the stated weight. | Unit/Tate variation; finite monodromy; dual representation | At a geometric point the order-two character becomes the unit weight-0 fibre; Tate fibre is weight −2n | Consistent on the displayed instances | None |
| 12.2 API 1: Stilde^cris is the pullback of [*/G_b(Q_p)]’s universal torsor along E_dR. | Constant basic frame; Tate n=1; K′⊂K | Constant E_b gives S×G_b(Q_p); on a point fibre is G_b(Q_p) | Consistent on the displayed instances | None |
| 12.2 API 2: The tautological frame supplies the neutral good b-pair. | Constant basic frame; Tate n=1; K′⊂K | Choosing frame 1 gives W_b and the canonical lattice tR; changing frame p changes the identification by p | Consistent on the displayed instances | None |
| 12.2 API 3: The map to M_b,mu/K pulls the universal pair and étale K-reduction back to the original data. | Constant basic frame; Tate n=1; K′⊂K | The induced map pulls back the universal pair with rank 1 and exponents (1,−1), and its K-frame reduction is the original one | Consistent on the displayed instances | None |
| 12.2 API 4: Changing K compatibly gives the transition maps between period targets. | Constant basic frame; Tate n=1; K′⊂K | For G_m, K′=1+p²Z_p⊂K=Z_p× maps unit residue cosets to one valuation component; valuation p remains 1 on both levels | Consistent on the displayed instances | None |

### Conditional contracts and convention controls

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Adjoint-kernel and orbit-differential contract | GL₂, G_a, constant S₃, Q₈, C₂ | GL₂ kernel and center are scalar G_m; G_a kernel and center are G_a. For disconnected constants Lie=0, kernel orders 6,8,2 while centers have orders 1,2,2. GL₂/P¹ orbit derivative on E21 is 1 | Connectedness excludes the two nonabelian counterexamples; orbit target/source explicit | Conditional contract retained |
| Observable quotient contract | U⊂SL₂ stabilizing e1 | Orbit SL₂·e1=A²−{0}; invariant global functions k[x,y]; spectrum A² includes the omitted origin | Quasi-affine is weaker than affine | Conditional contract retained |
| Canonical reduction contract | Unit and a nonzero Tate generator | Canonical groups 1 and G_m; extended actions are identity and scalar a, recovering the original object | Minimal group is tied to the generated category | Conditional contract retained |
| Strict-field openness contract | Tate square at p=2,3 over Q_p-breve | Squared unit images are 1+8Z₂ (index 4 in Z₂×) and 1+3Z₃ (index 2 in Z₃×); both open in Q_p× | Surjectivity onto all Q_p× is unnecessary | Conditional contract retained |
| Arbitrary-field full-rank de Rham contract | Unit system on smooth disc; jumping G_a lattice | Unit has de Rham rank 1 and F⁰=E,F¹=0; jumping disc has vector types (0,0) and (1,−1) | Fixed-type geometry cannot itself prove the new criterion | Conditional contract retained |
| Localized B_D descent contract | Affinoid perfectoid unit and zero object | Global modules B_D(S) of rank 1 and 0 of rank 0; localizations of their positive lattices have the same ranks | O-descent alone supplies no identification with B_D-modules | Conditional contract retained |
| Rational rigidified BKF contract | Unit; sum of two slopes | Unit has (E1,E2,alpha,beta)=(O,O,1,1); graded ranks 1,1 on O⊕O(1) are retained by beta | Losing beta loses data | Conditional contract retained |
| Ordinary Igusa/crystalline-frame contract | p=2, m=1,2,3; rational extension | Integral fibre degrees 1,2,4; rational fibre decomposes into p^n Z_p× for n∈Z | Full unit group and Tate normalization must be preserved | Conditional contract retained |
| Basic Hodge-type uniformization contract | Trivial versus free discrete arithmetic action | Gamma=1 gives M/K; nontrivial gamma identifies x and gamma x in the quotient, while the product retains two labels | Quotient data cannot be replaced by a product | Conditional contract retained |
| Cartier fractional-power supplier convention | Fil¹=(xi), n=−1; xi′=v xi | Fil^-1=xi^-1 R; it is not R. Degree-one coordinate scales by v-bar, degree −1 by v-bar^-1 | Intrinsic ideal and inverse signs agree in RelativeFarguesFontaine §§4.10–4.12 and Layers 0,4,7,8 | None |
| Isocrystal/bundle supplier convention | W with Frobenius p^-1 sigma | Newton −1, bundle O(1) slope +1, Hodge weight −2, L_et exponent +1, L_dR exponent −1 | Same witness in VectorBundlesAndIsocrystals VB1, PadicPeriodRings §4.1, PadicHodgeTheory §7.1 and Layers 2–3,6–9,12 | None |
| Period/right-action supplier convention | A=[[1,1],[0,1]], X=diag(2,1) | AX=[[2,1],[0,1]], AXA^-1=[[2,−1],[0,1]]; right action on an inverse frame uses A^-1 | Inner twist, inverse comparison and right-coset dictionary agree after stated inversion transport | None |
| Profinite projection supplier | Empty P; two-point P; noncompact N | Products empty and S⊔S give closed images empty and Z1∪Z2; points p^n in the N-case accumulate at missing 0 | Profinite compactness and chart universe are retained in D5.10 and §10.2 | None |
| Exterior-line supplier on value algebras | mu₂⊂G_m and dual numbers Q_p[eps]/eps² | Translation of 1+x² gives 1+a²x²; stabilizer condition a²=1. a=1+eps gives 1+2eps≠1, including over Q₂ | Scheme-level law detects infinitesimal failure missed by reduced points | None |
| Two exceptional torus points | A=[[0,d],[1,0]], B=[[0,2d],[1/2,0]], d nonzero nonsquare | [A,B]=diag(−3d/2,3d/2); I,A,B,[A,B] span dimension 4, each field torus has dimension 2 | The disconnected full-joint-group counterexample has explicit values at all p, including 2,3 | None |
| Finite-monodromy convention | p=7, f=X²+X+1 at x=2; quadratic sign | f(2)=7, f′(2)=5 a unit; root has order 3. Sign has order 2 and −1≠1 even in Q₂ | Weight-zero finite characters need not be quadratic | None |
| Ideal and empty-object convention | Perfectoid quotient I=0 or I=R; rank 0 | Quotients give R and zero ring; closed sets whole space and empty; zero lattice spans the zero vector space only | No nonzero rank lattice is supplied by the zero submodule | None |

The computations do not replace the independent source and supplier hypotheses. No
unproved contract was disguised as a Lean assumption with an empty predicate, and no
computational algorithm was added to the roadmap.





Pull request: #1511 (roadmap/admissible-pairs-and-padic-hodge-structures at dc906d7)
