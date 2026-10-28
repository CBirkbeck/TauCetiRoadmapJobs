<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1056#issuecomment-6394051675 -->
Review (codex) of 8f51f44

Verdict: needs_changes

1. **F01** (P1) The Noether divisor is put over the wrong base

   **Location:** README:1591 and :1597, “Ξ_S ∈ D̂iv(S/k)”, with k allowed to be ℚ.

   **Claim:** The same divisor over S/k carries arithmetic finite-place and archimedean Green values, and then has a geometric image over S_ℚ/ℚ.

   **Witness:** For S = Spec ℚ, D̂iv(S/ℚ) = 0 and its analytic base is trivially valued. The arithmetic divisor in yuan-2026 lines 3040–3047 is instead on S/ℤ; lines 3070–3074 separately take its geometric image.

   The package's own unit type-0 node of genus two requires g_Ξ = δ + ε = 1 + 1/6 = 7/6. The zero divisor over the trivially valued point cannot carry that value or an archimedean value. This also makes the final “image” sentence ill-typed when k = ℚ: it would already be in the geometric target.

   **Exact repair:** For S as stated over either ℤ or ℚ, construct Ξ_S in D̂iv(S/ℤ), and use the arithmetic w and λ̄_S there. State the separate forgetful/base-change map D̂iv(S/ℤ) → D̂iv(S_ℚ/ℚ) and the equality of its image with E + Δ. Change the API accordingly. Retain a negative-control Check on Spec ℚ distinguishing the arithmetic carrier from the zero geometric divisor group. Tested: the arithmetic carrier supports 7/6 at the unit node, whereas its geometric image over Spec ℚ is zero. The source makes exactly this distinction.

2. **F02** (P1) The projective-height comparison loses the base-field degree

   **Location:** README:53 and :761, “equals HeightsRationalPointsAndObstructions §0.11 normalized height”.

   **Claim:** The absolute arithmetic height defined at :748 equals that supplier's relative height for every number field K.

   **Witness:** `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:236` defines h_K using [L:K]; :244–245 gives h_ℚ(i)([1:2]) = 2 log 2 and absolute height h_K/[K:ℚ]. Here :748 gives log 2.

   **Exact repair:** In the supplier contract and §4.6 API, state h_L̄ = h_K/[K:ℚ] for max-metrized O(1) over number fields; keep the geometric comparison with its fixed constant field. Add the quadratic example. Tested: (2 log 2)/2 = log 2. The existing §4.9 intersection adapter and the Moriwaki relative normalization should retain their degree factors; they already give the correct answers.

3. **F03** (P2) The new local comparison omits scalar-extension and quotient maps

   **Location:** README:806, “is the metric ... on the fibre ... over v”, and the ensuing equality of local measures.

   **Claim:** The supplier's local metric and measure and the global analytic fibre's metric and measure have the same domain.

   **Witness:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5661` uses the completed algebraic closure C_v. Here README:435 uses X(ℂ)/conjugation at a real place. For ℙ¹/ℚ, i and −i are distinct upstairs and one point downstairs.

   **Exact repair:** Name p_v : X_Cv^an → X_Kv^an, identify the latter with the appropriate global fibre, and compare the supplier metric with p_v's pullback of this metric. Compare measures by pushforward along p_v, retaining the positive-degree divisor for probabilities. Use the scalar-extension measure comparison of TropicalAndBerkovichArithmetic §6.2 and real descent as in GrossZagierAndArithmeticHeights §2.13. Extend the stated comparison to the boundary limits, rather than calling p_v a homeomorphism. Tested: p_v*(½δ_i + ½δ_−i) is the unit Dirac mass of the quotient point; total mass 2 remains 2 before probability normalization. Both metrics have the same pulled-back norm, despite different domains.

4. **F04** (P1) Signed integrable products are attributed to a positive-measure supplier

   **Location:** README:71, “includes signed mixed products”, and :806, “for integrable bundles the local measures of ArithmeticDynamics §4.1a”.

   **Claim:** ArithmeticDynamics §4.1a supplies mixed products for arbitrary integrable bundles.

   **Witness:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5679–5693` assumes one semipositive L and defines c₁(L̄)^n. Its O(−1) Check explicitly excludes that input. Here §2.6 admits O(−1), with mass −1.

   **Exact repair:** Limit the supplier contract to positive projective top powers and their continuity. Assign polarization, signed decomposition independence, and the mixed extension to this roadmap's §2.6, using its named finite-place inputs and the declared complex-current contract. In §4.9 first compare semipositive top powers, then state and derive the mixed integrable comparison from this extension. Tested: O(2) gives mass 2 on both supplied positive constructions; O(−1) gives −1 only after the owned signed extension. This retains the general theorem and avoids inventing a stronger supplier statement.

5. **F05** (P1) The vertical-group API includes nonintegrable metrics

   **Location:** README:1265 and :1273, “Equals {O(E) : E adelic with underlying divisor 0}.”

   **Claim:** Every continuous adelic metric on the trivial bundle belongs to the integrable kernel defining P̂ic_vert.

   **Witness:** On E(ℂ) = ℂ/(ℤ+iℤ), the continuous conjugation-invariant function f = Σ(n≥1) 2⁻ⁿ cos(2π4ⁿx) has Laplacian Fourier coefficient −2π²8ⁿ at frequency (4ⁿ,0), unbounded. A finite signed measure has bounded Fourier coefficients.

   Take the rational elliptic curve with j = 1728 and put this metric on the trivial line at infinity, with the trivial model metrics at finite places. This is an allowed continuous model adelic divisor (0,f): uniform convergence follows from Σ2⁻ⁿ = 1. If it were integrable, its local curvature would be a difference of positive finite measures on the compact curve, contradicting the coefficient calculation. The left-hand kernel therefore excludes it, while the displayed right-hand set includes it. The conventions permit continuous metrics, not only smooth or integrable ones.

   **Exact repair:** Require E to be an **integrable** adelic divisor in both equivalent descriptions, or say explicitly that O(E) must lie in P̂ic_int. Preserve the quotient by principal trivializations. Add a continuous nonintegrable negative control. Tested: constant f = 1 gives curvature 0 and a vertical integrable class; the series above fails the signed-measure condition and is excluded by the repaired right side. No continuity or generality of the ambient adelic group needs to be removed.

6. **F06** (P2) Rational scaling is asserted inside an integral carrier

   **Location:** README:318, “positive rational multiples of nef bundles are nef”.

   **Claim:** Arbitrary positive rational scalar multiplication is an operation on P̂ic(U/k)_nef as defined in §1.3.

   **Witness:** Let U = ℙ¹_k, projective over a trivially valued field. Section 1.3 requires an integral underlying line bundle. O(1) is nef, but a half has degree 1/2 and is not an integral line bundle on ℙ¹.

   **Exact repair:** State closure under addition and positive integer multiplication in the integral group. Explicitly introduce the rationalized nef cone in P̂ic(U/k)_ℚ and state positive rational closure there. Add a Check distinguishing O(1) from ½O(1). Tested: the latter has degree 1/2 in the rationalized group and no preimage of that degree in Pic(ℙ¹) = ℤ. This follows the package's explicit-rationalization convention at :21.

7. **F07** (P3) Two definitions have fewer than three discriminating Checks

   **Location:** README:964–975 (§6.3) and :1250–1261 (§8.5); each has exactly two Check bullets. The second pair both concern the same adjunction identity.

   **Claim:** The repair report says every definition retained at least three Checks. The Néron–Tate limit and canonical section divisor are definitions, and neither meets that requirement. Their API is also embedded in the theorem paragraph rather than the required definition API list.

   **Witness:** Counting the bullets at :972–973 gives 2; counting :1258–1259 gives 2. Substituting a = 1 in the second §8.5 bullet merely specializes the first adjunction Check.

   **Exact repair:** Supply a prose API list and at least three genuinely different Checks for each definition. For §6.3 retain the torsion/quadratic test, add a quadratic-number-field normalization test (relative height 2a versus absolute a), and a zero-polarization test (all heights 0, so the torsion converse fails without bigness). For §8.5 test fibre degree 1 versus the trivial line's 0, evaluation against a base O(c) (both sides have shift c, not 0), and adjunction at x*w = 1 (−1 versus +1). These computed tests separate the named wrong models. Keep them in the README.

8. **F08** (P3) The height source line points into the preceding proof

   **Location:** README:748 and :806, “yuan-2026 line 2131”.

   **Claim:** The line locator supports the stated height normalization in §4.1.2.

   **Witness:** yuan-2026 line 2131 is a relative-power intersection calculation. Section 4.1.2 begins at line 2146; the arithmetic and geometric normalization formulas are at lines 2164–2170, printed p. 64.

   **Exact repair:** Replace both line pointers by 2146–2170, retaining §4.1.2, pp. 63–64. Tested: the new locator explicitly distinguishes [K(x):ℚ] from [K(x):K], and gives the factor 2 in R02. The section and page locator were already correct.

Eight findings: four P1, two P2 and two P3. The scope is a repairable Part II extension. The mathematical interfaces, rather than Lean elaboration, prevent acceptance. No package input was edited.

The previous review and repair report were checked first. None of F01–F11 was marked “not actionable in this package”; no settled finding is re-raised.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 redundant supplier gaps | Repaired | README:103 and :107 now cite numbered TropicalAndBerkovichArithmetic and GrossZagierAndArithmeticHeights sections. “Consume §2.2 (the Arakelov probability form μ_Ar)” resolves at the latter's head. Only the singular-pluripotential gap remains in both README and plan. |
| F02 geometric positivity ownership | Repaired | README:91 assigns geometric nefness, volume and bigness here; :193 adds “Geometric case”. On ℙ¹, h⁰(O(am)) = am + 1 and vol(O(a)) = a for a ≥ 0; the geometric Siu bound for 2−1 is 1. |
| F03 absent comparison | Partly repaired | README:806 adds “induces a group isomorphism ι_X”. The comparison now exists and the degree adapter is correct, but its local metric/measure clause has the defects R03–R04. |
| F04 supply direction | Repaired | README:1977 says “HeightsRationalPointsAndObstructionsPartII consumes”. Its merge position 291 is after this roadmap's 269; the former consumers at 229 and 268 are gone. |
| F05 genus uniformity | Repaired | README:3 says “constants depending only on g”; :1962 says “For fixed g”. The displayed lower constants are 4⁻¹⁶/12 and 4⁻³⁶/12 at g = 2, 3, so no genus-independent constant is asserted. |
| F06 false domination Check | Repaired | README:400 uses “D′ = ([2], c)”. Its differences are (0,c) and (2[2],c), both effective for c ≥ 0; (0,c)−([2],0) still has negative coefficient at 2. |
| F07 fragments and numbering | Repaired | README:443 states the exp(−g) correction coherently; :1202 supplies the missing pullback; :1945 gives the complete lower-bound route. Layer 0 is §§0.1–0.3 and Layer 5 is §§5.1–5.4. |
| F08 prose and Checks | Partly repaired | “*Route.*” replaces the broken template and the doubled supplier names are gone. The claim that every definition retained three Checks is false: §§6.3 and 8.5 each have two bullets (R07). |
| F09 dependencies and ordering | Repaired as requested | README:392 makes domination §1.9, before effective sections; :212 and :824 contain the missing external dependencies. The newly explicit §0.11 height comparison exposes R02. |
| F10 locators | Repaired at the reported locations | README:1002 and :1076 point to yuan-2026 lines 3621 and 3531; :955 now cites Gao–Habegger Proposition A.1(5). SchemeAndStackFoundations section numbers resolve. The same stale-line pattern survives elsewhere (R08). |
| F11 positive genus | Repaired | README:23 says “genus g ≥ 1”. The routes at :1078 and :1202 use a positive-degree admissible bundle at g = 1; the defect changes by eβ rather than 0β. The two genus-one identities in §9.1 give 0 = 0 and 4x*w = 4x*w. |

All locations below are in `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md`, unless another file is named. Quotations identify package text, not source passages.

## Verified sound

I read all four package inputs, all 91 numbered README subsections and all 14 layer endings, the previous review and repair report, the board-package index, the declared gap, the merge order, and the relevant current supplier texts. The following is bounded evidence, not a claim that elaboration proves the mathematics. For unchanged material I reused the previous review only where it supplied numerical or symbolic computed values; the new comparison, repaired passages, genus-one extensions, sampled targets and supplier citations were reviewed afresh. The table below includes an entry for every numbered subsection and additional rows for changed statements and conventions.

### Seeded source verification

All 15 requested targets were checked in the cached legal texts. “Supports” means that the hypotheses and normalization at the specified locator agree, subject to the explicit findings; it does not mean a proof was formalized. No author-marked unverified locator was present beyond the two settled uncertified works discussed below.

| Target | Locator actually read | Result |
| --- | --- | --- |
| 1.2 boundary norm | yuan-zhang-2025 lines 1291–1346, Lemma 2.4.1 and Remark 2.4.2, pp. 37–38 | Extended norm, torsion exception, equivalent boundaries and completion supported. Projective field case is discrete. |
| 1.5 positivity | yuan-zhang-2025 lines 1508–1532, Definition 2.5.2, pp. 42–43; lines 5106–5127, Definition 5.1.1 and Lemma 5.1.2, pp. 133–134 | Definitions supported; integral/rational closure must be separated (R06). |
| 2.4 divisorial density | yuan-zhang-2025 lines 2417–2460, Lemma 3.1.1, pp. 67–68 | Positive-dimensional field case, arithmetic case and rescaling toward trivial valuations supported. |
| 4.3 Hilbert–Samuel/Siu | yuan-zhang-2025 lines 5396–5470, §5.2.1 and Theorems 5.2.1–5.2.2, pp. 140–141 | Nefness, dimension and mixed-intersection factor d retained; arbitrary-field geometric approximation supported. |
| 4.9 carrier comparison | yuan-zhang-2025 lines 1533–1559, §2.5.3, pp. 43–44; lines 5945–5994, §5.3.1, pp. 152–153; yuan-2026 lines 2146–2170, §4.1.2, pp. 63–64 | Colimit and height adapter supported. This is a comparison with a named supplier, not a theorem of either paper about that supplier. Current supplier domains give R03–R04; line pointer gives R08. |
| 5.3 non-degenerate inequality/equidistribution | yuan-zhang-2025 lines 7503–7570, §6.2.2 and Theorems 6.2.2–6.2.3, pp. 188–189 | Non-degeneracy, genericity and smallness retained. Nefness and a generic height-zero sequence force the variety height to zero before applying equidistribution. |
| 7.1 abelian admissible metrics | yuan-2026 lines 3621–3639, Theorem A.3, pp. 107–108 | Even eigenvalue 4, odd eigenvalue 2, and constant ambiguity supported. |
| 7.4 canonical pair | yuan-2026 lines 3531–3594, Theorem A.1, pp. 104–106; lines 3800–3865, proof, pp. 112–114 | g > 0 supported. Read the pairing argument as well as the theorem; using positive-degree L repairs its genus-one gap. |
| 8.4 twice theta/Poincaré | yuan-2026 lines 1008–1021, Definition 2.4, p. 30; lines 1123–1125, p. 33; yuan-zhang-2025 lines 7212–7226, Theorem 6.1.1, pp. 180–181 | Dual sign, rigidification, integral invariant extension and q = 4 agree. JacobianChallengePartII supplies the algebraic bundles, not their new adelic extension. |
| 10.2 graph inequalities | cinkir-2011 lines 177–188, Theorem 2.9, p. 5; de-jong-2018 lines 1508–1513, Proposition 9.2, p. 31; baker-rumely-2007 lines 1953–1965, Lemma 14.4, p. 37 | Effective canonical divisor, g > 1, constants and de Jong identity retained. |
| 10.3 local φ | yuan-2026 lines 1642–1690, §3.3.1, pp. 48–49; zhang-2010 lines 206–238, Theorem 1.3.1 and definitions, pp. 6–7 | Nonarchimedean normalization and archimedean positive-eigenvalue convention agree. The separate source δ slip is not imported. |
| 10.10 Gross–Schoen | zhang-2010 lines 206–254, Theorem 1.3.1 and Corollary 1.3.3, pp. 6–7; yuan-2026 lines 1817–1841, pp. 53–54; gross-schoen-1995 §§6–8, especially lines 713–800, pp. 670–672 | Canonical degree-one class, rational Chow coefficients, cycle-height correction and relative variation agree. The special modified-diagonal pairing is supported without assuming a general conjectural cycle-height theory. |
| 10.13 Ξ | yuan-2026 lines 3030–3075, §4.5.2, pp. 90–91 | Green values supported; arithmetic base disagrees (R01). |
| 10.14 obstruction | yuan-2026 lines 1995 onward, Remark 3.11, p. 59; lines 3076–3087, Remark 4.13, p. 91 | Hybrid continuity obstruction supports the non-globalization statement; zero-correction special families remain allowed. |
| 13.2 global invariants | yuan-2026 lines 2884–2898, §4.5.1, pp. 85–86, and lines 2992–3026, §4.5.2, p. 89 | Place weights, ε∞ = 0, raw-degree extension scaling and separate absolute arithmetic normalization agree. |

The source versions were those recorded in `sources.toml`: in particular the Yuan author manuscript and the cited Yuan–Zhang book extraction, with printed page numbers rather than the PDF viewer's offset. I did not substitute a newly published numbering.

### Pinned libraries, headline signatures and padding

The requested `lake env lean` elaboration of `packages/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean`, run from the pinned content checkout, completed with no output or warnings. It has one `import Mathlib`, one module docstring, its namespace, and **zero declarations**. There are no TauCeti imports requiring a build, no sorry'd data, no options, and no padding. The `#check @name` comparison and one-tactic probe both have zero targets; no declaration or hypothesis changed. No broader build or update was run.

| Declaration opened at the pin | File and line | What it supplies, and what it does not |
| --- | --- | --- |
| `NumberField.prod_abs_eq_one` | `Mathlib/NumberTheory/NumberField/ProductFormula.lean:98` | Product formula with x ≠ 0 and infinite-place multiplicities; not an absolute normalization of native height. |
| `Projectivization.logHeight` | `Mathlib/NumberTheory/Height/Projectivization.lean:51` | Relative height under field, finite-index and admissible-absolute-value assumptions; quadratic base gives 2 log 2 on [1:2]. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112` | Full subcategory of rank-one locally free module sheaves; its morphisms need not be isomorphisms and it has no metric. |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group object; includes dimension zero and has no height or metric. |
| `InvertibleSheaf.eulerDegree` | `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70` | Difference of Euler characteristics through H¹; not an arithmetic intersection or a finite-dimensionality assertion. |
| `LineBundleClass.eulerDegree` | `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:126` | The isomorphism-class version of that algebraic degree. |
| `InvertibleSheaf.eulerDegree_canonicalBundle` | `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:168` | 2g−2 under the file's explicit proper, integral, Noetherian, separated, DVR/coheight, valuative-existence and function-field/constants hypotheses. |

Object searches in both pins covered adelic Picard/line bundles, arithmetic volume/intersection, metrized graphs/resistance, Berkovich spaces, Deligne pairings, Arakelov metrics and Faltings heights. The necessary completed/metric carriers are not present. Existing ordinary algebraic degrees were opened and are explicitly imported, not replanned. The headline families listed in the module docstring are: metrized and adelic Deligne pairings; arbitrary-base realizations; Hilbert–Samuel/Siu and height inequalities; invariant extensions/non-degenerate equidistribution; Hodge/Faltings identity; Moriwaki heights and specialization; canonical admissible metrics and relative Hodge index; theta identities and nefness; graph inequalities and ε/φ/Noether/Gross–Schoen formulas; uniform archimedean φ positivity; geometric/arithmetic bigness; potential bigness and its three theta applications; the product-grid degree bound; and global canonical-square/Faltings comparisons. Each requires the missing carrier named there. The new §4.9 likewise needs the two unavailable adelic carriers; it cannot be replaced by a theorem about free scalar variables. No statable native headline was found omitted, and no claim about a native ordinary degree was substituted for a metrized theorem.

### Ownership and suppliers

The board-package index was read before checking absence. The roadmaps service was used to search objects on main and at indexed open heads, and to open the suppliers. Searches covered Deligne pairings, Faltings heights, admissible metrics, adelic Picard groups, Moriwaki heights, metrized graphs and potential bigness; the resulting apparent overlaps were resolved by their actual statements. References to Faltings heights in unrelated automorphic/isogeny roadmaps do not construct this arbitrary-base admissible theory. The local base library and three main-roadmap style examples were read, including SchemeAndStackFoundations, ComplexTori and Completed/AlgebraicCodingTheory.

| Supplier | Resolved sections and ownership boundary |
| --- | --- |
| ArakelovGeometryAndAbelianHeights | §§1.1–1.3, 1.7–1.10, 1.12–1.15, 2.1, 2.7–2.8, 3.4, 5.0b, 5.3–5.4, 5.9, 6.5 at head f2895a4. Hermitian degree, projective arithmetic foundations, Hodge/Faltings normalization, stable extension and Bost remain there. Continuous arbitrary-base completion and family pairings are the extension here. |
| HeightsRationalPointsAndObstructions | §§0.11, 0.16, 0.18–0.20, 0.26–0.29, 5.17a–5.17f at head 82cf8af. Projective intersections and positivity remain there. Its relative point-height normalization causes R02, while its normalized intersection adapter agrees with §4.9(3). |
| ArithmeticDynamics | §§4.1, 4.1a, 4.3, 4.3a, 4.4, 4.40 at head e1dd455. Global-field completion and general equidistribution are imported. The later roadmap owns comparison with its new arbitrary-base carrier. R03–R04 delimit what the supplier actually supplies. |
| SchemeAndStackFoundations | Main §§0.3, 0.20–0.21, 3.5, 4.11–4.12, 5.1–5.3, 5.5–5.6, 5.12. Norms at README:4876; Chow/pushforward at :6567/:6653; Chern class :6701; exterior product in §5.5; intersections :6921; Bézout :7336. Geometric nefness and volume are now correctly owned here. |
| TropicalAndBerkovichArithmetic | §§0.1, 0.12, 0.15, 0.22–0.23, 2.7, 2.13, 3.1, 3.3, 6.1–6.4, 6.6–6.8 at head 44a1641. Analytic substrate, skeleton, Laplacian, Green kernel and model metrics/measures remain there. Arithmetic Banach-base gluing and global ε/φ divisors are here. |
| GrossZagierAndArithmeticHeights | §§2.2–2.4, 2.8, 2.10, 2.12–2.13 at head 648f059. Curve Green kernels, admissibility, residue isometry and real descent are imported; family adelic extensions and Gross–Schoen variation are distinct targets. |
| JacobianChallengePartII | §§1.2–1.4, 2.2, 2.4–2.7, 3.1, 3.3–3.13, 4.5–4.9, 5.1–5.2, 6.3 at head 79cf245. Algebraic Jacobian, Poincaré, theta and Abel constructions are imported. Signs x ↦ dx−α, Θ = Δ*P∨ and j(x,y)=y−x agree. Relative arbitrary-degree metrized identities extend the narrower supplied degree-one field-valued identities. |
| NeronModelsAndSemistableAbelianVarieties | §§3.3, 3.9–3.12 at head 3710abd. Semistability, reduction and extension inputs resolve with their stated DVR/excellence hypotheses. |
| MotivesAndAlgebraicCycles | §§2.2–2.3 at head 79b02f6. Cycle classes/cohomology are inputs, not a substitute for the special Gross–Schoen height construction owned here. |
| ComplexComparisonPartII | C5.4 at head 2d50a88, README:3019 onward, supplies currents on smooth complex manifolds. The singular extension is precisely the declared gap, not falsely claimed to exist. |
| StableReductionPartII | `packages/StableReductionPartII/design/README.md` and plan contain every consumed MC.4–MC.6 target: fine level, Hodge determinant, Noether, boundary thickness, stable/level compactifications, maximal variation and both arbitrary-field Hodge positivity and finite-cover descent. The latter statements are at design README:22338 and :22376. The resolver's single “no roadmap ... on main or in an open pull request” lead is a false positive for this declared earlier board design. |

No duplicate fully qualified Lean name is possible here because there are no declarations. No additional owner of the arbitrary-base extension, signed extension comparison or relative global invariant construction was found in the searched main/open/board material. This does not claim inspection of unpublished branches outside the supplied index.

The gap `singular-pluripotential-products` occurs in both `design/plan.json` and README:97, names ComplexComparisonPartII C5.4, and asks for locally bounded plurisubharmonic products, continuity and compatible semipositive regularization on possibly singular projective varieties. Its hypotheses and requested compatibility are precise. The smooth supplier does not already provide this singular extension; it is a coherent minimal contract, not an unowned prerequisite. It would be an acceptance condition after the blocking defects are repaired.

All `*Needs:*` lines and supplier paragraphs were read. The requested mechanical check returned:

```text
depcheck: 48 roadmaps, 548 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. ArithmeticDynamics is at merge-order position 268, this package at 269, and its named consumer HeightsRationalPointsAndObstructionsPartII at 291. The stale board copy of ArithmeticDynamics mentioned by the repair report was not substituted for its supplied open head. The remaining content-level supplier defect is R04; mechanical name resolution cannot detect it.

### Computed adversarial pass

In the tables, “retained” means the stated numerical/symbolic test survives; it is not a claim that a finite sample proves a universal theorem. Sources and hypotheses were checked separately above. Unchanged computed examples from round 1 are retained only with their values displayed. Denominators, zero degree, characteristic and genus boundaries are tested where the construction admits them: zero rings and empty curves are excluded by integral/relative-curve hypotheses, and group tests here concern Picard groups, not arbitrary nonabelian groups.

| Statement | Instances tried | Values on the two sides / competing models | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Green function sign | Spec ℤ, norms e⁻¹ and e⁻²; principal 2 | Degrees 1 and 2; tensor degree 3 = 1+2; principal degree log 2−log 2 = 0 | Retained | None |
| Conventions: squared norm | Parent Green function versus this Green function | For norm e⁻¹: parent 2, here 1; exp(−2/2) = exp(−1) | Retained | None |
| Conventions: absolute/relative height | [1:2] over ℚ and ℚ(i); [1:t] after t=u² | Absolute log 2 in both number fields; relative log 2 and 2 log 2; geometric 1 and 2 | Internal convention correct; supplier equality false | R02 |
| Conventions: Faltings/Deligne | g = 1, 2 | Squared-norm ratio π⁻g; degree shift (g/2)log π = ½log π, log π | Retained | None |
| Conventions: twice theta | Elliptic fibre; multiplication by 2 | deg Θ = 2 versus inverse degree −2; h_Θ([2]P)=4h_Θ(P), h_Θ=2ĥ | Retained | None |
| Conventions: valuation scaling | Unit loop, unramified/ramified quadratic | Length 1 or 2 respectively; ε and φ scale by 1 or 2, not by the unramified residue degree 2 | Retained | None |
| Native carrier conventions | Nonempty point; dimension-zero group | Rank O = 1, rank zero sheaf = 0; zero-dimensional abelian variety has dimension 0 and identity map | Retained; native carrier includes no metric | None |
| 0.1 continuous hermitian bundle and nefness | O with norm e, then e⁻¹⊗e⁻² | Curvature 0 in all cases; degree −1 versus +3; semipositive does not imply arithmetic nef | Retained | None |
| 0.1 tensor/dual metric API | Norms e⁻¹, e⁻² and inverse | Product e⁻³; inverse e; degree 3 and −1; zero metric would have norm 0, excluded | Retained | None |
| 0.2 metrized Deligne pairing | Degree-2 finite flat map; ℙ¹×S and L=O(1)+π*M | Norm of pullback M is 2M; identity gives M; ⟨L,L⟩=2M | Retained | None |
| 0.3 arithmetic small sections and volume | O(c) on Spec ℤ, c=1,0,−1 | Counts 2⌊eᵐ⌋+1, 3, 1; log(count)/m → 1,0,0 | Retained | None |
| 0.3 geometric Hilbert–Samuel, repaired | ℙ¹, O(a), a≥0; O(−1); dimension-zero point | h⁰(O(am))=am+1, vol=a=degree; O(−1): vol 0≠−1; point: vol=1=empty intersection | Retained; nefness essential | None |
| 0.3 arithmetic/geometric Siu, repaired | Degrees A=2, B=1 or 0 | vol(A−B)=1=2−1; B=0 gives 2=2−0; zero mixed degree requires no division | Retained | None |
| 1.1 mixed model coefficients | [2], ½[2] on Spec ℤ; constants 1 and 2 | Integral restriction coefficients 1 and 1/2: only first allowed; (0,1)+(0,2)=(0,3) | Retained | None |
| 1.1 common-model equivalence/order | Same divisor pulled to a dominating model; D=D′ | Difference pulls back to 0; D′−D=0 is effective; negative [2] has coefficient −1 | Retained | None |
| 1.2 boundary norm and definiteness | E₀=(0,1); constant c=−2,0,2 | Norms 2,0,2; triangle at 1+2 gives 3≤1+2=3; scaling by −2 gives 4=2·2 | Retained | None |
| 1.2 projective/trivial boundary and torsion convention | Projective field, E₀=0; underlying nonzero torsion D | Norm 0 at zero, ∞ off zero; if aD=0 then 0<∞ is possible; normal torsion-free case rules that out | Retained | None |
| 1.3 adelic groupoid/completion | U=Spec ℤ[1/2], rational boundary coefficients tending to √2; tensor inverse | √2−r is not an integer for rational r: limit is not a model representative; L+(−L)=0 | Retained | None |
| 1.4 divisor presentation | Principal 2; constant metric e⁻¹ | Finite plus infinite degree log 2−log 2=0; constant class degree 1≠0 | Retained | None |
| 1.5 effective/strongly nef/nef/integrable | Constants −1,0,1 on Spec ℤ | Nef iff c≥0; −1=0−1 is integrable but not nef; 0 is strongly nef; negative effective test fails | Retained definitions | None |
| 1.5 rational scalar API | O(1) on ℙ¹_k, scalar 1/2 | Required underlying degree 1/2∉ℤ; rationalized degree 1/2 is valid | Integral claim ill-typed | R06 |
| 1.6 arbitrary-base/global-field colimits | O(1) on Spec ℚ over ℤ and over ℚ | Arithmetic metric degree 1; geometric Picard/divisor class 0 | Retained; distinguishes the two bases | R01 uses this test |
| 1.7 complex boundary growth | g(z)=(log|z|)² on ℂ×; g(z)=log|z| | Ratios to |log|z|| tend to ∞ and 1 respectively; only the latter has linear boundary control | Retained | None |
| 1.8 arithmetic-curve exact sequence | Spec ℤ and Spec ℤ[1/2] | Unit contribution after roots of unity: 0 and ℤ; tensor with ℝ/ℤ: 0 and ℝ/ℤ; both algebraic Pic groups 0 | Retained | None |
| 1.9 domination, repaired | D=([2],0), D′=([2],c), c≥0; alternative (0,c) | D′−D=(0,c), D′+D=(2[2],c), degree log 2+c; alternative difference coefficient −1 at 2 | Retained replacement; old Check false | None |
| 1.9 sign/size negative control | D=(0,−1); D′=(0,1) or (0,1/2) | First bounds −1 between −1 and 1; second lower bound −1/2 exceeds −1 | Retained | None |
| 2.1 Banach-base analytification | |2| at t=1,1/2 and 2-adic place | 2,√2,1/2; real fibre identifies i with −i, complex fibre does not | Retained construction; comparison needs maps | R03 |
| 2.2 analytic divisor/metric conversion | Principal 2 at infinity | g=−log 2 gives exp(−g)=2; wrong half exponent gives √2; inverse −log returns −log 2 only for 2 | Retained correction | None |
| 2.3 injectivity/full faithfulness | O(1), O(2) on Spec ℤ | Green values 1,2 at archimedean endpoint; t,2t on ray; equality fails at t=1 despite same underlying line | Retained | None |
| 2.4 divisorial density | ord₀, ord∞ on k(t), scaled by a>0 | |t|=e⁻ᵃ and eᵃ; both tend to 1 as a→0; at a=1 values e⁻¹,e | Retained; trivial valuation is a limit | None |
| 2.5 effectivity test | O(c), c=−1,0,1 on normal point | Green values −1,0,1; effectiveness false,true,true | Retained with normality for Green-only converse | None |
| 2.6 mixed measures | Good reduction ℙ¹, O(1), O(2), O(−1); point | δζ,2δζ,−δζ have masses 1,2,−1; empty product on point mass 1 | Construction retained; negative case not supplied by AD | R04 |
| 2.6 normalization/constant shift | O(2), O(0), and tensor with base O(c) | Probability mass 2/2=1; O(0) mass 0 so normalization prohibited; base shift adds curvature 0 | Retained | None |
| 2.7 prescribed trivial-valuation metric | Trivial model; invertible constant 2; rescale norm by e | Model norm of generator and of 2 both 1; rescaled generator norm e≠1 | Retained, no false uniqueness from curvature alone | None |
| 3.1 absolute intersection | O(1) on Spec ℤ and quadratic base change | 1; pullback raw degree 2=2·1 | Retained | None |
| 3.2 relative adelic pairing | Degree-2 norm; curve bundle of fibre degree 3 | Norm of f*M is 2M; pairing with π*N is 3N, versus wrong unweighted N | Retained | None |
| 3.3 composition/projection | Covers of degrees 2 then 3; fibre degree 3 with N=O(2) | Norms yield 6M in either order; projection yields O(6) in either order; two base pullbacks pair to 0 | Retained | None |
| 3.4 injective pullback hypothesis | E: y²=x³+3x+2 over 𝔽₅, relative Frobenius | Points O,(1,±1),(2,±1): order 5; discriminant factor 4·3³+27·2²≡1; pullback kills order-5 class | Geometrically reduced fibres exclude counterexample | None; source error recorded |
| 3.4 constant-metric descent | Connected proper fibre, base constants 1 and 2 | Fibre ratio e⁻¹ constant; descended difference O(1); zero ratio shift gives base class 0 | Retained with universal structure-sheaf pushforward | None |
| 4.1 effective sections | Spec ℤ, c=0,1,−1 | Sections counts 3,5,1; logarithms log 3,log 5,0 | Retained | None |
| 4.2 volume/bigness | O(−1),O(0),O(2) on arithmetic point | Volumes 0,0,2; only last big | Retained | None |
| 4.3 adelic HS/Siu | Dimension 1; degrees 2 and 1; B=0 | HS gives volume 2; Siu 1≥2−1=1; with B=0, 2≥2 | Retained | None |
| 4.4 positivity of pairing | ℙ¹×S, L=O(1)+π*M, deg M=1 | ⟨L,L⟩=2M, degree 2>0; M=0 gives degree 0, not big | Retained hypotheses | None |
| 4.5 finite-cover bigness | Finite degree 2, top intersections 3 and 0 | Pullbacks 6 and 0; positivity preserved both ways for nef bundles | Retained | None |
| 4.6 heights and vector values | [1:2]/ℚ; base O(c); geometric t=u² | log 2; raw [K:ℚ]c divided by [K:ℚ] gives c; geometric heights 1 and 2 | Retained definitions | None |
| 4.6 comparison API | [1:2]/ℚ(i) | Here log 2; supplier h_K=2 log 2; corrected quotient gives log 2 | False equality | R02 |
| 4.7 height inequality | X=S=ℙ¹, identity, O(1); trivial bundle | log 2≥1·log 2; 0 cannot dominate unbounded log n | Retained; bigness/non-degeneracy needed | None |
| 4.8 fundamental inequality | Spec K, degree 2, base O(1), n=0 | Raw degree 2; h(X)=2/(2·1·1)=1=e₁; wrong missing factor would demand 2≤1 | Retained | None |
| 4.9 model/group and degree comparison, new | ℙ¹/ℚ max versus Fubini–Study; quadratic point; k(t) | Max self-intersection 0 on both sides, FS 1/2; raw 2 versus normalized 1; h(t)=1 and h(constant)=0 | Numerical adapters retained | None |
| 4.9 analytic domains, new | Real place of ℙ¹/ℚ | Upstairs {i,−i} has 2 points; downstairs one orbit; pushforward of half-sum Diracs has mass 1 | Direct equality needs transport | R03 |
| 4.9 integrable-measure clause, new | O(−1), and O(2) for positive control | Signed mass −1 here versus no semipositive supplier input; positive mass 2 in both | Supplier overclaim | R04 |
| 5.1 invariant extension | f(z)=z²; identity map as wrong q=1 case | max(1,|z²|)=max(1,|z|)²; h(2)=log 2; identity preserves every constant twist when q=1 | Retained q>1 | None |
| 5.2 non-degeneracy | Constant elliptic family over curve; torsion section; base point | Betti rank 2<real dimension 4 for total family; section rank 0<2; over a point positive top degree suffices | Retained | None |
| 5.3 small points and equidistribution, repaired route | Constant abelian variety over a point; generic torsion versus repeated zero | Point heights 0; nefness gives 0≤h(Y)≤e₁=0; Haar mass 1; repeated zero remains inside a proper closed point | Retained, subject to repaired §4.9 | R03–R04 |
| 5.4 Hodge bundle/height | Quadratic number field, stable height h | Raw Hodge degree 2h and normalized h; Deligne change +(g/2)log π | Retained | None |
| 6.1 Moriwaki polarization | d=0 over ℚ; one zero polarization factor | [1:2] has log 2; zero factor makes every intersection/height 0, hence infinite bounded degree-one points | Retained; bigness for Northcott needed | None |
| 6.2 height machine | ℙ¹/ℚ at [1:n]; O(1),O(2),O | log n,2 log n,0; pullback along identity changes none; zero polarization gives infinitely many zeros | Retained | None |
| 6.3 canonical limit | 2-torsion; point of height a; quadratic number field | Iterates after first have height 0; canonical heights at [0],[1],[2] are 0,a,4a; relative value 2a versus absolute a | Retained; missing independent Checks/API | R07 |
| 6.4 specialization | Degree-2 parameter cover, original generic slope 3 | Raw slope after cover 6; normalized 6/2=3 | Retained normalization | None |
| 7.1 abelian admissibility | Even and odd bundles; constant twist c; good reduction versus Tate elliptic curve | Eigenvalues 4 and 2; twist defects c−4c=−3c and c−2c=−c; local probability masses 1,1 with atomic versus circular support | Retained | None |
| 7.2 curve/square admissibility | Unit banana genus 2; genus-one Abel map | Model ω mass δ_v1+δ_v2=2; admissible density (2/3) on three edges gives 2 but different measure; genus-one theta pullback degree 1 | Retained; equal mass alone insufficient | None |
| 7.3 admissible measure | Three unit edges, complementary resistance 1/2 | Each density (1/2)/(1+1/2)=1/3; integral 3·1/3=1 | Retained normalization | None |
| 7.4 canonical pair and uniqueness | g=2, constant diagonal shift c; elliptic bridge components | Shift changes Green mean 0 to c; degree of ω 2; two vertex masses 1+1=2 match 2μ in compact type | Retained | None |
| 7.4 genus-one existence and uniqueness, repaired | g=1; ω versus positive-degree L, deg L=e | ω pairing coefficient 0; positive-degree coefficient e>0; uniqueness equation 0·φ+c=−2φ−c′ forces φ=−(c+c′)/2 | Retained repair | None |
| 7.4 genus-one normalization | Rescale ω metric by e^c | Curvature remains 0; residue norm changes from 1 to e^c; c=1 fails isometry | Retained negative control | None |
| 7.5 graph metric formulas | Good reduction; elliptic circle length n; unramified quadratic | Good-reduction factor 1; K_Γ=0, μ=ds/n and g_μ(x,x)=n/12; unit edge remains length 1, not 1/2 | Retained | None |
| 7.6 rescaling/trivial value | Absolute-value exponent 2; trivial model | Green 1→2, norm e⁻¹→e⁻²; trivial norm stays 1 | Retained | None |
| 7.7 global canonical bundles, repaired genus | Quadratic extension; elliptic curve | Raw W→2W, normalized W unchanged; elliptic ω is base pullback and its self-pairing has coefficient 0 | Retained | None |
| 8.1 admissible family extensions | Base constant e⁻¹; model ω on unit banana | Constant fibre curvature 0; model atomic mass 2 versus admissible edge mass 2 with different support | Retained | None |
| 8.2 torsor of extensions | Two base twists O(1),O(2) over Spec ℚ | Ratio norm e⁻¹; difference O(1)≠0; zero difference only for equal shifts | Retained | None |
| 8.3 canonical family pair | g=2 | deg w=2, deg Δ*D=−2; sum with w has degree 0 | Retained sign | None |
| 8.3 genus-one repair and source pullback | g=1 versus 2; positive relative degree e | Coefficient of β₂ is 0 or 2π*β₂; replacing ω by L gives eπ*β₂; circle n=12 yields metric factor e_v, n=0 gives 1 | Retained amended route | None |
| 8.4 invariant twice theta | Replace Θ̄ by Θ̄+O(1) | [2]* gives 4Θ̄+O(1), fourfold tensor gives 4Θ̄+O(4); discrepancy O(−3)≠0 | Retained; wrong constant metric excluded | None |
| 8.4 Poincaré sign/rigidification | Elliptic diagonal; zero section | deg Δ*P∨=2 versus deg Δ*P=−2; zero-section restriction class 0 and norm 1 | Retained | None |
| 8.5 section evaluation/adjunction | x*w=a; L=π*O(c) | ⟨x,x⟩=−a, ⟨x,w⟩=a; evaluation against base constant gives c on both sides since deg O(x)=1 | Retained formula; insufficient existing Checks | R07 |
| 8.6 vertical definition, positive controls | Base O(1), identity, section bundle | Underlying fibre degrees 0,0,1; first two vertical, last not | Retained kernel definition | None |
| 8.6 claimed equivalent set, negative control | Fourier metric f in R05 | Uniform bound Σ2⁻ⁿ=1; Laplacian coefficients −2π²8ⁿ unbounded versus bounded coefficients of any finite signed measure | False equivalence | R05 |
| 8.7 orthogonality/Hodge index | Degree-zero M, base N; principal-theta height a | ⟨M,π*N⟩=0·N=0; twice-theta height 2a, pairing −2a; torsion gives 0=0 | Retained | None |
| 9.1 general theta pullback, first formula | Relative degree d; g=2,d=1; d=0 | Fibre degree d²(2g−2)+2d²=2gd²; values 4 and 0; d=0 yields base class −⟨α,α⟩ | Retained, including constant Abel map | None |
| 9.1 pairing expansion and section case | A=⟨w,w⟩, b=x*w, g=2,d=1 | Expanded value A+4b−4(−b)=A+8b; section formula A+4gb=A+8b | Retained | None |
| 9.1 genus-one second identity, repaired | g=1; w pulled back; iota zero section | Left coefficient g−1=0; right d⁴⟨w,w⟩+d²e*Θ=0+0; section formula 4x*w | Retained | None |
| 9.2 canonical/difference/shift | g=2 then 3 | Canonical coefficients (8,32), (24,384); difference 8w+P,12w+P; shift (16Θ+32P),(128Θ+384P) | Retained | None |
| 9.3 nef decomposition | g=2,3 and forbidden g=1 | P coefficients −1/8+32/256=0 and −1/24+384/9216=0; g=1 denominators 0, excluded | Retained | None |
| 10.1 graph invariants | Unit loop with q=1 (g=2); length-2 loop with q=2 (g=3); bridge joining elliptic vertices | (ε,φ,τ)=(1/6,1/12,1/12), (4/9,2/9,1/6), (1,1,1/4) | Retained definitions and scaling | None |
| 10.1 canonical divisor and type | Unit loop q=1; bridge q=1 at both ends; genus-one loop | K=2v, v₁+v₂,0 respectively; degrees 2,2,0 equal 2g−2; type-0 length 1 for loop, separating length 1 for bridge | Retained | None |
| 10.2 Cinkir constants | g=2,3,4; K₄ genus3 | t(2)=1/27, t(3)=0.05447, t(4)=3/88; K₄ φ/δ=17/288≈0.05903≥0.05447≥1/39 | Retained | None |
| 10.2 de Jong/τ inequality | Unit K₄; elliptic bridge | K₄: δ=6, ε=11/6, φ=17/48, τ=5/16; δ+ε−2φ=57/8=3δ/2−6τ. Bridge: 1+1−2=0=3/2−6/4 | Retained | None |
| 10.3 local φ and extension | Genus-two unit type-0 node; ramified quadratic; good reduction | φ=1/12, 1/6,0; rescaling factor 2 agrees with length, not residue degree | Retained | None |
| 10.4 ε divisor | Unit type-0 node g=2; good reduction | Green values 1/6 and 0; arithmetic/model pairing defect equals ε | Retained | None |
| 10.5 ε boundary bound | g=2, unit type-0 node | 2δ−ε=2−1/6=11/6≥0 | Retained | None |
| 10.6 φ divisor/domain | Same node; curve versus its square | Green value 1/12; c₁(D)² has top degree on dimension 2, not dimension 1 | Retained; source domain corrected | None |
| 10.7 triple self-pairing | Expand difference bundle; g=2 | Coefficient 8−24+24+12(g−1)=12g−4=20; Φ coefficient 8 retained | Retained | None |
| 10.8 φ boundary bound | g=2 unit loop | φ−δ/39=1/12−1/39=3/52>0 | Retained | None |
| 10.9 Hodge lower decomposition | g=2 | Intermediate constant 1+(39/2)·15=587/2=293.5≤300; resulting ratio 12/300=1/25 | Retained | None |
| 10.10 canonical Gross–Schoen height | Hyperelliptic g=2, φ=5; quadratic extension | Canonical cycle height 0=(5/2)W−5 gives W=2; raw extension values W=4, φ=10 again give 0 | Retained | None |
| 10.11 Faltings δ/theta normalization | Elliptic equianharmonic value; theta metric multiplied by e | −log(0.002027)−8log(2π)≈−8.50; multiplying theta norm by e shifts displayed δ by −24 | Retained; normalization is essential | None |
| 10.12 arithmetic Noether | g=2, K=ℚ then quadratic | Constant −8log(2π); W_Ar=12h−δ+8log(2π); all raw terms double under degree 2 | Retained | None |
| 10.13 local formulas/sign | Unit node; good reduction; section s versus −s | δ+ε=7/6,0; log|−s|−log|s|=0 | Local formulas retained | R01 changes carrier |
| 10.13 arithmetic/geometric carrier | S=Spec ℚ | D̂iv(S/ℚ)=0; required arithmetic Green value 7/6≠0; geometric image of arithmetic class is 0 | False carrier statement | R01 |
| 10.14 hybrid obstruction | Parameter t→0 with exponent 1/log(1/|t|) | Rescaled |t| equals e⁻¹; unit-node ε limit 1/6 versus prescribed archimedean 0 | Retained obstruction | None |
| 11.1 boundary coercivity/φ positivity | a=1/156, unit boundary | 1/39−2a=1/78>0; hence boundary growth has positive coefficient | Retained | None |
| 11.2 geometric bigness | g=2, maximal-variation curve base with deg λ=1 | Lower bound deg P≥1/25>0; constant family λ=P=0 fails maximal variation | Retained | None |
| 11.3 arithmetic bigness | g=2, base arithmetic dimension1, degree[K:ℚ]=2 | Normalized lower bound 2c₀/5, raw bound 4c₀/5; both positive | Retained | None |
| 11.4 bigness of w | g=2, dim S=1 | a=4·2·1·2=16; positive expansion term 2·16·P=32P | Retained | None |
| 12.1 relative powers/potential bigness | Y=S; curve family with L=π*M | Relative power sum mL; curve fibre degree 0 makes top degrees 0 for every m | Retained; wrong zero-fibre-degree model not big | None |
| 12.2 mixed pairing pattern | e=1,m=2; a=2, M²=3, m=3 | Indices (2,1),(1,2) yield aM; (3,0),(0,3) yield 0; a^(m−d)M^d=2·3=6 | Retained | None |
| 12.3 potential-bigness criterion | Base dimension0, relative dimension1, degree a=2 | Top power on m factors is m!·2ᵐ>0; a=0 gives 0 | Retained | None |
| 12.4 product-grid bound | Σ² with #Σ=3; union of n horizontal curves | First: dim0, degree9, required threshold √9=3; second: dim1, degree n, threshold n; examples attain equality | Retained; finite subsets prove infinite-Σ form | None |
| 12.5 Abel/difference/shift applications | g=2, d_α=1 | Base expressions 2P+iota*Θ; 8w+π*P; 16Θ+32π*P, with positive P coefficients 2,1,32 | Retained | None |
| 12.6 restriction across characteristics | Spec ℤ[x]/(x²−2) over 2 | Fibre ring 𝔽₂[x]/(x²) is nonreduced; integral reduced test Spec 𝔽₂ exists; 2=0 on it | Retained, no false integral-fibre assertion | None |
| 13.1 function-field Faltings height | Constant curve; Hodge degree3 after extension degree2; g=2 characteristic choices | Heights 0 and 3/2; positive non-isotrivial lower scale 3⁻¹⁶ or 4⁻¹⁶ | Retained | None |
| 13.2 global δ,ε,φ | Genus-two unit node; quadratic base extension | Local tuple (1,1/6,1/12); weighted raw sums become (2,1/3,1/6), with ε∞=0 | Retained | None |
| 13.3 canonical-square correction | h=1/10, δ=1, ε=1/6 | W_model=12/10−1=1/5; W_a=1/5−1/6=1/30=(2/5)(1/12) | Retained | None |
| 13.4 global lower bound constants | g=3,4,5 and hyperelliptic g=2 | A(3)=3296/34≈96.9412; A(4)=139; A(5)=877/8=109.625; g=2 improved 429/4=107.25; limiting general expression 47 | Retained | None |
| 13.5 function-field comparison | Worst coefficient139; everywhere good reduction h=1 | 12/139≈0.08633>1/12; W_a=12, so 1/12≤12≤12 | Retained | None |
| 13.6 Wilms bound | g=1,2 | −2log(2π⁴)≈−10.5441 and twice this ≈−21.0883; elliptic −8.50 is above first | Retained, strict inequality | None |
| 13.7 positive comparison height | g=1, minimum Faltings height≈−1.3211; worst allowed −½log(2π²) | c≈2.49130 gives h+c≈1.1702; at the lower bound h+c=1 | Retained; source normalization corrected | None |
| 13.8 coercive divisor | Unit K₄, c(3)=17/288 | (483/17)(17/48)−6−11/6=107/48; subtract δ gives −181/48<0; subtract cδ gives 15/8>0 | Retained cδ; excludes source's missing c | None |
| 13.9 upper-bound constant | g=1 as algebraic check, then g=2 | 2g log(2π⁴)+4g log(2π)=6g log(2π²), value≈17.8956 then≈35.7913 | Retained; theorem remains g>1 | None |
| 13.9 lower-bound route, repaired | g=2,3,4,5 with sharp/improved c(g) | Coefficients 109.75,≈100.4412,142,≤112.375; all <144; 12/144=1/12 | Retained | None |
| 13.10 uniformity, repaired | g=2,3; h≤1; h≥max(1,24|c₅|) | 4⁻¹⁶/12≈1.9403·10⁻¹¹, 4⁻³⁶/12≈1.7647·10⁻²³; max(h,1)=1; h/12+c₅≥h/24 | Retained fixed-genus uniformity | None |
| 13.10 function-field exclusion | Isotrivial constant genus-two curve | h=0,W_a=0, but max(h,1)=1; positive lower bound would read c₃≤0 | Non-isotrivial hypothesis excludes counterexample | None |

The check of §12.4 uses the formula's **dimension of Z**, not the number of factors: the finite grid has dimension 0 inside a twofold power. No vacuous one-tactic surrogate for this intersection-degree theorem is present in Lean.

The genus-one changes were also traced through every downstream use of the same pair: §§7.2–7.7, 8.1–8.7 and 9.1 allow g = 1; §§9.2–9.3 and the positive-canonical-degree bigness arguments retain g > 1. The graph definitions admit their stated positive genera, while inequalities that divide by g−1 retain g > 1. Ordinary operations on the empty Chern product give mass 1 in dimension zero; probability normalization is never attempted at degree 0. Genericity excludes a repeated point of a positive-dimensional variety. Nonreduced special fibres are handled through integral test objects, and the universal reduced-fibre hypothesis is retained for injective Picard pullback.

## Not verifiable

- The primary texts moret-bailly-1989, Théorème 2.5, pp. 491–498, and faltings-1984, Theorem 6, pp. 401–402, remain settled as uncertified. They were not requested again. Their Noether normalization was checked against yuan-2026 lines 2992–3026; that does not certify the unread primary proofs.
- The original works invoked only through a source's recollection (including Szpiro, Heinz, Zhang 1993, Coman–Guedj–Zeriahi, Baker–Faber, Klein–Randić and BLR) were not independently opened. The statements/routes actually used were checked in the available Yuan/Yuan–Zhang text and against named supplier targets. No independent certification of those original proofs is claimed.
- The Yuan manuscript's numbering was checked in the author copy recorded by the manifest, not against a separately obtained published version. The manifest's version note is therefore material.
- Proofs of future supplier targets, and a Lean formalization of the missing adelic/analytic carriers, do not exist in the pins inspected. The review resolves planning contracts and tests statements; it does not treat a supplier plan or a zero-declaration Lean build as proof of those results.

No additional inaccessible cited work requiring a new source request was found. The existing settled source entries were not changed, and no new `needs-references.toml` was needed.

## Source issues

- **Misprint** in yuan-zhang-2025 at §3.2.2, printed p. 72 (line 2632): the source says the divisor-to-metric map uses exp(−g/2); it should be exp(−g), inverse to its stated −log norm convention; affects nothing.
- **Error** in yuan-2026 at Lemma 2.1(1), printed p. 25: the source says geometrically connected fibres suffice for injective adelic Picard pullback; it should be supplemented by geometrically reduced fibres, excluding elliptic relative Frobenius killing a nonzero order-five class; affects a stated result.
- **Error** in yuan-2026 at §2.2.1, printed p. 29 (lines 994–996): the source says the Abel map for a bundle of degree d is finite without restricting d; it should be finite for d ≠ 0; for d = 0 it is constant with a positive-dimensional fibre; affects a stated result.
- **Misprint** in yuan-2026 at §2.2.3, printed p. 32 (line 1100): the source says to add (2g−2)β₂ to a bundle on X although β₂ is on S; it should be (2g−2)π*β₂; affects the proof.
- **Gap** in yuan-2026 at §2.2.3, printed p. 32 (lines 1101–1104): the source says the pairing condition determines β₂ for all positive genera; it should use a positive-degree admissible bundle when g = 1, since the displayed coefficient is zero; affects the proof.
- **Misprint** in yuan-2026 at §3.3.1, printed p. 49: the source says to divide the split semistable node count by the extension degree; it should be divided by ramification index with the stated unit-edge normalization; affects nothing.
- **Misprint** in yuan-2026 at §3.3.2, printed p. 50 (lines 1707–1710): the source says to integrate the square of the diagonal Chern form over X; it should be integrated over X ×_S X; affects nothing.
- **Error** in yuan-2026 at §4.4.1, printed p. 78, also p. 84: the source says Bost's lower constant in its Faltings normalization is −(g/2)log(2π); it should be −(g/2)log(2π²), after the Deligne-to-Faltings shift; affects the proof.
- **Misprint** in yuan-2026 at proof of Theorem 4.14, printed p. 94: the source says the geometric coercive divisor minus Δ is effective; it should be minus c(g)Δ, as its calculation on printed p. 95 proves; affects nothing.
- **Gap** in yuan-2026 at proof of Theorem A.1, printed p. 113 (lines 3830–3831): the source says the pairing calculation with ω determines the normalized Green integral at every positive genus; it should use an admissible bundle of positive degree at genus one; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8f51f449742ce36f51816aac4545046188c8d113", "job": "REV-PKG-ArakelovGeometryAndAbelianHeightsPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
