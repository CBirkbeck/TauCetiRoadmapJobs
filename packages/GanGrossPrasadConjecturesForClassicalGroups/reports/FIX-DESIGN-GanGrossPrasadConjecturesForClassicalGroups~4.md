# Design repair report

## F01 (P1) — applied

Blanket full-quotient convergence → ordinary convergence on specified domains and a named split equal-rank meromorphic construction (§6.2a). Added regularity, equivariance, ordinary agreement, auxiliary-choice/measure laws, polar obstruction and Gaussian divergence Checks. Updated §6.4 and the theta/growth contracts. Evidence: ggp line 1999–2004, ggp line 3123–3146; liu-relative line 1492–1543.

## F02 (P1) — applied

Constituent-degree parity → ambient-degree parity: degrees d_i sum to m, and every constituent uses (−1)^(m+1). Restricted the decomposition/multiplicity contract to generic Arthur parameters, explicitly including everywhere-tempered cusp forms. Added the ambient-degree-two partition-1+1 Check. Evidence: bpcz line 95–100, bpcz line 112–118, bpcz line 148–151.

## F03 (P3) — applied

SO reduction §3.7 → §3.6; skew-unitary reduction §3.8 → §3.7; higher-codimension milestone §3.6 → §3.8. Mathematical statements and four-family conclusion are preserved. Updated internal references, plan order, gap consumers and source consumer identifiers. All target prerequisites now precede their consumers. The reductions remain supported by ggp line 2661–2700.

## Verification and mathematical evidence

The GL1 witness is admissible: a split skew-Hermitian line has group GL1, the zero complement is relevant, and a torus has no proper-parabolic cusp condition. With the unitary inverse-coordinate Gaussian the zero summand gives t^(−1/2). Integrating over epsilon ≤ t ≤ 1 gives the lower bound 2(epsilon^(−1/2)−1); finite integral units have positive measure. The source's unnormalized action also diverges, with lower bound log(1/epsilon). A Petersson norm modulo the center cannot change either calculation.

The replacement uses liu-relative Remark 3.6, pp. 23–24, not the divergent displayed formula: liu-relative line 1496–1506 defines the central nonzero-vector theta family and its continuation; liu-relative line 1508–1543 gives the center-quotient pairing, equivariance and pole domain. The ordinary unequal-rank integral is distinguished explicitly at liu-relative line 1179–1189. The number-field source is cited by its arXiv v1 numbering. The odd-characteristic function-field analogue remains an explicitly owned construction target.

For the new translation law, the factor abs(det g)^(s−1/2) gives Z_s(R(k)f,Omega(k)Phi) = abs(det k)^(−(s−1/2)) Z_s(f,Phi). Thus a holomorphic central specialization is invariant. At a simple pole, expanding the exponential gives C ↦ C−log(abs(det k))R. This supplies the precise obstruction to silently using a polar finite part. Fourier transport of Phi(g⁻¹w) contributes the Jacobian abs(det g); the two half-density formulas and their value at g=2 are recorded as a Check.

The Asai evidence fixes the ambient n before quantifying over its partition in bpcz line 95–100. Its generic-parameter interpretation is bpcz line 112–118; everywhere-tempered cuspidal input is supplied in bpcz line 148–151. Neither source supports applying this trivial-Arthur-SL2 decomposition to arbitrary nongeneric cuspidal Arthur data.

Read the main-branch shape examples ThetaSeries, LocalGaloisGroups and CompactOperators. Compared supplier ownership in AutomorphicFormsOnReductiveGroups §0.4, MetaplecticAutomorphicForms §§5.1–5.2, 5.8 and EndoscopicTransferAndUnitaryTraceComparison §11.4. Their general growth, theta and generic classification directions remain suppliers; the new construction is the relative central Mellin pairing, not a second regularized dual-pair theta integral. The four specified open sibling roadmaps' ownership sections give no competing relative-period or Asai target.

Verified the local library checkouts have exactly the manifest pins: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read `Mathlib/RepresentationTheory/Intertwining.lean` and `TauCeti/RepresentationTheory/Continuous/Intertwining.lean`, including the finite-dimensional Hausdorff source hypotheses of `ContRepresentation.intertwiningMapEquiv`. Object searches for Fourier–Jacobi, Asai, Arthur parameters and regularized theta found no existing carrier for the new headline. No `Suggested.lean` exists in this design package; none was added or changed, and no Lean command was run. The unavailable automorphic/theta carriers keep §6.2a in the README.

## Check outcomes

Dependency gate: exit 0. Exact output:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 5 roadmaps, 35 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The merge order was not edited.

Structural consistency check: exit 0. JSON and TOML parse; all README target/API/Check names agree with the plan; subsection order agrees; every internal target prerequisite points backwards. All 40 gap contracts have equal `detail`/`needs`, matching README contracts and exact consumer lists. There are 51 targets, 85 API entries and 157 Checks. All 25 definitions/constructions have named APIs and at least three Checks. All 13 certified source texts are accessible. The additional source was fetched through the sources service and recorded in `sources.toml`; no required text is missing.

`git diff --check`: exit 0, no output. Edited design/source files contain no machine paths or forbidden display delimiters. Only the three authorized package files and this requested report were changed. No commit, push, pull-request write or supplier edit was made.

## Adversarial mathematics pass

Each target row covers its hypotheses, associated API and Checks. These are specification checks and boundary arguments, not completed formal proofs of the planned theorems. No additional target outside the three findings was introduced.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Form, field and coefficient conventions | Zero ring; characteristic two; Q2; Q(x)=x²; complex hyperbolic plane | Field and invertible-2 hypotheses reject the first two; Q2 is allowed; polar value 2 and partner scaling by i agree. | None |
| Cover, dual and tensor conventions | Kernel involution; two characters z,u; trivial group | Genuine signs cancel; inverse splitting gives z/u; a Hom-to-dual comparison requires the stated category. | None |
| Frobenius and analytic conventions | q=2,s=1; q=1; a pole | Local value 2; q=1 is outside local-field data; poles are not scalar values. | None |
| Pairing, measure and component conventions | Scalar 2i; reciprocal Haar rescalings; constituent totals 2,3 | Squared scaling is 4; product-one rescalings preserve the measure; coefficients 1/4,1/8 agree. | None |
| §1.1 RelevantPair | Both signs with zero complement; positive real plane; skew i·diag(1,1) | Zero complement is skew-relevant only; parity alone does not ensure the required isotropic rank. | None |
| §1.2 relativeSubgroup | Empty flags; j(1,g),j(u,1); rank 0,1; nonstandard Gram matrix | Diagonal second coordinate and low-rank groups agree; inverse transpose is necessary for column isometries. | None |
| §1.3 IsRelevantInnerForm | Identity marking; equal dimensions/different real signatures; split GL | Complement isometry, rather than dimensions, determines relevance; split GL has no additional pure twists. | None |
| §1.4 splitPairEquiv | Rank 0,1; scalar 2 | Actions (2,1/2) preserve the pairing, while (2,2) fails. | None |
| §2.1 besselCharacter | Empty sum; root coordinates 1,−1; split idempotent coefficient | Empty character is trivial; two terms cancel; a nongenerating residual vector or factorwise trivial character is rejected. | None |
| §2.2 fourierJacobiQuotient | X=0; W=0; rank-one X; split idempotent map | Separate zero-X branch is needed; commutator uses 2B; a nonzero nonunimodular map is not surjective. | None |
| §2.3 fourierJacobiRepresentation | Cover kernel; equal rank; W=0; one changed splitting | Genuine signs, basic oscillator and flag-only branch remain distinct; incompatible splittings do not compare. | None |
| §2.4 Model | H=1 with C,0 and infinite direct sum; sign representation of Mp(0) | Dimensions 1,0 and infinite differ; genuineness is detected; cardinal dimension avoids a false finrank conclusion. | None |
| §3.1 basicMultiplicityOneNonarchimedean | Q2; SO(1)/SO(0); rank-zero oscillator | Characteristic-zero bounds include dyadic fields; the one-dimensional boundary is sharp. | None |
| §3.2 basicMultiplicityOneArchimedean | Zero rank; nontrivial Jacobi central character; infinite-dimensional vectors | The stated continuous Casselman–Wallach and central-character conditions are essential. | None |
| §3.3 besselInductionReduction | Insufficient Witt index; forbidden Bernstein support; O versus SO | Empty exclusions are legitimate; support in a closed orbit is excluded; O does not automatically give SO. | None |
| §3.4 fourierJacobiInductionReduction | X=0; genuine Levi multiplier; incompatible cover sign | Nonbasic reduction requires positive rank and the actual genuine twist. | None |
| §3.5 MultiplicityOneAssertion | Trivial irreducible; reducible C²; undistinguished input | Multiplicities 1,2,0 distinguish the actual irreducible quantifier from false stronger assertions. | None |
| §3.6 specialOrthogonalBesselInductionReduction | SO(3)/SO(0); two maximal-isotropic components; absent Levi | Vplus has dimension four and Witt index two; SO components must be retained. | Moved before consumer |
| §3.7 skewUnitaryFourierJacobiInductionReduction | Codimension-two plane; X=0; wrong mu on one space | GL_E(1) reduction and inverse multiplier cancellation agree; basic case and changed splitting are separate. | Moved before consumer |
| §3.8 higherCodimensionMultiplicityOne | All four families; basic boundaries; Q2 | Reductions use the same field, correct parity and cover data; every input now precedes the milestone. | Reordered |
| §4.1 parameterSignDomain | M=0; repeated irreducible; hyperbolic dual pair; two odd summands | Component orders 1,2,1 and determinant-kernel order 2 agree with multiplicity-space centralizers. | None |
| §4.2 conjugateRootCharacter | N=0; two signs −1,+1; odd/even dimension under nonnorm scaling | Values 1,−1 and parity-dependent change agree; constant −1 is not a character. | None |
| §4.3 selfdualRootCharacter | Zero parameter; two symplectic parameters; real odd-N negative control | Even-dimensional domain and determinant corrections are retained; the real corrected value is +1. | None |
| §4.4 distinguishedCharacter | Split GL; odd trivial line; inverse mu eigenvalue | Split enhancement is trivial; N⊕1 is needed locally; tensor value is z/u. | None |
| §4.5 selectionChangeData | Identity change; nonnorm odd-rank scaling; scalar splitting ratio u | Identity maps and specified sign changes agree; tensor reassociation has value zu. | None |
| §4.6 LocalSelectionAssertion | Singleton packet; two inner forms; nongeneric parameter | Uniqueness ranges over relevant marked forms; nongeneric parameters are outside the proposition. | None |
| §4.7 splitLocalSelection | Generic GL2×GL1; archimedean higher codimension | Basic singleton is covered; the stronger higher-codimension archimedean theorem is not asserted. | None |
| §4.8 localSelectionReduction | Basic codimension; SO and skew-unitary branches; R,C | The implication retains actual basic assertions and enhanced induction; Bernstein argument is nonarchimedean. | References remapped |
| §5.1 unitaryTemperedBesselSelection | Ramified Q2; both residual-line orders; Q3(√3) | +nu0 and −nu0 differ when −1 is not a norm; scaling the generator by 2 multiplies the norm by 4. | None |
| §5.2 unitaryStandardModuleMultiplicity | Empty inducing blocks; unordered exponents; crossed reduced ranks | Empty equality is the identity; standard ordering and Witt-cancellation comparison remain required. | None |
| §5.3 unitaryGenericBesselSelection | Generic nontempered module; tempered boundary | Generic irreducibility and the separate standard-module reduction are needed; genericity is not temperedness. | None |
| §5.4 unitaryThetaBesselJacobiBridge | Zero lift; nonzero tower; equal rank | Seesaw uses the nonzero lift; P2 and parameter laws suffice without assuming the downstream GGP conclusion. | None |
| §5.5 unitaryGenericFourierJacobiSelection | Wrong mu restriction; ramified dyadic field; r=0 | Wrong splitting is rejected; Q2 and the basic equal-rank branch remain included. | None |
| §5.6 unitaryTemperedPacketUniqueness | Many real signatures; complex split place | Search is over relevant pure inner triples; no nonexistent nonsplit quadratic extension of C is used. | None |
| §6.1 globalBesselPeriod | Codimension one; zero vector; GL1 norm direction; split orthogonal plane | Period convention and exclusions agree; a center-quotient norm does not make the full quotient finite-volume. | None |
| §6.2 globalFourierJacobiPeriod | Nonsplit group; unequal split ranks; rank zero; split GL1 Gaussian | The first domains have the specified convergence theorem; the Gaussian lower bound diverges on positive measure. | Convergence domain and negative control repaired |
| §6.2a central theta definition and meromorphic API | n=1; n=0; chi central character; beta norm exponent b | Nonzero-orbit Mellin integral starts at Re(s)+b>1; central character is chi inverse; GL0 uses no Mellin integral. | Added |
| §6.2a row-model normalization | Real scalar 2; normalized and unnormalized inverse actions | Fourier transform gives factors √2 and 2 respectively; beta changes by abs(.)^(1/2) in the latter convention. | Added computed Check |
| §6.2a invariant and polar APIs | Unitary Tate integral; beta=abs(.)^(−1/2); determinant norm e | Central value is regular in the first case; the second has a pole and finite part changes by −R. | Separate regular and polar outputs |
| §6.2a ordinary agreement and choices | Phi(0)=Fourier(Phi)(0)=0; Mellin splitting point; reciprocal measure factors 2,1/2 | Both central ends decay; comparison includes zero-orbit analysis; the value is independent of the splitting point and compensated rescaling. | Added comparison and choice laws |
| §6.3 distinguishedLRepresentation | M=0; dimensions 2,1; split algebra | L=1 for the zero representation; global tensor dimension is 2 rather than 4; split product has both factors. | None |
| §6.4 GlobalNonvanishingAssertion | One zero local model; central value zero; zero vector; polar split family | Nonvanishing concerns a functional; local obstruction requires an invariant period; a polar finite part cannot enter the scalar assertion. | Continued period and regularity domain propagated |
| §6.5 UnitaryPeriodDatum | Norm line at 1; rational isometry; actual versus arbitrary functional | Norm-line value 1 and transported Tamagawa integral agree; the period is tied to the automorphic realization. | None |
| §7.1 orthogonalDelta | d=2,3,4; hyperbolic plane; global split plane | L(1,chi), zeta(2), zeta(2)L(2,chi) and discriminant sign agree; the split-plane pole forbids a scalar value. | None |
| §7.2 orthogonalLocalPeriod | Zero vector; multiplying first or second vector by i; singular quotient | The two factors have opposite conjugation; zero or infinite normalizing quotient is outside scalar alpha. | None |
| §7.3 orthogonalTemperedAndSpherical | Tempered restriction; spherical compact volume doubled | The convergence theorem and six spherical conditions stay separate; doubled volume gives alpha=2. | None |
| §7.4 OrthogonalRefinementAssertions | Centralizer orders 2,4; measure scale 3; zero vector; ALG | Coefficient 1/8 and compensating C0/3 agree; zero ratios are excluded and ALG does not imply temperedness. | None |
| §7.5 unitaryNormalizedLocalPeriod | Zero vector; multiplication by i; Cv replaced by 2Cv; q=2 | Sesquilinearity and inverse Cv normalization agree; L_v(1,1)=2, while s=0 is a pole. | None |
| §7.6 unitaryLocalConvergenceAndSpherical | Ramified, dyadic and infinite places; spherical volume 2 | All-place integrals remain; spherical comparison is almost everywhere and retains local volume. | None |
| §7.7 unitaryNormalizationInvariance | Vector 2i; pairing scaling; reciprocal and single Haar scaling | Vector ratio is unchanged; a single doubled measure violates fixed Tamagawa factorization. | None |
| §7.8 unitaryGlobalConstant | One constituent each; three total; zero central value | Sign-group orders 4,8 give 1/4,1/8; the numerator may vanish and is never inverted. | None |
| §8.1 relativeCharacters | Basis phase i; empty spectrum; zero period; split GL1 constant coefficient | Phase cancels only with conjugation; local divergent data are excluded by tempered/convergence hypotheses. | None |
| §8.2 linearRelativeContribution | Two/three constituents; irrelevant datum | Powers give 1/4,1/8; irrelevant contribution is zero, not an invertible distribution. | None |
| §8.3 isolatedRelativeComparison | Enlarging S0; zero test functions; ramified and infinite places | Measure factors and transfer units must accompany enlargement; both sides vanish on zero functions. | None |
| §8.4 unitaryEndoscopicNonvanishing | Ambient degrees 1,2; partition 1+1 in degree 2; unrelated fixed h | Ambient degree two requires Asai− on both degree-one summands; h remains existential. | Generic domain clarified; partition Check added |
| §8.5 unitaryRelativeCharacterFactorization | One zero local model; constants k,k⁻¹; single/compensated ambient Haar scaling | Zero case needs no division; comparison constants and both Haar products are retained. | None |
| §8.6 unitaryRefinedPeriod | Stable/endoscopic totals 2,3; zero period; vector 2i | Constants 1/4,1/8 and zero identity agree; normalized formula is invariant under vector scaling. | None |
| §8.7 stableUnitarySpecialization | n=1; two cuspidal base changes; opposite Asai convention | bplzz specialization requires n>1; n=1 uses bpcz; the pole dichotomy compares the sign conventions. | None |

## Maintainer consequences

No declaration was renamed or deleted. The new README-only construction is `GGP.splitEqualRankFourierJacobiPeriod`, with `_meromorphic`, `_invariant`, `_agrees`, `_choices` and `_polar` APIs. Section-number consumers must use SO §3.6, skew-unitary §3.7 and higher-codimension §3.8. The existing `GGP.globalFourierJacobiPeriod` now has its accurate ordinary convergence domain; general split positive equal rank uses §6.2a. `GGP.GlobalNonvanishingAssertion` requires that continued period to be regular at the center.

The existing supplier gaps remain gaps: this repair corrects their requested mathematics without claiming that another roadmap has supplied it. The theta/growth contracts distinguish compact theta convergence from relative integrability and require the uniform estimates used in the new construction. The base-change contract requests the ambient-degree parity and generic domain. No new supplier, upward dependency or ownership transfer was introduced. GGP.8 and its unitary Bessel-period consumers retain their statements and normalization.
