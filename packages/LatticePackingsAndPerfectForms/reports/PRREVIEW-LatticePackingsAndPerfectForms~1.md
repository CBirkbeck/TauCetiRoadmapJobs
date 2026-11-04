# Review of LatticePackingsAndPerfectForms (pull request #1723 at e6fed61)

**Verdict:** needs changes

## R01 (P1) — The empty certificate proves a false completeness theorem

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:490–507; TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:710–720.

**Claim:** The certificate has no nonemptiness field, but its completeness theorem says its list contains a representative of every perfect form.

**Witness:** In rank one, set forms = ∅. Every field is vacuous. For A = [1], completeness demands membership in ∅; the Hermite corollary gives 1 = sSup ∅ = 0.

**Repair:** If retaining this mathematical completeness criterion, require forms.Nonempty and reconcile it with the policy repair in R22. The singleton {[1]} passes the rank-one test; the empty list is rejected. Both empty-certificate facts were proved in a scratch Lean probe.

## R02 (P1) — Harmonicity is measured in the wrong coordinates

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:663–690; TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:791–818.

**Claim:** The cusp-form theorem evaluates P in an arbitrary integral basis but assumes the ordinary coordinate Laplacian vanishes. That Laplacian describes the Euclidean metric, not the metric of gramForm hL b.

**Witness:** For the pinned E₈ Cartan Gram matrix, P = X₀² − X₇² has ordinary Laplacian 0. Its norm-two shell sum is 120, whereas the asserted weight-six level-one cusp form must be zero.

**Repair:** Use the Gram-metric Laplacian Σᵢⱼ(A⁻¹)ᵢⱼ∂ᵢ∂ⱼ, or transport P from orthonormal coordinates of FormSpace A. Here diag(A⁻¹) starts with 4 and ends with 2, so Δ_A P = 4 excludes the counterexample. The corrected harmonic polynomial X₀² − 2X₇² has Δ_A = 0 and shell sum 240 − 240 = 0. Keep homogeneous degree, positive degree, evenness and unimodularity. 

## R03 (P1) — The inverse-form action needs an inverse transpose

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:405–407.

**Claim:** The identity `(U • A)⁻¹ = U⁻¹ • A⁻¹` conflicts with the stated right congruence action UᵀAU.

**Witness:** A = I₂ and U = [[1,1],[0,1]] give left side [[2,−1],[−1,1]], but the stated right side is [[1,−1],[−1,2]].

**Repair:** Replace the acting matrix on the right by U⁻ᵀ: (UᵀAU)⁻¹ = U⁻¹A⁻¹U⁻ᵀ. Both sides then equal [[2,−1],[−1,1]]. Specify the dual comparison direction too: x ↦ Ax goes from the dual lattice in FormSpace A to stdLattice A⁻¹; the reverse map is A⁻¹.

## R04 (P1) — Minkowski’s “equivalent” inequality has the wrong exponent

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:483–487.

**Claim:** The claimed equivalent inequality uses (min A)ⁿ rather than (min A)^(n/2), although the minimum is a squared length.

**Witness:** For A = [4], n = 1, min A = 4 and V₁ = 2. The displayed inequality reads 8 ≤ 4, while the original Minkowski bound reads 4 ≤ 4.

**Repair:** Use (min A)^(n/2) Vₙ ≤ 2ⁿ√det A with n > 0. On [4] it becomes 4 ≤ 4. The Lean signature hermite_le_minkowski already uses the correct normalization.

## R05 (P1) — Determinant-one reduced forms are not compact

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:520–524 and 688–690.

**Claim:** Layer 4.8 claims compactness of all determinant-one Minkowski-reduced forms; 2.2 also omits the restriction on ε needed for its lower bound.

**Witness:** A_t = diag(1/t,t), t ≥ 1, is reduced with determinant 1 and minimum 1/t. Its second diagonal entry tends to infinity, so these forms have no compact containing set.

**Repair:** Require min A ≥ η for a fixed η > 0. In 2.2 choose 0 < ε < γₙ, so η = γₙ − ε > 0. Realize lattices in one fixed Euclidean space and use GoN §4.5.8. The test family is then restricted to t ≤ 1/η. Handle rank one separately from GoN’s n ≥ 2 statement.

## R06 (P1) — Escalation need not increase the rank

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:870–877.

**Claim:** The definition requires corank one, but the escalation lemma quantifies over every embedding in a universal lattice.

**Witness:** L = 2ℤ⁴ inside M = ℤ⁴ has truant 1, and M is universal. Every sublattice of M has rank at most four; no corank-one extension of L lies in M.

**Repair:** Define escalation as L + ℤv with norm(v) = truant L, allowing the same rank. See bhargava2000 line 1454. In the test, v = e₁ gives a rank-four escalation of index two over L. Rework the finiteness and tree statements for this definition; a corank-one-only tree cannot justify the general lemma.

## R07 (P1) — Square roots do not identify negative-norm shells

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:398–399 and 423–424.

**Claim:** The shell comparison and the closed-ball identification are stated without a nonnegative radius-squared hypothesis.

**Witness:** At t = −1, Real.sqrt t = 0. For ℤ in its usual metric, the sphere intersection is {0}, cardinality 1; vectorsOfNorm(−1) is empty, cardinality 0.

**Repair:** Use t ≥ 0 for the sphere comparison, or use the squared-norm level set for all t, as ThetaSeries §2G does. For bounded sublevels split C < 0 (empty) from C ≥ 0. The corrected negative shell is empty on both sides; t = 0 gives {0} on both sides.

## R08 (P1) — The tensor scaling assertion includes the zero vector

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:941–944.

**Claim:** The assertion for every w identifies L₁ ⊗ ℤw with the full lattice L₁ scaled by B₂(w,w).

**Witness:** Take L₁ = ⟨1⟩ and w = 0. The tensor sublattice has rank zero; scaling L₁ by zero leaves a rank-one carrier with zero form, not a positive definite lattice.

**Repair:** Assume w ≠ 0 (and the stated positive definiteness), hence B₂(w,w) > 0. Require nonzero vectors in the orthogonal family as well. For w = 2 in ⟨1⟩, both sides have rank one and Gram [4]; the zero-vector case is explicitly excluded.

## R09 (P1) — Positive-rank claims contradict the explicit rank-zero conventions

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:282–286, 362–364, 464–466, 566, 607, 616–617, 696–697, 780–783.

**Claim:** Total rank-zero definitions coexist with unrestricted primitive-form uniqueness, packing-fraction, equality-rank, perfection and eutaxy/design assertions.

**Witness:** For n = 0: min = ρ = μ = 0, density = 1, S = ∅, perfect and strongly eutactic are true. The packing union is empty and no spherical design has this empty set.

**Repair:** Keep the total definitions, but explicitly impose n > 0 on primitive integral normalization, the open-ball density interpretation, “packing = covering iff rank one,” “ℤⁿ perfect iff n = 1,” the strong-eutaxy coefficient formula and its design equivalence. The rank-zero Ryshkov vertex has min 0, so its “min = 1” characterization also needs positive rank. At rank zero the empty gcd is 0, any positive eutaxy coefficient works, and the open-ball volume ratio is 0, so none of those exceptional cases should assert the positive-rank conclusions. Lean coeff_eq and the design equivalence already have the needed binder.

## R10 (P1) — The Hermite range is not bounded below by one

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:512–514.

**Claim:** The value at ℤⁿ proves a lower bound for the supremum, not for the whole range of hermite.

**Witness:** A = diag(1,4) has min = 1, det = 4 and hermite = 1/2 < 1. More generally diag(1,t²) has hermite 1/t.

**Repair:** Say that 1 belongs to the range, hence 1 ≤ γₙ; the range is positive for n > 0 and has infimum 0 for n ≥ 2. This retains 1 ≤ γ₂ while accepting the computed range member 1/2.

## R11 (P1) — Several suppliers do not provide the cited target at its locator

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:69–75, 145–151 and 574–577.

**Claim:** The dependency contract names nonexistent SuccessiveMinima §§3.21/3.22, misidentifies GoN §4.5.2 as Mahler compactness, and cites a pinned ZLattice.exists_basis_gauge_le that does not exist.

**Witness:** SuccessiveMinima main ends Layer 3 at §3.4. GoN §4.5.2 defines criticalDeterminant; §4.5.8 states Mahler compactness. A search of both pinned libraries finds no exists_basis_gauge_le.

**Repair:** Repoint the upper second theorem to its actual earlier owner, GoN §1.3, and first-theorem uses to the pinned MeasureTheory convex-body declarations. Cite GoN §4.5.8 with η > 0 and its fixed quotient; replace CompactStarBody by the actual StarBody contract with explicit boundedness when needed. For Jarník’s upper bound, use independent vectors attaining successive minima and round in their finite-index sublattice: for diag(1,4), the resulting bound is (1+2)/2 = 3/2. Completed/HeightsAndUnits §2.1 supplies a different basis bound, not a basis with each length ≤ λᵢ. Also correct “beyond the pin”: successiveMinimum and IsPosDef.minimum_le_rpow_mul_determinant_rpow actually exist at the pin; use IntegralLattices §§2E–2G for the remaining planned inputs, rather than an unspecified future Tau Ceti.

## R12 (P1) — Deep proof inputs are excluded instead of owned

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:181–184, 580–584, 730–737 and 900–903.

**Claim:** The roadmap promises Leech covering and γ₂₄ = 4 while excluding their stated proof machinery; the 290 route similarly names analytic representation bounds without a target or supplier contract.

**Witness:** The 4.11 dependency row contains only Rank24 constructions and 2.1. Neither gives the packing upper bound. Cohn–Kumar’s proof uses linear programming; the cited Lean theorem imports magic-function and rigidity modules.

**Repair:** Add mathematical targets and exact dependencies for the general bounds and the specialized analytic input needed by the selected proof route, or import precise sections from a permitted earlier owner. State the Leech deep-hole classification needed for μ = √2, and the quantified representation bounds needed for terminal 290 forms. An external proof is a porting source, not an installed supplier. A legal reading of spherepackinglean lines 6–10 and 29–44 confirms the external theorem exists, but no pinned adaptation or dependency closure is supplied here. After repair the Leech lower witness min 4, det 1 must be paired with an owned upper bound 4, not merely with the definition of γ₂₄.

## R13 (P1) — The acceptance gate is failing

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:1 and 525–528.

**Claim:** The worker’s targeted build gate fails because this file imports module-system Mathlib without a module header. Direct elaboration exits zero but emits this forbidden extra warning.

**Witness:** gate.md records build=1 FAIL and the module-system warning. The original direct elaboration reproduced that warning alongside the 80 permitted sorry warnings.

**Repair:** Add module before the imports and adapt gramForm’s proof to the visible integralNorm_apply API. On a scratch copy the old definitional-equality step then needed: intro x hx; simpa only [LinearMap.BilinMap.toQuadraticMap_apply, ← L.integralNorm_apply] using hL.posDef_integralNorm x hx. That repaired copy elaborated with only sorry warnings. Rerun the supplied gate on the repaired head; this review does not treat a scratch success as a passing PR gate.

## R14 (P2) — A rank-one facet has no positive neighbouring step

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:701–707; TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:462–484.

**Claim:** The facet-normal condition does not ensure a finite positive step to another perfect form in rank one. The README additionally uses min = 1 while applying the construction to unnormalized integral forms.

**Witness:** P = [1], N = [1] satisfies the facet-normal definition: its zero span has dimension 0 = 1−1. min(P+tN) = 1+t, so the admissible set is {0}, ρ = 0, neighbour = P.

**Repair:** Restrict the positive-step and distinct-adjacency assertions to n ≥ 2, with rank one as the isolated base case. Use the common level min P, as the Lean definition does, or normalize every input to minimum one before taking neighbours. Rank one needs no edge; [2] is not fed to a minimum-one formula.

## R15 (P2) — Generic harmonic polynomial theory already has an earlier owner

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:307–310, 328–332 and 791–808.

**Claim:** Layer 5.4 rebuilds the polynomial Laplacian and Fischer decomposition, and 5.5 claims ownership of harmonic Gaussian Fourier theory because ThetaSeries lacks weights.

**Witness:** TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1710, §4.3, defines polynomialLaplacian in arbitrary dimension and states polynomial_fischer_decomposition, polynomial_sphere_harmonic_span and fourier_harmonic_gaussian.

**Repair:** Import those §4.3 targets by name. Retain the design application, the Gram-metric adapter from R02, and the extension from positive real Gaussian parameter to τ ∈ ℍ as explicitly new work. Prove that extension by holomorphic continuation or a valid complex-parameter argument: substituting a complex y/√s is not a change of variables in ℝⁿ. At τ = i the formula must reproduce the supplier’s factor (−i)^d; for d = 1 it is −i, not +i.

## R16 (P2) — Use the existing discriminant isometry carriers and maps

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:982–986; TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:740–781.

**Claim:** The README names the existing finite-module isometry carrier, but Lean builds new bilinear and quadratic subgroups and repeats preservation statements.

**Witness:** Pinned TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Bilinear.lean:193 defines Isometry.discriminantBilinearIsometry; Discriminant/Quadratic.lean:232 defines Isometry.discriminantQuadraticIsometry. Both preserve the native pairings and require nondegeneracy.

**Repair:** Use FiniteBilinearModule.Isometry and FiniteQuadraticModule.Isometry on nondegenerate lattices, bundle the existing induced maps as group homomorphisms, and keep the new index theory. Cite the existing preservation results instead of restating them. The ⟨8⟩ control still gives bilinear group order 4 and quadratic group order 2; using the native quadratic carrier preserves that distinction.

## R17 (P2) — Three promised Hermite headline signatures are absent

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:722–726; TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:344–348.

**Claim:** The README and the docstring promise γ₅⁵ = 8, γ₆⁶ = 64/3 and γ₇⁷ = 64; only the rank-four and rank-eight theorems are declared.

**Witness:** hermiteConstant already has type ℕ → ℝ. The rank-five, six and seven statements need no new carrier or definition; their omission cannot be attributed to the pins.

**Repair:** Add the three full headline signatures with sorry. They must evaluate on D₅, E₆ and E₇ to 2⁵/4 = 8, 2⁶/3 = 64/3 and 2⁷/2 = 64. Inventory the other deep README endpoints in the module docstring, naming the missing carrier for each genuinely unstatable result; “specified in README only” is not that inventory.

## R18 (P2) — The Schur argument uses congruence invariance as commutation

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:633–636.

**Claim:** The raw matrix Q = Σ xxᵀ does not generally commute with the integral automorphism matrices. They preserve A, not the coordinate Euclidean metric.

**Witness:** For A₂, Q = [[4,−2],[−2,4]] and U = [[−1,−1],[0,1]]. UQ = [[−2,−2],[−2,4]], while QU = [[−4,−6],[2,6]].

**Repair:** Use the A-self-adjoint endomorphism QA, which commutes with Aut A because UQUᵀ = Q and UᵀAU = A. Its eigenspaces are invariant, so real irreducibility makes QA scalar. On the test QA = 6I and Q = 6A⁻¹; the eutaxy coefficient is 1/6. Keep irreducibility and positive rank explicit.

## R19 (P3) — Remove acceptance-file padding

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:170, 266, 278, 336, 592–597 and 722.

**Claim:** The file contains one-lemma consequences, a normalization API lemma, boundary/value checks, and a truant definition unused by any headline.

**Witness:** norm_sq_formSpace closes with exact InnerProductSpace.norm_sq_eq_re_inner (𝕜 := ℝ) x. volume_ball_eq_unitBallVolume is already a single library application. The E₈ density and A₂ Hermite declarations reproduce worked-example values.

**Repair:** Delete them from Suggested.lean; retain the mathematical statements and checks in the README. Delete the normalized-vector API declarations if no retained headline needs them, and the unused truant definition. Keep necessary implementation proofs inside retained definitions. The exact norm proof was tested successfully on a scratch copy. All 80 original sorried theorems were also tried with simp, rfl and infer_instance individually; none of those three tactics alone closed another target. This does not make elementary API statements into headlines.

## R20 (P3) — The required local API and Checks structure is missing

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1, 350–407 and 791–799; TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:69–75 and 93–117.

**Claim:** The README has no Summary paragraph, Exact supplier contracts or How to read the build section, no per-layer Examples/Dependencies endings, and only three explicit Checks blocks. Most definitions have no three local discriminating checks.

**Witness:** For 0.1, 1.3 and 5.4 there are zero local Checks blocks. Only §§7.1–7.3 have them. Numerous Lean definitions and theorems also lack declaration docstrings.

**Repair:** Use the required headings and prose/API/Checks layout, with itemized dependencies per target. For the action add identity, shear and noncommuting-product controls; for normalized vectors use (0,1), (0,−1), and 0; for harmonicity use 1, X₀² and X₀²−X₁². These give respectively true/false distinctions and Laplacians 0,2,0. Add declaration docstrings and align layer comments. Move library-status claims into Scope and ownership; restrict the opening similarity-invariance assertion to scale-free invariants (minimum and radius scale).

## R21 (P3) — The sampled source locators are incomplete or wrong

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:610–620, 692–707, 825–833 and 1122–1125.

**Claim:** Most sampled targets offer broad bibliography pointers instead of theorem/section and printed-page locators; the reference to Venkov §§6–7 for the weighted theta and extremal theorem points to the wrong sections.

**Witness:** The legally read Venkov text states weighted theta modularity at Theorem 16.1, printed p.59, and the extremal minimal-shell theorem at Theorem 16.4, p.61. Its all-shell argument is equation (16.6) and following, p.62.

**Repair:** Cite the version actually read, with Theorem 16.1 and Theorem 16.4 plus the all-shell proof step (venkov2001 lines 8251–8259, 8394–8400, 8550–8592). Supply exact locators for every other theorem and API claim, particularly 0.1–1.5, 4.2, 4.9 and 7.1–7.2. Separate odd harmonic degree (theta cancels by x ↦ −x) from the even-weight dimension formula in 5.7; weight 25 has cusp dimension 0, not either 1 or 2. Unread books are not certified.

## R22 (P3) — Computational certification is part of the planned output

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:710–726, 881–904 and 1026–1035.

**Claim:** The roadmap plans enumeration certificates checked against large stored lists and decidability/finite-check interfaces for displaying database predicates, contrary to the mathematics-only scope.

**Witness:** 4.10 requests certificates for 10,916 forms; 6.3 requests an escalator-tree certificate; 8.2 requires equivalence to a successful finite check. These are explicit implementation/certification targets, not small illustrative examples.

**Repair:** Replace executable/certificate deliverables with the mathematical classification, completeness and representation theorems, and their general proof inputs. Keep small Gram, shell and universality calculations as Checks. The computed A₂ ⊗ A₂ example (rank 4, determinant 81, minimum 4, 18 shortest vectors) remains a suitable Check; a 10,916-form stored-data verification does not.

## R23 (P3) — The criticism of the density knowl is not supported by the cited live text

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:219–221.

**Claim:** The README attributes a formula “minimum 2ρ” to the LMFDB density knowl and presents it as an error.

**Witness:** The fetched lattice.density knowl, lmfdb-density lines 90–92, defines density as the occupied fraction and contains no formula equating the minimum with 2ρ.

**Repair:** Delete the attribution or cite an identifiable historical version that actually contains it. Retain the normalization check: for E₈, ρ = √2/2 gives π⁴/384; substituting ρ = 1 gives π⁴/24 > 1. That is a useful negative control without alleging an error in the available source.

## Verified sound

Read the complete README and all 144 Lean declarations (80 admitted theorems), the normative rules, and main SuccessiveMinima, ThetaSeries and IntegralLattices. Successful table rows verify instances, not general theorems; source limits are listed below.

**Build and principles.** HEAD matched e6fed6193da2ae7bcd4d12e8274e044c22b907b2. The outside-folder diff was empty and the worktree remained unchanged. There are no sorry-valued data definitions, set_option commands, roadmap imports or admitted examples. The gate’s complete outcome was:

```text
gate LatticePackingsAndPerfectForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=1 FAIL
```

The required dependency command returned:

```text
depcheck: 204 roadmaps, 1572 edges, 0 problem(s)
```

No UPWARD/CYCLE lines or declared gaps. Semantic supplier errors are R11. The scope is repairable as an extension; duplicate inputs are R15–R16.

**Signatures and padding.** Original elaboration and all 144 scratch `#check @name` commands exited zero with the module warning. Comparing every signature with the README, the dropped finite-dimensional/measurable/Borel binders from polynomialsOfDegreeLE are harmless: its span needs only an inner-product space. Design predicates retain integration instances. R02 is the substantive metric mismatch. The padding probe tried simp, rfl and infer_instance on all 80 admitted theorems; all still needed sorry. The separate exact-library-lemma probe closed norm_sq_formSpace. A scratch module-header/Gram-proof repair elaborated with only 79 sorry warnings (the norm identity was proved). A second scratch probe constructed the empty certificate with no admitted fields and verified the empty-image supremum calculation. No PR file was edited.

**Headline inventory.** README endpoints are: real Minkowski and Hermite bounds; finiteness, attainment and Mordell’s inequality for γₙ; exact γ₁–γ₈ and γ₂₄ with critical-form classification; Voronoi cell/fundamental-domain and covering theory including Jarník and the Leech radius; Voronoi’s extremality criterion; finiteness of perfect and eutactic classes and neighbour-graph completeness; moment/design criteria, strong perfection, harmonic Fourier transform, weighted theta modularity and Venkov’s shell theorem; impossibility of rank ≤3 universality, the 15 theorem and the 290 theorem; Kitaoka’s tensor minimum theorem; and discriminant-image/index theory. R17 identifies three statable missing Hermite values. The tensor omission is named without explaining the missing carrier. Covering/Jarník, harmonic Fourier and classification also need a statability inventory. No stand-in was found.

**Computed adversarial table.** Notation: A₂ = [[2,1],[1,2]], A₃ = [[2,1,0],[1,2,1],[0,1,2]], B = [[2,1],[1,3]], U = [[1,1],[0,1]], and Q(A) = Σ over S(A) of xxᵀ. All coordinates are column coordinates. Integer shell enumeration is exhaustive by |xᵢ|² ≤ A[x](A⁻¹)ᵢᵢ. E₈ reflection closure uses the pinned Cartan edges 0–2,1–3,2–3,3–4,4–5,5–6,6–7 and yields 240 roots. Universality searches verify only the stated finite ranges. A dash means no change on that test.

| Statement / declaration or API | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| 0.1 PosDefForm; eval; positivity/zero criterion | [2], [0], [−1]; x=1,0 | 2>0; 0 and −1 rejected; eval(0)=0 | Pass; positive definiteness excludes wrong carriers |
| 0.1 pairing; symmetry; polarization | A₂; e₁,e₂ | pairing = 1 in either order; eval(e₁+e₂)=6=2+2+2·1 | Pass; — |
| 0.1 intCast | x=(−1,2) | integer norm 6 = real norm 6 | Pass; — |
| 0.1 actGL; eval_actGL | I₂,U,e₂ | UᵀU=[[1,1],[1,2]]; transformed value 2 = ‖(1,1)‖² | Pass; — |
| 0.1 right-action order | U and swap S | act S (act U I)=[[2,1],[1,1]]=act(US)I; act(SU)I=[[1,1],[1,2]] | Pass; right, not left, action |
| 0.1 det_actGL | I₂,U; det U=1 | det(UᵀU)=1=det I₂ | Pass; — |
| 0.1 smulPos; scaling evaluation/determinant | 3A₂,e₁ | eval=6=3·2; det=27=3²·3; c=0 rejected | Pass; — |
| 0.1 Similar; generator commutation | I₂,U,c=4 | 4UᵀU=[[4,4],[4,8]]=Uᵀ(4I)U | Pass; — |
| 0.1 similar_equivalence | [1],[2],[6] | scale factors 1,2,1/2,3,6 give reflexive, symmetric and transitive witnesses | Pass; — |
| 0.1 IsIntegralForm; primitive normalization | [2], [√2], rank 0 | [2] integral, [√2] not; primitive [1]; empty gcd 0 ≠ 1 | Fail in rank 0; R09 |
| 0.2 gramForm; ofGramMatrix dictionary | ⟨2⟩; A₂ | integral Gram [2] → real [2]; Gram(A₂)=A₂, determinant 3 | Pass; — |
| 0.2 gramForm_eq_actGL; isometry transport | ℤ² bases e and (e₁,e₁+e₂) | Grams I₂ and [[1,1],[1,2]], related by U; determinant 1=1 | Pass; — |
| 0.2 descent | same two bases | minimum 1=1; kissing 4=4; Hermite 1=1 | Pass; — |
| 0.3 norm_sq_formSpace | A₂,e₁+e₂ | ‖e₁+e₂‖²=6=eval(e₁+e₂) | Pass; one library lemma, R19 |
| 0.4 sphere/shell comparison | t=−1,0,2 on A₂ | sphere counts 1,1,6; squared-norm shell counts 0,1,6 | Fail at −1; R07 |
| 0.5 dual determinant/inverse action | I₂,U | inverse [[2,−1],[−1,1]] ≠ claimed [[1,−1],[−1,2]]; both determinants 1 | Fail; R03 |
| 0.5 dual-model comparison | A=[4] | dual coordinates (1/4)ℤ map by A to ℤ; both generator lengths 1/2 | Pass with source/target specified; R03 |
| 1.1 min and minimalVectors | [4], A₂, rank 0 | min 4,2,0; S={±1}, six roots,∅; card 2,6,0 | Pass; — |
| 1.1 finite_setOf_eval_le | [1], C=−1,0,1 | sublevel cardinalities 0,1,3; closedBall √C gives 1,1,3 | Finiteness passes; negative-C identification fails, R07 |
| 1.1 min_pos; minimalVectors_nonempty | A₂ and rank 0 | 2>0 and six vectors; rank-zero min0/S∅ excluded by n>0 | Pass; — |
| 1.1 min_le_eval | A₂,(1,1) | 2≤6; equality at (1,0):2=2 | Pass; — |
| 1.1 neg_mem_minimalVectors | A₂,(1,−1) | norms of (1,−1) and (−1,1) both 2 | Pass; — |
| 1.1 kissingNumber; finiteness/evenness | A₂, I₂, rank 0 | 6=2·3;4=2·2;0=2·0 | Pass; — |
| 1.1 min_actGL; S transforms contragrediently | I₂,U | minimum 1=1; preimages of ±e₁,±e₂ are ±(1,0),±(−1,1) | Pass; — |
| 1.1 min_smulPos; unchanged shortest coordinates | A₂,c=3 | min 6=3·2; S still six coordinates | Pass; — |
| 1.1 orthogonal-sum minimum, equal case | [1]⊕[1] | min1=min(1,1); S consists of four axes = two disjoint pairs | Pass; — |
| 1.1 orthogonal-sum minimum, unequal case | [1]⊕[4] | min1; S={±e₁}, not all four axes | Pass; — |
| 1.1 kissingNumber_of_similar | A₂,3A₂ | 6=6; [1] and [2] both have 2 | Pass; — |
| 1.1 IsWellRounded | I₂,B | minimal-vector spans have dimensions 2=rank and 1<2 | Pass; — |
| 1.1 IsGeneratedByMinimalVectors | I₂,B | integer spans ℤ² and ℤe₁; respective indices 1 and infinite | Pass; — |
| 1.1 IsStronglyWellRounded | I₂,B | two coordinate shortest basis vectors exist for I₂; B supplies only one direction | Pass; — |
| 1.1 strong ⇒ generated ⇒ well-rounded | I₂; rank 0 | basis/span ranks 2→2→2; empty basis/span ranks 0→0→0 | Pass; — |
| 1.2 minimum_eq_min; kissing comparison | ⟨2⟩, A₂, zero lattice | minimum pairs (2,2),(2,2),(0,0); kissing pairs (2,2),(6,6),(0,0) | Pass; — |
| 1.2 first successive minimum is a length | [4] | λ₁=2; min=4=λ₁²; identifying min with λ₁ would give 4≠2 | Pass; — |
| 1.3 IsNormalized | (0,1),(0,−1),0 | true,false,false; exactly one of a nonzero vector and its negative | Pass; — |
| 1.3 normalizedMinimalVectors and doubled count | A₂; rank 0 | S⁺={(1,0),(0,1),(1,−1)}; 2·3=6; 2·0=0 | Pass; — |
| 1.3 normalization is basis-dependent | x=e₁, U=−I | normalized x=true; normalized Ux=false, although both norms equal 2 | Pass; — |
| 1.4 packingRadius | [4], A₂, rank 0 | 1,√2/2,0 = √min/2 in each case | Pass; — |
| 1.4 unitBallVolume/library volume comparison | n=0,1,2,3,4,8,24 | 1,2,π,4π/3,π²/2,π⁴/24,π¹²/12! from the Gamma formula | Pass; — |
| 1.4 centerDensity and density | A₂,4A₂ | δ=1/(2√3) on both; Δ=π/√12 on both | Pass; — |
| 1.4 density_of_similar | I₂,4UᵀU | min1→4,√det1→4; δ1/4→1/4; Δπ/4→π/4 | Pass; — |
| 1.4 packing disjointness/fundamental fraction | [4], F of length2 | open intervals radius1 are disjoint; occupied measure2 / covolume2 = density1 | Pass; — |
| 1.4 open-ball fraction at rank zero | singleton ambient space | radius0 gives empty union, ratio0/1=0; density formula0⁰/1=1 | Fail; R09 |
| 1.4 density_pos and density_le_one | [4], A₂, E₈ | 1;0.906899682;0.253669508 are positive and ≤1 | Pass; — |
| 1.5 hermite; latticeHermite bridge | A₂,3A₂ | 2/√3 = 6/√27; lattice minimum/determinant gives same value | Pass; — |
| 1.5 centerDensity_eq_hermite | A₂ and rank 0 | (γ/4)^1=1/(2√3); rank0:0⁰=1=δ | Pass; — |
| 1.5 Bergé–Martinet invariant | diag(1,4) | γ(A)=γ(A⁻¹)=1/2; γ′=1/2≤γ₂=2/√3 | Pass; — |
| 1.7 hermite_le_minkowski | [4],A₂ | 1≤1;2/√3≈1.1547≤4/π≈1.2732 | Pass; — |
| 1.7 purported equivalent bound | [4] | wrong8≤4; corrected4≤4 | Fail; R04 |
| 1.8 projection bound | A₂ projecting off e₁ | projected min=3/2=(3/4)·2; det projection=3/2=det A₂/min | Pass; — |
| 1.8 hermite_le_pow and equality | A₂,I₂ | 2/√3=√(4/3);1<√(4/3) | Pass; — |
| 2.1 range lower bound | diag(1,4),I₂ | range contains 1/2 and1; 1/2<1≤sup | Fail as stated; R10 |
| 2.1 one_le / upper bound on γ | n=1,2,3 | 1≤1≤1;1≤2/√3≤2/√3;1≤2^(1/3)≤4/3 | Pass; — |
| 2.1 Mordell inequality | n=2,3,4 | 1≤1;2^(1/3)≤4/3;2≤2 (γ₄²=γ₃³) | Pass; — |
| 2.2 attainment and critical ⇒ extreme | A₂/√3 | det1; min2/√3=γ₂; same Hermite value as A₂ | Pass; — |
| 2.3 γ₁ | [a],a>0 | min/det=a/a=1 | Pass as mathematics; boundary padding R19 |
| 2.3 γ₂² | A₂ | min²/det=4/3=γ₂² | Pass; — |
| 2.3 γ₃³ and reduction determinant | A₃ | a=b=c=2; det4=abc/2;min³/det=8/4=2 | Pass; — |
| 3.1 fundamental domain / cell volume | [4],A₂ | cell lengths/areas 2,√3 = covolumes2,√3; adjacent overlaps are boundary sets | Pass; — |
| 3.2 coveringRadius; deep holes exist | [4],I₂ | μ=1 at coordinate1/2; μ=√2/2 at (1/2,1/2) | Pass; — |
| 3.2 packing ≤ covering | [4],I₂,rank0 | 1=1;1/2<√2/2;0=0 | Equality iff rank1 fails at rank0; R09 |
| 3.2 coveringDensity ≥1 | [4],I₂ | Θ=1 andπ/2≈1.5708≥1 | Pass; — |
| 3.3 Jarník bounds / GoN comparison | diag(1,4) | λ=(1,2), μ=√5/2≈1.118;1≤1.118≤1.5≤2 | Values pass; supplier repair R11 |
| 3.4 named covering values | ℤ³,A₂,A₃,D₄,E₈,Leech | μ=√3/2,√(2/3),1,1,1,√2; resulting Θ=π√3/2,2π/√27,2π/3,π²/4,π⁴/24,2¹²π¹²/12! | Algebraic checks; Leech classification not verified, R12 |
| 3.4 covering constant | n=1,2 | Θ₁=1 from [a]; hexagonal candidate2π/√27≈1.2092≥1 | Lower-bound sanity check only |
| 4.1 rankOneMatrix and IsPerfect | I₂,A₂ | I₂ span dimension2<3; A₂ dimension3=3; rank0 dimension0=0 | Pass definitions; ℤ⁰ exception R09 |
| 4.2 IsEutactic; positive coefficients | A₂,B | Q(A₂)=[[4,−2],[−2,4]], A₂⁻¹=Q/6; B shortest vectors span dimension1, so no inverse representation | Pass; — |
| 4.2 IsStronglyEutactic; coefficient trace | A₂,I₂ | c=2/(6·2)=1/6, trace2=6·(1/6)·2; I₂ c=1/2 | Pass; — |
| 4.2 strong ⇒ eutactic ⇒ well-rounded | A₂ | positive six coefficients1/6; inverse rank2; shortest span rank2 | Pass; — |
| 4.2 inner-product identity | A₂,v=e₁ | 2 = (1/6)(4+4+1+1+1+1) | Pass; — |
| 4.2 coefficient scaling | 3A₂ | c goes1/6→1/18; inverse goesA₂⁻¹→A₂⁻¹/3 | Pass; — |
| 4.4 raw matrix commutation | A₂,Q,U=[[-1,−1],[0,1]] | UQ=[[-2,−2],[-2,4]] ≠ QU=[[-4,−6],[2,6]]; QA=6I | Fail route; R18 |
| 4.5 isExtreme_iff, both directions | A₂,I₂,B,rank0 | A₂:T↔T∧T;I₂:F↔F∧T;B:F↔F∧F;rank0:T↔T∧T | Pass; — |
| 4.6 finite_perfect_quotient | n=1,2 | one class represented by[1], one byA₂; finite cardinalities1,1 | Pass; — |
| 4.7 finite_eutactic_quotient | n=1,2 | one rank-one class; rank-two square and hexagonal classes give2 | Low-rank check; general Ash source unavailable |
| 4.8 compactness | same family | det1 throughout;min1/t→0, A₂₂=t→∞ | Fail; R05 |
| 4.9 Ryshkov definition / vertices | n=1; rank0 | R₁=[1,∞),vertex[1],min1;R₀={empty},vertex min0 | Positive-rank statement only; R09 |
| 4.9 IsFacetNormal / step | P=[1],N=[1] | zero-span dim0;admissible t={0};ρ=0 | Positive-step assertion fails; R14 |
| 4.9 isPerfect_voronoiNeighbour / min preservation | same rank-one instance | returned P is perfect; min1=1 | Lean weak conclusions pass; do not establish distinct adjacency |
| 4.10 PerfectFormCertificate | empty list,rank1 | all universal fields true;list cardinality0 | Vacuity; R01 |
| 4.10 completeness | empty certificate,A=[1] | no member exists:0 witnesses, yet conclusion demands1 | Fail; R01 |
| 4.10 Hermite supremum over certificate | same instance | γ₁=1; sSup(image ∅)=0 | Fail; R01 |
| 4.10 classification counts | ranks1–8 | 1,1,1,2,3,7,33,10916; independent source table agrees for2–8 | Source comparison; enumeration not rerun |
| 4.10 γ₄⁴ andγ₈⁸ | D₄,E₈ | 2⁴/4=4;2⁸/1=256 | Pass; — |
| 4.10 missing γ₅⁵,γ₆⁶,γ₇⁷ | D₅,E₆,E₇ | 2⁵/4=8;2⁶/3=64/3;2⁷/2=64 | Missing signatures; R17 |
| 4.11 γ₂₄ | Leech | min4/det^(1/24)=4; lower bound4, cited upper bound4 | Value agrees; owned upper-proof input missing, R12 |
| 5.2 isSphericalDesign_iff_moments | I₂ minimal vectors,r=1,a=e₁ | j0:4=4;j1:2=4/2;j2:2≠3·4/(2·4)=3/2 | 3-design passes,5-design fails |
| 5.3 strongly eutactic iff2-design | A₂,B | both true forA₂;both false forB;rank0 strong eutaxy true but design false | Lean n>0 essential; R09 |
| 5.3 strongly perfect⇒perfect; strictness | A₂,A₃ | A₂ fourth moment36=36; A₃ fourth moment40≠192/5, despite perfectness | Pass; — |
| 5.4 laplacian / IsHarmonic | 1,X₀,X₀²,X₀²−X₁² | 0,0,2,0; nonharmonic square excluded | Pass; — |
| 5.4 harmonic dimensions / decomposition | n=3,d=2;X₀² | dim6−1=5; X₀²=(X₀²−R²/3)+R²/3, Laplacians0 and2 | Pass; import earlier owner, R15 |
| 5.4 harmonic criterion negative control | I₂ roots;P=x⁴−6x²y²+y⁴ | ΔP=0; shell sum4≠0, so not4-design | Pass; — |
| 5.5 Fourier phase | n=1,P=x,τ=i | transform −iξe^(−πξ²);atξ=1 value−i e^(−π), matching τ⁻¹ | Pass; — |
| 5.5 degree-two/degree-zero factors | n=2,P=x²−y²,τ=i;P=1,τ=2i | factors−1 and1/2; formula gives i⁻²=−1 and2⁻¹=1/2 | Pass; — |
| 5.5 complex substitution | τ=1+i,s=1−i | 1/√s has nonzero imaginary part, so y/√s is not a real change of variables | Extend by holomorphic argument; R15 |
| 5.6 harmonicTheta / summability | A=[1],P=1,τ=i | zero term1, first pair2e^(−π); sum≈1.0864348 finite; τ=−i would grow and is excluded | Pass; — |
| 5.6 arbitrary-basis harmonic cusp theorem | E₈,P=X₀²−X₇² | ΔP=0; q coefficient240−120=120; dimS₆=0 | Fail; R02 |
| 5.6 repaired metric control | E₈,P=X₀²−2X₇² | Δ_A=2·4−4·2=0; q coefficient240−2·120=0 | Repair excludes false example |
| 5.6 constant/odd-degree controls | E₈,P=1 or linear P | constant theta has q⁰ coefficient1, so not cusp; odd P cancels in ± pairs to0 | d>0 and harmonic hypotheses matter |
| 5.7 Venkov strengths | (m,r)=(0,1),(0,2),(1,0) | n=8,16,24;min=2,2,4;t=7,3,11; n=0 would require min2 but actual0 | Pass; — |
| 5.7 E₈ shell moments | norm-two root a | 2nd120=120;4th144=144;6th240=240;8th624≠480 | 7-design, not8 |
| 5.7 E₈⊕E₈ nonexample | a a root of first factor | 4th sum144;16D sphere prediction3·480·4·4/(16·18)=80 | Not4-design; t=3 consistent |
| 5.7 vanishing-order route | n=24,d=2,4,6,8,10 | weights14,16,18,20,22 have cusp dimensions0,1,1,1,1; required vanishing order2 exceeds each | Pass; — |
| 5.7 odd-weight dimension wording | n=48,d=1 | weight25 has dim0; displayed floor alternatives1 or2 | Separate odd cancellation; R21 |
| 6.1 Represents / IsUniversal | ℤ³,ℤ⁴ | rℤ³(7)=0;rℤ⁴(7)>0 via(2,1,1,1); rank0 r(1)=0 | Pass; — |
| 6.1 IsHalfUniversal | 2I₄,A₂ | half norm of2I₄ is sum four squares; A₂ half norms miss2 | Pass; — |
| 6.1 representation monotonicity/sums | 2ℤ⊂ℤ;⟨1⟩⊕⟨2⟩ | 4 represented in both;1+2=3 represented by(1,1) | Pass; — |
| 6.1 universal minimum/splitting | ℤ⁴ | min1; e₁ norm1; orthogonal complementℤ³; ranks4=1+3 | Pass; — |
| 6.1 no rank≤3 universality | zero lattice,ℤ,ℤ²,ℤ³ | miss1,2,3,7 respectively; squares mod8 are0,1,4, no three sum to7 | Instances pass; general route uses local theory |
| 6.2 escalation lemma | 2ℤ⁴⊂ℤ⁴ | truant1; adjoining e₁ keeps rank4, not5 | Fail corank-one condition; R06 |
| 6.3 15 theorem, both truth values | ⟨1,2,5,10⟩ and⟨1,2,5,5⟩ | first passes all9 criteria and misses0 integers<300;second passes8 but misses15, sole miss<2000 | Pass; — |
| 6.4 290 theorem / factor of two | 2I₄,A₂ | 2I₄ represents2m for all m by four squares; A₂ fails m=2 since norm4 absent; criterion has29 entries | Pass; — |
| 7.1 tensor rank/determinant/Gram | A₂⊗A₂ | rank2·2=4; Gram[[4,2,2,1],[2,4,1,2],[2,1,4,2],[1,2,2,4]]; det81=3²·3² | Pass; — |
| 7.1 pure-tensor pairing | e₁⊗e₂,e₂⊗e₁ inA₂⊗A₂ | pairing1=1·1; self pairing4=2·2 | Pass; — |
| 7.1 positive/even/unit/swap/associate API | ⟨1⟩,⟨2⟩,⟨3⟩ | products[2],[6],[6]; odd×even norm2 even; all positive; zero-rank determinant1 | Pass; — |
| 7.1 dual/determinant | ⟨2⟩⊗⟨3⟩ | dual carrier(1/6)ℤ = (1/2)ℤ⊗(1/3)ℤ inℚ; determinant6;discriminant order6 | Interpret duals as rational submodules |
| 7.2 min inequality / rank-one equality | ⟨2⟩⊗A₂ | min4=2·2, hence≤; rank-zero factor gives0=0 | Pass; — |
| 7.2 Kitaoka / shortest tensors | A₂⊗A₂ | min4=2·2;36 shortest ordered pairs modulo simultaneous sign give18 vectors | Rank2 instance passes; general source unavailable |
| 7.2 scaling by w | L₁=⟨1⟩,w=0 or2 | w0:ranks0 vs1;w2:both rank1,Gram4 | Fail at0; R08 |
| 7.2 orthogonal factors | L₂=I₂,w₁=e₁,w₂=e₂ | cross pairings0; tensor decomposes as orthogonal copies with scale1,1 | Pass; — |
| 7.4 discriminant groups/carriers | ⟨8⟩ | b-aut residues{1,3,5,7};q-aut residues{1,7};order4 vs2 | Correct distinction; duplicate carriers R16 |
| 7.5 fvIndexBilinear versus fvIndex | ⟨8⟩ | bilinear index4/2=2; quadratic index2/2=1 | Pass; — |
| 7.5 fvIndex_rankOne odd cases | m=5,15 | residues{1,4} and{1,4,11,14};indices2/2=1,4/2=2 | Pass; — |
| 7.5 fvIndex_rankOne even cases | m=8,12 | residues{1,7} and{1,5,7,11} modulo2m condition;indices1,2 | Pass; — |
| 7.5 unimodular index / isometry invariance | E₈;⟨12⟩ basis sign reversal | trivial discriminant:1/1=1; sign reversal leaves4/2=2 | Pass; — |
| 8.2 predicate controls | I₂,A₂,B | matrix-span ranks2,3,1; perfect F,T,F;eutactic T,T,F | Mathematical tests pass; computational scope R22 |
| Global similarity claim in opening | [1] versus[4] | min1→4, packing1/2→1, covering1/2→1;density1→1 | Only scale-free invariants are invariant; R20 |

**127 retained computed rows** cover all 15 seeded targets, headline theorem checks and findings. Additional per-target rows are omitted for comment length.

**Source sample (15/15 targets addressed).** “Text verified” below means I opened the legal text at the indicated locator. A secondary cross-check is identified as such; it does not certify an unavailable primary text. All referenced works were attempted through the sources service, without changing a manifest.

| Seeded target | Text and locator inspected | Outcome |
| --- | --- | --- |
| 0.1 form and similarity | lmfdb-similarity line 90; Martinet author-hosted introduction/contents, martinet2003 lines 166–181 and 471–477 | Similarity convention checked; full primitive-normalization proof unavailable. Rank-zero exception R09. |
| 0.2 lattice dictionary | Pinned TauCeti IntegralLattice/Gram.lean and PosDef/Covolume.lean; bhargava2000 lines 1437–1445, printed p.27 | Basis/Gram convention and integer-matrix correspondence agree. The real-form bridge is new, not supplied by the source. |
| 1.1 minimum and shortest vectors | dsv2007 lines 50–59, preprint p.2; pinned PosDef/Minimum.lean | Source minimum is the nonzero squared norm. Positivity and finite attainment need positive rank; source is not a proof of all proposed API. |
| 1.2 identification with Tau Ceti | PosDef/Minimum.lean:81,94,103,123; Norm.lean:94–100 | Native minimum is integral norm, with zero-lattice convention 0. These agree with the form-side computations. |
| 1.3 normalized minimal vectors | lmfdb-shortest line 90, normalized-minimal-vector knowl | First nonzero coordinate positive; paired cardinality convention agrees. |
| 1.4 radius/densities | dsv2007 lines 52–58, preprint p.2; lmfdb-density lines 90–92; pinned VolumeOfBalls.lean | Norm-to-radius factor and density formula agree. The alleged live-knowl error was not found (R23). Conway–Sloane chapter text unavailable. |
| 1.5 covolume/Hermite | dsv2007 lines 52–58; pinned PosDef/Covolume.lean:120 | Squared covolume equals determinant; Hermite normalization agrees. PDF fractions, not extraction layout, determine numerator/denominator. |
| 4.2 eutaxy | dsv2007 lines 65–71, preprint p.2; Venkov’s metric convention in §1 | Positive coefficients and inverse matrix are supported; trace identity checked directly. General proof locators still need precision. |
| 4.9 Ryshkov/neighbours | dsv2007 lines 72–84, preprint p.2, and 107–115, p.3 | Perfect-domain tessellation/finiteness and classification statements read. This does not certify the unqualified positive-step assertion; rank-one failure R14. Martinet/Schürmann full chapters unavailable. |
| 5.4 harmonic polynomials | venkov2001 §1, and Theorem 3.2, printed p.11, lines 1204–1219 | Harmonic criterion read; source’s n≥2 condition separated from directly checked rank one. Stein–Weiss full chapter unavailable. Generic ownership is GoN §4.3. |
| 5.6 harmonic theta | venkov2001 Theorem 16.1, printed p.59, lines 8251–8259 | Even unimodular lattice and homogeneous metric-harmonic polynomial; positive degree gives cusp form. Arbitrary-basis ordinary harmonicity is unsupported and false. |
| 5.7 Venkov | venkov2001 Theorem 16.4, printed p.61, lines 8394–8400; proof/equation (16.6), p.62, lines 8550–8592 | The theorem is phrased for minimal vectors; the opened proof annihilates every positive shell coefficient, so the all-shell extension is justified. The cited §§6–7 are wrong. |
| 6.1 representation/universality | bhargava2000 §2, printed pp.27–28, lines 1437–1481 | Integral Gram convention, universality and escalation definitions read. Same-rank escalation is allowed in the source. The local proof for all rank≤3 is not supplied by this passage. |
| 7.1 tensor product | pinned BilinearForm/TensorProduct.lean and Matrix/Kronecker.lean; computed A₂⊗A₂ | Native bilinear tensor/Gram identities checked. Kitaoka Ch.7 unavailable: primary locator not certified. |
| 7.2 tensor minimum | direct rank-one and A₂⊗A₂ calculations; Kitaoka fetch attempt | Equality verified in these instances only; rank≤43 theorem and claimed general counterexamples not certified from their primary text. Zero-vector error R08. |

Additional texts: bhargava2000 pp.28–31 (lines 1462–1481, 1546–1558, 1673–1718) supports the escalation counts and nine-number criterion. bhargavahanke Theorems 1–3/§2 (lines 16–29, 61–77) gives the integer-valued 29-number criterion; doubling its Gram convention matches the half-norm signature. dsv2007 Theorem 1.1/Table 1, preprint p.3 (lines 87–107), gives the classification counts. cohnkumar2009 Theorems 9.3/11.7 (lines 70–75) give Leech/E₈ lattice optimality. The Cohn–Elkies, Viazovska and CKMRV bound/optimality statements were read. festiveniani §2.1, preprint p.3 (lines 109–120), supplies discriminant-map context, not the rank-one index formula.

**Pinned declarations opened.** The pin is Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. The following locations were opened, not inferred from names. File paths in this table are relative to the named library repository.

| Library file:line | Declaration / checked content |
| --- | --- |
| Mathlib/LinearAlgebra/Matrix/PosDef.lean:164 | Matrix.PosDef includes Hermitian symmetry and strict positivity on nonzero vectors. Rank zero is admitted. |
| Mathlib/Analysis/InnerProductSpace/Defs.lean:112 | InnerProductSpace.norm_sq_eq_re_inner, the exact norm-square padding witness. |
| Mathlib/Algebra/Module/ZLattice/Covolume.lean:72 | ZLattice.covolume is the real-valued additive covolume; the metric’s Haar volume matters. |
| Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean:92 | E₈ Cartan matrix used in the harmonic-theta counterexample. |
| Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:146 | Odd-weight level-one forms vanish. |
| Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:155 | CuspForm.rank_eq_zero_of_weight_lt_twelve; in particular S₆ = 0. |
| Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:160 | Weight-twelve cusp dimension one. |
| TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63 | IntegralLattice carries a full integral symmetric lattice; positive definiteness is an extra predicate, not a structure field. |
| TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:94 | integralNorm is integralForm.toQuadraticMap; integralNorm_apply at line 99 is visible under the module system. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Minimum.lean:81 | Nat-valued minimum; line 94 gives the zero-carrier value, line 123 gives isLeast under Nontrivial. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Covolume.lean:66 | gram_comp_eq_map_gramMatrix; line 79 discreteTopology_range; line 120 covolume_range_sq_eq_determinant. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean:140 | IsPosDef.finite_isometry; positive-definite hypotheses must accompany reuse. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean:45 | successiveMinimum exists at this pin; indexed by Fin(rank), not an unrestricted natural index. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean:103 | IsPosSemidef.successiveMinimum_zero with the nontrivial/index hypotheses. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Hermite.lean:81 | IsPosDef.minimum_le_rpow_mul_determinant_rpow exists at this pin. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Bilinear.lean:193 | Isometry.discriminantBilinearIsometry on nondegenerate lattices. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:232 | Isometry.discriminantQuadraticIsometry with evenness and nondegeneracy. |
| TauCeti/LinearAlgebra/FiniteBilinearModule/Basic.lean:262 | Native finite bilinear module Isometry, preserving the pairing. |

These are 18 pinned file/line checks, plus related declarations. Object searches covered Gram/representation/duality, root lattices, harmonicity and tensor theory. The citation scanner’s missing-SuccessiveMinima-module lead is a false positive: that module exists.

**Ownership and suppliers.** Object searches used `roadmaps grep`, `roadmaps show`, main/open checkouts and board packages. R15–R16 identify ownership collisions; no identical fully qualified declaration name was found. Existing suppliers were checked on main. Resolved contracts:

- TauCetiRoadmap/IntegralLattices/README.md:772–816, §§2A–2G: bounded norms, minimum/shells, automorphisms, covolume, bounds, minima and reduction. §§1B–1G supply discriminant forms; §0F supplies the unimodular splitting. §9A already includes minimum/kissing data; Layer 8 should extend that certificate, not duplicate those fields.
- Completed/IntegralLattices supplies the existing carrier/duality/root-lattice direction. The active integral-lattice roadmap is distinct; a tool response pointing to the completed file was not used as evidence about the active §§2A–2G.
- TauCetiRoadmap/ThetaSeries/README.md:515–526, §2D, and 545–560, §2G: real model and squared-norm shells, including the negative-shell convention. §§8B/8D give the E₈/Leech coefficient comparisons. Its scalar theta theory is not duplicated here.
- TauCetiRoadmap/Rank24LatticeConstructions, Layer 6: the Leech construction/minimum contract. It does not supply the covering or packing optimality proof in R12.
- TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic, §§4.4.1–4.4.2: packing/covering radii; §4.5.8: Mahler compactness. §§4.5.1–4.5.2 instead concern StarBody and criticalDeterminant. §4.3 owns the generic harmonic inputs identified in R15; §5.1 owns the LLL background. The complex-parameter extension and Gram-coordinate adapter remain this roadmap’s work.
- TauCetiRoadmap/SuccessiveMinima/README.md:779–868 has §§3.1–3.4, not §§3.21/3.22. Its §1.1 uses real successive minima; its upper-bound supplier assertions do not create a declaration at this older pin. R11 gives the permitted earlier GoN owner.
- Completed/HeightsAndUnits/README.md:268–288, §2.1, supplies the basis bound involving max(aⱼ, Σᵢ≤ⱼaᵢ/2). That is not a statement that a basis simultaneously realizes all successive minima.
- TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass §4 supplies automorphism-order/mass certificates; the review did not recompute the large group orders. TauCetiRoadmap/ModularForms supplies the graded-ring direction, and the specified level-one declarations were checked at the pins.
- TauCetiRoadmap/GlobalQuadraticForms §§4.4/6.1 supply rational local-global inputs. They do not by themselves supply the analytic integral representation bounds for the 290 proof. The cited IntegralLattices genus theory must be included when passing from rational to integral representation.
- HalfIntegralWeightModularForms, SiegelModularForms, QuaternionArithmetic, RootSystems and EffectiveDiophantineMethods are scope boundaries, not upward suppliers. The degree-one weighted theorem is distinct from SiegelModularForms Layer 5; the generic polynomial ingredients are nevertheless already owned by GoN.

External theorem inspected: [SpherePacking/Dim24/MainTheorem.lean](https://github.com/math-inc/Sphere-Packing-Lean/blob/main/SpherePacking/Dim24/MainTheorem.lean), spherepackinglean lines 29–44. Existence was verified, compatibility with the pins was not. No external code was executed.

## Not verifiable

- **martinet2003:** the title/DOI search did not yield the full book. The author-hosted preface/introduction/contents was readable, including Chapter 3 §3.4 at p.78, Chapter 7, and Appendix 2/Chapter 16 at p.489. The chapter map is verified; proofs and exact hypotheses of the sampled claims are not.
- **conwaysloane1999 and cassels1971:** service access stopped at paywalled publisher material; these remain uncertified by locator. In particular, the exact Voronoi-relevance and Leech deep-hole classification passages were not read. They are not reopened as missing-text requests.
- **schuermann2009:** the AMS DOI landing page did not provide readable licensed full text through the service. Chapters 2–3, including the full Ryshkov and neighbouring construction, remain uncertified. **voronoi1908:** bibliographic service lookup did not resolve a readable legal text; the original theorem/proof was not certified from the primary paper.
- **gruber1987:** bibliographic lookup yielded no readable legal copy of Chapter 2 §13. The Jarník bounds were checked on explicit lattices, not against the requested text. **steinweiss1971:** no readable legal full text was obtained for Chapter IV §2/Theorem 3.4. The Fourier sign was checked directly and against the earlier supplier, not certified from this book.
- **kitaoka1993:** the Cambridge DOI landing page was found, but Chapter 7 was not readable through the service. The rank≤43 result and its precise hypotheses remain uncertified; rank-one/two computations do not establish that general result. **ash1977:** the Cambridge journal landing page was located, but no readable article text was obtained; its general finiteness proof remains uncertified.
- The **published numbering** of the Venkov preprint versus the cited pp.10–86 edition was not assumed. The locators above explicitly refer to the author-hosted version actually read. Likewise the readable **Bhargava–Hanke preprint** supports the mathematical criterion; the README’s Inventiones 2025 bibliographic claim was not certified.
- The **large stored classification data**, complete automorphism orders, database labels/completeness and claimed strictness witnesses in ranks ≥5/≥10 were not independently certified. The README points the strictness claim to “9”, but its worked examples only separate well-roundedness from failure to span, not generated-by-minima from strongly well-roundedness. Add actual cited witnesses if those strictness claims are retained.
- The external sphere-packing development was not built against these pins. Missing legal texts are recorded together; this review is complete with the stated limits.

## Source issues

- **Misprint** in ckmrv2017 at Theorem 1.2, printed p.1018 (arXiv v4; ckmrv2017 line 60): the source says the auxiliary Schwartz function has codomain ℝⁿ; it should be real-valued, with domain ℝⁿ; affects a stated result.
- **Misprint** in ckmrv2017 at §1, final paragraph of printed p.1018 (arXiv v4; ckmrv2017 line 86): the source says the optimized auxiliary-function bound is Theorem 1.1; it should be Theorem 1.2; affects nothing.
