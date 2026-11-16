<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6913868563 -->
Red team round 2 pass b (claude) of 40fb799

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §6.2 uses a comparison of sheaf and singular cohomology that no layer or supplier provides

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:850` ("by §1.3, the realization is
   the rational cohomology of `GL_n(ℂ)/T(ℂ) ≃ U(n)/T`, which is concentrated in even degrees (Bruhat
   cells) … its Lefschetz number, which is its trace on cohomology, vanishes") and the *Needs* line
   `:858`; Layer 6 Dependencies `:874`.

   **Claim.** The inputs of §6.2 are §§0.8, 1.3, 2.6, 2.7, 5.3, 5.4, RepresentationTheory (LieGroups)
   Layer 8, CharacteristicClasses §C5 and MorseNovikov §6.5.

   **Witness.** §1.3 gives sheaf cohomology of `M(A)`. MorseNovikov §6.5 (`README.md:1287`) is a trace
   on singular `H_i(M; ℚ)`; CharacteristicClasses §C5 computes a singular Euler characteristic. No cited
   item compares the two, nor gives `GL_n(ℂ)/T(ℂ) ≃ U(n)/T` on sheaf cohomology.

   **Repair.** The owners are on main and earlier in the merge order. In the Route of §6.2 replace
   "There, by §1.3, the realization is the rational cohomology of `GL_n(ℂ)/T(ℂ) ≃ U(n)/T`, which is" by:

   > There, by §1.3 applied to the compact pieces of `GL_n(ℂ)/T(ℂ)`, the realization is the sheaf cohomology of the constant sheaf `ℚ` on the manifold `GL_n(ℂ)/T(ℂ)`. This is its singular cohomology, compatibly with the homeomorphisms induced by `Σ_n` (CharacteristicClasses §C1.2b, `cechSingularCWTypeComparison`, for paracompact Hausdorff spaces of CW type, with ComplexComparisonPartII §C5.1 for the identification of sheaf cohomology with singular cochains on semilocally contractible spaces). The inclusion `U(n)/T → GL_n(ℂ)/T(ℂ)` commutes with the permutation matrices, which are unitary, and is a homotopy equivalence: its composite with the projection `GL_n(ℂ)/T(ℂ) → GL_n(ℂ)/B(ℂ)`, a bundle whose fibre `B(ℂ)/T(ℂ)` is the affine space of unipotent upper triangular matrices, is the diffeomorphism `K/T ≅ 𝐆(ℂ)/𝐁(ℂ)` of RepresentationTheory (LieGroups) Layer 8. So it induces a `Σ_n`-equivariant isomorphism on singular cohomology. The singular cohomology of `U(n)/T` is

   Add to the *Needs* of §6.2, to the Layer 6 Dependencies and to the supplier contracts ("further
   roadmaps"): "CharacteristicClasses §C1.2b (`cechSingularCWTypeComparison`: the natural all-degree
   Čech/singular comparison for constant coefficients on paracompact Hausdorff spaces of CW type) and
   ComplexComparisonPartII §C5.1 (sheaf cohomology of a constant sheaf through small singular cochains),
   for the passage from §1.3 to singular cohomology in §6.2". Tested on the instance: for `n = 2`,
   `GL₂(ℂ)/B(ℂ) = ℙ¹(ℂ) ≅ U(2)/T ≅ S²`, the fibre `B/T` is `ℂ`, and the transposition acts by `−1` on
   singular `H²`, the value the second Check of §6.2 uses.

2. **F02** (P2) two proof plans follow the source's proof clause by clause

   **Location.** `README.md:754`, Route of §4.9 ("passing up the perfectoid tower gives a sequential
   colimit of split injections, which is split, so perfectoid-ball invariance implies ball invariance");
   `README.md:896`, Route of §7.1 ("has middle term `K(ℤ)` after passing to the cofibre of
   `K(A_{<1})`, and its left term is unchanged under `T`-adic completion").

   **Claim.** The routes are in the roadmap's own words.

   **Witness.** Scholze lines 1677–1682: same four clauses in the same order; runs "a sequential colimit
   of split injections" (6 words), "passing up the perfectoid tower" (5). Scholze lines 1978–1983:
   "passing to the cofib[er] of `K(A<1)`" (6 tokens), "`K`, `O_K` and `k` are" (5), same order.

   **Repair.** Replace the Route of §4.9 by:

   > Route: tilting of perfectoid rings identifies the perfectoid bases of the arc-sites over `X` and over `X♭` (§0.5), so `Dfin(X, ℤ) ≃ Dfin(X♭, ℤ)` and the two effective subcategories differ only in the ball that is tested: the ball over `X♭` corresponds to the perfectoid ball `A⟨T^{1/p^∞}⟩₁` over `X`. That ring is the completed filtered colimit of the balls `A⟨T^{1/p^m}⟩₁`, so finitarity turns ordinary ball invariance into invariance under it. For the reverse implication let `f` be the `p`-th power map of the ball. Summing over the fibres of `f` with multiplicity is a trace `f_* ℤ → ℤ` whose composite with the unit `ℤ → f_* ℤ` is `p`; as `p` is invertible (§4.8), `ℤ[1/p]` is a direct summand of `f_* ℤ[1/p]`. The same holds at every level of the tower of `p`-power roots of `T`, compatibly, so the value of a sheaf on the ordinary ball is a direct summand of its value on the perfectoid ball, and invariance under the second gives invariance under the first.

   In the Route of §7.1 replace the two sentences from "For completion invariance" to "vanishing
   negative K-theory." by:

   > For completion invariance, `A` is the localization of `B = ℤ ⊕ A_{<1}` at `T`, which gives the localization sequence `K(B on T) → K(B) → K(A)` (SchemeKTheoryOperations §3.3). Dividing its last two terms by `K(A_{<1}) = fib(K(B) → K(ℤ))` exhibits `E_K(A)` as the cofibre of a map `K(B on T) → K(ℤ)`: the target does not involve `A`, and the source depends only on the `T`-adic completion of `B` (SchemeKTheoryOperations §3.8). So completing `A` does not change `E_K`. For the agreement of `E_K` and `E_Kcn` on totally disconnected rings, finitarity reduces to a Banach field; that field, its valuation ring and its residue field are three valuation rings, whose negative K-groups vanish (gap:valuation-ring-k-regularity).

   Tested: `cofib(K(A_{<1}) → K(A)) = K(A) ⊔_{K(B)} K(ℤ) = cofib(K(B on T) → K(ℤ))`; and for the trace,
   a map `b` that is split injective and has `b ∘ a` an equivalence is an equivalence, hence so is `a`.

3. **F03** (P3) the new Conventions definitions have no discriminating Check

   **Location.** `README.md:28`: "For `A = C × C′` … the localizations `A⟨(1 − e)/e⟩` and `A⟨e/(1 − e)⟩`
   are the factors … for the unit family `f = g = 1` the localization is `A^u`."

   **Claim.** Rational localization, analytic cover and sheaf for the analytic topology each have three
   discriminating Checks.

   **Witness.** Two instances, both clopen: the same values result if "rational localization" is replaced
   by "clopen factor" (the notion of §0.6, `A → A_U`). No instance has a connected spectrum or
   `A₁₂ ≠ 0`. §7.4, third Check, repeats the first instance.

   **Repair.** Add to §7.4, Checks (the first section that uses the definition):

   > - A cover that is not clopen. Let `C` be a nonarchimedean geometric point, `ϖ ∈ C` with `0 < |ϖ| < 1` and `A = C⟨T⟩₁`. As `ϖ` is a unit, `(T, ϖ)` is the unit ideal; `A₁ = A⟨T/ϖ⟩` is the disc `{|T| ≤ |ϖ|}`, `A₂ = A⟨ϖ/T⟩` the annulus `{|ϖ| ≤ |T| ≤ 1}` and `A₁₂` the circle `{|T| = |ϖ|}`. Their spectra cover the connected space `M(A)` and none is open, so this is an analytic cover that no clopen decomposition gives. For the sections of `Ḡ_m ⊗ ℚ = ℚ(1)[1] ⊗ ℚ`, the weight-one summand of `Kmot ⊗ ℚ` shifted (§6.3), write `G = Ḡ_m(C) ⊗ ℚ`: the values are `G` on `A` and on `A₁` (ball invariance) and `G ⊕ ℚ` on `A₂` and on `A₁₂`, the summand `ℚ` being the class of `T` (§§3.5, 5.3). The difference map `G ⊕ (G ⊕ ℚ) → G ⊕ ℚ` of the two-member condition has kernel `G`, the value on `A`, and is onto, in agreement with the vanishing of `H¹` on the disc (§3.3).
   > - The unit ideal is needed. For `f = T`, `g = 0` on `A = C⟨T⟩₁` the locus `{|T| ≤ 0}` is the point `T = 0`, but `g T₁ = f` becomes `T = 0` with `T₁` free, whose spectrum is a closed disc and not that point.
   > - A family that does not cover is no analytic cover: `A⟨T/ϖ⟩` alone misses the Gauss point of `C⟨T⟩₁`, where `|T| = 1 > |ϖ|`.

   Tested: units of `C⟨T, ϖ/T⟩` and of `C⟨T/ϖ, ϖ/T⟩` are `c · T^m · (one-unit)`, units of the two discs
   are `c · (one-unit)`; kernel `{(u, (u, 0))} ≅ G`, cokernel `0`.

4. **F04** (P3) `sources.toml` omits two Scholze locators that the README cites

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/sources.toml`, source `Scholze`, `locator`:
   "… Remarks 1.4, 1.8, 2.8, 4.2, 4.11, 5.7, 7.2, 11.2; §2.3, §5.2 (arXiv v3 internal pagination)".

   **Claim.** The locator records every cited item.

   **Witness.** `README.md:240` cites "§3, pp. 14–15"; `:252` and `:490` cite "Scholze, §1, p. 4"; `:1027`
   cites "§1, p. 6". Neither §1 nor §3 is in the locator string. (Scholze lines 129–170 and 212–254
   carry the cited statements; §3 begins at line 602, page 14.)

   **Repair.** End the locator with "§1 (pp. 4, 6), §2.3, §3 (pp. 14–15), §5.2 (arXiv v3 internal
   pagination)".

Round 2. All fifteen round-1 findings are repaired at this head and no repair introduced an error
(table below). Four new findings: one P1 (an uncited prerequisite of §6.2), one P2 (two proof plans
that track the source's wording), two P3. `Suggested.lean` declares nothing; no Lean was run.

## Round-1 findings at this head

Line numbers are those of `packages/MotivesAndAlgebraicCyclesPartII/README.md` at `40fb799`.

| Round-1 id | State | Witness at this head |
|---|---|---|
| a/F01 compound gaps | repaired | :79–83 and :95–99 carry six one-statement contracts; `design/plan.json` `gaps` has the same 12 slugs, suppliers and `needs` (read with `jq`); §§5.4, 6.1, 6.3, 7.4, 7.5 name the split slugs. |
| a/F02, b/F06 §9.6 Check | repaired | :1123 "`H^n([0,1]^ℕ, i_{n*} j_{n!} ℤ) = H^n_c((0,1)^n, ℤ) = ℤ ≠ 0`, so `d(Marc(A)) = ∞`"; recomputed, and `dim β(ℕ × D) = 2`. |
| a/F03 MorseNovikov section | repaired | :20, :121, :858, :874 cite "MorseNovikov §6.5 (`lefschetz_fixed_point_formula` …)"; `TauCetiRoadmap/MorseNovikov/README.md:1279–1287` and its `Suggested.lean:102` have that name with compact, boundaryless, nondegenerate hypotheses. |
| a/F04, b/F05 locators | repaired | :959 "Remark 1.8, p. 5" (Scholze line 198, page 5 begins at line 171); :212 "pp. 17–18" (Scholze line 708); `sources.toml` `cited_for` has "1.1-1.8" and the locator lists Remarks 1.4, 1.8. |
| a/F05, b/F02 analytic cover | repaired | :28 defines `A⟨f/g⟩`, analytic cover and sheaf for the analytic topology; :171, :214, :1513 say "arc-cover … by an analytic ring"; :226 is the `A → A_Z` bullet; :234 keeps `C → C′` as a negative Check. Recomputed below. |
| a/F06 quasi-pro-étale for stacks | repaired | :367 "if `f` is moreover *quasi-pro-étale*, meaning that for every geometric Banach point `Marc(C) → X` the fibre `Y ×_X Marc(C)` is `Marc(Cont(S, C))`"; Scholze line 1021; :1075 and :1115 cite "(§1.7)". |
| a/F07 TBA §0.27 | repaired | :26 "For nonzero `A` the equivalence is TropicalAndBerkovichArithmetic §0.27"; that roadmap's README line 776 at its open head states the equivalence. |
| a/F08 §2.1 Check | repaired | :428 "`Hom_{Dfin}(ℤ, ℤ/ℓ) = ℤ/ℓ ≠ 0`, although `ℤ/ℓ ⊗ ℚ = 0`"; `L_B(ℤ/p) = cofib(p) = 0`. |
| b/F01 uniform in §§7.4–7.5 | repaired | :916 "on uniform analytic nonarchimedean Banach rings `A`, for which `A_{<1}` is an ideal of `A_{≤1}`"; :929 Check `|2 + 2T| = 1` against `1/2`; :937 "uniform Banach `C`-algebra". Scholze line 1366. |
| b/F03 Kummer input | repaired | :460 "ProfiniteCohomology §9.6 (… Tau Ceti `TauCeti.kummerIso`)"; pin: `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:384`, `def kummerIso (hn : IsUnit (n : K))`. No "C6" left in the README. |
| b/F04 CD locator | repaired | :1203 "Cisinski–Déglise, Proposition 2.2.10, p. 27"; CD line 1258, on page 27, assumes a `ℚ`-algebra of coefficients. |
| b/F07 §4.6 Check | repaired | :709 "`c_{1/ℓ}^ℓ = 1 + c_1`, `c_{ℓ^m} = c_1^{ℓ^m}` … `c_{1/ℓ^{m+1}}^ℓ = c_{1/ℓ^m}`"; the formal solution `−Σ T^{ℓ^m}` has `c_1 = −1` and falls in the first case. |

New text introduced by the repairs, recomputed:

- Conventions, `A⟨f/g⟩`: at `x` with `|g|_x = 0` some `|f_i|_x ≠ 0`, so `0 · T_i = f_i` has no solution
  and `x` is outside `{|f_i| ≤ |g|}`; at `g(x) ≠ 0` the fibre is the single point `T_i = f_i/g`,
  present exactly when `|f_i/g|_x ≤ 1`. `A = C × C′`, `e = (1, 0)`: `{|1 − e| ≤ |e|}` is the point of
  `C`, `A₁₂ = 0`. Consistent with §7.4, third Check.
- §1.7, third Check: `ℂ ⊗̂_A ℂ` over `A = Cont([0,1], ℂ)` is `ℂ` at `t = 0` and `0` elsewhere, so `S` is
  a point or empty.
- §7.4: `ℚ₂⟨T⟩` with the Gauss norm is uniform, `A_{<1} = 2ℤ₂⟨T⟩`; the sum-norm ring is excluded.

## Verified sound

**Counts.** Declarations read: 0 (`Suggested.lean` is `import Mathlib`, one module docstring and an
empty namespace). README lines read: all 1524. Numbered targets read: 83. Source statements compared
with the README's statement and hypotheses this round: 47 of Scholze (Theorems 3.14, 4.20, 5.14,
6.1, 6.3, 6.7, 8.9, 8.11, 8.13, 9.2, 11.1, 11.9; Propositions 4.15, 4.16, 5.13, 5.19, 6.8, 8.7, 8.8,
9.4, 9.5, 9.7, 10.1, 10.3, 10.9, 10.10, 11.5–11.8, 12.1, 12.3, 12.4; Definitions 4.17, 4.19, 5.2,
6.2; Lemmas 5.3, 6.4, 6.5, 10.4; Corollaries 4.18, 6.6, 6.9, 8.10, 8.12, 9.6, 10.2, 10.6, 11.10,
12.2; Remarks 1.8, 11.2; §5.2), 2 of van der Put (Theorem 1.1, Corollary 1.3), 1 of
Cisinski–Déglise (Proposition 2.2.10). Check bullets read: all; recomputed with values: the rows of
the table below. Sibling citations checked for content this round: 17 roadmaps, 62 section ids
(TropicalAndBerkovichArithmetic §§0.13, 0.16, 0.19, 0.22, 0.26, 0.27, 0.30, 2.16, 3.7; MorseNovikov
§6.5; ProfiniteCohomology §§9.6, 10.2; SchemeKTheoryOperations §§2.6, 2.7, 3.1, 3.3–3.5, 3.8, 5.2,
6.4, 6.8, 6.11; KTheoryFiniteLocalFields §§1.5, 1.6, 2.1, 6.5; EnhancedDerivedSheaves §§E2.4, E2.7,
E5:presentability.4, E5:descent, E5:spectra-comparison, E5:animation; RefinedTraceMethods §§4.10,
4.20; GeneralAlgebraicKTheory §§3.2, 4.3, 8.3, 8.10, 10.10, 13.4, 13.5, 13.8; GeneralAlgebraicKTheoryPartII
§1.2; DiamondEtaleCohomology §§C0.19, C0.24, C2.2, C2.12, C4.5, C4.13, C4.14, C9.8;
DiamondSixOperations §§S2.4, S4.2, S4.3; MotivesAndAlgebraicCycles §§4.1–4.6, 4.9, 4.11, 4.15–4.18;
AdicCoefficientsAndComparisons Layer L5; AnabelianGeometryAndNonabelianChabauty, the named target;
CharacteristicClasses §C5; RepresentationTheory (LieGroups) Layer 8; AnalyticStacks, the assignment
of §11.6). Pinned declarations checked in the cited files: 20 Tau Ceti names and 13 Mathlib files,
all present.

**`Suggested.lean`.** No `set_option`, `lemma`, `#eval`, sorry'd data or second import. The docstring
names the nine headline theorems of the Summary, each with the missing carrier. The pins have no
Berkovich spectrum (the word occurs in Tau Ceti only in files on `Spa` and Weierstrass theory), no
K-theory spectrum and no ∞-categorical sheaf category, so none is statable and nothing is padding.
There is no declaration for a `#check @name` audit.

**Dependency check** (run on this head):

```text
depcheck: 259 roadmaps, 2478 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 381 of the merge order; the suppliers that
are still open pull requests are earlier (KTheoryFiniteLocalFields 91, MotivesAndAlgebraicCycles 92,
DiamondEtaleCohomology 76, MotivicEtaleKTheory 138, TropicalAndBerkovichArithmetic 235,
RefinedTraceMethods 330, AnalyticStacks 332, GeneralAlgebraicKTheoryPartII 335).

**Declared gaps.** The 12 slugs of the brief are the 12 of `design/plan.json` and of the README, with
the same suppliers, sections and `needs`. None has supplier `none`; each `needs` is one statement.
Searched main and the open heads for homotopy K-theory, cdh descent, `K`-regularity of valuation
rings and Breen–Deligne resolutions: SchemeKTheoryOperations mentions `KH` only to exclude it
(its README line 700); VStackSheavesAndLisseCategories plans the finite-power resolution of
condensed abelian groups, not the resolution of a group-completed sheaf of animated monoids. No gap
asks for what is provided. `gap:kh-simplicial-model` shares its slug with
GeneralAlgebraicKTheoryPartII (its README line 254), which asks the same supplier section for the
ring case only.

**Ownership.** Searched (`roadmaps grep`, main and 453 open heads) for the arc-topology on Banach
rings, Berkovich motives, étale motives `DM_et`, and this roadmap's name: no second owner; the only
roadmap naming this one is AnalyticStacks (its README line 1302), as a consumer.

**Policy.** `git diff --stat origin/main...HEAD` changes only the package folder. No pull-request
number or process wording in the README or the docstring; "lemma" occurs only in source locators.
Every numbered target has a locator.

**Adversarial table** (statement; instance; values; result).

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Conventions, `|1|` in a nonzero ring | `|−1| ≤ 1`, `|1| ≤ |1|²` | `|1| ∈ {0, 1}`; `0` only for the zero ring | `|T| = 1/2` in §0.3 holds |
| Conventions, `|ℓ| ≥ 1` criterion | archimedean; trivially normed `𝔽_ℓ` | `ℓ^α ≥ 1`; `|ℓ| = 0`, `ℓ = 0` in the residue field | holds |
| Conventions, `A⟨f/g⟩` | `g(x) = 0`; `C × C′` | no point; factors, `A₁₂ = 0` | holds |
| Conventions, clopen-only instances | `C⟨T⟩₁`, `f = T`, `g = ϖ` | connected, kernel `G`, cokernel `0` | no such Check: S03 |
| §0.2 lifting criterion | `x` with discrete `K(x)` | lift through `K(x)((T))_{1/2}`; `K(y) ⊗̂_{K(x)} C ≠ 0` | holds both ways |
| §0.3 Checks | `1 + 2T` over `ℂ`; `u = 1/3` | sup `1`, `2`; sum `2`, `4`; `3ⁿ > 2ⁿ` | holds |
| §0.8 Check 2 | trivially normed `k`, `ρ < 1` | `k[[T]]`, norm `ρ^{ord}`; value at `C` is `C` | holds |
| §1.7 Check 3 | `{0} ⊂ [0,1]` | fibre a point or empty | holds |
| §2.1 bound | `ℂ`; nonarchimedean `C` | `2 + 0`; `1 + 2` (Tsen, strict dimension) | `≤ 3`, as Scholze line 1115 |
| §2.7(c) | `D^N_C`, `N + 1` closed pieces | `3N + N` | `≤ 4N` holds |
| §2.7 Check 3 | skyscrapers at `1/n` | stalk of the product `∏ℤ/⊕ℤ`; product of stalks `0` | not corepresentable, holds |
| §3.3 Route | `ℓ`-th power on `Ḡ_m(C)` | onto; kernel `μ_ℓ` (`ℓ ≠ p`), trivial (`ℓ = p`, as `x̄^p = 1 ⇒ x̄ = 1`) | holds |
| §3.5 criterion | `T² + T/2 + 4`, `ℂ₂`; `n = 1` | norms `1/8`, `2`; bound `min(4, 1) = 1 < 2`; `a₀ ∈ T(r₁, r₂)` | holds |
| §4.4 Check | disc, annulus | `d = 0`: `ℚ`; `d = 1`: `ℚ ⊕ Ḡ_m ⊗ ℚ` | agrees with §§3.4–3.5 |
| §4.8 Check 6 | `‖x‖ = 2^{−⌊v₂/2⌋}` | `‖2‖ = 1`, `‖4‖ = 1/2`, radius `2^{−1/2}`; points `c^{v₂}`, `0 ≤ c ≤ 2^{−1/2}` | holds |
| §4.9 Route | `b` split mono, `b ∘ a` iso | `b` iso, so `a` iso | holds; wording: S02 |
| §6.1 Check 1 | `π₀ E_K(C)` | `K₀(C_{<1}) = K₋₁(C_{<1}) = 0`, `π₀ = ℤ` | holds |
| §6.2 | `n = 2` | `U(2)/T ≅ S²`, transposition `−1` on `H²` | holds; inputs: S01 |
| §6.2 triangularity | `Hom(ℚ(m)[2m], ℚ)`, `m ≥ 1` | source `m`-connective, target in degree `0` | `0` holds |
| §6.3 Examples | eigenvalues `1, 2, 4` | `(−1)(−3)/3`, `−(1)(−2)/2`, `(3)(2)/6` all `1` | holds |
| §7.1 colimit | `T^{1/n_i}·(T^{1/n_{i+1}})⁻¹` | `∪ T^{1/n_i} B = A_{<1}` since `|a T^{−1/n}| ≤ |a| |T⁻¹|^{1/n} → |a|` | holds |
| §7.1 Check 2 | `K(O_C) → K(C) ⊕ K(k)` | pushout `K(C) ⊔_{K(O_C)} K(k)` | holds |
| §7.4 Check 1 | `ℚ_p` | `π₀ = π₋₁ = 0` of the fibre; fibre variant `ℤ × 𝔽_p^×` | holds |
| §7.6 scope | `S = {p}`, `C` of residue characteristic `p` | `|ℓ| = 1` for `ℓ ≠ p` | hypothesis met |
| §8.2 Examples | `ℂ` | `(ℤ ⊕ ℤ[−2])[2] = ℤ[2] ⊕ ℤ` | holds |
| §8.5 closed disc | `f_* ℤ = ℤ` | `ℤ(1)[2] ⊗ ℚ = (Ḡ_m ⊗ ℚ)[1] ≠ ℚ` | holds |
| §9.5 Check 3 | `E × E` over `𝔽̄_p` | `n_{0,0} = n_{1,2} = 1`; matrix determinant `2`; `3 > 2` | holds |
| §9.6 Check 2 | `[0,1]`, `j_! ℤ` | `RΓ_c((0,1], ℤ) = 0` | holds |
| §10.2 Checks | `𝔽̄₃`, `n = 2, 3` | `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; no polynomial of degree `1/3` | holds |
| §10.4 Check 1 | `ℙ¹`, `j = 1` | `π₋₂ = ℚ`, `π₀ = H⁰(ℙ¹, ℚ(1)) = 0` | holds |
| §10.5 Check 3 | `Spec k` | weight-one `π₁ = (k^× ⊗ ℚ) ⊕ ℚ = Ḡ_m(C) ⊗ ℚ` | holds |
| §11.2 | pro-torus over `𝔽̄_p` | colimit of multiplication by `n` prime to `p`, with `p` inverted: `ℚ(−1)[−1]` | holds |
| §11.3 Check 4 | `H = ℚ[t^±] ×_ℚ ℤ[1/p]` | `H ⊗ 𝔽_ℓ = 𝔽_ℓ`; augmentation ideal `≅ ℚ[t^±]` | holds |
| §11.6 band ring | `x_n = t/n` | `(t/n)(t/m) = t²/(nm)`: ring `R ⊕ tℚ[t]`; degree `d` term `N^d/d!` | holds |
| §12.1 Check 4 | `C⟨T^{1/p^∞}⟩`; inner type-2 point | residue image `𝔽̄_p[T^{1/p^∞}] → 𝔽̄_p`; already `𝔽̄_p` | one point added, holds |
| §12.3 | `n` prime to `p` | `Ḡ_m[−1] ⊗^L ℤ/n = μ_n` | holds |

## Not verifiable

- BLR §9.2 (Proposition 3, Example 8, Proposition 10): settled as uncertified, cited by locator only;
  the Route of §4.3 does not use it.
- Bachmann's statements (Lemma 3.10, Corollaries 4.3, 4.4, 6.2, Theorems 5.1, 6.5, 6.6, 7.1) and
  Vakil §20.2: not re-read this round; round 1 verified them and the text did not change.
- The journal pagination of Scholze: locators are to arXiv v3, as `sources.toml` records.
- The proofs behind the supplier sections: statements and hypotheses were read, not proofs.
- The correctness of Scholze's Theorems 7.1, 8.9–8.13, 10.1 and 11.9 beyond the instances above.
- §7.6, Route: its rational case names §7.3 for `|p| < 1` and §7.4 for equal characteristic zero; a
  strict ring whose residue characteristic varies over the spectrum is covered by §7.4 as stated
  (dimension `0`), which I checked on the statement only.

## Copyright, licences and scope

**Wording.** Beside the 50 statements above, nine passages of prose were set beside the source:
§1.5 API against Scholze line 1004; §4.8 Route against lines 1661–1668; §4.9 Route against lines
1677–1682; §7.1 Route against lines 1976–1984; §7.2 Route against lines 1965–1968; §8.5 Route
(`j_!`) against lines 2188–2192; §9.3 Route against lines 2320–2325; §11.3 Route against Scholze
lines 2489–2500; the `Suggested.lean` docstring (cancellation) against line 224. Two follow the
source clause by clause (S02); the others share only formulas and standard names.

**Arrangement.** Scholze has the largest share: 106 of 128 locators. Its sections are 2 (Banach
rings), 3 (arc-topology), 4 (finitary sheaves), 5 (effective motives), 6 (free motivic sheaves),
7 (cancellation), 8 (K-theory), 9–11 (`Dmot` of `X`, `C`, `k`), 12 (v-stacks). Pairs by number:
Layer 0 ↔ §3 with parts of §§2, 4 and own §0.8; Layer 1 ↔ §4; Layers 2, 3 ↔ §5; Layer 4 ↔ §6;
Layer 5 ↔ §7 with Corollaries 8.1–8.2; Layers 6, 7 ↔ §8; Layer 8 ↔ §9; Layer 9 ↔ §10; Layers 10,
11 ↔ §11, Layer 10 resting on Cisinski–Déglise and Bachmann; Layer 12 ↔ §12. Thirteen layers on
ten sections: not one to one. The order is forced by the *Needs* lines: Layer `k` needs Layer
`k − 1` for `k ≤ 6` (§§1.1, 2.1, 3.3, 4.4, 5.3, 6.2), §7.2 needs §6.1, §8.1 needs §5.3, §9.1 needs
§8.5, §10.3 needs §9.1 and §10.5 needs §7.5, §11.1 needs §10.5, §12.3 needs §9.4. No finding;
reported to the human reviewers.

**Reuse.** No table, figure or list is taken over from a source. `Suggested.lean` has no declaration.

Source independence: 59 passages compared with 3 sources, 2 shared (S02); largest share Scholze, 106 of 128 locators; contents compared with Scholze: not one to one (13 layers on 10 sections, order forced by the dependency lines).

## Source issues

- **Misprint** in Scholze at Lemma 6.5, p. 37: the source says the complements of the two open subsets are taken in the projective line over `A`; it should be the projective line over `C`; affects nothing.
- **Misprint** in Scholze at Definition 6.2, p. 35: the source says a presheaf with transfer is an additive functor on the category of monoid-sheaf maps; it should be a functor on its opposite; affects nothing.
- **Error** in Scholze at Theorem 11.1, p. 57: the source says the rational mapping object is the weight-`j` Adams piece of `K(X)`; it should be that piece shifted by `[−2j]`; affects a stated result.
- **Gap** in Scholze at Lemma 6.4, pp. 36–37: the source says every smooth connected curve can be shrunk and compactified; it should assume the curve separated; affects the proof.
- **Gap** in Scholze at Theorem 8.13, p. 49: the source says the functor is defined on all analytic nonarchimedean Banach rings; it should restrict to uniform ones, where the elements of norm below one form an ideal; affects a stated result.
- **Gap** in Scholze at Theorem 8.13, last clause, p. 49: the source says the formula with `K` in place of `KH` holds for every totally disconnected ring; it should also assume the roots under which the nonunital K-theory is well defined; affects a stated result.

## For the human reviewers

- **Scope.** 106 of the README's 128 source locators are to one article (`Scholze`, J. Amer. Math. Soc. 39 (2026)); Layers 0–9, 11 and 12 state its results, Layer 10 those of `CD` and `Bachmann`.
- **Scope.** The 13 layers run in the order of Scholze's sections 3–12 (pairs under "Arrangement"); six layers have the scope of one section, seven do not; the *Needs* lines force the order.
- **Scope.** `README.md` "Corrections to the source" asserts nine slips (E1–E9) in that refereed article; they were checked against arXiv v3, not the journal text.
- **Licence.** `Vakil` is read from the author-page draft of 21 February 2024 (`sources.toml`, `licence_class = "author-page"`); three locators in §9.5.
- **Not tested.** `BLR` (`sources.toml`, `uncertified`) could not be read; its three locators in §4.3 are background only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "40fb7992ab3a36f6dc87ae633b64b20df562e737", "job": "RT-MotivesAndAlgebraicCyclesPartII~2b", "model": "fable", "worker": "chris-x26"} -->
