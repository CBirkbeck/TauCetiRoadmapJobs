# Review of PseudodifferentialOperators (pull request #952 at 9cdb62c)

**Verdict:** needs changes

## R01 (P2) — Smooth density needs a restriction on the Besov summability index

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:1053`–1058, “The Besov and localized Bessel API includes” and “smooth density for finite p”.

**Claim:** Finite p suffices for smooth density in the bundle Besov spaces just constructed, including q=∞.

**Witness:** On the normalized circle, u=Σⱼ≥₁2⁻ʲexp(i2ʲx) has 2ʲ‖Δⱼu‖₂=1. For every smooth v, 2ʲ‖Δⱼv‖₂→0. Consequently ‖u−v‖_{B¹₂,∞}≥1, despite p=2.

**Exact repair:** Separate the two assertions: retain smooth density for the localized Bessel spaces H^(s,p), 1<p<∞; assert it for Besov spaces with 1≤p,q<∞. For finite p and q=∞ identify the smooth closure with the little Besov subspace, characterized by vanishing weighted dyadic tails. Retain the full q=∞ spaces and interpolation theorem. Add the displayed series as a negative-control Check. Choose the annular partition to equal one at its central frequency and zero at adjacent dyadic centers; this is an admissible smooth partition. Its partial sums have error exactly 1 in B¹₂,∞. In the repaired finite-q assertion, a summable weighted coefficient sequence has tail norm tending to zero. The source makes this endpoint distinction: Bergh–Löfström Theorem 3.4.2(b,c), printed p. 47, `bl line 1570`–1574.

## R02 (P3) — Correct the printed page of Atiyah–Singer (5.2)

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:1216` and :1972, “(5.2), p. 513”.

**Claim:** The compact-kernel assertion (5.2) is on printed p. 513.

**Witness:** `atiyah_singer line 1085`–1090 contains (5.2) on printed p. 512; printed p. 513 begins at line 1107.

**Exact repair:** Change both references to p. 512. Keep the closure-of-the-operator-class qualification: that is part of the source's statement. Reopening p. 512 reaches the claimed symbol-map kernel; on the circle a negative-order multiplier tends to zero while the identity multiplier stays 1.

## R03 (P3) — Give claim-level locators for global quantization and averaging

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:780`–843, particularly “homotopies of principal symbols admit continuous operator lifts” and “Recover symbols by testing on exponentials”; also :1222–1227, the averaging assertion.

**Claim:** Section 4.2 specifies global patching, principal-symbol exactness, parameter lifts and exact full-symbol recovery, but supplies no theorem/section-and-page locator for any of them. The averaging assertion in §5.5 likewise lacks its own locator.

**Witness:** Section 4.2 has no source locator. Taylor I §8, (8.1)–(8.3), pp. 23–24 (`taylor line 828`–858), covers global classes; Atiyah–Singer (5.6), p. 517 (`atiyah_singer line 1251`–1256), covers averaging in the closure calculus.

**Exact repair:** Attach that precise locator to the coordinate/global-class claim; attach precise locators to the exact sequence and parameter-lifting claims. For the exact support/recovery equivalence, either cite a matching theorem or explicitly identify it as a deduction from the kernel correspondence and Fourier injectivity, with those inputs' locators. Add Atiyah–Singer (5.6), p. 517, beside averaging, explicitly retaining the extra coefficient-seminorm argument needed for the actual class (the source footnote warns of this distinction). Preserve the distinction between compatible full symbols and equal principal symbols. Testing y=exp(x) on f(x)=x still gives 1 versus 0, so the repair must not weaken full compatibility to principal-symbol agreement.

## Verified sound

This is a full review of both files at the requested head, including unchanged passages. Three findings are counted above: one P2 and two P3. The existing cross-package supply issue below is recorded with its settled edit-boundary disposition, not submitted again as a new actionable finding. No source or pull-request text was treated as an instruction. No pull-request file was changed, and nothing was posted.

**Previous findings, checked first against this head.**

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| r3 R01, reciprocal supply | README:84–85: “K5a's distributional action and Laplace analysis consume the differential-operator core”; :1714–1716 consumes R4.7. | Not mathematically repaired. The available repair report H01 explicitly records the two-file edit boundary and the need for an earlier owner, independent density input and consumer edits. That reason is valid. Its settlement is respected; no repeat demand for those unauthorized edits is counted here. |
| r3 R02, unowned Friedrichs construction | README:1738–1742: “The realization used throughout P7a is K5a's H² realization”; the form enters through the weak identity and transport. | Repaired by removing the abstract form-representation dependency. On circle mode k, both the form and operator give k²; no Friedrichs theorem is needed for this identity. |
| r3 R03, missing locators | README:911 and :927–931 now name Adams–Fournier/Brezis; :1216 names Atiyah–Singer; :1308, :1329 and :1346 name Taylor/Atiyah–Singer; :1466–1468 names Shubin; :1625–1629 and :1668 names Atiyah–Singer. | Substantially repaired: the new accessible references were read, the closed books remain explicitly uncertified, and the unidentified Mark courses were removed. R02 corrects a new page error; R03 records the still-unsourced averaging assertion and an additional unsourced block found in the full pass. |
| r3 R04, interpolation overlap with NoncommutativeIntegration | README:22–27 assigns the shared couple/interpolation constructions to P5. | No repair needed here. PDO precedes NoncommutativeIntegration (merge-order lines 8 and 276). The latter's duplicate construction remains consumer-side work; it is not an upward input to this folder. |

The earlier repair's H01 is an explicit acknowledgement of unresolved cross-package work, not a proof that the graph is acyclic. Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:45`, :576–577 and :1650–1652 consume P1.0, while this README consumes K5a. Main `TauCetiRoadmap/RiemannianGeometry/README.md:144`, :152–154 consumes P1, while this README consumes R4.7. These are two roadmap-level two-cycles. Merely extracting P1.0 without an independent density input preserves the first cycle. No ownership move was made in this review, and the valid edit-boundary reason is not re-raised.

**Gate, elaboration and signatures.** The diff outside the folder is empty, the head is exactly 9cdb62c2ba17918b15dbb44031d7eb8b15ebdf91, and the worktree is clean. The worker's gate at this head reports every scanner, metadata, dependency and targeted-build check passing, including `build=0 OK`. The prescribed dependency command was independently rerun and printed:

```text
depcheck: 208 roadmaps, 1458 edges, 0 problem(s)
```

It prints no UPWARD, CYCLE or moved line. Its clean result does not account for the main-to-open-folder return edges just identified by reading the actual consumers. All `*Needs:*` lines were read. No additional upward supplier, false named supplier or declared gap was found; no readable plan declares gaps.

The missing object for the one Tau Ceti import was built with the permitted targeted command. Direct elaboration of `TauCetiRoadmap/PseudodifferentialOperators/Suggested.lean` then exited 0, with exactly eight `sorry` warnings and no other warnings. A scratch copy with `#check @name` for all 22 explicit declarations also exited 0. The four geometry theorem signatures retain finite dimension, second countability, Hausdorffness, smooth-manifold and boundaryless assumptions. The four Euclidean theorems retain their finite-dimensional fibers; quantization retains completeness and the appropriate compact-spatial-support or all-x-uniform hypothesis; Borel summation retains antitonicity and convergence to minus infinity; the inverse theorem retains ellipticity and excludes ξ=0 in both inverse equations. The raw integral definition does not retain completeness, but the theorems using it do. The pointwise derivation-field definition does not retain second countability, which its native pointwise construction does not need. No required hypothesis silently disappeared.

All eight admissions were probed in a scratch copy with `first | rfl | simp | infer_instance | exact?`. All eight failed (six unsuccessful lemma searches, two unsolved goals). The probe, library search and definition review found no padding. There are no sorry'd data, empty predicates, `set_option`, admitted examples or namespace collisions. The file has one Mathlib import and the single used Tau Ceti import.

**Headline inventory and carrier boundary.**

| README headline | Acceptance file or reason for absence |
|---|---|
| P1.0 ideal-square criterion, cotangent comparison, smoothness and equivalence of algebraic derivations | Four explicit theorems at Suggested.lean:62, :75, :90, :101. |
| Complex derivations, finite/higher jets, differential operators, principal symbols, Bochner connection, Peetre | Named in the module docstring. Bundle operator/jet carriers and the complex smooth-function/section algebra bridge are absent; the real native point-derivation theorem does not supply these. |
| P2 local Borel summation | `exists_asymptoticSum`, :184; generalized local orders are explicitly constructed rather than attributed verbatim to Melrose's integer-step uniform theorem. |
| P3 bundle kernel theorem; P4 global calculus and symbol recovery | Named in the docstring as requiring bundle tests/distributions/global operator carriers. The actual Euclidean quantization integral is defined at :198. |
| P5 compact-support Sobolev mapping and uniform order-zero boundedness | `exists_quantizeSobolev`, :214, and `exists_quantizeUniformOrderZero`, :225, use the native Bessel carrier. |
| P5 interpolation, bundle Besov and Zygmund theories | Named as not statable without their interpolation and bundle function-space carriers. R01 is in the prose API, not hidden in a Lean stand-in. |
| P6 inverse homogeneous principal symbol | `exists_inversePrincipalSymbol`, :241, on the actual classical-symbol data. |
| P6 parametrix/Fredholm/regularity; P7 powers, equivariant product index and Hodge theory; P7a transplantation; P8 wavefront operations | Individually named or grouped explicitly in the docstring, with the absent bundle scales, realizations and manifold distributions. No weaker scalar substitute is inserted. |

The README has the required scope, conventions, supplier contracts, nine build layers, Examples/Dependencies and references. Definitions have API prose and discriminating Checks (including distinct lists for homogeneous symbols, cutoffs, classical/asymptotic symbols and the three Hölder variants). The one Ehrling Check belongs to a theorem, not a new definition. No algorithmic deliverable, route-specific arithmetic restriction, copied source passage or replanning of an existing PDO folder was found. Native weak spaces, scalar estimates and bundles are consumed; the symbol estimates and new bundle constructions are the intended general library work. Finite computations below test statements, not proofs of the general analytic theorems.

**Pinned-library audit.** Mathlib is pinned at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Paths in this table are relative to the respective library. The 18 rows below group opened declarations, not name-only search hits.

| File and line | Declaration and boundary checked |
|---|---|
| `Mathlib/Analysis/FunctionalSpaces/BesselPotentialSpace.lean:47`, :250, :265, :299 | Native distribution-plus-Lp-witness carrier, linear isometry, completeness and `MemSobolev.toBesselPotentialSpace`; its distribution field is the original distribution. Inner-product structure at :279 has an additional inner-product-fiber assumption; the roadmap's Banach-fiber mapping theorems do not use it. |
| `Mathlib/Analysis/Distribution/Sobolev.lean:205`, :222 | `SchwartzMap.memSobolev` and the Fourier characterization; the latter's inner-product/complete-fiber hypotheses were not silently generalized. |
| `Mathlib/Analysis/Distribution/TemperedDistribution.lean:53`, :98–104 | Continuous complex-linear functionals on Schwartz tests with pointwise-convergence topology, not an asserted strong-dual topology. Function pairing is ∫g(x)•f(x), without conjugation. |
| `Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean:51`, :102 | `fourierTransformCLM` and its equality with the native Fourier transform. Frequency conversion is tested below. |
| `Mathlib/Analysis/Distribution/Distribution.lean:18`–27, :79 | Distribution carrier uses real tests and compact-convergence topology; the kernel theorem remains future work here. This is not the bundle distribution carrier promised by the roadmap. |
| `TauCeti/Geometry/Manifold/DerivationBundle.lean:106`, :163, :193, :309, :351, :446 | Private chart/Hadamard helpers, locality, derivative evaluation and `pointDerivationEquivTangentSpace`. Finite dimension, T2 and an interior point are required; global smoothness of arbitrary algebraic derivations is not supplied by this equivalence. |
| `Mathlib/RingTheory/Ideal/Cotangent.lean:52` | `Ideal.toCotangent` is the actual quotient map from I to I/I². |
| `Mathlib/Geometry/Manifold/VectorBundle/ContMDiffSection.lean:135`, :284 | `ContMDiff.smul_section` and sections bundled with a smoothness proof. The missing function-algebra module instances are additional structure, not a replacement carrier. |
| `Mathlib/Geometry/Manifold/VectorField/LieBracket.lean:481`, :998 | `mlieBracket_smul_right` and smoothness of the vector-field bracket. |
| `Mathlib/Geometry/Manifold/Algebra/Structures.lean:30`, :51 | Native `ContMDiffRing` and field instance; the same-scalar instance does not by itself give the real-manifold/complex-function algebra bridge. |
| `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:359` | `leviCivitaConnection`; the roadmap consumes it rather than defining another positive-metric connection. |
| `Mathlib/Analysis/Complex/Hadamard.lean:612` | `norm_le_interp_of_mem_verticalClosedStrip'`: nonempty strip, boundary regularity/boundedness and interior holomorphy, rather than an unrestricted three-lines principle. |
| `Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean:89`, :104 | `IsFredholm.eventually_nhds_index_eq`, `index_continuousOn_isFredholm`. |
| `TauCeti/Analysis/Fredholm/SmallPerturbation.lean:243` | `exists_pos_isFredholm_and_index_eq_of_norm_sub_lt`, the native quantitative perturbation input. |
| `TauCeti/Analysis/InnerProductSpace/Spectrum.lean:119`, :145; `Mathlib/Analysis/InnerProductSpace/Spectrum.lean:93` | Compact symmetric-operator Hilbert eigenbasis and reality of symmetric eigenvalues. The general basis statement is not restricted to a separable Hilbert space. |
| `Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean:601` | `eLpNorm_le_eLpNorm_fderiv_of_eq`: smooth compactly supported finite-dimensional-valued inputs, positive dimension, p≥1 and the reciprocal exponent relation. It is not the entire endpoint/weak bundle API. |
| `TauCeti/Analysis/Sobolev/RellichKondrachov.lean:141`; `TauCeti/Analysis/Sobolev/W1p/Extension.lean:255` | `W1p0.isCompactOperator_valueL` and zero extension norm; the zero-boundary distinction is retained. |
| `Mathlib/RepresentationTheory/Induced.lean:155`; `TauCeti/RepresentationTheory/Induction/Permutation.lean:166`, :174 | `indResAdjunction`, `indTrivialIso`; the inverse-coset convention is explicit and agrees with the inverse-pullback action after translation. |

**Ownership and citation audit.** Object searches used the roadmap service across main/open heads, and searches of the supplied board packages and both pinned libraries. Searches covered jets/section modules, differential operators and Bochner connections, interpolation couples/K-functional/Besov spaces, bundle distributions, Fredholm/closed forms, Hilbert tensor products, complex powers, transplantation and wavefront operations. Algebraic jets in arithmetic roadmaps are not the smooth bundle jets here. Main has no existing PseudodifferentialOperators roadmap to be replanned. No other supplied Lean file declares this namespace's targets. The 13 rows below resolve the supplier and consumer citation groups.

| Supplier/consumer citation | Resolution and ownership |
|---|---|
| DifferentialGeometry Layers 0–1, 5 | Main `TauCetiRoadmap/DifferentialGeometry/README.md:268`, :311, :503: forms, differential and density/integration background. |
| SmoothBundlesConnections B2–B4 | Supplied head `TauCetiRoadmap/SmoothBundlesConnections/README.md:559` onward: sections, tensor/dual/complexification, metrics/densities, connections and comparisons. It precedes PDO at merge-order line 7. |
| ComplexKahlerGeometry K5a | Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:570`, :626, :651, :722, :778–862: densities, LF/Fréchet sections/distributions and all-real bundle Sobolev scales. Laplace analysis at :984–1058. Reciprocal core dependency is recorded above. |
| PDE Lane A.3–A.7; B.8–B.10 | Main `TauCetiRoadmap/PDE/README.md:234`–278: weak/Bessel comparisons, extension/trace/Rellich, Hölder and scalar harmonic-analysis estimates. Generic compatible-couple and strip-quotient construction is not its operator-interpolation statement. |
| HopfRinow Layer 1 | Main `TauCetiRoadmap/HopfRinow/README.md:244`–296: native positive Levi-Civita input, nondegenerate/family extension and regularity. |
| RepresentationTheory/CompactGroups Layers 0–3 | Main `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:205`, :226, :248, :271: Haar, continuous unitary representations, complete reducibility and matrix coefficients/Schur orthogonality. Used for averaging and finite eigenspaces, not as a substitute for continuous section actions. |
| TopologicalKTheory T6.1–T6.2 | Main `TauCetiRoadmap/TopologicalKTheory/README.md:970`–1007: strong continuity on L² and the continuous representation ring/external products. |
| VonNeumannAlgebras V2 | Supplied `TauCetiRoadmap/VonNeumannAlgebras/README.md:131` and the fuller supplied revision at :554: completed native Hilbert tensors and product L² comparison. Order line 4 is earlier; PDO does not rebuild the tensor completion. |
| RiemannianGeometry R4.7 | Main `TauCetiRoadmap/RiemannianGeometry/README.md:751`–760: free properly discontinuous isometric quotient geometry. Finite free actions on closed manifolds fall in that contract; reciprocal P1 dependency remains above. |
| InductionRestriction §2.1 | Main `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:346`–379; `Suggested.lean:728` contains `Gassmann.almostConjugate_iff_permutation_equiv`. The resolver's unresolved-name lead is false. |
| NoncommutativeIntegration §§2.2–2.4 | Supplied `TauCetiRoadmap/NoncommutativeIntegration/README.md:425`–502 duplicates generic couples/interpolation. PDO owns these earlier; no supplier edge is added here. |
| LieGroupoidsPoisson G1.1 and ContactGeometry CG5 | Supplied `TauCetiRoadmap/LieGroupoidsPoisson/README.md:345` consumes PDO's smooth-section module; main `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:207` consumes first jets. |
| IndexTheory I2/I4; FuchsianOrbifolds L9 | Supplied `TauCetiRoadmap/IndexTheory/README.md:63`, :230, :432 and `TauCetiRoadmap/FuchsianOrbifolds/README.md:152`, :1453–1459 consume the stated PDO analyses. The latter needs domain/form/resolvent transport, not an abstract Friedrichs identification. |

The resolver's other lead, `Symbol.HasCompactSpatialSupport`, is declared at Suggested.lean:150. It is not missing. Ownership against open ContactGeometry or RelativisticQuantumFieldTheory revisions was not checked: no such files were supplied, and none were sought. Main ContactGeometry was checked.

**Source sample: all 15 requested targets.** Legal text was fetched through the sources service. Ten works were readable; eight other cited works are accounted for under Not verifiable. The source identifiers below label the line-numbered extractions. Printed pages, not PDF indices, were checked; scans were inspected where OCR omitted formulas. Generalizations made by this roadmap are distinguished from the source statements.

| Seeded target | Exact text read and comparison |
|---|---|
| 1.2 Locality/Peetre | `kms line 7824`–7844, Theorem 19.1, pp. 176–177: linear support-nonincreasing maps of finite-rank smooth bundles, compact-set finite order, no continuity assumption. This matches the target, including the noncompact local-order distinction. |
| 2.1 Local and uniform symbols | `taylor line 153`–163, I (1.15)–(1.17), p. 5: derivative weights and classical expansion. Taylor's estimate is all-x uniform; the README explicitly adds the compact-local version rather than confusing the two. |
| 3.1 Oscillatory integrals/kernel | `taylor line 82`–104, I (1.1)–(1.4), pp. 3–4; `dyatlov line 338`–362, Lecture 7 p. 11, sequentially continuous C∞c→D′ correspondence; `melrose_iml line 477`–496, Theorem 1.2 p. 16, tempered correspondence. Melrose's proof route appears at line 1044–1054, Problem 1.16. Dyatlov does not prove the general theorem; the newly added Hörmander citation is explicitly uncertified. Bundle gluing is the roadmap's target. |
| 3.2 Amplitudes/proper support | `taylor line 193`–235, I (1.21)–(1.28), pp. 6–7: amplitude reduction and smoothing off the diagonal. The README distinguishes proper kernel support from uniform symbol estimates. |
| 4.1 Composition/adjoints | `taylor line 245`–250 and 261–297, I (2.3), (2.5)–(2.9), pp. 7–8. The roadmap's ordered matrix formula avoids the source's scalar-Poisson overclaim; see Source issues. |
| 4.2 Global quantization | `taylor line 828`–858, I §8 (8.1)–(8.3), pp. 23–24, supports coordinate invariance/global classes. Section 4.2 has no attached locator for its wider claims (R03). Grubb's chapter could not be read. Exact recovery and support are tested below, not falsely certified from Taylor §8. |
| 5.1 Hilbert-scale estimates | `taylor line 320`, I (3.1), p. 9, and line 441–443, (3.31), p. 12: uniform L² and H^s→H^(s−m). Compact x support makes the local symbol uniform; bundle mapping is the localization target. |
| 5.2 Weak derivatives/endpoints | The new Adams–Fournier Theorems 4.12/6.3 and Brezis Theorems 8.2/8.7/8.12/9.9/9.16 locators are present but the books were not readable. Native GNS, the cited PDE contracts and endpoint examples were checked; this does not certify the book numbering or all endpoint claims. |
| 5.3 Interpolation/Bessel/Besov | `bl line 911`–929, Lemma 2.3.1 pp. 24–25; line 1380–1404, Theorem 3.1.2 pp. 40–41; line 1570–1581, Theorem 3.4.2 pp. 47–48; line 2656–2693, §4.1 pp. 87–88; line 3200–3248, Theorems 5.1.1–5.1.2 pp. 106–107; line 3601–3619, Theorem 5.6.1 p. 122; line 4398–4462, Theorems 6.4.3/6.4.5 pp. 151–153. The unequal-order and 1<p<∞ restrictions were checked on the printed formula. Equal-order complex interpolation is separately justified in the README. Density at q=∞ fails (R01). |
| 5.5 Smoothing/equivariance | `atiyah_singer line 1085`–1090, (5.2), p. 512, and line 1251–1256, (5.6), p. 517. Compact kernel in the operator-norm closure and averaging agree. The source's footnote at line 1273 warns that the actual pseudodifferential class requires more work; the README explicitly owns coefficient differentiation and uniform group-parameter estimates. |
| 6.2 Regularity/solvability | `taylor line 509`–528, I (4.7)–(4.12), pp. 14–15; line 1081–1101, II (3.1)–(3.8), pp. 31–32; line 1245–1263, II (5.1)–(5.8), pp. 35–36; `atiyah_singer line 1258`–1359, §6 pp. 517–519. Taylor's nonlinear iteration assumes prior positive regularity; the roadmap first supplies its 3→12→6 bootstrap. Smooth coefficients permit arbitrarily high finite coefficient regularity. |
| 7.1 Powers/domains | Shubin Chapter II §§9–11 is explicitly uncertified; Grubb–Hansen Definition 2.1/§4 and Seeley pp. 288–307 were not readable. The spectral and scaling tests below were computed, but the parameter-class source comparison remains unverified. |
| 7.2 Equivariant product index | `atiyah_singer line 261`–291, §2 p. 490, and line 1598–1713, §9 pp. 526–529: product sign, lifted operators, kernel decomposition and index multiplication. The source works with a closure calculus; the roadmap explicitly adds its own angular-cutoff homotopy and classical quantization route. The source is not being credited with those added estimates. |
| 8.1 Quotients/scalar realization | `berard line 222`–272, Theorem 14 p. 158, Lemma 16, Theorem 17 and Comments 18 pp. 158–159. Printed p. 158 was inspected: the source multiplies the quotient squared norm by the group order. The roadmap instead uses ordinary Riemannian volume and multiplies pullback by d⁻¹ᐟ². Its H²-domain argument is explicitly additional; the weak energy identity does not assert a source Friedrichs theorem. |
| 9.2 Pullback/products/pushforward | `bdh line 500`–541, Theorem 4.6/Proposition 5.1 pp. 13–14; line 914–970, Theorems 6.1/6.3 pp. 21–22, arXiv v2. Normal-topology continuity, tensor zero-factor terms and properness on fixed support are retained. The roadmap uses fixed C in the target cone, repairing a source-level defect rather than inheriting it. |

Additional source inputs checked: KMS §§1.3–1.5 pp. 5–6 (`kms line 325`–404), Lemma 3.3 p. 16 (line 822–836), §§12.5/12.17 pp. 118–119/125 (line 5357–5375, 5687–5693); Gilkey Lemma 2.1 p. 289 (`gilkey line 102`–110); Melrose Proposition 2.3 and (2.55)–(2.57) pp. 39–40 (`melrose line 436`–519); Taylor I (3.32)–(3.34) p. 12, (4.1)–(4.6) pp. 13–14, Proposition 7.3/Corollary 7.4 p. 22 (`taylor line 445`–450, 478–502, 781–799); Atiyah–Singer §7 pp. 520–522 (`atiyah_singer line 1380`–1437). The latter explicitly assumes a common order, as does the roadmap's complex target. The Borel source has uniform m−j orders; the roadmap's compact exhaustion/variable-order diagonal construction is its own extension.

**Computed adversarial pass.** The following 134 rows cover the definitions, conventions, substantive API assertions, all eight Lean headlines, all sampled targets and all findings. “Pass” means that the displayed instance respects the stated hypotheses and gives the recorded values; it is not a substitute for a general proof. Rows concerning unavailable sources certify only the calculation. Empty/zero cases are included where their carrier is admitted; arithmetic characteristic tests are inapplicable to a library explicitly over ℝ and ℂ.

| Statement | Instances tried | Values computed on the relevant sides | Result; change |
|---|---|---|---|
| Angular versus Mathlib Fourier normalization | n=1, ξ=2πζ | (2π)⁻¹dξ=dζ; both integrands have exp(2πixζ)a(x,2πζ)𝓕u(ζ) | Pass; none. |
| D=−i∂ and geometric/Fourier symbols | exp(ixξ), ξ=2 | ∂u=2iu, Du=2u; geometric symbol 2, Fourier symbol 2i | Pass; none. |
| Formal-adjoint symbol parity | ∂, order 1 | Geometric symbol of ∂* is −ξ; (−1)¹ξ=−ξ. Fourier symbol −iξ=conj(iξ) | Pass; none. |
| Bilinear distribution pairing | Constant scalar i multiplying a real test φ | Both native and Lean pairings are i∫φu; a conjugate-test pairing would give −i on test iφ | Pass; keep distinct from Hermitian pairings. |
| smoothVanishingIdeal | At 0 on ℝ, f=x and g=1 | f(0)=0, g(0)=1; f∈I₀, g∉I₀ | Pass; none. |
| Ideal-square iff zero value and derivative | f=x² and g=x at 0 | x²=x·x∈I₀², (f(0),f′(0))=(0,0); g′(0)=1 and g∉I₀² | Both directions discriminate; none. |
| Global, finite algebraic ideal square | Discrete zero-dimensional M | Indicator e of M\{x} satisfies e²=e; every f∈Iₓ equals ef, so Iₓ²=Iₓ and differential=0 | Pass; no infinite-sum ideal product used. |
| Empty/zero-dimensional geometry | Empty M; one point | Empty M has no x to instantiate; one point has I=0, cotangent=0 and derivations=0 | Pass; none. |
| Cotangent equivalence and its prescribed map | ℝ at 0, class of 3x+x² | Both class-to-differential and target covector evaluate v as 3v; a rescaled map would give 6v at scale 2 | Pass; prescribed equation excludes rescaling. |
| Smooth section module/scalar towers | Trivial line, f=x, s=2, x=3 | (f·s)(3)=6; with constant scalar 5, both tower orders give 30 | Pass; native section carrier retained. |
| Restriction and point evaluation of section multiplication | Same section restricted to (2,4) | Restrict(fs)(3)=6=f(3)restrict(s)(3) | Pass; none. |
| First-jet carrier | s=1+2x and t=1+2x+x² at 0 | Both jets are (1,2); second derivatives are 0 and 2 | Pass; first jet does not encode second derivative. |
| Jet exact sequence/connection splitting | Trivial line with ∇=d+a dx | j¹s=(1,2); splitting derivative component is 2+a, projection remains 1; at a=2 gives 4 | Pass; splitting depends on connection. |
| First-jet product rule | f=x, s=1+2x at 0 | d(fs)=1; f ds+s df=0·2+1·1=1 | Pass; omitting the zero-order term gives 0. |
| derivationVectorField evaluation | D=∂, f=x², x=3 | (Df)(3)=6; field value 1 acts on df₃ as 6 | Pass; none. |
| Smoothness of algebraic derivation field | D=x∂ on ℝ | Field x↦x is smooth; at 0 and 2 coefficients are 0 and 2 | Pass; field not merely pointwise arbitrary. |
| Derivation equivalence and linearity | D=∂, scalar 5 | e(5D)=5e(D); applying to x² at 3 gives 30 on both sides | Pass; zero/rescaled arbitrary correspondences excluded. |
| Complex derivation dictionary | Xu=10, Yv=6, Yu=5, Xv=8 | δ(u+iv)=(10−6)+i(5+8)=4+13i | Pass; minus sign in real component necessary. |
| Complex structure on real pair | (X,Y)=(1,2) | J(X,Y)=(−2,1); J²(X,Y)=(−1,−2)=−(X,Y) | Pass; none. |
| Derivation Lie bracket and Leibniz law | X=x∂, Y=∂ | [X,Y]=−∂; applied to x gives −1; reversing bracket gives 1 | Pass; convention fixed. |
| Differential operators via iterated commutators | P=∂², multiplication by x | [P,x]=2∂, [[P,x],x]=2Id, third commutator=0 | Pass; exact order detected. |
| Differential jet evaluation/local coefficients | P=∂+3, f=x² at 2 | Pf=4+12=16; first jet (4,4) gives 4+3·4=16 | Pass; not determined by derivative alone. |
| Density transpose/formal adjoint | P=x∂ with dx | P*=−x∂−1; on constant 1 gives −1, whereas −x∂ gives 0 | Pass; divergence term retained. |
| Principal symbol composition | ∂ followed by ∂ | Fourier symbols (iξ)(iξ)=−ξ²; ∂² has symbol −ξ² | Pass; none. |
| Matrix leading commutator | A=e₁₂, B=e₂₁, order zero | AB=diag(1,0), BA=diag(0,1); commutator=diag(1,−1) | Pass; no scalar order drop for arbitrary matrices. |
| Laplace-type scale and Dirac-square convention | −c∂², ξ=2, c=1 or 2 | Principal values 4 and 8; (i∂)²=−∂² gives 4 | Pass; positive scalar normalization retained. |
| Bochner connection versus density adjoint | Circle weight exp(sin x)dx, scalar weighted Laplacian | Drift at 0 is −∂; Bochner coefficient is 1/2, so metric-compatibility defect at 0 is 1, not 0 | Pass; canonical-density hypothesis matters. |
| Peetre finite order locally | Disjoint circles, P on component j equals ∂ʲ | Compact set meets finitely many components, order max j; over all components orders 1,2,3,… are unbounded | Pass; no global uniform order claimed. |
| Peetre's locality condition | Translation Tf(x)=f(x+1) | Bump supported near 1 has Tf(0)≠0 while 0∉supp f | Negative control; hypothesis excludes translation. |
| CoordinateSpace/coordinateDeriv | n=1, f=x³, lists [],[0],[0,0] at x=2 | Values 8,12,12; n=0 admits only the empty index list | Pass; no out-of-range Fin index. |
| mixedDeriv ordering | a(x,ξ)=x²ξ³, one x and one ξ derivative | ∂x∂ξa=6xξ²; at (2,3) both orders give 108 | Pass; smoothness justifies permutation. |
| Local symbol estimates | a=ξ, m=1 | At ξ=2, 2≤√5; first ξ derivative=1 and weight exponent (1−1)/2=0 gives 1 | Pass; no order-zero bound as ξ→∞. |
| Local versus uniform symbol | a=x, K=[−R,R] | Compact x-bound R; all-x supremum ∞ | Pass; IsUniform is substantive. |
| Compact spatial support | a=χ(x) with compact support; a=1 | Outside suppχ values 0; a=1 stays 1 outside every compact set on ℝ | Pass; not mere proper kernel support. |
| HomogeneousSymbol scaling | ξ², m=2, t=2, ξ=1 | a(2)=4=2²a(1); degree-1 alternative gives 2 | Pass; none. |
| Positive-only homogeneity | \|ξ\|, degree 1, ξ=±2 | Both values 2; extending homogeneity to t=−1 would force −2 | Pass; positivity is essential. |
| Assigned value at zero | Degree-zero symbol a(ξ)=1 for ξ≠0, a(0)=0 | Values 1 away from zero and 0 at zero; smooth away, not continuous across zero | Pass; no false global smoothness. |
| FrequencyCutoff bounds and denominators | Standard smooth transition h(t)/(h(t)+h(1−t)) | At t=0,1/2,1 gives 0,1/2,1; denominator positive everywhere because one argument is positive | Pass; no 0/0. |
| FrequencyCutoff wrong models | Step function; smooth overshoot | Step jumps 0→1 and fails smoothness; value 3/2 fails upper bound 1 | Pass; both laws discriminate. |
| ClassicalSymbol remainder equality | a=ξ²+1, terms ξ²,0,1 | N=0 remainder=ξ²+1; after N=3 remainder=(1−χ)(ξ²+1), zero at large ξ | Pass; N=0 and zero covector retained. |
| Classical versus arbitrary order drop | a=⟨ξ⟩^(1/2)+1, proposed degree 1/2 classical leading term | Constant remainder behaves as 1, not O(⟨ξ⟩^(−1/2)); ratio grows as ⟨ξ⟩^(1/2) | Negative control; not every symbol is classical. |
| exists_asymptoticSum, repeated orders | Orders 0,0,−1,…; first two symbols 1,2, then 0 | Choose b=3: remainders at N=0,1,2 are 3,2,0 with orders 0,0,−1 | Pass; antitone need not be strictly decreasing. |
| Borel sum is not pointwise series convergence | aⱼ=(−1)ʲ⟨ξ⟩⁻ʲ, b=1/(1+⟨ξ⟩⁻¹) | At ξ=0: b=1/2; remainders 1/2,−1/2,1/2; raw partial sums 0,1,0,1,… | Pass; asymptotic remainder order, not convergence, is claimed. |
| Compact parameter Borel bounds | Constant family of the preceding symbols | Same seminorms for every parameter; ξ=0 remainders remain ±1/2 | Pass; no parameter-dependent arbitrary cutoff. |
| Oscillatory quantization of identity | u=exp(−x²), a=1, x=0 | Op(1)u(0)=u(0)=1 by Fourier inversion | Pass; normalization excludes zero map. |
| quantizeSchwartzValue of derivative/zero | a=ξ, x=1; a=0 | −iu′(1)=2i/e; zero symbol gives integral 0 | Pass; total integral is used where convergence is proved. |
| Kernel correspondence | Identity versus smooth kernel 1 | Identity kernel is δ(x−y), output u; kernel 1 gives constant ∫u | Pass; not every operator has a smooth kernel. |
| Proper support and smoothing | K(x,y)=exp(−(x−y)²) on ℝ² | K(0,1)=e⁻¹ and support=ℝ²; preimage of compact {0} under first projection is {0}×ℝ, noncompact | Pass; smoothing does not imply proper support. |
| Amplitude reduction | a(x,y,ξ)=y with local cutoffs | δ(x−y)y evaluates to x; reduced operator is multiplication by x | Pass; diagonal leading term correct. |
| Composition convention | a=ξ, b=x | ξ#x=xξ−i; x#ξ=xξ; [D,x]=−i | Pass; sign fixed. |
| Adjoint lower-order correction | P=exp(ix)D, input exp(2ix) | P*exp(2ix)=exp(ix); using conjugate leading symbol alone gives 2exp(ix) | Pass; coefficient derivative necessary. |
| Ordered matrix commutator formula | p₁=p₂=ξ(A+sin x B), A=e₁₂,B=e₂₁ | Actual [P,P]=0; ordered first correction cancels to 0; reordered scalar bracket at (0,1) gives diag(−i,i) | Pass in roadmap; source error recorded. |
| Global coordinate transformation | y=exp x, leading symbol ξ², input x | Pulled-back y-quantization gives (−∂²+∂)x=1; x-quantization gives −∂²x=0 | Pass mathematically; R03 supplies locators. |
| Principal-symbol exact sequence | P=−∂²+∂ and Q=−∂² | Same degree-2 symbol ξ²; P−Q=∂ has order 1, not smoothing | Pass; kernel/order drop correctly stated. |
| Full-symbol recovery | a(x,ξ)=χ(x) | exp(−ixξ)Op(a)(exp(ixξ))=χ(x) | Pass; exact only for full quantization. |
| Output support iff full symbol support | χ supported in K; identity with test outside K | χf vanishes outside K; identity returns that nonzero test outside K | Both directions discriminate; none. |
| Square partition quantization | χ₁=χ₂=1/√2 at a point | Σχⱼ²=1; Σχⱼ=√2 | Pass; symmetric construction has correct weight. |
| Continuous lift of principal homotopy | aₜ=(1+t)ξ², 0≤t≤1 | Lift Pₜ=−(1+t)∂² has symbol aₜ; coefficient changes by \|t−s\| | Model passes; source locator still R03. |
| schwartzToSobolev native comparison | u=0; arbitrary Schwartz u | Distribution component is u, hence at u=0 evaluates every φ to 0 | Pass; real definition, not a free witness. |
| exists_quantizeSobolev | χ multiplication, s=m=0 | ‖χu‖₂≤‖χ‖∞‖u‖₂; if χ=0 both sides 0 | Pass; compact local coefficients suffice. |
| exists_quantizeUniformOrderZero | a=1, nonzero fiber; zero fiber | Identity operator norm 1; on the zero space norm 0 and both pairings 0 | Pass; degenerate fiber harmless. |
| Necessity of uniform control for global L² | a=x, unit L² bumps supported in [k,k+1] | ‖Op(a)uₖ‖₂≥k while ‖uₖ‖₂=1 | Pass; no global bound for merely local order zero. |
| Weak space versus zero-boundary closure | Constant 1 on [0,1] | Weak derivative 0; traces (1,1), so in W¹,p but not W¹,p₀ | Pass; native zero-extension result not overused. |
| Integer-order versus fixed first-order norm | u=exp(iλx) on circle | ‖∂ʲu‖p=\|λ\|ʲ‖u‖p; order k=2 grows λ² rather than λ | Pass; all derivative orders retained. |
| Critical W^(n,1) endpoint | uε(x)=φ(x/ε) | ‖∂ⁿuε‖₁=‖∂ⁿφ‖₁, ‖uε‖∞=‖φ‖∞≠0; support shrinks | Pass; continuous embedding does not give compactness at the endpoint. |
| p=∞ smooth density exclusion | u=\|x\| in a chart | Weak derivative sign x; any continuous approximation to it has essential-sup error at least 1 | Pass; finite-p density restriction matters separately from q. |
| Banach couple sum/intersection | A₀=A₁=ℂ, u=1 | Sum quotient norm inf(\|a\|+\|b\|)=1; intersection max norm=1; naive sum=2 | Pass; Hausdorff common ambient carrier used. |
| Complex interpolation endpoint weights | Endpoint norms \|z\| and 2\|z\|, θ=1/4 | Interpolated norm of 1 is 2^(1/4), not 2^(3/4) | Pass; θ direction fixed. |
| Strip decay condition and quotient norm | Equal endpoints, Fε(z)=exp(ε(z−θ)²) | Fε(θ)=1; boundary maxima→1 as ε→0; constant function has no decay | Pass; infimum gives norm 1 without an inadmissible minimizer. |
| Real K-functional | Equal scalar endpoints, u=1, t=1/4,1,4 | K(t,1)=min(1,t)=1/4,1,1 | Pass; both decomposition regimes tested. |
| Real interpolation norm normalization | θ=1/2,q=2, u=1 | Integral over (0,1) is 1 and over (1,∞) is 1; squared norm 2, norm √2; q=∞ norm 1 | Pass; dt/t and unnormalized norm fixed. |
| Interpolation exponent/order | p₀=2,p₁=4,θ=1/2; s₀=0,s₁=2,θ=1/4 | 1/p=3/8 so p=8/3; s=1/2, not 3/2 | Pass; none. |
| Dyadic Besov definition/partition equivalence control | One weighted coefficient at j=2, s=0 then 1 | Norms 1 then 4; zero sequence norm 0 | Pass; wrong weights excluded. |
| Bessel–Besov sandwich distinguishes q | N unit weighted coefficients | ℓ¹ norm N, ℓ∞ norm 1; for p=2 the corresponding Hilbert norm √N | Pass; bounds 1≤√N≤N. |
| Besov smooth density | Circle u=Σ2⁻ʲexp(i2ʲx), s=1,p=2,q=∞ | Weighted blocks all 1; every partial-sum tail has norm 1; smooth v has weighted blocks→0, distance at least 1 | Fails; R01 restricts q or uses little Besov. |
| Repaired finite-q density | Weighted coefficients cⱼ=2⁻ʲ, q=2 | Tail after N has norm 2⁻ᴺ/√3→0; full constant sequence is not in ℓ² | Pass after R01; add negative control above. |
| Little Besov endpoint closure | Weighted coefficients 1/j versus 1 | Sup tail 1/(N+1)→0 versus 1; only the first lies in the smooth closure | Pass after R01; full B^s_(p,∞) retained. |
| Bundle coordinate-transition norms | Shear (x,y)↦(x+ky,y), det=1 | L² norm unchanged; derivative coefficients acquire k and higher-order norms depend on k | Pass; volume control alone is insufficient. |
| Morrey exponent and integer margin | n=3,k=2,p=2; n=2,k=2,p=2 | Margins 1/2 and 1; second case permits β<1, not an asserted C¹ endpoint | Pass; strict endpoint qualification retained. |
| Full Hölder norm | Constant 1 | Sup norm 1, Hölder seminorm 0; full norm 1 | Pass; seminorm alone is not a norm. |
| Little Hölder closure | u=\|x\|^α near 0 | Quotient \|u(h)−u(0)\|/\|h\|^α=1 for every h≠0; does not tend to 0 | Pass; full and little spaces differ. |
| Hölder exponent discrimination | β=α+1/2 or α−1/2, h=1/16 | Quotients \|h\|^(β−α)=1/4 or 4 | Pass; stronger exponent gives vanishing ratio. |
| Zygmund distributions | δ₀ on ℝ, dyadic block constant c | ‖Δⱼδ₀‖∞=c2ʲ; s=−1 weighted value c, s=0 grows c2ʲ | Pass; distribution carrier necessary. |
| Ehrling lower-order term | Nonzero constant section, ε=1/2 | 1≤1/2+Cε requires Cε≥1/2; omitting lower-order term says 1≤1/2 | Pass; none. |
| Smoothing local regularization | δ₀ and Gaussian kernel | Output exp(−x²), value at 0 is 1 and all derivatives exist | Pass; smoothness is substantive. |
| Compact negative-order maps | Circle multiplier (1+k²)⁻¹ᐟ² versus identity | Eigenvalues→0 versus constant 1; finite-rank tail norm tends to 0 only in first case | Pass; R02 is locator-only. |
| Compact equivariant averaging | Trivial group; reflection on multiplication by x | Average T=T; reflection average is (x−x)/2=0; identity averages to 1 | Pass; normalized Haar and conjugation used. |
| Ellipticity at nonzero covectors | Principal ξ² at ξ=2; zero map on ℂ | Value 4 has inverse 1/4; zero map has kernel ℂ | Pass; inverse hypothesis substantive. |
| Zero-dimensional ellipticity | n=0; unequal fiber dimensions allowed | There is no ξ≠0; inverse identities are quantified over the empty set, homogeneous coefficient at 0 is 0 | Pass; no invalid rank-equality inference. |
| exists_inversePrincipalSymbol | ξ=2 and t=2 for order 2 | Both products 4·1/4=1; b(4)=1/16=2⁻²b(2); at ξ=0 assigned b=0 with no inverse equation | Pass; two sides and zero exclusion checked. |
| Two-sided parametrix | Circle L=1−∂², modes k=0,1,2 | L multiplier 1,2,5; inverse 1,1/2,1/5; products all 1 | Pass; none. |
| Smoothing defect for noninvertible elliptic operator | Circle Δ, constant mode | Green multiplier 0 at k=0; ΔG=0=Id−Π there, not Id=1 | Pass; kernel projection retained. |
| Elliptic a priori estimate | u=1 on circle | Δu=0 but ‖u‖₂=√(2π); a lower-order norm is necessary | Pass; no false coercivity. |
| Solvability/cokernel orthogonality | Δu=1 on circle | ∫Δu=0 whereas ∫1=2π | Pass; orthogonality obstruction is exact. |
| Overdetermined ellipticity distinction | d on scalar functions, ξ=(1,0) in ℝ² | Symbol z↦(iz,0) injective rank 1, not onto ℂ²; in ℝ¹ nonzero ξ gives an isomorphism | Pass; injective symbol not conflated with two-sided ellipticity. |
| Nonlinear bootstrap before Schauder | n=4, initial exponent 3 | 1/12=1/3−1/4; 1/6=1/12+1/12; W¹,⁶ gives margin 1−4/6=1/3 | Pass; prior positive regularity is produced. |
| Elliptic powers/strict positivity | L=1−∂², k=0,1,2 | Eigenvalues 1,2,5; L⁻¹ᐟ² gives 1,1/√2,1/√5; L⁰ gives 1,1,1 | Pass; no zero-eigenvalue division. |
| Sobolev domains of powers | Mode k of L | L^(s/2) multiplies by (1+k²)^(s/2); its graph weight matches H^s | Pass on model; general source comparison uncertified. |
| Strong parameter resolvent scaling | (ξ²−λ)⁻¹, (ξ,λ)↦(2ξ,4λ) | New value is 1/4 old value; at ξ=0, λ=−1,−2 values are 1 and 1/2 | Pass; combined homogeneity does not allow ξ-only simplification. |
| Weak rescaling requires derivative control | b(r,ξ)=r/(1+rξ²), r≥0 | ∂rb(0,ξ)=1; ∂r²b(0,ξ)=−2ξ² | Pass as model; Grubb–Hansen's exact symbol indices remain unverified. |
| Shifted product Laplacian | L₁ eigenvalue 2, L₂ eigenvalue 5 | L₁⊗1+1⊗L₂−1 has value 6, not 7 | Pass; shift counted once. |
| Change of order/principal normalization | Scalar symbol 2ξ, ξ≠0 | New symbol (2ξ)/\|2ξ\|·\|ξ\|=ξ; at ξ=2 its squared modulus is 4=\|ξ\|², not 16 | Pass; homotopy preserves invertibility. |
| Product-symbol block sign | A=[[3,−4],[4,3]] | A*A=25Id with off-diagonal 0; replacing −4 by +4 gives off-diagonal 24 | Pass; sign excludes wrong product. |
| Oddness versus self-adjointness | Q=[[0,2],[0,0]], γ=diag(1,−1) | γQ+Qγ=0 but Q*=[[0,0],[2,0]]≠Q | Pass; roadmap does not infer self-adjointness from grading. |
| Angular product cutoff ellipticity | Unit direction on either factor axis | One active square contribution is 1; normalized estimate is ≥1/2, not 0 | Pass; no lost axis. |
| Cutoff ordering and adjunction | ε=1/4,R=4 at modes (2,16),(3,16) | Arguments 16/65<1/4 and 144/265>1/2 give cutoff values 0 and 1; shifted actions give 0 versus 2 | Pass; cannot commute cutoff through a factor blindly. |
| Product homotopy compact tail | Spectral λ>R² with R=4 | λ⁻¹ᐟ²<1/4; finite eigenspace cutoff leaves operator norm ≤1/R→0 | Pass; spectral tail supplies compactness. |
| Product index kernel decomposition | Factor kernel/cokernel dimensions (2,1),(3,2) | Even dimension 2·3+1·2=8; odd 2·2+1·3=7; 8−7=1=(2−1)(3−2) | Pass; both grading pieces needed. |
| Equivariant/trivial/zero index | Trivial group; identity; zero Hilbert factor | Representation dimensions reduce to previous product; identity has 0−0=0; zero factor gives 0 on both sides | Pass; no nonzero-rank assumption used. |
| Elliptic-complex symbol exactness | Circle de Rham symbol at ξ=1 and ξ=0 | At 1 map is multiplication by i, exact; at 0 map is 0, exactness not required | Pass; excludes zero section. |
| Hodge/Green decomposition | Circle modes k=0,1,2 | Green values 0,1,1/4; ΔG values 0,1,1 equal Id−Π | Pass; harmonic zero mode retained. |
| Even/odd Laplacian types | D:ℂ→ℂ², D(z)=(z,0) | D*D=1 on ℂ; DD*=diag(1,0) on ℂ² | Pass in roadmap; source's repeated D*D is a misprint. |
| Quotient metric and degree | Cyclic rotations of circle, order d | Cover length 2π; quotient length 2π/d; local length element unchanged | Pass; free-action hypothesis essential. |
| Normalized pullback | d=4, constant 1 | J=1/2 times pullback; cover squared norm (1/4)2π=π/2 equals quotient squared norm | Pass; factor 1/d would give π/8. |
| Scalar realization/weak energy identity | exp(ikx), k=0,1,2 | Δ eigenvalues 0,1,4; q(u,u)/‖u‖²=0,1,4 | Pass; previous Friedrichs prerequisite unnecessary. |
| Smooth-core completion versus H² operator domain | Fourier coefficients on circle | H¹ weight 1+k²; H² weight (1+k²)²; at k=2 these are 5 and 25 | Pass; form and operator domains are distinct. |
| Reducing invariant domain and quotient modes | Rotation group order d | Invariants have k=dj; averaging other k gives 0; Δ values k²=d²j² match quotient | Pass; averaging preserves H². |
| Trivial subgroup control | H={1} | d=1, J=identity, norm factor 1 and spectrum unchanged | Pass; none. |
| Left inverse-pullback action | Noncommuting q=(12), r=(23) on delta functions over S₃ | q·(r·δe)=δqr=δ(123); reversing inverse convention gives δ(132) | Pass; group-action direction fixed. |
| Almost conjugacy and permutation characters | Conjugate order-two subgroups of S₃ | Characters on identity, transposition, 3-cycle are 3,1,0 for both | Pass; not tested only on abelian groups. |
| Transplantation of eigenspaces/resolvents | Unitary intertwiner on eigenspace λ, λ=4 | Both resolvents at −1 multiply by 1/(4+1)=1/5; form value 4‖u‖² is preserved | Pass; bounded intertwiner plus domain transport used. |
| Wavefront definition | Smooth 1; δ₀ | Smooth localized Fourier transform rapidly decays, WF empty; δ Fourier value 1 in every direction, WF all nonzero covectors over 0 | Pass; zero covector excluded. |
| Conormal direction control | δ(x) on ℝ² | Singular covectors are (ξ,0), ξ≠0; no pure nonzero y covector | Pass; direction is not just singular support. |
| Microlocal elliptic regularity | Identity on δ; smoothing on δ | WF(Idδ)=WFδ; Gaussian smoothing has empty WF | Pass; characteristic exception needed only for nonelliptic operator. |
| Pullback noncharacteristic condition | Projection (x,y)↦x | Transpose sends η to (η,0), zero only when η=0; normal set empty | Pass; δ pulls back to δ(x). |
| Forbidden pullback/product | Diagonal map and opposite conormals | Transpose sends (η,−η) to 0; δ₀·δ₀ has matching opposite covectors | Negative control; hypotheses exclude undefined operation. |
| Tensor product zero-factor terms | δ₀⊗1 | WF contains (ξ,0), ξ≠0; naïve product WFδ×WF1 would be empty | Pass; enlarged cone retains zero factors. |
| Proper pushforward/critical points | Compact smooth density of integral 1 mapped constantly to 0 | Input WF empty; output δ₀ has all nonzero covectors; df=0 creates the required zero-preimage term | Pass; fixed support cone includes it. |
| Pushforward identity/nonproper control | Identity; noncompact constant density to point | Identity pairing unchanged; latter fiber has infinite volume and noncompact support | Pass; properness on support is substantive. |
| Fixed target cone in pushforward continuity | Same constant map, fixed C; u=0 versus a mass-1 bump | Individual output WFs empty versus all nonzero at 0; fixed C gives the same admissible full cone for both | Pass in roadmap; source issue recorded. |
| Source (5.2) locator | Printed pp. 512 and 513 | (5.2) appears on 512; page 513 starts after it | R02 changes both page references to 512. |
| Equivariant Fredholm local constancy | Z₂ on ℂ² by diag(1,−1), Tₜ=diag(1+t,2−t), 0≤t≤1 | Both eigenvalues stay ≥1; kernel/cokernel multiplicities in both characters stay 0. Crossing a zero eigenvalue leaves the invertible neighborhood | Pass; a common Fredholm ball, not independently chosen radii per irreducible, is used. |
| Factor versus product graph domains | Fourier modes (0,k) on the two-torus | First derivative multiplier 0; product H¹ weight 1+k². Coefficients 1/k give finite L² sum but divergent H¹ sum | Pass; an amplified factor domain is larger than product H¹. |
| Product graded square | Dₚ=[[0,3],[3,0]], γ=diag(1,−1), Dq=[[0,4],[4,0]] | Dₚγ+γDₚ=0, so cross terms vanish; (Dₚ⊗1+γ⊗Dq)²=(9+16)Id=25Id | Pass; required anticommutation is explicit. |

## Not verifiable

The review is complete with the following source limits; it is not parked for source retrieval. Every cited work was attempted through the sources service. No inaccessible text was guessed, and no repository manifest was created or edited.

- **hormander:** Theorem 5.2.1, *The Analysis of Linear Partial Differential Operators I*, second edition. A title search incorrectly resolved to Smoller's SIAM book review; that is not evidence for Hörmander's theorem. Retrying the actual Springer book DOI 10.1007/978-3-642-61497-2 returned uncertified/paywalled. The erroneous review request was removed. The full local kernel theorem's source text remains unread; the accessible Dyatlov statement and Melrose tempered theorem have the limits described above.
- **adams_fournier:** *Sobolev Spaces*, second edition, Theorems 4.12 and 6.3. The service found no legal text by the supplied bibliographic citation. The README expressly cites a closed text; the exact theorem numbering, complete endpoint hypotheses and their proofs were not certified.
- **brezis:** Theorems 8.2, 8.7, 8.12, 9.9 and 9.16. The service classified the Springer citation as uncertified/paywalled. Not requested again.
- **shubin:** Chapter II §§9–11 of *Pseudodifferential Operators and Spectral Theory*, second edition. Springer citation classified uncertified/paywalled. The contour/power/general parameter-symbol claims remain uncertified; not requested again.
- **grubb:** *Distributions and Operators*, chapter 8. Both the cited web.math.ku.dk author URL and its www.math.ku.dk counterpart timed out through the service. No statement or page in that chapter was certified.
- **grubb_hansen:** *Complex powers of resolvents of pseudodifferential operators*, Definition 2.1 and §4. Both corresponding Copenhagen author hosts timed out. The precise weak-parameter derivative estimates and version numbering could not be compared with the README.
- **seeley:** *Complex powers of an elliptic operator*, pp. 288–307. DOI lookup reached the AMS volume landing page but produced no readable legal text. The spectral model computations above do not certify Seeley's general contour proof.
- **pde_discussion:** The cited Zulip discussion was not readable through the source service. It is background about formalization, not a mathematical proof input.

Outstanding missing-text entries are consolidated under their existing keys in the scratch request file. The successful institutional copy of Atiyah–Singer removes its initial failed request. Uncertified Springer books are not requested again. Ownership against the unsupplied open ContactGeometry/RelativisticQuantumFieldTheory files is also unverified, as specified above.

## Source issues

These issues are in the sources, not additional findings against the roadmap. The roadmap already avoids the incorrect matrix formula and variable-support pushforward cone.

- **Misprint** in taylor at Lecture I (1.14), printed p. 5: the source says the integral of the heat semigroup equals the inverse of its negative generator; it should be the negative of that integral for the displayed Laplacian convention; affects the proof.
- **Misprint** in taylor at Lecture I (2.8), printed p. 8: the source says the commutator order is m₁+m₁−1; it should be m₁+m₂−1; affects a stated result.
- **Error** in taylor at Lecture I (2.9), printed p. 8: the source says the scalar Poisson-bracket formula also holds for pointwise commuting matrix symbols; it should be restricted to scalars, or retain the ordered second product ∂ξp₂∂xp₁ in the commutator formula; affects a stated result.
- **Error** in bdh at Theorem 6.3, printed pp. 21–22: the source says the fixed codomain cone depends on the variable input's support; it should be defined using the fixed closed set C for the stated continuity map; affects a stated result.
- **Gap** in bdh at proof of Theorem 6.3, printed p. 22: the source says to choose a compactly supported cutoff equal to one on all of C; it should be one near the fixed compact intersection K, since C may be noncompact; affects the proof.
- **Misprint** in berard at Theorem 14, printed p. 158: the source says the inverse fixed-vector map for K has codomain Vᴴ in its parenthetical type; it should be Vᴷ, consistently with the preceding construction and theorem conclusion; affects a stated result.
- **Misprint** in atiyah_singer at §7, printed p. 521: the source says both even and odd Laplacian sums are D*D; it should be D*D on even sections and DD* on odd sections; affects a stated result.

The heat-sign witness has eigenvalue −1: the integral is ∫₀∞e⁻ᵗdt=1, whereas the inverse eigenvalue is −1. For the order misprint, multiplication by sin x has order 0 and D² has order 2; their commutator has order 1, not −1. The matrix counterexample and the even/odd types are computed in the table. For the cutoff gap take the identity map with C=ℝ: it is proper, but no compactly supported function equals one throughout ℝ. Bérard's printed parenthesis and Atiyah–Singer's repeated D*D were checked visually, rather than inferred from OCR.
