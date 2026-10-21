# Mathematical repair report

The repairs concern `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md`, `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json` and `packages/GanGrossPrasadConjecturesForClassicalGroups/sources.toml`. All ten findings are applied. Supplier outputs remain declared gaps until their owners supply them; this report does not certify their existence or the proofs of the planned targets.

## F01 (P1) — applied

Unowned `connected-reductions` → owned theorem targets §3.7 `GGP.specialOrthogonalBesselInductionReduction` and §3.8 `GGP.skewUnitaryFourierJacobiInductionReduction`, with groups, Bernstein exclusions, unnormalized induction, dual conventions, splitting multipliers, proof routes and three Checks each. §4.8 consumes both; the split branch uses §4.7. Evidence: ggp line 2158, ggp line 2293, ggp line 2661 and ggp line 2699.

## F02 (P1) — applied

Nonzero functional → unimodular A-linear functional in §2.2, with vector, central and group surjectivity and an explicit §2.3 consumer. Added the idempotent rejection and split identity positive control. If ell(x) = 1, x tensor w lifts w; pullback of the unit Hermitian line is injective, so its finite-dimensional dual is onto. Evidence: ggp line 1683–1727.

## F03 (P2) — applied

Nonzero residual vector/nontrivial character → generating residual vector and factorwise nontrivial character, expressed by a unit trace coefficient. §2.1 now proves nonvanishing coordinates before conjugacy; §1.4 carries the admissibility condition. Added separate idempotent-vector and projection-character rejections and the GL3 positive control. Evidence: ggp line 1944–1957, compared with ggp line 1624–1639.

## F04 (P2) — applied

Nine compound named gaps → forty independently named contracts, each with matching `needs`, `detail`, supplier, missing-section binding and exact consumers. Included domains, classification/normalization laws, convergence and measure conditions, and relative-character constants; retained pinned quadratic Witt theory and the Hilbert symbol. Evidence: bp-refined line 2244–2302, bp-arch line 11132–11184, bpcz line 679–700 and bpcz line 4939–4941.

## F05 (P1) — applied

Arbitrary-field SO scheme/topology attribution → the actual Layer 0 point groups, ℝ/ℚ_p topology and point restricted products. Added `gap:orthogonal-scheme-points`, assigned to ReductiveGroupsPartII as an extension, with arbitrary-field scheme/point/base-change and all-local-field topology requirements. §1.2 and direct consumers list it. Evidence: `TauCetiRoadmap/OrthogonalSpinGroups/README.md`, Layer 2 and §3A. The extension remains an external supplier obligation.

## F06 (P2) — applied

Bridge conclusion “FJ and P1” → FJ selection alone. General enhanced theta theory retains its supplier ownership; the bridge consumes only weak P1 parameter/nonvanishing laws, P2 and seesaw/Howe inputs. No supplier contract consumes the downstream Bessel or FJ theorem. Evidence: gan-ichino line 103–116 and gan-ichino line 600–602. The generic FJ endpoint is retained.

## F07 (P2) — applied

Unqualified local normalized sums → a separate tempered local branch with absolute convergence, finite nonzero Cv and trace-integrability assumptions; the global cuspidal branch retains its broader range. The rank-one API carries the same domain. Added the divergent constant-coefficient integral over Fvˣ as rejected input. Evidence: bpcz line 4866–4884; normalizing domain at bpcz line 162–168.

## F08 (P2) — applied

Only diagonal measure compatibility → explicit ambient and diagonal Tamagawa products and convolution operators in §8.1/§8.5. Added the source differential-to-product conversion, finite-S test-tensor correction and its leading values. Rank-one extraction uses the ambient measure. Added single-place ambient doubling rejection and reciprocal two-place positive control. Evidence: bpcz line 679–700, bpcz line 4879–4892 and bpcz line 4939–4941.

## F09 (P3) — applied

Secondary recollection → primary bp-refined Theorem 8.5.1, printed p. 71, with printed p. 70 setup and §§7.2, 7.7, 8.3 labeling/classification inputs explicitly required. Both primary works were legally fetched and recorded; the unlabelled precursor is identified separately. Evidence: bp-refined line 2877–2901 and bp-unitary-tempered line 5429–5432. Gan–Ichino remains the generic-reduction source.

## F10 (P3) — applied

Two scheduling/certification reservation sentences → deleted. Genuine supplier objects and downstream consumers remain. The dependency gate now places the candidate after MetaplecticAutomorphicForms, without adding a scheduling-only dependency. No merge-order or pull-request metadata was edited; the former reservation has no mathematical role.

## Supplier contract allocation

Every slug below has a top-level `gaps` record, a matching “What Supplier must provide” line, and target-specific prerequisites. Section bindings explicitly say `missing`; no numbered supplier target has been invented.

| Earlier owner | Separate contracts (all prefixed `gap:`) |
|---|---|
| ReductiveGroupsPartII | `hermitian-witt`, `classical-group-points`, `orthogonal-scheme-points`, `classical-flags`, `marked-inner-forms` |
| SmoothRepresentationsOfLocalGroups | `smooth-functors`, `casselman-wallach`, `induction-jacquet`, `bernstein-exclusions`, `distribution-descent` |
| EndoscopicTransferAndUnitaryTraceComparison: parameters | `parameter-carriers`, `enhanced-classification`, `tempered-stability`, `tempered-transfer`, `tempered-whittaker`, `global-base-change` |
| AutomorphicLFunctionsAndLocalFactors | `factor-change-laws`, `tempered-factor-regularity`, `global-completed-factors` |
| MetaplecticAutomorphicForms | `heisenberg-svn`, `oscillator-splittings`, `global-theta`, `theta-seesaw`, `theta-parameter-laws`, `generic-standard-modules` |
| AdelicAlgebraicGroups | `adelic-points`, `quotient-integration`, `tamagawa-factorization` |
| AutomorphicFormsOnReductiveGroups | `cuspidal-tensors`, `petersson-pairings`, `period-growth` |
| AutomorphicSpectralTheory | `local-tempered-estimates`, `schwartz-trace`, `eisenstein-periods`, `endoscopic-isolation` |
| EndoscopicTransferAndUnitaryTraceComparison: analysis | `trace-distributions`, `finite-smooth-transfer`, `archimedean-transfer`, `spherical-base-change`, `relative-character-constants` |

The SO extension changes the stated ownership allocation, without importing OrthogonalTamagawaAndLatticeMass as a supplier. Neither supplier files nor merge order were changed. General theta P1 enhancement is not a consumed gap: the relative bridge uses precisely the upstream input in the source's implication and exports only FJ.

## Adversarial mathematics pass

Each row covers the named target and its listed API, including their hypotheses and comparisons. “Retained” means the specified boundary agrees with the statement; it does not mean a proof has been formalized. These are mathematical instantiations, not Lean test executions. All 50 targets, 80 named API entries and 143 Checks were inspected for their carriers, quantifiers, signs, domains and denominators.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| §1.1 `RelevantPair` and its four APIs | Zero skew pair; real anisotropic line; positive plane; skew-Hermitian positive plane | Zero skew pair relevant; parity alone fails; conjugate dual needs conjugate inverse | Retained; Hermitian extension separated from pinned quadratic Witt theory |
| §1.2 `relativeSubgroup` and its three APIs | Empty flag; complement dimensions zero and one; identity unipotent | Diagonal (i(g),g), with trivial radical at the basic boundaries | SO scheme/point and flag gaps explicit |
| §1.3 `IsRelevantInnerForm` and its three APIs | C = 0; real signatures (3,1) and (1,3); split GL | Complement isometry matters beyond ranks/discriminants; split GL pure twists trivial | Precise form/classification gaps; subgroup dependency explicit |
| §1.4 `splitPairEquiv` | Rank zero; line scaled by a; split degenerate character data | Inverse-dual second coordinate; group comparison cannot certify degenerate characters | Character/functional admissibility recorded |
| §2.1 `besselCharacter` and its four APIs | r = 0; (1,−1) coordinate sum; split idempotent e; projection psi; GL3 with coefficients (1,1) | Empty character trivial; the two degenerate split inputs kill a root; positive control sees both | Generator/unit trace coefficient and root-coordinate statement |
| §2.2 `fourierJacobiQuotient` and its four APIs | X = 0; W = 0; alternating plane; split ell = (1,0) and ell = id | Commutator 2 in trivial involution; bad ell kills center; identity ell surjects | Unimodularity and surjectivity API |
| §2.3 `fourierJacobiRepresentation` and its three APIs | Equal ranks; W = 0; genuine/nongenuine pi | Oscillator remains at equal rank; cover signs multiply to +1 only for genuine pi | Surjective quotient required before pullback |
| §2.4 `Model` and its six APIs | Trivial group; zero representation; rank-zero sign cover; infinite direct sum | Dimensions 1, 0, sign-dependent 0/1, infinite; finrank is inappropriate | Retained; separate continuous and smooth functor contracts |
| §3.1 basic finite-place multiplicity | SO(1)/SO(0); Q2 and ramified finite extensions | Dimension one in trivial case; residual characteristic two allowed | Retained characteristic-zero/category range |
| §3.2 basic archimedean multiplicity | Rank-zero Jacobi center; continuous versus algebraic dual | Center character gives one-dimensional case; continuity essential | Retained Casselman–Wallach domain |
| §3.3 Bessel induction | Absent isotropic Levi; forbidden Bernstein support | Empty exclusion is valid; forbidden support can leave a closed term | Retained O/U domain and unnormalized induction |
| §3.4 symplectic FJ induction | X = 0; omitted genuine chi_psi | Positive-rank reduction cannot apply at zero; cover signs otherwise mismatch | Retained exact symplectic domain |
| §3.5 `MultiplicityOneAssertion` and its three APIs | SO(1)/SO(0); trivial C² representation; zero model | Bound holds for irreducibles; dropping irreducibility fails | Retained as proposition, not unrestricted theorem |
| §3.6 higher-codimension multiplicity | Basic complement; Q2; auxiliary support collision | Basic branch uses §3.1; auxiliary datum chosen in proof over same field | Retained Hermitian and symplectic ranges |
| §3.7 connected SO induction | SO(0) remaining factor; maximal isotropic components; absent Yprime; forbidden supports | Need SO orbit computation and simultaneous support exclusions | Added owned extension target and three Checks |
| §3.8 skew-unitary induction | X = 0; common mu; different mu on W0 | mu(a) cancels mu(a)⁻¹; mismatched splittings leave a twist | Added owned target; unnormalized modulus and smooth pi0 explicit |
| §4.1 `parameterSignDomain` and its three APIs | M = 0; multiplicity-two orthogonal line; paired GL; two odd generators | Component orders 1, 2, 1; determinant-one two-generator kernel has order 2 | Retained |
| §4.2 conjugate root character and its three APIs | N = 0; two generator values −1,+1; dim N = 1 versus 2 | Trivial empty character; product −1; nonnorm scaling sees dimension parity | Retained exact factor-change contract |
| §4.3 selfdual root character and its three APIs | Empty parameter; two symplectic parameters; odd N; real determinant correction | Even domains essential; real corrected value +1 versus raw −1 | Retained pinned Hilbert-symbol normalization |
| §4.4 `distinguishedCharacter` and its three APIs | Split GL; odd line plus extra 1; scalar eigenvalues z,u | Trivial split label; need N ⊕ 1 locally; twist value z/u | Retained explicit enhancement normalization contract |
| §4.5 change-of-data comparisons | Identity change; odd character scaling; scalar splitting ratio u | Identity maps; odd sign reverses; functional reassociation acts by zu | Retained, upstream change laws explicit |
| §4.6 `LocalSelectionAssertion` and its three APIs | Singleton GL packet; two inner forms; nongeneric parameter | Selection across relevant forms; nongeneric parameter outside quantified domain | Retained actual parameter carriers and hypothesis laws |
| §4.7 split local selection | Basic GL2/GL1; nonbasic finite place; archimedean larger complement | Singleton label; source theorem separates basic archimedean/general finite-place range | Retained split branch |
| §4.8 selection reduction | All four types; split coefficient algebra; archimedean place | Separate connected reductions needed; finite-place implication alone | Owned §3.7/§3.8 and split §4.7 prerequisites |
| §5.1 tempered Bessel selection | Ramified quadratic extension of Q2; changed enhancement origin | Field included; arbitrary relabeling can destroy epsilon conclusion | Primary theorem and its classification/labeling hypotheses |
| §5.2 standard-module multiplicity | Empty blocks; ordered versus arbitrary exponents | Empty case identity; ordering and normalized induction indispensable | Retained |
| §5.3 generic Bessel selection | Generic non-tempered standard module; tempered remainder | Distinction reduces to tempered data, not to a presumed generic member on every form | Generic irreducibility contract explicit |
| §5.4 theta bridge | Zero lift; nonzero lift in specified tower; P1 enhancement as output | Zero lift contributes nothing; FJ follows from the supplied laws and Bessel | Removed P1 conclusion and downstream supplier dependency |
| §5.5 generic FJ selection | Wrong mu restriction; ramified Q2 extension; higher even complement | Invalid splitting rejected; dyadic field included; §4.8 needed | Upstream theta parameter and standard-module inputs explicit |
| §5.6 tempered uniqueness across inner forms | Real signatures; F = C; empty packet on a form | Multiple real forms retained; complex split place uses §4.7 | Separate STAB, TRANS, WHITT domains |
| §6.1 global Bessel period and its three APIs | Zero cusp form; rational translation; split GL center | Zero value; quotient descent needs rationally trivial character; GL norm modulo split center | Separate adelic, volume, measure and growth inputs |
| §6.2 global FJ period and its three APIs | Zero Schwartz vector; cover kernel; nonautomorphic psi | Zero value; two genuine signs cancel; nontrivial rational restriction prevents descent | Separate global theta/growth contracts |
| §6.3 L-representation and its three APIs | M = 0; ranks 2 and 1; split algebra | L = 1 for zero; global dimension 2, not 4; split product has dual factor | Retained mu inverse and global/local distinction |
| §6.4 global nonvanishing proposition and its three APIs | Zero central value; one zero local model; zero vector | Functional nonvanishing needs a nonzero value somewhere; local condition alone insufficient | Retained conjectural status and continuation domain |
| §6.5 `UnitaryPeriodDatum` and its three APIs | Q(i) norm line at 1,i,1+i; zero form; different h | Norms 1,1,2; no assumed nonzero period; form fixed | Retained actual cuspidal realization |
| §7.1 `orthogonalDelta` and its three APIs | d = 2,3,4; split and nonsplit planes | L(1,chi), zeta(2), zeta(2)L(2,chi); global split plane has pole | Retained regular-value restriction |
| §7.2 orthogonal local period and its three APIs | Zero vector; first/second input times i; singular L quotient | Integral zero on zero; conjugations differ; singular scalar alpha unavailable | Retained ordinary-value domain and measure input |
| §7.3 orthogonal tempered/spherical theorem | Tempered coefficients; hyperspecial volumes 1 versus 2 | Spherical alpha 1 only at prescribed normalization; doubling H measure doubles alpha | Retained U1–U6 |
| §7.4 orthogonal conjectures and their four APIs | Centralizer orders 2,4; measure times 3; ALG versus tempered; zero vector | Component factor 1/8; C0 rescales inversely; ALG is not temperedness; division excludes zero | Retained as conjecture propositions |
| §7.5 normalized unitary form and its three APIs | Zero vector; factors i; C replaced by 2C; split q = 2 | Sesquilinearity fixed; false normalization halves alpha; L(1,1) = 2 | Retained exact nonzero Cv and integral domain |
| §7.6 local convergence/spherical theorem | Dyadic/ramified/infinite places; compact volume 2 | All local integrals retained; spherical alpha equals volume times norm | Separate analytic and factor nonvanishing contracts |
| §7.7 normalization invariance | Vector times 2i; H measures c,c⁻¹; one H measure times 2 | Norm and period multiply by 4; reciprocal changes cancel; lone change breaks factorization | Retained |
| §7.8 global constant and its three APIs | Constituent totals 2,3; n = 1; zero central value | Factors 1/4,1/8; Delta_2 uses eta and 1; zero central value is allowed | Separate adjoint nonvanishing/Asai contract |
| §8.1 relative distributions and their four APIs | Basis phase i; empty spectral set; zero period; trivial coefficient on split Fvˣ; rank-one operator | Phase cancels; empty/zero sums vanish; constant integral diverges; rank-one contraction gives alpha(f,f) on its domain | Separate tempered normalized branch and both convolution measures |
| §8.2 linear contribution | Irrelevant datum; two/three constituents | Zero contribution; coefficients 1/4,1/8 | Retained actual analytic forms and regular-parameter domain |
| §8.3 isolated comparison | Zero tests; enlarging S; endoscopic data without a supercuspidal place | Zero identity; measure/unit factors must move with S | Separate transfer, spherical and isolation contracts |
| §8.4 endoscopic nonvanishing | Different fixed inner form; degree 1/2 Asai signs; function field | Existence ranges over h; signs +/−; proved theorem uses number fields | Retained broad non-tempered global branch |
| §8.5 factorization | Zero local model; comparison constants k,k⁻¹; one G measure times 2; G measures 2,1/2 | Obstruction gives zero; constants cancel; single scaling spoils equality; compensated scaling preserves it | Ambient factorization and exact source conversion |
| §8.6 GGP.8 | Stable/endoscopic totals; zero period on nonzero vector; vector times 2i | Constants 1/4,1/8; central value never divided out; squared quantities scale by 4 | Retained endpoint; rank-one route uses corrected §8.1/§8.5 |
| §8.7 stable specialization | n = 1; both base changes cuspidal; opposite Asai sign | n = 1 outside this specialization but inside bpcz endpoints; component factor 1/4 | Retained source range and pole/regularity comparison |

Standing conventions were also checked independently:

| Convention | Instances tried | Result | Change |
|---|---|---|---|
| Field and rank domains | Zero ring; inseparable quadratic extension; characteristic 2; residual characteristic 2 | First three excluded by genuine hypotheses; dyadic local fields retained; split A-rank not doubled | None |
| Polarization/alternating orientation | Q(x) = x²; alternating e,f | Polar at (1,1) is 2; b(e,f),b(f,e) = 1,−1 | None |
| Hermitian dual direction | a = i in C/R; split line a,a⁻¹ | Both hyperbolic partners scale by i; ordinary inverse gives the wrong sign | None |
| Continuous Hom/category | Infinite-dimensional Frechet space versus finite-dimensional Hausdorff source | Continuity is indispensable; pinned comparison requires finite dimension and complete coefficient field | Precise category contracts |
| Oscillator/cover conventions | Genuine signs −1,−1; equal rank; zero W | Product sign +1; equal-rank oscillator retained; flag-only boundary when W = 0 | Surjective quotient input |
| Frobenius/epsilon/dual | q = 2,s = 1; s = 0; mu eigenvalue u | L-value 2; pole has no ordinary scalar; twist z/u | Exact change-law contract |
| Pairings and vector normalization | Input multiplied by i; vector by 2i | First-linear convention and conjugate second variable; squared norm/period scale by 4 | Local rank-one domain explicit |
| Global measures | One/two H rescalings; one/two G convolution rescalings | Finite product-one rescaling preserves compatible products; one-place change does not | Both measure products specified |
| Theta trace-character scaling | psi_E = psi(Tr(delta·)/2) versus psi composed with Tr(delta·) | They differ by argument 2; only the matching label/nonzero-tower formulas are used | Explicit supplier formula |
| Asai/component constants | Degree m = 1,2; constituent totals 2,3 | Signs +,− and component factors 1/4,1/8 | None |

## Source and pinned-library checks

All twelve manifest entries parse and have legally available certified text. The ten original cached works were checked at the relevant locators; the two primary Beuzart-Plessis works were fetched through the sources service. No missing-text request was necessary. For Ichino–Ikeda, locators continue to refer to the recorded author revision. Source prose was not copied into the package or report.

The pinned manifest identifies Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. GitHub object search located relevant files, which were then read at these exact commits:

| Existing object | Pinned declaration/file inspected | Consequence |
|---|---|---|
| Algebraic/continuous intertwiners | `Representation.IntertwiningMap` in `Mathlib/RepresentationTheory/Intertwining.lean`; `ContRepresentation` and `ContIntertwiningMap` in `Mathlib/RepresentationTheory/Continuous/Basic.lean` | Generic carriers imported; smoothness is additional |
| Continuous/algebraic comparison | `ContRepresentation.intertwiningMapEquiv` in `TauCeti/RepresentationTheory/Continuous/Intertwining.lean` | Finite-dimensional Hausdorff source and complete coefficient field retained |
| Invariant forms | `Representation.IsInvariantSesqForm` in `TauCeti/RepresentationTheory/InvariantForm/Hermitian.lean` | Star-first library form used by argument reversal |
| Unhalved polarization | `QuadraticMap.polar_self` in `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | Value 2 preserved |
| Quadratic Witt theory | `QuadraticForm.exists_equivalent_hyperbolicPresentation_prod` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean`; `TauCeti.equivalent_of_equivalent_prod` in its sibling `Cancellation.lean` | Hermitian extension reuses these quadratic declarations |
| Norm-equation symbol | `TauCeti.hilbertSymbol` in `TauCeti/NumberTheory/HilbertSymbol/Basic.lean` | No second Hilbert symbol requested |
| Split Heisenberg group | `TauCeti.HeisenbergGroup`, `mul_z`, `commutatorElement_eq` in `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean` | Imported plane comparison uses z_half = z_matrix − xy/2; arbitrary symplectic oscillator theory remains supplier work |

The shape and supplier audit read `TauCetiRoadmap/ReductiveGroups/README.md`, `TauCetiRoadmap/OrthogonalSpinGroups/README.md` and `Completed/RestrictedProducts/README.md` on the content main checkout. Orthogonal Layer 2 has the asserted restricted topology domain and §3A excludes its group-scheme comparison. The open QWittVectors head `4605fbb0a2d9279b561f9467ab5cce09d7f2469e` was read for its arithmetic Witt scope; this is distinct from quadratic Witt theory. The ErdosProgressionPowers and ArithmeticDynamics roadmap scopes were read and their full README objects searched for the relative representation-theoretic objects; neither owns these targets.

## Check outcomes

The required dependency command used the supplied configuration, candidate `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md`, `--only GanGrossPrasadConjecturesForClassicalGroups` and `merge-order/ORDER.txt`. It exited 0 with this exact output:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 29 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- JSON and TOML parsing: passed; 50 targets, 80 API names, 143 Checks, 40 supplier gaps, 12 source records.
- Internal prerequisite traversal: passed; no missing or forward target and no unresolved gap.
- Gap synchronization: passed; every `neededBy` list equals its actual consumers; each README contract matches `needs` and `detail` exactly.
- README/plan name coverage: passed for every target, API and Check; each definition/construction retains at least three Checks. Changed-target statements, APIs and Checks also pass literal body synchronization after stripping Markdown code markers.
- Stale gap audit: passed; all ten obsolete compound/owned gap identifiers have been eliminated from the design.
- `git diff --check`: passed with no output.
- Machine-path scan of edited design and manifest: passed; none present.
- Lean elaboration: not run. This design package has no `Suggested.lean`, none was authorized for editing, and the brief provides no Lean execution command. No elaboration or proved-example claim is made.

No target name cited by downstream roadmaps was deleted or renamed. The bridge's conclusion is narrowed to its correctly owned relative result, the Heisenberg/Bessel data domains are corrected, and local relative-character/rank-one inputs now carry their analytic and measure domains. The two connected reduction names are new. Old gap slugs are replaced by the contracts above. Implementation and proof of supplier contracts remain external obligations; no supplier, tooling, merge-order, pull-request or content-main file was edited. No commit or push was performed.
