# Repair report: OverconvergentAutomorphicForms

The first seventeen finding sections refer to review r1a. The four subsequent sections refer to r1b; its F05 overlaps r1a F12 and is settled there. Repeated finding identifiers retain the identifiers used by their respective reviews. Changes concern `packages/OverconvergentAutomorphicForms/README.md`, `packages/OverconvergentAutomorphicForms/Suggested.lean`, and `packages/OverconvergentAutomorphicForms/sources.toml`.

## F01 (P1) — applied

General Gᶜ coefficients → representations of Gʳ=G/Zᵣ(G), with quotient parabolics, Levi groups, reduction maps and cyclotomic twists throughout §§8.6–8.7. Gᶜ is used only under the supplied CM-split-centre identification. Evidence: `TauCetiRoadmap/PerfectoidShimuraVarieties/README.md` §6.1a. Added its cubic norm-one torus counterexample: infinite-order central congruence units obstruct the multiplication representation's descent.

## F02 (P1) — applied

New unsplit ramified-generator target → the existing supplier's §3.12 and §§4.6–4.8, specifically `ramifiedPeriod_comparison` and `canonicalKernel_congruence`. Deleted `hilbertPeriod_unsplitRamifiedGenerator` and corrected its ownership/dependency claims. The closed odd-prime endpoint remains this roadmap's extension. The supplier explicitly projects a scalar kernel congruence after constructing the unsplit canonical module; it assumes no integral embeddingwise splitting.

## F03 (P1) — applied

Reconstruction of compact weight geometry → specializations of PhiGammaModulesAndIwasawaCohomology §4.0 through LocallyAnalyticDistributions §3.3. Imported compact Mellin equivalence and §4.15 common-radius analyticity. Retained number-field charts, inverse-norm pullback, noncompact products and locally L-analytic equations. Corrected PadicMeasuresIwasawaAlgebras to §3a.1. Both suppliers explicitly own the universal characters and rigid representability.

## F04 (P3) — applied

Drifting T5/T6 references → HodgeTateAndCanonicalSubgroups §§5.8, 5.10–5.12 for the torsor, lift, factor and comparison; §2.10 and §§7.29–7.30 for Hodge-type comparisons; PerfectoidShimuraVarieties §6.1a for arbitrary pure data. Updated the supplier table and §5.4. The cited sections actually name the consumed maps and retain their cyclotomic orientation.

## F05 (P3) — applied

Single-character support implies a character line → a length-one skyscraper at an E-valued character gives its line; punctual support alone permits multiplicities and self-extensions. The module E[T,T⁻¹]/(T−χ(1))² supplies the nonsplit Check, consistently with the character-inversion convention. Its generator has a nonzero nilpotent part, although its support has one point.

## F06 (P2) — applied

Unconditional closure of the fixed arithmetic classical space under local unramified twists → a twisting theorem requiring a global automorphic twist with specified resulting data, or an actual intertwiner into Π. Updated both Checks. At fixed algebraic weight and finite level, finitely many classical refinements cannot accommodate arbitrary Eˣ-valued changes of local uniformizer eigenvalues.

## F07 (P2) — applied

Injectivity alone → the additional headline `determinantLineMap_translation`, with an explicit GL unit formed from the transposes of h and h⁻¹. It states the multiplier χ(det h) on transpose translation, for finite indices and arbitrary commutative coefficient rings, including empty indices and zero rings. The identity follows from determinant multiplicativity and invariance under transpose.

## F08 (P3) — applied

Deleted the untyped Lean tail inventory. Heavy constructions remain specified in the README. Local docstrings explain the few omitted APIs belonging to each kept definition; they do not replace unavailable carriers with a declaration catalogue. The module docstring continues to state that the signatures are representative.

## F09 (P1) — applied

Affinoid induction asserted to have compact type over E₀ → compact type over a finite coefficient field, and a relative locally convex A-module construction for affinoid families. Added the torus with A=E₀⟨T⟩: all stages are A, while Tⁿ have pairwise distance one. Thus identity transitions are not compactoid over E₀. Evidence: bp line 6910; this direct counterexample fixes the coefficient interpretation.

## F10 (P1) — applied

Second definitions of analytic vectors and Banach admissibility → CompletedCohomologyPartII F.4 and F.1. Added the bounded-measure/rational-Schikhof comparison and retained the regular-embedding, strong admissibility, coadmissible duality, essential admissibility and Jacquet targets. Removed the nonexistent bare CompletedCohomology supplier. The actual supplier distinguishes analytic fields and already supplies the orbit-vector topology and compact-open restriction.

## F11 (P3) — applied differently

Corrected BHW/AIP result kinds, ordinary citations and page ranges. BHW Definition 6.8 is on p.1758, not the proposed p.1759: bhw line 1896 supplies the page header and line 1922 the definition. AIP corrections follow aip-cusp lines 715, 839, 852, 890, 902, 931, 957, 1101 and 1112. Edition-dependent BP/BHS/Breuil–Ding locators also follow the manifest's exact editions.

## F12 (P3) — applied

Settles r1a F12 and r1b F05. Added proved zero/sign norm tests, both constructor restrictions and the trivial pair, simultaneous character values giving 2, W=0, upper-unipotent determinant value, and identity/upper/lower/dyadic denominator cases. Combined related assertions to keep at most two examples per definition. The 2-value test explicitly supplies both input character values; no admitted continuity theorem enters it.

## F13 (P3) — applied

Absent manifest → thirteen uniquely keyed works, with authors, titles, years, exact editions, consumed sections/locators, legal provenance and hashes. Fetches used the sources service; unavailable author hosts were supplemented by legal alternatives and existing service-cached exact editions. The service materializes all thirteen and validates the manifest with zero problems. Resolved requests were cleared; no source text entered the package.

## F14 (P3) — applied

Rank-one induction line → torus coefficient line; the torus Jacquet Check → the general `locallyAnalyticJacquet`; nonzero p in every torsion-free ring → a nonzero torsion-free ordinary patch. SL₂ has a unipotent coordinate, the unitary application assumes n≥2, and the zero ring has p=0. These three witnesses verify the findings directly.

## F15 (P2) — applied

Odd-prime Siegel coefficients → every rational prime, with sufficiently deep dyadic character neighborhoods retaining the sign component. The quantitative canonical interpretation keeps its separate p>2g hypothesis. Added J=1+2Z, and its value 3 at Z=1, to the README and proved denominator tests. Integral Z makes this a dyadic unit; strict-Iwahori block congruences require no oddness.

## F16 (P3) — applied

Unrelated matrix calculations → real definitions `rightCocycleOfLeft` and `atkinLehnerBlock`, headlines stated through them, and proved tests of those definitions. The noncommuting test uses the identity group-valued left cocycle; its converted value at AB differs from BA. The block test gives [−6,1], and Z=0 needs no inverse. Each definition has three discriminating README Checks.

## F17 (P3) — applied

Full-group longest element in the rank-one Check → GL₂ with noncentral Hodge cocharacter, M=T and w₀,M=1. At ν=0 the weights are −2ρ for w=1 and 0 for w=s; distributions add 2ρ_nc. Direct substitution in bp line 7117 and its following weight formula verifies the correction and detects substitution of the wrong Weyl group.

## F01 (P1) — applied

Review r1b. An alleged supplied Siegel quantitative comparison → the owned target `siegelPeriodDomain_canonicalRange` in §8.2, with p>2g, n≥1, constant toric rank and c_g+n−1<w≤n. Added three boundary Checks and updated dependencies. DRW states the theorem at drw line 2101 and its consequence at line 2112; the Hasse-height supplier is only an input.

## F02 (P3) — applied

Review r1b. Replaced all seven identified admissions with proofs using the pinned APIs. These specialize the norm/rank, group inversion, matrix multiplication and determinant identities to this roadmap's definitions. `finrank_Op` uses `Module.finrank_baseChange` and `NumberField.RingOfIntegers.rank`; the block theorem uses `Matrix.fromCols_mul_fromBlocks`. Headline names and their intended generality remain available.

## F03 (P3) — applied differently

Review r1b. Defined `weightDualMap` and `weightMap` on their underlying monoid-homomorphism carriers, with separate continuity headline theorems. Their real bodies no longer use admitted proofs. The suggested wrapper would still have used admitted continuity in a kept definition, so it was not retained. The proved pullback formula and sign tests now depend only on real definitions and library theorems.

## F04 (P3) — applied

Review r1b. `DirectLimit.Ring.of` and `DirectLimit.Ring.lift` → `Ring.DirectLimit.of` and `Ring.DirectLimit.lift`. The pinned `Mathlib/Algebra/Colimit/Ring.lean` opens `namespace Ring` at line 41, `namespace DirectLimit` at line 63, defines `of` at line 66 and `lift` at line 131. `AdicCompletion` was already correctly named.

## Gate failures

| Original failure | Change and final outcome |
| --- | --- |
| Missing sources.toml | Added the schema-v1 manifest for all thirteen works. Service validation: 0 problems; all thirteen texts available. |
| tex=11 | Replaced braced superscripts/subscripts by Unicode or code-safe mathematical notation. The final text scan reports tex=0 and latex=0. No headings or internal links changed. |
| readme-ids-missing=12 | Added the translation and filtration signatures; connected the remaining exact API names to their kept definitions in mathematical docstrings. No tail name catalogue. Final count: 0. |
| round-labels=1 | Renamed the mathematical fixed-depth notation to H_depth and T_principal, avoiding the scanner's interpretation of the old radius label. Definition unchanged. Final count: 0. |

## Checks and exact outcomes

- Final `lake env lean` elaboration of `packages/OverconvergentAutomorphicForms/Suggested.lean` in the pinned content environment: exit 0; eleven expected `declaration uses sorry` warnings; no errors or other diagnostics. No TauCeti import is used, so no targeted supplier build was needed.
- A scratch copy with `#check @name` for every theorem: exit 0. Number-field and primality hypotheses survive in all admitted arithmetic and continuity declarations. Matrix theorems retain finite indices, decidable equality and commutative-ring binders; the noncommutative cocycle theorem retains its action and left-cocycle hypothesis. The proved algebraic pullback identity needs no number-field instance.
- The installed package text scanner, applied directly to the package's README and Lean with the configured restrictions: every count is zero. The content-checkout CLI expects a TauCetiRoadmap folder, so its initial layout-only invocation was inapplicable to the board's packages layout; the actual package scanner was subsequently used without changing any layout or tooling.
- Sources-service manifest check: exit 0, `0 problem(s)`. Sources-service cache materialization: exit 0, thirteen entries available. Hashes identify the 40-page AIP-adic, 35-page AIP-cusp, 181-page BP, final 53-page BHS-modulaire and 55-page BHS-smooth editions. There are no outstanding missing-reference entries.
- Dependency check with the requested roadmap name, supplied order and movable option: exit 0. Exact output:

```text
depcheck: 13 roadmaps, 107 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The source service retained the legal cache outside the repository. `git diff --check` passes. No commands remain running, and no commit was made.

## Adversarial mathematics pass

The table groups each subsection's definitions and API assertions with their boundary instances. A passed check records statement consistency and its discriminating instances, not a proof of the future geometric library. Proved Lean examples additionally verify the algebraic conventions at the pins.

| Statement or definition group | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §0.1 Op, topology, rank and scalar norm | F=ℚ; quadratic split and ramified primes; p=2; scalars 0, 1, −1, 2 | Finite free integral algebra; norm of a scalar is aᵈ, including nonunits | Proved rank; added zero and sign tests |
| §0.1 unit norm and global inclusion | Unit 1; η and η⁻¹; norm −1; positive quadratic units | Inclusion is not the norm; generic splitting supplies an embedding product, not an integral product decomposition | Retained precise supplier norm APIs |
| §0.1 principal units | Depth 0; depths 1 and 2; dyadic −1 | H₀ is the full group; greater depth decreases subgroups; −1 is excluded at depth 2 for ℚ₂ | Added antitone signature; kept proved depth-zero example |
| §0.2 character carriers and constructor | Either coordinate trivial; both trivial; both nontrivial | Product character recovers both restrictions; arithmetic space has one additional disc direction | Supplied representability; proved coordinate tests |
| §0.2 inverse-norm map | Identity; product xy; values w(x)=t(Nx)=2 at p=5 | Squaring and inverse norm give 2, whereas a forward norm gives 8 | Algebraic maps separated from continuity; formula proved |
| §0.2 central norm cancellation | N=4; norm ±1; mixed real signs; η=−1 excluded by level | Norm is ±1 and congruent to 1 mod N, hence 1 | Retained all congruence units and explicit level hypothesis |
| §0.3 radii and bounded families | Trivial, Teichmüller, algebraic xᵏ; dyadic sign; variable conductor | Principal-unit radius differs from full-unit supremum; zero numerical value does not mean zero analytic neighborhood | Imported common-radius analyticity; notation repaired |
| §0.4 finite coefficients, tensor, dual and base change | Zero; trivial line; ranks 2 and 3; character value 2 | Tensor rank 6; dual value 1/2; integral lattices retain extra structure | No change to valid targets |
| §0.4 induction and topology | Torus; SL₂; non-Zariski-dense M₁; A=E₀⟨T⟩ | Torus stage is A; SL₂ has power series; fieldwise compact type fails for the affinoid torus | Corrected compact-type scope and torus Check |
| §0.4 distributions and induction multiplication | Zero unipotent dimension; evaluations at 0 and 1; 1⊗z−z⊗1; finite order 3 | Open-disc dual is the specified carrier; multiplication has a kernel; finite twist requires an actual extension | Preserved extension and topology hypotheses |
| §0.5 Siegel induction and dictionary | g=1,2; weight κ and its inverse; noncommuting translations; (Tᵖ−T)/p | Transpose pullback has the stated order; inverse transpose and inverse Weyl character are both needed; pointwise integrality is weaker than Gauss integrality | No change to valid targets |
| §0.6 distribution algebra and coadmissibility | Trivial group; additive ℤₚ; noncommuting GL₂ elements; nonflat transitions | Convolution is not pointwise multiplication; nonflat systems fail the definition | No duplicate pinned object found |
| §0.6 analytic vectors and Banach admissibility | Trivial and finite-dimensional representations; C(ℤₚ,E); a nonanalytic continuous vector | Orbit topology and compact-open category are existing supplier objects; regular-model comparison is additional | Imported F.1/F.4; retained comparison targets |
| §0.6 admissible analytic duality | Zero; trivial group; C_la(H,E); a dense nonclosed subspace | Finite dimension at the trivial group; coadmissible duality needs closed kernels/Hausdorff quotients | Retained exact hypotheses |
| §0.6 full character spaces and essential admissibility | Z=1, ℤ, Kˣ; multiplicity 2; a Jordan block | Uniformizer coordinates survive; punctual support permits self-extensions | Imported compact Mellin theory; fixed punctual Check |
| §0.6 finite slope and positive Hecke | Eigenvalues 0 and 2; identity; index q; p=2 | Zero eigenvalue removed; normalized constants have eigenvalue 1 | Retained inverse-index normalization |
| §0.6 Jacquet comparisons | P=G; torus; smooth representation; standard algebraic GL₂ | Analytic algebraic comparison uses N-invariants, with a different torus character from coinvariants | Kept general construction; moved torus Check here |
| §0.7 completed arithmetic Π | Rank 2; fixed coefficients at other p-places; empty versus nonempty double quotient | Integral local regularity is C(H,O_E)ˢ only with the stated arithmetic nonemptiness and smallness | No narrowing or new good-prime restriction |
| §0.7 arithmetic Jacquet and eigenvariety | Uniformizer values; missing eigenspace; n=2 and local degrees 1,2 | Dimensions 2 and 4; coherence alone does not give density, depth or reducedness | Preserved the named arithmetic inputs |
| §0.7 Fredholm normalization and semisimplicity | diag(2,1) over ℚ₂; A[ε]/ε²; rank-zero chart | Unnormalized eigenvalue is twice normalized; nonsemisimple fibres retain nilpotents | Exact edition locators corrected |
| §0.7 classical twists | Fixed algebraic weight and finite level; arbitrary local unramified character | Infinite local choices do not yield closure of a finite classical refinement set | Added global twist or intertwiner hypothesis |
| §1.1 cocycles, inversion and gauge | Trivial group; scalar 2; upper/lower unipotents A,B | Converted identity cocycle gives AB, not BA; its coefficient inverse is B⁻¹A⁻¹ | Real conversion definition and proved tests |
| §§1.2–1.3 coefficient descent and line effectivity | Identity torsor; rank 0; stabilizer −1; residue characteristic 2; infinite rank | Finite effectivity does not imply Banach effectivity; averaging by 2 is unavailable integrally; smooth-rigid hypotheses matter | Retained explicit effectivity categories |
| §2.1 Hilbert coefficient domains | ε=0; p=3,m=1 at 1/12,1/9,1/3; p=2 at 1/8; AL scaling at p=5 | Strict odd endpoint is separate; dyadic endpoint is admitted; AL scales radius | Imported ramified generator; kept endpoint extension |
| §2.2 Hilbert factors and equalizers | Identity, upper/lower unipotents, diag(1,2), denominator zero outside domain | Coefficient is 1/2 at weight x; a zero denominator is not a unit | Preserved domain and inverse-factor conditions |
| §2.3 algebraic specialization | Weight x, x⁻¹; nonparallel tuple; literal trivial character | Negative weight uses the dual line; a determinant power loses nonparallel weights | No change |
| §3.1 integral sheaves | ℤₚ versus pℤₚ; factor p; infinitely many components | Rational agreement does not identify lattices or give one global denominator | No change |
| §3.2 pullback and fixed-radius sections | Identity and composite maps; flat formal change; reduction mod p | Rational pullback differs from integral base change; section ring need not be the coefficient algebra | Fixed the section-definition locator |
| §3.3 rational and integral colimits | Constant systems, including zero; equality after shrinking; ordinary-only section | Positive-radius colimit excludes ordinary-only representatives | Corrected source theorem kind |
| §3.4 modified coefficients | Ordinary locus; Oₚ-linear rank 1 versus O⁺-rank d; ramified point | Supplied unsplit lattice is indispensable | No duplicate lattice target |
| §4.1 four coefficient presentations and central closure | Trivial pair; diag(1,2); scalar zI; mixed-sign congruence units | Geometric multiplier 1/2 versus arithmetic 1; cancellation uses N(z) on the full closure | Retained all four independent equalizers |
| §4.2 span and finite polarization descent | Trivial group; p-power group; diagonal factor with j=1 | Actual torsor span is needed; integral descent is an equalizer, not averaging | No change |
| §4.3 pairing comparison | Pairing value 2; determinant 3; polarization 3 | Comparison factor 1/2; transformations 3 and 1/3 distinguish the coordinates | No change |
| §4.4 polarization-class forms | F=ℚ; several narrow classes; identity and composite positive principal transports | One component suffices only in the trivial narrow class case | Retained supplied narrow class finiteness |
| §5.1 AIP eigenfunctions and formal line | κ=1,x; dyadic sign; finite p-power roots of unity | Eigencondition is inverse; small universal factor does not erase finite characters | No change |
| §5.2 analytic B_m-torsor invariants | Split torsor; valued-point extension; function p⁻¹ | Smooth analytic torsor descent is distinct from profinite descent; valued lifts detect integral bounds | Retained separate invariant-function target |
| §5.3 finite factor and generators | Order 3 character; change of splitting section; annulus y²=T | Generator changes by χ(a), with full Čech data; unit upstairs is not automatically a base-local integral frame | Retained explicit integral coboundary/model prerequisites |
| §§5.4–5.5 AIP comparisons and Frobenius | p=5,m=1 bounds 1/25 versus 1/10; n=0; finite character; iterated quotient | Common lift range and AL scaling are required; Frobenius uses the actual isogeny frame | Corrected supplier locators |
| §§6.1–6.2 cusps, Koecher and boundary vanishing | Empty boundary; q versus 1+q; d=1; p-torsion line; even power map | Vanishing differs from extension; torsion-free/integral arguments cannot divide by group orders | Corrected theorem kinds and pages |
| §6.3 tame Hecke | Unit ideal; prime norm 2; prime square | Constants map to 1, 3/2, and 1+1/q respectively | Preserved actual degree rather than prime-only count |
| §6.4 wild Hecke and lower factor | ϖ=5; lower entry 25; both conjugations; ramification e>1; dyadic lower entry 2 | Denominators 126 versus 3126; level ne+1; dyadic denominator 3 | Proved conjugation; combined all denominator Checks |
| §6.4 diamonds and §6.5 expansions | Order 3 nebentype; frame scale 2; missed Igusa component | Inverses remain visible; missing a component defeats the injectivity argument | Preserved character and coverage hypotheses |
| §§6.6–6.7 Banach restrictions and controlling U | Strict radius contraction versus identity; split quadratic field; total ramification degree d | Monomial tails decay only strictly; total normalization p^(−d) | Corrected compactness and transport locators |
| §7.1 ordinary completion | Finite sets ℤ/pⁱ; function x↦x; zero ring; nonzero torsion-free patch | Completion includes x↦x; zero ring has p=0; nonzero integral patch excludes p⁻¹ | Corrected nonzero hypothesis |
| §§7.2–7.4 weighted completion and restriction | κ=1,x; finite conductor; nondiscrete O_C/p; ordinary-only functions | Equalizer retains inverse character; nilpotents obstruct a naive reduced-special-fibre argument; restriction is not surjective by definition | Replaced nonexistent BHW §6.3 citations |
| §8.1 antidiagonal dual factor | Rank 0,1,2; W=0; noncommuting C,Z | W=0 gives zero; correct factor diag(1,4) differs from wrong diag(4,1) | Added zero-factor test; retained involution and symmetry hypotheses |
| §8.2 Siegel neighborhoods | g=1,p=2; γ lower entry 2; g=1,p=3,n=1,2; lower endpoint equality | Dyadic coefficient exists; canonical criterion excludes its strict lower boundary | Added all-prime scope and separate canonical-range target |
| §8.3 scalar and finite coefficients | Trivial, zero and rank-two representations; determinant value 6; similitude u | Scalar multiplier is 1/6; finite coefficients retain all characters and Tate linearizations | No weakening to determinant-only coefficients |
| §8.4 determinant line and analytic sheaf | Identity; zero scalar; diag(2,3); upper unipotent; g=2 | Values a, 0, 6, a; determinant line is proper in induced coefficients with a unipotent variable | Added translation headline and missing tests |
| §8.5 second graph chart | q=2,Z=3; Z=0; q=0; characteristic 2; empty index | [−6,1]; no inverse of Z; q=0 gives no invertible action | Real block convention and proved examples |
| §8.6 general-data toroidal and reduced coefficients | Cubic norm-one torus; trivial group; central weight j=1; new cone refinement | Gᶜ can fail effective descent; Gʳ and the Tate twist are retained | Corrected quotient and all coefficient transports |
| §8.7 Bruhat families | GL₂ with M=T, ν=0,w=1,s; m′=1; n=0; absent finite-flat cover | Weights −2ρ and 0; distribution shift retained; projectivity needs actual covers | Corrected Levi Weyl element and quotient notation |

## Source and ownership evidence

All source locators below refer to the manifest keys and their numbered legal extractions, not to review summaries.

| Key | Evidence read |
| --- | --- |
| bhw | line 1640 (period bound); lines 1843–1868 (weights); lines 1898–1944 (coefficient, sections, end of §6); line 2135 (comparison); lines 2797–2801 (central cancellation); line 2918 (pairing); lines 3111–3129 (wild conjugation) |
| aip-adic | lines 396–405 (odd/dyadic analytic constants); lines 698–704 (formal coefficients and integral multiplier); lines 812–825 (Frobenius frame); lines 1240–1254 (full character); lines 1467–1484 (boundary/base change); lines 1505–1551 (ordinary interpretation and expansions) |
| aip-cusp | lines 681–702 (base change); lines 715–750 (specialization and vanishing); lines 839–957 (Banach/Hecke/compactness); lines 1101–1123 (arithmetic Banach theorem and polarization transport); line 1328 (toric boundary vanishing) |
| bp | lines 3754–3777 (twist and toroidal torsor); lines 4364–4480 (reduced torsors and finite covers); lines 6910–6930 (affinoid induction); lines 6968–6990 (finite/algebraic twist); line 7059 (open-disc distribution carrier); lines 7117–7169 (Bruhat weights and comparisons) |
| drw | lines 1055–1118 (coefficient conventions); line 1949 (other chart); lines 2069–2103 (canonical range); lines 2112–2122 (canonical-locus consequence) |
| ding | lines 2908–2960 (published §4.2.2 and Proposition 4.14) |
| heuer | line 88 (smooth-rigid line criterion); lines 655–675 (formal-unit construction) |
| emerton-analytic | lines 1158–1370 (Fréchet–Stein/coadmissibility); line 3303 (analytic vectors); lines 5451–5510 (distribution structure); lines 5813–5837 (analytic duality); lines 5913–5927 (Banach regular embedding); lines 6234–6499 (character spaces and essential admissibility) |
| emerton-jacquet | lines 1053–1186 (finite slope); lines 1532–1565 (general parabolic); line 2710 (essential admissibility); lines 3095–3117 (smooth and algebraic comparisons) |
| breuil-ding | lines 3282–3302 (general-rank integral regular representation and proof) |
| bhs-modulaire | lines 1013–1113 (local finite-projective model); lines 1310–1440 (classical accumulation and reducedness); lines 2007–2017 (regular-model hypothesis and unnormalized Hecke action) |
| bhs-smooth | lines 1025–1030 (finite-projective Cohen–Macaulay argument) |
| chenevier | line 829 (semisimple-fibre criterion); line 866 (component argument) |

Pinned ownership was checked against Mathlib's norm, tensor, module-topology, direct-limit and matrix files and Tau Ceti's narrow-class and highest-weight modules. No replacement of those general objects is planned. The named open supplier sections were read directly, including PerfectoidShimuraVarieties §6.1a, HodgeTateAndCanonicalSubgroups §§3.12, 4.6–4.8, 5.8, 5.10–5.12, LocallyAnalyticDistributions §§3.3, 4.15, PhiGammaModulesAndIwasawaCohomology §4.0, and CompletedCohomologyPartII F.1/F.4.

## Maintainer consequences

`hilbertPeriod_unsplitRamifiedGenerator` is no longer a target: consumers use the existing HodgeTateAndCanonicalSubgroups contracts. The general-data coefficient interface now requires representations of Gʳ and its quotient Levi; a Gᶜ representation needs the supplied identification before use. The compact weight geometry and analytic-vector objects have their existing owners, with no new supplier gap or merge-order change.

`weightDualMap` and `weightMap` retain their names but now expose algebraic monoid-homomorphism carriers in the representative Lean file. Their continuous refinements are expressed by `continuous_weightDualMap` and `continuous_weightMap`; downstream code requiring a continuous wrapper must use those proofs. Added `rightCocycleOfLeft`, `atkinLehnerBlock`, `principalUnits_antitone`, `determinantLineMap_translation`, and the README-only `siegelPeriodDomain_canonicalRange`. No other existing theorem name was removed. Metadata and the absent design plan were untouched. These repairs do not constitute independent acceptance; the next review remains necessary.
