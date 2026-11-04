# Review of PseudodifferentialOperators (pull request #952 at 4806639)

**Verdict:** needs changes

## R01 (P1) — The symbol cutoffs do not preserve adjoints

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:831–869`, especially “the full graded operators D and D_ε are self-adjoint”.

**Claim:** Applying the same scalar cutoff to the full left symbols of P and P* produces adjoint off-diagonal blocks.

**Witness:** On the flat two-torus take P=e^(ix)D_x. With ε=1/4, R=4, the prescribed multiplier has f(2,16)=0 and f(3,16)=1. On mode (3,16), the proposed adjoint block has coefficient 2; the actual adjoint has coefficient 0.

Indeed P*=D_x e^(−ix). Left quantization of the modified symbols gives P_f=e^(ix)D_x f(D_x,D_y) and B_f=e^(−ix)(D_x−1)f(D_x,D_y). Thus P_f* sends mode (k,l) to (k−1)f(k−1,l) times mode (k−1,l), whereas B_f gives (k−1)f(k,l). Both chosen frequencies lie above the radial transition; the angular arguments are 16·4/260=16/65<1/4 and 16·9/265=144/265>1/2. The principal symbol of P already satisfies both required norm identities. The same defect appears locally in the adjoint expansion as derivatives of the cutoff, and compact chart cutoffs or group averaging do not impose the missing adjoint equation.

**Repair:** Construct one modified even-to-odd block and define the other as its actual formal adjoint, or symmetrize the entire odd operator before claiming self-adjointness. Establish the H¹→L² error estimate for the resulting adjoint correction. Alternatively delete the assertion about D_ε being self-adjoint: the stated comparison of the Fredholm indices of D_ε⁺ and D⁺ only needs the odd blocks and their norm convergence. With the first repair, the disputed reverse coefficient is 0 on the displayed mode on both sides; with the second, the false equality is no longer asserted. Keep the counterexample as a Check.

## R02 (P1) — The supplier graph has a cycle through the differential core

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:27–34`: “K5a's distributional action and Laplace analysis consume the differential-operator core; P1.1 and P2–P7 consume K5a's analytic scale.”

**Claim:** PseudodifferentialOperators and ComplexKahlerGeometry can each be a supplier of the other by interleaving their layers.

**Witness:** On main, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1650–1663` explicitly orders PDO P1.0 before K5a's analytic scale and then that scale before PDO P1.1/P2 onward. The two roadmap-level edges form a directed 2-cycle.

This violates the required single direction of supply even though the finer mathematical ordering is intelligible. There is another roadmap-level return edge through RiemannianGeometry: this README consumes R4.7 at line 896, while that roadmap's main README at line 144 consumes PDO P1. The mechanical checker reports zero problems because its treatment of main suppliers does not expose these return edges; that output is not evidence that the documented roadmap graph is acyclic.

**Repair:** Move the differential/jet/formal-adjoint floor to an earlier owner (an explicitly scoped Part II of the appropriate existing smooth-bundle/differential-geometry roadmap), and have ComplexKahlerGeometry, RiemannianGeometry and this roadmap consume that owner. Keep the analytic PDO development after its suppliers. Record the ownership transfer and update the supplier references; do not rebuild K5a here or add a reverse dependency to an existing roadmap. On the exhibited graph the repaired edges are core→CKG, core→RiemannianGeometry, CKG→PDO and RiemannianGeometry→PDO, with no PDO→supplier edge.

## R03 (P1) — UO-D06 is not supplied by OperatorTheory on main

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:918–932`: “Consume UnboundedOperators UO-D06”.

**Claim:** The cited existing roadmap provides the closed-form representation, shift independence and Friedrichs completion used in P7a.

**Witness:** Main `9c6e95d` has no `TauCetiRoadmap/OperatorTheory/UnboundedOperators/` directory and no UO-D06 or closedFormOperator target under OperatorTheory. The supplied open OperatorTheory revision has UO-D06 at README line 172; it is not main.

The pins likewise do not contain this closed-form/Friedrichs construction. The open revision of an existing roadmap is not an authorized replacement for its main-branch contract under this review's supplier rules. The mathematical statement quoted here agrees with the open revision, but that does not make it an available supplier. No matching declared gap exists.

**Repair:** Register a precise gap owned by OperatorTheory (the closed Hermitian form representation with its graph characterization, shift independence and the semibounded smooth-core completion comparison needed here), in both the plan's gaps and the README's exact supplier contracts. Alternatively cite a genuine pinned or main-branch owner if one is supplied. Do not silently rely on the open revision. Test the contract on q(u,v)=⟨u,v⟩, j=id: it must select A=id independently of admissible shift, and on the circle energy form it must select −∂² with domain H². This changes an unavailable prerequisite into an explicit owned contract, not a fabricated implementation.

## R04 (P2) — Generic interpolation has two owners

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:479–511`: “Build the complex interpolation space” and “Also build the real K-method space”.

**Claim:** This roadmap owns compatible couples, their sum/intersection, the strip quotient, the K-method, and the generic completeness/functorial theorems.

**Witness:** The supplied open `TauCetiRoadmap/NoncommutativeIntegration/README.md:423–459,489–501` constructs the same compatible couples, strip quotient, K-functional and real-method spaces, with the same norms and generic operator theorems.

The overlap is by object, not spelling: on the identical couple (ℂ,ℂ), both definitions give K(t,z)=min(1,t)|z| and the complex interpolation norm |z|. A distribution-space ambient realization does not make a second generic interpolation library a different object.

**Repair:** Assign the generic construction to one earlier owner and import it by section. Since NoncommutativeIntegration is not an allowed earlier supplier here, do not add an upward dependency to it. One valid resolution is to retain the generic targets here with an explicit ownership agreement and change the later NoncommutativeIntegration targets to consume them; another is a shared earlier owner. Keep the Euclidean Bessel/Besov and bundle retraction comparisons here. Require both users to recover the same K-functional and strip norm in the scalar-couple test above.

## R05 (P2) — Borel asymptotic summation is statable but absent

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:296–300`; `TauCetiRoadmap/PseudodifferentialOperators/Suggested.lean:17–30,198–222`.

**Claim:** The acceptance file contains the statable headline theorems of the symbolic calculus.

**Witness:** A scratch declaration using the file's existing Symbol, a decreasing sequence of real orders tending to −∞, and actual remainder symbols elaborated successfully. It requires no new carrier or stand-in. No summation theorem appears in Suggested.lean or its omissions list.

**Repair:** Add the asymptotic-summation headline on the existing Symbol carrier, with the order sequence and remainder equalities explicit. The checked signature has the following mathematical content: for a_j∈S^(m_j), m_j decreasing to −∞, there is b∈S^(m_0) such that b−Σ_(j<N)a_j belongs to S^(m_N) for every N. Keep the parameter-family extension precisely quantified in the README. For a₀=1 and all later a_j=0, b=1 gives remainder 1 at N=0 and 0 at N≥1; this also checks the indexing. The probe establishes statability, not the proof.

## R06 (P3) — Most targets have no claim-level source locator

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:96–300,433–594,1002–1020`.

**Claim:** The references at the end identify the sources for the differential, Sobolev and interpolation targets.

**Witness:** P1.0's ideal-square identity, first jets, global derivations and Bochner connection have no theorem/page locator. The two Thomas Mark courses at lines 1017–1020 have no identifiable edition, year, URL or exercise numbers. There is no sources.toml.

**Repair:** Attach exact legal-source locators to each theorem and definition/API group, and record the cited works under stable source keys. Specify which course notes and which exercises support the course examples. For example, attach Taylor I.(2.5)–(2.7), printed p. 8, to the composition expansion and BDH v2 Proposition 5.1, pp. 13–14, to the Euclidean pullback theorem; separately source the manifold/bundle extensions. Retest each locator against its own hypotheses. The source table below distinguishes actual source verification from computations and from unavailable texts; broad chapter references are not certification of all the claims attributed to them.

## R07 (P3) — The README lacks the required API/Check/dependency structure

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:1–10,283–310,968–1000` (representative of all layers).

**Claim:** The prose provides a reviewable specification for each newly defined object.

**Witness:** There are zero `**Checks.**` lists, zero `*Needs:*` lines and zero layer-ending Examples/Dependencies sections. Symbol classes, classical expansions, wavefront sets and interpolation carriers have no three explicit discriminating Checks apiece.

**Repair:** Use the specified title/Summary, separate scope, conventions and exact supplier contracts, add the build-order paragraph, and structure each layer with its definition API, at least three computed positive/negative Checks, claim-level dependencies, Examples and Dependencies. Preserve the substantial existing mathematics. For symbols, suitable checks are 1∈S⁰, ξ∈S¹ but ξ∉S⁰, and x∈S⁰ locally but not uniformly; their bounds are 1, unbounded |ξ|, and unbounded |x| respectively. For homogeneous symbols test ξ², its zero-covector convention, and failure of degree-1 homogeneity at t=2 (4≠2). These discriminate the definitions rather than restate them.

## R08 (P3) — README/Lean names and declaration documentation disagree

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/Suggested.lean:49–268`, particularly lines 231 and 238.

**Claim:** Every kept Lean name is identified in the README, and each declaration has its mathematical docstring in README layer order.

**Witness:** Twenty-five of the 26 explicit declaration names are absent from the README; Symbol alone occurs. integrable_quantizeSchwartz and contDiff_quantizeSchwartzValue have no docstrings. There are no required layer section comments, and the P7 path result precedes P2.

**Repair:** After removing padding, name each remaining headline and necessary definition in the corresponding README paragraph, add the two missing mathematical docstrings, and order/tag the Lean sections by the README's layers. Re-run the name comparison in both directions. This repair is bookkeeping: the printed signatures themselves retain the needed manifold and finite-dimensional hypotheses.

## R09 (P3) — Remove supporting API statements from the acceptance file

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/Suggested.lean:80–101,125–137`.

**Claim:** derivationVectorField_apply, derivationVectorField_smul and the ordinary Fredholm path corollary are headline acceptance tests.

**Witness:** The first closes in a scratch copy with one exact application of congrArg to the pinned inverse law at `TauCeti/Geometry/Manifold/DerivationBundle.lean:468`. The next is pointwise scalar compatibility; the path result composes native index continuity with connectedness.

**Repair:** Delete these supporting declarations from `Suggested.lean`; keep their mathematics as README API targets or Checks and cite the native inputs. Do not replace them with proved-in-place padding. The substantive global derivation equivalence and elliptic mapping headlines remain the acceptance tests. For D=∂, f(x)=x² at x=3 the inverse-law calculation remains 6=6; for (2+x)D at x=3 the scalar law remains 5=5; for the constant family id_ℂ, both indices remain 0.

## Verified sound

This is an AI review of the entire specified folder at the stated head. It does not approve or merge the pull request. The findings are repairable, so the verdict is needs changes rather than rejected.

**Mechanical evidence.** The head is exactly 48066392139ba8a765ef7898bd4e38ecf36c33e2. The diff outside the roadmap folder is empty and the worktree remains unchanged. The worker's gate reports every check passing, including the targeted build, import/form scans, stray files and metadata. The dependency check was rerun and printed:

```text
depcheck: 202 roadmaps, 1347 edges, 0 problem(s)
```

No UPWARD or CYCLE line was printed. R02 documents the separately resolved return edges through main; this is a limitation of the clean mechanical result, not an invented failing gate. There are no declared gaps, sorry'd data, set_option directives or computational algorithm deliverables in the two reviewed files. No copied passage was detected in the readable-source comparisons. The frequency recursions and finite examples are mathematical constructions, not executable algorithms.

The required import was built with `lake build TauCeti.Geometry.Manifold.DerivationBundle` (2857 jobs). `lake env lean` on the original Suggested.lean exited 0 with exactly nine sorry warnings and no other diagnostics. A scratch copy containing `#check @...` for all 26 explicit definitions, abbreviations, structures and theorems also exited 0. The second-countability, Hausdorff, finite-dimensional and boundaryless hypotheses remain on the global dictionary theorems. Finite-dimensional complex fibers and the intended support/uniformity hypotheses remain on the two boundedness theorems. Definitions that do not need completeness legitimately drop that section variable; no false theorem caused by dropped binders was found. No PR signature was changed.

All nine admitted theorems were tried with the single-tactic alternatives simp, rfl and infer_instance in a scratch copy; none closed. The failed infer_instance branches report that the conclusions are not typeclasses, as expected. Reading the native definitions did not reveal a one-library-lemma proof of those nine full statements. The separate exact probe for derivationVectorField_apply succeeded, as did the additional Borel summation signature probe. These are elaboration/probe results, not claims to have proved the admitted theorems.

**Headline inventory.** P1: ideal-square/cotangent and global real/complex derivation dictionaries, jet/differential-symbol equivalence, Bochner decomposition and Peetre. P2: classical expansions and Borel summation. P3: quantization and the Schwartz kernel theorem. P4: composition/adjoints/global quantization. P5: all-order Sobolev mapping, uniform order-zero boundedness, interpolation/Besov and endpoint embeddings. P6: parametrices, elliptic regularity and Fredholm/solvability. P7: elliptic powers/domains, equivariant product index and elliptic-complex Hodge theory. P7a: finite-deck scalar isospectrality. P8: wavefront characterization, pullback, product and proper pushforward. The real scalar dictionaries, inverse principal symbol and two Euclidean boundedness theorems are represented. The docstring identifies absent geometric operator, manifold-distribution and bundle-Sobolev carriers for the major global results. R05 isolates a definite omission whose complete symbol carrier is already present; the absence of a carrier is not a reason to omit it.

**Pinned objects opened.** Paths below are relative to their library repository. Mathlib pin: 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Tau Ceti pin: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Pin / file and line | Declaration or object actually checked | What it supplies and what it does not |
|---|---|---|
| Mathlib `Mathlib/RingTheory/Ideal/Cotangent.lean:40,52,59,67` | Ideal.Cotangent, toCotangent, mem_toCotangent_ker, toCotangent_eq_zero | The algebraic quotient and kernel; not its geometric identification. |
| Mathlib `Mathlib/Geometry/Manifold/VectorBundle/ContMDiffSection.lean:135,378–395` | ContMDiff.smul_section and the section scalar module | Smooth multiplication and the base-field module; not the requested smooth-function-module dictionary. |
| Tau Ceti `TauCeti/Geometry/Manifold/DerivationBundle.lean:106,163,193,368` | Four chart/Hadamard helpers | They exist but are private; the README explicitly asks to expose them, which is accurate. |
| Same file `:309,351,446,468` | congr_of_eventuallyEq, tangentToPointDerivation_mfderiv, pointDerivationEquivTangentSpace, its inverse law | Finite-dimensional real, Hausdorff, interior-point dictionary; no global smooth-field theorem is supplied by the pointwise equivalence alone. |
| Mathlib `Mathlib/Analysis/FunctionalSpaces/BesselPotentialSpace.lean:47,250,265,279,299` | BesselPotentialSpace, toLpₗᵢ, completeness, Hilbert instance, MemSobolev.toBesselPotentialSpace | Actual distribution/Lp data and weighted equality; Hilbert structure additionally requires an inner-product fiber. |
| Mathlib `Mathlib/Analysis/Distribution/Sobolev.lean:222` | memSobolev_iff_exists_smulLeftCLM_fourier | The p=2 Fourier-weight characterization with a complete complex inner-product fiber, not an arbitrary-p Hilbert theorem. |
| Tau Ceti `TauCeti/Analysis/Sobolev/RellichKondrachov.lean:141` | W1p0.isCompactOperator_valueL | Zero-boundary compactness with finite p; not the general boundary extension theorem. |
| Tau Ceti `TauCeti/Analysis/Sobolev/W1p/Extension.lean:255,299` | W1p0.norm_extendByZeroL, W1p0.hasWeakFDerivOn_indicator | Zero extension retains the norm/weak derivative under zero-boundary hypotheses. |
| Mathlib `Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean:89,97,104` | IsFredholm.eventually_nhds_index_eq, index_continuousAt, index_continuousOn_isFredholm | Native local index constancy; the README correctly consumes it. |
| Tau Ceti `TauCeti/Analysis/Fredholm/SmallPerturbation.lean:243` | IsFredholm.exists_pos_isFredholm_and_index_eq_of_norm_sub_lt | The norm ball needed for product approximation. |
| Tau Ceti `TauCeti/Analysis/InnerProductSpace/Spectrum.lean:119,145` | exists_hilbertBasis_forall_hasEigenvector and its nonzero version | Compact symmetric operators; injectivity is required for nonzero eigenvalues. No unbounded-domain theorem is inferred from it. |
| Mathlib `Mathlib/Analysis/InnerProductSpace/Spectrum.lean:93` | LinearMap.IsSymmetric.conj_eigenvalue_eq_self | Realness of symmetric eigenvalues. |
| Mathlib `Mathlib/Analysis/Complex/Hadamard.lean:612` | norm_le_interp_of_mem_verticalClosedStrip' | Three-lines bound with bounded strip map, holomorphy and ordered endpoints; not a constructed interpolation space. |
| Mathlib `Mathlib/RepresentationTheory/Induced.lean:155`; Tau Ceti `TauCeti/RepresentationTheory/Induction/Permutation.lean:166` | Rep.indResAdjunction; TauCeti.indTrivialIso | Induced-trivial/Frobenius machinery, with the stated left action. |

Object searches covered the pinned libraries, main, the supplied open heads through the roadmap tools, and accessible board packages. No duplicate of the full scalar cotangent/global-field or Symbol acceptance declarations was located. NoncommutativeIntegration's generic interpolation overlap is R04. VonNeumannAlgebras already owns the scalar product-L²/Hilbert-tensor comparison; P7's external finite-rank bundle adapter is a legitimate additional comparison, provided it consumes that scalar result. The board's QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups design G15 records a kernel-identification need, not a second finished generic kernel theorem.

**Cross-roadmap resolution.** Three main roadmaps were read for context/shape: PDE, HopfRinow and ComplexKahlerGeometry. The following contracts were opened rather than inferred from their names:

| Citation | Resolved owner / locator | Result |
|---|---|---|
| DifferentialGeometry | Main README Layers 4, 5.5, 6, 12.4, lines 519,782,923,1026 | Forms, integration/densities and partitions are owned there. This README should cite the sections explicitly. |
| SmoothBundlesConnections B2–B4 | Supplied open README lines 437–771 and 776–838 | Smooth associated operations, complexification, metrics and connections exist as targets. B2.1 lines 449–454 fixes the complex-linear dual convention used here. |
| ComplexKahlerGeometry K5a | Main README lines 626–726,778–916,984–1084,1646–1663 | Density/test/distribution/scale/Laplace targets exist; the reciprocal PDO dependency is R02. |
| PDE A.3/A.4/A.6/A.7 and B.8–10 | Main README Lane A and B, including B.10 line 278 | Scalar Sobolev/extension/Rellich/Morrey and CZ/Mihlin/interpolation contracts; they do not supply generic bundle carriers. |
| HopfRinow Layer 1 | Main README lines 8–14 and Layer 1 | Native positive Levi-Civita and Tau Ceti regularity, with the Riemannian standing hypotheses. |
| CompactGroups Layers 0–3 | Main subroadmap, Haar conventions lines 60–64 and representation development | Normalized Haar, complete reducibility and Schur inputs match the compact-group use. |
| TopologicalKTheory T6.1–2 | Main README T6 beginning line 961 | Strong section actions and genuine continuous-representation ring are independent inputs to the analytic product construction. |
| VonNeumannAlgebras V2 | Supplied open README lines 554–570 | Completed Hilbert tensor and its scalar L² realization; σ-finite Riemannian volumes meet the ordinary product-measure comparison. |
| RiemannianGeometry R4.7, R7 | Main README lines 144,750–756 and R7 | Free properly discontinuous quotient geometry exists without constant-curvature restriction; the return dependency is included in R02. |
| UnboundedOperators UO-D06 | Main absent; open OperatorTheory subroadmap lines 172–220 | Mathematical contract matches the quotation, but its availability is defective: R03. |
| InductionRestriction 2.1 | Main subroadmap README lines 370–378; Suggested.lean line 728 | Gassmann.almostConjugate_iff_permutation_equiv is a genuine roadmap target. The worker's missing-library-name lead is not a finding. |
| LieGroupoidsPoisson G1.1 | Supplied open README lines 345,1091 | Consumes the section-module floor; it is not a supplier here. |
| ContactGeometry CG5 | Main subroadmap README lines 209,275–278 | Consumes first jets and supplies their contact geometry. |
| IndexTheory I2/I4 | Supplied open README lines 63,249,435–480 | Consumes PDO analysis/product homotopies; it is not needed for their analytic construction. |

The remaining downstream-only RQFT references do not supply an input. No RQFT checkout is supplied in the brief and none is on this main; their exact target text was not independently certified. This limitation does not create an analytic supplier edge.

**Seeded source sample.** The worker reported no targets found by heading, and supplied no list of 15 target identifiers. To make this reproducible, a supplemental sample was drawn from README paragraphs containing Define/Construct/Prove, using Python's Random seeded by the full hexadecimal head and selecting 15 paragraphs. Its starts are lines 12,84,139,157,209,227,254,336,433,616,647,721,789,981,998. Every sampled paragraph was read and tested below; no unverified flags were present in the README. A broad reference is not silently promoted to an exact locator.

| Sample | Target / README line | Source text actually checked | Source verdict |
|---|---|---|---|
| S01 | Scope, compact versus local /12 | Taylor I §§1,8, printed pp. 5–6,23–24; taylor lines 151–203,828–861 | Uniform Euclidean and compact-manifold distinctions supported; no single locator establishes the whole bundle scope. |
| S02 | Fourier/geometric convention /84 | Taylor I.(1.1)–(1.4), pp. 3–4; taylor lines 82–104 | Signs and normalization checked after converting its angular unitary Fourier normalization. |
| S03 | First jets /139 | No claim-level source; unidentified Mark notes | Not source-certified. |
| S04 | Global algebraic derivations /157 | Pinned pointwise equivalence at DerivationBundle:446 | Pointwise input verified; global smoothness extension has no source locator. |
| S05 | Differential/jet/commutator equivalence /209 | Taylor I.(1.4), p. 4, covers polynomial operators only | Full jets, transpose and equivalence not source-certified. |
| S06 | Symbol tensors, factorial, rough Laplacian /227 | No claim-level locator | Computed below; not source-certified. |
| S07 | Dirac/Bochner and density /254 | No claim-level locator | Computed below; not source-certified. |
| S08 | Kernels/amplitudes/proper support /336 | Taylor I.(1.21)–(1.28), pp. 6–7; taylor lines 193–235 | Off-diagonal smoothness and amplitude expansion supported; bundle/proper-support assertions still need their own locator. |
| S09 | W^(k,p), interval D, p=1 endpoints /433 | No exact locator; Mark courses unavailable | Computed scaling/interval tests below; full block not source-certified. |
| S10 | Elliptic Sobolev regularity /616 | Taylor I.(4.1)–(4.10), pp. 13–14; taylor lines 475–515 | Inverse estimate, parametrix and Sobolev gain agree; localize the source's uniform hypotheses for local claims. |
| S11 | Hodge comparison, d, nonlinear bootstrap /647 | CKG K5a contract inspected; Mark notes unavailable | Supplier comparison resolved, but no external source for the whole paragraph. |
| S12 | Powers and Sobolev isomorphism /721 | Seeley unavailable; BesselPotentialSpace native definition read | Fourier weight verified; complex powers theorem not source-certified. |
| S13 | Product tensor/domain comparison /789 | VNA V2 and K5a contracts inspected | Inputs resolved; no exact external locator for the new product-domain proof. |
| S14 | Pullback/tensor/product /981 | BDH v2 Theorem 4.6, Proposition 5.1, Theorem 6.1, pp. 13–14,21; bdh lines 500–542,914–938 | Euclidean normal-topology and transversality claims supported; manifold/bundle transport is extra work here. |
| S15 | Proper pushforward /998 | BDH v2 Theorem 6.3, pp. 21–22; bdh lines 941–970 | Proper fixed closed support, zero-covector term and normal continuity supported, with a fixed target cone; see source issue below. |

Additional source checks: Taylor I.(2.5)–(2.7), p. 8 (taylor lines 253–279) supports the composition coefficient; I.(3.1), p. 9 (line 320) supports uniform S⁰_(1,0) L² boundedness; I.(3.28), p. 12 (lines 433–435) supports general-p order shifts; I.(3.32)–(3.34), p. 12 (lines 444–450) supports Zygmund mapping and noninteger Hölder identification; I.Proposition 7.3, Corollary 7.4 and (7.7), p. 22 (lines 781–799) support the wavefront inclusions. Taylor is lecture material and points to monographs for several proofs; it does not certify missing primary proofs or unrelated P1/P7 targets. BDH was read as arXiv:1409.7662v2; its stated Proposition 5.1 and Theorem 6.3 numbering matches the README's linked version.

**Computed adversarial pass (178 rows, including all 15 sampled paragraphs and all 26 explicit Lean declarations).** “Pass” below means the stated instance and the displayed comparison agree, not that a few instances prove the universal theorem. Formulae use the README's angular ξ convention. C denotes an explicitly finite constant when only boundedness is at issue; χ is a smooth compact cutoff equal to one near the test point. Each failure or structural defect points to its finding. These rows cover definitions, conventions, APIs, the sampled paragraphs, the headlines and the additional formulas examined in the full pass.

| Statement | Instance tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Scope: positive versus zero dimension (S01) | A point; ℝ | T*point=0; T*ℝ=ℝ; no nonzero covector on the point | Pass; do not infer rank equality in dimension 0. |
| Compactness scope | Translation of a fixed L² bump on ℝ | Norms stay 1; disjoint translates have distance √2 | Pass; no whole-space Rellich asserted. |
| Fourier conversion (S02) | ξ=2πζ, u=e^(−πx²) | (2π)^−1 dξ=dζ; phases both e^(2πixζ) | Pass. |
| Derivative symbol | u=e^(ixξ) | ∂u=iξu; Du=ξu | Pass; opposite Fourier sign fails. |
| Geometric/Fourier adjoint | ∂ and ∂² | Geometric adjoint symbols −ξ, ξ²; Fourier symbols −iξ, −ξ² | Pass: conjugate σ_F agrees. |
| Matrix commutator order | A=e12, B=e21; P=AD, Q=BD | [A,B]=diag(1,−1); commutator symbol ξ²diag(1,−1) | Pass: order need not drop. |
| Vanishing ideal | x=0, f=1,x,x² | Values 1,0,0; membership false,true,true | Pass. |
| Ideal square iff | Same functions | (f(0),f′(0))=(1,0),(0,1),(0,0); square membership false,false,true | Pass in both directions on controls. |
| Ideal square in dimension 0 | Discrete base at x | I_x²=I_x (multiply by 1 off x); df=0 | Pass, including disconnected bases. |
| Cotangent equivalence | ℝ at 0, classes x and x² | [x]↦dx with dx(1)=1; [x²]↦0 | Pass; zero map ruled out. |
| Cotangent pullback | y=2x | d(y∘f)=2dx; f*dy=2dx | Pass. |
| Smooth section module | f=2+x, s=(x,1), x=3 | (fs)(3)=(15,5)=5·(3,1) | Pass; base-field action alone is insufficient. |
| Scalar tower | a=2, f(3)=5, s(3)=1 | a(fs)=10=(af)s | Pass. |
| First jet (S03) | f=1,x,x² at 0 | j¹ values (1,0),(0,1),(0,0) | Pass; value-only model fails on x. |
| First-jet exact sequence | Trivial rank-r bundle on ℝⁿ | Dimensions nr,(n+1)r,r; kernel of projection has dimension nr | Pass, including n=0 or r=0. |
| Jet frame transition | e′=e^x e, section component u | u′(0)=u(0); derivative component u_x(0)−u(0) | Pass; purely diagonal transition is wrong. |
| Connection splitting | ∇=d+a dx on a line | Covariant jet derivative u′+au; changing a→b adds (b−a)u | Pass. |
| Point derivation (S04) | D=∂, f=x² at x=3 | Df=6=df(1) | Pass; inverse-law padding R09. |
| Global field smoothness | D=x∂ and D=0 | Fields x and 0; derivatives 1 and 0 | Pass; no continuity hypothesis on D used. |
| Field scalar linearity | f=2+x, D=∂, x=3 | field(fD)=5=f(3)field(D) | Pass. |
| Derivation bracket | X=x∂, Y=∂, test f=x | [X,Y]f=−1; vector bracket=−∂ | Pass. |
| Complex scalar convention | z=i, w=i | zw=−1; conjugation gives (−i)(−i)=−1 | Pass. |
| Complexified field dictionary | X=∂, Y=2∂, u=x, v=3x | δ(u+iv)=−5+5i on both formulas | Pass; sign of −Yv is discriminating. |
| First-order splitting | D=x∂+3, f=x² | Df=5x²; Xf+fD1=2x²+3x² | Pass. |
| Splitting negative control | D=∂², f=g=x | [[D,M_x],M_x]=2id≠0 | Pass: excluded by hypothesis. |
| Order filtration (S05) | ∂² and multiplication | Triple commutator=0; double commutator=2id; multiplication has first commutator 0 | Pass. |
| Higher-jet factorization | ∂² on ℝ at 0 | j²f=(f,f′,f″); output f″; x³ gives 0 | Pass. |
| Principal-symbol factorial (S06) | P=∂², f=x | [[P,x],x]=2; (1/2!)·2=1=σ_geom(P)(dx) | Pass. |
| Composition symbol | ∂∘∂ | (iξ)²=−ξ²=σ_F(∂²) | Pass. |
| Order-zero symbol | Multiplication by matrix A | σ(A)=A, independent of ξ | Pass. |
| Rough Laplacian energy | Circle u=sin x, flat line | ∫u(−u″)=π=∫(u′)²; symbol ξ² | Pass. |
| Laplace positive rescaling | 3(−∂²) | Fourier symbol 3ξ², c=3>0; negative rescaling gives −3ξ² | Pass; wrong sign excluded. |
| Dirac anticommutator (S07) | D=∂ on real line | αβ+βα=2αβ; D*D=−∂² | Pass. |
| Bochner connection | −∂²+b∂+c on line | Connection d−b/2; zeroth remainder c−b′/2+b²/4 | Pass by expansion. |
| Noncanonical density Check | w=e^(sin x) | ∂*=−∂−cos x; connection d+(cos x)/2; metric defect cos x | Pass: canonical-density condition matters. |
| Curl symbol | ξ=e1, v=e2 in ℝ³ | iξ×v=ie3; ξ-parallel v=e1 gives 0 | Pass; curl is not elliptic on all vectors. |
| Peetre local versus global order | Disjoint copies of ℝ, D=∂^j on component j | Orders j; each compact meets finitely many components | Pass for stated continuous-local version; no global bound follows. |
| Symbol local bound | a=x, order 0 | On K=[−R,R], sup |a|=R; sup over all x=∞ | Pass; IsUniform excludes it. |
| Symbol order | a=ξ | |ξ|≤〈ξ〉; sup |ξ|=∞ | Pass: S¹, not S⁰. |
| Symbol differentiation | a=ξ² | ∂ξa=2ξ, ∂ξ²a=2, ∂ξ³a=0 | Pass: losses 1,2,3. |
| Symbol product | a=ξ, b=ξ² | ab=ξ³, order 1+2=3 | Pass. |
| Smoothing ideal | a=e^(−ξ²), b=ξ² | ξ^N ab→0 for every N; derivatives polynomial times Gaussian | Pass. |
| Homogeneous symbol | a=ξ², t=2, ξ=1 | a(2)=4=2²a(1); degree-1 alternative gives 2 | Pass. |
| Homogeneous zero convention | Order −1 term 1/|ξ| off zero | a(0)=0 by convention; a(2ξ)=a(ξ)/2 | Pass; no smoothness at 0 asserted. |
| Frequency cutoff | ‖ξ‖=0,1,2 | Values 0,0,1 | Pass; constant zero/one each violates one condition. |
| Classical remainder at N=0 | a=1, a₀=1 off zero | Empty sum=0; r₀=1 | Pass. |
| Classical cutoff remainder | Same a, N=1 | r₁=1−χ, compactly supported in frequency | Pass: smoothing. |
| Uniqueness of homogeneous term | ξ=tη, η≠0; difference lower by one | t^m c bounded by Ct^(m−1) forces c=0 as t→∞ | Pass; coefficient uniquely determined. |
| Cutoff independence | χ₁,χ₂ both 1 at infinity | (χ₁−χ₂)a_j has bounded frequency support away from 0 | Pass: all weighted seminorms finite. |
| Classical exponent classes | 1+〈ξ〉^(−1/2) | Remainder after degree 0 is ∼|ξ|^(−1/2), not O(|ξ|^−1) | Pass: not classical order 0 in integer steps. |
| Borel summation | a₀=1, later terms 0 | b=1; r₀=1, r_N=0 for N≥1 | Mathematical control passes; missing headline R05. |
| Compact-support predicate | a=χ(x)ξ; a=1 | First has support supp χ; second needs all ℝⁿ | Pass; second excluded for n>0. |
| Elliptic inverse symbol | a_m=ξ² id, ξ=2 | a_m=4, b=1/4; both products=1 | Pass. |
| Ellipticity negative control | diag(ξ²,0) | Determinant 0 at ξ=1; no two-sided inverse | Pass. |
| Ellipticity rank caveat | n=0, V=ℂ, W=0 | Nonzero-covector quantifier empty; ranks 1≠0 | Pass: README correctly limits rank equality to positive dimension. |
| Quantization integral | a=1, u=e^(−πx²), x=0 | Integral ∫e^(−πζ²)dζ=1=u(0) | Pass; zero operator excluded. |
| Quantization integrability | a of order m, u Schwartz | Integrand norm ≤C〈ζ〉^m·C_N〈ζ〉^−N; integrable for N>m+n | Pass; N chosen after m,n. |
| Quantization smoothness | a=1, same u | First derivative −2πx e^(−πx²); kth derivatives polynomial times u | Pass. |
| Quantization n=0 | One-point Euclidean space | Fourier transform=id; integral=a(0,0)u(0) | Pass; no division by dimension. |
| Schwartz-to-Sobolev | Gaussian, any real s | Weighted square integral ∫(1+ζ²)^s e^(−2πζ²)dζ<∞ | Pass. |
| Compact-x Sobolev mapping | a=χ(x), m=0 | Output χu; compact smooth multiplier preserves each H^s | Pass; actual pairing ∫φχu, with no conjugate. |
| Uniform order-zero mapping | a=2id | T=2id, operator norm 2; pairing 2∫φu | Pass; no compact-x support required. |
| Schwartz kernel correspondence | Identity; zero map | Kernels δ_(x=y); 0. Pairings ∫φu;0 | Pass; identity kernel is not smooth on diagonal. |
| Off-diagonal kernel (S08) | Identity; Gaussian multiplier | δ vanishes off diagonal; Gaussian kernel smooth everywhere | Pass. |
| Amplitude reduction | a(x,y,ξ)=yξ in dimension 1 | Op(a)=D(xu)=xDu−iu; left symbol xξ−i | Pass: derivative correction −i. |
| Proper support | δ_(x=y); kernel 1 on ℝ² | Diagonal projections proper; support projection of 1 has noncompact fibers | Pass; smooth kernel alone insufficient. |
| Distribution transpose | ∂ with compact tests | ⟨∂δ,φ⟩=−φ′(0); transpose=−∂ | Pass. |
| Composition expansion | a=ξ, b=x | a#b=xξ−i; D(xu)=xDu−iu | Pass. |
| Adjoint expansion | a=xξ | Op(a)*=xD−i; symbol xξ−i | Pass; principal adjoint alone misses order 0. |
| Matrix subprincipal commutator | a=ξI+A, b=ξB, [A,B]≠0 | Leading commutator 0; next term ξ[A,B] | Pass: README retains it. |
| Scalar Poisson formula | a=ξ², b=x | [D²,x]=−2iD; (1/i)∂ξa∂xb=−2iξ | Pass. |
| Coordinate-change Check | y=e^x, u=x | −∂x²u=0; pulled-back −y²∂y²(log y)=1 | Pass: difference ∂x is order 1. |
| Principal-symbol exact sequence | −∂² and −∂²+∂ | Both principal symbol ξ²; difference iξ order 1 | Pass; equality modulo smoothing would fail. |
| Differential inclusion | ∂²+2∂+3 | Polynomial −ξ²+2iξ+3; quantization exactly ∂²+2∂+3 | Pass. |
| Exponential recovery | a=xξ−i | e^(−ixξ)Op(a)e^(ixξ)=xξ−i | Pass for full quantization. |
| Output-support iff | a=χ(x) | Op(a)f=χf; outside supp χ all outputs 0; at χ≠0 a local test detects it | Pass in both directions. |
| Square partition | χ₁=cos θ, χ₂=sin θ locally | χ₁²+χ₂²=1; χ₁+χ₂ can be √2 | Pass; ordinary partition is not the same formula. |
| Uniform versus local L² | a=x, input bump translated by R | Input norm 1; output norm grows like R | Pass: local symbol bound does not imply global boundedness. |
| Native Bessel frequency | Angular ξ=2π, order t=1 | Native weight √2; angular 〈ξ〉=√(1+4π²) | Pass: equivalent norms, not equality. |
| W^(k,p) endpoints (S09) | f=|x| with a cutoff | Weak first derivative sign x; L∞ derivative norm 1; smooth approximants cannot converge in derivative L∞ norm | Pass: no smooth norm density at p=∞. |
| Interval derivative domain | f=1 on (0,1) | H¹ norm 1, Df=0, nonzero trace | Pass: lies in H¹, not H¹₀. |
| Interval L² unboundedness | fλ=cλe^(λx), normalized in L² | ‖fλ‖₂=1; ‖Dfλ‖₂=λ | Pass. |
| Interval closed graph | f_j→f, f′_j→g in L²; test φ | ∫gφ=lim∫f′_jφ=−∫fφ′ | Pass: g=f′ weakly. |
| Closed-base GNS lower term | u=1 on unit-volume compact base | ‖u‖_q=1, ‖∇u‖₁=0, ‖u‖₁=1 | Pass: lower-order term necessary. |
| p=1 subcritical embedding | n=3,r=1 | q*=3/2; concentration scaling ‖uε‖_(W¹,¹)∼1, ‖uε‖_q∼ε^(3/q−2) | Pass: critical bounded, subcritical decays. |
| p=1 critical noncompactness | uε(x)=φ(x/ε), k=n | Top L¹ derivative norm constant; sup norm=1, support→point | Pass: bounded in W^(n,1), no C⁰ compactness. |
| p=1 dimension-one critical | AC function u | |u(x)−u(y)|≤∫_[x,y]|u′|; bumps can keep height 1 while width→0 | Pass: continuous representatives, not uniform equicontinuity. |
| Supercritical compact embedding | k−l>n at p=1 | Rescaled unit top-derivative bump has C^l size ε^(k−l−n)→0 | Pass on concentration control. |
| Fixed-p compact embedding | k>l, normalized frequency N on circle | W^k norm∼1, W^l norm∼N^(l−k)→0, including p=∞ | Pass. |
| Bilinear density duality | f=i, dual test g=1 on volume 1 | ∫gf=i; Hermitian pairing ⟨i,1⟩=−i | Pass: Riesz comparison is conjugate-linear. |
| Complex interpolation definition | Couple (ℂ,ℂ), value z | Infimum boundary norm=|z|; Gaussian strip families approach it | Pass; duplicate owner R04. |
| Interpolation exponents | s₀=0,s₁=2,p₀=2,p₁=4,θ=1/2 | sθ=1; 1/pθ=3/8, pθ=8/3 | Pass. |
| Real K-functional | Equal scalar norms, z=1 | K(t,1)=min(1,t); at t=1 value 1, not 2 | Pass; duplicate owner R04. |
| Real interpolation norm | Same couple, θ=1/2,q=2 | Squared norm ∫₀¹1 dt+∫₁∞t^−2dt=2; q=∞ norm=1 | Pass: equivalent norms, not equal to the original for finite q. |
| Dyadic Besov norm | Single block j=J, Lp norm 1 | B^s_(p,q) norm=2^(Js) for every q; analysis/reconstruction returns the block | Pass. |
| Besov inclusions | Single block as above | Lower/upper sequence controls both 2^(Js) | Pass; does not assert arbitrary-q equality with H^(s,p). |
| Integer Bessel/weak comparison | u=e^(ikx) locally/on circle | Derivative factors k^j; Bessel factor (1+k²)^(k_order/2) | Pass: equivalent finite derivative norms. |
| Coordinate-change hypothesis | φ(x)=2x | Pullback Lp factor 2^(−n/p); inverse factor 2^(n/p) | Pass. |
| Shear Check | φ(x,y)=(x,y+x³), translated bump near x=R | det dφ=1, L² norm unchanged; ∂x gains 3x²∂y and H¹ norm grows ∼R² | Pass. |
| HLS exponent | n=3,p=2,δ=1 | 1/q=1/2−1/3=1/6; q=6 | Pass. |
| Compact Sobolev margin | p=q=2, order gain δ>0, mode N | Norm ratio ∼N^−δ→0; δ=0 ratio 1 | Pass: strict margin matters. |
| General-p critical exponent | n=4,k−l=1,p=4 | rp=n; formula denominator n−rp=0 | Pass: roadmap switches to finite q, never divides by zero. |
| Morrey exponent | n=3,k=2,p=2 | k−n/p=1/2, hence C^(0,1/2) | Pass. |
| Integer Morrey boundary | n=2,k=2,p=2 | k−n/p=1; permitted C^(0,β), β<1, not asserted C¹ | Pass. |
| W^(k,∞) | k=1, f=|x| | Lipschitz constant 1; not C¹ at 0 | Pass: C^(0,1), not C¹. |
| Zygmund/Hölder | u=χ|x|^α, 0<α<1 | Local α-Hölder quotient at (0,h)=1; dyadic sizes O(2^−jα) | Pass. |
| Little Hölder exclusion | Same u | Small-scale modulus limit=1≠0; smooth u has limit 0 | Pass. |
| Product/algebra estimates | Constant unit sections, volume 1 | Product norm=1, product of norms=1 | Pass; general estimate still needs its stated regularity margin. |
| Ehrling | Circle mode N, k>l | N^l≤εN^k+Cε; finite supremum of N^l−εN^k | Pass. |
| Smoothing compactness | Circle multiplier e^(−k²) | H^s→H^t singular values e^(−k²)〈k〉^(t−s)→0 | Pass. |
| Negative-order compactness | Multiplier 〈k〉^−1 | H^s→H^s singular values→0 | Pass on compact base. |
| Group averaging | Q=Z/2, matrix swap action | Average diag(1,0) becomes (1/2)I; invariant I stays I | Pass, normalized Haar essential. |
| Parametrix and uniform inverse | a(x,ξ)=e^(−x²)〈ξ〉^m | Locally inverse e^(x²)〈ξ〉^−m; no uniform x-bound | Pass: local ellipticity alone not uniform. |
| Parametrix remainder | P=1−∂² on circle, Q multiplier (1+k²)^−1 | PQ=QP=I, remainders 0 | Pass. |
| Local elliptic gain (S10) | P=1−∂², Fourier coefficient u_k | (Pu)_k=(1+k²)u_k; H^s(Pu) norm=H^(s+2)(u) in angular spectral norm | Pass. |
| A priori lower term | P=−∂², u=1 | Left norm>0, Pu=0, lower-order norm>0 | Pass: lower term cannot be omitted globally. |
| Kernel-orthogonal estimate | Same P, mean-zero modes k≠0 | k²≥1; ‖u‖₂≤‖Pu‖₂ | Pass. |
| Cokernel and solvability | Circle −∂², forcing f=1 versus sin x | ∫1=2π violates compatibility; −∂²sin x=sin x | Pass. |
| Index independence | Circle −∂² on each Sobolev scale | dim ker=dim coker=1, index=0 for every s | Pass. |
| Schauder localization | −∂²u=χ|x|^α near 0 | u=−|x|^(α+2)/((α+1)(α+2)) near 0 has two extra Hölder derivatives | Pass. |
| d ellipticity (S11) | ξ=1 in n=1; ξ=e1 in n=2 | Map ℂ→ℂ is i; map ℂ→ℂ² has rank1<2 | Pass. |
| Nonlinear bootstrap (S11) | n=4,p=3, quadratic RHS | Sobolev exponent 12; product exponent 6; W¹,⁶ Hölder exponent 1/3 | Pass: the stated bootstrap gains regularity. |
| Spectral powers (S12) | L=1−∂², k=0,1,2 | Eigenvalues 1,2,5; L^(s/2) multipliers 1,2^(s/2),5^(s/2) | Pass. |
| Power domains and inverse | s=2,t=2, mode k | (1+k²)(1+k²)^−1=1; domain shift H²→H⁰ | Pass. |
| Positive lower bound | A=L versus A=−∂² | Smallest eigenvalues 1 versus 0; inverse multiplier at k=0 is 1 versus undefined | Pass: strict positivity is required. |
| Parameter resolvent homogeneity | Principal ξ²−λ; scale t=2 | (4ξ²−4λ)^−1=¼(ξ²−λ)^−1 | Pass for differential leading term; weak-parametric source unverified. |
| Matrix powers | Principal diag(1,4), z=1/2 | Power diag(1,2), square diag(1,4) | Pass. |
| Finite spectral cutoffs | L circle, bound 5 | Modes k=−2,−1,0,1,2: five eigenvectors | Pass; includes multiplicity. |
| Product spectral cutoff | λ=1+k², μ=1+l², R=1 | λ+μ−1≤1 iff (k,l)=(0,0) | Pass. |
| Equivariant local constancy | Constant id on trivial ℂ representation | Kernel=cokernel=0; virtual index=0 along path | Pass; native ordinary helper is R09. |
| Order normalization | Scalar principal p=2ξ | p(p*p)^−1/2|ξ|=ξ; both squared norms ξ² | Pass. |
| Product symbol sign | Scalar p=q=1 | A=[[1,−1],[1,1]], A*A=2I; plus sign instead gives off-diagonal 2 | Pass. |
| Product symbol axes | ξ=0,η=1 and ξ=1,η=0 | A=[[0,−1],[1,0]] or I; both squares I | Pass; axis nonsmoothness still needs cutoff. |
| Cutoff ellipticity | t=|ξ|²/ρ²≤1/2 | 1−t≥1/2, other χ=1; square lower bound ≥ρ²/2 | Pass. |
| Hilbert tensor norm (S13) | Unit modes u,v | ‖u⊗v‖=1=‖u‖‖v‖; product L² norm=1 | Pass. |
| Product connection Laplacian | Modes (k,l) | (1+k²)+(1+l²)−1=1+k²+l² | Pass; missing −1 would give 2 at (0,0). |
| Product graph/H¹ domain | Scalar Dirac factors | Graph weight²=1+k²+l²=product H¹ weight² | Pass; individual graph weights only 1+k² or 1+l². |
| Graded square | Odd matrices anticommuting with grading | Cross terms cancel: D²=D_P²⊗1+1⊗D_Q² | Pass; ungraded sum retains 2D_PD_Q. |
| Residual cutoff error | High mode product eigenvalue λ>R² | L²/H¹ ratio λ^−1/2<1/R | Pass. |
| Modified symbol order bound | Removed region | |ξ|≤Cερ; bounded part divided by 〈(ξ,η)〉≤C/R≤Cε | Pass for stated base-derivative estimate. |
| Modified adjoint blocks | P=e^(ix)D_x, mode (3,16), ε=1/4,R=4 | Proposed reverse coefficient 2; true adjoint coefficient 0 | Fail R01. |
| Fredholm approximation | Finite matrix I+εB, ε‖B‖<1 | Invertible, kernel/cokernel 0; index 0=ind I | Pass for openness principle. |
| Product kernel formula | P:ℂ²→ℂ rank0, Q:ℂ→ℂ² rank0 (point bases) | Even kernel 2·1+1·2=4; odd cokernel1·1+2·2=5; index −1=(2−1)(1−2) | Pass in zero-dimensional rectangular case. |
| Elliptic complex Hodge | Symbol Koszul complex at ξ=e1 | Contraction/wedge anticommutator=I; symbol cohomology=0 | Pass. |
| Zero kernel complement | Zero-dimensional zero operator | Complement=0; Green operator=0 | Pass; no first positive eigenvalue is demanded. |
| Finite free action | Circle rotation by 2π/h | Orbit size h; quotient length2π/h, no stabilizer | Pass. |
| Left action convention | Nonabelian Q, function δ_e | q·(r·δ_e)=δ_(qr)=(qr)·δ_e | Pass; inversion is essential. |
| Covering normalization | Constant f=1, circle h-cover | Pullback norm²=2π=h·(2π/h); normalized norm²=2π/h | Pass. |
| Laplacian transport | Quotient mode e^(ihkx) lifted | Both Laplacians give h²k² times the same function | Pass. |
| H²/domain transport | Invariant circle Fourier modes | Only indices divisible by h; both domain weights (1+h²k²)² | Pass. |
| Closed-form/Friedrichs contract | j=id, q=inner | Representing equation gives A=id; any shift gives same A | Mathematical control passes; unavailable supplier R03. |
| Form transport | Same normalized quotient mode | q_X(Jf,Jf)=h²k²‖f‖²=q_Y(f,f) | Pass. |
| Frobenius identification | Q=S3, H=< (12) >, trivial eigenspace | Invariants dimension1; equivariant maps from ℂ[Q/H] dimension1 | Pass. |
| Almost-conjugacy test | Q=S3, H=< (12) >, K=< (23) > | Class counts (identity,transpositions,3-cycles)=(1,1,0) for both | Pass; normalized quotient spectra agree. |
| Wavefront definition | Smooth u=1; δ₀ on ℝ | WF(1)=∅; WF(δ₀)={(0,ξ):ξ≠0}, Fourier transform of δ₀=1 | Pass. |
| Conormal delta | δ(x1) in ℝ² | WF={(0,x2;ξ1,0):ξ1≠0} | Pass; not all covectors over the support. |
| WF frame/cutoff invariance | Multiply δ₀ by smooth a with a(0)=2 | Result2δ₀, same nonempty WF; a(0)=0 gives0 | Pass; equality needs invertible frame. |
| WF closed/conic/projection | δ₀ | Positive scaling retains nonzero fiber; base projection={0}=singular support | Pass. |
| WF sum and conjugation | δ₀+(−δ₀); δ₀ real | Sum WF=∅⊂WFδ₀; conjugation reflects a symmetric fiber | Pass; inclusion not equality for sums. |
| Pseudolocality | P=∂, u=δ₀ | Fourier transform iξ; WF unchanged | Pass. |
| Microlocal ellipticity | P=1−∂², u=δ₀ | WF(Pu)=WF(u); characteristic set empty | Pass. |
| Sobolev WF shift | δ₀ in dimension1 | ∫〈ξ〉^(2s)dξ finite iff s<−1/2; derivative threshold s<−3/2 | Pass: order shift1. |
| Pullback normal set (S14) | Inclusion 0→ℝ; submersion (x,y)→x | First normal set all nonzero covectors at0; second empty | Pass; δ₀ restriction excluded, submersion pullback allowed. |
| Pullback covector direction | f(x)=2x, u=δ₀ | f*δ₀=½δ₀; covector map η→2η | Pass; scalar amplitude and covector direction distinct. |
| Pullback composition | f(x)=2x,g(x)=3x | (g∘f)*δ₀=⅙δ₀=f*(⅓δ₀) | Pass. |
| Tensor WF zero factors | δ₀⊗1 on ℝ² | WF={(0,y;ξ,0):ξ≠0}; second zero covector is necessary | Pass. |
| Product criterion | u=v=δ₀; u=1,v=δ₀ | First has opposite ξ and −ξ, criterion fails; second WF(1)=∅ and product=δ₀ | Pass; criterion is sufficient, not claimed necessary. |
| Diagonal restriction failure | δ_(x=y), pullback by x↦(x,x) | Normal covectors (ξ,−ξ) annihilate (v,v):0 | Pass: excluded. |
| Pushforward density (S15) | f(x)=2x, u=δ₀ | f_*δ₀=δ₀; test pairing φ(0)=φ(f(0)) | Pass; differs from pullback factor½. |
| Pushforward critical term | Constant f:ℝ→ℝ, smooth compact density integral1 | WF(u)=∅, f_*u=δ₀ with full nonzero fiber | Pass: zero-covector term is indispensable. |
| Pushforward properness | Projection ℝ²→ℝ with u=1 dxdy | Fiber integral∞, map not proper on support | Pass: excluded. |
| Pushforward identity/composition | Point mass δ_x, maps f,g | Both sides δ_(g(f(x))); identity returns δ_x | Pass. |
| Fixed support/cone continuity | Constant map, densities supported in fixed compact C | Output coefficient ∫u is continuous; target cone full fiber if C nonempty | Pass; target cone must use fixed C. |
| Normal topology tensor/product | One factor fixed smooth1 | Product map u↦u, seminorm values identical | Pass on control; full hypocontinuity is source-supported. |
| Source control: Taylor heat-integral sign | Laplacian eigenvalue −1 | Inverse eigenvalue −1; integral of e^(−t) over t>0 is +1 | Source misprint; use negative integral. |
| Source control: Taylor commutator order | p₁=sin x, p₂=ξ², m₁=0,m₂=2 | Leading commutator 2iξ cos x has order1; printed m₁+m₁−1 gives −1 | Source misprint; use m₁+m₂−1. |
| Source control: Taylor matrix bracket | p₁=p₂=ξ(A+sin x B), A=e12,B=e21 | Actual commutator0; reordered expression at x=0 is −iξ diag(1,−1), not order0 | Source error; README's ordered formula avoids it. |
| Source control: Taylor local output order | P=∂, u=1_[0,1], cutoff near0, s=0 | u∈L²; localized Pu=δ₀∈H^−1 but not H⁰ | Source misprint; output order s−m. |

## Not verifiable

- **grubb:** `Distributions and Operators`, chapter 8. Both university author URLs (web.math.ku.dk and www.math.ku.dk) timed out through the sources service. Coordinate/global bundle and Fredholm assertions were not certified against this chapter.
- **grubb_hansen:** `Complex powers of resolvents of pseudodifferential operators`, Definition 2.1 and §4. Both university author URLs timed out. In particular the proposed r=1/λ seminorm convention and frequency-order loss were not checked against the actual definition; no guessed verdict is given on that identification.
- **seeley:** `Complex powers of an elliptic operator` (1967), pp. 288–307. The DOI resolved to the AMS book landing page; the service found no readable open text and its arXiv search returned HTTP 429. The real-power/domain assertions were tested on spectral models, not certified against this paper.
- **mark_index** and **mark_riemann:** the two Thomas Mark courses are not bibliographically identified beyond their names. The sources service found no legal text, and author/course web searches did not identify a matching version. Their exercises and the uncited jet/Bochner/endpoint statements remain source-uncertified. This is also the locator defect R06.
- **pde_discussion:** the public Zulip URL returned an application shell rather than the referenced discussion text. It is design context, not evidence for a mathematical theorem.
- The exact downstream RQFT target text was not checked: its files are not supplied and it is absent from the available main checkout. Ownership checks against the provided open checkouts were performed; no claim is made about unprovided open files.
- The three-classical-source generality extensions (all manifolds/bundles, parameter families and arbitrary real orders in every stated combination) are not proved by the finite examples in the table. The readable sources support the identified Euclidean claims at the listed locators. Missing texts are recorded together for the worker; the review is finished, not parked awaiting them.

## Source issues

- **Misprint** in taylor at I.(1.14), printed p. 5: the source says the integral of the positive-time heat semigroup equals the inverse of its nonpositive Laplacian; it should be the negative of that inverse, since integrating e^(−t) gives 1 whereas (−1)^−1=−1; affects the proof.
- **Misprint** in taylor at I.(2.8), printed p. 8: the source says the commutator order is m₁+m₁−1; it should be m₁+m₂−1; affects a stated result.
- **Error** in taylor at I.(2.9), printed p. 8: the source says commuting matrix-valued full symbols permit the scalar reordered Poisson-bracket formula; it should be the ordered derivative-product difference, unless the required derivative factors commute; affects a stated result.
- **Misprint** in taylor immediately after I.(3.37), printed p. 13: the source says the first localized output term belongs to H^(s,p); it should be H^(s−m,p), by the cited mapping theorem; affects the proof.
- **Misprint** in bdh at Theorem 6.3, preprint printed p. 22: the source says the fixed target cone uses the varying input's support; it should be defined using the fixed closed proper-support set C for the continuity statement; affects a stated result.
