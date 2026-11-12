<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12769#issuecomment-6778863184 -->
Review (codex) of 5903ea7

Verdict: needs_changes

1. **F01** (P1) The two total weak differentials disagree on discontinuous maps

   **Location:** `packages/SobolevMapsBetweenManifolds/README.md:1004`, especially line 1007: “For `N = V` it is the weak differential of §4.1.” Compare lines 898, 904–907 and 1021.

   **Claim:** The total manifold-valued differential agrees with the vector-valued total differential without a continuity qualification.

   **Witness:** Take `u(x)=log|x|` on ℝ², assigning 0 at the origin. Section 4.3 gives 0 because u is discontinuous; §4.1 gives `Du(x)h=⟨x,h⟩/|x|²` almost everywhere, nonzero off 0.

   **Exact repair:** Qualify the comparison by continuity of u and state equality almost everywhere when a weak differential exists. Keep the two total choices distinct outside that common domain. Add this log-radius example as a negative-control Check. Do not remove discontinuous maps from §4.1 or §8.3.

   **Repair test:** On `1<|x|<2`, the vector differential has norm `1/|x|` between 1/2 and 1, whereas the total manifold differential remains 0 because global continuity fails. The corrected comparison excludes this map. On the punctured plane both constructions exist and agree almost everywhere with that same nonzero field.

2. **F02** (P2) The acceptance file omits promised Jacobian comparisons

   **Location:** `packages/SobolevMapsBetweenManifolds/README.md:29`: “The Jacobian `J_f`, its chart formula, its sign laws”; lines 35–37 promise the Euclidean determinant identification. Compare `packages/SobolevMapsBetweenManifolds/Suggested.lean:228`, line 276 and the all-statable assertion at line 18.

   **Claim:** All headline results are represented at the pins.

   **Witness:** `jacobian_hadamard_integrability` assumes `0<n` and has no chart formula. `euclidean_compatibility` concludes only membership and weak-derivative equivalences; it contains neither a Jacobian nor a determinant. No other declaration supplies these comparisons.

   **Exact repair:** Extend the T4 acceptance statement to include the chart formula promised in §6.2, with the chart-domain hypotheses, orientation factors and positive chart densities. Keep the pointwise Jacobian characterization valid in dimension zero, placing the positive-dimension condition on the `p/n` conclusion. Extend the T6 acceptance statement to identify the oriented Jacobian with `det U` under the flat metric and matching orientations. These use the existing differential predicate, volume forms, chart densities, matrices and determinants; no opaque carrier or stand-in is needed. The flat-volume comparison of §7.1 is also statable. Retain elementary sign/norm consequences as README API rather than adding a catalogue of small theorems.

   **Repair test:** Native signatures for an arbitrary-dimensional linear Jacobian characterization and the flat-volume comparison on an arbitrary open Euclidean domain elaborated in a scratch copy, with only `sorry` warnings. For the missing chart formula, take `f=id` on ℝ, source chart `φ(x)=2x`, target metric `4 dt²`: coordinate derivative `1/2`, source density `1/2`, target density `2`, hence `(1/2)·2/(1/2)=2=J_f`. In dimension zero the characterization gives `J=±1` and never divides by zero. For T6, the flat reflection of ℝ² gives `J=det(diag(−1,1))=−1`, distinguishing it from `normDet=1`.

3. **F03** (P2) The mollification argument asserts an invalid dominating bound

   **Location:** `packages/SobolevMapsBetweenManifolds/README.md:686`: “`DG(u_ε) Du_ε → DG(u) U` in `L¹(V)` by dominated convergence with bound `2L|U|`.”

   **Claim:** The displayed product difference is controlled by `2L|U|`.

   **Witness:** For `G=id`, `u(x)=x³`, an even mollifier of variance σ² gives `Du_ε−U=3σ²ε²`. The proposed bound is `6x²`, smaller on the positive-measure interval `|x|<σε/√2`.

   **Exact repair:** Split the difference into `DG(u_ε)(Du_ε−U) + (DG(u_ε)−DG(u))U`. Bound the first term's L¹ norm by `L‖Du_ε−U‖₁`; apply dominated convergence only to the second term, bounded by `2L|U|`. The existing mollification and weak-limit suppliers then suffice. No change to the chain-rule statement is needed.

   **Repair test:** In the cubic example the second term is identically 0. On `V=(−1,1)` the first term has L¹ norm `6σ²ε²→0`. This proves the convergence without the false pointwise domination.

4. **F04** (P2) The ambient extension contract drops hypotheses of its supplier

   **Location:** `packages/SobolevMapsBetweenManifolds/README.md:373`: “a `C^k` map on a compact portion of an embedded boundaryless manifold extends to a compactly supported `C^k` map of the ambient manifold.”

   **Claim:** The pinned extension theorem supplies this for an unrestricted ambient manifold under the roadmap's standing C¹, non-Hausdorff conventions.

   **Witness:** `TauCeti/Geometry/Manifold/SmoothEmbedding/Extension.lean:165`–172 requires a finite-dimensional ambient model, `[IsManifold J ∞ N]`, `[T2Space N]` and `[SigmaCompactSpace N]`; the theorem at line 201 retains those ambient hypotheses.

   **Exact repair:** Record these hypotheses in the exact supplier contract, or specialize that contract explicitly to the finite-dimensional vector-space ambient used in §8.4. Preserve the C¹ regularity of the embedded source and embedding: the supplier's smoothness requirement concerns its ambient manifold, not the embedding's order.

   **Repair test:** In §8.4 the ambient space is `V₁` or `V₂`, a finite-dimensional real normed space. It is Hausdorff, σ-compact and canonically smooth, so the corrected contract still supplies the compactly supported C¹ extension G. No new supplier gap is necessary.

5. **F05** (P3) The isometric-norm declaration is padding

   **Location:** `packages/SobolevMapsBetweenManifolds/Suggested.lean:302`, `isometric_immersion_norm`; the corresponding name occurs in `packages/SobolevMapsBetweenManifolds/README.md:1504`.

   **Claim:** This is an admitted headline theorem requiring the roadmap's Sobolev theory.

   **Witness:** The declaration closes with one `exact` using `LinearMap.isometryOfInner` and `LinearIsometry.norm_toContinuousLinearMap_comp`; neither `hD` nor `hι` is used. The scratch elaboration succeeds.

   The successful one-tactic replacement was:

   ```lean
   exact fun x =>
     ((mfderiv J 𝓘(ℝ, V) ι (f x)).toLinearMap.isometryOfInner
       (hisom (f x))).norm_toContinuousLinearMap_comp
   ```

   The pinned inputs are `Mathlib/Analysis/InnerProductSpace/LinearMap.lean:126` and `Mathlib/Analysis/Normed/Operator/NormedSpace.lean:53`.

   **Exact repair:** Delete it from `Suggested.lean`. Keep the norm identity in the README, cite the two library inputs, and remove the claim that this deleted Lean name is declared here. The actual Sobolev transport theorem `immersion_comparison` remains the substantive T5 acceptance test. Do not prove the padding in place.

   **Repair test:** The scratch proof works for every supplied linear field, independently of weak differentiation. For the circle map its norm is `1/(2√|t|)` on both sides; doubling the embedding produces `1/√|t|` and fails the isometry hypothesis.

6. **F06** (P3) The cited introduction does not define the Jacobian measure

   **Location:** `packages/SobolevMapsBetweenManifolds/README.md:1374`: “`∫ g J_f dvol_M` (HeikkilaPankka2025 line 25–27).” Also `packages/SobolevMapsBetweenManifolds/sources.toml:20`, the `cited_for` entry attributing §6.4's Jacobian measure to those lines.

   **Claim:** That locator supports the signed-density measure and its integration formula.

   **Witness:** HeikkilaPankka2025 lines 25–27, printed p. 1, give the distortion inequality and explain the operator norm and Jacobian determinant. They contain no measure construction, signed-density convention or integration formula.

   **Exact repair:** Keep that locator for the determinant notation only. Present §6.4's positive/negative density pair as the roadmap's construction from `Measure.withDensity`, and cite the pinned density-integration results for its formulas, or supply a legal exact locator actually stating them. Correct the author's `cited_for` attribution in the fix round; this review has not rewritten the manifest.

   **Repair test:** The density definition gives `μ⁺([0,1])=2, μ⁻([0,1])=0` for `f(x)=2x`; for `f(x)=−x` it gives `μ⁺=0, μ⁻([0,1])=1`. These computations follow from the definition and remain unchanged by correcting the attribution.

Six findings: one P1, three P2 and two P3. The package is repairable; its scope is appropriate for a new roadmap. The original acceptance file elaborates. No package input was changed, including the sources manifest.

## Verified sound

### Coverage, principles and shape

Read all four package inputs, all 29 numbered mathematical sections, all API lists and Checks, all eight layer dependency summaries, and every `Needs` line. There was no previous package review. The available design repair history does not mark any of the six findings above as not actionable.

The package develops general first-order local theory, including every `1≤p≤∞`, arbitrary finite-dimensional real normed models, continuous metrics, arbitrary open covers, non-injective local diffeomorphisms and discontinuous extrinsic members. It does not introduce a route-specific shortcut or a computational algorithm. Its eight mathematical layers are not the chapter order of Hajłasz, Heikkilä–Pankka or Martio–Rickman–Väisälä. The separate placement of the independent null-set bridge before the differential construction has a mathematical reason. No source prose was found copied in the checked passages.

The README has the required summary, ownership, conventions, supplier contracts, build explanation, eight Examples/Dependencies endings, consumers and references. Each of its definitions has an API and at least three Checks. All 20 declared Lean names occur in the README; every backticked name presented as this roadmap's declaration resolves to one of them. No `set_option`, admitted data, `lemma`, admitted example, free predicate stand-in, HTML anchor, machine path, pull-request number or review narrative occurs in the two roadmap files. `metadata.toml` records `math.DG`; all eight cited works occur exactly once in the manifest. There are no declared supplier gaps.

### Elaboration, binders and padding probes

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

Ran the required `lake env lean` on the original `Suggested.lean` from the content checkout: **exit 0, exactly 15 warnings, all “declaration uses sorry”**. All four imported Tau Ceti modules already had usable object files; no build was needed. The file contains five real-bodied definitions and fifteen theorems, with one `import Mathlib` and only the four used Tau Ceti imports.

Appended `#check @name` for each of the 20 declarations in a scratch copy and elaborated it once. Compared the resulting types with the README and with the supplied signature ledger. No needed finite-dimensional, boundaryless, Lindelöf, metric-continuity, orientation or exponent binder was silently dropped. Orientation data contains the dimension equality: `TauCeti/Geometry/Manifold/Orientation/Lift.lean:52`–58, so T4 does not need a second independent dimension assumption.

On another scratch copy, tried each of the 15 admitted theorems with `simp`, `rfl` and `infer_instance`, each in a solving branch. All 15 failed those three probes. Reading the pinned near-matches and a further one-`exact` probe identifies precisely the padding in R05. The other 14 signatures contain actual Sobolev, atlas, measure or immersion comparisons absent from those library lemmas. No proof-time option override was used. All Lean processes finished.

| Headline | Acceptance coverage |
| --- | --- |
| T1: open-cover locality and three Euclidean chain rules | `memW1pLoc_iUnion`, `precomp_localDiffeomorph`, `postcomp_boundedDerivative`, `postcomp_continuous`; finite/infinite exponents retained. |
| T2: atlas independence, weak differential, C¹ compatibility, null sets | `memManifoldW1pLoc_iff_atlases`, `exists_hasWeakMDeriv`, `contMDiff_memManifoldW1pLoc`, `isNullSet_iff_riemannianVolume_eq_zero`; the null-set theorem correctly permits boundary. |
| T3: local operator-norm criterion and comparable metrics | Criterion in `memManifoldW1pLoc_iff_norm`; the comparison-constant calculation is elementary linear algebra in §5.3. |
| T4: oriented Jacobian, chart comparison, Hadamard, integrability, measure | Characterization/Hadamard/integrability and change of variables are present; R02 records the missing chart comparison and the unnecessarily positive-dimensional characterization. |
| T5: immersion membership/differential comparison and isometric norm | `immersion_comparison` is substantive; the separate norm declaration is R05. |
| T6: Euclidean membership, differential, norm and determinant | Membership/differential are present; the determinant comparison is missing (R02). |
| T7: independence of embedding for a compact boundaryless target | `embedding_independence` has both C¹ embeddings, compactness and no continuity assumption on u, as required. |

None of the missing comparisons requires a presently unavailable carrier. Naming everything “statable” in the docstring does not replace their signatures.

### Computed adversarial table

The rows cover the fifteen seeded targets, all seven headline groups, the five Lean definitions, and every target touched by a finding. Other section rows record the checks on the remaining construction steps. The notation `true/false` below records the computed membership predicates, not an elaboration result. Exponents are at least one unless a row explicitly tests zero.

| Statement / target | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| §1.1 `MemLpLoc`: compact locality, restriction, p=0 | Empty set; `g(x)=x`; `g=1/x` on (0,1) | Empty restricted measure and seminorm are 0. On [a,b]⊂(0,1), ess sup=1/a<∞, while global integral is ∞. For measurable x at p=0, global seminorm=0. | Local/global and zero-exponent distinctions correct. |
| §1.1 algebra, domination, measure comparison | `g=x`, `g'=2x`, μ versus 3μ on [−1,1] | L¹ integrals 1 and 2; changing μ to 3μ gives 3 and 6, all finite. For ∞, ess sup 1 and 2 is unchanged by positive rescaling. | API retains strong measurability; no false global bound. |
| §1.2 `MemW1pLoc`, coordinates and Haar invariance | `u=log r` in ℝ²; vector `(x,2x)`; 3μ | Gradient integral `2π/(2−p)` for p<2, ∞ at p=2; at p=1 it is 2π. Coordinate derivatives are 1 and 2, combined `(1,2)`. Rescaling μ multiplies both weak-integral sides by 3. | Rejects Lp-only and classical-a.e.-only models. |
| §1.2 weak versus classical derivatives | Heaviside; Cantor function | Heaviside classical derivative 0 but distributional derivative δ₀, pairing φ(0). Cantor values at 1/4 and 3/4 are 1/3 and 2/3, although derivative=0 a.e. | Neither is W¹,¹ locally across its singular set. |
| §1.3 / T1 gluing | Empty cover; two half-planes; log-radius cover | Empty-cover sides both true, all integrals 0. Half-plane derivatives both 0, but jump derivative on the union completed by the missing line is `2δ_{x₁=0}`. Log cover gives true iff p<2 on both sides. | Exact open coverage is essential; arbitrary index set causes no problem after a countable subcover. |
| §1.4 W1p comparison | `u=x₁` on a small ball; `u=|x|`, p=∞ | Weak linear derivative `v↦v₁` equals the inner-product functional of gradient e₁. For |x|, gradient norm=1 and values bounded on bounded subdomains; values unbounded globally. | Local scalar comparison matches native W1p. |
| §2.1 null images/preimages | Projection; constant map; invertible dilation | ℝ×{0} has 2D measure 0 but projected image ℝ has measure ∞. Constant preimage of a point has measure ∞. Under dilation 2, point preimage and image both have measure 0 in positive dimension. | Dimension and invertibility assumptions discriminate. |
| §2.2 / T1 precomposition | θ(y)=2y; θ(z)=z² on punctured plane | For u=|x|, both chain expressions give `2⟨y,h⟩/|y|`. For log modulus and z², both give `2⟨z,h⟩/|z|²`; covering multiplicity is 2. | Non-injectivity allowed correctly; null preimages preserve arbitrary representatives. |
| §2.2 excluded singular precomposition | θ(y₁,y₂)=(y₁,0), u=log r | Original gradient has finite L¹ disk integral 2π; composite derivative has integral `∫1/|y₁|=∞`. | Singular derivative must remain excluded. |
| §2.3 bounded postcomposition | Linear G=A; G(t)=exp(t²) | Linear derivative is A·Du on both sides. For log r, exp((log r)²)≥r⁻² near 0, with infinite L¹ integral. | Bounded-derivative theorem sound; its proof needs R03. |
| §2.3 proof domination | u=x³, G=id, even mollifier | Difference=3σ²ε²; proposed bound=6x², fails for `|x|<σε/√2`. Split proof gives second term 0 and first L¹ norm 6σ²ε². | R03. |
| §2.4 / T1 continuous postcomposition | Product G(s,t)=st; log after |x| | Product derivative `u₂Du₁+u₁Du₂`; for `(x,x²)` both give 3x². On punctured plane log derivative is `⟨x,h⟩/r²`; at 0 the range condition fails. | Continuity/open range supply compact local bounds. |
| §3.1 / T2 null-volume equivalence | Dimension 0; scaled/non-smooth metrics in ℝ² | In dimension 0, singleton mass=1, only empty set null. Flat square volume=1, metric 4I gives 4. Metric `(1+√|x₁|)I` gives square volume 5/3; the vertical segment has measure 0 for all three. | Outer-null equivalence and continuous-metric generality consistent. |
| §3.2 local Lp on manifolds | dx² versus exp(2x)dx²; g=1_{x≥0}exp(−x) | Global integrals 1 and ∞; on every compact set both finite. On a finite 0-dimensional compact set, any function has finite maximum and finite sum. | Local metric independence correct; global equality not asserted. |
| §3.3 null transport | Cover ℝ→S¹; uncountable disjoint slices | Point preimage is a translate of 2πℤ, null. For ℝ×ℝ_discrete, `{0}×ℝ_discrete` is chart-null but image under `(x,d)↦d` is ℝ, measure ∞. Countable slices give countable null image. | Countable-cover condition is necessary and present. |
| §4.1 vector class and atlas dependence | u=|x|; source chart x³ | Standard derivative magnitude 1; in new smooth structure magnitude `|y|⁻²ᐟ³/3`, integrable to pth power iff p<3/2. Zero-dimensional derivative=0. | Model fixes the C¹ structure, not just topology. |
| §4.2 / T2 manifold class and atlas comparison | Identity with chart 2x; circle square-root angle | Local identity representative y/2 has derivative 1/2; tangent identity has derivative 1. Circle differential norm `1/(2√|t|)`, whose pth power is locally integrable iff p<2. | Correct chart domain, continuity and two-sided chart transport. |
| §4.3 / T2 field existence/uniqueness | Identity; change one field value at t=1 | `1·1·(1/2)=1/2`; chart identities match. Fields with values 1 and 7 at one point have difference set {1}, measure 0. | Uniqueness is a.e., never pointwise. |
| §4.3 total-choice comparison | Discontinuous log r with vector target | Total manifold differential=0 everywhere; vector differential norm=1/r a.e. On annulus 1<r<2 its norm integral is 2π, versus 0. | R01; compare only on the common continuous domain. |
| §4.4 / T2 C¹ compatibility | t|t|; |t|; Cantor function | For t|t|, classical and weak derivatives both 2|t|. For |t|, weak derivative sign(t), norm 1 despite failure of C¹ at 0. Cantor derivative 0 a.e. does not give weak membership. | Sufficient condition is not silently made necessary. |
| §4.5 restriction, gluing and metric copies | Circle map restricted off 0; tanh into (−1,1) | Circle belongs for all p on either half-line but only p<2 globally. For tanh, both corestriction derivatives are `1−tanh²`, including when tested through the ambient chart at 2. | Correct full-cover and target-chart conditions. |
| §4.6 manifold chain rules | √|t| after dilation 2; rank-one projection of r¹ᐟ² | Dilation derivative `sign(y)/√(2|y|)` from both expressions. Original radial derivative is locally Lp iff p<4; projected derivative iff p<2. | Local diffeomorphism assumption cannot be replaced by smoothness. |
| §5.1 metric operator norm | id: flat ℝ→metric 4dt²; source chart 2x | Intrinsic norm=2 in first case, naive coordinate norm=1. In the second case intrinsic norm=1, coordinate norm=1/2. | Norm uses tangent metrics. |
| §5.2 / T3 iff | √|t|; t log|t|; Cantor total differential | √|t|: membership and derivative Lp both iff p<2. t log|t|: both true for finite p, both false at ∞. Cantor total differential 0 lies in all Lp but W¹,¹ hypothesis is false. | Both directions and exclusion of total-junk inference verified. |
| §5.3 metric comparisons | Target norm scaled c>0; diag(1,4) metric | Lower/upper bounds both c‖A‖ in uniform scaling; identity from flat ℝ² to diag(1,4) has norm 2, attaining β/a=2. Source scaling b gives norm ‖A‖/b. | Correct ratios α/b and β/a. |
| §6.1 / T4 oriented linear Jacobian | diag(2,1), reflection, nonorthonormal basis | J=2, normDet=2, norm²=4. Reflection J=−1 or +1 after one orientation reversal. Nonorthonormal source basis makes det matrix(id)=2 while J(id)=1. | Signs, basis qualification, pullback direction correct. |
| §6.1 zero dimension and composition | Both orientations ±; scalar 0; A=diag(2,1), B=reflection | Zero-dimensional J is +1 for equal signs, −1 for unequal; normDet=1 and 0⁰=1. J(BA)=−2=(−1)·2. Scaling by 0 in positive dimension gives J=0. | No lost sign at n=0; no inverse-Jacobian convention. |
| §6.2 / T4 chart formula | Source chart 2x, target metric 4dt², f=id | Coordinate determinant=1/2, densities 1/2 and 2, orientation factors +1; formula gives 2, matching intrinsic J. Opposite target orientation gives −2. | Formula mathematically correct; absent from acceptance (R02). |
| §6.2 fold and a.e. choice | F(x,y)=(|x|,y) | J=sign(x) a.e., abs J=1=normDet, norm DF=1. Altering D on x=0 changes no a.e. identity or measure. | Signed determinant distinguished from absolute value. |
| §6.3 / T4 Hadamard and p/n | Radial stretch x r⁻¹ᐟ²; λ≥0 times isometry | Singular values r⁻¹ᐟ² and r⁻¹ᐟ²/2; J=1/(2r)≤1/r. Derivative range p<4; Jacobian range q<2. For λU: abs J=λⁿ=normⁿ, including n=0. | Bound, sharp exponent thresholds and ∞ case consistent. |
| §6.3 nonintegrable Jacobian example | Disjoint discs from README | Centres distance=2r_k, radii sum=3r_k/2. Values scale 1/√k→0. Derivative p-mass proportional to `2^{−(2−p)k}k^{−p/2}`, summable for p<2; positive Jacobian mass π/(4k), divergent. | Continuous subcritical member can have non-L¹ Jacobian. |
| §6.4 / T4 measures and change of variables | 2x, −x; z² on 1<|z|<2 | Positive/negative masses (2,0) and (0,1) on [0,1]. For z² density integral=30π, image area=15π; injectivity fails with multiplicity 2. | Open embedding hypothesis correct; locator issue R06. |
| §6.4 extended integral convention | F(x,y)=(√|x|,y) on [−1,1]² | Total variation=4; integral of norm²=∞ since it dominates 1/(4|x|). Junk real integral of that divergent nonnegative function=0 would yield false 4≤0. | Extended integral correctly used. |
| §7.1 / T6 Euclidean compatibility | id, reflection, z², inversion | id: D=id, J=1, norm 1 (0 in dimension 0). Reflection J=−1. z²: J=4|z|²=norm². Inversion: radial eigenvalue −r⁻², tangential eigenvalues r⁻², so J=−r⁻²ⁿ. | Class/differential tests pass; determinant acceptance missing, R02. |
| §8.1 local retractions | Circle inclusion; s³; figure-eight patch | Circle r(ι(z))=z. Cube inverse derivative magnitude `|t|⁻²ᐟ³/3`, unbounded at 0, so no C¹ retraction. On one regular figure-eight source patch the normal-form projection is a left inverse. | Local source patch correctly allows self-intersections. |
| §8.2 / T5 immersion comparison | s³ after cube root; circle and double cover | Composite=id has derivative 1 and every membership; cube root derivative in Lp iff p<3/2, excluded by rank failure of s³. Circle double cover doubles angle derivatives; both membership thresholds p<2. | Immersion, continuity and local inverse route correct. |
| §8.2 isometric norm | Circle inclusion versus twice inclusion | Norms `1/(2√|t|)` versus twice that; isometric case equality, nonisometric case factor 2. Arbitrary zero field gives 0=0 without hD. | R05: linear-isometry library consequence. |
| §8.3 extrinsic class | Hedgehog B³→S²; jump into S⁰ | Hedgehog Hilbert–Schmidt norm √2/r, p-mass `4π·2^{p/2}/(3−p)` for p<3, divergent at 3. Jump values have abs value 1 but derivative contains a hypersurface measure. | Extrinsic class includes singular Sobolev maps, excludes merely bounded jump maps. |
| §8.4 / T7 compact embeddings | log log(1/r) and graph embedding; half-angle jump; two sphere embeddings | Original gradient-energy radial integral `∫₀^{1/e}dr/(r log²(1/r))=1`; graph second coordinate 1/r has gradient L¹ integral ∞. Double cover removes jump but inclusion retains it. Two embeddings z and (z,z²) give derivative norms 1/r and √5/r, same threshold p<2. | Both compactness and embedding injectivity discriminate; bounded ambient extensions handle ∞. |

### Source verification

Read the three supplied legal extractions directly. No additional work was cited that required fetching, and no settled source was requested again. The five uncertified entries are limitations of certification, not new findings or new reference requests.

| Seeded target | Locator read or settled | What the text actually supports |
| --- | --- | --- |
| 1.2 | Ziemer1989 Ch. 2 §2.1; Mazya2011 §1.1: uncertified. HeikkilaPankka2025 lines 22–27, p. 1 read. | The open paper uses continuous W¹,n maps of oriented equal-dimensional Riemannian manifolds with n≥2; it does not construct this general vector-valued local carrier. The weak-derivative construction is the package's pinned-library extension. |
| 1.3 | Mazya2011 §1.1: uncertified. | Could not certify the source's gluing statement. Independently checked the package's countable-subcover, weak-uniqueness and partition-of-unity route. |
| 2.1 | Lee2012 Ch. 6: uncertified. | Checked the actual Mathlib null-image theorem and Tau Ceti lower-dimensional image theorem instead; inverse-function route supplies preimages. |
| 2.2 | Ziemer1989 Thm. 2.2.2; Mazya2011 §1.1: uncertified. | Native `W1p.compL` requires injectivity, finite p and global bounds. Localization supplies those hypotheses; p=∞ is handled through local W¹,¹ and null transport, not by misapplying compL. |
| 3.1 | Lee2012 Chs. 6, 16: uncertified. | Independently verified the chart-volume construction, positive density, measurable embedding and countable-chart argument. |
| 3.2 | Lee2012 Ch. 16: uncertified. | Positive continuous densities on compact chart patches give both comparison bounds; this is the package's derivation. |
| 4.2 | HeikkilaPankka2025 lines 22–23, p. 1. | Confirms the continuous W¹,n context, not atlas independence at all exponents. The latter is the stated chain-rule derivation. |
| 4.3 | HeikkilaPankka2025 lines 22–26, p. 1. | Names the weak differential and norm, but does not state the claimed existence/uniqueness construction. The package supplies that construction; R01 concerns its total-choice comparison. |
| 4.5 | Mazya2011 §1.1: uncertified. | Source locality could not be inspected; open-subset chart and metric-copy claims were checked against native definitions. |
| 4.6 | Ziemer1989 Thms. 2.1.11, 2.2.2: uncertified. | The package's manifold conclusions are reductions to its Euclidean rules, not quotations of a manifold theorem in that book. |
| 6.1 | MartioRickmanVaisala1969 lines 118–127, extraction page 6; Rickman1993 Ch. I §1: uncertified. | The article introduces formal derivatives and J(x,f) on Euclidean domains. Oriented unequal-carrier linear algebra and dimension zero are the package's extension, checked with native volume forms. |
| 6.2 | HeikkilaPankka2025 lines 25–27, p. 1; Lee2012 Ch. 15: uncertified. | The first locator supports Jacobian notation; the oriented chart formula is not stated there. Its density/sign calculation was independently checked. |
| 7.1 | MartioRickmanVaisala1969 lines 124–125 and §2.16, lines 332–340, printed p. 12 for §2.16. | §2.16 defines continuous ACL and ACLᵖ maps, not a manifold weak-derivative comparison. The package does not claim ACL=W¹,p here; QuasiregularMaps owns that theorem. |
| 8.2 | Hajlasz2009 lines 20–28, printed p. 185; HeikkilaPankka2025 lines 1328–1329, printed p. 24. | Hajłasz uses compact smooth manifolds, finite p and a Nash embedding; Appendix B uses an embedding for W¹,∞. Neither states the general C¹ immersion equivalence. The package correctly supplies a local-retraction route, including noninjective immersions. |
| 8.4 | Hajlasz2009 lines 23–28, p. 185, and lines 102–107, p. 187. | Defines the extrinsic class and the compact boundaryless convention. It is not an embedding-independence theorem at that locator. The independence proof is supplied here using the native extension theorem and bounded chain rule; R04 corrects that supplier's description. |

Also checked Hajlasz2009 Thm. 2.1, lines 129–130, printed p. 188, against the Part II promise: its ambient convention is finite p. Lines 138–141 begin the borderline p=n argument. The README retains finite exponents and places these approximation results in Part II, not in this roadmap. HeikkilaPankka2025 arXiv v2 is the version recorded and read; its composition-order misprint is recorded below.

### Library and ownership audit

Read two main-branch house-style examples in detail, PDE and DifferentialGeometry, and inspected RiemannianGeometry and PseudoholomorphicCurveAnalysis as mathematical suppliers. The roadmap keeps the general first-order manifold theory distinct from their owned objects. Object searches were run over both pinned libraries, main roadmaps, board packages and the provided open-head index; the board package index was read before any absence assessment. The other indexed board packages concern unrelated subjects.

The following pinned declarations were opened, rather than inferred from their names. Paths are relative to their respective library repositories.

| Object | Pinned files and declarations inspected | Consequence for this package |
| --- | --- | --- |
| Local Lp inputs | `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:92` eLpNorm and :154 MemLp; `LpSeminorm/Basic.lean:584` MemLp.of_le, :620 memLp_top_of_bound; `Function/LocallyIntegrable.lean:188` locallyIntegrableOn_iff | MemLp encodes a.e. strong measurability; p=0 is not permission for nonmeasurable maps. No native all-p compact-local carrier found. |
| Haar normalization | `Mathlib/MeasureTheory/Measure/Haar/Unique.lean:919` additive uniqueness generated by to_additive; `Haar/OfBasis.lean:254`, :268, :278 | Scalar rescaling and basis-normalized measure are existing inputs. The generated additive declaration is not missing. |
| Weak derivatives | `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:250`, :257, :292, :370, :448, :453, :553, :569, :657, :747, :856, :893 | Includes completeness and local L¹, not continuity or Lp; uniqueness and linear API are already supplied. This is why log radius distinguishes the two total notions in R01. |
| Weak locality/limits | `TauCeti/Analysis/Sobolev/WeakDeriv/Local.lean:71`; `Limit.lean:89`; `MeasurePreserving.lean:130`; `Interval.lean:302` | These support compact-local reduction, limits, linear change of models, and the Cantor negative control. |
| Mollification and scalar Sobolev rules | `TauCeti/Analysis/Sobolev/Mollification/Interior.lean:87`, :110; `TauCeti/MeasureTheory/Function/Lp/ApproximateIdentity.lean:165`; `W1p/Basic.lean:573`; `W1p/ChangeOfVariables.lean:274`, :302, :316; `W1p/ChainRule.lean:375` | Finite-exponent and scalar hypotheses were retained; these are not the vector-valued local headlines. R03 repairs the product-convergence argument. |
| Null images and change of variables | `Mathlib/MeasureTheory/Function/Jacobian.lean:556`, :1184; `TauCeti/Analysis/Calculus/Sard/LowDimension.lean:73`; `Mathlib/Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31` | Equal-dimensional null image and higher-dimensional null image are library facts; local inverse transport is new here. |
| Charts and differentiation | `Mathlib/Geometry/Manifold/IsManifold/ExtChartAt.lean:379`, :437, :548, :784; `MFDeriv/Defs.lean:336`; `MFDeriv/NormedSpace.lean:786`; `PartitionOfUnity.lean:788` | Boundaryless hypothesis is essential for open chart targets. Native mfderiv is a total derivative; it is not a weak derivative. |
| Manifold null sets and volume | `TauCeti/Geometry/Manifold/Measure.lean:36`, :77, :93; `ExtChartAt.lean:374`; `Riemannian/VolumeDensity/Basic.lean:48`, :61; `Measure.lean:113`; `ChangeOfCoordinates.lean:52`; `Volume.lean:82`, :87, :112, :179; `Support.lean:36` | Chartwise nullity does not install a measurable structure, a separation axiom or global countability. Volume separately requires Borel, Lindelöf and continuous-metric instances, present in the signatures. |
| Orientations and determinants | `Mathlib/Analysis/InnerProductSpace/Orientation.lean:148`, :170, :198, :223, :245, :286, :290; `Mathlib/LinearAlgebra/Orientation.lean:186`; `Determinant.lean:647`; `InnerProductSpace/NormDet.lean:69`, :228, :374, :389 | Dimension-zero signs and unsigned normDet=1 were checked. The roadmap is not redefining normDet. |
| Manifold orientation and metrics | `TauCeti/Geometry/Manifold/Orientation/Basic.lean:32`, :140, :157, :235; `Preserving.lean:63`; `OpenSubset.lean:49`; `Riemannian/VolumeForm.lean:55`; `Restriction.lean:209`; `WithMetric.lean:68`; `Mathlib/Topology/VectorBundle/Riemannian.lean:420`; `Geometry/Manifold/Riemannian/Basic.lean:102` | Orientation preservation includes an invertible differential; continuous metrics supply actual tangent norms. Metric copies preserve charts. |
| Immersions and extensions | `Mathlib/Geometry/Manifold/Immersion.lean:191`; `SmoothEmbedding.lean:70`; `WhitneyEmbedding.lean:132`; `TauCeti/Geometry/Manifold/Immersion/Differential.lean:257`; `SmoothEmbedding/Extension.lean:64`, :165, :201; `TubularNeighborhood/LocalInverse.lean:46` | Existing retraction requires a topological embedding; its proof restricts to a source patch for §8.1. Normal retraction has higher regularity and is not silently used for C¹. R04 records the actual ambient-extension hypotheses. |
| Isometric postcomposition | `Mathlib/Analysis/InnerProductSpace/LinearMap.lean:126`; `Analysis/Normed/Operator/NormedSpace.lean:53` | Exact duplicate of the mathematical content of the separate norm declaration, R05. |
| Density measures | `Mathlib/MeasureTheory/Measure/WithDensity.lean:160`, :594; `Measure/Restrict.lean` comap_apply; `Constructions/BorelSpace/Basic.lean` IsOpenEmbedding.measurableEmbedding | Absolute continuity and chart measurable embeddings are existing inputs. Positive weight is needed for reverse absolute continuity. |

Near-match results about ordinary differentiability, distributions, global W1p operators and Euclidean Jacobian change of variables do not already prove the manifold Sobolev headlines. Searches by object found no other native `MemManifoldW1pLoc`, `HasWeakMDeriv` or continuous-metric chart-null/volume-null equivalence. The existing upper-half-plane Riemannian-volume identification is specialized to its Poincaré metric, not the flat-volume theorem.

Cross-roadmap citations were resolved as follows; open-head output includes an extra leading provenance line, so the file line numbers below refer to the actual README rather than that wrapper.

| Cited owner | Section and witness | Ownership result |
| --- | --- | --- |
| PDE on main | `TauCetiRoadmap/PDE/README.md:675`, Layer 1 and §1.1 | Scalar global Sobolev/weak-derivative floor; consumed through its implemented Tau Ceti APIs. |
| GeometricCurrents on main | `TauCetiRoadmap/GeometricCurrents/README.md:750`, G6 | All-order scalar local classes and finite-cover gluing; §1.4 here is the first-order comparison, not another higher-order tower. |
| PseudoholomorphicCurveAnalysis on main | `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md:215`, PH1.1; :280, PH1.2; PH4.1 | Planar and half-disc higher-order classes and kp>2 nonlinear theory. The present arbitrary-dimensional first-order classes retain a stated agreement on the planar overlap. |
| SobolevPolynomialApproximation on main | `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:324`, §2.1 | Global bounded scalar composition operator, including higher orders; not this package's unbounded local/vector rule. |
| SobolevDifferentialForms, open #1609 | `TauCetiRoadmap/SobolevDifferentialForms/README.md:387`, §4.1 | Global form pullback with derivative bounds; degree zero comparison is correctly distinguished. |
| TeichmullerGeometry, open #1169 | `TauCetiRoadmap/TeichmullerGeometry/README.md:741`, §7.4 | Weak Wirtinger derivatives, quasiconformal maps and Beltrami equation; not generic manifold Sobolev classes. |
| PseudodifferentialOperators on main | `TauCetiRoadmap/PseudodifferentialOperators/README.md:967`, §5.2 | Global integer-order bundle Sobolev spaces on compact smooth bases. |
| RiemannianGeometry on main | `TauCetiRoadmap/RiemannianGeometry/README.md:129` conventions; :2230–2258, R4.6 | Owns smooth-metric null-volume transfer. The continuous-metric/C¹/boundary extension here is explicitly distinguished; no open revision is needed for the cited ID. |
| DifferentialGeometry on main and open #1187 | `TauCetiRoadmap/DifferentialGeometry/README.md:1009`, :1041, :2801, :2896 on main; head §12.4 at line 923 | Orientation/metric/volume suppliers exist. Head still keeps §12.4; neither version owns the general weak-map classes here. Main is the supplier. |
| GeometricMeasureTheory on main | `TauCetiRoadmap/GeometricMeasureTheory/README.md:148`, G2 | Area/coarea ownership is respected; §6.4 here is a manifold open-embedding density comparison. |
| QuasiregularMaps, open #2134 | `TauCetiRoadmap/QuasiregularMaps/README.md:65`–75 and :347–382 | Explicitly assigns these classes, differential, norm and Jacobian to this roadmap. Its own §2.8 owns locally Lipschitz membership, and Layer 5 owns ACL equivalence. No mutual object ownership. |
| ComplexKahlerGeometry, main and open #1807/#1808 | Scope and K5a compact-bundle Sobolev scale in all three | Compact-base distributional/bundle elliptic theory, not the continuous first-order nonlinear manifold class. No ownership collision found. |

The overlap ledger reports no competing head changing this roadmap, no dropped cited ID and no ID supplied only by an open revision. Inspection of the closest heads did not contradict those results. The citation resolver found no unresolved roadmap citation or own Lean name. Its output explicitly did not inspect pinned Lake packages; the direct pinned-file checks above supplied that missing part.

### Supplier direction

The exact required dependency command completed with:

```text
depcheck: 236 roadmaps, 2132 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line for this package. Its source citations and `Needs` lines do not consume QuasiregularMaps. The internal section graph is acyclic; §3.1 is independent of the chain rules, §3.3 needs §2.1, §4 constructs the differential, and §§5–8 consume it in that direction. The supplier extension description needs R04, but its actual use in vector space has the necessary hypotheses.

**Consumer placement for intake:** `merge-order/ORDER.txt:288` currently puts QuasiregularMaps before this package at line 402, although QuasiregularMaps #2134, `TauCetiRoadmap/QuasiregularMaps/README.md:356`–381, consumes it through six declared gaps. The prior design repair report already records that this supplier must be inserted before that consumer (`packages/SobolevMapsBetweenManifolds/reports/FIX-DESIGN-SobolevMapsBetweenManifolds~5.md:138`). Preserve that announced placement when the worker submits; the package-local dependency result does not validate the consumer's placement. This is an intake ordering action, not a request to edit the merge-order file in this review, nor an undeclared-gap finding against the package.

## Not verifiable

- **Ziemer1989**, Ch. 2 §2.1, Thms. 2.1.11 and 2.2.2: settled as uncertified/paywalled. Exact source wording, hypotheses, pages and theorem numbering could not be checked. Independently checked the native weak-derivative proof inputs and the mathematical instances instead.
- **Mazya2011**, §1.1: settled as uncertified/paywalled. Could not inspect its local-space, locality and composition passages.
- **Lee2012**, Chs. 4, 6, 15 and 16: settled as uncertified/paywalled. Could not certify the book's precise retraction, null-set, orientation or integration locators. The pinned immersion, chart and volume constructions were inspected.
- **Rickman1993**, Ch. I §1: settled as uncertified/paywalled. Could not certify its exact local Sobolev/Jacobian statements or pages.
- **Bethuel1991**, Introduction: settled as uncertified after the service received bot protection. This is background for the extrinsic class and Part II approximation scope; it was not requested again.
- MartioRickmanVaisala1969 has noisy scanned extraction. The Jacobian paragraph and §2.16 are readable, and §2.16 lies on printed p. 12. The extraction does not reliably expose the printed page number of the Jacobian paragraph; “page 6” in the manifest can be confirmed as the extraction page only.

No new missing-source request was created. The three accessible works support the specific usages described in the source table, not every general extension attributed beside them. No claim is made to have certified the five unavailable texts.

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, printed p. 24, line 1328: the source says the map into N is composed after its Euclidean embedding; it should be the embedding composed after the map; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5903ea72f5e6b63cdc335b87da5d98daddb903f8", "job": "REV-PKG-SobolevMapsBetweenManifolds", "model": "gpt-6-astra", "worker": "chris-4"} -->
