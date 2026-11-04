# Review of PseudodifferentialOperators (pull request #952 at 88ffdf3)

**Verdict:** needs changes

## R01 (P2) — Retain the endpoint real-interpolation theorem

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:1081`, “For a fixed 1<p<∞ and s₀≠s₁”.

**Claim:** The repaired real Bessel–Besov interpolation target excludes p=1 and p=∞. These exclusions unnecessarily narrow the general theorem; they are not needed to repair the smooth-density claim.

**Witness:** Bergh–Löfström Theorem 6.4.5(4), printed p. 153, explicitly permits 1≤p,q≤∞. Definition 6.2.2 uses Bessel-potential spaces at those endpoints, not Hardy-space substitutes (`bl line 4145`–4152, 4455; printed formula inspected).

**Exact repair:** State the Euclidean identity for 1≤p≤∞, 1≤q≤∞, 0<θ<1 and distinct real s₀,s₁, with equivalent norms. Use the endpoint-valid localized convolution bounds of Lemma 6.2.1 and Theorem 6.2.4, pp. 140–143, rather than requiring the interior-p square-function/Mihlin argument. Keep the separate complex-interpolation and integer weak-derivative comparison restrictions, and keep the corrected finite-p/finite-q density assertions. The compact bundle Besov comparisons can still use localization; this does not assert endpoint boundedness of arbitrary order-zero pseudodifferential operators.

**Repair test:** On ℝ at p=∞, s₀=0, s₁=2, θ=1/2, q=∞, the constant distribution 1 has both endpoint Bessel norms 1. Thus K(t,1)=min(1,t) and its real-interpolation norm is 1. Its inhomogeneous Besov blocks are (1,0,0,…), also of norm 1. The repaired range includes this legitimate endpoint instance. The existing p=2 lacunary counterexample still has smooth-approximation distance at least 1, so restoring endpoints does not undo the density repair.

This also corrects the previous report's source-comparison sentence claiming that the printed real-interpolation formula requires 1<p<∞. That restriction belongs to other Bessel-space results, including formula (7), not formula (4).

## Previous findings

- R01 — repaired: README:1097–1118 distinguishes finite-q density, finite-p little Besov closure at q=∞, and interior-p Bessel duality; :1127–1143 adds the separating lacunary examples. The additional interpolation-range restriction introduces this report's R01.
- R02 — repaired: README:1293 and :2055 now locate Atiyah–Singer (5.2) on p. 512, retaining the operator-norm closure qualification.
- R03 — repaired: README:784–856 supplies claim-level locators and explicit deductions for patching, exactness, parameter lifts and recovery; :1302–1307 distinguishes closure averaging from the coefficient-seminorm proof for the classical class.

## Verified sound

:robot: AI review, incremental re-review of 126 changed lines since 9cdb62c. Only README passages changed; Suggested.lean is byte-for-byte unchanged. The changed passages and their mathematical inputs/uses were reviewed, including the seeded targets §4.2 and §5.3 and the related §5.5 assertions. Unchanged source checks and adversarial rows are explicitly carried from [r4], rather than represented as fresh full-review work. There is one new P2 finding and no remaining instance of the three immediately preceding findings.

**Gate and Lean checks.** Confirmed head 88ffdf315be12a567ea0e4357ba4b0bd8052804c, clean tracked worktree, and no changes outside this roadmap folder. The supplied worker gate reports every check, including the targeted build, passing. The independent gate rerun also passes every scanner and dependency check. Independently reran `lake build TauCetiRoadmap.PseudodifferentialOperators.Suggested`: 8,981 jobs, exit 0. Direct `lake env lean` elaboration exits 0 with exactly eight sorry warnings and no other warnings.

The prescribed dependency command prints:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appears. All Needs lines were read. The earlier cross-package reciprocal-dependency issue remains under the settled H01 edit-boundary disposition recorded by r4; it is not silently declared solved by this mechanical output. Main ComplexKahlerGeometry:45–52, :575–577 still consumes P1.0, and main RiemannianGeometry's core still consumes P1 while this roadmap consumes its quotient geometry. The changes introduce no new supplier edge and do not alter that disposition.

A scratch copy with `#check @name` for all 22 explicit declarations elaborates. All four geometric headline signatures retain second countability, finite dimension, Hausdorffness, smoothness and boundarylessness. The four Euclidean signatures retain finite-dimensional fibers, with completeness, compact spatial support/uniform bounds, decreasing orders tending to minus infinity, and nonzero-covector inverse equations where needed. The raw integral definition omits completeness; its mapping theorems retain it. No required binder was lost. All eight admissions were reprobed with `first | rfl | simp | infer_instance | exact?`; none closed (six unsuccessful lemma searches, two unsolved goals). No padding, sorry'd data, set_option or new stand-in was introduced.

**Headline inventory.**

| README headline | Suggested.lean coverage |
|---|---|
| Ideal-square criterion; cotangent equivalence; smoothness and equivalence of derivations | Four theorems at :62, :75, :90, :101. |
| Local Borel summation | `exists_asymptoticSum`, :184. |
| Compact-spatial-support Sobolev mapping; uniform order-zero boundedness | `exists_quantizeSobolev`, :214; `exists_quantizeUniformOrderZero`, :225. |
| Inverse elliptic homogeneous principal symbol | `exists_inversePrincipalSymbol`, :241. |
| Complex derivations, jets, bundle differential operators, Bochner decomposition, Peetre | Module docstring names missing complex-function/section bridges and bundle operator/jet carriers. |
| Kernel theorem, global calculus, parametrices, Fredholm theory and elliptic regularity | Module docstring names missing bundle distributions, global operators and bundle Sobolev scale. |
| Interpolation, bundle Besov/Zygmund mapping, including the repaired density/closure API | Module docstring names missing compatible-couple and bundle function-space carriers; no substitute theorem is added. |
| Powers, product index, Hodge theory, transplantation, wavefront operations | Module docstring names the missing realizations, bundle scales and manifold distribution carriers. |

The new little Besov definition has a closed-subspace/completeness API, an isometric inclusion for the chosen norm, independence of partition/localization, and three discriminating Checks. Its vanishing-tail condition excludes the bounded-but-nonvanishing sequence. No new Lean declaration is needed merely for these API facts.

**Sources reopened for this increment.** Six works were read from legal source-service extractions, with page images for ambiguous formulas. Atiyah–Singer was read from the service's institutional cache and a successful repeat fetch; no inaccessible text was inferred.

| Changed assertion | Locator and verification |
|---|---|
| §4.2 coordinate/global-class claim | `taylor line 828`–858, Lecture I §8, (8.1)–(8.3), pp. 23–24: compact scalar coordinate invariance. The README correctly labels finite-rank frame changes and locally finite proper-support globalization as deductions. |
| Classical principal-symbol sequence | `melrose line 727`–751, §2.9, Lemma 2.5, p. 45: the local quotient sequence. Restricting to classical expansions identifies the leading homogeneous term and its order-one-lower kernel. |
| Global patching and parameter lift | `melrose_iml line 7030`–7114, §5.3, Propositions 5.1–5.2, pp. 133–134. The source supplies patching and surjectivity; continuity in the stated classical seminorms is explicitly a deduction from fixed cutoff extension and P2–P3 estimates. The prescribed-initial-value correction is algebraically correct. Source notation slips are recorded below. |
| Full-symbol recovery and output support | `melrose line 677`–700, (2.75)–(2.77), pp. 43–44; `dyatlov line 338`–362, p. 11, visually checked; `melrose_iml line 755`–778, Corollary 1.1, p. 21. Kernel uniqueness plus partial Fourier injectivity gives the support equivalence; localization in x handles local rather than uniform estimates. Exponentials are interpreted through their Fourier point masses. |
| §5.3 density and little Besov closure | `bl line 1570`–1590, Theorem 3.4.2(b,c), pp. 47–48, distinguishes finite-q density from endpoint closure. The dyadic-tail characterization is a stated deduction, supported by truncation and finite-p approximation, not attributed verbatim to that abstract theorem. |
| §5.3 endpoint interpolation | `bl line 4116`–4152, Definition 6.2.2, pp. 139–141; line 4199–4220, Theorem 6.2.4, pp. 142–143; line 4441–4462, Theorem 6.4.5, pp. 152–153. The printed formula (4) includes both p endpoints: R01. |
| §5.5 compactness and averaging ([Atiyah–Singer I](https://math.uchicago.edu/~shmuel/tom-readings/ASI.pdf)) | `atiyah_singer line 1085`–1090, (5.2), p. 512; line 1213–1256, (5.5)–(5.6), pp. 516–517; footnote at line 1273. The revised text correctly separates averaging in the closure from preservation of the actual classical class. |

For the other seeded targets—§1.2, §2.2, §3.1, §4.1, §5.1, §5.2, §5.4, §6.1, §7.1, §7.2, §7.3, §9.1 and §9.2—the passages did not change. Their prior source checks, source limits and numerical adversarial witnesses are carried forward from r4. The changed quantization is used in §6.1 and §7.2; those uses retain ellipticity and the requirement of paths continuous in symbol seminorms. Averaging uses compact groups, normalized Haar measure and the coefficient/remainder estimates, so it supplies those uses.

**Pinned declarations actually opened this round.** Pins remain Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Paths below are relative to those libraries.

| File and line | Relevant content |
|---|---|
| `Mathlib/Analysis/Distribution/TemperedDistribution.lean:482`, :499–503 | Bilinear-test Fourier action and both inverse identities. Fourier injectivity is already supplied; it is not a new foundational target. |
| `Mathlib/Analysis/FunctionalSpaces/BesselPotentialSpace.lean:47`, :250, :265 | Distribution-plus-Lp-witness carrier for p≥1, linear isometry to Lp, completeness. Endpoints are admitted; this is not an interior-p-only carrier. |
| `TauCeti/Geometry/Manifold/DerivationBundle.lean:446` | Native point-derivation/tangent equivalence underlying the unchanged import and geometric signatures. |
| `TauCetiRoadmap/PseudodifferentialOperators/Suggested.lean:150` | `Symbol.HasCompactSpatialSupport` exists; the worker's unresolved-name lead is false. |
| `TauCetiRoadmap/RepresentationTheory/InductionRestriction/Suggested.lean:728` on main | `Gassmann.almostConjugate_iff_permutation_equiv` exists; the second unresolved-name lead is false. |

Object searches of both pinned libraries found no Besov/little Besov carrier. The changed generic dyadic closure and quantization constructions therefore remain roadmap work. The new endpoint interpolation theorem still lacks the interpolation/Besov carriers required to state it in the acceptance file.

**Ownership and supplier citations.** The roadmap service was used for object searches across main/open heads and for reading the supplied SmoothBundlesConnections head; board packages were also searched for little Besov/vanishing-tail constructions. Main PDE has Lane A weak spaces and Lane B multiplier/operator interpolation estimates, but no generic Besov/little Besov construction. The open PDE revision's later Besov heat applications are revisions of an existing roadmap and are not treated as suppliers. Search hits in unsupplied open folders were not followed. NoncommutativeIntegration's generic-couple overlap remains consumer-side work under r4's disposition; it is not imported upward.

| Citation resolved anew | Read location and contract |
|---|---|
| SmoothBundlesConnections B2–B4 | Supplied head, `TauCetiRoadmap/SmoothBundlesConnections/README.md:559` onward; associated bundles, finite-rank transitions and Hermitian metrics. Merge order: supplier line 7, PDO line 8. |
| PDE Lane A.3–A.7, B.8–B.10 | Main `TauCetiRoadmap/PDE/README.md:235`–279: weak/Bessel comparison, embeddings, extension/Rellich, Hölder and harmonic-analysis inputs. |
| ComplexKahlerGeometry K5a | Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:570`, :651, :718–728, :841–849: densities, distributions, smooth-section topology, compact Hilbert scales and differential-operator comparison. Reciprocal core dependency retains the settled disposition above. |
| CompactGroups Layers 0–3 | Main `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:205`–274: normalized Haar averaging, unitarization, complete reducibility and Schur; normalization is total mass 1. |
| TopologicalKTheory T6.1–T6.2 | Main `TauCetiRoadmap/TopologicalKTheory/README.md:970`–1005: section actions and continuous representation-ring external products. |
| VonNeumannAlgebras V2 | Supplied `TauCetiRoadmap/VonNeumannAlgebras/README.md:131`–139: completed Hilbert tensor product; order line 4 precedes PDO. |
| RiemannianGeometry R4.7 | Main `TauCetiRoadmap/RiemannianGeometry/README.md:751`–755: free properly discontinuous isometric quotients, including finite free actions on closed bases. |
| InductionRestriction §2.1 | Main theorem at `TauCetiRoadmap/RepresentationTheory/InductionRestriction/Suggested.lean:728`; almost-conjugacy/permutation comparison. |
| NoncommutativeIntegration §§2.2–2.4 | Supplied `TauCetiRoadmap/NoncommutativeIntegration/README.md:425`–502: generic interpolation overlap already assigned downstream. |
| LieGroupoidsPoisson G1.1 | Supplied `TauCetiRoadmap/LieGroupoidsPoisson/README.md:345`: consumes PDO's section module, not a competing owner of the new analytic constructions. |

Also reopened main `TauCetiRoadmap/DifferentialGeometry/README.md:268`, :311, :503 (Layers 0–1, 5); main `TauCetiRoadmap/HopfRinow/README.md:244` (nondegenerate Levi-Civita); main `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:207` (first-jet consumption); supplied `TauCetiRoadmap/IndexTheory/README.md:63`, :230, :432 (continuous quantization/product indices); and supplied `TauCetiRoadmap/FuchsianOrbifolds/README.md:1453`–1459 (finite-cover spectral transport). These five unchanged citation groups still name the intended objects. No ownership move or dependency-file edit was made.

**Computed adversarial pass.** Each retained row below explicitly cites r4; the new table records fresh computations for changed statements and the repaired locators. “Pass” describes the displayed instance, not a proof of the general theorem. The single failure is loss of supported generality, not a false interior-p identity.

122 unchanged rows are carried forward; 31 rows below were recomputed for changed passages or their uses.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.2 coordinate transformation and compatible full-symbol patching | y=exp(x), principal ξ², input f=x | Pulled-back operator (−∂²+∂)f=1; direct x quantization gives 0; difference is ∂ | Pass; equal principal symbols do not imply smoothing | New locators verified; full compatibility retained |
| Finite-rank frame transformation | Constant frame exchange S=[[0,1],[1,0]], symbol A=diag(1,2) | S⁻¹AS=diag(2,1); at v=(1,0) transformed output (2,0), not (1,0) | Pass | Entrywise extension preserves conjugation |
| Classical principal-symbol kernel and order drop | P=D²+D, Q=D², m=2 | Both leading symbols ξ²; P−Q=D has order 1 and leading value 2 at ξ=2 | Pass | Lemma 2.5 plus classical restriction |
| Surjective lift by frequency cutoff | Degree-2 a=ξ²; cutoff zero for norm≤1, one for norm≥2 | Lifted symbol at ξ=0 is 0, at ξ=3 is 9; degree-2 term is ξ², lower homogeneous terms 0 | Pass | Explicit fixed-cutoff deduction |
| Linear quantization and continuous parameter seminorms | a=ξ, b=2ξ; a_t=(1+t)ξ on circle | Q(a+b)=3D=Q(a)+Q(b); each coefficient seminorm of Q(a_t)−Q(a_s) is abs(t−s) times that of D | Pass | Fixed choices give linearity and continuity |
| Lift with prescribed initial operator | P₀=D+2Id; a_t=(1+t)ξ; mode k=2 | Lift eigenvalue 4+2t; at t=0 it is 4, matching P₀, whereas Q(a₀) alone gives 2 | Pass | New correction Q(a_t)+P₀−Q(a₀) |
| Global class by chart compression | Identity kernel δ(x−y), chart cutoff φ=ψ=χ | χIdχ is multiplication by χ²; at χ=1/2 coefficient is 1/4; off diagonal kernel is 0 | Pass | Kernel is distributional, despite source (5.26) typo |
| Full-symbol recovery via Fourier point mass | a=1+ξ, exponential exp(2ix) | (Id+D)exp(2ix)=3exp(2ix); recovered value 3 equals a(x,2) | Pass | Does not assume arbitrary noncompact smooth inputs |
| Displacement Fourier sign | δ₀−iδ₀′, ξ=2 | Fδ=1, Fδ′=2i; 1−i(2i)=3; reversed displacement gives −1 | Pass | New two-term sign Check |
| Output support iff x-support of full symbol | χ supported in K; Id tested on nonzero bump outside K; zero symbol with K empty | χf outside K=0; Id f outside K=f≠0; zero symbol/kernel/output all 0 | Pass both directions | Kernel uniqueness and Fourier injectivity supply deduction |
| Proper-support truncation versus exact recovery | Full smoothing kernel exp(−(x−y)²), cutoff ρ(x−y)=1 near 0 | Kernel difference (1−ρ(z))exp(−z²) is smooth and nonzero where ρ=0; hence symbol difference is smoothing, not identically 0 | Pass | Modulo-smoothing qualification retained |
| Square partitions and principal lift | χ₁=χ₂=1/√2 | χ₁²+χ₂²=1; unsquared sum=√2 | Pass | Compatible with patched principal-symbol right inverse |
| Real-interpolation order and q range | p=2, s₀=0, s₁=2, θ=1/4; q=1 versus ∞ | s_θ=1/2; N unit weighted blocks have norms N versus 1 | Pass | Full q=∞ remains present |
| Endpoint real interpolation excluded by revised range | ℝ, p=∞, u=1, (s₀,s₁,θ,q)=(0,2,1/2,∞) | Endpoint norms 1 and 1; K=min(1,t); interpolation norm 1; Besov blocks (1,0,…) give norm 1 | Supported instance omitted: R01 | Restore p=∞ and p=1 as in the printed theorem |
| Endpoint p=1 Bessel carrier | ℝ, g=π^(−1/2)exp(−x²), u=(exp(−abs(x))/2)*g | Both kernels positive with integral 1; ‖u‖₁=1 and ‖(1−∂²)u‖₁=‖g‖₁=1; K(t,u)=min(1,t), (1/2,∞) norm 1 | Pass; legitimate endpoint input | Native carrier already permits p=1 |
| Besov carrier for 1≤p,q≤∞ | Normalized circle, exp(i2²x), central-frequency partition, s=0 then 1 | Block Lp norm is 1 for every p including 1 and ∞; weighted norms 1 then 4 for every q | Pass | Enlarged explicit carrier range retained |
| Finite-q smooth density | Weighted coefficients 2⁻ʲ | Tail ℓ^q norm after N is 2^(−N−1)/(1−2^(−q))^(1/q)→0; for q=2,N=0 equals 1/√3 | Pass | New exact tail computation correct |
| Failure of full q=∞ smooth density | u=Σ₂⁻ʲ exp(i2ʲx), s=1,p=2 | All weighted blocks 1; every partial-sum error 1; smooth v has weighted blocks→0, so distance≥1 | Pass as negative control | Previous R01 repaired |
| Little Besov vanishing-tail definition | Weighted sequences 1, 2⁻ʲ and 0 | Limits 1,0,0 respectively; first excluded, other two admitted | Pass | Distinguishes little from full Besov |
| Little Besov approximation error | Coefficients 2⁻²ʲ, s=1, truncation after N | Weighted supremum tail 2^(−N−1)→0; N=0 gives 1/2 | Pass | New positive Check |
| Finite trigonometric polynomials and zero | Single frequency 2ᴶ and zero | Blocks vanish above J+1; weighted tails eventually 0 in both cases | Pass | Dense approximants satisfy little condition |
| Little subspace closed and complete | c⁰ model; weighted tail of limit within ε of a c⁰ sequence | limsup tail≤ε for every ε>0, hence 0; truncated 2⁻ʲ sequences have sup-error 2^(−N−1) | Pass | Closed-subspace proof uses full-space completeness |
| Isometric inclusion for chosen norm | Weighted sequence 2⁻ʲ, j≥1 | Little inherited norm=1/2=full ℓ∞ norm; unit weighted sequence would have norm 1 but is excluded | Pass | Norm equality does not identify the two carriers |
| Compact smooth closure versus Euclidean compact-test closure | Compact constant section; ℝ constant 1 at p=1 | Compact constant has only low block and finite L¹ norm; on ℝ its low block has infinite L¹ norm, so is outside the finite-p Besov space | Pass | Noncompact closure claim retains finite p |
| Partition/localization independence | Positive test with tail 2⁻ʲ, bounded finite-overlap transform of norm C | New tail≤C·2^(−N+L)→0 for overlap width L; inverse bounded transform gives converse | Pass | Equivalent norms/closed smooth closure, not equality of different dyadic norms |
| Coordinate/frame transitions on little space | Constant frame scaling by 2 | Weighted tail 2⁻ʲ maps to 2^(1−j)→0; norm changes 1/2→1, and inverse returns 1/2 | Pass | Bounded transitions preserve closure, not necessarily norm |
| Bessel density and bilinear duality restriction retained | p=2, u=exp(ix) on normalized circle, orders ±s | Bessel norms 2^(s/2),2^(−s/2), product 1; pairing with exp(−ix) is 1 | Pass | Separate from Besov q=∞ density |
| Compactness and corrected (5.2) page | Circle multipliers (1+k²)^(−1/2) and 1 | First eigenvalues→0, tail norm after abs(k)≤N is (1+(N+1)²)^(−1/2); identity tail norm 1 | Pass | (5.2) is on p. 512, both references repaired |
| Averaging in closure and actual classical class | Trivial group; reflection conjugating multiplication by x; Id | Averages T, (x−x)/2=0 and (1+1)/2=1; constant principal symbol 1 preserved | Pass | Coefficient and remainder bounds are additional to closure argument |
| Classical coefficient seminorm control under averaging | Two-element group, coefficients f(x), f(−x), remainder bounds C₁,C₂ | kth derivative of average is (f^(k)(x)+(−1)^k f^(k)(−x))/2; remainder norm bound (C₁+C₂)/2 | Pass | Differentiation/Haar integration retains each symbol order |
| Downstream homogeneous path use | P_t=(1+t)D+2Id, t∈[0,1], unit covector ξ=±1 | abs(σ₁P_t)=1+t≥1; seminorm difference abs(t−s); initial correction does not change ellipticity | Pass | §6.1/§7.2 retain required smooth-symbol continuity |

**Unchanged instances, carried from r4.**

| Statement | Instances tried | Values computed on the relevant sides | Result; provenance |
|---|---|---|---|
| Angular versus Mathlib Fourier normalization | n=1, ξ=2πζ | (2π)⁻¹dξ=dζ; both integrands have exp(2πixζ)a(x,2πζ)𝓕u(ζ) | Pass; none.  Carried from [r4]. |
| D=−i∂ and geometric/Fourier symbols | exp(ixξ), ξ=2 | ∂u=2iu, Du=2u; geometric symbol 2, Fourier symbol 2i | Pass; none.  Carried from [r4]. |
| Formal-adjoint symbol parity | ∂, order 1 | Geometric symbol of ∂* is −ξ; (−1)¹ξ=−ξ. Fourier symbol −iξ=conj(iξ) | Pass; none.  Carried from [r4]. |
| Bilinear distribution pairing | Constant scalar i multiplying a real test φ | Both native and Lean pairings are i∫φu; a conjugate-test pairing would give −i on test iφ | Pass; keep distinct from Hermitian pairings.  Carried from [r4]. |
| smoothVanishingIdeal | At 0 on ℝ, f=x and g=1 | f(0)=0, g(0)=1; f∈I₀, g∉I₀ | Pass; none.  Carried from [r4]. |
| Ideal-square iff zero value and derivative | f=x² and g=x at 0 | x²=x·x∈I₀², (f(0),f′(0))=(0,0); g′(0)=1 and g∉I₀² | Both directions discriminate; none.  Carried from [r4]. |
| Global, finite algebraic ideal square | Discrete zero-dimensional M | Indicator e of M\{x} satisfies e²=e; every f∈Iₓ equals ef, so Iₓ²=Iₓ and differential=0 | Pass; no infinite-sum ideal product used.  Carried from [r4]. |
| Empty/zero-dimensional geometry | Empty M; one point | Empty M has no x to instantiate; one point has I=0, cotangent=0 and derivations=0 | Pass; none.  Carried from [r4]. |
| Cotangent equivalence and its prescribed map | ℝ at 0, class of 3x+x² | Both class-to-differential and target covector evaluate v as 3v; a rescaled map would give 6v at scale 2 | Pass; prescribed equation excludes rescaling.  Carried from [r4]. |
| Smooth section module/scalar towers | Trivial line, f=x, s=2, x=3 | (f·s)(3)=6; with constant scalar 5, both tower orders give 30 | Pass; native section carrier retained.  Carried from [r4]. |
| Restriction and point evaluation of section multiplication | Same section restricted to (2,4) | Restrict(fs)(3)=6=f(3)restrict(s)(3) | Pass; none.  Carried from [r4]. |
| First-jet carrier | s=1+2x and t=1+2x+x² at 0 | Both jets are (1,2); second derivatives are 0 and 2 | Pass; first jet does not encode second derivative.  Carried from [r4]. |
| Jet exact sequence/connection splitting | Trivial line with ∇=d+a dx | j¹s=(1,2); splitting derivative component is 2+a, projection remains 1; at a=2 gives 4 | Pass; splitting depends on connection.  Carried from [r4]. |
| First-jet product rule | f=x, s=1+2x at 0 | d(fs)=1; f ds+s df=0·2+1·1=1 | Pass; omitting the zero-order term gives 0.  Carried from [r4]. |
| derivationVectorField evaluation | D=∂, f=x², x=3 | (Df)(3)=6; field value 1 acts on df₃ as 6 | Pass; none.  Carried from [r4]. |
| Smoothness of algebraic derivation field | D=x∂ on ℝ | Field x↦x is smooth; at 0 and 2 coefficients are 0 and 2 | Pass; field not merely pointwise arbitrary.  Carried from [r4]. |
| Derivation equivalence and linearity | D=∂, scalar 5 | e(5D)=5e(D); applying to x² at 3 gives 30 on both sides | Pass; zero/rescaled arbitrary correspondences excluded.  Carried from [r4]. |
| Complex derivation dictionary | Xu=10, Yv=6, Yu=5, Xv=8 | δ(u+iv)=(10−6)+i(5+8)=4+13i | Pass; minus sign in real component necessary.  Carried from [r4]. |
| Complex structure on real pair | (X,Y)=(1,2) | J(X,Y)=(−2,1); J²(X,Y)=(−1,−2)=−(X,Y) | Pass; none.  Carried from [r4]. |
| Derivation Lie bracket and Leibniz law | X=x∂, Y=∂ | [X,Y]=−∂; applied to x gives −1; reversing bracket gives 1 | Pass; convention fixed.  Carried from [r4]. |
| Differential operators via iterated commutators | P=∂², multiplication by x | [P,x]=2∂, [[P,x],x]=2Id, third commutator=0 | Pass; exact order detected.  Carried from [r4]. |
| Differential jet evaluation/local coefficients | P=∂+3, f=x² at 2 | Pf=4+12=16; first jet (4,4) gives 4+3·4=16 | Pass; not determined by derivative alone.  Carried from [r4]. |
| Density transpose/formal adjoint | P=x∂ with dx | P*=−x∂−1; on constant 1 gives −1, whereas −x∂ gives 0 | Pass; divergence term retained.  Carried from [r4]. |
| Principal symbol composition | ∂ followed by ∂ | Fourier symbols (iξ)(iξ)=−ξ²; ∂² has symbol −ξ² | Pass; none.  Carried from [r4]. |
| Matrix leading commutator | A=e₁₂, B=e₂₁, order zero | AB=diag(1,0), BA=diag(0,1); commutator=diag(1,−1) | Pass; no scalar order drop for arbitrary matrices.  Carried from [r4]. |
| Laplace-type scale and Dirac-square convention | −c∂², ξ=2, c=1 or 2 | Principal values 4 and 8; (i∂)²=−∂² gives 4 | Pass; positive scalar normalization retained.  Carried from [r4]. |
| Bochner connection versus density adjoint | Circle weight exp(sin x)dx, scalar weighted Laplacian | Drift at 0 is −∂; Bochner coefficient is 1/2, so metric-compatibility defect at 0 is 1, not 0 | Pass; canonical-density hypothesis matters.  Carried from [r4]. |
| Peetre finite order locally | Disjoint circles, P on component j equals ∂ʲ | Compact set meets finitely many components, order max j; over all components orders 1,2,3,… are unbounded | Pass; no global uniform order claimed.  Carried from [r4]. |
| Peetre's locality condition | Translation Tf(x)=f(x+1) | Bump supported near 1 has Tf(0)≠0 while 0∉supp f | Negative control; hypothesis excludes translation.  Carried from [r4]. |
| CoordinateSpace/coordinateDeriv | n=1, f=x³, lists [],[0],[0,0] at x=2 | Values 8,12,12; n=0 admits only the empty index list | Pass; no out-of-range Fin index.  Carried from [r4]. |
| mixedDeriv ordering | a(x,ξ)=x²ξ³, one x and one ξ derivative | ∂x∂ξa=6xξ²; at (2,3) both orders give 108 | Pass; smoothness justifies permutation.  Carried from [r4]. |
| Local symbol estimates | a=ξ, m=1 | At ξ=2, 2≤√5; first ξ derivative=1 and weight exponent (1−1)/2=0 gives 1 | Pass; no order-zero bound as ξ→∞.  Carried from [r4]. |
| Local versus uniform symbol | a=x, K=[−R,R] | Compact x-bound R; all-x supremum ∞ | Pass; IsUniform is substantive.  Carried from [r4]. |
| Compact spatial support | a=χ(x) with compact support; a=1 | Outside suppχ values 0; a=1 stays 1 outside every compact set on ℝ | Pass; not mere proper kernel support.  Carried from [r4]. |
| HomogeneousSymbol scaling | ξ², m=2, t=2, ξ=1 | a(2)=4=2²a(1); degree-1 alternative gives 2 | Pass; none.  Carried from [r4]. |
| Positive-only homogeneity | \|ξ\|, degree 1, ξ=±2 | Both values 2; extending homogeneity to t=−1 would force −2 | Pass; positivity is essential.  Carried from [r4]. |
| Assigned value at zero | Degree-zero symbol a(ξ)=1 for ξ≠0, a(0)=0 | Values 1 away from zero and 0 at zero; smooth away, not continuous across zero | Pass; no false global smoothness.  Carried from [r4]. |
| FrequencyCutoff bounds and denominators | Standard smooth transition h(t)/(h(t)+h(1−t)) | At t=0,1/2,1 gives 0,1/2,1; denominator positive everywhere because one argument is positive | Pass; no 0/0.  Carried from [r4]. |
| FrequencyCutoff wrong models | Step function; smooth overshoot | Step jumps 0→1 and fails smoothness; value 3/2 fails upper bound 1 | Pass; both laws discriminate.  Carried from [r4]. |
| ClassicalSymbol remainder equality | a=ξ²+1, terms ξ²,0,1 | N=0 remainder=ξ²+1; after N=3 remainder=(1−χ)(ξ²+1), zero at large ξ | Pass; N=0 and zero covector retained.  Carried from [r4]. |
| Classical versus arbitrary order drop | a=⟨ξ⟩^(1/2)+1, proposed degree 1/2 classical leading term | Constant remainder behaves as 1, not O(⟨ξ⟩^(−1/2)); ratio grows as ⟨ξ⟩^(1/2) | Negative control; not every symbol is classical.  Carried from [r4]. |
| exists_asymptoticSum, repeated orders | Orders 0,0,−1,…; first two symbols 1,2, then 0 | Choose b=3: remainders at N=0,1,2 are 3,2,0 with orders 0,0,−1 | Pass; antitone need not be strictly decreasing.  Carried from [r4]. |
| Borel sum is not pointwise series convergence | aⱼ=(−1)ʲ⟨ξ⟩⁻ʲ, b=1/(1+⟨ξ⟩⁻¹) | At ξ=0: b=1/2; remainders 1/2,−1/2,1/2; raw partial sums 0,1,0,1,… | Pass; asymptotic remainder order, not convergence, is claimed.  Carried from [r4]. |
| Compact parameter Borel bounds | Constant family of the preceding symbols | Same seminorms for every parameter; ξ=0 remainders remain ±1/2 | Pass; no parameter-dependent arbitrary cutoff.  Carried from [r4]. |
| Oscillatory quantization of identity | u=exp(−x²), a=1, x=0 | Op(1)u(0)=u(0)=1 by Fourier inversion | Pass; normalization excludes zero map.  Carried from [r4]. |
| quantizeSchwartzValue of derivative/zero | a=ξ, x=1; a=0 | −iu′(1)=2i/e; zero symbol gives integral 0 | Pass; total integral is used where convergence is proved.  Carried from [r4]. |
| Kernel correspondence | Identity versus smooth kernel 1 | Identity kernel is δ(x−y), output u; kernel 1 gives constant ∫u | Pass; not every operator has a smooth kernel.  Carried from [r4]. |
| Proper support and smoothing | K(x,y)=exp(−(x−y)²) on ℝ² | K(0,1)=e⁻¹ and support=ℝ²; preimage of compact {0} under first projection is {0}×ℝ, noncompact | Pass; smoothing does not imply proper support.  Carried from [r4]. |
| Amplitude reduction | a(x,y,ξ)=y with local cutoffs | δ(x−y)y evaluates to x; reduced operator is multiplication by x | Pass; diagonal leading term correct.  Carried from [r4]. |
| Composition convention | a=ξ, b=x | ξ#x=xξ−i; x#ξ=xξ; [D,x]=−i | Pass; sign fixed.  Carried from [r4]. |
| Adjoint lower-order correction | P=exp(ix)D, input exp(2ix) | P*exp(2ix)=exp(ix); using conjugate leading symbol alone gives 2exp(ix) | Pass; coefficient derivative necessary.  Carried from [r4]. |
| Ordered matrix commutator formula | p₁=p₂=ξ(A+sin x B), A=e₁₂,B=e₂₁ | Actual [P,P]=0; ordered first correction cancels to 0; reordered scalar bracket at (0,1) gives diag(−i,i) | Pass in roadmap; source error recorded.  Carried from [r4]. |
| schwartzToSobolev native comparison | u=0; arbitrary Schwartz u | Distribution component is u, hence at u=0 evaluates every φ to 0 | Pass; real definition, not a free witness.  Carried from [r4]. |
| exists_quantizeSobolev | χ multiplication, s=m=0 | ‖χu‖₂≤‖χ‖∞‖u‖₂; if χ=0 both sides 0 | Pass; compact local coefficients suffice.  Carried from [r4]. |
| exists_quantizeUniformOrderZero | a=1, nonzero fiber; zero fiber | Identity operator norm 1; on the zero space norm 0 and both pairings 0 | Pass; degenerate fiber harmless.  Carried from [r4]. |
| Necessity of uniform control for global L² | a=x, unit L² bumps supported in [k,k+1] | ‖Op(a)uₖ‖₂≥k while ‖uₖ‖₂=1 | Pass; no global bound for merely local order zero.  Carried from [r4]. |
| Weak space versus zero-boundary closure | Constant 1 on [0,1] | Weak derivative 0; traces (1,1), so in W¹,p but not W¹,p₀ | Pass; native zero-extension result not overused.  Carried from [r4]. |
| Integer-order versus fixed first-order norm | u=exp(iλx) on circle | ‖∂ʲu‖p=\|λ\|ʲ‖u‖p; order k=2 grows λ² rather than λ | Pass; all derivative orders retained.  Carried from [r4]. |
| Critical W^(n,1) endpoint | uε(x)=φ(x/ε) | ‖∂ⁿuε‖₁=‖∂ⁿφ‖₁, ‖uε‖∞=‖φ‖∞≠0; support shrinks | Pass; continuous embedding does not give compactness at the endpoint.  Carried from [r4]. |
| p=∞ smooth density exclusion | u=\|x\| in a chart | Weak derivative sign x; any continuous approximation to it has essential-sup error at least 1 | Pass; finite-p density restriction matters separately from q.  Carried from [r4]. |
| Banach couple sum/intersection | A₀=A₁=ℂ, u=1 | Sum quotient norm inf(\|a\|+\|b\|)=1; intersection max norm=1; naive sum=2 | Pass; Hausdorff common ambient carrier used.  Carried from [r4]. |
| Complex interpolation endpoint weights | Endpoint norms \|z\| and 2\|z\|, θ=1/4 | Interpolated norm of 1 is 2^(1/4), not 2^(3/4) | Pass; θ direction fixed.  Carried from [r4]. |
| Strip decay condition and quotient norm | Equal endpoints, Fε(z)=exp(ε(z−θ)²) | Fε(θ)=1; boundary maxima→1 as ε→0; constant function has no decay | Pass; infimum gives norm 1 without an inadmissible minimizer.  Carried from [r4]. |
| Real K-functional | Equal scalar endpoints, u=1, t=1/4,1,4 | K(t,1)=min(1,t)=1/4,1,1 | Pass; both decomposition regimes tested.  Carried from [r4]. |
| Real interpolation norm normalization | θ=1/2,q=2, u=1 | Integral over (0,1) is 1 and over (1,∞) is 1; squared norm 2, norm √2; q=∞ norm 1 | Pass; dt/t and unnormalized norm fixed.  Carried from [r4]. |
| Interpolation exponent/order | p₀=2,p₁=4,θ=1/2; s₀=0,s₁=2,θ=1/4 | 1/p=3/8 so p=8/3; s=1/2, not 3/2 | Pass; none.  Carried from [r4]. |
| Dyadic Besov definition/partition equivalence control | One weighted coefficient at j=2, s=0 then 1 | Norms 1 then 4; zero sequence norm 0 | Pass; wrong weights excluded.  Carried from [r4]. |
| Bessel–Besov sandwich distinguishes q | N unit weighted coefficients | ℓ¹ norm N, ℓ∞ norm 1; for p=2 the corresponding Hilbert norm √N | Pass; bounds 1≤√N≤N.  Carried from [r4]. |
| Bundle coordinate-transition norms | Shear (x,y)↦(x+ky,y), det=1 | L² norm unchanged; derivative coefficients acquire k and higher-order norms depend on k | Pass; volume control alone is insufficient.  Carried from [r4]. |
| Morrey exponent and integer margin | n=3,k=2,p=2; n=2,k=2,p=2 | Margins 1/2 and 1; second case permits β<1, not an asserted C¹ endpoint | Pass; strict endpoint qualification retained.  Carried from [r4]. |
| Full Hölder norm | Constant 1 | Sup norm 1, Hölder seminorm 0; full norm 1 | Pass; seminorm alone is not a norm.  Carried from [r4]. |
| Little Hölder closure | u=\|x\|^α near 0 | Quotient \|u(h)−u(0)\|/\|h\|^α=1 for every h≠0; does not tend to 0 | Pass; full and little spaces differ.  Carried from [r4]. |
| Hölder exponent discrimination | β=α+1/2 or α−1/2, h=1/16 | Quotients \|h\|^(β−α)=1/4 or 4 | Pass; stronger exponent gives vanishing ratio.  Carried from [r4]. |
| Zygmund distributions | δ₀ on ℝ, dyadic block constant c | ‖Δⱼδ₀‖∞=c2ʲ; s=−1 weighted value c, s=0 grows c2ʲ | Pass; distribution carrier necessary.  Carried from [r4]. |
| Ehrling lower-order term | Nonzero constant section, ε=1/2 | 1≤1/2+Cε requires Cε≥1/2; omitting lower-order term says 1≤1/2 | Pass; none.  Carried from [r4]. |
| Smoothing local regularization | δ₀ and Gaussian kernel | Output exp(−x²), value at 0 is 1 and all derivatives exist | Pass; smoothness is substantive.  Carried from [r4]. |
| Ellipticity at nonzero covectors | Principal ξ² at ξ=2; zero map on ℂ | Value 4 has inverse 1/4; zero map has kernel ℂ | Pass; inverse hypothesis substantive.  Carried from [r4]. |
| Zero-dimensional ellipticity | n=0; unequal fiber dimensions allowed | There is no ξ≠0; inverse identities are quantified over the empty set, homogeneous coefficient at 0 is 0 | Pass; no invalid rank-equality inference.  Carried from [r4]. |
| exists_inversePrincipalSymbol | ξ=2 and t=2 for order 2 | Both products 4·1/4=1; b(4)=1/16=2⁻²b(2); at ξ=0 assigned b=0 with no inverse equation | Pass; two sides and zero exclusion checked.  Carried from [r4]. |
| Two-sided parametrix | Circle L=1−∂², modes k=0,1,2 | L multiplier 1,2,5; inverse 1,1/2,1/5; products all 1 | Pass; none.  Carried from [r4]. |
| Smoothing defect for noninvertible elliptic operator | Circle Δ, constant mode | Green multiplier 0 at k=0; ΔG=0=Id−Π there, not Id=1 | Pass; kernel projection retained.  Carried from [r4]. |
| Elliptic a priori estimate | u=1 on circle | Δu=0 but ‖u‖₂=√(2π); a lower-order norm is necessary | Pass; no false coercivity.  Carried from [r4]. |
| Solvability/cokernel orthogonality | Δu=1 on circle | ∫Δu=0 whereas ∫1=2π | Pass; orthogonality obstruction is exact.  Carried from [r4]. |
| Overdetermined ellipticity distinction | d on scalar functions, ξ=(1,0) in ℝ² | Symbol z↦(iz,0) injective rank 1, not onto ℂ²; in ℝ¹ nonzero ξ gives an isomorphism | Pass; injective symbol not conflated with two-sided ellipticity.  Carried from [r4]. |
| Nonlinear bootstrap before Schauder | n=4, initial exponent 3 | 1/12=1/3−1/4; 1/6=1/12+1/12; W¹,⁶ gives margin 1−4/6=1/3 | Pass; prior positive regularity is produced.  Carried from [r4]. |
| Elliptic powers/strict positivity | L=1−∂², k=0,1,2 | Eigenvalues 1,2,5; L⁻¹ᐟ² gives 1,1/√2,1/√5; L⁰ gives 1,1,1 | Pass; no zero-eigenvalue division.  Carried from [r4]. |
| Sobolev domains of powers | Mode k of L | L^(s/2) multiplies by (1+k²)^(s/2); its graph weight matches H^s | Pass on model; general source comparison uncertified.  Carried from [r4]. |
| Strong parameter resolvent scaling | (ξ²−λ)⁻¹, (ξ,λ)↦(2ξ,4λ) | New value is 1/4 old value; at ξ=0, λ=−1,−2 values are 1 and 1/2 | Pass; combined homogeneity does not allow ξ-only simplification.  Carried from [r4]. |
| Weak rescaling requires derivative control | b(r,ξ)=r/(1+rξ²), r≥0 | ∂rb(0,ξ)=1; ∂r²b(0,ξ)=−2ξ² | Pass as model; Grubb–Hansen's exact symbol indices remain unverified.  Carried from [r4]. |
| Shifted product Laplacian | L₁ eigenvalue 2, L₂ eigenvalue 5 | L₁⊗1+1⊗L₂−1 has value 6, not 7 | Pass; shift counted once.  Carried from [r4]. |
| Change of order/principal normalization | Scalar symbol 2ξ, ξ≠0 | New symbol (2ξ)/\|2ξ\|·\|ξ\|=ξ; at ξ=2 its squared modulus is 4=\|ξ\|², not 16 | Pass; homotopy preserves invertibility.  Carried from [r4]. |
| Product-symbol block sign | A=[[3,−4],[4,3]] | A*A=25Id with off-diagonal 0; replacing −4 by +4 gives off-diagonal 24 | Pass; sign excludes wrong product.  Carried from [r4]. |
| Oddness versus self-adjointness | Q=[[0,2],[0,0]], γ=diag(1,−1) | γQ+Qγ=0 but Q*=[[0,0],[2,0]]≠Q | Pass; roadmap does not infer self-adjointness from grading.  Carried from [r4]. |
| Angular product cutoff ellipticity | Unit direction on either factor axis | One active square contribution is 1; normalized estimate is ≥1/2, not 0 | Pass; no lost axis.  Carried from [r4]. |
| Cutoff ordering and adjunction | ε=1/4,R=4 at modes (2,16),(3,16) | Arguments 16/65<1/4 and 144/265>1/2 give cutoff values 0 and 1; shifted actions give 0 versus 2 | Pass; cannot commute cutoff through a factor blindly.  Carried from [r4]. |
| Product homotopy compact tail | Spectral λ>R² with R=4 | λ⁻¹ᐟ²<1/4; finite eigenspace cutoff leaves operator norm ≤1/R→0 | Pass; spectral tail supplies compactness.  Carried from [r4]. |
| Product index kernel decomposition | Factor kernel/cokernel dimensions (2,1),(3,2) | Even dimension 2·3+1·2=8; odd 2·2+1·3=7; 8−7=1=(2−1)(3−2) | Pass; both grading pieces needed.  Carried from [r4]. |
| Equivariant/trivial/zero index | Trivial group; identity; zero Hilbert factor | Representation dimensions reduce to previous product; identity has 0−0=0; zero factor gives 0 on both sides | Pass; no nonzero-rank assumption used.  Carried from [r4]. |
| Elliptic-complex symbol exactness | Circle de Rham symbol at ξ=1 and ξ=0 | At 1 map is multiplication by i, exact; at 0 map is 0, exactness not required | Pass; excludes zero section.  Carried from [r4]. |
| Hodge/Green decomposition | Circle modes k=0,1,2 | Green values 0,1,1/4; ΔG values 0,1,1 equal Id−Π | Pass; harmonic zero mode retained.  Carried from [r4]. |
| Even/odd Laplacian types | D:ℂ→ℂ², D(z)=(z,0) | D*D=1 on ℂ; DD*=diag(1,0) on ℂ² | Pass in roadmap; source's repeated D*D is a misprint.  Carried from [r4]. |
| Quotient metric and degree | Cyclic rotations of circle, order d | Cover length 2π; quotient length 2π/d; local length element unchanged | Pass; free-action hypothesis essential.  Carried from [r4]. |
| Normalized pullback | d=4, constant 1 | J=1/2 times pullback; cover squared norm (1/4)2π=π/2 equals quotient squared norm | Pass; factor 1/d would give π/8.  Carried from [r4]. |
| Scalar realization/weak energy identity | exp(ikx), k=0,1,2 | Δ eigenvalues 0,1,4; q(u,u)/‖u‖²=0,1,4 | Pass; previous Friedrichs prerequisite unnecessary.  Carried from [r4]. |
| Smooth-core completion versus H² operator domain | Fourier coefficients on circle | H¹ weight 1+k²; H² weight (1+k²)²; at k=2 these are 5 and 25 | Pass; form and operator domains are distinct.  Carried from [r4]. |
| Reducing invariant domain and quotient modes | Rotation group order d | Invariants have k=dj; averaging other k gives 0; Δ values k²=d²j² match quotient | Pass; averaging preserves H².  Carried from [r4]. |
| Trivial subgroup control | H={1} | d=1, J=identity, norm factor 1 and spectrum unchanged | Pass; none.  Carried from [r4]. |
| Left inverse-pullback action | Noncommuting q=(12), r=(23) on delta functions over S₃ | q·(r·δe)=δqr=δ(123); reversing inverse convention gives δ(132) | Pass; group-action direction fixed.  Carried from [r4]. |
| Almost conjugacy and permutation characters | Conjugate order-two subgroups of S₃ | Characters on identity, transposition, 3-cycle are 3,1,0 for both | Pass; not tested only on abelian groups.  Carried from [r4]. |
| Transplantation of eigenspaces/resolvents | Unitary intertwiner on eigenspace λ, λ=4 | Both resolvents at −1 multiply by 1/(4+1)=1/5; form value 4‖u‖² is preserved | Pass; bounded intertwiner plus domain transport used.  Carried from [r4]. |
| Wavefront definition | Smooth 1; δ₀ | Smooth localized Fourier transform rapidly decays, WF empty; δ Fourier value 1 in every direction, WF all nonzero covectors over 0 | Pass; zero covector excluded.  Carried from [r4]. |
| Conormal direction control | δ(x) on ℝ² | Singular covectors are (ξ,0), ξ≠0; no pure nonzero y covector | Pass; direction is not just singular support.  Carried from [r4]. |
| Microlocal elliptic regularity | Identity on δ; smoothing on δ | WF(Idδ)=WFδ; Gaussian smoothing has empty WF | Pass; characteristic exception needed only for nonelliptic operator.  Carried from [r4]. |
| Pullback noncharacteristic condition | Projection (x,y)↦x | Transpose sends η to (η,0), zero only when η=0; normal set empty | Pass; δ pulls back to δ(x).  Carried from [r4]. |
| Forbidden pullback/product | Diagonal map and opposite conormals | Transpose sends (η,−η) to 0; δ₀·δ₀ has matching opposite covectors | Negative control; hypotheses exclude undefined operation.  Carried from [r4]. |
| Tensor product zero-factor terms | δ₀⊗1 | WF contains (ξ,0), ξ≠0; naïve product WFδ×WF1 would be empty | Pass; enlarged cone retains zero factors.  Carried from [r4]. |
| Proper pushforward/critical points | Compact smooth density of integral 1 mapped constantly to 0 | Input WF empty; output δ₀ has all nonzero covectors; df=0 creates the required zero-preimage term | Pass; fixed support cone includes it.  Carried from [r4]. |
| Pushforward identity/nonproper control | Identity; noncompact constant density to point | Identity pairing unchanged; latter fiber has infinite volume and noncompact support | Pass; properness on support is substantive.  Carried from [r4]. |
| Fixed target cone in pushforward continuity | Same constant map, fixed C; u=0 versus a mass-1 bump | Individual output WFs empty versus all nonzero at 0; fixed C gives the same admissible full cone for both | Pass in roadmap; source issue recorded.  Carried from [r4]. |
| Equivariant Fredholm local constancy | Z₂ on ℂ² by diag(1,−1), Tₜ=diag(1+t,2−t), 0≤t≤1 | Both eigenvalues stay ≥1; kernel/cokernel multiplicities in both characters stay 0. Crossing a zero eigenvalue leaves the invertible neighborhood | Pass; a common Fredholm ball, not independently chosen radii per irreducible, is used.  Carried from [r4]. |
| Factor versus product graph domains | Fourier modes (0,k) on the two-torus | First derivative multiplier 0; product H¹ weight 1+k². Coefficients 1/k give finite L² sum but divergent H¹ sum | Pass; an amplified factor domain is larger than product H¹.  Carried from [r4]. |
| Product graded square | Dₚ=[[0,3],[3,0]], γ=diag(1,−1), Dq=[[0,4],[4,0]] | Dₚγ+γDₚ=0, so cross terms vanish; (Dₚ⊗1+γ⊗Dq)²=(9+16)Id=25Id | Pass; required anticommutation is explicit.  Carried from [r4]. |

## Not verifiable

No changed assertion lacks a readable source input. The following unchanged limits are carried from r4, without pretending to have repeated its full source search:

- **hormander:** Theorem 5.2.1 remains cited by locator only; the earlier service lookup of the actual Springer book was uncertified/paywalled.
- **adams_fournier:** Theorems 4.12 and 6.3 were not found legally by the earlier bibliographic lookup; exact endpoint wording remains uncertified.
- **brezis:** Theorems 8.2, 8.7, 8.12, 9.9 and 9.16 remain uncertified/paywalled from the earlier Springer lookup.
- **shubin:** Chapter II §§9–11 remains uncertified/paywalled; no new claim about its parameter calculus was verified.
- **grubb:** The earlier attempts at both Copenhagen author hosts timed out; chapter 8 remains unread.
- **grubb_hansen:** The earlier attempts at both Copenhagen hosts timed out; Definition 2.1/§4 and version numbering remain unverified.
- **seeley:** The earlier DOI lookup reached the AMS landing page without readable text; the general contour proof remains unverified.
- **pde_discussion:** The cited Zulip background was unreadable through the service in r4; it is not a proof input.
- Ownership against unsupplied open ContactGeometry and RelativisticQuantumFieldTheory files was not checked. Main ContactGeometry was checked; no main file was available at the cited RelativisticQuantumFieldTheory path.

These limitations are unchanged by this increment. No source manifest or pull-request file was edited, and no new missing-text request is needed.

## Source issues

The following new typographical slips were checked on images of the cited Melrose pages. They are source issues, not additional roadmap findings: the README uses distribution kernels, compatible local amplitudes and the correct partition construction.

- **Misprint** in melrose_iml at Proposition 5.1, (5.26), printed p. 133: the source says every pseudodifferential kernel is globally smooth; it should be distributional globally and smooth off the diagonal; affects a stated result.
- **Misprint** in melrose_iml at (5.28), printed p. 133: the source says the right cutoff is an unindexed ρ; it should be the same indexed cutoff ρᵢ as on the left; affects a stated result.
- **Misprint** in melrose_iml at (5.33), printed p. 133: the source says the final summed kernel has right cutoff ρⱼ; it should have right cutoff ρᵢ matching the summation index; affects the proof.
- **Misprint** in melrose_iml at proof of Proposition 5.2 before (5.34), printed p. 134: the source says σₘ(N) vanishes after introducing an operator A; it should say σₘ(A); affects the proof.
- **Misprint** in melrose_iml at (5.34), printed p. 134: the source says both partition sums run over i, leaving j unbound; it should sum over i and j; affects the proof.
- **Misprint** in melrose_iml at proof of Proposition 5.2 after (5.34), printed p. 134: the source says both partitions are the primed squared partition; it should distinguish the unprimed and primed squared partitions; affects the proof.
- **Misprint** in melrose_iml at (5.35), printed p. 134: the source says a left full symbol depends on both x and y through cutoffs; it should prescribe that expression as an amplitude, then take its left-symbol reduction; affects the proof.

For (5.26), the identity kernel δ(x−y) is the immediate counterexample to global smoothness. For (5.33), take cutoff values ρ₁=3/5 and ρ₂=4/5 and fix j=1: the wrong factor is (3/5)(7/5)=21/25 instead of Σρᵢ²=1. For (5.35), with symbol 1 the amplitude χ(x)χ(y) quantizes to multiplication by χ²; its left symbol is χ(x)² and has no y variable.

The following unchanged source issues are carried from r4's source audit:

- **Misprint** in taylor at Lecture I (1.14), printed p. 5: the source says the integral of the heat semigroup equals the inverse of its negative generator; it should be the negative of that integral for the displayed Laplacian convention; affects the proof.
- **Misprint** in taylor at Lecture I (2.8), printed p. 8: the source says the commutator order is m₁+m₁−1; it should be m₁+m₂−1; affects a stated result.
- **Error** in taylor at Lecture I (2.9), printed p. 8: the source says the scalar Poisson-bracket formula also holds for pointwise commuting matrix symbols; it should be restricted to scalars, or retain the ordered second product ∂ξp₂∂xp₁ in the commutator formula; affects a stated result.
- **Error** in bdh at Theorem 6.3, printed pp. 21–22: the source says the fixed codomain cone depends on the variable input's support; it should be defined using the fixed closed set C for the stated continuity map; affects a stated result.
- **Gap** in bdh at proof of Theorem 6.3, printed p. 22: the source says to choose a compactly supported cutoff equal to one on all of C; it should be one near the fixed compact intersection K, since C may be noncompact; affects the proof.
- **Misprint** in berard at Theorem 14, printed p. 158: the source says the inverse fixed-vector map for K has codomain Vᴴ in its parenthetical type; it should be Vᴷ, consistently with the preceding construction and theorem conclusion; affects a stated result.
- **Misprint** in atiyah_singer at §7, printed p. 521: the source says both even and odd Laplacian sums are D*D; it should be D*D on even sections and DD* on odd sections; affects a stated result.

[r4]: packages/PseudodifferentialOperators/reports/PRREVIEW-PseudodifferentialOperators~4.md
