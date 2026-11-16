<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6912029037 -->
Red team round 1 pass a (claude) of 6309723

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) two declared gaps are compound

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:76` ("free animated commutative
   monoids and their group completions; the Breen–Deligne resolution …; and the augmentation-ideal
   filtration …") and `:88` ("homotopy K-theory … its extension to nonunital rings, excision for
   arbitrary ideals, and descent for abstract blowup squares"); the same two `needs` in
   `design/plan.json`.

   **Claim.** Each `needs` sentence states exactly one missing statement.

   **Witness.** `gap:animated-group-completion` bundles three theorems with disjoint consumers:
   group completion (§§3.3, 4.1, 4.7), Breen–Deligne (§§6.1, 6.3), augmentation filtration (§5.4).
   `gap:kh-excision-cdh-descent` bundles a definition and three theorems; GeneralAlgebraicKTheoryPartII
   already asks SchemeKTheoryOperations §5.2 for the first as `gap:kh-simplicial-model`.

   **Repair.** Replace README line 76 by three contract lines, and add the two new slugs to the
   top-level `gaps` of `design/plan.json` (supplier EnhancedDerivedSheaves, section §E5:animation):

   > What EnhancedDerivedSheaves must provide (gap:animated-group-completion): free animated commutative monoids and their group completions (§E5:animation).
   >
   > What EnhancedDerivedSheaves must provide (gap:breen-deligne-resolution): the Breen–Deligne resolution of the group completion of a sheaf of animated commutative monoids by classifying spaces of products of its terms (§E5:animation).
   >
   > What EnhancedDerivedSheaves must provide (gap:augmentation-ideal-filtration): the augmentation-ideal filtration of the group algebra of a 1-connective animated abelian group, with graded pieces of increasing connectivity and convergence (§E5:animation).

   Repoint the *Needs:* lines: §§3.3, 4.1, 4.7 keep `gap:animated-group-completion`; §6.1 names
   `gap:breen-deligne-resolution`; §6.3 names `gap:animated-group-completion` and
   `gap:breen-deligne-resolution`; §5.4 names `gap:augmentation-ideal-filtration`; the Dependencies
   lines of Layers 3–6 follow.

   Replace README line 88 by three contract lines (new slugs added to `plan.json`, supplier
   SchemeKTheoryOperations):

   > What SchemeKTheoryOperations must provide (gap:kh-simplicial-model): homotopy K-theory `KH(R) = |K(R ⊗ ℤ[Δ^•])|` of rings and of qcqs schemes (§5.2).
   >
   > What SchemeKTheoryOperations must provide (gap:kh-excision): for a ring `R`, an ideal `I` and a ring map `R → S` carrying `I` isomorphically onto an ideal of `S`, the map `fib(KH(R) → KH(R/I)) → fib(KH(S) → KH(S/I))` is an equivalence, so that `KH` of a nonunital ring is defined through any unitization (Layer 5).
   >
   > What SchemeKTheoryOperations must provide (gap:kh-cdh-descent): `KH` carries abstract blowup squares of noetherian schemes of finite Krull dimension to pullback squares (Layer 5).

   The ring case of the first line is the contract GeneralAlgebraicKTheoryPartII already states to the
   same supplier section under the same slug. §7.4 and §7.5 then name the three slugs in place of `gap:kh-excision-cdh-descent` (§7.4 API bullet
   2 names `gap:kh-excision`; the Route of §7.4 names `gap:kh-cdh-descent`).

2. **F02** (P3) §9.6, third Check: the example is not shown to be infinite-dimensional

   **Location.** `README.md:1104`: "An infinite-dimensional base, such as a bounded product of copies
   of `ℂ⟨T⟩₁` over a countable set, violates the finite-dimension hypothesis."

   **Claim.** That bounded product has infinite cohomological dimension.

   **Witness.** No dimension is computed. Countably many copies of one two-dimensional ring do not
   raise dimension: `∏^b_ℕ Cont(D, ℂ) = Cont(β(ℕ × D), ℂ)` for the closed disc `D`, and
   `dim β(ℕ × D) = dim(ℕ × D) = 2`.

   **Repair.** Replace the bullet by:

   > - Finite cohomological dimension is a hypothesis, not a consequence of compactness. For `A = Cont([0,1]^ℕ, ℂ)`, `M(A)` is the Hilbert cube and `Dfin(Marc(A), ℤ)` is the left-completed derived category of sheaves on it (§1.3). For each `n` let `i_n` be the inclusion of the closed subcube `[0,1]^n × {0}` and `j_n` that of the open cube `(0,1)^n` into it; then `H^n([0,1]^ℕ, i_{n*} j_{n!} ℤ) = H^n_c((0,1)^n, ℤ) = ℤ ≠ 0`, so `d(Marc(A)) = ∞` and §9.6 does not apply. Repeating one finite-dimensional factor does not give such an example: `∏^b_ℕ Cont(D, ℂ) = Cont(β(ℕ × D), ℂ)` for the closed disc `D`, of covering dimension `2`.

   Tested on the refuting instance: the replaced example has `H^n ≠ 0` for every `n`.

3. **F03** (P3) MorseNovikov is cited without a section

   **Location.** `README.md:20`, `:110`, `:840`, `:856`: "MorseNovikov (the Lefschetz fixed-point
   formula)".

   **Claim.** Suppliers are cited by roadmap name and section or target.

   **Witness.** The formula is `lefschetz_fixed_point_formula` of MorseNovikov §6.5 ("Native Lefschetz
   signature") on main: smooth self-map of a compact manifold, nondegenerate fixed points, sum of signs
   equals the alternating trace on `H_*(M; ℚ)`.

   **Repair.** At the four places write: "MorseNovikov §6.5 (`lefschetz_fixed_point_formula`; a
   fixed-point-free smooth self-map of a compact manifold has no fixed point to be degenerate, so its
   alternating trace on rational homology is `0`)". The hypothesis is met in §6.2: each `w ≠ 1` acts
   smoothly and freely on `U(n)/T`.

4. **F04** (P3) wrong page for Remark 1.8

   **Location.** `README.md:940`: "Remark 1.8, p. 6".

   **Witness.** Scholze line 198 (Remark 1.8, with the sentence on the `E∞`-`K(C)`-algebra structure)
   lies on page 5; page 6 begins at Scholze line 212.

   **Repair.** "Remark 1.8, p. 5".

5. **F05** (P3) "analytic cover" and "analytic topology" are used in two senses and never defined

   **Location.** `README.md:160` ("that analytic covers are arc-covers"; "the analytic cover
   `A → A((T))_{1/2}`"), `:203`, `:215` ("Analytic covers of strict rings by strict rings are
   quasi-pro-étale"), `:890` and `:898` ("a sheaf for the analytic topology").

   **Claim.** Every term is standard or defined in the roadmap.

   **Witness.** In lines 160 and 203 "analytic cover" means the cover by the analytic ring
   `A((T))_{1/2}`; in lines 160 (second clause) and 215 it means a cover in a topology on `M(A)` that
   the README never states; Scholze lines 2011–2013 and 2072 use "analytic topology" undefined too.

   **Repair.** (a) In §0.3, before "Prove that", add: "An *analytic cover* of a Banach ring `A` is a
   finite family of contractive maps `A → A_i` such that each `M(A_i) → M(A)` is a homeomorphism onto
   a closed subset `Z_i`, inducing isomorphisms of completed residue fields, with `⋃ Z_i = M(A)`; the
   *analytic topology* is the one these families generate." (b) In lines 160 and 203 replace "the
   analytic cover `A → A((T))_{1/2}`" by "the arc-cover `A → A((T))_{1/2}` by an analytic ring".
   (c) In §§7.3 and 7.4 add after "for the analytic topology": "(§0.3)". Both API claims hold for the
   definition: such a family is surjective on spectra, and for strict `A`, `A_i` and a point
   `A → C` over `x`, the uniform completion of `A_i ⊗̂_A C` is `C` if `x ∈ Z_i` and `0` otherwise,
   that is `Cont(S, C)` with `S` a point or empty.

6. **F06** (P3) "quasi-pro-étale" is not defined for maps of small arc-stacks

   **Location.** `README.md:355` ("if `f` is moreover quasi-pro-étale"), `:1056` ("a proper
   quasi-pro-étale map `f : Y → X` of small arc-stacks"), `:1096` ("a quasi-pro-étale map
   `Marc(C(x)) → X`").

   **Witness.** §0.6 defines the notion for maps of Banach rings only. The source defines the stack
   notion inside its statement: Scholze line 1021 (Theorem 4.20, p. 24).

   **Repair.** In §1.7 replace "if `f` is moreover quasi-pro-étale," by "if `f` is moreover
   *quasi-pro-étale*, meaning that for every geometric Banach point `Marc(C) → X` the fibre
   `Y ×_X Marc(C)` is `S × Marc(C)` for a profinite set `S` (Scholze, Theorem 4.20, p. 24; for
   `Marc(B) → Marc(A)` with `A → B` quasi-pro-étale in the sense of §0.6 this holds, since
   `Marc(B ⊗̂_A C) = Marc(Cont(S, C)) = S × Marc(C)` by §0.3)," and in §§9.3 and 9.6 add "(§1.7)"
   after "quasi-pro-étale".

7. **F07** (P3) the Conventions re-prove a target of TropicalAndBerkovichArithmetic §0.27

   **Location.** `README.md:26`, from "If `1 = Σ_j a_j t_j` with each `t_j` topologically nilpotent"
   to "whose completed residue field `A/m` is discrete."

   **Claim.** What another roadmap plans is imported by name and section.

   **Witness.** TropicalAndBerkovichArithmetic §0.27 (its README line 777 at the head of its pull
   request): a Banach ring is "free of trivial spectrum when every H(x) has nontrivial absolute value;
   equivalently the ideal generated by its topologically nilpotent elements is the unit ideal".

   **Repair.** Replace the two sentences of proof by: "The equivalence is
   TropicalAndBerkovichArithmetic §0.27, where such a ring is called free of trivial spectrum; the zero
   ring satisfies both conditions vacuously." Keep the definition and the locator to Scholze,
   Definition 2.17.

8. **F08** (P3) §2.1, third Check computes nothing

   **Location.** `README.md:410`: "The construction retains torsion prime to the residue
   characteristics; it is not defined by tensoring with `ℚ`."

   **Witness.** No object and no value; the sentence holds for any definition one cares to compare.

   **Repair.** Replace by:

   > - Torsion prime to the residue characteristic survives and `p`-torsion does not. Over a nonarchimedean geometric point `C` of residue characteristic `p` and a prime `ℓ ≠ p`, the constant sheaf `ℤ/ℓ` is étale, hence ball-invariant (§2.4), and `Hom(ℤ, ℤ/ℓ) = ℤ/ℓ ≠ 0` in `Deff_mot(Marc(C))`, although `ℤ/ℓ ⊗ ℚ = 0`; so `Deff_mot` is not its rationalization. For `ℓ = p`, multiplication by `p` is invertible on `Deff_mot(Marc(C))` (§4.8), so `L_B(ℤ/p) = 0`.

One P2 (two compound supplier gaps) and seven P3 findings. No false statement, no unowned
prerequisite, no upward dependency and no missing headline was found. `Suggested.lean` declares
nothing, so the mechanical `#check` comparison has no declaration to run on and no Lean was run.

Dependency check (run on the head, unchanged files):

    depcheck: 256 roadmaps, 2446 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Verified sound

Counts: 0 declarations in `Suggested.lean` (all 50 lines read); 83 numbered README targets read
(every line of the README, 1505 lines); 118 source locators verified (Scholze 95 statement and
page pairs against the cached text, Cisinski–Déglise 8, Bachmann 10, Vakil 3, van der Put 2); 124
Checks and worked examples recomputed; 144 sibling sections and 31 sibling declaration names
resolved against main or the open heads; 14 Mathlib and 14 Tau Ceti files opened at the pins, with
29 declaration names found there.

**Suggested.lean.** One `import Mathlib`, one module docstring in the required form, an empty
namespace, no `set_option`, no `sorry`. Headline theorems listed from the README: cancellation
(§5.3); finitarity and Adams splitting of `Kmot` (§§6.1, 6.3); `Kmot` on strict rings (§7.6);
torsion and tilting comparisons (§§4.8, 4.9, 8.3); six operations and proper base change (§§8.5,
9.4); rigidity (§§9.1, 9.6); `DM_et(k, ℤ) ≃ Dmot(k)` (§10.6); monodromy equivalence (§11.8);
overconvergent comparison (§12.3). Each is named in the docstring with the carrier it lacks; each
needs a stable ∞-category of sheaves on the Banach arc-site, which neither pin has
(`SSet.Quasicategory` exists; no Berkovich spectrum, no K-theory spectrum). None is statable; no
padding is possible in an empty file.

**Pins.** Every Mathlib and Tau Ceti path and name of the supplier contracts exists at the pins
with the stated hypotheses: `unitBallIdeal`, `mem_unitBallIdeal` (seminormed, ultrametric,
`NormOneClass`); `norm_inverse_one_sub`, `norm_inverse_one_sub_sub_one`,
`isUnit_unitClosedBall_of_norm_sub_one_lt` (normed ring, `NormOneClass`, `HasSummableGeomSeries`,
ultrametric); `PowerSeries.isPrincipalIdealRing_isRestricted_subring` (`hc : 0 < c`, complete
ultrametric normed field); `MvPowerSeries.isNoetherianRing_isRestricted_subring` (complete
ultrametric normed division ring, `Finite σ`); `cohomologicalDimensionAt_le_of_isClosed` (compact
totally disconnected); `strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`;
`AlgebraicGeometry.Smooth.exists_etale_affineSpace` (`𝔸(ULift (Fin n); S)`);
`SymmetricAlgebra.projToSpec`, `instIsProperProjToSpec` (`Module.Finite`); `projectiveLine`,
`polynomialChartι`, `range_polynomialChartι_union_range_polynomialChartι`;
`puncturedAffineSpace`, `PuncturedAffineSpace.homEquiv`; `ExactK0`, `StableGeneralLinearGroup`,
`AlgebraicK1`; Mathlib `continuousCohomology`, `PowerSeries.IsRestricted.subring`,
`MvPowerSeries.IsRestricted.subring`, `AlgebraicGeometry.{Scheme, LocallyOfFinitePresentation,
Etale, QuasiCompact, Smooth, AffineSpace, Proj}`.

**Siblings.** Every cited section exists where cited, with the content the README attributes to
it: TropicalAndBerkovichArithmetic §§0.1–0.32 (26 sections), 1.1–1.3, 1.6, 2.16, 3.7;
EnhancedDerivedSheaves E0.4, E1.3, E2.1–E2.7, E3.2, E3.4, E5:abstract.1–5, E5:presentability.2–4,
E5:descent, E5:animation.1, E5:spectra-comparison and all 22 named targets; AnalyticStacks 0.4–0.6,
0.9–0.10, 1.1–1.5 (its Downstream consumers paragraph leaves the operator description of the
representations to this roadmap); GeneralAlgebraicKTheory 3.2, 4.3, 8.3, 8.10, 10.10, 13.4, 13.5,
13.8c; GeneralAlgebraicKTheoryPartII 1.2; SchemeKTheoryOperations 2.6, 2.7, 3.1, 3.3, 3.4, 3.5,
3.8, 5.2, 6.4, 6.8, 6.11; KTheoryFiniteLocalFields 1.5, 1.6, 2.1, 6.5; RefinedTraceMethods 4.10,
4.20; JacobianChallenge Layers A, B, D, E with §§D.2, D.5, D.8, E.7 and the five names;
AnabelianGeometryAndNonabelianChabauty target "Generalized Jacobian of a reduced boundary";
PerfectoidSpaces P1.4, P1.19–P1.22, P1.27, P2.3, P2.7, P2.12, P2.13, P3.20; DiamondsAndVStacks
D0.22, D0.23, D1.4, D2.7, D4.7, D4.9, D6.1, D6.3 (`Perf.Spd`, the lead of `scratch/citations.md`,
is that roadmap's name: resolved); DiamondEtaleCohomology C0.19, C0.24, C2.2, C2.12, C4.5, C4.13,
C4.14, C6.1, C9.8; DiamondSixOperations S2.4, S4.2, S4.3; MotivesAndAlgebraicCycles 4.1–4.6, 4.9,
4.11, 4.15–4.18; MotivicEtaleKTheory 2.2; AdicCoefficientsAndComparisons L5
(`smoothAlterationPair`); ProfiniteCohomology 10.2, Layers 10–11; SchemeAndStackFoundations 2.16;
EtaleCohomologyFoundations F.2.1, F.2.3, F.3.0; AdicSpacesPartIII R3.5
(*sheafy-tate-acyclicity-and-kiehl-gluing*); RepresentationTheory/LieGroups Layer 8;
CharacteristicClasses C5. All suppliers are on main or earlier in the merge order.

**Ownership.** `roadmaps grep` for Berkovich motives, étale motives / `DM_et` / h-motives, strictly
totally disconnected Banach rings, the Banach arc-site, motivic K-theory / `Kmot` and motivic
nearby cycles, over main and the 458 open heads: no second owner. ArcTopologyAndDescent owns the
arc- and h-topologies on schemes, not on Banach rings. The overlap found is R07.

**Gaps.** Eight slugs, the same in `design/plan.json` and under `## Exact supplier contracts`, each
with a named supplier and section. Precision and minimality: R01 for two of them; the other six
ask for one statement each and for nothing the suppliers, the pins or an earlier roadmap provide
(`KH`, cdh descent, K-regularity of valuation rings, Suslin rigidity for algebraically closed
fields, `K(O_C)^∧_p ≃ K(C)^∧_p`, the `E∞` fracture square and Postnikov completeness of replete
topoi are stated nowhere on main or in a roadmap earlier in the order).

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/MotivesAndAlgebraicCyclesPartII/`.
No pull-request number, no process narrative, no `lemma`, no `set_option`, no algorithm; every
target has a locator.

### Adversarial pass (computed values)

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Conventions, analytic ⇔ t.n. elements generate `(1)` | zero ring; trivially normed field `k`; `ℤ₂` with `2^{−⌊v/2⌋}` | `0`: both hold; `k`: t.n. ideal `0`, `K(x) = k` discrete; `ℤ₂`: `2` t.n. but not a unit, ideal `(2) ≠ (1)`, point `c = 0` has residue field `𝔽₂` discrete | consistent (R07) |
| Conventions, mapping formula | `X = ℙ¹`, `j = 1` | `π_{−2} = K₀^{(1)} = ℚ = H²(ℙ¹, ℚ(1))`; `π₀ = K₂(ℙ¹)^{(1)} = 0` (weights 2 and 3 only) | sound |
| §0.1 weak compactness | `ℤ[T]_{r′} → ℤ[T]_r`; identity of `ℤ[T]_r`; Banach tower `ℚ_p⟨x₁..x_n⟩`, `z = Σ pⁿx_n` | norm in colimit `= inf = r < r′`; identity: norm `r + 1/n > r` at each stage; `|z| = 1/p`, coefficient `p^{n+1} ≠ 0` at `x_{n+1}` | sound |
| §0.2 covers | zero ring; `A → 0`, `A ≠ 0`; trivially normed `k → B` | `M(0) = ∅`; `M(A) ≠ ∅`; lifting criterion ⇔ `B ≠ 0` | sound |
| §0.3 `A((T))_{1/2}` | `A = ℂ`: `f = 1 + 2T`; `u = 1/2`, `1/3`; `A = k` trivial | sup norm `1`, `f²` sup norm `2 > 1`; sum norm `2`, `4`; `T^{−n} ↦ 3ⁿ > 2ⁿ`; one point `|T| = 1/2` | sound |
| §0.4 strict | `ℝ`; trivially normed `k`; bounded product over infinite `I` | t.d. not strict; not analytic; spectrum `βI` | sound |
| §0.6 qpe | identity of discrete `k`; `C⟨T⟩₁` | `S = pt`; spectrum connected, not `Cont(S, C)` | sound; R06 for stacks |
| §0.8 `Y^arc` | `K[ε]/ε²`; `r = 1`, `1 + T` | `b² = 0 ⇒ |b|² = 0`; sup `1`, square sup `2` | sound |
| §1.2 finitary | `Cont(S, C)`: constant sheaf, all functions | `colim ℤ^{S_j} = C(S, ℤ)` both sides; `ℤ^S ≠ colim` | sound |
| §1.4 | `{|a| < r}`: `a = 0`, `a = 1`, `r ≤ 1`; point of `[0,1]` | whole space; empty; mono not open | sound |
| §1.8 `Det` | `Ḡ_m` at Gauss-point extension; `μ_n`, `n` prime to `p`; complex base | class of `T` has residue transcendental over `k`; `μ_n(C) = μ_n(C′)`; `|1/2|_C ≥ 1 > 1/2` excludes nonarchimedean points | sound |
| §2.1 dimension bound | `ℂ`; nonarchimedean `C` | `2 + 0`; `1 + scd ≤ 1 + 2` | `≤ 3`, sound |
| §2.7 free motives | `ℙ¹`; `{0} ⊂ [0,1]`; `log(1+T)` over `ℂ_p`; `ℙ¹_ℂ` bound | cofibre of `(1, −1)`: `ℤ ⊕ ℤ(1)[2]`; stalk of `∏ F_n` is `∏ℤ/⊕ℤ ≠ 0 = ∏` of stalks; fibre `μ_{p^∞} − 1` infinite; `2 ≤ 4N = 4` | sound |
| §3.1 one-units | `−1` in `ℚ₂`, `ℚ₃`; zero ring | `‖−2‖ = 1/2 < 1`; `‖2‖ = 1`; `U¹ = {0}` | sound |
| §3.4 `ℤ(1)` | `ℂ`, `ℝ`, nonarchimedean | `ℤ`; sign; `Ḡ_m[−1]` | sound |
| §3.5 root criterion | `T² − 1` over `ℂ₂`; `n = 1`; `T² + T/2 + 4`, `r = (1/4, 4)` | max `1`, min over `i = 2` only `1`; no condition; valuations `(2, −1, 0)`, slopes `−3, 1`, root norms `1/8, 2`; `min(4, 1) = 1 < 2 = |a₁|` excluded, `max = 4` admits | README's `min` right, source's `max` wrong |
| §4.3 `J_Z` | `r = 1`; `ℙ¹`, `Z = {0, ∞}`; `ℓ = char` | torus trivial; `G_m`, coordinate `a/b`; `C^×` and `Jac(C)` divisible | sound |
| §4.6 inverting `ℓ` | `ℤ/ℓ` in characteristic `ℓ` on `C⟨T⟩₁` | `x̄^ℓ − x̄ = T` forces nonzero coefficients at all `T^{1/ℓ^m}` | sound |
| §4.8 norm vs pointwise | `ℤ₂`, `‖x‖ = 2^{−⌊v/2⌋}` | `‖2‖ = 1`; `‖2ⁿ‖^{1/n} → 2^{−1/2}`; points `c ≤ 2^{−1/2}` (from `c² ≤ 1/2`) | sound |
| §5.4, §8.2 | `ℙ¹` at `ℂ` | `f_♯ℤ = ℤ ⊕ ℤ[2]`; `f_*ℤ ⊗ ℤ(1)[2] = ℤ[2] ⊕ ℤ` | sound |
| §6.1 `π₀Kmot(C)` | `ℂ₂`, `ℂ₃` | `K₀(C_{<1}) = K₋₁(C_{<1}) = 0`, `π₀E_K = ℤ`, `π₀Kmot = ℤ[1/p]`; no additive `ℤ[1/p] → ℤ` with `1 ↦ 1` | sound |
| §6.2 | `n = 1, 2` | trivial; transposition `= ` antipode on `S²`, `+1` on `H⁰`, `−1` on `H²` | sound |
| §6.3 projectors | eigenvalues `1, 2, 4` | `(1,0,0)`, `(0,1,0)`, `(0,0,1)`; denominators `3, −2, 6` | sound |
| §7.1 class | `ℚ_p`; valued `C` | `I/I² = 𝔽_p ≠ 0`; pushout square `K(O_C) → K(C) ⊕ K(k) → E_K(C)` | sound |
| §7.4 `E_KH` | `ℚ_p`; fibre vs cofibre | `π₀ = π₋₁ = 0` for `fib(K(ℤ_p) → K(𝔽_p))`; cofibre `π₀ = ℤ`; fibre `π₀ = ℚ_p^×/(1 + pℤ_p)` | sound |
| §7.7 gluing | `π₀` | `ℤ = ℤ[1/p] ×_{ℚ_p} ℤ_p` | sound |
| gap:padic-k-integers-oc | `ℂ_p`; characteristic `p` | `(C^×)^∧_p = (O_C^×)^∧_p` since `ℚ^∧_p = 0`; both sides `ℤ_p` in characteristic `p` | true as stated |
| §8.5 closed disc | `f_*f^!ℤ` vs dual | `ℤ(1)[2]` vs `ℤ`; `ℤ(1)[2] ⊗ ℚ = (Ḡ_m ⊗ ℚ)[1] ≠ ℚ` | sound |
| §9.5 `E_C ∉ DMT` | `n_{i,m}` | `K_{m−2i}^{(1−i)}` and `K_{2i−m}^{(i)}` force `m = 2i`; `n = (1, 1)`; `dim End = 2`; intersection matrix determinant `2`, `dim CH¹(E × E)_ℚ ≥ 3` | sound |
| §9.6 Checks | `ℂ × ℂ`; `[0,1]`; bounded product of discs | compactly generated; `RΓ([0,1], j_!ℤ) = 0`; dimension `2`, not `∞` | R02 |
| §10.2 | `𝔽̄₃`, `n = 2`, `n = 3`; `G_m`, `n = 2` | `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; `x³ − x = t` has no polynomial solution; `ℤ/2 ⊕ ℤ/2[−1]` | sound |
| §10.5 | `Spec k`; `e = 2` | weight-one `π₁ = (k^× ⊗ ℚ) ⊕ ℚ = Ḡ_m(C) ⊗ ℚ`; length `2`, multiplication by `2` | sound |
| §11.1 direction | one point into two | `(a, b) ↦ a`; no induced `ℤ → ℤ²` | README right, source reversed |
| §11.3 `H` | mod `ℓ`; Hopf structure; counit | `H ⊗ 𝔽_ℓ = 𝔽_ℓ`; `Δf(1,1) = f(1) ∈ ℤ[1/p]`; ideal `≅ H ⊗ ℚ` flat, Tor amplitude `[−1, 0]` | sound |
| §11.6 | `ℤ/2` over `𝔽̄₃`; `N` on `ℚ ⊕ ℚ(1)` | `A ⊗ ℚ = 0`, pair `(ℤ/2, 0)`; `N ≠ 0`, `N² = 0` | sound |
| §12.1 | `𝔽_p(x)((t))` perfected; `B(ℤ/2)` | `O_K ⊄ K⁺`; `𝔽_p` algebraically closed in `k`; not `0`-truncated | sound |

## Not verifiable

- BLR, §9.2 (Proposition 3, Example 8, Proposition 10): settled as uncertified; the locator was not
  read. §4.3 does not depend on it (its Route uses JacobianChallenge Layers D and E).
- The journal pagination of Scholze: the README cites arXiv v3 pages, as `sources.toml` records;
  the nine corrections E1–E9 were checked against arXiv v3 only.
- §4.2 Checks on triangulations and the genus-one example, and §12.1 Checks on the points added by
  `b^* a^*`: read and found consistent, not recomputed in full.
- Whether a bounded product of disc algebras (as opposed to `Cont(D, ℂ)`) has finite dimension: not
  decided; R02 replaces the example.
- AnalyticStacks' Downstream consumers paragraph writes `MG_ℂ` where this roadmap has `MG_C`
  (the completed algebraic closure of `𝔽̄_p((T))`): a slip in that roadmap, outside this package.
- Ownership against the board's other packages that are not open roadmap pull requests was checked
  only through `roadmaps grep` (main and the 458 open heads).

## Source issues

- **Misprint** in Scholze at proof of Proposition 5.19, p. 35: the source says the coefficients of a polynomial with all roots in the annulus satisfy a bound by the maximum of two quantities; it should be the minimum of the two; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the outer case is `|T| ≥ r₁ > 1` and bounds the inner product by `r₁ⁿ`; it should be `|T| ≥ r₂`, and the inner bound `r₁^{k_i}`, the other factors having norm one; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the ratio of two nearby coordinates is one plus `(T₂ − T₁)/(T₂ − a_j)`; it should be one plus `(T₁ − T₂)/(T₂ − a_j)`; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says each annular domain contributes a degree factor of rank `e` in the surjectivity diagram; it should be rank `d`, giving rank `de` in total; affects the proof.
- **Misprint** in Scholze at Lemma 6.5, p. 37: the source says the complements are taken in the projective line over `A`; it should be the projective line over `C`; affects nothing.
- **Misprint** in Scholze at Definition 6.2, p. 35: the source says a presheaf with transfer is an additive functor on the category of monoid-sheaf maps; it should be a functor on its opposite, a ring map `B → A` giving `Marc(A) → Marc(B)`; affects nothing.
- **Error** in Scholze at Theorem 11.1, p. 57: the source says the rational mapping spectrum is the weight-`j` Adams piece of `K(X)`; it should be that piece shifted by `[−2j]`, as its own Proposition 8.5 forces; affects a stated result.
- **Gap** in Scholze at the construction after Proposition 9.3, p. 52: the source says the six operations start from all affine maps of finite cohomological dimension; it should start from the maps of Theorem 9.2, the general projection formula coming only with Corollary 10.2; affects the proof.
- **Misprint** in Scholze at the construction before Definition 11.3, p. 58: the source says the map of the point to the pro-torus induces a map from `f_*ℤ` to `g_*ℤ`; it should be the pullback from `g_*ℤ` to `f_*ℤ`; affects nothing.
- **Error** in Scholze at Example 3.6, p. 16: the source says the bounded product of the residue fields of any Banach ring is totally disconnected; it should require nondiscrete residue fields, as Proposition 3.11 does (a trivially normed field is a counterexample); affects nothing.

Source independence: 41 passages compared with 5 sources (Scholze 30, Cisinski–Déglise 6, Bachmann 3, van der Put 1, Vakil 1), none shared beyond what the mathematics forces (longest common run 8 words, the definition of the free uniform ball algebra, Scholze line 1110); largest share Scholze, 102 of 120 locators; contents compared with Scholze: independent. The 13 layers stand against its 11 sections 2–12 in the same order but not one to one (`Layers 2–3 ↔ §5`, `Layer 5 ↔ §7 and the first page of §8`, `Layers 6–7 ↔ the rest of §8`, `Layers 10–11 ↔ §11`; §§0.8, 1.8, 2.7, 10.1, 10.2 and 10.4 have no section there), and the order is forced by the *Needs:* lines: each of Layers 1–6 needs its predecessor, 7 needs 6, 8 needs 5, 9 needs 8, 10 needs 7 and 9, 11 needs 10, 12 needs 4, 8 and 9. No table, figure or list is taken over. BLR's text was not read (uncertified).

## For the human reviewers

- **Scope.** 102 of the README's 120 source locators are to one article (Scholze, J. Amer. Math. Soc. 39 (2026)); the layers follow its section order, which the *Needs:* lines force (Source independence line above).
- **Scope.** `README.md` "Corrections to the source" asserts nine slips (E1–E9) in that refereed article; they were checked against arXiv v3 only, not the journal text.
- **Licence.** Vakil is read from a 2024 draft on the author's page (`sources.toml`, `licence_class = "author-page"`); the published book may number §20.2 differently.
- **Licence.** BLR is cited by locator only (`sources.toml`, `status = "uncertified"`); §4.3 says it is background and its proof route does not use it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6309723ccd937d2b3a283ac7f210832f492f15fe", "job": "RT-MotivesAndAlgebraicCyclesPartII~1a", "model": "fable", "worker": "chris-x55"} -->
