# Design repair: GanGrossPrasadUnitaryGroups

## F01 (P1) — applied

Unassigned `distribution-gk` → a named AutomorphicSpectralTheory continuation request. Its contract specifies semisimple normal-space descent, field-dependent Fourier homogeneity and the general multiplicity-product criterion; §§2.2–2.6 retain relative symmetry and multiplicity. Evidence: ag-descent line 406, line 583, line 596, line 1189; agrs line 220. The missing supplier section remains an explicit gap, not an asserted import.

## F02 (P1) — applied

“Maximal isotropic Y” → the chosen totally isotropic `Y=X⊕E(e+f)`, with `W′=Y⊕W⊕Y∨` and the same stabilizer Levi. Added `reduction_isotropic_residual`: W=H, r=1 gives rank(Y)=2 and Witt index(W′)=3. Evidence: ggp line 2135–2151. No anisotropy restriction was added.

## F03 (P1) — applied

ReductiveGroups Layer 8 → Layer 7 in scope, supplier contract, §1.2 prerequisites, layer dependencies and structured supplier sections. Evidence: `TauCetiRoadmap/ReductiveGroups/README.md:627` starts structure theory, line 632 states parabolic subgroup schemes and Levi decompositions, and line 1023 starts classification/existence. No separate Layer 8 input is consumed.

## F04 (P2) — applied

An unconditional germ average → zero for an empty regular-nilpotent orbit set, otherwise the finite nonempty average. Added `geometric_empty_regular_germs` for compact U(2)×U(1) at identity, which remains in Γ. Evidence: bp-arch line 3994–4000, §4.5, Proposition 4.5.1(1)(i), p. 106. README and plan use the same convention.

## F05 (P2) — applied

The split implication’s unsupported appeal to §3.3 → §5.1a `splitAdjacentWhittakerPeriod`, identifying the actual raw integral with `ab λ(W)conj(λ(W′))` for explicit positive Haar/pairing scales. Three Checks test rank one, Haar scaling and a kernel vector. Evidence: zhang-period line 1437, line 1505, line 1543–1551; nonzero normalized test vectors: line 962–981. §5.2 retains both split and nonsplit places.

## F06 (P2) — applied

Compound category, analytic, transfer and theta contracts → separate named gaps with groups, test spaces, quantifiers and normalizations; all `neededBy`, prerequisites and layer dependency lists agree. Evidence: jsz-bessel line 207–216 and line 652–656; bp-plancherel line 4480–4491 and line 4734–4748; xue-real line 554–609. Relative half-plane and seesaw conclusions remain owned here.

## F07 (P2) — applied

Supplier-proved C_v → supplier regularity of its individual factors, with quotient construction/nonvanishing solely in §5.1. Duplicated actual-packet identities → the enhanced-classification supplier alone; earlier endoscopy supplies geometric transfer and constants. The supply direction is explicit. Evidence: bp-refined §7.2 and §8.6, line 2869–2908; bpcz line 148–167; zhang-period line 1437–1457 distinguishes measure normalizations.

## F08 (P3) — applied

Corrected §5.2’s normalizer reference to §5.1, both nonexistent §5.6 product references to §5.5, and §3.11’s final multiplicity-bound reference to §2.6. The corresponding plan hypotheses/statements agree. Evidence: the named normalizer, all-place product and all-place multiplicity theorem occur respectively in §§5.1, 5.5 and 2.6; §2.5 is only the archimedean injection.

## F09 (P3) — applied

The proof-status bullet → `split_prediction_generic_character`: a regular normalized GL₃ principal series with distinct unitary inducing characters has generic-model dimension 1, while its trivial-character model has dimension 6. Status stays in prose. Evidence: bernstein-zelevinsky line 329–338 gives six one-dimensional Weyl filtration pieces; ggp line 2394–2405 supplies generic uniqueness/nonvanishing. The supplier’s Jacquet contract records this calculation.

## Check outcomes

The required dependency command exited 0. Its exact output was:

```text
candidate: GanGrossPrasadUnitaryGroups is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The merge-order file and tooling were not changed.

JSON and TOML parsing passed. Structural validation passed for 40 targets, 81 named API items, 124 mathematical Checks, 30 named supplier gaps and 17 source records. Every target/API/Check name occurs in the README; every internal prerequisite resolves; each gap has a named supplier and section request; each `neededBy` set equals its consumers; each source has the required bibliographic, locator, access and status fields. Every target has at least three Checks. A separate statement/hypothesis comparison found only the pre-existing harmless wording differences in §§3.2, 3.7 and 3.10; their hypotheses and mathematics agree.

`git diff --check` passed with no output. No `Suggested.lean` exists in this design package. No Lean file was added or edited, and no Lean command was run. The new comparison needs smooth admissible/Casselman–Wallach and Whittaker carriers absent at the pins, so it remains a README theorem target. The mathematical source comparisons and boundary computations below are not a Lean proof or independent acceptance.

The pins were checked against `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches confirmed the existing sesquilinear orthogonal, tensor, dual, intertwiner and points-functor carriers, without a local Whittaker/Casselman–Wallach/GGP carrier. The existing supplier declarations were retained: `LinearMap.Nondegenerate`, `Submodule.orthogonalBilin`, `Representation.IntertwiningMap`, `Representation.tprod`, `Representation.dual` and `TauCeti.HopfAlgebra.pointsFunctor`.

Read-only main-roadmap comparisons used ReductiveGroups, GlobalNumberFields and Completed/RestrictedProducts for structure and ownership. The supplied open-roadmap copies QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics have no overlapping ownership of the repaired local-distribution, Whittaker-period or unitary-transfer inputs. The real oscillator input remains distinct from finite/lattice Weil and holomorphic theta constructions.

Five additional legal copies were fetched through the sources service and recorded: `zhang-period`, `bernstein-zelevinsky`, `bp-plancherel`, `bp-fundamental` and `ag-descent`. The initially timed-out descent lookup succeeded using its arXiv identifier. No reference remains missing. The `xue-bessel` waiver was retained. Citations distinguish the read preprint versions: Zhang v4, Plancherel v2, fundamental lemma v3 and descent v6. The OCR-sensitive theta formulas were also checked visually in the legal Xue copy, p. 1010.

## Adversarial mathematics pass

The rows cover each target together with its named APIs and Checks. The standing field hypotheses reject the zero ring, characteristic 2 algebraic coefficients and inseparable quadratic algebras; analytic characteristic-p fields are outside the source range. Residue characteristics 2 and 3 remain included. The residue-cardinality boundary q=1 is impossible. No positive-rank, compactness, globalizability or nonzero-global-period hypothesis was introduced into a local theorem.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Form/rank conventions | Hyperbolic e,f; rank-one split E; real positive and negative lines | Norms 0, mutual pairing 1; split group F×; both line signs retained | None |
| Pairing/character/induction conventions | B(i,1); ν(h)=i; upper GL₂ diagonal (a,1) | Values i, i and δ=abs(a); normalized induction introduces its square root | None |
| Epsilon/component/measure conventions | Degrees 2 and 1; double nonnorm change; constituent counts (1,1),(2,1); Haar scales 2,1/2 | Sign changes cancel twice; coefficients 1/4,1/8; product-one Haar scaling cancels | None |
| 1.1 RelevantHermitianPair | W=0 and a line; H plus a line; definite real rank 3 | Ranks 1,3; definite rank 3 fails r=1 relevance | None |
| 1.2 besselDatum | r=0; two simple coordinates; split GL₃ | Diagonal group at r=0; additive coordinates sum; both split coordinates needed | Layer 7 supplier reference |
| 1.3 besselTransport | Identity and composed frames; h and −h; changed additive data | Identity/composition hold after character transport; frozen labels cannot be compared | None |
| 2.1 besselModel | H=1; U(1) weights (1,−1),(1,1) | Dimensions 1,1,0; smooth dual is in the required slot | Category/globalization requests separated |
| 2.2 adjacentInvariantDistribution_symmetry | Norm-one scalar; upper GL₂ unipotent and its transpose; two noncommuting matrices | Conjugate-inverse is identity on rank one; transpose reverses product order | Named general descent/GK gap |
| 2.3 besselMultiplicity_adjacent_le_one | U(0) in U(1); ramified Q₂; GL₂(R) in GL₁(R) restriction direction | Dimension 1 at rank zero; dyadic and noncompact cases remain admissible | Named criterion supplier |
| 2.4 besselHom_nonarchimedean_reduction | W=H,r=1; forbidden Bernstein block; upper GL₂ modular factor | Y has rank 2 in Witt-index-3 W′; block exclusion is necessary; induction is unnormalized | Isotropic wording and boundary Check; separate Bernstein/mirabolic requests |
| 2.5 besselHom_archimedean_injection | r=1; two-dimensional S; parameter at an exceptional point | Generic parameter can be chosen in a common componentwise half-plane; no assertion at every s | Globalization, generic induction and seminorm requests separated |
| 2.6 besselMultiplicity_le_one | W=0; both real line signs; compact noninterlacing weights | Bound allows both 0 and 1; no existence follows from uniqueness | None |
| 2.7 adjacentTemperedIntegral_converges | Compact U(1); noncompact split rank one; trivial GL₂×GL₁ representations | Compact mass retained; tempered decay is needed; trivial non-tempered integral diverges | Individual group bounds separated from relative integrability |
| 3.1 ggpEpsilonCharacter | Empty smaller parameter; generator signs (−1,+1); multiplicity two | Empty factor 1; sum sign −1; central coordinate counts multiplicity modulo two | None |
| 3.2 ggpEnhancement_transport | Nonnorm in degree (2,1); norm scalar; real −1 | Even-side generator changes sign; norm change trivial; two changes undo each other | None |
| 3.3 temperedBesselForm | H=1 of mass a; compact character weights; higher r | Form is aB; orthogonality gives 0 or mass; higher-r integration needs the extension | Germ, spectral and Fourier-extension contracts separated; relative theorem retained |
| 3.4 besselGeometricMultiplicity | Identity; x=−1 on a line; zero θ; compact U(2)×U(1) | Discriminants 1 and 4; zero θ gives zero; empty orbit set gives zero germ | Empty-orbit definition and Check |
| 3.5 besselLocalTraceFormula | Zero smaller space; noncompact real form; proper-Levi induction | Whittaker germ survives rank zero; regularization needed; GL germ factor retained | General harmonic inputs separated |
| 3.6 besselPacketFourierIdentity | με=−1,+1; order-two Fourier weights (1,−1) | Total masses 0,1; Fourier inversion selects the nontrivial enhancement | One actual-packet identity owner; geometric transfer remains separate |
| 3.7 besselTemperedPacket_nonarchimedean | W=0; dyadic extension; wrong enhancement | No spurious zero-space inner form; wrong enhancement has multiplicity 0 | None |
| 3.8 besselRealThetaReduction | Self-dual counts (2,1)→(0,1); absent/present splitting character; equal rank | Count drops by 2; two/one target signatures in adjacent rank, one in equal rank | Oscillator versus small-lift gaps; exact signature/parameter conditions |
| 3.9 besselTemperedPacket_real | Compact U(2) weights (1,0), smaller weights −1 and 1; negated forms; W=0 | Multiplicities 1 and 0; transported sign has same model; rank-zero model dimension 1 | None |
| 3.10 splitTemperedBesselPrediction | GL₁×GL₀; adjacent GL₂×GL₁; regular unitary GL₃ principal series | Dimensions 1,1; GL₃ generic character gives 1, trivial character gives 6 | Replaced status-only bullet; general Jacquet supplier gap |
| 3.11 besselSplitGeneric_nonvanishing | Adjacent real pair; higher finite pair; higher real pair | Certified ranges unchanged; no higher real proof inferred | Final bound now cites §2.6; all-place GL genericity explicit |
| 4.1 globalBesselPeriod | Empty unipotent; ν(h)=i; character nontrivial on H(F) | Adjacent diagonal integral; translation factor i; last datum cannot descend | None |
| 4.2 globalPeriod_localObstruction | One zero local model; local reference values 2,3; one scalar reference change | Global period zero; product multiplier 6; reciprocal local rescaling | None |
| 4.3 unitaryTensorLRepresentation | Smaller rank 0; ranks (2,1); split place | L=1 at rank zero; dimension 4; two conjugate local factors retained | None |
| 4.4 globalBesselConjecture | W=0; all local models but zero central value; fixed versus existential form | Generic coefficient criterion; central value remains necessary; fixed pair retained | None |
| 5.1 unitaryPeriodNormalizer | n=1; split finite place; zero global central value | Δ₂=L(1,η)L(2,1); local factors finite nonzero; global quotient may vanish | Individual factor inputs only; C_v derived here |
| 5.1a splitAdjacentWhittakerPeriod | n=1; dt→2dt; λ(W)=0; positive pairing scale b | Raw diagonal ab·abs(L(1/2))²>0 on a test tensor; Haar doubling doubles it; kernel diagonal zero | New necessary split comparison with three Checks |
| 5.2 normalizedLocalBesselPeriod | Compact inverse weights; zero vector; split nonzero Whittaker tensor | Values a/C_v; α(0,0)=0 and no q(0); split form actually nonzero | §5.1 normalizer reference and §5.1a split proof |
| 5.3 normalizedLocalBesselPeriod_spherical | Unit-volume vector; Haar doubling; ramified or dyadic data | q=volume; doubles with Haar; spherical hypotheses do not govern existence of bad-place integrals | General spherical-data gap separated |
| 5.4 unitaryPeriod_rescaling | Pairing doubled; Haar factors 2,1/2; global H measure doubled | Pairing cancels in q; local product unchanged; squared global period multiplies by 4 | None |
| 5.5 allPlaceBesselProduct | Enlarged exceptional set; zero exceptional local factor; arbitrary local normalizer Euler product | Coherence from spherical volumes; zero allowed; no central Euler-product convergence inferred | None |
| 6.1 globalWhittakerRelativePeriods | n=1 Asai signs; zero vector; vanishing central value | Signs +,−; unnormalized values zero; λ zero exactly at zero central value | Removed unused geometric transfer dependency |
| 6.2 unitaryGlobalRelativeCharacter | Basis change; convolution square; zero period | Basis-independent; global J nonnegative; zero period gives zero J | General spectrum owns its actual kernel carrier |
| 6.3 starGenericRelativeContribution | Two or three constituents; nonrelevant support; omission of split centre | Coefficients 1/4,1/8; nonrelevant term zero; centre must count | Carrier input comes from general spectrum, not geometric comparison |
| 6.4 isolatedUnitaryRelativeComparison | No auxiliary supercuspidal; transfer zero on other forms; three constituents | Isolation still available; selected form retains all actual realizations; coefficient 1/8 | Four separately normalized geometric/transfer/fundamental-lemma gaps |
| 6.5 temperedRelativeCharacterEulerIdentity | Missing local model; local κ and reciprocal κ; constituent counts (2,1) | Both sides zero without division; global κ product 1; coefficient 1/8 | Dedicated local character-comparison gap |
| 7.1 unitaryAdjacentGlobalNonvanishing | n=1; endoscopic parameter; a prescribed form with no local model | Existential inner form is essential; no temperedness introduced | None |
| 7.2 unitaryStableGlobalNonvanishing | n=1 boundary; wrong Asai sign; no split supercuspidal place | Stable theorem keeps n>1; n=1 uses §7.1; correct pole sign retained | None |
| 7.3 harrisRefinedUnitaryConjecture | Constituent counts (1,1),(2,1); zero vector; mixed vectors with zero pairing | Coefficients 1/4,1/8; quotient excludes zero vector; polarization clears denominators | Product reference §5.5 |
| 7.4 ggp8UnitaryPeriodIdentity | f→cf; local Haar factors 2,1/2; zero central value; endoscopic counts | Norm scaling cancels; Haar product cancels; all period values then zero; coefficient 1/8 | Product reference §5.5 |
| Distribution supplier contract | Trivial M=N; zero normal space; finite versus real null-cone Fourier support | Multiplicity product 1 allowed; descent is conditional; real homogeneity requires a stable subspace | Precise general theorem, no assumed unitary symmetry |
| Archimedean supplier contracts | Split E with d=2; finite S; exceptional inducing parameter; N=1 Whittaker bound | Componentwise parameters and finite-basis bounds; no arbitrary-s irreducibility | Independent category, irreducibility and estimate requests |
| Local harmonic supplier contracts | Compact non-quasi-split centralizer; proper Levi; λ=0 with integrable weight | Zero germ; proper induction constants; ordinary integral recovered | Separate germs, group bounds, Plancherel and conditional Fourier extension |
| Relative transfer supplier contracts | n=1; ramified dyadic finite place; infinite dense subspace; inert unit versus split spherical test | Exact finite transfer and dense infinite transfer distinguished; no full nonsplit Hecke lemma assumed | Groups, Ω, Haar factors and local/global κ comparisons explicit |
| Real theta supplier contracts | n=0; equal/adjacent rank; splitting character absent/present; wrong-sign paired summands | One/two/one signatures as appropriate; paired summands add (t,t); big-lift irreducibility unused | Exact signatures from actual enhancement, not merely discriminant |

## Maintainer consequences

The former compound slugs have these replacements:

| Former contract | Registered replacements |
| --- | --- |
| `local-categories` | `local-categories`, `local-bernstein`, `local-mirabolic`, `gl-tempered-genericity`, `local-jacquet-filtration`, `local-spherical` |
| `archimedean-estimates` | `archimedean-globalization`, `archimedean-generic-induction`, `archimedean-seminorms` |
| `local-harmonic-analysis` | `local-schwartz-germs`, `local-tempered-bounds`, `local-plancherel`, `local-fourier-extension` |
| `real-theta` | `real-oscillator-model`, `real-small-theta` |
| `relative-trace` | `relative-geometric-comparison`, `relative-finite-transfer`, `relative-archimedean-transfer`, `relative-fundamental-lemma`, `relative-character-comparison` |

These are supplier requests, not implementations or invented existing supplier targets. Providing the requested sections, assigning any actual Part II continuation and placing it earlier require upstream/maintainer action. This package does not change another roadmap or the merge order. The previously registered spectral-isolation placement gap remains.

No existing theorem/API export was renamed. The new target and APIs are `splitAdjacentWhittakerPeriod`, `splitAdjacentWhittakerPeriod_nonzero` and `splitAdjacentWhittakerPeriod_rescale`. The proof-status Check name `split_prediction_status` was replaced by `split_prediction_generic_character`; the two boundary Checks and three split comparison Checks were added. The consumer label `GanGrossPrasadUnitaryGroups:GGP.8` and all consumer-facing hypotheses remain. No later supplier was introduced and no ownership was moved from a later roadmap.

Only `packages/GanGrossPrasadUnitaryGroups/design/README.md`, `packages/GanGrossPrasadUnitaryGroups/design/plan.json`, `packages/GanGrossPrasadUnitaryGroups/sources.toml` and this requested report were written in the board checkout. No commit, push, pull-request edit or external message was made. Fresh independent review remains necessary.
