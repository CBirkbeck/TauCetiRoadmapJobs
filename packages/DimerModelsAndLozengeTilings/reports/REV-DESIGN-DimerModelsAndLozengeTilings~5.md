<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13737#issuecomment-6849242731 -->
Review (claude) of 8baff5e

Verdict: needs_changes

1. **F01** (P2) 4.5 restates Mathlib's proper kernels instead of citing them

   **Location:** `design/README.md:970–976`: "Markov kernels from `X` to `X` such that `γ_Λ(·|ω)` is
   measurable in `ω` for the trace of `𝓕_{Λᶜ}` on `X`, proper (`γ_Λ(B ∩ C|ω) = 1_B(ω) γ_Λ(C|ω)` for
   `B ∈ 𝓕_{Λᶜ}`)". Also the *Needs:* line at :976, the "From Mathlib" list (:217–277, no kernel
   declaration), and `design/plan.json:1028` (target 4.5 prerequisites).

   **Claim:** the roadmap defines kernels measurable for a sub-σ-algebra, properness and invariance of
   a measure under a kernel as its own notions; Mathlib supplies only `condExp`.

   **Witness:** Mathlib pin, `Mathlib/Probability/Kernel/Proper.lean:47`,
   `ProbabilityTheory.Kernel.IsProper (π : Kernel[𝓑, 𝓧] X X)`; `:58` `isProper_iff_inter_eq_indicator_mul`
   gives, for `𝓑 ≤ 𝓧`, `π x (A ∩ B) = B.indicator 1 x * π x A`: the README's clause verbatim.
   `Mathlib/Probability/Kernel/Invariance.lean:39`, `Kernel.Invariant κ μ : μ.bind κ = μ`.

   **Exact repair:**

   - In 4.5, define a specification as a family `γ Λ : Kernel[𝓕_{Λᶜ}, 𝓕] X X` (Mathlib's kernels
     measurable for a sub-σ-algebra, on `X` with the trace σ-algebras), each an `IsMarkovKernel` and
     `ProbabilityTheory.Kernel.IsProper`, with consistency `(γ Λ) ∘ₖ (γ Δ) = γ Δ` for `Λ ⊆ Δ`.
     Mathlib's `Kernel.comp` applies its right factor first, so this is the README's `γ_Δ γ_Λ = γ_Δ`;
     say so in the sentence.
   - State Gibbs as `μ.bind (γ Λ) = μ` for every finite `Λ`, which is `Kernel.Invariant` once `γ Λ` is
     read as a kernel for the full σ-algebra.
   - Add to "From Mathlib": `ProbabilityTheory.Kernel` and `IsMarkovKernel`
     (`Mathlib/Probability/Kernel/Defs.lean`, lines 55 and 138), `Kernel.comp`
     (`Mathlib/Probability/Kernel/Composition/Comp.lean`, line 50), `Kernel.IsProper` with
     `isProper_iff_inter_eq_indicator_mul` (`Proper.lean`, lines 47 and 58, the second needing
     `𝓑 ≤ 𝓧`), `Kernel.Invariant` (`Invariance.lean`, line 39).
   - Add proper kernels to the "does not own" list of Scope and ownership, name these declarations
     in the 4.5 *Needs:* line and in the plan's prerequisites for 4.5. In the closing paragraph of
     "From Mathlib" keep "no Gibbs specifications" and add that properness of a single kernel is
     Mathlib's.

   **Repair tested:** independent specification on `{0,1}^ℤ`, `ν = Bern(1/2)`, `Λ = {0}`,
   `A = {ω(0)=1}`. For the exterior event `B = {ω(1)=1}`: `γ(A∩B|ω) = 1/2·1_B(ω)` and
   `1_B(ω)·γ(A|ω) = 1_B(ω)·1/2`, equal. For `B = {ω(0)=1}`, not exterior-measurable, at `ω(0)=0`:
   `γ(A∩B|ω) = 1/2` against `1_B(ω)γ(A|ω) = 0`. So `𝓑` must be `𝓕_{Λᶜ}`, as in Mathlib's signature.
   Identity kernels on `X₀ = {0̄,1̄}`: `δ_ω(A∩B) = 1_B(ω)δ_ω(A)` at all four `(A,B)` singletons (1=1·1 or
   0=0). Resampling `Δ = {0,1}` then `Λ = {0}` gives the law of resampling `Δ` (`1/4` on each of the
   four patterns on both sides).

2. **F02** (P2) 4.1's cylinder ring restates Mathlib's `measurableCylinders`

   **Location:** `design/README.md:871–872` and `:879`: "Cylinder events are those depending on
   finitely many coordinates" and "Cylinder events form a ring of sets generating the product
   σ-algebra." Consumed by 4.2 (:900–905) and 4.4 (:937–946); `design/plan.json:853`.

   **Claim:** the cylinder ring, and the fact that it generates the product σ-algebra, are API of
   this roadmap's target 4.1.

   **Witness:** Mathlib pin: `MeasureTheory.measurableCylinders`
   (`Mathlib/MeasureTheory/Constructions/Cylinders.lean:275`), `isPiSystem_measurableCylinders`
   (:335), `univ_mem_measurableCylinders` (:345), `generateFrom_measurableCylinders` (:366);
   `isSetRing_measurableCylinders` (`Mathlib/MeasureTheory/Constructions/ProjectiveFamilyContent.lean:57`).

   **Exact repair:**

   - In 4.1 say that cylinder events are the members of
     `MeasureTheory.measurableCylinders (fun _ : I => S)` and delete the second API bullet.
   - List the five declarations above under "From Mathlib" and in the "does not own" list.
   - Add `isSetRing_measurableCylinders`, `generateFrom_measurableCylinders` and
     `univ_mem_measurableCylinders` to the *Needs:* of 4.2, and `isPiSystem_measurableCylinders` to
     the *Needs:* of 4.4; mirror both in the plan.
   - In the contract entry for `exists_measure_symmDiff_lt_of_generateFrom_isSetRing` add its third
     hypothesis, which the paraphrase at :251–253 drops: a countable subfamily of the ring covering
     almost everything (`MeasuredSets.lean:86–90`); `{univ}` serves.

   **Repair tested:** `I = ℤ`, `S = {0,1}`: `{ω(0)=1}` is `cylinder {0} {1}`; its complement and its
   union with `{ω(1)=1}` (3 of the 4 patterns on `{0,1}`) are cylinders; "infinitely many ones" is
   not (it is a tail event, 4.1 Check 1). The 4.2 route instantiates the approximation lemma with
   `C = measurableCylinders`, `D = {univ}`, `h` the generation theorem: all three hypotheses are then
   pinned declarations.

3. **F03** (P2) Bernoulli ergodicity is stated on main by VonNeumannAlgebras and not cited

   **Location:** `design/README.md:917–919` and Check :928: "`I = Γ = ℤ`, `ν` the uniform law on
   `{0,1}`: the two-sided Bernoulli shift is ergodic." Scope and ownership :51–52 owns "tail
   triviality and ergodicity of Bernoulli product measures under such actions" with no other owner
   named.

   **Claim:** ergodicity of Bernoulli product measures under a group action is owned here alone.

   **Witness:** main, `TauCetiRoadmap/VonNeumannAlgebras/README.md:2788–2792`, target
   `V8.BernoulliArbitraryDiscrete`: for every infinite discrete `Γ` and finite `S` with two positive
   weights, the left shift on `Measure.infinitePi (fun _ : Γ ↦ μ)` preserves the measure and is
   ergodic. VonNeumannAlgebras is line 5 of the merge order.

   **Exact repair:** 4.3 is a kept variant, not a copy. Neither statement contains the other:

   | Instance | 4.3 | V8.BernoulliArbitraryDiscrete |
   |---|---|---|
   | `Γ = I = ℤ`, `Bern(1/2)` on `{0,1}` | covered | covered |
   | `ν = δ_a` (one positive weight) | covered (4.3 Check 2) | excluded |
   | `I ≠ Γ` (edges of `hexGraph` under `ℤ²`), or `S = ℝ` | covered | not covered |
   | uncountable `Γ` | not covered | covered |

   - Add to the "does not own" list: "the Bernoulli shift of an infinite discrete group `Γ` on `S^Γ`
     for a finite `S` with two positive weights, whose measure preservation, ergodicity and essential
     freeness VonNeumannAlgebras V8.BernoulliArbitraryDiscrete owns; 4.3 differs in taking a countable
     `Γ`, any countable index set with a proper `Γ`-action, any measurable alphabet and any `ν`, and in
     proving tail triviality".
   - Add one sentence to 4.3: for `I = Γ` countable and `S` finite with two positive weights its
     ergodicity conclusion is that of V8.BernoulliArbitraryDiscrete.
   - Add a 4.3 Check with the table's first two rows.

   No *Needs:* edge is added: the route of 4.3 (zero-one law through 4.1–4.2) does not use V8.

   The open roadmap ClassicalErgodicTheory (§0.3 item 2, §1.4 item 2) also plans Bernoulli actions of
   countable groups. It is not in the merge order and is not a supplier here; with the owner on main
   named, nothing more is needed in this text.

4. **F04** (P3) "subshift" is used more widely than Mathlib's `MulSubshift` without saying so

   **Location:** `design/README.md:933` (heading "The weak topology on a finite-alphabet subshift"),
   :53, :988.

   **Claim:** "subshift" names a closed `Γ`-invariant subset of `I → S` for any `Γ`-set `I`.

   **Witness:** Mathlib pin, `Mathlib/Dynamics/SymbolicDynamics/Basic.lean:253`,
   `SymbolicDynamics.FullShift.MulSubshift A G`: a closed subset of `G → A` invariant under
   `mulShift g x = fun h => x (g * h)` (:150); additive `Subshift` at :233; `isOpen_cylinder` :214,
   `isClosed_cylinder` :219. Only the index set `G` itself.

   **Exact repair:** in the Layer 4 preamble add: "A closed `Γ`-invariant `X ⊆ I → S` is called a
   subshift; for `I = Γ` acting on itself by left multiplication it is the carrier of Mathlib's
   `SymbolicDynamics.FullShift.MulSubshift S Γ`, since `(γω)(h) = ω(γ⁻¹h)` is `mulShift γ⁻¹ ω` and
   invariance under all of `Γ` is the same condition." Add the file to "From Mathlib" with the note
   that its cylinders are indexed by `G` only. Tested on `Γ = S₃ × ℤ` (non-abelian):
   `mulShift γ⁻¹ ω h = ω(γ⁻¹h)`, the README action, with no reversal of products; on `X₀ = {0̄,1̄}`:
   closed, mapped to itself by every shift.

5. **F05** (P3) 4.6(b) uses a Tau Ceti declaration its *Needs:* line omits

   **Location:** `design/README.md:1013–1017`: "the densities … are almost surely invariant, hence
   almost surely tail-measurable by 4.2".

   **Claim:** 4.2 applies to the densities.

   **Witness:** 4.2 (:899) assumes `γA = A` exactly. For `μ = Bern(1/2)^{⊗ℤ}` the density `1` has the
   version `1 + 1_{ω = 1_{{0}}}`, whose level set `{1_{{0}}}` is not shift-invariant. The bridge,
   `TauCeti.MeasureTheory.exists_smul_invariant_ae_eq`, is in the contract (:294) but in no *Needs:*.

   **Exact repair:** in the route write "almost surely invariant, so their level sets are almost
   equal to exactly invariant events (`TauCeti.MeasureTheory.exists_smul_invariant_ae_eq`), hence
   almost surely tail-measurable by 4.2"; add that name to the 4.6 *Needs:* line and to
   `design/plan.json:1085`. On the witness the lemma replaces `{1_{{0}}}` by `∅`, exactly invariant
   and almost equal.

Five findings, three blocking (P2). The round-4 finding is repaired and its repair is correct. The
mathematics of all ten layers survived the adversarial pass: no false statement, no missing
hypothesis, no wrong sign. All three blocking findings are ownership defects in Layer 4, found by
searching the pinned Mathlib and main by object: Mathlib already has proper kernels and measurable
cylinders, and VonNeumannAlgebras on main already states the ergodicity of Bernoulli shifts. None
changes a headline statement.

## Previous finding: repair verification

One finding in round 4 (F01, P2); none was marked not actionable.

| Round-4 finding | Status | Repaired passage and check |
|---|---|---|
| F01: generic Jacobi identity of old §3.3 duplicates Tau Ceti | **Repaired** | `design/README.md:85–89`: "Jacobi's complementary-minor identity … already in Tau Ceti; 3.3 and 8.4 apply it to the restricted Leibniz sums of Kasteleyn matrices". Old §3.3 is gone, old §3.4 is §3.3, `plan.json` has 51 targets and `suppliers: []`. The theorem is at `TauCeti/LinearAlgebra/Matrix/Determinant/ComplementaryMinor.lean:160` at the pin; I read its statement and the contract paraphrase (`design/README.md:313–325`) matches it term by term. |

Adversarial pass on the passages the repair added (Conventions "Restricted Leibniz sums", the Tau
Ceti contract, 3.3 route and new Check, 8.4 statement, route and new Check): rows 1–6 of the table
below. The repaired pattern (a library object restated instead of cited) was then searched for in
the rest of the design; that search produced R01–R03.

## Verified sound

### Coverage

Read all 1813 lines of the README, the plan (10 layers, 51 targets: 19 definitions, 30 theorems,
2 examples; every definition has at least 3 API entries and 3 tests; no forward `target:` edge;
`gaps: []`, `suppliers: []`; section ids equal plan ids), and the manifest (10 works, one key
each, 8 certified, 2 settled uncertified). Plan baselines equal `lake-manifest.json` and the
checked-out library heads (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`). No LaTeX delimiters, machine
paths, pull-request numbers, `lemma`, or process words in the README. The layer order is forced
by dependencies (heights → flips → Kasteleyn; abstract specifications → dimers; torus → Fourier →
limits) and is no source's chapter order. No declared gaps; no author-flagged unverified locator.

### Seeded source sample (15 targets, all read at the cited lines)

| Target | Lines read | Outcome |
|---|---|---|
| 1.1 | aggarwal2023 324–337; gorin2021 405–420 | Lattice on `ℤ²` with the six directions and the two face shapes: as stated. Gorin's lines give the directions only. |
| 2.2 | gorin2021 454–457 | Consistency of the local rule; the square identity is the roadmap's own two-face computation, checked. |
| 2.4 | (no source theorem); Mathlib `Lifting.lean:489` | Own route. The lifting theorem needs a simply connected, locally path-connected domain, a base point and a lift; all supplied (vertex, lift `0`). |
| 2.5 | aggarwal2023 384–399; gorin2021 447–458; kenyon2009 353–368 | Increment rules agree; `h_G = x + y − 3H` recomputed: `+1` off a lozenge, `−2` across, in both directions `e₁` and `−e₃`. |
| 2.7 | aggarwal2023 403–407; gorin2021 511–514 | Independence of the boundary height from the tiling: supported. Gorin's remark overclaims (Source issues). |
| 2.10 | kenyon2009 869–878; kos2006 239–256 | Reweighting depends only on height change; gauge equivalence. The telescoping proof is the roadmap's, checked. |
| 3.1 | gorin2021 1199–1215; kenyon2009 428–440 | Kasteleyn matrix and Boltzmann measure as stated; label dependence only up to permutation. |
| 4.1 | sheffield2005 1341–1344 | Tail σ-algebra as the intersection over finite sets: as stated (Sheffield on `ℤ^d`; the general index set is the roadmap's). |
| 5.3 | gorin2021 4534–4582; aggarwal2023 413–420; kos2006 195–202; kenyon2009 825–835; sheffield2005 1352–1371 | Gibbs, invariance, the two definitions of "ergodic", and the face lemma: all at the cited lines. |
| 6.2 | gorin2021 4638–4642; kenyon2009 891 | The lines define extreme slopes and pose an exercise; the classification is proved here. Adequate as locators, not as proofs. |
| 6.3 | sheffield2005 6195–6198 | Theorem 9.5.1 is the taut-direction correspondence; the row homeomorphism and the two measures are the roadmap's own, checked below. |
| 7.2 | kos2006 206–213; kenyon2009 860–863 | Conditioned torus measures with height change `(⌊ns⌋,⌊nt⌋)`: as stated. |
| 8.4 | gorin2021 1847–1850; kos2006 658–666; kenyon1997 401–406 | All three sources use inverse minors; the roadmap's complementary-minor form is the correct generalisation (table, row 5). |
| 9.2 | gorin2021 1748–1781; kos2006 691–696; kenyon2009 945–952 | Lemma 4.7 says `n` or `n+2`; the roadmap's `n+1` correction is right (row 9). |
| 10.2 | aggarwal2023 413–415, 568–580; gorin2021 4538–4541; kenyon2009 786–809 | Uniform measures are Gibbs and the property passes to limits; Theorem 1.5 is not claimed. |

### Adversarial table

Exact rational arithmetic and brute-force enumeration, run from scratch scripts outside the
repository. Rows for unchanged text outside the sample that carried computed values in round 4
were re-read against the README and are not repeated.

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | Conventions, restricted Leibniz sum witness | `A = [[1,2,0],[0,1,3],[4,0,1]]`, rows `(0,2)`, columns `(1,0)` | `det A = 25`; cofactor matrix gives `25A⁻¹ = [[1,−2,6],[12,1,−3],[−4,8,1]]`; `Λ = A(1,2) = 3`; `det[[12,−3],[1,6]]/625 = 75/625 = 3/25`; `25·3/25 = 3` | holds |
| 2 | Tau Ceti contract paraphrase vs the Lean statement at :160 | `τ = id`, `σ = β∘σ₀`, `e` listing selected rows first | LHS = minor on complement rows and columns `σ₀(complement)`; RHS = `sgn(σ₀)·det K·det[K⁻¹(g_a,f_b)]`; times `sgn(σ₀)` gives `Λ = det K·det[K⁻¹]` | signs cancel as claimed |
| 3 | 3.3 on the unit hexagon | unit and `(a,b,c)` weights | `K = [[c,0,a],[b,a,0],[0,c,b]]`, `det = 2abc`; cofactors give `K⁻¹(B(0),W(0)) = 1/2`, `K⁻¹(B(−e₃),W(0)) = −1/2`; pair determinant `1/2`; enumeration: 2 tilings, each pair event mass `1/2`; shared `B(0)`: `0 = 0` | holds |
| 4 | 8.2 sign formula, 8.3 four-determinant formula, 8.5 products | tori 1×1 `(1,1,1)`, `(1,1,2)`; 1×2; 2×1 `(2,3,5)`; 2×2 unit and `(2,3,5)`; 2×3; 3×2 `(1,2,3)`; 3×3 | tilings 3, 3, 5, 5, 9, 9, 17, 17, 42; sign mismatches 0 in every tiling and twist; `Z` from determinants = brute `Z` (3, 4, 5, 58, 9, 1444, 17, 1640, 42); eigenvalue products equal determinants in all 36 cases; 1×2 determinants `(3,5,−1,1)` | holds |
| 5 | 8.4 with `c_{ab} = Λ` | same tori, every set of 1 or 2 distinct torus lozenges (6, 6, 21, 21, 78, 78, 171, 171) and 27 singletons on 3×3 | formula = brute probability in all 579 cases; inverse form equals `Λ` in all 1502 nonsingular cases; singular twists met: `K₁₁` (1×1), `K₀₁` (2×1), `K₀₀` (2×2, 3×3), `K₁₀` (3×2) | holds; complementary minors are needed |
| 6 | 8.4 new Check | 2×2, type-3 at `W(0)` | unit: `c = (−1,1,1,3)`, dets `(−3,5,5,5)`. `(2,3,5)`: `c = (60,100,150,190)`, dets `(0,544,1044,1300)`, `Z = 1444 = 625+200+450+16+81+72`; event weight `625+100+225 = 950`; `950/1444 = 25/38` | holds |
| 7 | 2.1, 2.6, 2.7, 3.2 ring examples | `R_ring`, ten-face path, `R₆'` | ring = the 12 faces meeting `W(0)`; exactly 2 tilings `T`, `T'`; circulation round `W(0)` is `−1` for both; bijection signs `−1`, `+1` (so `det = 0`, `Z = 2`); ten-face region: 1 tiling, `T ∖ {((−1,−1),3)}`; `R₆'`: 0 tilings, 8 boundary increments consistent, `h(1,1) − h(2,1) = 1 > 0` | holds |
| 8 | 2.5 bijection and Lipschitz bound | face relation `a + b = c` on `{0,1}³` | solutions `(0,0,0)`, `(1,0,1)`, `(0,1,1)`: exactly one edge per face; `(1,1,2)` excluded; `⌊(x+y)/2⌋`: `e₃`-increment always 1; `x+y`: 2 | holds |
| 9 | 9.2(a) and (b) | `θ = π/2`, `2π/3`; grid `π(2k+a)/n₁` | odd `n`: distance `π/(2n) > n^{−3/2}` iff `n > 4/π² ≈ 0.41`; even `n`: 0; `n=4`, `2π/3`: `π/12 ≈ 0.262 > 0.125`. Both bad at `n`, `n+1` forces `dist(θ, πℤ) = O(n^{−1/2})`. Nearest column contributes `≤ 2n₁^{1/2}/n₂` | holds; one separated coordinate suffices with comparable sides |
| 10 | 9.1 kernel values and angles | `w = (1,1,1)`; general liquid `w` | `θ`-residue: `G(0,−2) = (2π)⁻¹(√3 − 4π/3 + 2π/3) = √3/(2π) − 1/3`; `w₁G(−e₂)` = normalised length of the arc `|w₃+w₂e^{iθ}| < w₁` = `θ₁/π`; row formula `(−1)^m sin(θ₁m)/(πm)`; 9.3 pair value `1/9 − (1/3)(√3/(2π) − 1/3) ≈ 0.1303` | holds; agrees with 9.7(a) on a row |
| 11 | 6.3(f) | `s = 1/2`; general `s` | `P(ε₀=ε₁=1)`: `s²` vs `(s+s²)/2`; `1/4` vs `3/8`; equal iff `s ∈ {0,1}`; `β_s(A) = β(A)` for shift-invariant `A` | two distinct ergodic measures |
| 12 | 6.1 rotation, 7.2 slope | `δ_{M₁}`; 2×2 uniform | `(1−1−0, 1) = (0,1)`; `ρ(2,0) = (0,2)`, `ρ(0,2) = (−2,−2)` in `L`; type-1 count over 9 tilings `4+4+4 = 12` of 36 faces: `1/3` | holds |
| 13 | 7.1 floor tilings | `(a,b)` with `n₂a + n₁b ≤ n₁n₂` | increments of `⌊ax/n₁ + by/n₂⌋` along `e₁, e₂, e₃` are in `{0,1}` iff `a/n₁`, `b/n₂`, `a/n₁+b/n₂ ≤ 1`; 2×2 `(2,1)`: `6 > 4` | holds |
| 14 | 5.2 cylinder identities and gauge | `C₆`; `ℤ` | ratio `μ[ω]_E/μ[ω']_E = w(ω∩F)/w(ω'∩F)` once `E` contains the neighbours of `F` (normaliser constant on the cylinder); gauge factor `∏g(v)` over the same vertex set for all completions | holds |
| 15 | 9.7(f) and its counterexample | heights `1_{x>0}` below, `1` or `y` above | a type-1 lozenge at `(x,y)` forces vertical increments `0` at `(x+1,y)` and `(x,y−1)`; both heights have `X = {(0,y): y ≤ 0}` and rows `≥ 1` empty | reconstruction condition correct |
| 16 | 10.2 Check 3 | `H = min(0,x,y)` | `H(e_k) = 0`, `H(−e_k) = −1` for `k = 1,2,3`: flip allowed at `0`; completion set of size 2 | holds |
| 17 | R01–R05 witnesses | see findings | values in each finding | findings stand |

### Pinned declarations opened

Every backticked Mathlib and Tau Ceti name in the README was located at the pins (file and line):
the Mathlib names of the contract (among them `Matching.lean:67/236/254`, `Maps.lean:225`,
`Finite.lean:382`, `Compact.lean:1175/1178`, `Constructions.lean:580`, `ProductMeasure.lean:354`,
`BorelSpace/Basic.lean:188/645/673/697`, `Prokhorov.lean:176`, `Portmanteau.lean:362/829`,
`MeasuredSets.lean:86`, `ZeroOne.lean:229/290`, `Ergodic/Action/Basic.lean:31/43`,
`Extreme.lean:63/70`, `Determinant/Basic.lean:66`, `NonsingularInverse.lean:167/173`,
`Perm/Sign.lean:358`, `SimplyConnected.lean:41/137`, `Lifting.lean:489`, `AddCircle.lean:32`) and
the Tau Ceti names (`ErgodicExtreme.lean:75/86/239`, `CountableAction.lean:53/68`, `Face.lean:40`,
`Tail/Basic.lean:42/47/64`, `ComplementaryMinor.lean:160`, `Jacobi.lean:54`). None is missing.
New by-object hits not cited by the README: `Kernel/Proper.lean:47` (R01), `Cylinders.lean:275`
(R02), `SymbolicDynamics/Basic.lean:253` (R04). Tau Ceti's
`TauCeti/Combinatorics/Enumerative/PerfectMatching.lean` is fixed-point-free involutions of a
finite type, not graph matchings: no overlap.

### Roadmap ownership

Searched main and the open heads (`roadmaps grep`) for Kasteleyn, lozenge, dimer, Gibbs,
Bernoulli shift, determinantal, subshift, tail σ-algebra, height function, Thurston. No roadmap
states dimers, lozenge tilings, Kasteleyn matrices or DLR specifications. Scope citations resolved
on main: TensorProductCombinatorics §1.1 (`README.md:465`), RandomMatrices §8.3–8.4
(`README.md:1183`, `:1253`), GraphConnectivityAndFlows §6.7 (`README.md:753`). The board package
index lists three packages under review (AnalyticNumberTheory, LawrenceVenkateshMethod,
LogicAndDefinabilityInNumberTheory); their READMEs were not opened this round (Not verifiable). Of
the packages in this checkout, `packages/ConstructiveFieldTheoryPhi4/design/README.md:19` excludes
the DLR formalism of specifications from its own scope, so it is no second owner of Layer 4. `scratch/overlaps.md` reports no conflicting
head, no dropped cited id and no revision-only id, and `roadmaps resolve` reports nothing unresolved.

Overlap check: read ClassicalErgodicTheory, ProbabilisticAndMetricNumberTheory, PointProcesses, AnalyticNumberTheoryPartII, RandomGraphs, Exchangeability, StochasticCalculus, RandomMatrices (third list empty); shared: ergodicity of Bernoulli shifts — owner VonNeumannAlgebras V8.BernoulliArbitraryDiscrete on main (R03; ClassicalErgodicTheory also plans it); sequence tail σ-algebras — owner Tau Ceti/Exchangeability, cited; continuous determinantal processes — owner RandomMatrices §8.3, cited; nothing else shared.

### Supplier order

Every *Needs:* line and Dependencies paragraph was read; the design names no roadmap as a
supplier. Dependency check:

```text
candidate: DimerModelsAndLozengeTilings is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD or CYCLE line. R03's Scope citation of VonNeumannAlgebras (merge order line 5) is downward.

### Headline theorems

From the Summary: 1.5, 2.5, 2.9, 3.2, 3.3, 4.6, 5.3, 6.3, 7.3, 8.3, 9.5, 9.7, 10.2. Each is a named
target with hypotheses and a locator. This is a design: there is no `Suggested.lean`, so there is
nothing to probe for padding and no `#check` comparison. For the package stage: the README
backticks about two dozen names of its own (for example `two_ergodicGibbs_of_slopeEdge`, which is
not a plan target name), and each must be declared in `Suggested.lean` or lose its backticks.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean
  command was run.
- `thurston1990` and `georgii2011`: settled uncertified entries, cited by locator; not requested.
- Formulas in the kenyon1997 extraction near lines 401–406 are partly unreadable; the statement of
  Lemma 8 was checked through gorin2021 Theorem 4.10 and kos2006 Theorem 4.2 and by enumeration.
- The publisher pagination of gorin2021 was not checked; lines of the cached pre-publication copy
  were.
- The READMEs of the three packages in the board index live on other pull requests' heads and
  were not fetched; by title they are number-theoretic, and round 4 read two of them and found
  no overlap. Ownership against them rests on that.
- Source issues listed by round 4 that I did not re-read this round (cohn-kenyon-propp2001 §1.4,
  gorin2021 lines 1891–1893, aggarwal2023 equation (1.2)) are not repeated below.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, pre-publication p. 45 (line 1766): the source says that for large n either n or n+2 is a good size; it should be n or n+1, since for the angle π/2 every even n fails; affects the proof.
- **Gap** in kenyon2009 at Section 5.4, preprint p. 29 (lines 863–866): the source says torus limits are ergodic because extreme points of the fixed-slope set are ergodic; it should prove ergodicity separately, the equal mixture of the three frozen measures being fibre-extreme and not ergodic; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and the sentence after Section 5.4's triangle, preprint pp. 28–29 (lines 836–839, 858–859): the source says every slope of the closed triangle has a unique ergodic Gibbs measure; it should restrict uniqueness to interior slopes, edge slopes carrying at least two; affects a stated result.
- **Error** in aggarwal2023 at Section 1.3 after Definition 1.2, preprint p. 10 (lines 465–467): the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require that no two consecutive rows lack type-1 lozenges; affects nothing.
- **Gap** in gorin2021 at Theorem 4.10, pre-publication p. 46 (lines 1847–1849): the source says torus correlations are given by inverse-matrix minors for arbitrary weights; it should use complementary minors, or assume all four twisted determinants nonzero, weights (2,3,5) on the 2 × 2 torus being singular; affects a stated result.
- **Error** in gorin2021 at Lecture 1 before Exercise 1.3, pre-publication p. 17 (lines 511–514): the source says the local rules define the boundary height of any simply connected region, tileable or not; it should require zero circulation, a single triangle having none, as its own Figure 1.9 shows; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8baff5ee5a35209d6919faa1caa4782f3fff753f", "job": "REV-DESIGN-DimerModelsAndLozengeTilings~5", "model": "fable", "worker": "chris-x31"} -->
