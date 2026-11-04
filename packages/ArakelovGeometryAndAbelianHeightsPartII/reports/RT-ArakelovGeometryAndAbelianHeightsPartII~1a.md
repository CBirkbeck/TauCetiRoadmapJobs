<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1056#issuecomment-6432369809 -->
Red team round 1 pass a (codex) of 789d041

Verdict: needs_changes

1. **F01** (P2) The general density statement still includes a zero-dimensional counterexample

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:486, “the points ... whose absolute value on the function field F is discrete or archimedean are dense”.

   **Claim:** This holds for every flat essentially quasi-projective integral X over a trivially valued field or ℤ.

   **Witness:** X = U = Spec 𝔽₂ has one analytic point, with |1| = 1. There are no nontrivial discrete or archimedean valuations. The asserted dense subset has closure ∅, whereas Uᵃⁿ has cardinality 1.

   **Exact repair text:** “The map Xᵃⁿ → Uᵃⁿ is continuous, injective and dense. If k = ℤ, or k is a field and dim U > 0, the discrete or archimedean function-field points described below are dense. If k is a field and dim U = 0, then U = Spec F for finite F/k and the unique trivial-valuation point is the required test point.” Apply the same case split to the last sentence of §2.5. Add the Spec 𝔽₂ Check: the corrected test set and space both have cardinality 1. The later caveat about S in §2.4 does not qualify its preceding general assertion.

2. **F02** (P1) Local curvature uniqueness creates an internal proof cycle

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1080, “Calabi uniqueness, §7.4 step”; README.md:1104, “Calabi uniqueness on curves”.

   **Claim:** §7.3 imports curvature uniqueness from §7.4, which already needs §7.3.

   **Witness:** §7.4's Needs at line 1126 includes §7.3. TropicalAndBerkovichArithmetic §6.6 supplies graph Poisson uniqueness, not uniqueness for arbitrary integrable curve metrics. yuan-zhang-2025 lines 9940–9954 supplies the distinct local Hodge-index statement used to obtain it.

   **Exact repair text:** Before §7.3 add the named target “Local Calabi uniqueness: on a smooth projective geometrically integral curve over any complete nontrivially valued nonarchimedean field, two integrable continuous metrics on the same line bundle with equal curvature measures differ by a positive constant.” Give the proof through the dimension-one case of yuan-zhang-2025 Theorem A.6.1, p. 246, and the local intersection recursion, or declare a precise gap with an earlier supplier. Make §§7.3–7.4 depend on this target and delete the reference from §7.3 to §7.4. Prove §7.3's already-stated algebraically-trivial flat-curvature subclaim before using it to show independence of the theta choice. For O with norms 1 and e⁻¹, both curvatures are 0 and the ratio is the allowed constant e⁻¹. This breaks 7.3 → 7.4 → 7.3 without duplicating the flat-curvature target.

3. **F03** (P1) The general height-inequality route uses a false small-twist assertion

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:796, “(2)–(3) Add a small multiple ... which makes L̄ big by Siu”.

   **Claim:** Geometric bigness, without nefness, becomes arithmetic bigness after an arbitrarily small positive base twist; Siu also supplies the perturbation in (1) for arbitrary big L̄.

   **Witness:** On ℙ¹/ℚ take max-metrized O(1) twisted by O(−1). Its geometric part is ample. For 0<c<1, every nonzero integral degree-m section has sup norm ≥ exp(m(1−c))>1; volume remains 0.

   **Exact repair text:** “For (1), use continuity of adelic volume to choose ε>0 with vol^(L̄−επ* M̄)>0; Siu proves this directly only when both inputs are nef. For (2), nefness and positive geometric top intersection make every positive base twist big. For (3), choose a sufficiently large positive base twist, using the generic-bigness twist theorem.” Add named prerequisites for adelic volume continuity and “geometrically big L̄ admits c₀ such that L̄+cN̄ is big for all c>c₀ when deg N̄>0”, before §4.7, with yuan-zhang-2025 Theorem 5.2.9 and Lemma 5.2.10. Its proof of Theorem 5.3.7 distinguishes the small nef twist (lines 6412–6427) from the sufficiently large general twist (lines 6428–6436), and uses continuity in (1) (lines 6437–6445). On the counterexample, c>1 gives the positive twist of the standard nef O(1); 0<c<1 is no longer claimed to work.

4. **F04** (P3) The projective-line pairing Check drops the metric contribution

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:743, “L=O(1)+π*M gives ⟨L,L⟩=2M since relative O(1)²=0”.

   **Claim:** This Check applies to the metrized pairing in §4.4 without specifying the metric on O(1).

   **Witness:** Take S=Spec ℤ, Fubini–Study O(1) on ℙ¹ and M=O(1) of degree 1. The package's own line 65 gives O(1)²=1/2, so the pairing degree is 1/2+2=5/2, not 2.

   **Exact repair text:** “For the geometric product ℙ¹×S with O(1) pulled back from ℙ¹, ⟨O(1)+π*M,O(1)+π*M⟩=2M. In the arithmetic case the formula is ⟨O(1),O(1)⟩+2M; its first summand has degree 0 for the standard max metric and 1/2 for the Fubini–Study metric. If deg M=1 these give degrees 2 and 5/2 respectively.” Both stated metric choices now satisfy the formula.

5. **F05** (P3) The Hodge-index Checks mix raw pairing and absolute height

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1332–1333, “For S = Spec K: ⟨M̄, M̄⟩_a = −2ĥ_θ(M)”.

   **Claim:** The pairing equals minus twice the principal theta height with no degree operation or field-degree factor.

   **Witness:** For a non-torsion elliptic point over a quadratic number field, let its absolute principal theta height be a>0. §4.6 gives deg(ι*Θ̄)=4a. Thus the raw self-pairing degree is −4a, while the Check says −2a.

   **Exact repair text:** “For a number field K, deg^(⟨M̄,M̄⟩ₐ)/[K:ℚ]=−2ĥθ(M). In particular, a point of absolute principal theta height a gives raw pairing degree −2[K:ℚ]a; torsion gives zero. Over a function field use the fixed-constant-field height and its corresponding degree normalization.” Amend both Checks. GrossZagierAndArithmeticHeights §2.12 uses a relative height, so explicitly apply the absolute-height adapter from the conventions when importing it. For quadratic K the repaired raw equality reads −4a=−4a and the normalized equality reads −2a=−2a.

6. **F06** (P3) A design-process sentence remains in the mathematical contract

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:69, “Those Checks also retain the design's projective and dynamical equidistribution examples.”

   **Claim:** The supplier contract includes an account of retaining material from the design.

   **Witness:** This is process narrative; the brief excludes it from README text. The preceding power-map Check already specifies the mathematical example.

   **Exact repair text:** Delete the quoted sentence. The remaining example still gives the power map z↦z², the max metric and the usual Weil height, so its mathematical content is unchanged.

7. **F07** (P1) The spectral formula for φ is four times its defining integral

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1441, “for (i/2)∫α∧β̄ ... Σ ... (2/λ)|∫ ...|²”.

   **Claim:** The coefficient 2/λ is compatible with the stated (i/2)-orthonormal holomorphic forms and the unsquared Green kernel.

   **Witness:** zhang-2010 lines 1231–1243 uses i∫-orthonormal forms β for coefficient 2/λ. Replacing β by √2β gives the README's basis and multiplies every squared integral by 4: its sum is 8S instead of 2S, S>0 in genus two.

   **Exact repair text:** “Put Δf=(∂∂̄f)/(πi μ_Ar), and choose a real orthonormal eigenbasis in L²(μ_Ar), omitting the zero eigenvalue. For holomorphic forms orthonormal under (i/2)∫α∧β̄, φ(C)=Σ_{λ>0,j,k}(1/(2λ))|∫_C φ_λ ω_j∧ω̄_k|².” Add the normalization Check: writing ω=√2β with i∫β∧β̄=1 gives (1/2)·4S=2S, whereas the original gives 8S. The same coefficient follows by squaring the diagonal-curvature cross term −(i/2)Σ(ω_j(x)∧ω̄_j(y)+ω_j(y)∧ω̄_j(x)) in wilms-2017 lines 425–430 and 500–513. Record the inconsistent normalization in yuan-2026 lines 1671–1682 and zhang-2010 Theorem 1.3.1 as source issues; do not change the defining local integral or Wilms' δ identity to match the erroneous spectral sum.

8. **F08** (P1) The lower-bound proofs need a higher-dimensional arithmetic Hodge index theorem

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1917, “Wilms 2022 Theorem 1.2 ... Looper–Silverman–Wilms Proposition 6.1”.

   **Claim:** These cited results provide a proof route for §13.4 from its listed prerequisites.

   **Witness:** looper-silverman-wilms-2021 lines 695–700 and 713–734 require M̄²N̄≤0 on C² when M·N=0 and N is nef and geometrically big. §8.7 supplies a curve pairing identity; SchemeAndStackFoundations §5.10 supplies geometric surface intersection, neither this adelic inequality.

   **Exact repair text:** “Add the higher-dimensional arithmetic Hodge-index inequality before §13.4: for k=ℤ or a field, F finitely generated over k (positive transcendence degree and k algebraically closed in F in the field case), X/F geometrically integral, geometrically normal and projective of dimension n≥1, integrable M̄ and nef L̄₁,…,L̄ₙ₋₁ with geometrically big underlying bundles, M·L₁···Lₙ₋₁=0 implies −π_*⟨M̄,M̄,L̄₁,…,L̄ₙ₋₁⟩ is pseudo-effective.” Use yuan-zhang-2025 Theorem 6.5.8, lines 8381–8389, and give its proof dependencies or a precise earlier supplier gap. Expand §13.4's route with the actual Hodge-index application and add this prerequisite to Needs. In the function-field calculation at genus 3, N²=8g(g−1)³=192>0 and M·N=0; the new theorem now licenses M̄²N̄≤0 (source lines 723–734). The existing curve-only identity does not type-check this application. Searches of the supplied heads, main, package folders and pins found no owner for this higher-dimensional adelic theorem.

9. **F09** (P3) The quasi-projective mass identity points to a consumer

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:513 and 521, “geometric adelic intersections, as specified in §5.2”.

   **Claim:** §5.2 provides the degree and total-mass identity needed in §2.6.

   **Witness:** §5.2's Needs at line 893 includes §2.6; its route at line 876 uses the mass identity to prove nondegeneracy equivalences. The geometric intersection is constructed in §3.1, not §5.2.

   **Exact repair text:** “Keep the mixed-measure construction in §2.6. State its quasi-projective total-mass theorem immediately after §3.1, depending on §2.6 and the geometric specialization of §3.1, with yuan-zhang-2025 Lemma 5.4.4 as locator. Make §5.2 consume that theorem.” Replace both references to §5.2 accordingly. On ℙ¹×ℙ¹, the repaired dependency computes mixed mass 1=degree(O(1,0)·O(0,1)); §5.2 no longer supplies an identity it consumes.

10. **F10** (P3) Two definitions lack three discriminating Checks

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:551–556 and 1206–1211, Checks for §§2.7 and 8.1.

   **Claim:** The current Checks discriminate the canonical trivial-valued metric and family admissibility.

   **Witness:** All four §2.7 bullets test the trivial line's unit-frame norm or a constant rescaling. In §8.1, the base-pullback and banana tests are each repeated; “admissible = fibrewise admissible” restates the definition.

   **Exact repair text:** Add to §2.7: “On ℙ¹ over a trivially valued field, at the Gauss valuation |t|=2, the canonical O(1) frame X₀ has norm 1/2; at |t|=1/2 it has norm 1. Its tensor square X₀² has norm 1/4 at |t|=2. Pullback by t↦t² gives the same 1/4, also in characteristic 2.” These test a nontrivial bundle, tensor and inseparable pullback. Add to §8.1: “For a constant elliptic family over ℙ¹_ℚ, at an archimedean fibre ℂ/(ℤ+iℤ), the trivial bundle with fibre metric exp(−cos(2πx)) is not admissible: its curvature is nonzero although its fibre degree is zero; the invariant theta metric is admissible with curvature mass 2.” For the first new metric the flat Laplacian of its weight is −4π²cos(2πx), rather than zero. Together with base constants and the banana example this gives independent positive and negative tests.

11. **F11** (P1) A generically finite pullback is silently treated as ample

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1809, “Θ̄|_Y is ample on the generic fibre of Y → T”.

   **Claim:** In §12.5(4), any generically finite morphism Y→J makes the theta pullback relatively ample over its image T.

   **Witness:** Let S=Spec k, C a genus-two curve and Y the blowup of its Jacobian at a point. Y→J is birational. On its exceptional curve E, deg(f*Θ|E)=0, so f*Θ is not ample; its square is 8>0.

   **Exact repair text:** “First replace Y by the closure Z of its image in J and normalize the base image as necessary. Use invariance of nef bigness under generically finite dominant pullback, deduced from §3.1 and §4.3, to return to Y. On the closed image Z, Θ|Z is ample on the generic fibre over T, so the positive mixed-intersection argument applies. For potential bigness over nonnormal Y, apply the criterion after finite normalization and descend nef bigness on each relative power.” State the generically finite form alongside §4.5 and cite it here. This restores the reduction in yuan-2026 lines 2356–2363, omitted by the present route. On the blowup, the repaired argument uses (f*Θ)²=Θ²=8, while making no false assertion that its exceptional degree 0 is positive.

## Verified sound

Coverage: all 2,073 README lines and all 71 Suggested.lean lines read; **91 numbered targets**, **0 Lean declarations**, **359 Check bullets** (346 in targets and 13 in supplier contracts) read and tested against the definitions and conventions. The computed target tests are recorded below; repeated Checks are not counted as independent mathematical tests. **18 readable source-record locator groups** were checked, listed below; two additional source records remain uncertified. **11 roadmap supplier contracts** were resolved (10 existing owners and the declared StableReductionPartII gap), together with **7 named pinned declarations**. The findings above identify the failed tests; these counts do not certify the failed claims.

The package diff at the requested head changes 10 files, all under packages/ArakelovGeometryAndAbelianHeightsPartII. Its plan.json diff is confined to the top-level gaps list. Suggested.lean has exactly one import, `import Mathlib`, a module docstring and its namespace. It has no declarations, section variables, instance binders, admitted data, padding or colliding fully qualified names. Consequently the declaration/context table and the requested `#check @name` comparison have zero rows; no Lean command was run.

| Acceptance-test inventory | README location | Pinned statement boundary |
|---|---|---|
| Metrized Deligne pairing and its functoriality | §§0.2, 3.2–3.3 | Algebraic invertible sheaves exist; metrized relative pairing does not |
| Arbitrary-base adelic realization and full faithfulness | §§1.3–1.6, 2.3 | Boundary-completed bundles/divisors and this analytic realization do not exist |
| Hilbert–Samuel, Siu, height and fundamental inequalities | §§4.2–4.8 | Adelic volume/intersection/height carriers do not exist |
| Invariant extensions, nondegeneracy, equidistribution and Hodge-height identity | §§5.1–5.4 | Relative metrized bundles, their measures and stable Faltings height do not exist |
| Moriwaki height machine, Northcott, canonical kernel and specialization | §§6.1–6.4 | Arithmetic polarizations and their intersection heights do not exist |
| Admissible metrics, normalized pair, family extension and curve Hodge index | §§7.1–8.7 | The curve metric and admissible family carriers do not exist |
| Metrized theta identities and canonical nefness | §§9.1–9.3 | Algebraic theta objects alone cannot state these metrized identities |
| Graph inequalities, ε/φ/Noether divisors, Gross–Schoen height and variation | §§10.1–10.14 | Polarized resistance graphs, admissible kernels and special cycle heights do not exist |
| Uniform φ positivity and canonical/pairing bigness | §§11.1–11.4 | The φ-invariant and adelic nef/big intersection carriers do not exist |
| Potential bigness, product-grid bound and theta applications | §§12.1–12.5 | Relative adelic pairings are missing; the grid bound also needs the mixed degree of arbitrary closed subschemes of curve powers |
| Canonical-square bounds and uniform Faltings comparison | §§13.3–13.10 | Stable height and admissible self-intersection are missing |

Every inventory entry is named in the module docstring. None can be replaced by a few definitions on the pinned ordinary-degree API without encoding the missing construction. In particular, the native integer degree of a curve line bundle does not supply the product-grid mixed degree. The absence of Lean theorems is not a padding or missing-headline finding.

At Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `NumberField.prod_abs_eq_one` is at Mathlib/NumberTheory/NumberField/ProductFormula.lean:98 and requires a nonzero field element: at 2 over ℚ the finite and infinite factors are 1/2 and 2, product 1; 0 is excluded. `Projectivization.logHeight` at Mathlib/NumberTheory/Height/Projectivization.lean:51 retains `[Field K]`, `[AdmissibleAbsValues K]` and `[Finite ι]`; [1:2] has relative value log 2 over ℚ and 2log 2 over a quadratic field. These are not absolute heights without the adapter.

At Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the native `InvertibleSheaf` at TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112 is the full subcategory for the invertibility predicate. Its morphisms are module maps; multiplication by zero is a morphism of O but not an isomorphism or isometry. `AbelianVariety` at TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95 bundles properness, geometric integrality and a group object, with no metric. The two `eulerDegree` declarations at TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70 and :126 and `eulerDegree_canonicalBundle` at TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:168 have the context described in the package. In particular, the latter retains the field, integral Noetherian separated scheme, DVR stalks, valuative existence, coheight bound, function-field, constant-field and properness assumptions. Its values are 0 for genus one and 2 for genus two.

| Supplier contract resolved | Current locator and distinguishing test |
|---|---|
| ArakelovGeometryAndAbelianHeights | TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md:155, :377, :1736; §§1.1–1.15, 2.1, 2.7–2.8, 3.4, 5.0b, 5.3–5.4, 6.5. Green functions double, degrees remain 1 and 2 for norms e⁻¹ and e⁻²; the Bost adapter shifts by g log π/2 |
| HeightsRationalPointsAndObstructions | TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:233, :2705, :2736, :2776, :2813; §0 height interfaces and §§5.17a–5.17f. FS square 1/2, closed-point degree log q and raw field-degree scaling agree |
| ArithmeticDynamics | TauCetiRoadmap/ArithmeticDynamics/README.md:5885, :5903, :5919, :5933, :6756; §§4.1a, 4.3, 4.3a, 4.4, 4.40. Curvature masses 1 and 2 become probability mass 1; max(1,abs(z²))=max(1,abs(z))² |
| SchemeAndStackFoundations | TauCetiRoadmap/SchemeAndStackFoundations/README.md:4876, :6653, :6701, :6768, :7223, :7336; norms, degrees, Chern classes, products, geometric Hodge index and Bézout. Inseparable degrees multiply 2·2=4; geometric Hodge index does not provide R08's adelic triple intersection |
| ComplexComparisonPartII | TauCetiRoadmap/ComplexComparisonPartII/README.md:3018, §C5.4. Its manifold-current calculus supplies the Chern convention; the singular nonlinear products are explicitly in gap:singular-pluripotential-products |
| TropicalAndBerkovichArithmetic | TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:2049, :2094, :2120, :2145, :2204, :2239, :2279; also the cited analytic/skeleton sections in Layers 0–3. Banana edge resistance 1/2 gives density 1/3 and total mass 1; graph Poisson uniqueness is narrower than R02 |
| GrossZagierAndArithmeticHeights | TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:714, :741, :766, :866, :925, :982, :996; §§2.2–2.4, 2.8, 2.10, 2.12–2.13. Mean-zero unsquared Green function and residue norm 1 agree; R05 records the required height-normalization adapter |
| JacobianChallengePartII | TauCetiRoadmap/JacobianChallengePartII/README.md:211, :314, :430, :472, :523, :707, :769, :799, :809, :1034; cited Layers 1–6 interfaces exist. Elliptic Θ-degree 2 versus diagonal Poincaré degree −2 fixes the dual; arbitrary integer degree and actual Picard/Brauer qualifications are retained |
| NeronModelsAndSemistableAbelianVarieties | TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1355, :1618, :1644, :1688, :1716; §§3.3, 3.9–3.12. Tate component orders n and en differ under ramification, while identity fibres are both Gₘ; the package does not require full-model base change |
| MotivesAndAlgebraicCycles | TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:352 and :369, §§2.2–2.3. Chosen Weil cohomology and its cycle-class kernel are supplied after geometric base change; the modified diagonal has zero class, while the fundamental class of the curve does not |
| StableReductionPartII (declared gap) | gap:curve-moduli-noether-positivity has matching slug, supplier and needs in packages/ArakelovGeometryAndAbelianHeightsPartII/design/plan.json and README.md:117. Thickness m becomes em under ramification and stays m under unramified extension; the contract explicitly includes inseparable descent |

Both declared gaps are recorded in plan.json and in the named README supplier subsections. Their mathematical scopes distinguish the missing singular products and curve-moduli positivity from the existing owners. Their implementation is not demanded by this review, and the settled repair-report disposition about supplier implementation is not re-raised.

Ownership searches used the roadmap service and direct object searches in main, Completed, the board packages and all 55 sibling folders named in the brief. Searches covered adelic completions, arithmetic intersections, Deligne pairings, Moriwaki heights, admissible metrics, Calabi uniqueness, graph Green functions, Gross–Schoen heights and higher-dimensional arithmetic Hodge index. Existing generic constructions remain with the suppliers listed above. The relative metrized theta identities, arbitrary-base adelic extensions and the special cycle height are the additional objects owned here. No duplicate Suggested.lean name exists because the file declares none. No later roadmap was identified as a consumed supplier, and no ownership move is proposed.

The required dependency command produced:

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This roadmap-level check does not detect the internal proof references in R02 and R09. The citation resolver's sole unresolved roadmap name was StableReductionPartII, already covered by the declared gap; it is not a missing-supplier finding.

| Readable source locator group | Locators checked in the cached version |
|---|---|
| yuan-2026 | Theorems 1.3–1.4, §§2–4 and Appendix A as cited; in particular lines 863, 1081, 1130, 1642, 1697, 2319, 2356, 2855, 2950, 3195, 3500, 3830 |
| yuan-zhang-2025 | §§2.1–2.7, analytic realization, intersections, volumes/heights, invariant and admissible extensions; lines 750, 1750, 2417, 2603, 3850, 4256, 5121, 5439, 6219, 6396, 7212, 8311. Additional prerequisites: Theorem 6.5.8 at line 8381 and Theorem A.6.1 at line 9945 |
| yuan-2008 | §1.3 geometric Siu, Definition 2.1, Theorems 2.2–2.3, Corollary 2.4; lines 196 and 221 |
| moriwaki-2000 | Polarizations, Proposition 3.3.7, §3.4, Propositions 3.4.1–3.4.2 and Theorem 4.3; especially lines 648–711 |
| gao-habegger-2019 | Appendix A.1–A.3, including height-machine hypotheses; lines 2530–2565 |
| demarco-mavraki-ye-2026 | §4 invariant extensions and the height/equidistribution application, line 659 onward, arXiv v3 numbering |
| zhang-2010 | Theorem 1.3.1, Corollary 1.3.3, Proposition 2.5.3, graph formula in Lemma 3.5.4 and §4.1; especially lines 206, 253, 1220 |
| cinkir-2011 | Theorems 2.9–2.12, lines 170–220; genus-two constant 1/27, genus-three bound and general constant |
| baker-rumely-2007 | §14, Theorem 14.1, formula (14.1), Lemma 14.4; lines 1893–1975 |
| de-jong-2018 | Theorem 8.1, Propositions 9.2–9.3 and Theorem 9.4; lines 1290–1316 and 1498–1607 |
| wilms-2017 | Theorem 1.1, Corollary 1.2, theta normalization, (2.9)–(2.11); lines 25–65, 330–430, 490–516 |
| wilms-2022 | Theorem 1.2, lines 112–160 |
| looper-silverman-wilms-2021 | Proposition 6.1 and its Hodge-index proof, lines 695–762 |
| stacks-pullback | Tag 0E0L, Lemma 36.32.6, lines 3679–3685; proper, flat, finite presentation and geometrically reduced connected fibres |
| wazir-2006 | Height-machine discussion and Theorems 0.2–0.3, lines 97–183; degree-one base height at lines 173–175 |
| cinkir-2015 | Introduction item (iii), type XIV/K₄ calculation and concluding bounds; lines 35–55, 780–831, 1051–1071, arXiv v1 numbering |
| gaudron-remond-2014 | Definition 2.1 and normalization comparison, lines 305–330; Corollary 8.4, lines 2172–2187 |
| gross-schoen-1995 | Homological triviality and hyperelliptic vanishing, lines 193 and 310; Proposition 7.2 and the special regular-model construction, lines 647–666 and 860–935 |

The following is the computed pass, one row per numbered README target. Arithmetic intersections are raw unless a division is displayed. P denotes the relative canonical self-pairing, W its scalar degree, and a a principal theta height. These finite tests are evidence about the displayed assertions, not proofs of their full generality. An integral variety is nonempty and reduced: the zero ring, empty scheme and square-zero thickening are outside that context. Positive genus excludes ℙ¹ from the admissible-curve targets; g>1 excludes elliptic curves precisely where factors g−1 occur. The graph carriers are finite connected graphs, so empty/disconnected fans and noncompact graphs are outside their hypotheses. Picard groups are abelian by tensor symmetry, not arbitrary groups such as S₃. No target uses p-adic divided powers or arbitrary-rank linear groups.

| Target and standing context | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| 0.1: projective integral flat arithmetic X, continuous conjugation-invariant norms | Spec ℤ; norms e⁻¹,e⁻²,e | Tensor degree 1+2=3; norm e has curvature 0 but degree −1 | Semipositivity does not imply arithmetic nefness |
| 0.2: projective flat f, relative dimension n, integrable metrics | Finite flat degrees 1,2; pullback O(1) | Norm degrees 1·1=1, 2·1=2; degree-three fibre gives metric shift 3c | Flat/norm and shift formulas agree |
| 0.3: dimension d, nef inputs for HS/Siu | Spec ℤ, c=−1,0,1; Spec 𝔽₄/𝔽₂ | Volumes 0,0,1; nef degrees 0,1; empty degree=volume=2; Siu 2−1=1 | Correct d=0 branch; non-nef degree −1 is not volume |
| 1.1: integral Cartier restriction, rational model coefficients | [2], ½[2] on Spec ℤ; constants 1,2 | Allowed coefficient 1 versus forbidden 1/2; (0,1)+(0,2)=(0,3) | Integral/rational distinction retained |
| 1.2: extended boundary norm | Spec ℤ, E=(0,1); projective field model E=0 | Norms of (0,±1)=1; norm of [2]=∞; E=0 gives norm(0)=0, norm(nonzero)=∞ | Correct extended/discrete topology cases |
| 1.3: underlying integral L and boundary-Cauchy rational models | Spec ℤ; Spec ℤ[1/2] | O(1)+O(2)=O(3); √2 modulo ℤ is not in ℚ/ℤ, so no rational model gives that 2-coordinate | Completion adds genuine classes |
| 1.4: divisor-class quotient | Principal divisor of 2; O(1) | log 2−log 2=0; degree O(1)=1≠0 | Kernel sign correct |
| 1.5: strong nef/nef/integrable | Spec ℤ c=−1,0,1; ½O(1) on ℙ¹ | Nef values false,true,true; all three integrable; rational degree 1/2 versus integral degrees ℤ | Rationalization is necessary |
| 1.6: essentially quasi-projective colimit, fixed base | Spec ℚ; identity model; forget vertical data | O(1) degree 1 before forgetting and class 0 after; identity preserves 1 | Noninjective forgetful map distinguished |
| 1.7: complex-valued base and boundary growth | Point; ℂ× boundary at 0 | Green values 1+2=3; (log r)²/abs(log r)=abs(log r)→∞ as r→0 | Quadratic-log wrong model excluded |
| 1.8: arithmetic curve, degree-zero kernel | ℚ, ℤ, ℤ[1/2] | Degree-zero groups ⊕ₚℝ/ℤ, 0, ℝ/ℤ respectively | Missing-prime coordinate detected |
| 1.9: nef effective domination | D=([2],0); D=(0,−1) | ([2],0)−D=0, ([2],0)+D=2[2]; (0,c)−D has coefficient −1 at 2; −1≤−1≤1 but −1<−1/2 | Finite support and metric both matter |
| 2.1: integral finite-type Banach-base analytification | Spec k; Spec ℤ, t=1,1/2; 2-adic point | Cardinality 1 over k; abs(2)=2,√2,1/2 respectively | Arbitrary-radius charts distinguish analytic points |
| 2.2: continuous normed Hᵥ-lines, unsquared Green function | div(2); scaled archimedean ray | exp(log 2)=2 versus wrong exp(log 2/2)=√2; Green O(1) gives 1,1/2 | Divisor/metric inverse and equivariance agree |
| 2.3: adelic analytic realization | O(1),O(2) on Spec ℤ | Archimedean values 1≠2; finite values both 0 | Finite places alone do not separate these metrics |
| 2.4: discrete/archimedean density | Spec 𝔽₂; k(t); powers of ordinary abs | Dense-test closure ∅ versus analytic singleton; abs(t)=e⁻¹,e; at exponent 2, abs(1+1)=4>2 | R01; restrict density or include trivial point |
| 2.5: normality for Green-only effectivity | Spec ℤ, O(c), c=−1,0,1 | Infinite Green values −1,0,1; effectivity false,true,true; finite values 0 throughout | Effectivity signs correct; propagate R01 test-set repair |
| 2.6: dimension n, mixed integrable measures | ℙ¹; ℙ¹×ℙ¹; n=0 | Masses 1,2,−1; mixed mass (2−0−0)/2=1; decompositions 0−1=1−2=−1; empty mass 1 | Polarization and signs correct; mass identity references later §5.2 |
| 2.7: proper model over trivial norm | O on point; ℙ¹ at abs(t)=2 | Stated checks give norm(1)=1 versus rescaling e; O(1) frame X₀ has norm 1/2, X₀² in O(2) has norm 1/4 | Add nontrivial-frame discriminating Checks |
| 3.1: model dimension d; integrable projection formula | 𝔽₄/𝔽₂; purely inseparable tower degree 2 then 2; O(1) on Spec ℤ | Empty degrees 2=2·1; inseparable 4=2·2 (separable degrees would give 1); arithmetic value 1 | d=0 and inseparability treated correctly |
| 3.2: projective flat f, normal base, integrable inputs | Finite flat degree 2; degree-three fibre | ⟨f*O(1)⟩=O(2); a unit twist adds O(3)=3·O(1) | Relative degree factors agree |
| 3.3: composition/projection with flatness where needed | Degrees 2 then 3; fibre degree 3 | Iterated norm gives O(6)=composite norm; pairing with O(2) gives O(6) | Arity and degree products agree |
| 3.4: geometrically reduced connected fibres | Identity; Frobenius on E/𝔽₅, y²=x³+3x+2 | #E(𝔽₅)=5; P=(1,1) has order 5; F*O(P−O)=O while O(P−O)≠O | Correct added reducedness; source's weaker hypothesis fails |
| 4.1: analytic small sections, integral U | Spec ℤ c=−1,0,1 | Cardinalities 1,3,5; logarithms 0,log 3,log 5; norm of 1 at c=−1 is e>1 | Zero section retained; strict/weak norm boundary tested |
| 4.2: model-dimension volume | Spec ℤ c=−1,0,2; Spec 𝔽₄/𝔽₂ | Volumes 0,0,2 and 2 respectively; generic algebraic bundle is trivial in all arithmetic examples | Generic bigness alone insufficient |
| 4.3: nef HS/Siu, d=0 separated | A=O(2), B=O(1) or O(0); Spec 𝔽₄ | vol(A−B)=1=2−1; B=0 gives lower bound 2; d=0 gives 2=2 without d−1 | No division by zero or truncated exponent |
| 4.4: normal base of dimension ≥1, nef-big/effective inputs | Identity; ℙ¹_ℤ with FS O(1)+π*O(1) | Identity pairing L=L; FS pairing degree 1/2+2=5/2 versus stated 2 | R04 |
| 4.5: finite surjective degree r, nef L | Identity; Frobenius of ℙ¹/𝔽₂; degree-zero L | Degrees 1=1·1, 2=2·1; zero degree pulls back to 0 | Bigness iff holds in both directions, including inseparable cover |
| 4.6: absolute arithmetic/relative geometric heights | [1:2] over ℚ, quadratic field; [1:t] under t=u² | Raw heights log 2,2log 2; absolute heights both log 2; geometric heights 1,2 | Field-degree adapter correct |
| 4.7: arbitrary big L, nef geometric-big L, general geometric-big L | Max O(1) twisted by O(−1), then O(c), 0<c<1 | Every nonzero integral degree-m section has norm ≥e^{m(1−c)}>1; volume 0 despite geometric degree 1 | R03; general case needs large twist |
| 4.8: nef, positive geometric top degree | Spec ℚ with O(c); max O(1) on ℙ¹ | Point essential minimum c=normalized variety height c; on ℙ¹ both minima and variety height 0 | n+1 denominator consistent |
| 4.9: global-field carrier comparison | Quadratic K, FS O(1); finite fibre | Raw square [K:ℚ]/2=1, normalized square 1/2; unit Dirac pushforward has mass 1, not 2 | Arithmetic adapter and measure pushforward distinct |
| 5.1: f*L=qL, q>1; polarized case ample | [2] on elliptic curve, Θ; constant twist O(1); zero-dimensional group | [2]*Θ=4Θ; twist sides 4Θ+O(1),4Θ+O(4), difference O(−3); point rigidification 0 | Invariance excludes arbitrary constant twist |
| 5.2: nef geometric part, dimension of Y | Constant elliptic family over a curve; torsion section; fibre elliptic curve | Betti ranks 2<4, 0<2, and 2=2; geometric top degrees 0,0,positive | Full rank detects nondegeneracy; arithmetic top degree may remain 0 |
| 5.3: nondegenerate Y and generic sequence | Generic torsion on a fixed abelian variety; repeated origin | Heights 0 in both; generic orbit limit mass 1; repeated orbit mass 1 but contained in degree-zero-dimensional closed subset | Genericity cannot be dropped |
| 5.4: smooth positive-genus family, Hodge metric | Genus 1 and 2; [K:ℚ]=2 | Squared norm ratio π⁻g raises height by (g/2)log π; raw Hodge degree 2h versus absolute h | Parent Faltings normalization agrees |
| 6.1: projective normal arithmetic polarization, transcendence degree d | ℚ, empty tuple; ℚ(t), H=O | [1:2] height log 2; zero polarization gives every intersection 0; quadratic base gives 2log 2 | Big-polarization condition essential |
| 6.2: Moriwaki height class; ample L and big B for Northcott | [1:n] over ℚ; zero polarization | h_O(2)=2log n=2h_O(1); h_O=0; zero polarization has infinitely many degree-one points of height 0 | Northcott hypotheses necessary |
| 6.3: symmetric ample L; big B for torsion converse | Order-2 point; non-torsion height a; zero polarization | Limits 0; [0],[1],[2] heights 0,a,4a; nontorsion zero-polarization height 0 | Quadratic scaling and converse scope agree |
| 6.4: big B, ample comparison, finite base cover | Degree-two base cover, generic height 3 | Upstairs height 6, base-height growth factor 2, quotient 6/2=3 | Cover-degree and degree-one normalization agree |
| 7.1: abelian A over complete nontrivial nonarchimedean K | Good reduction versus Tate elliptic curve; rigidified trivial bundle | Curvature δζ versus circle Haar, both mass 1; model atomic mass 1 differs from Haar; norm at origin 1 rules out e | Local normalization distinguishes admissibility |
| 7.2: positive-genus curve/square, finite extension allowed | Good reduction; genus-two banana; trivial line | Model banana masses 1+1=2, canonical edge masses 3·(2/3)=2 but atomic versus non-atomic; O constant curvature 0 | Total mass alone is not admissibility |
| 7.3: canonical probability and curvature iff | Banana; good reduction; two flat metrics | Edge density (1/2)/(1+1/2)=1/3, total 1; good-reduction μ=δζ; norms 1,e⁻¹ have same curvature 0 | Values agree; R02 proof cycle |
| 7.4: symmetric pair, mean zero, residue norm one | g=1,2; constant diagonal shift c; ramified scaling 2 | Canonical masses 0,2; shifted mean 0+c=c; shifted residue norm e^c≠1; Green 1 becomes 2 | Curvature alone does not fix pair; R02 prerequisite |
| 7.5: pointed split semistable DVR curve | Good reduction; unramified quadratic extension; elliptic circle | Graph Green 0 gives metric ratio 1; intersection length 1/e=1 rather than 1/2; circle length 1 gives ratio e_K^(1/12) | Ramification, not total extension degree, normalizes length |
| 7.6: powers that remain absolute values | ℚ₂ power 2; ℝ powers 2,1/2; trivial norm | abs(2):1/2→1/4; on ℝ,4>2 excludes power 2, √2≤2 allows half power; model norm 1^a=1 | Archimedean exponent bound necessary |
| 7.7: global field, all places, genus ≥1 | Degree-two extension; genus-one canonical bundle | Raw W→2W; arithmetic W/d=(2W)/(2d), geometric W→2W; elliptic pulled-back canonical square 0 | All-place assembly and normalization consistent |
| 8.1: normal integral base, fibrewise admissible integrable bundle | Base O(1); banana ω; nonconstant smooth weight cos(2πx) | Base fibre curvature 0; banana atomic and edge measures both mass 2 but differ; Laplacian weight −4π²cos(2πx)≠0 | R10: third independent test missing from README |
| 8.2: fixed L on curve/square/abelian scheme | Base twists O(1),O(2); identity twist | Ratio of norms e⁻¹; difference class O(1)≠0; identical metrics difference 0 | Torsor, not unique unnormalized extension |
| 8.3: normalized family pair, g≥1 | g=2; g=1 circle of unit length; transposition | deg w=2 and deg Δ*D=−2; elliptic w model ratio e_K^(1/12) despite both squares 0; swap leaves D unchanged | Genus-one positive-degree normalization is required |
| 8.4: rigidified twice-theta and odd Poincaré | n=0,2,3; twist O(1) | Heights 0,4hΘ,9hΘ; twisted [2] sides differ by O(−3); deg Θ on elliptic fibre 2 | Rigidification excludes constant error |
| 8.5: section x, admissible L | Twist L by base O(1); section self-pair | Both evaluation and pairing shift 1=deg(O(x))·1; ⟨O(x),O(x)⟩=−x*w, so b+(−b)=0 | Adjunction sign consistent |
| 8.6: integrable kernel of underlying Picard map | Base O(1), O(x), continuous Fourier weight | Underlying degrees 0 and 1; Fourier curvature coefficients −2π²8ⁿ unbounded whereas finite-measure coefficients are bounded | Continuity alone fails integrability |
| 8.7: degree-zero admissible M, vertical V | Torsion; non-torsion absolute height a over quadratic K; base constant c | Torsion 0=0; raw self-degree −4a versus printed −2a; mixed base pairing 0·c=0 | R05; class identity itself has correct negative sign |
| 9.1: arbitrary integer d, genus ≥1 | g=2,d=1; d=0; g=1 | Pairing A+8b from both expansions; d=0 self-pairing 0; elliptic second identity 0=0 | Degree-zero and g=1 do not force forbidden division |
| 9.2: canonical/difference/shift, g>1 | g=2,3 | Canonical coefficients (8,32),(24,384); shift (16,32),(128,384); difference 8w+P,12w+P | Algebraic coefficient expansions agree |
| 9.3: rational nef combination, g>1 | g=2,3,1 | P coefficient −1/8+32/256=0, −1/24+384/9216=0; g=1 denominator 0 | Positive-genus boundary correctly excluded here |
| 10.1: effective polarized compact connected graph | Edgeless genus 2; one genus-two unit loop; doubled loop | (δ,ε,φ,τ)=(0,0,0,0),(1,1/6,1/12,1/12),(2,1/3,1/6,1/6) | μ_can must be allowed signed; homogeneity correct |
| 10.2: g≥2 graph bounds | Unit loop; g=4 constant | δ+ε−2φ=1=(3/2)−6/12; φ=1/12>1/39; t(4)=9/(8·33)=3/88>1/39 | Factors and lower bounds agree |
| 10.3: local integral and spectral φ, g>1 | Unit loop, unramified/ramified quadratic extension; complex basis ω=√2β | Graph φ=1/12,1/12,1/6; spectral sum changes 2S→8S though integral stays 2S | R07: coefficient must be 1/(2λ) for stated basis |
| 10.4: geometric ε divisor, stable compactification | Good reduction; unit type-zero node in genus 2 | Green values 0,1/6; model square minus admissible square 1/6 | Correction sign positive |
| 10.5: boundary bound | Same node; no edges | 2δ−ε=2−1/6=11/6≥0; zero graph 0−0=0 | Effectivity test consistent |
| 10.6: φ divisor on base, diagonal triple pairing | Good reduction; type-zero unit node; archimedean half-ray | Values 0,1/12; archimedean b→b/2; P−triple pairing=φ | Domain must be square; R07 affects spectral evaluation only |
| 10.7: difference triple pairing | g=2, W=2, φ=5 (hyperelliptic relation) | RHS 4(3g−1)W−8φ=20·2−40=0; elliptic boundary g=1 also gives 0 if both invariants 0 | Triple-pairing coefficient consistent |
| 10.8: geometric φ boundary | Unit genus-two node | φ−δ/39=1/12−1/39=3/52>0; good reduction 0 | Uniform graph coefficient gives effectivity |
| 10.9: Hodge lower decomposition | g=2, λ=1 | c=1/25; effective remainder bound yields P≥1/25; constant family λ=P=0 | Positive coefficient, not positivity for every family |
| 10.10: canonical rational modified diagonal | Hyperelliptic g=2, φ=5,W=2; degree-two extension | (5/2)·2−5=0; upstairs (5/2)·4−10=0 | Raw scaling and normalized cycle height agree |
| 10.11: θ norm and δ | Genus 1; θ norm multiplied by e | φ=0; δ=−24I−8log(2π); I→I+1 gives δ shift −24 | Fourier normalization essential; g=1 outside g>1 end results |
| 10.12: arithmetic Noether, semistable model | g=2, degree 1 then 2 | W_Ar=12h−δ+8log(2π); extension doubles every raw term and constant to 16log(2π) | Field degree and sign agree |
| 10.13: arithmetic Noether divisor, k=ℤ or ℚ | Section sign change; unit node g=2; Spec ℚ forgetful map | abs(−s)=abs(s); δ+ε=7/6; geometric image on Spec ℚ is 0 despite arithmetic value 7/6 | Arithmetic carrier cannot be replaced by geometric one |
| 10.14: hybrid obstruction | abs(t_n)=e⁻ⁿ, exponent 1/n | abs(t_n)^(1/n)=e⁻¹; proposed ε-values 0 along sequence versus limiting 1/6 | Continuity contradiction genuine; no claim against good-reduction special families |
| 11.1: fixed genus >1 compact Riemann surfaces | Boundary error 1/156; t=e⁻ⁿ | 1/39−2/156=1/78>0; lower Green bound n/78+O(1)→∞ | Compactness can give positive minimum |
| 11.2: maximal variation over fixed constant field | Spec 𝔽₂,Spec 𝔽₄ over 𝔽₂; genus-two base curve λ=1 | Empty degree/volume 1,2; curve P≥1/25; constant family curve P=0 outside hypothesis | Zero-dimensional bigness and variation scope agree |
| 11.3: arithmetic base dimension d≥1 | d=1, g=2, K quadratic | Empty generic degree 2, lower raw degree (2c₀/5)·2=4c₀/5; normalized bound 2c₀/5 | Missing field factor would halve raw bound |
| 11.4: maximal variation, canonical bigness | g=2, dim S=0,[F:k]=2; dim S=1 | Positive term 16·2=32; dividing by 8 gives canonical degree 4; dimension-one base term 32P>0 | Both dimension branches agree |
| 12.1: projective flat with geometrically integral generic fibre | e=0,Y=S; positive-dimensional constant family with base L | m⊠L=mL, volume m^d vol L; base pullbacks have fibre top degree 0 in every power | m≥1 and positive fibre dimension distinguished |
| 12.2: nef L, positive a, relative powers | e=1,m=2; d=0,[F:k]=2,a=2; d=2,m=3,M²=3 | Exponents (2,1),(1,2) give aM, (3,0),(0,3) give 0; selected degrees 4,8; last term 2·3=6 | Multinomial/empty-degree conventions agree |
| 12.3: potential-bigness iff | d=0,[F:k]=2,a=2; e=0 | m=1,2 top degrees m!2^m·2=4,16; e=0 gives m^d vol L>0 iff vol L>0 | All three directions retain positive fibre degree |
| 12.4: reduced nonempty proper closed Z⊊C^m | m=1, three points; m=2, grid of three points; empty Σ | Bounds 3≤3, 3≤√9=3; empty cardinality 0≤bound | Root exponent 1/codim correct |
| 12.5: maximal variation, theta pullbacks, generically finite Y→J | g=2,dα=1; blowup Y→Jac(C) | Pairings 2P+ι*Θ,8w+P,16Θ+32P; blowup exceptional degree 0 but theta square 8 | R11: generic-finite pullback need not be ample |
| 12.6: integral characteristic test schemes | ℙ¹ at p=2,3; Spec ℤ[x]/(x²−2) at p=2 | O(1) degrees 1,1; constant metric shifts 0,0; fibre ring 𝔽₂[x]/x² versus reduced test 𝔽₂ | No adelic carrier asserted for nonreduced fibre |
| 13.1: stable function-field Hodge height | Constant curve; degree 3 after extension degree 2; genus 2 | Heights 0,3/2; thresholds 3⁻¹⁶ and 4⁻¹⁶; fixed-constant-field base degree 2 doubles height | Auxiliary-extension independence distinct from changing base field |
| 13.2: finite global bad-place sums | Degree-one type-zero node g=2; degree-two extension | (δ,ε,φ)=(1,1/6,1/12)→(2,1/3,1/6); good reduction geometric sums 0 | Raw versus absolute sums consistent |
| 13.3: canonical-square correction | g=2, h=1/10,δ=1,ε=1/6,φ=1/12 | Model W=1/5; admissible W=1/5−1/6=1/30=(2/5)(1/12) | Correction and hyperelliptic relation agree |
| 13.4: Hodge-index lower bounds and graph constants | g=2,3,4,≥5; asymptotic g | Strengthened g=2 coefficient 429/4=107.25; A(3)=1648/17≈96.94; A(4)=139; A(5)≤109.625; limit 47 | Numeric bounds agree; R08 missing proof input |
| 13.5: function-field comparison | h=1,δ=ε=0; coefficient A=139 | W=12, 1/12≤12≤12; 12/139>1/12 since 144>139 | Claimed coarser bounds follow |
| 13.6: Wilms δ lower bound, g≥1 | g=1,2; Jensen coefficient | Bounds ≈−10.5441,−21.0883; 6g log2−8g log(2π)=−2g log(2π⁴) | Strict lower bound and factor g agree |
| 13.7: Bost adapter and positive comparison height | g=1; h at lower bound and h=1 | Shift logπ/2≈0.572365; lower h=−1.491303; c≈2.491303 gives h+c=1; h=1 gives 3.491303≥1 | Faltings/Deligne shift necessary |
| 13.8: coercive arithmetic divisor | K₄ with six unit edges, c=17/288 | δ=6,φ=17/48,ε=11/6; D=107/48; D−δ=−181/48<0; D−cδ=15/8>0 | Corrected boundary coefficient survives negative control |
| 13.9: number-field comparison, g>1 | Log constants at g=2; coefficient bound | 4log(2π⁴)+8log(2π)=12log(2π²); 139+7/2=142.5<144 | Degree normalization and coarse coefficient agree |
| 13.10: uniform fixed-genus comparison | h≤1; h≥max(1,24abs(c₅)); function-field g=2 | max(h,1)=1; h/12+c₅≥h/24; c₃=4⁻¹⁶/12>0,c₄=12 | Constant independent of field; nonisotriviality needed geometrically |

## Not verifiable

- moret-bailly-1989, Théorème 2.5, pp. 491–498, and faltings-1984, Theorem 6 and pp. 401–402: their manifest records are settled as uncertified. The constants were compared with the readable Yuan and Wilms formulas, but the original texts were not certified or requested again.
- The direct Yuan–Zhang 2017 source for local Calabi uniqueness could not be certified by the source service. R02 instead uses the fully readable restatement in yuan-zhang-2025 Theorem A.6.1 and states the additional curve argument explicitly.
- The two declared supplier gaps are future contracts, not implemented theorems. Their names, scopes, ownership and matching plan entries were checked; implementation is outside this package review.
- No Lean elaboration or build was run, as required by the read-only brief. With zero declarations there are no elaborated target signatures to compare. The pinned carrier inspection supports the module docstring's statement boundary; it is not a proof of the future headline theorems.

## Source issues

- **Error** in yuan-2026 at Lemma 2.1(1), printed p. 25 (yuan-2026 line 863): the source says geometric connectedness suffices for integral Picard pullback injectivity; it should be strengthened by geometric reducedness, since elliptic Frobenius kills nonzero p-torsion line bundles; affects a stated result.
- **Gap** in yuan-zhang-2025 at Lemma 3.1.1(1), printed pp. 67–68 (yuan-zhang-2025 line 2417): the source says divisorial valuations are dense without a dimension-zero exception; it should be supplemented by the trivial-valuation case, since Spec 𝔽₂ has one analytic point and no prime divisors; affects the proof.
- **Misprint** in yuan-zhang-2025 at §3.2, printed p. 72 (yuan-zhang-2025 line 2632): the source says the metric associated to Green function g is exp(−g/2); it should be exp(−g), inverse to the immediately stated −log norm convention; affects a stated result.
- **Misprint** in yuan-2026 at §2.2.3, printed p. 32 (yuan-2026 line 1100): the source says a pairing on X is added directly to the base class (2g−2)β₂; it should be added to its pullback (2g−2)π*β₂; affects the proof.
- **Gap** in yuan-2026 at proof of Theorem 2.3, §2.2.3, printed p. 32 (yuan-2026 line 1103): the source says the displayed condition determines β₂ for every positive genus; it should be given a separate positive-degree normalization when g=1, since its coefficient 2g−2 is zero; affects the proof.
- **Gap** in yuan-2026 at proof of Theorem A.1, §A.4, printed p. 113 (yuan-2026 line 3830): the source says taking L=ω proves the required Green-mean normalization; it should be replaced by a positive-degree admissible L in genus one, since c₁(ω)=0 there; affects the proof.
- **Error** in yuan-2026 at §3.3.1, printed p. 49 (yuan-2026 line 1660): the source says node count after a splitting extension is divided by its field degree; it should be divided by ramification index for unit-uniformizer normalization; an unramified quadratic extension does not halve the length; affects a stated result.
- **Misprint** in yuan-2026 at §3.3.1, printed p. 49 (yuan-2026 line 1671): the source says the spectral coefficient is 2/λ for an (i/2)-orthonormal basis; it should be 1/(2λ) for that basis and the displayed Laplacian; affects a stated result.
- **Misprint** in zhang-2010 at Theorem 1.3.1, printed pp. 6–7 (zhang-2010 line 215): the source says the spectral coefficient is 2/λ with an (i/2)-normalized holomorphic basis; it should be 1/(2λ), or retain 2/λ and use the i-normalization of Proposition 2.5.3; affects a stated result.
- **Misprint** in zhang-2010 at Proposition 2.5.3, printed p. 38 (zhang-2010 line 1238): the source says both factors of the second mixed curvature term are evaluated at y; it should be ωᵢ(y)∧ω̄ᵢ(x), as the following expansion requires; affects the proof.
- **Misprint** in yuan-2026 at §3.3.2, printed p. 50 (yuan-2026 line 1709): the source says the diagonal-square integrand is integrated over the curve fibre; it should be integrated over the fibre of X×ₛX; affects a stated result.
- **Error** in yuan-2026 at proof of Theorem 4.14, printed p. 94 (yuan-2026 line 3208): the source says D̃−Δ̃ is effective; it should be D̃−c(g)Δ̃, as the next page proves; unit K₄ gives D̃−Δ̃=−181/48; affects the proof.
- **Error** in moriwaki-2000 at Proposition 3.3.7(4), printed p. 15 (moriwaki-2000 line 654): the source says a big polarization gives Northcott finiteness for arbitrary L; it should be restricted to ample L; O on ℙ¹ gives infinitely many degree-one points of height zero; affects a stated result.
- **Misprint** in moriwaki-2000 at §3.4, printed p. 16 (moriwaki-2000 line 701): the source says the linear part is lim 2⁻ⁿ(2⁻²ⁿh(2ⁿx)−q(x,x)); it should be lim 2⁻ⁿ(h(2ⁿx)−2²ⁿq(x,x)); the printed limit annihilates the linear part; affects a stated result.
- **Gap** in gao-habegger-2019 at Appendix A.1, printed p. 54 (gao-habegger-2019 line 2533): the source says a quasi-projective arithmetic model with hermitian bundles specifies a Moriwaki polarization; it should be a projective normal model, or include projective extension data before taking arithmetic intersection degrees; affects a stated result.
- **Misprint** in baker-rumely-2007 at Theorem 14.1(A), printed p. 36 (baker-rumely-2007 line 1907): the source says μ_can is a probability measure; it should be a possibly signed measure of mass one; formula (14.1) assigns mass −1/2 to a trivalent vertex; affects a stated result.
- **Error** in wazir-2006 at Proposition 0.2(3), printed p. 3 (wazir-2006 line 105): the source says Northcott finiteness holds for every line bundle; it should be restricted to ample line bundles; the trivial bundle on ℙ¹ has infinitely many bounded degree-one points; affects a stated result.
- **Misprint** in wazir-2006 at proof of Proposition 0.2, printed p. 3 (wazir-2006 line 121): the source says successive proof paragraphs establish properties numbered one above the displayed properties; it should be renumbered to match Northcott (3), functoriality (4), domination (5), and the ratio limit (6); affects nothing.
- **Error** in wazir-2006 at Proposition 0.3, printed p. 4 (wazir-2006 line 148): the source says canonical heights of all ample line bundles are nonnegative; it should be restricted to symmetric ample bundles; for L=t_Q*Θ, the usual canonical height at −Q is −ĥ_Θ(Q)<0; affects a stated result.
- **Error** in wazir-2006 at Theorem 0.2, printed p. 4 (wazir-2006 line 170): the source says any base line bundle M bounds the specialization height error; it should be ample; for E×ℙ¹ and L=pr_E*Θ+pr_base*O(1), the zero-section error is unbounded while h_O=O(1); affects a stated result.
- **Error** in cinkir-2015 at concluding inequalities (7)–(8), printed p. 18 (cinkir-2015 line 1058): the source says the rational inequalities hold for all six nonnegative inputs; it should be restricted to C>0 or stated after clearing denominators; six zero inputs give C=0 and undefined fractions; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "789d0416f4a87388a30fd816fd9e66fb2f1559f2", "job": "RT-ArakelovGeometryAndAbelianHeightsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
