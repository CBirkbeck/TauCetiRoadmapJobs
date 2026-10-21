<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/96#issuecomment-6311071476 -->
Red team round 2 pass a (codex) of b6ffff2

Verdict: needs_changes

1. **F01** (P2) The new Albanese milestone has an easy signature but is omitted

   **Location:** `packages/ColemanIntegrationPartII/README.md:589`: “Prove `NaturalIntegration.properAlbanese_exists`.” `packages/ColemanIntegrationPartII/Suggested.lean:298` moves directly from Layer 2 to Layer 7.

   **Claim:** The repair now owns general pointed proper-Albanese existence as a milestone, but Suggested.lean omits it even though every carrier and hypothesis already exists. This is a missing easy headline under the package contract.

   **Witness:** Tau Ceti pin `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84` supplies `IsAlbanese`; Mathlib pin `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40` and `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59` supply the geometric hypotheses. No rational-form or integration carrier is required.

   **Exact repair text:** Import `TauCeti.AlgebraicGeometry.AbelianVariety.Albanese` and add the following Layer 4 signature, with explicit smoothness, finiteness, separatedness and geometric connectedness. Retain the README's full characteristic-zero scope.

   ```lean
   /-! ## Layer 4: Harmonic realization of arbitrary-reduction single integration -/

   open CategoryTheory MonoidalCategory
   open AlgebraicGeometry

   namespace NaturalIntegration

   /-- Every pointed smooth geometrically connected separated finite-type variety
   in characteristic zero has a proper Albanese variety
   (Serre, Exposé 10, §4, Theorems 5–6). -/
   theorem properAlbanese_exists {k : Type u} [Field k] [CharZero k]
       (X : Over (Spec (.of k)))
       [Smooth X.hom] [FiniteType X.hom] [IsSeparated X.hom]
       [GeometricallyConnected X.hom]
       (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
       ∃ (A : TauCeti.AlgebraicGeometry.AbelianVariety k)
         (a : X ⟶ A.toOver),
         TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese x₀ a := sorry

   end NaturalIntegration
   ```

   Declare `universe u` before this block. This is a proposed signature inspected against the pins, not an elaboration claim.

2. **F02** (P3) The now-statable characteristic-three graph Check has no Lean mirror

   **Location:** `packages/ColemanIntegrationPartII/README.md:167`: “In characteristic 3 on a triangle, the constant cyclic cochain (1,1,1) is both exact and harmonic.”

   **Claim:** This negative control is mathematically correct and now directly tests the kept `Graph.simpleDivergence`, whose coefficient hypothesis is only `AddCommGroup`. Both Graph examples nevertheless use ℚ, so neither tests the essential characteristic-zero hypothesis of the decomposition.

   **Witness:** For `G=⊤` on `Fin 3` over `ZMod 3`, the pinned coboundary of `(0,1,2)` has cyclic values `(1,1,1)`, reverse values `−1`, and divergence zero. It is nonzero and exact.

   **Exact repair text:** Extend the existing second Graph example, retaining at most two example blocks for `simpleDivergence`, with this additional conjunct and prove it by unfolding the kept divergence and pinned coboundary, finite case splitting and `norm_num`:

   ```lean
   (let G : SimpleGraph (Fin 3) := ⊤
    let f : Fin 3 → ZMod 3 := ![0, 1, 2]
    let c := G.coboundary (Multiplicative (ZMod 3))
      (fun v ↦ Multiplicative.ofAdd (f v))
    (∀ v, simpleDivergence G c v = 0) ∧
      Multiplicative.toAdd (c ⟨(0, 1), by decide⟩) = 1 ∧
      Multiplicative.toAdd (c ⟨(1, 2), by decide⟩) = 1 ∧
      Multiplicative.toAdd (c ⟨(2, 0), by decide⟩) = 1)
   ```

   This Check must not use `simple_harmonic_exact_decomposition`, whose characteristic-zero hypothesis deliberately excludes it.

## Earlier findings, checked individually

IDs in this table are prefixed by the earlier pass to distinguish their two F01–F04 sequences. Quotations are from the repaired package.

| Earlier finding | Status | Repaired passage and witness |
| --- | --- | --- |
| a F01: scalar-extension signature | Repaired | `packages/ColemanIntegrationPartII/Suggested.lean:251`: “theorem doubleIndex_scalarExtension”; explicit characteristic-zero fields and `HahnSeries.map` now state the coefficientwise identity. `packages/ColemanIntegrationPartII/README.md:300` identifies this as the formal assertion. Coefficient extraction, differentiation and convolution commute with the embedding. |
| a F02: triple congruence cycle | Repaired | `packages/ColemanIntegrationPartII/README.md:962`: “Equal global Coleman functions give equal values independently of the chosen global compatible auxiliary primitives, by `tripleIndex_laws`”. This follows the independence target at line 960; §6.1 no longer depends on congruence. |
| a F03: missing residue/orientation Checks | Repaired by the permitted fallback | `packages/ColemanIntegrationPartII/Suggested.lean:168` tests the full derivative of `2+3L`; lines 263–264 test values 2 and −1. `packages/ColemanIntegrationPartII/README.md:274`: “Prove `doubleIndex_laurent_second`”. Lines 274–295 of Lean prove nonconstant first/second-slot witnesses without invoking the admitted universal target. |
| a F04: closed-field branch scope | Repaired | `packages/ColemanIntegrationPartII/README.md:1056`: “K a closed subfield of ℂ_p”; line 1084 gives the same scope and finite algebraic endpoint extension. Line 1088 uses geometric abelian logarithms and injective descent; line 1095 tests the transcendental-j elliptic curve. |
| b F01: higher-dimensional Albanese | Repaired as an ownership defect | `packages/ColemanIntegrationPartII/README.md:589`: “For every characteristic-zero field k, smooth geometrically connected finite-type X/k and x₀∈X(k), construct an abelian variety A/k and a pointed morphism a_X:X→A satisfying the native IsAlbanese predicate.” Serre's maximal-morphism construction supplies the stated route (serre1959 line 83, line 141, line 176, line 431). A new signature omission introduced by this repair is S01. |
| b F02: alleged uniqueness freedom | Not repaired; dispute sustained, no re-raise | `packages/ColemanIntegrationPartII/README.md:630`: “These theories commute with inclusions of closed coefficient subfields, including K⊆ℂ_p”. Splitting the quadratic form and applying this law fixes its value. Independently colmez1998 line 2986 defines naturality and line 2996 states uniqueness for the closed-field scope of line 2957. The repair's norm-one-torus argument also defeats the proposed ℚ₃ witness. |
| b F03: closed-field fixed-field step | Repaired | `packages/ColemanIntegrationPartII/README.md:650`: “Characteristic zero makes K/F regular, so K and ℚ̄_p are linearly disjoint over F”. Here F=K∩ℚ̄_p is relatively algebraically closed in K; the extension is separable. Uniqueness of the extended norm makes compositum automorphisms isometric. The supplied fixed-closure theorem gives both inclusions. |
| b F04: missing graph milestone | Repaired | `packages/ColemanIntegrationPartII/Suggested.lean:61`: “theorem simple_harmonic_exact_decomposition”; the unique pair is harmonic/exact, not a potential. Lines 42–55 give divergence and the signed Laplacian; lines 71–100 test the edge and triangle. The additive translation of the pinned coboundary is head minus tail. |
| b F05: duplicate Laplacian kernel proof | Repaired | `packages/ColemanIntegrationPartII/README.md:153`: “Its unit-length simple-graph specialization follows from Mathlib’s `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` over ℝ”. Line 159 reduces rational conductances to a simple graph before rational rank transfer. The contract correctly distinguishes the real kernel-basis theorem from the ordered-field quadratic-form criterion. |
| b F06: admitted evaluation restatements | Repaired | `packages/ColemanIntegrationPartII/README.md:1058`: “the generic commutative-ring identity is a proved conjunct of the affine-specialization example”. The four admitted declarations are absent; `packages/ColemanIntegrationPartII/Suggested.lean:325–330` proves the subtraction law by distributivity, including the zero ring. |
| b F07: consumers/process prose | Repaired | `packages/ColemanIntegrationPartII/README.md:1223`: “Regulator, height and effective-method roadmaps consume the index laws, the Coleman one-form pairing, divisor integration and descent; none is a premise here.” The nonexistent named consumers and the two locator-selection comments are gone. |
| b F08: Proposition 52 provenance | Repaired | `packages/ColemanIntegrationPartII/README.md:630`: “whose proof uses Conjecture 1 in the rank-two case established by Colmez”. The reference and manifest repeat the qualification and retain p>2 for the Vologodsky comparison. Witness: vologodsky2001 line 1810. |

## Verified sound

Read all 1,236 README lines, all 336 Suggested.lean lines and all 122 manifest lines. The audit inventory contains **29 Lean declarations** (7 real-bodied definitions/abbreviations, 14 theorem targets, 8 proved examples), **45 README target subsections**, **193 target-bearing paragraphs** (including three proof-plan paragraphs), and **167 Check bullets**. All 167 Check bullets were evaluated mathematically, including their negative controls; S02 concerns a missing mirror, not a false Check. The twelve non-Check bold spans are labels/emphasis, not additional theorem headings. All twelve earlier findings were checked individually above.

**Source verification: 54 distinct named theorem/definition/section locators across seven works**, enumerated below, plus the coefficient-scope and proof passages cited in the text. All seven manifest records resolve to the supplied legal cached texts. The cited arXiv version numbers agree with those texts. A source supporting a construction does not itself supply a Lean carrier.

| Source | Count | Verified locators and extraction witnesses |
| --- | ---: | --- |
| vologodsky2001 | 3 | §1.1 (line 51); Theorem B, §1.17 (lines 180–204); Proposition 52, §17.2 (lines 1806–1814). The p>2 scope and rank-two qualification are retained. |
| besser-zerbes2017 | 4 | Theorem 1.1 (line 88), Corollary 1.2 (line 108), §2 (lines 143–234), §3 (lines 245–280). Smooth-residue-domain identification is distinguished from the valuation correction on a connecting annulus. |
| besser2017 | 16 | Definitions 3.1, 3.2, 3.4, 3.8 (lines 402, 421, 435, 492); Lemma 3.3 (428); Propositions 3.5, 3.9 (449, 503); Definitions 4.1–4.3, 4.6 (528, 537, 545, 574); Theorem 4.4 (553); Theorem 4.10 (700); Definition 4.11 (738); Proposition 4.12 (747); Corollary 5.3 (807). |
| besser-dejeu2012 | 12 | Definition 7.1 (line 2243), Proposition 7.3 (2277), Lemmas 7.4–7.5 (2299, 2327), Definition 7.7 (2413), Proposition 7.8 (2430), Lemmas 8.1–8.3 (2529, 2546, 2576), Proposition 8.4 (2591), Lemma 9.1 (2769), Proposition 9.2 (2776). Also checked the formal-logarithm paragraph at 2232 and shrinking statement at 250. |
| colmez1998 | 10 | Definitions II.1.2–II.1.3 and Theorem II.1.4 (lines 2982–2997); Theorem II.1.9 (3079–3121); Definition II.1.12 (3145), Lemma II.1.13 (3147), Theorem II.1.16 (3169), Proposition II.1.17 (3193), Lemmas II.1.26–II.1.27 (3376, 3399). Additional scope/descent passages: lines 246–258, 602, 1938–2110, 2957, 3950–3968. |
| besser2005 | 4 | Proposition 3.4 (line 355), Lemmas 3.5–3.7 (358, 365, 369), including the projection argument through line 382. |
| serre1959 | 5 | §2 Theorems 1–2 and corollary (lines 83, 141, 176); §4 Theorems 5–6 (431, 463). Maximal morphisms and extension across smooth points support the added existence route; the native universal-property predicate remains imported. |

The displayed cocycle-kernel bound in the Colmez extraction at line 3172 must be interpreted with the finite-difference convention: the kernel of the n-th difference has degree strictly less than n. The roadmap states that correct bound. For n=1 constants are in the kernel, and for n=2 logarithms are; thus it has not copied the apparent strict-bound misprint/OCR issue. The vertical-residue sign is likewise checked against f=x rather than inherited from an incompatible graph convention.

**Supplier citations checked: eleven roadmap contracts, including five open heads; two specified sibling scopes checked.** Each supplier is on main or earlier in the merge order. No supplier gap is declared. The five open supplier README blobs were matched to the current GitHub heads before relying on the cached copies.

| Supplier | Current contract verified |
| --- | --- |
| AlgebraicCurves | `TauCetiRoadmap/AlgebraicCurves/README.md:643`, Layer 5 completion; line 887, Layer 9 point expansions; line 900, differential comparison and arbitrary-field traced residue theorem. No finite-residue-field premise is imported. |
| FormalLaurentPuiseux | `TauCetiRoadmap/FormalLaurentPuiseux/README.md:70`, L1 substitutions; line 112, L2 continuous derivation; line 140, L3 residue transport and characteristic-zero primitives. Positive substitution order and characteristic restrictions match. |
| RigidAnalyticGeometry | `TauCetiRoadmap/RigidAnalyticGeometry/README.md:235`, §1.3 complete field extension; line 355, §2.3 reduction; line 479, §6.2 geometry; line 690, §8.1 analytification. The package works on the quasi-separated finite-type spaces needed for extension. |
| StableReduction | `TauCetiRoadmap/StableReduction/README.md:295`, Layers 0–2; line 469, Layer 4 common resolutions; line 491, Layer 5 models; line 550, Layer 7 all-genus nodal reduction; line 615, Layer 9 separated markings. Genus zero does not import uniqueness of an unpointed minimal model. |
| JacobianChallenge | `TauCetiRoadmap/JacobianChallenge/README.md:254`, Layer D general projective Picard representability; line 345, Layer E abelian/Picard structure; line 449, Layer F pointed curve Albanese. Higher-dimensional Albanese existence is now locally owned, not attributed to Layer F. |
| EllipticCurves | `TauCetiRoadmap/EllipticCurves/README.md:885`, Layer 4 Tate point uniformization. Its parameter is a nonzero unit with norm <1; the package separately owns the differential/chart bridge. |
| ColemanIntegration | Head `acaaf506f3822fc5c8211345cb48f6b1cb00656c`: `TauCetiRoadmap/ColemanIntegration/README.md`, L0.A1–A2, L0.11–L0.23, L1.2–L1.3, L1.17–L1.19, L1.17a, L1.43. The full analytic coefficient extension is not confused with the supplied algebraic tensor extension. |
| PadicPeriodRings | Head `e37c9fb3ff76bd2b8fb3e48a5dcb421dfba2899e`: `TauCetiRoadmap/PadicPeriodRings/README.md:74`, §§1.1–1.2. Supplies the action/fixed-closure theorem; the arbitrary closed-subfield adapter is a target here. |
| PadicDifferentialEquationsAndRigidCohomology | Head `c01dad49213cd0dd3c7b72b6023a0ce912a5e315`: `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:8422`, RD.4.31–33; line 11016, RD.5.76; line 12254, RD.6.1; lines 14508, 14548, 14636, RD.6.86/88/92. Boundary eigenvalues qζ and residue-degree iteration match the package. |
| ResolutionOfSingularitiesCharacteristicZero | Head `7f4bd21732080caa7af07328917421939f6c7cd9`: `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:770`, §6.2 `sncCompactification`. Applied to a dense smooth quasi-projective open, not asserted for an arbitrary non-quasi-projective X without the rational-map extension step. |
| AnabelianGeometryAndNonabelianChabauty | Head `59d989dd138cd28b4a4643ab233c04ad6d62aa34`: `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:6829`, §5.8. The supplied geometric-point logarithm still starts with a finite-field model; arbitrary varieties over ℂ_p are owned here. |

The specified snapshots `TauCetiRoadmap/ArithmeticDynamics/README.md` (§3.58, line 5006) and `TauCetiRoadmap/ErdosProgressionPowers/README.md` were checked for overlapping ownership and dependencies. Neither supplies the indices or natural integration asserted here. No citation to either remains in the package.

The initial read-only dependency gate exited successfully with:

```text
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

The final invocation after writing this report also exited successfully:

```text
depcheck: 4 roadmaps, 26 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This is the gate's reported scope, not a claim that it inspected every theorem in all suppliers. The internal construction order was also checked: graph and local calculus precede cohomological corrections; the geometric logarithm, abelian primitives and Albanese reduction precede natural integration; principal reciprocity precedes harmonic identification; actual-form relations precede the Coleman one-form pairing; trace and common-extension descent follow those constructions. The repaired congruence target follows global auxiliary-choice cancellation. No ownership move to a later supplier is required.

The pinned source trees were matched to Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included the objects and their defining operations, not only the package's proposed names. In particular:

| Pinned object | Verified interface |
| --- | --- |
| Simple graph cochains | `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean:54`, `oneCochains`; line 79, `coboundary`; line 99, `FirstCohomology`. Reversal is inverse; coboundary is target/source. The Map and Relabel files supply the cited functorial maps. |
| Laplacian | `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:125`, outgoing difference formula; line 209, ordered-field zero quadratic form; line 277, real kernel basis; line 283, real nullity. The package does not pretend the latter two are already characteristic-zero-field theorems. |
| Laurent derivative | `Mathlib/RingTheory/LaurentSeries.lean:132`, derivative coefficients via Hasse derivatives; line 150, singleton derivative; line 176, ordinary derivative; line 184, map compatibility. Negative exponents and the coefficient −1 residue agree with the proposed signatures. |
| Field trace | `Mathlib/RingTheory/Trace/Defs.lean:110`, scalar trace; line 137, finite free tower law; `Mathlib/RingTheory/Trace/Basic.lean:249`, separable embedding sum. The roadmap retains finite extension/separability and traces the completed scalar index. |
| Norm uniqueness | `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:770`, algebraic extension of a complete nontrivially normed ultrametric field. The compositum in the repaired descent proof satisfies these hypotheses. |
| Native Albanese | `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84`, pointed universal property; line 227, identity example; line 233, trivial example. General higher-dimensional existence is absent; S01 does not duplicate it. |
| Coefficient foundations | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:531`, Padic; `Mathlib/NumberTheory/Padics/Complex.lean:184`, geometric normed field, with norm extension, characteristic zero and algebraic closedness below it; `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:88`, Gauss norm and line 151 completeness. These supply carriers, not integration. |

The explicit Lean inventory follows. All names are in `TauCetiRoadmap.ColemanIntegrationPartII`. The file has no standing section-variable block: the hypotheses listed here occur in the declarations themselves. “Field₀” means `[Field k] [CharZero k]`; all carrier types use `Type*`. Local `let`s in examples are not hidden standing assumptions.

| Line in `packages/ColemanIntegrationPartII/Suggested.lean` | Layer / declaration | Variable and instance context | Adversarial check / result |
| --- | --- | --- | --- |
| 42 | 1, `Graph.simpleDivergence` | V,k; Fintype V; AddCommGroup k; G,c,v | Empty/isolated graph gives zero; edge (2,5) gives 3,−3; F₃ triangle is also allowed. S02. |
| 50 | 1, `Graph.simple_laplacian` | V,k; Fintype/DecidableEq V; Field₀ k; decidable G.Adj; f,v | Head-minus-tail divergence is negative Laplacian; no sign mismatch. |
| 61 | 1, `Graph.simple_harmonic_exact_decomposition` | V,k; Fintype V; Field₀ k; G,c | Empty graph, tree, triangle, disconnected vertices; unique cochains, not unique potentials. |
| 71 | 1, first example | Fin 2/Fin 1; ℚ; top/bottom graphs | Values 3,−3,−3,0 follow from the kept definition. |
| 83 | 1, second example | Fin 3; ℚ; top graph | Cyclic ±1 is a valid nonzero harmonic cochain. Missing F₃ conjunct is S02. |
| 111 | 2, `Annulus.LogarithmicFunctions` | k; Field k | Laurent pair with scalar log coefficient; a module, not a multiplicatively closed degree-one algebra. |
| 116 | 2, `LogarithmicFunctions.differential` | k; Field k; F | dL=z⁻¹; dC=0; in characteristic 2, d(z²)=0. |
| 122 | 2, `LogarithmicFunctions.toPolynomial` | k; Field k; F | Scalars and L retain independent coefficients; X² is outside the image. |
| 128 | 2, `LogarithmicFunctions.formal_primitive` | k; Field₀ k; ω | The −1 coefficient becomes the log coefficient; all other denominators are nonzero integers. |
| 133 | 2, `LogarithmicFunctions.differential_eq_zero_iff` | k; Field₀ k; F | Residue forces log coefficient zero; Laurent scalar kernel finishes. F₂ z² explains the restriction. |
| 138 | 2, `LogarithmicFunctions.differential_residue` | k; Field₀ k; F | Derivative has zero residue; d(2+3L) has residue 3. |
| 144 | 2, `LogarithmicFunctions.residue_zero_iff` | k; Field₀ k; F | Equivalent to log coefficient zero, not to F being constant. |
| 149 | 2, `LogarithmicFunctions.toPolynomial_injective` | k; Field k | Constant and X coefficients recover both components, even in positive characteristic. |
| 154 | 2, first logarithmic example | k; Field₀ k; scalar c | Nonzero dL and dC=0 test the definition. |
| 167 | 2, second logarithmic example | ℚ and ZMod 2 | Full derivative/residue, polynomial images, X² exclusion, characteristic-two scalar-kernel failure. |
| 207 | 2, `Annulus.doubleIndex` | k; Field k; F,G | Explicit residue plus two constant/log cross terms; B(1,L)=1, B(L,1)=−1. |
| 213 | 2, `doubleIndex_self` | k; Field₀ k; F | Residue of f df is zero, cross terms cancel; includes p=2 coefficients ℚ₂. |
| 218 | 2, `doubleIndex_add_left` | k; Field₀ k; F₁,F₂,G | Convolution/residue and scalar cross terms are additive. |
| 224 | 2, `doubleIndex_laurent_first` | k; Field₀ k; f,G | For f=z,G=z⁻¹, both sides are −1. |
| 230 | 2, `doubleIndex_laurent_second` | k; Field₀ k; F,g | For F=z+2L,g=z⁻¹, both sides are −1; sign is negative residue. |
| 236 | 2, `doubleIndex_ext` | k; Field₀ k; bilinear B; alternation and Laurent-first law | Decompose F=f+aL,G=g+bL; alternation determines the missing cross term. Hypotheses do not contain the full conclusion. |
| 244 | 2, `doubleIndex_add_constants` | k; Field₀ k; F,G; a,b | Difference is a·G₂−b·F₂; (F,G,a,b)=(0,L,1,0) gives 1. |
| 251 | 2, `doubleIndex_scalarExtension` | k,l; Field₀ both; ring hom f; F,G | Identity extension and Q→Q₂ preserve coefficients, derivative and cross terms. Both fields' instances are explicit. |
| 259 | 2, first double-index example | ℚ | Values 1,−1,0,2,−1,0; uses kept definition, not admitted scalar-extension/alternation theorems. |
| 273 | 2, second double-index example | ℚ; arbitrary f,G in one conjunct | Nonconstant Laurent reductions, mixed z+2L case and constant shift computed from definitions. |
| 306 | 7, `SingleIntegral.UniversalAffine` | arbitrary type k | Pair carrier only; no claim that a pair constructs an integral. |
| 311 | 7, `SingleIntegral.specialize` | k; CommRing k; I,λ | A+Bλ; zero ring allowed, no denominator. |
| 315 | 7, first affine example | k; CommRing k; a,λ | Exact and zero values; direct reduction. |
| 321 | 7, second affine example | ℚ values plus generic CommRing k | Slopes 1 and 1/2 change by 2 and 1; generic subtraction is (λ′−λ)B including the zero ring. |

The following table records the README adversarial pass. Each row covers all statements, definitions, convention claims and auxiliary APIs in the listed target paragraphs, including the additional names inside those paragraphs. Line numbers refer to `packages/ColemanIntegrationPartII/README.md`. “No change” means no further defect found by these tests; it is not a claim that the future library proof has been formalized.

| Statement group and target-paragraph inventory | Instances tried | Result / change |
| --- | --- | --- |
| §1.1: `Graph.LengthCochains` (110); `LengthCochains.mk` (114); `LengthCochains.ext` (116); `LengthCochains.div_d_adjoint` (118); `LengthCochains.map` (120); `LengthCochains.simple_laplacian` (122); `Graph.simpleDivergence` (124); `LengthCochains.simpleCochainsEquiv` (126) | Empty graph, isolated vertices, one edge (2,5), loop with opposite flags, length 1/2 and reversal; adjoint sum gives −3c on the edge, weighted pairing 12 and divergence ±4. | Finite actual sets and positive rational lengths exclude infinite sums and zero denominators; native cochain comparison has the required minus sign. No change. |
| §1.2: `Graph.harmonic_exact_decomposition` (145); `harmonicProjection` (149); `harmonicProjection_changePotential` (151); `rationalLaplacian_rank` (153); `Graph.simple_harmonic_exact_decomposition` (155); `harmonicProjection_simpleCohomologyEquiv` (157) | Tree; disconnected two-vertex graph; cyclic (3,0,0) splits as (1,1,1)+(2,−1,−1); F₃ cyclic unit cochain is exact and harmonic; arbitrary characteristic-zero extension of Q. | Real rank transfers through rational matrices; uniqueness concerns cochains. S02 supplies the missing F₃ mirror. |
| §1.3: `Graph.harmonic_subdivision` (172); `harmonic_subdivision_comp` (176); `harmonic_subdivision_residue` (178) | One-piece identity; splitting length 1 into 1/3+2/3 and jump 6 into 2+4; attached tree; reversal. | Current c/ℓ remains constant and sum cᵢ²/ℓᵢ=c²/ℓ. No change. |
| §2.0: `Annulus.residueTransport` (202); `residueTransport_degree` (206); `residueTransport_germ` (208) | Identity, z=t², z=t⁻¹, constant map, quadratic residue field, infinite negative analytic tail. | Positive oriented degree and formal-meromorphic germ restrictions are explicit; residues are 1,2,−1. No change. |
| §2.1: `Annulus.LogarithmicFunctions` (222); `LogarithmicFunctions.mk` (226); `LogarithmicFunctions.ext` (228); `LogarithmicFunctions.residue_zero_iff` (230); `LogarithmicFunctions.changeParameter` (232) | C,L,2+3L,L²; polynomial images C and X; F₂ monomial z²; logarithmic coefficient zero with nonconstant Laurent part. | Degree-one presentation and kernel hypotheses agree with Lean; no multiplication-closure claim. No change. |
| §2.1a: `AnnulusLogRing.generalCoefficients` (248); `generalCoefficients_primitive` (252); `generalCoefficients_base` (254) | Q₂ L²/2, Q₃ L³/3; equal-characteristic-zero ultrametric coefficients; characteristic-p monomial; open versus closed annulus boundary; scaled coordinate with lift δ. | Integer divisions are valid in characteristic zero; open radii are retained for convergence. Coordinate lift is specified. No change. |
| §2.2: `Annulus.doubleIndex` (268); `doubleIndex_self` (272); `doubleIndex_laurent_second` (274); `doubleIndex_ext` (276); `doubleIndex_add_left` (278); `doubleIndex_reverse` (280); `doubleIndex_add_constants` (282) | B(1,L)=1, B(L,1)=−1, B(z,z⁻¹)=−1, B(L,L)=0, constants; F=z+2L with g=z⁻¹; constant shifts. | Residue sign and both cross terms are correct; uniqueness follows by decomposing both inputs. No change. |
| §2.3: `Annulus.doubleIndex_pullback` (296); `doubleIndex_scalarExtension` (300); `doubleIndex_shrink` (302) | Identity, degree-two map, reversal, scalar embedding Q→Q₂, shrinking the germ. | Signed degree is distinguished from absolute degree; coefficientwise extension commutes with the defining expression. No change. |
| §3.0a: `Semistable.colemanCover` (326); `colemanCover_restrict` (330); `colemanCover_refinement` (332) | Good reduction, ordinary node xy=π, self-node, subdivision with two distinct neighbors, finite splitting extension. | Loops are retained and comparison domains are owned here. No change. |
| §3.0b: `ColemanWideOpen.fullAnalyticExtension` (346); `fullAnalyticExtension_ker` (350); `fullAnalyticExtension_integrate` (352); `fullAnalyticExtension_map` (354) | Transcendental α and (1−αz)⁻¹; zero/scalar and log z; disconnected residue-disc indicator; opposite auxiliary constants. | Analytic coefficients are not identified with finite algebraic tensors; connected Coleman data supply the scalar kernel. No change. |
| §3.0c: `Curve.semistableDeRhamComparison` (368); `semistableDeRhamComparison_exact` (372); `semistableDeRhamComparison_cup` (374); `semistableDeRhamComparison_operators` (376); `semistableDeRhamComparison_baseChange` (378); `proof-plan paragraph` (380) | Smooth positive-genus model, global representative fₑ=0, total coboundary; diag(1,q), Ne₂=e₁; F₄ over F₂; scalar extension versus Frobenius square. | χ has the jump sign; N carries the metric length; q=Q_K^r and residue-degree iteration prevent the coefficient-lift error. No change. |
| §3.1: `ColemanWideOpen.doublePairing` (393); `doublePairing_eq_sum` (397); `doublePairing_constant_independent` (399); `doublePairing_restrict` (401); `wideOpen_residue_sum_zero` (403); `proof-plan paragraph` (405) | Zero form, no ends, rational wide open, positive-genus second-kind representatives with cup 1; global constant change. | End residues cancel globally, while a nonzero cup example prevents a zero definition. No change. |
| §3.1a: `ColemanWideOpen.doublePairing_reciprocity` (417); `doublePairing_analyticExact` (421); `doublePairing_logUnit` (423); `doublePairing_qRadical` (425) | G_m dlog class; q=2 versus reciprocal 1/2; nonsplit quadratic boundary over F₃ with eigenvalue −3; analytic exact form. | Boundary weights qζ suffice; the excluded reciprocal is not replaced by q. No change. |
| §3.2: `Semistable.HarmonicPrimitiveData` (440); `HarmonicPrimitiveData.mk` (444); `HarmonicPrimitiveData.ext_mod_constant` (446); `HarmonicPrimitiveData.linear` (448); `HarmonicPrimitiveData.jump_change` (450); `HarmonicPrimitiveData.jump_class` (452) | Two-component jump 2; one component; cyclic unit jump; component constant a_head=−2. | c changes by c−da, so the bridge normalizes to zero; nonzero cycle cannot be glued away. No change. |
| §3.3: `Semistable.auxiliaryDoubleIndex_formula` (466); `auxiliaryDoubleIndex_edgeReverse` (470); `auxiliaryDoubleIndex_changeConstants` (472) | c=2,d=3,Res η=5,Res ω=7; edge reversal; zero jumps; one-component constant change with nonzero puncture residue. | Correction is −11 in both orientations; premature constant independence is excluded. No change. |
| §3.4: `Semistable.correctedDoublePairing` (486); `correctedDoublePairing_eq_aux` (490); `correctedDoublePairing_cup` (492); `correctedDoublePairing_refinement` (494); `correctedDoublePairing_ext` (496) | P¹ with empty Z; good reduction; proper second-kind classes with cup 1; exchanging arguments; metric refinement. | Corrected ordered pairing has the right sign; proper H¹ is not replaced by holomorphic forms. No change. |
| §3.5: `Semistable.correctedDoublePairing_phi_N` (510); `correctedDoublePairing_phi_iterate` (514) | N=0; diag(1,q), Ne₂=e₁ with symplectic form; identity operator; unramified degree-two extension Q₂→K. | Scale q and skew-adjoint N checked; scalar extension and geometric Frobenius iteration remain distinct. No change. |
| §4.0: `NaturalIntegration.abelianLogCp` (539); `abelianLogCp_openQuotient_torsion` (543); `abelianLogCp_unique` (545); `abelianLogCp_functorial` (547); `abelianLogCp_ofFiniteModel` (549); `proof-plan paragraph` (551) | Zero-dimensional abelian variety, torsion point, small nonzero exponential, finite-model points, transcendental-j curve over Cp. | Torsion open quotient supports uniqueness without compactness or finite-model descent of A. No change. |
| §4.0a: `NaturalIntegration.abelianPrimitive` (564); `abelianPrimitive_differenceSplitting` (568); `abelianPrimitive_square` (570); `abelianPrimitive_invariant` (572); `abelianPrimitive_descent` (574) | Zero-dimensional A; invariant form; df; zero form with residue-disc constants; quadratic averaging; first and second finite differences. | Square/cocycle normalization removes locally constant ambiguity; normalized trace preserves a base-defined primitive. No change. |
| §4.0b: `NaturalIntegration.properAlbanese_exists` (589); `NaturalIntegration.albaneseReduction` (591); `albaneseReduction_rationalForms` (595); `albaneseReduction_removeApparentPoles` (597); `albaneseReduction_functorial` (599); `albaneseReduction_primitiveDescent` (601); `descendedLogForms_add` (603); `descendedLogForms_smul` (605); `descendedLogForms_split` (607); `descendedLogForms_tower` (609) | Spec k, P², E×E, pointed curve, A¹ dt, G_m dlog t; Q₃ form dt/(t²−2); dt at infinity; transcendental pole over C. | Traced logarithms handle nonsplit residues; Vandermonde spanning is limited to algebraic coefficients. General proper-Albanese existence now has an owner. S01 adds its easy signature. |
| §4.0c: `SingleIntegral.naturalIntegration` (630); `singleIntegral_universalAffine` (634); `singleIntegral_baseChange` (636); `singleIntegral_goodReduction` (638); `singleIntegral_exact_log` (640); `singleIntegral_cp` (642); `singleIntegral_closedFieldFixed` (644); `singleIntegral_geometricPrimitiveDescent` (646); `singleIntegral_abelianOpenQuotient` (648) | A¹, G_m integral 1→p, zero form, nonsplit quadratic form, transcendental-j Cp curve; completed maximal unramified field; K=Cp,Qp and nonclosed Qp-bar. | Closedness is essential to fixed-field equality; normalization descends coefficients. No finite-field compactness or p>2 hypothesis is smuggled into the all-prime construction. No change. |
| §4.0d: `Curve.naturalIndexReciprocity` (667); `naturalIndexReciprocity_principal` (671); `naturalIndexReciprocity_constants` (673); `naturalIndexReciprocity_finiteDegree` (675); `naturalIndexReciprocity_projection` (677); `naturalIndexReciprocity_rationalLine` (679) | Nonzero constant f versus f=0; separated versus intersecting supports; P¹ with dt and (t−a)/(t−b); z=t² and identity. | At infinity Res(log f dt)=a−b and the local index is b−a; positive finite degree accounts for ramification. No change. |
| §4.0e: `Curve.jacobianIntegrationBridge` (694); `jacobianIntegrationBridge_natural` (698); `jacobianIntegrationBridge_compact` (700); `jacobianIntegrationBridge_moving` (702) | P¹ Jacobian, split multiplicative elliptic curve, noncompact K× with valuation homomorphism; missing rational basepoint. | Compactness applies only over finite K; the open subgroup generated by rational differences suffices. No change. |
| §4.1: `Semistable.dlog_residue_is_exact` (716); `dlog_residue_orthogonal_harmonic` (720) | xy=π, f=x; nonzero constant, zero function; exact and logarithmic global primitives. | Residue is ord_head−ord_tail=−d(ord); f=0 excluded. No change. |
| §4.2: `Semistable.harmonicPrimitive_eq_singleIntegral` (734); `harmonicPrimitive_divisor_eq` (738); `harmonicPrimitive_goodReduction` (740) | Tree, one component, cycle; df/dlog f; Tate q=p³ at valuations 1/3 and 2/3. | Comparison is restricted to smooth residue domains, not an entire connecting annulus. No change. |
| §4.3: `Semistable.singleIntegral_on_annulus` (755); `singleIntegral_annulus_reverse` (759); `singleIntegral_annulus_baseChange` (761) | F_tail=2,c=6,t=1/3; reversal; c=0; t=0,1 by continuation; quadratic refinement; Tate valuation terms. | Both orientations give 4; two refined jumps are 3+3, not 6+6. No change. |
| §4.4: `Semistable.globalDoublePairing_eq_pointSum` (776); `globalDoublePairing_exact` (780); `globalDoublePairing_constants` (782) | Empty puncture set with regular forms; second-kind cup 1; cycle with nonzero graph correction; constants and exact forms. | Holomorphic isotropy is consistent with zero empty point-sum; nonzero proper classes use second-kind representatives. No change. |
| §5.1: `Annulus.TripleIndexData` (806); `TripleIndexData.mk` (810); `TripleIndexData.ext` (812); `TripleIndexData.changeConstant` (814); `TripleIndexData.pullback` (816); `TripleIndexData.linearCombination` (818) | All L with half-squares; all zero; labelled zero slot with primitive constants (1,−1) versus (1,0); simultaneous pullback. | Data are actual primitives satisfying pair equations; diagonal constants are constrained. No change. |
| §5.2: `Annulus.tripleIndex` (832); `tripleIndex_unique` (836); `tripleIndex_symm` (838); `tripleIndex_threeTerm` (840); `tripleIndex_meromorphic` (842) | T(1,1;L)=1; T(z,z;z⁻²)=−2; T(z,z⁻¹;L)=1; all L gives 0 also over Q₃. | Trilinearity refers to compatible transported auxiliary data; no false unlabelled trilinearity claim. No change. |
| §5.3: `Annulus.tripleIndex_changeConstant` (856); `tripleIndex_changeBoth` (860) | F=L,G=0,H=L with G,H constants (1,−1); Res dF=0; shift C=2; F,G-only shift. | Values −1 versus 0 and change −2 detect real choice dependence. No change. |
| §5.4: `Annulus.tripleIndex_simplePoles` (874); `tripleIndex_simplePoles_zeroConstantPrimitives` (878) | F=2+L,G=3,H=L with indicated primitives; all L; scaled parameter u=az. | Value 6 and coordinate-dependent constant term −log a agree with the local normalization formula. No change. |
| §5.5: `Annulus.tripleIndex_pullback` (892); `tripleIndex_pullback_comp` (896) | Degree two, identity, reversal; pull back functions but independently shift one primitive. | Scale 2 or −1 only for transported data; unrelated primitive shift contributes the stated residue error. No change. |
| §6.0: `ColemanWideOpen.formSymbolRelations` (920); `formSymbolRelations_kernel` (924); `formSymbolRelations_restrict` (926) | Analytic exact g; nonzero tensor [dG]⊗η; actual zero form G dC; two presentations of one form. | Kernel containment is owned as a connection-realization theorem, not assumed merely from a symbol quotient. No change. |
| §6.1: `ColemanWideOpen.tripleIndex` (940); `tripleIndex_eq_endSum` (944); `tripleIndex_globalChoices` (946) | Zero triple, rational wide open, positive-genus B_U(F,H)=1 with G=1. | Global sum can equal 1 even though dG=0; the construction does not factor through all three differential classes. No change. |
| §6.2: `ColemanWideOpen.tripleIndex_laws` (960); `tripleIndex_congr` (962); `tripleIndex_add_const_second` (966); `tripleIndex_const_third` (968); `tripleIndex_restrict` (970) | Add 2 to second slot with B=1; global versus single-end primitive shift; constant third slot; equal function presentations. | Global residue cancellation precedes congruence; only compatible global shifts cancel. No change. |
| §6.3: `ColemanWideOpen.tripleIndex_frobenius_vanishing` (984); `tripleIndex_frobenius_iterate` (988) | F=0; q=2 over Q₂ and q=4 over unramified quadratic K; G=1 with arbitrary F; reciprocal functional eigenvalue. | Both required q-eigenclass premises are retained; forbidden eigenvalue is 1/q. No change. |
| §6.4: `ColemanWideOpen.colemanFormPairing` (1002); `colemanFormPairing_unique` (1006); `colemanFormPairing_relation` (1008); `colemanFormPairing_restrict` (1010) | 1·dH, zero form G dC, relation G dH+H dG=d(GH), overlapping presentations. | Uses §6.0 actual-form kernel containment and §6.3 vanishing; no tautological presentation-independence premise. No change. |
| §7.0: `TateCurve.uniformizationDifferential` (1034); `uniformizationDifferential_pullback` (1038); `uniformizationDifferential_charts` (1040) | q=p³, n=1 loop, n=2 parallel edges, q=1 excluded, p=2. | Point uniformization and differential normalization are separate inputs; dlog(z/q)=dz/z. No change. |
| §7.1: `SingleIntegral.branchTransport` (1054); `SingleIntegral.UniversalAffine k` (1058); `branchTransport_comp` (1060); `branchTransport_exact` (1062) | Branch 0→2 at p and uniformizer of ramification e=2; valuation unit versus field unit; affine (a,0),(0,1),(0,1/2); zero ring; constant-shifted local index. | Differences are 2,1 and (λ′−λ)B; derivative alone does not imply index branch independence. No change. |
| §7.2: `SingleIntegral.properHolomorphic_branchIndependent` (1082); `properHolomorphic_universalCoefficient_zero` (1086) | P¹, elliptic curve over finite K, transcendental-j Cp curve; nonproper G_m; finite endpoint extension. | Properness kills the universal slope via geometric abelian logarithms; full closed-field scope is retained. No change. |
| §7.3: `SingleIntegral.coefficientTrace` (1100); `coefficientTrace_tower` (1104); `singleIntegral_galois` (1106); `primitive_galois_average` (1108) | Identity extension, tower, base-defined form, diagonal endpoints; ramified quadratic extension at p=2; α²=π. | Trace of an embedded value is degree times it; Tr(α²)=2π while Tr(α)=0. No change. |
| §7.4: `Curve.divisorSingleIntegral` (1122); `divisorSingleIntegral_split` (1126); `divisorSingleIntegral_ext` (1128); `divisorSingleIntegral_add` (1130); `divisorSingleIntegral_baseChange` (1132) | D=[t²−π]−2[0] and ω=t dt gives π; D=0 with no K-point; single quadratic point minus one rational point. | Closed-point degree and embeddings counted correctly; temporary basepoint cancels precisely at degree zero. No change. |
| §7.5: `Curve.tracedLocalIndexSum` (1146); `tracedLocalIndexSum_split` (1150); `tracedLocalIndexSum_tower` (1152); `tracedLocalIndexSum_congr` (1154); `tracedLocalIndexSum_bilinear` (1156); `tracedEndIndexSum` (1158) | Quadratic closed point with local residue 1; infinity residue −2; rational point, empty set; trace of α² versus product of traces. | Whole scalar indices are traced; split sum gives 2−2=0. No change. |
| §7.6: `Curve.integrationRealization_descent` (1172); `integrationRealization_commonExtension` (1176); `integrationRealization_divisor` (1178); `wideOpenIndex_galoisDescent` (1180) | Good reduction; splitting extension and further ramification; unrelated component triple shifts; connected wide open with quadratic constants. | Common-extension comparison is earlier than model descent; only the stated wide-open triple construction descends. Constant-field trace contributes 2. No change. |
| §7.7: `TateCurve.singleIntegral_normalization` (1195); `TateCurve.singleIntegral_q_periodic` (1199); `TateCurve.singleIntegral_branch` (1201) | q=p³ and log p=1; n=1,2; q=1; ramified normalization v_p=νπ/e; p=2. | Jump is −log(q)/n, q-periodicity cancels log q, and the branch slope cancels exactly. No change. |


Static policy checks found one `import Mathlib`, one used Tau Ceti module import, the required namespace/module docstring and README-ordered layer comments. There is no admitted data, admitted example, `set_option`, `lemma` declaration, `True` placeholder, empty condition field or conclusion-as-hypothesis substitute. All Lean named declarations appear in the README. The remaining omitted analytic, cohomological and triple-index headlines require carriers not yet at the pins; no substitute carrier has been forced into the file. S01 is the newly easy exception.

Each definition's subsection has at least three README Check bullets; the kept Lean definitions are tested in four pairs of example blocks. Those checks discriminate nonzero values, signs, logarithmic coefficients, nonconstant Laurent terms, polynomial degree or branch slopes. S02 is the additional statable negative control still missing. No computational algorithm or pull-request/process narrative was found in the README or docstrings. The head diff against origin/main stays within `packages/ColemanIntegrationPartII/`; existing review/repair artifacts in that folder do not change this boundary.

## Not verifiable

- **Lean elaboration and elaborated binder output:** no Lean command or build was run, as required. The 29 declarations and proposed S01/S02 repairs were inspected against source signatures; this report does not certify tactic execution or claim to have printed elaborated types.
- **Future heavy constructions:** analytic Coleman coefficients, cohomological comparisons, natural integration and triple auxiliary data remain roadmap targets. Their eventual formal proofs cannot be certified from this package. The audit checks their mathematical statements, boundary cases, source support and ownership, not nonexistent compiled implementations.
- **Unreadable sources:** none among the seven cited works. No missing-reference request is needed. No additional source was fetched outside the authorized sources workflow.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b6ffff293680a8d5725ef7ab22f2ff107233892f", "job": "RT-ColemanIntegrationPartII~2a", "model": "gpt-6-astra", "worker": "chris-2"} -->
