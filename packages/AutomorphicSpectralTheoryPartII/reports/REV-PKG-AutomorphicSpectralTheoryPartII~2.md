<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1008#issuecomment-6393107648 -->
Review (codex) of d3e3760

Verdict: needs_changes

1. **F01** (P1) The kernel estimate conjugates the derivative

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:1169, §3.10: `overline(R_y(Y)E(y,v,λ))`, with right side `p(L(X)R(Y)f)n_G(x)^Nn_G(y)^N`.

   **Claim:** The estimate holds for every element Y of the complex enveloping algebra.

   **Witness:** On the mass-one circle, let D=(2π)⁻¹d/dx, Y=iD−1, f=e₋₁ and X=1. Then Y e₁=−2e₁ but Yf=0: the asserted estimate is 2≤p(0)=0.

   This is a genuine reductive spectral test: use a norm-one torus over a number field with a nontrivial automorphic character at a fixed finite level, normalize D so its derivative on that character is i, and choose the corresponding Fourier projector. The inducing parameter space has dimension zero, the parabolic coefficient is 1, and all other Fourier summands vanish. Finite components do not alter the calculation. Equivalently this is the package's own compact-circle kernel test, now with a complex enveloping element. A seminorm always vanishes at zero, irrespective of the claimed height exponent.

   **Exact repair:** Replace that factor by `R_y(Y)(overline(E(y,v,λ)))`; retain `R(Y)f` on the right. This is the formula in BPCZ Lemma 2.10.2.1, printed p.240, bpcz line 2496. The printed PDF was inspected to resolve the scope of the overline; the source has the derivative outside it. Add the complex derivative test above to §3.10. With this repair, Y acts on e₋₁, giving 0 on both sides. For the separate real generator D the two differentiated kernel coefficients are both −i. A test using only real Y and absolute values misses this defect.

2. **F02** (P2) The new open-mapping gap duplicates an existing owner

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:59: “What AutomorphicSpectralTheory must provide (gap:frechet-open-mapping): Supply the open mapping theorem for a continuous linear surjection between complex Fréchet spaces”. The matching gap is in design/plan.json and is consumed at README:723 and README:991.

   **Claim:** This generic theorem is missing supply to be developed in AutomorphicSpectralTheory §0.11.

   **Witness:** TauCetiRoadmap/SpectralManifolds/README.md:79, SM3, at head c87f958 explicitly owns the Fréchet open mapping theorem for continuous surjective linear maps between complete metrizable locally convex real or complex spaces, including closed-subspace quotients.

   The indexed branch adds a new roadmap; this is not an impermissible dependency on a revision of a roadmap on main. Mathlib's Banach open mapping theorem alone would not cover the requested Fréchet generality, but SM3 does. Thus the issue is duplicate ownership, not absence of a pinned theorem.

   **Exact repair:** Remove this duplicate gap from the plan's top-level gaps and README, cite SpectralManifolds SM3 as the owner of the generic open-mapping and quotient facts, and replace the two gap uses by that exact supplier citation. Keep only the SLF-specific quotient/application here. Preserve a single earlier-to-later supply direction when recording that dependency. A scratch README with this replacement passes the prescribed movable dependency check with zero problems. On z↦2z the imported theorem sends the unit disc onto the radius-2 disc; on the zero map ℂ→ℂ it identifies ℂ/ℂ with its zero image, not ℂ with that image. These are precisely the two cases the package needs.

3. **F03** (P2) The integrated Schwartz action is planned twice

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:489–491, §1.2: “the integral π(f)v=∫_G f(g)π(g)v dg converges in V … and defines a continuous bilinear action”.

   **Claim:** Construct that action anew by seminorm bounds, vector integration and Fubini for smooth moderate-growth Fréchet representations.

   **Witness:** TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:459 defines exactly this SF category; README:467 already supplies its continuous nondegenerate integrated Schwartz action. The checked new-roadmap head is c00e220.

   **Exact repair:** Import the action, its continuity and its convolution law from AutomorphicFormsOnReductiveGroups §2.7, with the Schwartz-algebra comparison of §1.1. Retain here the comparison with this roadmap's derivative signs and its Fourier-faithfulness assertion using real-plancherel-characters. Rewrite the integration/Fubini paragraph as that comparison, not a second construction of the supplier's theorem. For π_t(x)=exp(itx), both imported and compared actions are ∫f(x)exp(itx)dx; L(X) gives i times that integral at t=1 and 2i times it at t=2. On a point both actions are ordinary scalar multiplication. The repair preserves the new multiplier argument and all its generality.

4. **F04** (P3) The isobaric construction locator still names the wrong location

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:11 and README.md:193: “AL.3, **Isobaric construction** and **Strong multiplicity one for isobaric sums**”.

   **Claim:** Both named inputs are targets in AL.3.

   **Witness:** At head 5d22a23, TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:271 calls the prerequisite **GLₙ isobaric sums**, before AL.0. The strong multiplicity-one target is in AL.3 at README.md:2288 and links back to that prerequisite.

   **Exact repair:** Cite “AutomorphicLFunctionsAndLocalFactors, preparatory **GLₙ isobaric sums** (`isobaric-construction`), and AL.3 **Strong multiplicity one for isobaric sums**.” The §5.6 Needs citation to the latter is already correct. Test the corrected pair of locators on two unramified characters of values 2 and 3: the prerequisite gives 1−5T+6T², and AL.3 recovers the multiset {2,3}, including multiplicity. This is locator repair, not missing mathematical supply.

Four findings: one P1, two P2 and one P3. The package is repairable within its intended Part II scope. The main obstruction is a false complex derivative estimate, independent of the declared supplier gaps. The reviewed README, Lean file, metadata, source manifest and design were not changed.

## Verified sound

This review read all 63 numbered target sections and their 63 Needs lines, all six layer Examples and Dependencies, the conventions, contracts, references, metadata, all 10 Lean declarations, and the prior review and repair report. All 15 seeded source targets were reopened. The computed tables below cover the definitions, API assertions, headline statements, signs, degeneracies and changed passages; no section is accepted merely on the strength of a previous “sound” summary. Tests are adversarial instances, not proofs of the general analytic theorems. Source and supplier checks provide the complementary evidence.

The Part II boundary is appropriate: the base roadmap's compact spectral theory and Franke spaces are imported, and the retained extensions concern moderate symbols and weighted quotient Schwartz analysis. There is no good-primes restriction: S contains the bad places, local inputs retain them, and only the auxiliary separating spherical operators are taken outside S. There is no computational algorithm, sorry-defined data, set_option, false headline placeholder, or dependency on another roadmap's Lean module. No copied source passage was found. README shape follows the main-branch ComplexTori and LocalGaloisGroups examples; every definition has its prose API and at least three Checks. The theorem-only subsections need not each have three Checks. The only observed ownership exceptions are R02–R03; the only observed false mathematical assertion is R01.

### Previous findings, checked before the new pass

| Earlier finding | Repaired passage, at current README line | Computed or resolved verification | Status |
| --- | --- | --- | --- |
| F01, factorization parameter | 1025: `I_P(−conj λ,g₁*)` and `I_P(−conj λ,g₂*)` | With A=2 and T=i, B(AT,1)=2i=B(A,T*); substituting T instead gives −2i. The real parameter λ=1 tests the missing minus. Printed BPCZ p.229 was inspected. | Repaired |
| F02, overbroad Nash/integration gap | 47: “Nash Schwartz product and embedding comparison”; 493 and 879: “§0.12 (quasi-complete-target integration)” | The gap no longer promises duality or vector integration. AS §0.12 supplies the integral; §2.12 owns the quotient measure duality; §§2.12–2.13 separate measures from norm-smooth vectors. Distinct Dirac measures remain distance 2. | Repaired |
| F03, compound supplier gaps | 55: “countable K_f-isotypical direct-sum description”; 59: “open mapping theorem”; 63: “joint continuity” | All 27 unique slugs, suppliers, sections and needs agree between README and plan. Splitting is correct, but the new generic open-mapping request duplicates SM3 (R02). | Partly repaired |
| F04, difference-operator bound | 451: “C_{S,M,r}>0” | The constant is quantified after S,M,r, as in bplzz line 659. For Δf=(f(z)−f(−z))/z and f=z²+z the value is 2, including at zero. | Repaired |
| F05, supplier locators | 959: “construct the intermediate pseudo-Eisenstein map”; 1037: “§1.10”; 515: “only as cited in BPLZZ” | Intermediate EP is local, base support is §1.10, and Kostant is attributed through BPLZZ. The isobaric construction remains mislocated: R04. | Partly repaired |
| F06, discriminating Checks | 971: “Scaling only the measure on the CT side by 2 gives 2 versus 1”; 1021: “a unit vector gives a and replacing it by twice that vector gives 4a” | Identity adjunction gives 1=1, incompatible rescaling 2≠1, compatible rescaling 2=2. The one-dimensional trace gives 2, rescaled nonorthonormal basis 8, phase-changed orthonormal basis 2. Each definition has three Checks. | Repaired |
| F07, generality of Lapid inversion | 1117: “Let G be a connected reductive group over F satisfying Lapid’s hereditary property (HP)” | General G retains HP and regular support; restrictions of scalars of GLₙ are an unconditional supplied case. Lapid lines 801, 924, 933, 1069 and bpcz line 2394 support that boundary. | Repaired |
| F08, direction of discrete separation | 1515: “No T-character keeps the residual representation while killing the Borel component” | q(it)=−t²−1/4≠0 and q(1/2)=0. A function vanishing on the whole complex inducing family also vanishes at 1/2. | Repaired |
| F09, external transfer ownership | 17: “belongs with the relative comparison” | The repair report marked external transfer ownership/order not actionable here. Its reason is valid: the GGP transfer-preservation contract and order lie outside the package. The unsupported direct consumer promise was deleted; no transfer theorem is silently inferred from scalar isolation. | Settled; not re-raised |
| F10, Franke-space overlap | 7: “individual smooth weighted-L² stages agree with Franke’s S_p when w=p²” | For p=2 and a unit-mass constant vector the Franke norm and L²_{p²} norm are 2; using w=p gives √2. Intersections/unions in §2.14 are not identified with one stage. | Repaired |

The repaired patterns were searched throughout the package: parameter conjugation also led to the different error R01; fixed-stage/inductive-limit distinctions persist in §§1.9, 2.5, 2.12–2.15; all newly separated gaps were checked for ownership; the unitary-versus-complex occurrence distinction persists in §§5.1–5.7. F09 is the only finding explicitly settled as not actionable, and none of the new blocking findings re-raises it.

### Source sample and source scope

All source references below use the supplied line-numbered cache. BPLZZ numbering is the recorded arXiv v3, not an assumed journal version. BPCZ uses printed journal pages; Lapid uses the recorded ESI preprint pages. No additional work needed a manifest entry. Bernstein remains the settled uncertified source.

| Seeded target | Locator read | Hypotheses and outcome |
| --- | --- | --- |
| 0.1 | BPLZZ Definition 2.1 and Lemma 2.2, p.9; bplzz line 401 | Countability and nonzero inverse-power summability. The README explicitly extends to a nonminimal rank bound p≥0; genus zero is justified by the elementary product estimate, not falsely attributed verbatim to the printed p>0 formulation. |
| 0.3 | BPLZZ Proposition 2.4, Corollary 2.6, Remark 2.7, pp.9–10; bplzz lines 416, 428, 433, 444 | Finite-dimensional coordinates, finite-order entire ψ, arbitrary finite exceptional A; damping gives rapid decay. The explicit finite independent lattice generators repair the overly broad lattice convention. |
| 1.2 | BPLZZ §2.3, p.12; bplzz line 532; Proposition 2.24 proof, pp.17–19 | Smooth moderate-growth Fréchet globalization is retained. Detection uses the declared Plancherel input. Mathematical scope is supported; ownership is R03. |
| 1.8 | BPLZZ Lemma 2.18, p.13; bplzz lines 590–599 | Finite K-type set, not finitely many representations; split twists and limits are covered by the explicit supplier contract. |
| 2.5 | BPCZ §2.5.4, Lemma 2.5.4.1, pp.210–211; bpcz lines 1204, 1217, 1222, 1231 | Fixed finite-level Fréchet summands and induced closed-subspace topology. The roadmap correctly replaces the source's noninjective “embedding” claim by quotient-to-image. R02 concerns ownership only. |
| 2.11 | BPCZ §2.5.8, p.213, and §2.5.12, p.215; bpcz lines 1314, 1402 | Logarithmic decay after division by quotient Ξ, with all derivatives and fixed level; algebraic-height Schwartz space is a smaller space. |
| 2.13 | BPCZ §2.5.10–§2.5.11, pp.214–215; bpcz lines 1347–1369 | One growth exponent before every derivative, and the indicated unions/topologies. The roadmap does not assume norm continuity of all measures. |
| 2.18 | BPCZ Proposition 2.5.15.1 and Corollary 2.5.15.2, pp.218–221; bpcz lines 1536, 1552, 1556, 1604, 1611 | The two directions of weight comparison, restricted central-weight comparability, proper constant terms plus identity, and the dual open sum are retained. |
| 3.4 | BPCZ Theorem 2.9.4.1, pp.232–235; bpcz lines 2157–2175 | Continuous projections on weighted stages, height loss and strong absolute summability on the stated Schwartz spaces; no unsupported absolute L² summability. |
| 3.5 | BPCZ §2.9.7, pp.235,237–238; bpcz lines 2292–2294 | Trivial relative Weyl stabilizer of the global datum, not merely pairwise distinct infinitesimal characters. |
| 3.8 | BPCZ §2.10.1, p.239; bpcz lines 2420–2429 | Right convolution and central integral with δ_P⁻¹ᐟ². The circle calculation pins the opposite Fourier index. |
| 4.8 | BPLZZ Lemma 3.14, pp.26–27; bplzz lines 1277–1309 | All complex twists of nontypical families are annihilated. The affine central lattice and sharp seed are explicit; no accidental assumption of a full lattice or a sharp unit. |
| 5.2 | BPLZZ Proposition 3.17, pp.28–29; bplzz lines 1361–1422 | The same complex parameter controls infinity and finite places. Finite Weyl candidate set, exponential Hecke families and a separate nonzero sharp seed are retained. |
| 5.5 | BPLZZ Theorem 1.1, p.2, and Theorem 3.6, p.23; bplzz lines 53–84, 1120 | Non-CAP admissible π need not already occur automorphically; scalar preservation is separate from the automorphic range assertion. |
| 5.7 | BPLZZ Remark 3.20, pp.30–31; bplzz lines 1459–1492 | Refined isolation retains the additional discrete polynomial-counting hypothesis. The PGL₂ example has the correct one-way separation. |

Additional reopened passages include BPLZZ Lemmas 2.20–2.23 and the proof of Theorem 2.13; BPCZ §§2.4.3–2.5.15, Proposition 2.8.4.3 and Lemma 2.10.2.1; and Lapid's HP, inversion and regular-support statements. The images of printed BPCZ pp.229 and 240 were checked as well as extraction text: the former really lacks a minus sign; the latter really places R_y(Y) outside conjugation.

### Pinned-library and cross-roadmap audit

Content main was b41e47bc34e30def0db01d84cc92062ed72c6e68. Both manifest pins and checked library checkouts agree: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches used objects, not just proposed declaration names: canonical products and normal convergence; smooth Fréchet actions; quotient weights and moderate growth; centroids and multipliers; completed tensors; Hilbert–Schmidt composition; cuspidal-support and discrete spectral isolation. Roadmaps on main, all indexed open-roadmap texts through the supplied search service, and local board package texts were searched. Five board heads were additionally readable; the other fifteen are recorded below.

| Pinned declaration opened | Native content and boundary |
| --- | --- |
| Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75, SchwartzMap | Fields toFun, smoothness and weighted iterated-derivative bounds on real normed spaces; no reductive-group carrier. |
| Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170, Differentiable | Differentiable at every point, over the explicit scalar field. |
| Mathlib/Analysis/Complex/Exponential.lean:62, Complex.exp | Actual complex exponential, not an opaque operation supplied here. |
| Mathlib/Algebra/MvPolynomial/Eval.lean:256, MvPolynomial.eval | Native evaluation ring homomorphism; includes zero polynomials and Fin 0. |
| Mathlib/Algebra/Polynomial/Eval/Defs.lean:249, Polynomial.eval | Actual polynomial evaluation, with the coefficient ring in scope. |
| Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:106 and :114, HasProd and Multipliable, additive Summable | Unordered finite-subset convergence and its existential limit. Countability and the origin exclusion are not included automatically. |
| Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89, MeasureTheory.Lp | Subgroup of almost-everywhere classes with finite eLpNorm; no canonical smooth pointwise evaluation. |
| Mathlib/Algebra/Ring/CentroidHom.lean:56, CentroidHom | Additive map with both multiplication laws; no continuity or complex linearity field. |
| Mathlib/Analysis/Normed/Operator/Banach.lean:228, ContinuousLinearMap.isOpenMap | Surjective map between the complete normed spaces of its context; does not itself supply arbitrary Fréchet open mapping. |
| Mathlib/Analysis/Complex/LocallyUniformLimit.lean:135, TendstoLocallyUniformlyOn.differentiableOn | Open-domain, complete-target holomorphy of a locally uniform limit. It does not provide the prescribed-zero product or its global order bound. |
| Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean:105 and :129, Summable.multipliableUniformlyOn_one_add and the locally uniform variant | Uniform-majorant product tools, with continuity and compactness/local hypotheses; not the fixed-rank growth/interpolation headlines. |

The corresponding Tau Ceti object searches did not find the missing reductive Schwartz, smooth automorphic quotient or cuspidal-support carriers. Finite-group GL₂ declarations mentioning cuspidality are not those carriers. No Tau Ceti module is actually used by the Lean file. The full namespace TauCetiRoadmap.AutomorphicSpectralTheoryPartII and its ten declarations do not duplicate a declaration in another readable roadmap.

The following table records the resolution of every supplier group, including scope-only deferrals. Line numbers for open roadmaps refer to their native README, excluding the search service's added header.

| Supplier and checked copy | Resolved objects/sections |
| --- | --- |
| AutomorphicSpectralTheory, new head c5cfb92 | §§0.11–0.15 at README:276–358: locally convex, integration, summation, tensor/kernel and holomorphic-family tools. §§1.5–1.10 include EP at :978 and support at :1049. §§2.1–2.5 begin :1534; §§3.1–3.4 begin :1933; §§4.1–4.14 begin :2310, with discrete/residual data. §§5.1–5.9 begin :2724 and own Franke stages. §§6.1–6.4 include compact multipliers and kernels; :2982 and :3011 are the compact factorization/kernel supply, not the missing rapid Schwartz extension. |
| AutomorphicFormsOnReductiveGroups, new head c00e220 | §§0.1–0.5 (group Schwartz at :130, growth at :153), §§2.1–2.4 and 2.7 (:288, :335, :362, :388, :459), §§3.4–3.5 (:551, :568), §§4.1–4.2 (:596, :614). The explicit Schwartz-action overlap is at :467, R03. |
| AdelicAlgebraicGroups, new head 70c4324 | §§2.1–2.3 (:1437, :1648, :1815), 3.1 (:2330), 3.4–3.6 (:3024, :3357, :3469), 4.6–4.7 (:4797, :4871). Root characters, quotient measures, heights, Siegel geometry and compact abelian Fourier theory exist; the narrower intermediate-quotient comparisons are declared gaps. |
| SmoothRepresentationsOfLocalGroups, new head 1383569 | SR.1.1–SR.1.3 (:981, :1151, :1230), SR.2.2 (:1962), SR.4.1–SR.4.2 (:3083, :3178). Raw Satake and the normalized square-root convention are distinguished. At q=4, normalization uses 2; at q=2,3 it uses √2,√3 in ℂ. No bad residue characteristic is removed. |
| ReductiveGroups and LieGroups, main | ReductiveGroups Layer 7 at README:627; LieGroups Layers 6–7 at README:383 and :407. Root data/real forms are present; real-point finite components and descent comparisons are the declared supplements, not silently assumed theorems. |
| NoncommutativeGeometry, main | N1 at README:84 and its completed projective tensor discussion at :86. The main copy is used, not its progress/revision branch. Product quotient Schwartz identification remains local. |
| OperatorTheory/OperatorIdeals and OperatorTheory/SelfAdjointSpectralTheory, main | OI-B32, OI-B41, OI-B84 and Part C; spectral Parts A–E. Hilbert–Schmidt and trace-class carriers/calculus are imported. They do not state the complete locally convex composition comparison requested by the gap. |
| PDE, main | Lane A at README:223, Sobolev embedding/local regularity. Quotient-weight and fixed-level evaluation comparison is explicitly assigned by its gap. |
| VonNeumannAlgebras, new heads fc982a6 and 4831498 | V4.Core exists in both indexed texts; the former's discussion begins at README:514, the latter's at :177. Hilbert–Schmidt pairings, trace class and predual comparison exist. BanachSpaceTheory B4 owns the Banach nuclear/trace identification; the two-Hilbert–Schmidt factorization with the locally convex convention is the declared supplement. No second carrier is proposed here. |
| GlobalHolomorphicFunctions, new head ffb25b5 | Preparatory primary factors and locally uniform products at README:224; variable genus at :302. The generic product and divisor are imported; the fixed-genus summability-to-global-growth estimate is the retained extension. |
| ZerosOfLFunctions, new head cce2e04 | Standing finite-order convention at README:279 and Layer 5.1–5.6. Order-one factorization is not used as a proof of arbitrary finite-rank growth. |
| ModularCurvesPartII, new head 35be0c8 | §1.4a, Lattice sigma function at README:496; rank-two period-pair sigma is a specialization, not a competing general growth/interpolation target. |
| AutomorphicLFunctionsAndLocalFactors, new head 5d22a23 | Preparatory GLₙ isobaric sums at README:271 and AL.3 strong multiplicity one at :2288. R04 repairs only the first label/location. |
| SpectralManifolds, new head c87f958 | SM3 at README:77–79 owns generic Fréchet open mapping, R02. |
| AnalyticNumberTheoryPartI, new head 4ba2e21 | §§0.15 and 0.23 use finite-order/factorization inputs for L-functions; they do not replace arbitrary prescribed-zero, fixed-genus global growth here. |
| GanGrossPrasadUnitaryGroups, new head db8ad41 | §§6.3–6.4 contain relative period and comparison applications. Transfer preservation is a separate requirement, not a consequence of §4.3's scalar action. F09 remains settled externally. |
| CongruenceSpectralGap, board design | CSG.0–CSG.5 identify the distinct Laplacian-gap/continuous-threshold owner. This is a scope deferral, not an unproved input used in a Needs line. |

All extant supplier edges were compared with the merge order; local Needs edges point to earlier targets. Declared gaps were treated as contracts, not as missing-theorem findings. The requested dependency check returned exactly:

```text
depcheck: 48 roadmaps, 535 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The resolver found no unresolved roadmap citation; its warning that it had not searched pinned declarations was handled by opening the pinned declarations above. This mechanical success does not detect the mathematical error R01 or the duplicated generic targets.

### Computed adversarial pass

In the tables, “retain” means the displayed test passes with the stated hypotheses; it does not assert an independently formalized proof. A numerical comparison-class representative is used when the actual theorem promises only ≍. Circle Haar measure has mass 1, eₙ(x)=exp(2πinx), and D=(2π)⁻¹d/dx. Polynomial weights and zero-dimensional parameter spaces are tested explicitly. The base field in the automorphic layers is a number field and coefficients are ℂ: the zero ring, positive-characteristic base fields, inseparable field extensions and nonreduced bases are outside these signatures, rather than omitted cases of their theorems. Finite places of residue characteristic 2 or 3 are inside them. No natural subtraction, polynomial degree of zero, or division by a zero lattice point occurs in a kept Lean definition.

| Statement/convention | Instances tried | Values computed on the two sides, or satisfying/failing values | Result; change |
| --- | --- | --- | --- |
| Global coefficients and dimension | Fin 0; empty zero set; zero module | Fin 0→ℂ has one point; empty product=1; action on zero module=0 | Retain; dimension and nonzero-space assumptions are not smuggled in |
| Linear-first pairing | Scalars 1,i | ∫1·conj(i)=−i; native conjugate-first ⟨1,i⟩=i; exchanged native slots give −i | Retain |
| Left derivative | Additive π_t, t=1,2 | ∫−f′(x)e^{itx}dx=it∫f(x)e^{itx}dx; factors i,2i | Retain; opposite sign gives −i,−2i |
| Translation versus tensor weight | Coordinate z; λ=1 | t₁z=z−1; tensor character α↦α+1 | Retain; these are different operations |
| Adjoint and convolution | Circle n=0,1 | R(e₋₁)e₁=e₁; R(e₁)e₁=0; f*=e₋₁ when f=e₋₁ | Retain; sign fixed |
| Induction and disintegration | GL₂ Borel, abs(a)=4 | δ=4; δ¹ᐟ²=2; δ⁻¹ᐟ²=1/2; product=1 | Retain across §§1,3,5 and supplier normalization |
| 0.1 rank-bound definition | Empty set; {0}; ℤ | First two sums=0 at p=0; ℤ nonzero inverse-square sum=π²/3 at p=1, inverse-first-power sum diverges | Retain; zero point excluded |
| 0.1 discreteness/countability API | Λ={1/(m+1):m≥0}; a finite nonzero set | Reciprocal (p+1)-power terms=(m+1)^{p+1}, not tending to 0; finite sums are finite | Retain; an accumulating set is rejected |
| 0.1 monotonicity and finite removal | Λ={2,4}, p=0,1 | Sums 3/4 and 5/16; removing 2 gives 1/4 and 1/16 | Retain; rank bound need not be least |
| 0.2 elementaryFactor | p=0,1,2; w=0,1,2 | At 0 all=1, at 1 all=0; at 2 values −1,−e²,−e⁴. Derivatives at 1: −1,−e,−e^{3/2} | Retain; simple zeros and genus-zero empty sum |
| 0.2 origin factor and product | Λ=∅,{0},{0,a}, a≠0; p=0 | Products 1,z,z(1−z/a); last derivative at 0=1 and at a=−1 | Retain; omitting origin gives 1 instead of 0 at z=0 |
| 0.2 finite partial products | Λ={0,1,2}, p=0, z=3 | Finite subsets ∅,{1},{1,2} give 3,−6,3; eventual product=3 | Retain; finite-subset filter and origin agree |
| 0.2 global growth and finite order | Product 1−z; ψ=e^{z²}; ψ=e^{e^z} | abs(1−z)≤1+abs(z)≤e^{1+abs(z)}; abs(e^{z²})≤e^{(1+abs(z))²}; log abs(e^{e^x})=e^x outruns every C(1+x)^d | Retain; finite order excludes the last example |
| 0.2 locally uniform entire simple-zero headline | Finite Λ={0,1}, p=0 | Partial products stabilize to z−z²; zeros exactly 0,1; derivatives 1,−1; on abs(z)≤R norm≤R+R² | Retain; matches all conjuncts in Lean |
| 0.3 rapid vertical predicate | e^{z²}, e^{−z²}; n=0 | On z=iy: e^{−y²} versus e^{y²}; polynomial times first is bounded, second is not. In dimension 0 every constant has bound its absolute value | Retain; all powers, not one chosen power |
| 0.3 polynomial zero-fiber interpolation | q=z², ψ(w)=sin(πw); ψ=0; q constant | ν=e^{z⁶}sin(πz²) has zero set z²∈ℤ; on iy damping=e^{−y⁶}. For ψ=0 use ν=0. Constant nonzero ψ(q) uses nonvanishing damping | Retain; zero polynomial needs no degree convention |
| 0.3 affine lattice definition | k=0; b₁=1; b₁=b₂=1 | L={a}; L=a+ℤ; dependent family sends (1,0),(0,1) to same point | Retain; theorem rejects the last family by LinearIndependent |
| 0.3 affine lattice interpolation headline | L=ℤ,A={0}; rank 0; n=k=0 | e^{z²}sin(πz)/(πz), continued at zero, has value 1 at 0 and 0 at nonzero integers. For one-point space A=∅ use 0, A={point} use 1 | Retain; both conclusions, including empty exception set |
| 0.3 exceptions outside lattice | L=ℤ,A={1/2} | e^{z²}sin(πz) vanishes at every integer and has value e^{1/4} at 1/2 | Retain; A need not be contained in L |
| 0.4 real-form eigenspaces | Split Gₘ and compact U(1) | θ=1 gives plus-space ℝ and Y={0}; θ=−1 gives plus-space 0 and Y=ℤ | Retain; non-split and rank-one cases differ |
| 0.4 finite involution coset | Rootless rank 2, matrices A_m=[[1,m],[0,−1]] | A_m²=I for every integer m, giving infinitely many involutions; fixed Weyl coset for a torus has one member | Retain; avoids the source's false global finiteness |
| 0.5 moderate-symbol algebra | Split θ=1: e^z, z, e^{−z²}; compact lattice: z | On abs(Re z)≤M, abs(e^z)≤e^M; abs(z)/(1+abs(z))≤1. On iy, e^{−z²}=e^{y²} fails every polynomial bound. At compact integer n, z=n has degree-one growth | Retain; correct order of strip/exponent quantifiers |
| 0.5 products and translations | z²,z³; t₁z | Product z⁵ has degree 5=2+3; abs(z−1)≤1+abs(z) | Retain |
| 0.6 rapid-symbol ideal and derivatives | e^{z²}, z e^{z²}, 1 on split strips | On iy, norms e^{−y²}, abs(y)e^{−y²}; derivative norm 2 abs(y)e^{−y²}. For 1, power-one weight 1+abs(y) is unbounded | Retain; zero-dimensional constant case is allowed |
| 0.7 sharp support | Compact U(1): 1 and e^{z²} times continued sinc | 1 is nonzero on infinitely many integers; the damped sinc is 1 at 0 and 0 at every other integer | Retain; sharp algebra need not contain the unit |
| 0.7 stripwise rather than global finiteness | Split θ=1 | Only discrete parameter 0 occurs for every strip, although the continuous parameter iy ranges over infinitely many values | Retain; no finite-representation claim |
| 0.8 sharp orbit separation | Rank-one W={±1}, target orbit {±1/2} | e^{z²}sin(πz)/z has equal nonzero values 2e^{1/4} at ±1/2, and zeros at nonzero integers | Retain; Weyl invariance and both orbit points |
| 0.9 divided differences | s(z)=−z; f=z,1,z²+z | (f(z)−f(−z))/z gives 2,0,2; extensions at zero are 2,0,2 | Retain; denominator singularity is removable on the asserted domain |
| 0.9 rational versus polynomial-preserving operators | Multiplication by 1/z; translations t₁,t₂ | (1/z)·1=1/z is not polynomial; t₁t₂z=z−3=t₃z | Retain; wrong rational operator excluded |
| 0.10 holomorphic extension and estimates | f=z²+z; Δ at zero and off zero | Quotient=2 off zero; limit=2=2f′(0). For any strip the constant bound is 2 | Retain; C may depend on S,M,r |
| 1.1 Schwartz comparison | Compact group; positive split coordinate t | Compact smooth function 1 has finite smooth seminorms. The logarithmic tail (1+abs(log t))^{−N} has t times its value unbounded as t→∞ | Retain; Nash decay is stronger than logarithmic decay |
| 1.1 product and embedding comparison | Gaussian in two real coordinates | e^{−x²}e^{−y²}=e^{−(x²+y²)}; at (0,0) both 1, at (1,1) both e^{−2} | Retain, conditional on declared Nash comparison |
| 1.2 integrated action | Trivial group; additive π₁,π₂ | Integral/action=fv at a point; derivative scalars i and 2i on the line | R03: import existing action; keep comparison |
| 1.2 convolution order | Nonabelian S₃, a=(12),b=(23); cyclic C₂ | δ_a*δ_b=δ_ab and ρ(δ_a)ρ(δ_b)=ρ(ab), whereas ba≠ab; in C₂ δ_s²=δ_1 | Retain; left/right multiplication order is fixed |
| 1.3 rapid multiplier and finite central quotient | Trivial group with µ=0,1; split Gaussian; two-element kernel | Scalar equations 0=0 and π(Tf)=π(f); averaging over {1,−1} fixes even vectors and kills odd ones: (1+1)/2=1, (1−1)/2=0 | Retain; finite kernel cannot be dropped |
| 1.4 tensor-character comparison | Torus character α=1, tensor weight λ=2 | δ(z) acts by 3, while z alone acts by 1; annihilating polynomial X−(α+2) gives 0 at 3 | Retain; translates use the corrected sign |
| 1.5 generic semisimplicity | Two weights ±1 at parameter 2; reducibility point | Shifted characters 3 and 1 are distinct. At SL₂ reducibility, the standard module has discrete-series submodule and trivial quotient, not their direct sum | Retain; exceptional hyperplanes are excluded, not assumed semisimple |
| 1.6 rapid-symbol L² estimate | Compact SU₂ weights n=0,1,2; zero f | Realized infinitesimal parameters are 1,2,3; parameter 0 is absent. For f=0, both sides 0 | Retain; bound only needs realized spectral support |
| 1.7 multiplier action and centroid | µ=0,1; convolution δ_a,δ_b | T₀f=0; T₁f=f; T₁(δ_a*δ_b)=δ_ab=(T₁δ_a)*δ_b=δ_a*(T₁δ_b) | Retain; both centroid equations |
| 1.7 kernel of symbol action | SU₂, Weyl-even entire symbol e^{z²}(sin(πz)/(πz))² | Value at 0 is 1, values at realized ±1,±2,… are 0; operator action=0 | Retain; symbols are not falsely declared faithful on unrealized parameters |
| 1.8 finite K-type detection | SL₂ spherical continuous family; limits of discrete series | All spherical twists contain type 0, so one type detects infinitely many parameters; the two limit rays require weights +1 and −1 | Retain; finite-type versus finite-spectrum distinction |
| 1.9 finite support/level stages | Two finite cosets; product real places | Stage is S⊕S; (f,0) and (0,f) are distinct. Product pure tensor at (0,0) has value f(0)g(0) | Retain; topology is attached to a fixed support/level stage |
| 1.9 Hecke and archimedean compatibility | Archimedean scalar 2 and finite scalar 3 | Either order gives 6; one zero scalar gives 0 | Retain; commuting factors and completed comparison |
| 2.1 weight definition/comparison | Constant 1; positive multiplicative t with w(t)=e^t | Constant translate ratio=1; w(2t)/w(t)=e^t is unbounded, so the latter fails compact-translate comparability | Retain; not every positive function is a weight |
| 2.1 polynomial upper/lower comparison | n(t)=max(t,t⁻¹), t=2,1/2 | Both heights=2; n⁻¹=1/2≤1≤2=n | Retain; inversion and lower bounds |
| 2.2 Franke-weight API | Character coordinate t=2; exponents 0,1,2,−1 | d₀=1, d₁=2, d₂=4, d₋₁=1/2; d₁d₂=8=d₃ | Retain up to ≍; chosen representatives are not canonical equalities |
| 2.2 chamber and nested-parabolic comparison | Rank-one positive chamber t≥1; Q=P | 1≤t≤t²; at identity pullback d=d | Retain with dominance; inverse chamber reverses inequalities |
| 2.3 depth and restriction | GL₂ root at t=2; degree-two restriction of scalars | Diagonal root depth=2; norm character=4; normalized relative-root coordinate=√4=2 | Retain; no arbitrary subgroup assertion |
| 2.3 identity parabolic case | P=Q | Root index set empty; no minimum defined. CT_P^Pφ=φ | Retain; avoids total-function empty-minimum junk |
| 2.4 volume Ξ and scaling | Cusp y=4 with neighborhood volume 1/y; multiply measure by 4 | Ξ=2; rescaled volume=1 and Ξ=1=2/√4 | Retain; reciprocal square root, not square root |
| 2.4 logarithmic integrability | Model cusp dxdy/y², Ξ²=y, σ=1+log y | Integral from 1 to ∞ of (1+log y)⁻²dy/y=1; exponent 0 gives ∞ | Retain; existential sufficiently large exponent |
| 2.5 SLF and closed image | ℂ→ℂ zero map; z↦2z | Zero image closed, kernel ℂ, quotient-to-image 0→0 is an isomorphism; ℂ→0 is not injective. Scaling map sends disc radius 1 to radius 2 | Retain mathematical statement; R02 ownership |
| 2.5 compact isotypes and topology | Finite quotients C₂ and S₃ | C₂ irreducible dimensions 1,1; S₃ dimensions 1,1,2 and squares sum 6 | Retain; not restricted to abelian finite-level types |
| 2.6 weighted L² and Franke comparison | φ=1 on unit mass; p=1,2 | At p=1 both norms 1; p=2 gives ‖pφ‖₂=2=‖φ‖_{L²_{p²}}, while L²_p norm=√2 | Retain stage comparison only |
| 2.6 smooth representatives | On ℝ, φ=(1+abs(x))⁻¹; weights 1,(1+abs(x))² | Squared L² norm=2 at weight 1; weighted integral is ∫1=∞ at the second weight | Retain; increased weights strengthen the domain |
| 2.7 Sobolev evaluation factor | Unit-volume point/chart model, φ=1, w=4 | Smooth weighted norm=2; evaluation estimate gives 1≤2·1·(1/2)=1 | Retain; w¹ᐟ² would give the wrong scaling |
| 2.7 smoothing/duality normalization | Circle functional evaluation at 0, f=e₋₁, ψ=e₁ | T(R(f)ψ)=1; paired representing mode gives 1. Opposite Fourier mode pairs to 0 | Retain; equation fixes the adjoint convention |
| 2.8 nuclear smooth inclusions | Circle Fourier Sobolev levels; Hilbert identity | A stronger-level inclusion has singular values (1+n²)⁻¹, summable; Hilbert identity has singular values 1, sum ∞ | Retain; not a claim of nuclearity of the bare L² identity |
| 2.8 absolute summability consequence | Orthonormal e_n/n in ℓ²; stronger weighted source | Squared norms sum π²/6, but norms sum ∞; the sequence fails unconditional convergence in the sufficiently stronger source | Retain; source nuclear improvement is necessary |
| 2.9 bounded and vanishing rapid spaces | Tail n⁻²; discontinuous compact indicator | At exponent 3, n³n⁻²=n→∞. A compact indicator has finite weighted suprema but is not continuous | Retain; S₀ and its continuous subspace are distinguished |
| 2.9 uniform closure API | Functions of finite weighted sup norm; fixed weight | If weighted errors are ≤2⁻j, the limiting error is 0; continuity is preserved by uniform convergence, not inferred from mere boundedness | Retain |
| 2.10 quotient Schwartz space | Compact smooth 1; noncompact tail y⁻² | Compact weighted derivatives are bounded; y³y⁻²=y→∞ on the cusp | Retain; all algebraic powers are required |
| 2.10 derivative topology | Circle e₀,e₁ | D^k e₀=0 for k>0; D^k e₁=i^k e₁ has norm 1 | Retain; seminorm family includes all derivatives |
| 2.11 Harish-Chandra versus algebraic decay | φ=Ξe^{−√σ}; φ=Ξσ⁻² | First weighted ratio is σ^d e^{−√σ}, bounded for every d; second at d=3 is σ→∞. Multiplying the first by a positive algebraic height power still diverges | Retain; the two Schwartz spaces differ |
| 2.11 intersections and nuclear stages | Compact circle | n,σ,Ξ bounded ⇒ S=C=C∞; high Fourier derivative inclusions have summable singular values | Retain at fixed level |
| 2.12 weighted measure norm | 3δ_x with w(x)=2; δ_x−δ_y at w=1, x≠y | Reciprocal-weight norm=3/2; total-variation distance=2 | Retain; full measure action is not norm continuous |
| 2.12 pairing and convolution | Mass-one circle, δ₀ and f=e₁ | Convolution against moving point yields the reversed character density e₋₁ under the fixed right-action convention; pairing against e₋₁ gives 1 | Retain; weak convolution first |
| 2.13 one growth exponent for all derivatives | φ(y)=exp(iy²), Euler derivative y∂_y | First derivative=2iy²φ; second=(4iy²−4y⁴)φ; kth leading power has degree 2k | Retain; moderate function is not uniformly moderate in every derivative |
| 2.13 cutoff topology | Constant function 1 and height n≥1 | Sup-norm error of compact cutoff is 1; after division by n outside n≥R, error≤1/R | Retain; density may require a larger growth stage |
| 2.14 weighted Schwartz intersections | w=1; w=n and φ=1 | For w=1 no new w-power decay; for w=n, exponent r with growth N gives n^{r−N}, unbounded at r=N+1 | Retain; one N before all requested r |
| 2.14 weight monotonicity | Weight n and n² | Requiring all integer powers of either yields the same cofinal sequence of power conditions; fixed individual stages need not coincide | Retain; agrees with repaired Franke scope |
| 2.15 product tensors | Finite sets of 2 and 3 points; nontrivial smooth product | Dimensions 2·3=6; pure tensor values multiply. e^{−x²−y²+xy/2} has infinitely many distinct x-power coefficients in its y expansion | Retain; completion, not only finite pure sums |
| 2.15 sesquilinear tensor convention | Scalars 1,i | 1⊗conj(i) evaluates to −i; ordinary 1⊗i evaluates to i | Retain; conjugate factor required |
| 2.16 CT/EP construction and continuity | P=Q; φ=0 | CTφ=EPφ=φ, δ=1; zero function contributes zero nonzero summands; identity quotient contributes one summand | Retain; finite support along discrete fibers is not asserted uniformly globally |
| 2.16 adjunction and weighted estimate | Compact identity quotient, φ=ψ=1 | Pairings 1=1; only CT-side measure doubled gives 2≠1; both doubled gives 2=2. Identity weight factor δ^{cN}=1 | Retain; new Checks discriminate measures |
| 2.17 constant-term approximation | Cusp form with CT=0; identity parabolic | Difference=φ in first case, 0 in second. A model decaying tail e^{−y} obeys y e^{−y}≤e⁻¹ for y≥1 | Retain; arbitrary depth power cannot change the fixed height exponent |
| 2.18 graph embedding | Unit-norm cusp vector; no proper parabolic | Proper constant terms all 0, but augmented tuple has norm 1; for a torus the map is identity | Retain; omitting identity would lose injectivity |
| 2.18 open sum and dual weights | Identity parabolic with w=w′=1; scalar φ=2 | Sum map is identity, image 2 and quotient norm 2; lower and upper weights both 1 | Retain; noncomparable central weights are not permitted |
| 3.1 relative character | A=diag(2,3); one-dimensional A=2 | Orthonormal trace=5; dimension-one trace=2; replacing unit basis by twice itself gives 8; multiplying by i still gives 2 | Retain; orthonormality and basis independence |
| 3.1 holomorphic tensor dependence | One-dimensional families u(z)=z and v(z)=z | Completed bilinear tensor has coefficient z², derivative 2 at z=1; raw scalar conjugation would give abs(z)², not holomorphic | Retain; conjugate-space/parameter convention required |
| 3.2 factorization adjoint identity | A=2,T=i; real λ=1 | B(AT,1)=2i=B(A,T*); using T in second slot gives −2i. For e^x paired at λ=1, the required adjoint character has exponent −1 | Retain repaired −conj(λ) |
| 3.2 noncommuting basis calculation | A=[[1,2],[3,4]], T swaps coordinates, B matrix diag(1,2) | Sum B(AT e_j,e_j)=2+6=8; sum B(Ae_j,T*e_j)=6+2=8 | Retain; scalar commutativity is not hiding an error |
| 3.3 support spaces and complements | ℂ², vector (2,3); A=∅,{first},all | Projections 0,(2,0),(2,3); annihilator of second coordinate is precisely first coordinate | Retain; both directions of support identification |
| 3.4 projections and summation | Coordinate projectors P₁,P₂ | P₁P₂=0, P₁+P₂=I; e_n/n has L² sum but divergent sum of norms; e_n/n² has norm sum π²/6 | Retain; stronger Schwartz summability is not inferred from orthogonality alone |
| 3.5 regular datum | GL₂ χ⊠χ, χ₁⊠χ₂ with χ₁≠χ₂; torus | Weyl stabilizer orders 2,1,1 respectively | Retain; equality of infinitesimal characters alone is insufficient |
| 3.6 regular constant terms | δ=4 and real parameter s=1,1/2,0 | Normalized factors δ^{s−1/2}=2,1,1/2; changing normalization reverses the middle shift | Retain with regular-support hypothesis and compact comparison |
| 3.7 wave-packet inversion | Compact circle φ=e₁; zero φ; two support components | Fourier coefficients 1 at 1 and 0 elsewhere reconstruct e₁; zero reconstructs 0; projection of φ_χ+φ_ψ onto χ leaves difference φ_ψ | Retain; HP and specified support are present |
| 3.8 kernel and central disintegration | n=0,1; x=0,y=1/2 | Kernels 1 and e^{−πi}=−1; reversal gives wrong Fourier projection. GL₂ central factor at δ=4 is 1/2, not 2 | Retain |
| 3.9 uniform component majorant | Evaluation functional with weight value 2; zero f | Reciprocal norm=1/2, hence homogeneous bound scales by 1/2; zero kernel sum=0 and p(0)=0 | Retain; weight may affect seminorm, exponent chosen before weight |
| 3.10 complex derivative estimate | e₋₁ projector, X=1,Y=iD−1 | As written: left 2, right 0. With derivative outside conjugation: left 0, right 0 | Fail; R01 |
| 3.10 grouped absolute convergence | One K-block with diagonal coefficients 1,−1 | Absolute value after sum=0; sum of individual absolute values=2 | Retain grouping; stronger ungrouped claim is not made |
| 4.1 T-character and spherical unit | Gₘ, one Laurent generator h; finite empty support | Character values h↦2 and h↦3 distinguish characters; unit evaluates to 1; empty Hecke tensor=1 | Retain; T may be infinite but support finite |
| 4.2 CAP definition | Torus; GL₂ with T containing every finite place | Torus has 0 proper parabolics, so CAP=false. For GL₂ the outside-T finite-place matching conditions are empty; proper inducing data can meet that vacuous part | Retain; definition is relative to T, not an absolute CAP label |
| 4.3 mixed multiplier algebra | Pure factors of values 2 and 3; sharp compact symbol 1 | Evaluation of tensor/product=6; zero factor gives 0. Compact constant 1 has infinitely many nonzero lattice values, so is not a sharp unit | Retain; scalar product is not transfer preservation |
| 4.4 quasi-cuspidal test space | Zero test; compact anisotropic quotient; residual constant | R(0)=0; with no proper parabolics the cusp space is all L². For a unit-integral GL₂ test, R(f)1=1, a noncuspidal residual vector | Retain; not every test is quasi-cuspidal |
| 4.5 typicality | Torus central weights 0 and 1 | Both derived Casimirs=0; central parameters 0≠1 distinguish the data | Retain; derived condition alone would be vacuous |
| 4.5 twist normalization | Parameter α+s with projection killing a_M | Projected value is α for every s, whereas full parameter at s=0,1 is α,α+1 | Retain; quotient and affine central convention distinguished |
| 4.6 multiplicity counting versus zero set | Spectral multiset {1,1,4} | Count up to 4=3, distinct zero set has 2 elements; its inverse-square sum=1+1/16=17/16 | Retain; multiplicity counted before taking a set |
| 4.6 conjugate-level reduction | S₃ subgroups K=⟨(12)⟩ and gKg⁻¹=⟨(23)⟩ | Both have order 2 but are unequal; common intersection has order 1 | Retain; original level intersection cannot replace all conjugate levels |
| 4.7 typical-data finiteness | Central lattice ℤ, allowed finite set {0,1}; torus derived group 1 | Central candidates=2 although every derived eigenvalue=0; ignoring central restriction leaves infinitely many integers | Retain; central gap is essential |
| 4.8 annihilator of entire families | Bad projected parameter 2, desired 3; factor q−2 | Values 0 and 1; on bad family q(α+s)=2 for every complex s, so value stays 0 | Retain; all complex twists, not only unitary ones |
| 4.8 Weyl product and empty bad set | W={±1}, desired ±3, bad ±2 | (z−2)(−z−2)=4−z² gives 0 at ±2 and −5 at ±3; empty product=1 still needs the separate sharp seed | Retain |
| 4.9 finite surviving blocks | One Borel datum, arbitrary unitary twist t | Number of data blocks=1; number of t∈ℝ is infinite | Retain; does not claim finite-dimensional image |
| 5.1 common-parameter occurrence | Infinity fixes s=0; Hecke value 2^s, desired 2 | At s=0 finite value=1, so no occurrence; s=1 yields 2 but fails the fixed infinity condition | Retain; different places cannot choose independent s |
| 5.1 M=G and no twist direction | Two distinct infinitesimal characters | Zero-dimensional normalized twist parameter is unique; unequal characters stay unequal | Retain |
| 5.2 finite Hecke separator | h bad value 2, desired 3 | h−2 evaluates to 0 and 1; tensoring with a sharp seed of value c≠0 gives 0 and c | Retain; fixes the bare-Hecke issue in source proof |
| 5.2 Weyl candidate choice | Two forbidden linear conditions c₁=0,c₂=0 in ℂ² | Choice (1,1) avoids both; product target value=1 while its designated family factor is 0 | Retain; finitely many proper hyperplanes cannot cover ℂ² |
| 5.3 normalized global isolation | Two separating factors of target values 2,3 | Product target=6, normalization divides by 6 to give 1; any killed family has value 0/6=0 | Retain; denominator explicitly nonzero |
| 5.4 non-CAP cuspidal range | No proper inducing occurrence; zero cusp summand | Proper supports=0; if the allowed cuspidal block is empty, total automorphic range=0 | Retain; nonoccurrence is permitted |
| 5.5 preservation without automorphic occurrence | Abstract π with χπ target; π absent from automorphic Hilbert space | π(µ⋆f)=1·π(f); automorphic operator can be 0 | Retain; no hidden occurrence hypothesis |
| 5.6 unique GLₙ support | Multisets {α,β},{β,α},{α,α}, α≠β | First two multiplicity vectors (1,1) agree; last is (2,0). For α=2,β=3 polynomial is 1−5T+6T² | Retain; uniqueness is support, not every induced constituent |
| 5.7 discrete-data refinement | PGL₂, q(λ)=λ²−1/4; λ=0,it,ρ=1/2 | Values −1/4,−t²−1/4,0. Vanishing on all complex λ includes ρ; reverse separation impossible | Retain conditional polynomial counting |

### Declared-gap audit

There are 27 distinct, synchronized README/plan gaps. All name an owner; none has supplier `none`. They are hypotheses on the planned supply, not established results at the pins. The table separates the numerical/convention test from the ownership decision. R02 is the sole gap rejected for already-owned generic supply; the other 26 are precise supplements or comparisons to the named sections, rather than fresh generic carriers. Their linked consequences (for example HP with UT/WR, or trace-class with the nuclear convention) describe one interface rather than unrelated requests.

| Gap slug | Computed instance and two sides | Precision/minimality decision |
| --- | --- | --- |
| nash-schwartz-analysis | Gaussian product at (0,0): 1·1=1; at (1,1): e⁻¹e⁻¹=e⁻² | Retain; Nash product/embedding comparison beyond the generic tensor carrier |
| tensor-holomorphy | (zu)⊗(zv)=z²(u⊗v), derivative at 1=2u⊗v | Retain; the parent weak-to-strong holomorphy adapter is not itself this tensor-family theorem |
| slf-isotypic-sums | S₃ regular representation dimensions 1²+1²+2²=6; C₂ gives 1²+1²=2 | Retain; fixed K_f, countable family and closed-subspace topology explicit |
| frechet-open-mapping | z↦2z: radius 1→2; zero map quotient 0→0 | R02; generic result already owned by SpectralManifolds SM3 |
| frechet-bilinear-continuity | ℂ² multiplication: abs(zw)=abs(z)abs(w); zero factor gives 0 | Retain; Fréchet source factors and Hausdorff locally convex target stated |
| real-point-root-data | Central×derived cover of GL₂ has kernel {(1,I),(−1,−I)} of size 2 | Retain; real finite kernel/components not discarded |
| real-descent-cartan | Split rank 1: (+,−) dimensions (1,0); compact rank 1: (0,1) | Retain; descent and real-torus spectral dictionary are the missing comparison |
| real-plancherel-characters | Circle Fourier coefficients of e₁: coefficient at 1=1, at 2=0; SU₂ parameter 0 absent | Retain; containment/faithfulness, not false equality with all formal strips |
| rapid-semisimple-centre | Split symbol e^{z²} at z=it has value e^{−t²}; product of two centres gives e^{−t₁²−t₂²} | Retain; rapid Schwartz extension not supplied by compact Paley–Wiener alone |
| kostant-centralizer | Torus α=1, tensor weight 2: shifted eigenvalue 3; X−3 annihilates it | Retain; finite-free centralizer and its same tensor annihilator are one input |
| generic-tensor-semisimplicity | Parameter 2 plus weights ±1 gives eigenvalues 3,1; collision would give one repeated value | Retain; reducibility/collision hyperplanes explicitly removed |
| minimal-type-detection | Limit rays have minimal weights +1 and −1; split twisting changes neither | Retain; includes the limits omitted by a discrete-series-only shortcut |
| k-type-growth | SU₂ n=0,1,2: dimensions 1,2,3; positive compact Casimir 0,3,8; dim²=Casimir+1 | Retain; finite-length admissibility and level retained |
| quotient-height-comparison | Multiplicative rank 1, t=2 and 1/2: symmetric height 2 on both | Retain; intermediate quotient properness/comparison, not a new generic height |
| cusp-fiber-bounds | Identity quotient has one point in a fiber; ε=1,1/2 gives 1≤1,2 for c=r=1 | Retain; uniform ε-range and restricted cusp region explicit |
| deep-cusp-uniqueness | Modular inversion sends height 2 to 1/2 in the same quotient | Retain; no global injectivity claim; the second deep threshold excludes the shallow mate |
| quotient-neighborhood-volumes | Cusp y=4: volume=1/4 and exp(−2ρH)=1/4; Ξ=2 | Retain; fixed-level quotient-volume comparison |
| cuspidal-data-central-comparison | δ=4: normalized induction 2 and disintegration 1/2 multiply to 1 | Retain; quotient measure and fixed central-character comparison, not new cuspidal-data ownership |
| cuspidal-polynomial-counting | Model positive eigenvalues m²: count at R=4 is 2≤√4; at R=9 is 3≤√9 | Retain; multiplicity, conjugate levels and Casimir sign explicit |
| hereditary-intertwining-bounds | Torus intertwiner I=1, norm 1, every positive parameter derivative 0 | Retain; hereditary hypotheses for every Levi; GL products identified as unconditional input |
| discrete-polynomial-counting | PGL₂ residual constant is one additional discrete summand; q(ρ)=0 versus q(it)≠0 | Retain; residual data and central disintegration are included |
| central-character-affine-lattice | Translate 1/2+ℤ has parameters 1/2,3/2; rank 0 gives a singleton | Retain; affine coset, independent generators, finite component characters; full rank not imposed |
| satake-exponential-family | GL₁ Hecke value at uniformizer with q=2: 2^s gives 1 at s=0 and 2 at s=1 | Retain; common parameter and finite support/level preservation supplement SR.4 |
| compact-eisenstein-comparison | Mass-one Fourier inner product ∫eₙconj(e_m)=1 for n=m and 0 for n≠m | Retain; measures and intertwining normalization transported, compact formulas not rebuilt |
| arthur-factorization-comparison | Point group: g₁=1,g₂=0 gives f=f·1+0 | Retain; fixed normal level, differentiability order and compact-kernel transport stated |
| local-sobolev-evaluation | Point/chart w=4: evaluation 1 equals weighted norm 2 times w⁻¹ᐟ²=1/2 | Retain; derivative evaluation and weak-to-smooth conclusion are the stated local interface |
| hilbert-schmidt-nuclear-composition | One-dimensional maps 2 and 3: composite nuclear norm 6=2·3 | Retain; generic Hilbert operators already supplied, composition bound and locally convex convention named |

### Headline coverage, elaboration and padding

The README's three currently statable analytic headlines are stated on native carriers. The more specialized headlines are expressly named in the module docstring with their missing carriers; the following is the complete headline comparison, rather than an assertion that an arbitrary scalar theorem substitutes for an automorphic one.

| README headline | Suggested.lean disposition |
| --- | --- |
| §0.2 finite-rank canonical product, simple zeros and global order bound | finite_rank_weierstrass_product, line 85 |
| §0.3 polynomial zero-fiber interpolation with rapid strip decay | polynomial_zero_fiber_interpolation, line 98 |
| §0.3 affine-lattice interpolation, including arbitrary finite exceptions | affine_lattice_interpolation, line 108 |
| §0.8 sharp Weyl-invariant interpolation | Docstring: missing real-form strip/root-datum symbol algebras |
| §§1.3, 1.6–1.8 real multipliers, rapid estimates, moderate extension and finite K detection | Docstring: missing reductive Schwartz algebra and Casselman–Wallach representations |
| §§2.7–2.8 weighted evaluation, smoothing and nuclear inclusion | Docstring: missing smooth weighted quotient representations and locally convex nuclear maps |
| §§2.15, 2.18 completed product and constant-term decomposition | Docstring: missing quotient Schwartz/tensor spaces and constant-term maps |
| §§3.1–3.2 relative-character convergence and factorization | Docstring: missing smooth induced automorphic representations and their tensors |
| §3.4 support projections and summability | Docstring: missing weighted cuspidal-support spaces |
| §3.6 regular-support bounds and holomorphy | Docstring: missing regular data and Levi-space carriers |
| §3.7 HP inversion, with unconditional GL products | Docstring: missing wave-packet and intertwining carriers |
| §§3.8–3.10 Schwartz kernels and uniform grouped expansion | Docstring: missing adelic kernels and Eisenstein inducing spaces; prose formula also needs R01 |
| §§4.6–4.7 counting and finite typical data | Docstring: missing automorphic representations, level and derived Casimir carriers |
| §§4.8–4.9 archimedean annihilation and finite surviving blocks | Docstring: missing induced spectral families and multiplier action |
| §§5.2–5.3 mixed separation and normalized global isolation | Docstring: missing mixed multiplier and cuspidal-support Hilbert decomposition |
| §§5.4–5.5 non-CAP range and preservation of an admissible representation | Docstring: missing CAP occurrence and central-character Hilbert representation carriers |
| §5.6 one GLₙ cuspidal-support component | Docstring: missing normalized adelic induction and support blocks |
| §5.7 refined discrete-data isolation with polynomial counting | Docstring: missing Langlands discrete-data decomposition and its character equations |

The single import is `import Mathlib`; the required namespace, one module docstring, real-bodied supporting definitions and theorem docstrings are present. The file has 116 lines, seven definitions and three theorems. All ten names appear in the README. No target is represented by a free Prop field or an assumed conclusion. The explicit formulas for the supplied canonical product are small native definitions needed by the growth headline, not a competing roadmap for general Weierstrass theory.

The prescribed `lake env lean` elaboration was run from the pinned content checkout on the package's absolute file argument (machine paths deliberately omitted from this report). It exited 0. The only warnings were the three expected uses of sorry at Suggested.lean:85:8, :98:8 and :108:8. No TauCeti import needed building.

One scratch copy was elaborated with `#check @name` for every declaration. Its ten elaborated signatures agree with the supplied signature record and the README:

| Declaration | Binders checked | Result |
| --- | --- | --- |
| HasRankBound | Λ:Set ℂ, p:ℕ | Countability and nonzero-point summability present |
| elementaryFactor | p:ℕ, w:ℂ | All denominators are positive natural j+1 cast to ℂ |
| canonicalProduct | Λ, p, z | Nonzero subtype in every denominator; origin factor separate |
| partialCanonicalProduct | Λ, p, finite set of that subtype, z | Same origin and nonzero-point conventions |
| HasFiniteEntireOrder | ψ:ℂ→ℂ | Positive C and integral degree are part of the predicate; holomorphy intentionally separate |
| HasRapidVerticalDecay | implicit n:ℕ, ν:(Fin n→ℂ)→ℂ | ∀M>0, ∀r, ∃C≥0, ∀z; no uniformity silently weakened |
| affineSpectralLattice | implicit n,k, a, b | Integer span is real-bodied; independence is not silently built into the carrier |
| finite_rank_weierstrass_product | Λ,p,hΛ | hΛ retained; local uniform convergence, entirety, both zero-set directions, nonzero derivative and global bound present |
| polynomial_zero_fiber_interpolation | n,q,ψ,hψ,horder | Entirety and order hypotheses retained; no positivity or nonzero-polynomial restriction added |
| affine_lattice_interpolation | n,k,a,b,hb,A | Complex linear independence retained; A arbitrary, including empty/outside lattice; dimension and rank zero retained |

No binder or signature change was needed. A separate scratch copy applied four one-tactic probes to each of the three original theorems: `simp`, `rfl`, `infer_instance`, and `exact?` searching for a closing library application. Each probe was wrapped in `fail_if_success` and `solve` so partial progress did not count as closing the goal. The copy elaborated successfully, with only the original three sorry warnings: all 12 attempts failed to close. The library object audit likewise found no single pinned result making these headlines padding. There is no P3 padding declaration to delete.

## Not verifiable

- Bernstein, *On the support of Plancherel measure*, §§3.4–3.5, pp.685–689, remains `uncertified` in sources.toml because the full text is paywalled. It was not requested again. BPCZ's accessible statements, the explicit supplier contracts and the computed weight/nuclearity tests were checked; this does not certify Bernstein's original proof.
- Fifteen package README requests at the exact board-index heads returned HTTP 404: ArithmeticLocallySymmetricSpacesPartII (84a41ac), CompletedCohomologyAndLocalGlobalCompatibilityPartII (948c94c), CrystallineCohomologyPartII (84ea77e), EndoscopicTransferAndUnitaryTraceComparisonPartII (80a66cc), HigherHidaAndColemanTheory (da88512), LawrenceVenkateshMethod (9ee7ac3), OrdinaryAutomorphicFormsAndModularityLiftingPartII (7e88c38), PELModuliPartII (d4bb48d), PadicHodgeTheoryPartII (6502997), PadicLocalLanglandsForGL2QpPartII (3e0777d), RealSurfacePeriodIndex (875bca4), SchemeAndStackFoundationsPartII (accb0a0), ShimuraVarietiesPartII (57dc0a4), VStackSheavesAndLisseCategoriesPartII (0987ba7), VectorBundlesAndIsocrystalsPartII (b58d862). Ownership against those particular package heads could not be certified. Their names were not treated as absent. The successfully fetched board heads were AnalyticNumberTheory (310e834), ArithmeticStatistics (357e723), AutomorphicCongruences (b047dd3), KatoEulerSystems (5fb6ef4), and LogicAndDefinabilityInNumberTheory (3062436); their object-search matches did not duplicate this package's analytic targets.
- Generic source results attributed only through BPLZZ, notably Kostant and the discrete-series/minimal-type literature, were checked as BPLZZ's stated/proof inputs and against the exact supplier contracts. Their independent originals are not claimed to have been opened. The package does not record them as separately certified sources.

No new missing-source request was generated: every cited manifest work was either readable or already settled as uncertified. The inaccessible board files are repository-read limitations, not missing literature.

## Source issues

- **Error** in bplzz at §1.4, printed p.8 (bplzz line 347): the source says injectivity after complex tensoring defines a lattice; it should be restricted to finitely generated discrete subgroups with independent generators; affects a stated result.
- **Misprint** in bplzz at Definition 2.1, printed p.9 (bplzz line 401): the source says the rank parameter is positive while minimizing over nonnegative integers; it should be allowed to equal zero, with the empty exponential sum; affects a stated result.
- **Misprint** in bplzz at Definition 2.3, printed p.9 (bplzz line 414): the source says the bound concerns ν after introducing µ; it should be a bound on µ; affects nothing.
- **Error** in bplzz at §2.2, printed p.10 (bplzz line 451): the source says all root-datum involutions form a finite set; it should be a fixed finite Weyl-stable real-descent collection or coset; affects a stated result.
- **Error** in bplzz at Remark 2.16, printed p.12 (bplzz line 574): the source says realized irreducible infinitesimal characters equal the full union of formal strips; it should be containment, with realizability retained when identifying the multiplier kernel; affects a stated result.
- **Misprint** in bplzz at Lemma 2.22 proof, printed p.16 (bplzz line 759): the source says tensor weights give roots t_λz with t_λf(α)=f(α−λ); it should be t₋λz, giving z(α+λ); affects the proof.
- **Misprint** in bplzz at completion of Theorem 2.13, printed p.21 (bplzz line 1030): the source says the moderate-growth exponent comes from Definition 2.8(2); it should be Definition 2.8(1); affects nothing.
- **Gap** in bplzz at Lemma 3.12 proof, printed p.26 (bplzz line 1266): the source says restriction at the original derived level suffices for counting; it should be justified after finitely many translates and conjugate-level intersections; affects the proof.
- **Gap** in bplzz at Lemma 3.13 proof, printed p.26 (bplzz line 1271): the source says derived Casimir finiteness gives finiteness of typical data; it should be supplemented by the fixed-level central-character lattice and component bounds; affects the proof.
- **Gap** in bplzz at Proposition 3.17 proof, printed p.28 (bplzz line 1376): the source says a bare finite Hecke separator supplies the required multiplier; it should be multiplied by an archimedean sharp seed nonzero at the target; affects the proof.
- **Misprint** in bplzz at Theorem 3.19(1), printed p.29 (bplzz line 1434): the source says the cuspidal-support decomposition is (3.9); it should be the earlier decomposition (3.2); affects nothing.
- **Misprint** in bplzz at Proposition A.1, printed p.43 (bplzz line 2104): the source says the symbol ranges over all rapid entire functions; it should be Weyl invariant, as in the subsequent displayed bilinear map; affects a stated result.
- **Misprint** in bplzz at Appendix A before (A.4), printed p.44 (bplzz line 2137): the source says the finite product kernel is Z⁰∩G_der; it should be Z⁰∩G_der⁰ for the indicated connected-factor covering; affects the proof.
- **Misprint** in bplzz at Appendix A before (A.6), printed p.45 (bplzz line 2184): the source says central types index the derived Schwartz factor and derived types index the central factor; it should be the other way round; affects the proof.
- **Error** in bpcz at §2.5.4, printed p.210 (bpcz line 1217): the source says an equivariant closed-image SLF morphism is a topological embedding; it should be an isomorphism from its quotient by the kernel onto its image; affects a stated result.
- **Error** in bpcz at §2.5.9, printed p.213 (bpcz line 1333): the source says the full weighted Radon-measure space is a continuous Banach representation; it should be weakly acted on, with norm-continuous or smooth vectors handled separately; affects a stated result.
- **Misprint** in bpcz at Proposition 2.8.4.3, printed p.229 (bpcz line 2053): the source says the adjoint-slot induction parameter is conjugate λ; it should be minus conjugate λ; affects a stated result.

For the first issue, ℤ[1/2]⊗ℂ→ℂ is injective but its subgroup is nondiscrete; nonzero entire interpolation on it fails by accumulation. For the involution issue, the matrices A_m above give infinitely many involutions. For the character-union issue, compact SU₂ misses parameter 0. The zero map and moving Dirac distance 2 witness the two BPCZ functional-analysis errors. The remaining sign and counting corrections are precisely the explicit comparisons/gaps checked above. No published correction is asserted. R01 is an error in the roadmap transcription, not an error in BPCZ's printed kernel estimate.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d3e37606fa40cc19cda8b13219a36f270e71b88e", "job": "REV-PKG-AutomorphicSpectralTheoryPartII~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
