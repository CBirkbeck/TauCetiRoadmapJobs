<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6913750015 -->
Red team round 2 pass a (claude) of 40fb799

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §4.4: the test sections of the surjectivity step all have degree vector `(1, …, 1)`

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:684`: "so all roots of `P_t` lie in
   `U`, and the resulting boundary-degree vectors span all rational slopes."

   **Claim.** The sections `t ↦ {roots of P_t}`, `P_t(T) = ∏_i (T − a_i)^{k_i} − t`, of `ℕ[U](V)` have
   degree coordinates spanning `ℚ^d` as the `k_i` vary.

   **Witness.** For every `i` and all `k`, the product of `T_r − a_i` over the roots is
   `(−1)^n P_t(a_i) = (−1)^{n+1} t`: slope 1. For `d = 2`, `a = (0, 1)`, `k = (1, 1)`:
   `T₊T₋ = −t = (T₊ − 1)(T₋ − 1)`. Every vector is `(1, …, 1)`. The step is Scholze lines 1626–1627.

   **Repair.** The target (Lemma 6.5) stands; the route changes. In §4.4 replace the sentence "For
   surjectivity use the polynomials … span all rational slopes." by:

   > For surjectivity onto the degree coordinates, take `V = T(s₁, s₂)` with coordinate `t` and define the *degree vector* of a section of `ℕ[U](V)` as the vector of slopes on `V` (TropicalAndBerkovichArithmetic §1.6) of the `d` units `∏_r (T_r − a_i)`, the product running over the values `T_r` of the multivalued map. For each `i` take `Q_{i,t}(T) = (T − a_i)^m − ct`, with `c ∈ C`, `0 < |c| < 1/s₂`, and `m ≥ 1` so large that `(|c| s₁)^{1/m} > r₁`. Every root has `|T − a_i| = |ct|^{1/m} ∈ (r₁, 1)`, hence `|T − a_j| = 1` for `j ≠ i` and `|T| ≤ 1 < r₂`, so the roots lie in `U`. The product of `T_r − a_i` over the roots is `(−1)^{m+1} ct`, of slope `1`; for `j ≠ i` the product of `T_r − a_j` is `(−1)^m ((a_j − a_i)^m − ct)`, a constant of norm one times a one-unit, of slope `0`. So `Q_{i,t}` has degree vector the `i`-th basis vector, and these span `ℚ^d`. The polynomials `∏_i (T − a_i)^{k_i} − t` do not serve: the product of `T_r − a_i` over their roots is `(−1)^{n+1} t` for every `i`, so each has degree vector `(1, …, 1)`.

   Add to "Corrections to the source":

   > **E10 (proof of Lemma 6.5, p. 38, degrees of the test sections).** The section `t ↦ ∏_i (T − a_i)^{k_i} − t` is said to have degree vector `(k₁, …, k_d)`. The product of `T_r − a_i` over its roots is `(−1)^{n+1} t` for every `i`, so the vector is `(1, …, 1)` whatever the `k_i`, and for `d ≥ 2` these sections do not span `ℚ^d`. Corrected: the sections `(T − a_i)^m − ct` of §4.4 have the basis vectors as degree vectors. Witness: `d = 2`, `a = (0, 1)`, `k = (1, 1)`, where `T₊T₋ = −t = (T₊ − 1)(T₋ − 1)`. Used in §4.4.

   and change the last sentence of E1 to "Recorded for the root containment; §4.4 uses the sections of
   E10." Tested on the refuting instance: for `a = (0, 1)`, `Q_{1,t} = T^m − ct` gives products
   `(−1)^{m+1} ct` and `(−1)^m (1 − ct)`, vector `(1, 0)`; `Q_{2,t} = (T − 1)^m − ct` gives `(0, 1)`.

2. **F02** (P3) §7.4: the maps `ℤ ⊕ A_{<1} → B` are called inclusions

   **Location.** `README.md:921`: "by excision for `KH` (gap:kh-excision), applied to the inclusions
   `ℤ ⊕ A_{<1} → B`".

   **Claim.** The map from the unitization `ℤ ⊕ A_{<1}` to `B`, `(n, a) ↦ n + a`, is injective.

   **Witness.** `A = ℚ_p`, `B = A_{≤1} = ℤ_p`, `A_{<1} = pℤ_p`: `(p, −p) ↦ 0`. The contract of
   `gap:kh-excision` (line 97) asks only for a ring map carrying the ideal isomorphically onto an ideal.

   **Repair.** Replace "applied to the inclusions `ℤ ⊕ A_{<1} → B`" by "applied to the ring maps
   `ℤ ⊕ A_{<1} → B`, `(n, a) ↦ n + a`, which carry `A_{<1}` isomorphically onto the ideal `A_{<1}` of `B`
   and need not be injective (for `A = ℚ_p` and `B = ℤ_p`, `(p, −p) ↦ 0`)". Tested: for `ℚ_p` the map
   restricts to the identity of `pℤ_p`, which is all the contract uses.

3. **F03** (P3) terms used in proof routes that are neither standard nor defined

   **Location, witness and repair**, one line each (the README defines none of these terms; a search of the
   file finds each only at the place quoted):

   - `README.md:786` and `:816`, "the Tate unit", "Tate interchange". After the first sentence of §5.2 add:
     "Here the *Tate unit* is the map `π_i ℚmot[U] → π_i Hom(ℚmot[(G_m, 1)], ℚmot[U × (G_m, 1)])` induced by
     `− ⊗ ℚmot[(G_m, 1)]`, and *Tate interchange* is the swap of the two factors of
     `ℚmot[(G_m, 1)] ⊗ ℚmot[(G_m, 1)] = ℚ(1)[1] ⊗ ℚ(1)[1]`, which acts by the Koszul sign `−1`, the swap on
     `ℚ(1) ⊗ ℚ(1)` being trivial (§5.1)." (Scholze lines 1727–1734 name neither.)
   - `README.md:684` and `:688`, "boundary-degree vectors", "boundary-degree lattice", "annular source",
     "product coordinates". S01 defines the degree vector. In line 684 replace "when the product
     coordinates agree up to one-units" by "when the products `∏_r (T_r − a_j)` of the two sections agree
     up to one-units for every `j`". In line 688 replace "gives a free rank-`d` boundary-degree lattice in
     each annular source, so `e` annuli contribute `ℚ^{de}`" by "gives `d` degrees for each annulus `V_i`
     (the slopes on `V_i` of the units `∏_r (T_r − a_j)`, `1 ≤ j ≤ d`), so `V = V₁ ∩ ⋯ ∩ V_e` contributes
     `ℚ^{de}`".
   - `README.md:1329`, "coconnectively faithfully flat". After the phrase add "(tensoring with it preserves
     coconnective modules and is conservative on them; Scholze, proof of Proposition 11.8, p. 60)". The
     source defines it at Scholze line 2535.
   - `README.md:1117`, "the strongly continuous filtered-colimit theorem". Replace by "EnhancedDerivedSheaves
     §E5:presentability.4 (`dualizable_filteredColimit`: a filtered colimit of dualizable categories along
     left adjoints whose right adjoints preserve colimits is dualizable)". That is the statement at
     `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1758` on main.
   - `README.md:1063`, "in the one-point quotient case". Replace by "when `|X|` is a point, so that
     `X = Marc(C)/G` for a profinite group `G` acting continuously on a geometric Banach point `C` (the
     case to which §9.6 reduces)". (Scholze line 2286.)

4. **F04** (P3) layer `Dependencies` lines and two `*Needs:*` lines omit inputs the text uses

   **Location and witness.** Each `### Dependencies` line was compared with the union of its layer's
   `*Needs:*` lines.

   - Layer 0 (`README.md:280`) omits `gap:replete-postnikov` (§0.7, line 244).
   - Layers 1 and 2 (lines 406, 529) omit `gap:compact-hausdorff-dimension` (§1.5 line 355, §2.1 line 430).
     Layers 3–7 do name their gaps.
   - Layer 3 (line 622) omits Mathlib `NormedField`, `IsUltrametricDist` and Tau Ceti
     `Subring.unitClosedBall`, `TauCeti.mem_unitBallIdeal` (§3.1, line 552).
   - Layer 4 (line 770) omits EnhancedDerivedSheaves §E5:animation.1 (§4.1, line 644); the line names no
     section of that roadmap.
   - Layer 7 (line 977) omits EnhancedDerivedSheaves §E2.4, PerfectoidSpaces §P2.13 and
     TropicalAndBerkovichArithmetic §0.16 (§§7.3–7.4, lines 912, 933).
   - §6.2 `*Needs:*` (line 858) omits §2.3: the route's vanishing of `Hom(ℚ(i−j)[2(i−j)], ℚ)` for `i > j`
     ("`(i−j)`-connective … while `ℚ` sits in degree zero", line 850) is the rational homotopy
     t-structure of §2.3.
   - Scope, line 14: "Layers E1–E3 and E2" names E2 twice.

   **Repair.** Append to the seven lines, in order: "; gap replete-postnikov"; "; gap
   compact-hausdorff-dimension" (twice); "; Mathlib `NormedField`, `IsUltrametricDist`; Tau Ceti
   `Subring.unitClosedBall`, `TauCeti.mem_unitBallIdeal`"; "; EnhancedDerivedSheaves §E5:animation.1";
   "; EnhancedDerivedSheaves §E2.4; PerfectoidSpaces §P2.13; TropicalAndBerkovichArithmetic §0.16"; in
   §6.2 write "*Needs:* §§0.8, 1.3, 2.3 (the rational homotopy t-structure), 2.6, 2.7 …"; in line 14 write
   "Layers E1–E3". None of these adds a supplier roadmap, so the dependency check is unchanged.

One P2 (a false step in the proof route of §4.4, taken from inside the source's proof) and three P3
findings. All fifteen findings of round 1 are repaired at this head; one repair left a wording slip
(S02). `Suggested.lean` declares nothing, so there was no declaration for the `#check @name`
comparison and no Lean was run.

## Round 1 findings at this head

| Round 1 id | Status | Witness at 40fb799 (`packages/MotivesAndAlgebraicCyclesPartII/README.md`) |
|---|---|---|
| a/F01 compound gaps | repaired | lines 79–83: three contracts `gap:animated-group-completion`, `gap:breen-deligne-resolution`, `gap:augmentation-ideal-filtration`; lines 95–99: `gap:kh-simplicial-model`, `gap:kh-excision`, `gap:kh-cdh-descent`. The 12 README slugs equal the 12 `gaps` slugs of `design/plan.json`, each with supplier and section. |
| a/F02, b/F06 Hilbert cube | repaired | line 1123: "For `A = Cont([0,1]^ℕ, ℂ)` … `H^n([0,1]^ℕ, i_{n*} j_{n!} ℤ) = H^n_c((0,1)^n, ℤ) = ℤ ≠ 0`, so `d(Marc(A)) = ∞`"; negative control `Cont(β(ℕ × D), ℂ)`, dimension 2. |
| a/F03 MorseNovikov section | repaired | lines 20, 121, 858, 874: "MorseNovikov, §6.5 (`lefschetz_fixed_point_formula` …)". The declaration is at `TauCetiRoadmap/MorseNovikov/Suggested.lean:102` on main, with `[I.Boundaryless]`, `[CompactSpace M]`, `[T2Space M]` and nondegenerate fixed points, as the README says. |
| a/F04, b/F05 locators | repaired | line 959 "Remark 1.8, p. 5" (Scholze line 198, page 5 = lines 171–211); line 212 "pp. 17–18" (Scholze line 708, page 17); `sources.toml` `cited_for` has "1.1-1.8" and the locator lists Remarks 1.4 and 1.8. |
| a/F05, b/F02 analytic topology | repaired | line 28 defines `A⟨f/g⟩`, analytic cover and sheaf for the analytic topology; line 171 no longer says analytic covers are arc-covers by assertion; lines 171, 214, 1513 say "arc-cover … by an analytic ring"; line 226 is the `A → A_Z` bullet; line 234 is the `C → C′` Check. |
| a/F06 quasi-pro-étale for stacks | repaired | line 367: "*quasi-pro-étale*, meaning that for every geometric Banach point `Marc(C) → X` the fibre `Y ×_X Marc(C)` is `Marc(Cont(S, C))`"; Checks at lines 373–375; "(§1.7)" at lines 1075 and 1115. |
| a/F07 TropicalAndBerkovichArithmetic §0.27 | repaired | line 26: "For nonzero `A` the equivalence is TropicalAndBerkovichArithmetic §0.27 …; the zero ring satisfies both conditions". §0.27 at that roadmap's open head (README line 774) states the equivalence for nonzero separated complete rings. |
| a/F08 §2.1 third Check | repaired | line 428: `Hom(L_B ℤ, ℤ/ℓ) = Hom_{Dfin}(ℤ, ℤ/ℓ) = ℤ/ℓ ≠ 0`, `ℤ/ℓ ⊗ ℚ = 0`, `L_B(ℤ/p) = 0`. |
| b/F01 uniformity in §§7.4–7.5 | repaired | line 916 "on uniform analytic nonarchimedean Banach rings `A`, for which `A_{<1}` is an ideal of `A_{≤1}`"; line 929 the sum-norm `ℚ₂[T]` Check; line 937 "`A` is a uniform Banach `C`-algebra". A new slip in the adjacent API bullet: S02. |
| b/F03 Kummer input of §2.4 | repaired | line 460 cites ProfiniteCohomology §9.6 and `TauCeti.kummerIso`; the pin has `def kummerIso (hn : IsUnit (n : K))` at `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:384`; DiamondEtaleCohomology §C6.1 is gone from lines 18, 117 and 529. |
| b/F04 CD locator | repaired | lines 1191 and 1203: "Cisinski–Déglise, Proposition 2.2.10, p. 27" (CD line 1258, page 27 = lines 1211–1260). |
| b/F07 Artin–Schreier Check | repaired | line 709: `c_{1/ℓ}^ℓ = 1 + c_1`, `c_{ℓ^m} = c_1^{ℓ^m}`, `c_{1/ℓ^{m+1}}^ℓ = c_{1/ℓ^m}`; recomputed: the coefficient of `T^α` in `x̄^ℓ − x̄` is `c_{α/ℓ}^ℓ − c_α`, giving these three relations at `α = 1`, `ℓ^m`, `1/ℓ^m`. |

## Verified sound

**Counts.** Declarations read: 0 (`Suggested.lean`, all 50 lines: `import Mathlib`, one module
docstring, an empty namespace). README lines read: all 1524; numbered targets read: 83; bold
definitions and Checks read: all. Locators verified against the cached texts this round: 21 (Scholze:
Remark 1.8 p. 5; Remarks 2.8, 4.2, 4.11, 5.7, 7.2 on pp. 9, 19, 22, 28, 40; Proposition 3.11 p. 17;
Theorem 4.20 p. 24; §5.2 p. 32; Lemma 6.5 and proof pp. 37–39; Theorem 7.1 proof pp. 41–43; the
discussion before Proposition 8.7 p. 46; Theorems 8.11 and 8.13 pp. 48–49; Proposition 10.3 and proof
pp. 54–55; the construction before Definition 11.3 p. 58; Proposition 11.8 p. 60; errata E1–E4 and E8
at Scholze lines 1601, 1621–1624, 1631, 1633, 2453; CD Proposition 2.2.10 p. 27). Checks recomputed
with values: the 46 rows of the table below. Sibling citations checked this round: 41 section ids and 3
declaration names in 9 roadmaps. Pinned Tau Ceti files of the contract confirmed present: 13, with `kummerIso` read.

**Dependency check** (run on this head):

    depcheck: 259 roadmaps, 2478 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` lists no unresolved cross-roadmap citation and no
unresolved Lean name. The package is at line 381 of the merge order; TropicalAndBerkovichArithmetic
(235), RefinedTraceMethods (330), AnalyticStacks (332) and GeneralAlgebraicKTheoryPartII (335) are
earlier, the other suppliers are on main or earlier.

**Siblings, at main or at the open heads.** TropicalAndBerkovichArithmetic §0.19 (rational domains
`{|f_i| ≤ r_i |g|}` with `(g, f_i)` generating the unit ideal, as the Conventions use with `r_i = 1`) and
§0.27; MorseNovikov §6.5; ProfiniteCohomology §9.6; EnhancedDerivedSheaves §§E0.4, E1.3, E2.4, E2.7,
E3.4, E5:presentability.4, Layers E5:abstract, E5:descent, E5:spectra-comparison, E5:animation (§§1–4);
SchemeKTheoryOperations §2.6 (negative vanishing), §2.7, §§3.1, 3.3, 3.4 (supported excision along
infinitely-near isomorphisms), §3.5, §3.8 (its general statement: an equivalence on the derived closed
fibre gives an equivalence of supported K-theory, which is what §§7.1, 7.5 and 10.5 use for `T`-adic
completions), §5.2 (`NK_n(X) = 0`), Layer 5, §§6.4, 6.8, 6.11; AnalyticStacks §§0.4–0.6, 0.9–0.10, 1.1,
1.5, and its Downstream consumers entry for this roadmap (README line 1302 at its head);
KTheoryFiniteLocalFields §§1.5 (perfect `𝔽_p`-algebras, `n ≥ 1`, `K₀` excluded), 1.6, 2.1, 6.5;
GeneralAlgebraicKTheoryPartII `gap:kh-simplicial-model` (README line 254 at its head).

**Gaps.** Twelve slugs, identical in `design/plan.json` and under "Exact supplier contracts", none with
supplier `none`. `roadmaps grep` for homotopy K-theory over main and the open heads finds no roadmap
that provides `KH`, its excision or cdh descent; GeneralAlgebraicKTheoryPartII asks the same supplier
section for `KH` of associative unital rings under the slug `kh-simplicial-model`, and this roadmap asks
under the same slug for qcqs schemes (the commutative ring case is common to both). Each `needs` was
tested for truth on an instance (table).

**Ownership.** No roadmap on main or at an open head states the arc-topology on Banach rings, `Dmot`,
`Kmot`, `DM_et(k, ℤ)`, rational localizations of general Banach rings or motivic nearby cycles;
`scratch/overlaps.md` lists no shared roadmap, dropped id or second copy. No roadmap names this one as a
supplier (AnalyticStacks names it as a consumer).

**`Suggested.lean`.** Headline theorems listed from the Summary: cancellation (§5.3); finitarity and
Adams decomposition of `Kmot` (§§6.1, 6.3); `Kmot` on strict rings (§7.6); torsion and tilting
comparisons (§§4.8, 4.9, 8.3); six operations and proper base change (§§8.5, 9.4); rigidity (§§9.1,
9.6); `DM_et(k, ℤ) ≃ Dmot(k)` (§10.6); monodromy equivalence (§11.8); overconvergent comparison (§12.3).
All nine are named in the module docstring with the missing carriers. At the pins, Tau Ceti mentions
the Berkovich disc only as the rank-at-most-one subspace of an adic spectrum
(`TauCeti/AlgebraicGeometry/AdicSpace/Spa/RankLeOne.lean`); there is no Berkovich spectrum of a Banach
ring, no K-theory spectrum and no ∞-category of sheaves, so none is statable. No padding, no
`set_option`, no `lemma`, one import.

**Policy.** `git diff --stat origin/main...HEAD` touches only the package folder. No pull-request
number or process wording in the README or the docstring; every target has a locator.

### Adversarial pass (values computed this round)

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions, `A⟨f/g⟩` spectrum | `g(x) = 0`; `C × C′`, `e = (1,0)` | all `f_i(x) = 0` contradicts `1 = Σ a_i f_i + bg`; `{|1−e| ≤ |e|}`: `0 ≤ 1` at `C`, `1 ≤ 0` fails at `C′` | sound |
| Conventions, `|ℓ| ≥ 1` criterion | trivially normed `k` of characteristic 0, of characteristic `ℓ`; `ℝ` with `|·|^α` | `1 ≥ 1`, `ℓ` invertible; `0 < 1`, not invertible; `ℓ^α > 1` | sound |
| §0.1 API, composites | `g ∘ f`, `f ∘ h` | lift of `Y′ → colim` restricted along `g`; lift precomposed with `h` | sound |
| §0.8 free ring `ℤ⟨T⟩_r` | `|1_B|` | `|1| = |(−1)²| ≤ 1`, so `|Σ a_ν b^ν| ≤ Σ |a_ν| r^{|ν|}` | sound |
| §0.8 Check, trivially normed `k`, `ρ < 1` | `k⟨T⟩_ρ` | `Σ_{a_n ≠ 0} ρⁿ < ∞` for every series: `k[[T]]`, spectral norm `ρ^{ord}` | sound |
| §1.7 definition | fold; `{0} ⊂ [0,1]`; `ℙ¹_C` | `S` two points; point or empty; connected infinite | sound |
| §1.8 Check 4 | `ℂ → C` contractive | `|1/2|^α = 2^{−α} > 1/2` for `α < 1` | sound |
| §2.1 bound | `ℂ`; nonarchimedean | `2 + 0`; `1 + scd ≤ 1 + 2` | `≤ 3` |
| §2.7(c) | `D^N_C`, `N + 1` pieces | `3N + N` | `≤ 4N` |
| §3.5 criterion, both directions | roots in annulus ⇒ bounds; bounds ⇒ roots | `|a_i| ≤` product of `n−i` largest root norms `< r₂^{n−i}`; `|a_i/a₀| < r₁^{−i}`; largest `max |a_i|^{1/(n−i)} < r₂`, smallest `min (|a₀|/|a_i|)^{1/i} > r₁` | sound |
| §3.5 example | `T² + T/2 + 4` over `ℂ₂` | valuations `(2, −1, 0)`, slopes `−3, 1`, norms `1/8, 2`; `min(4, 1) = 1 < 2` | sound |
| §4.4 surjectivity step | `P_t`, any `k`; `d = 2`, `a = (0,1)` | `∏(T_r − a_i) = (−1)^{n+1} t` for all `i`; vector `(1,1)` | fails: S01 |
| §4.4 repair | `(T − a_i)^m − ct` | slopes `1` at `i`, `0` at `j ≠ i`; roots at `|T − a_i| ∈ (r₁, 1)` | spans `ℚ^d` |
| §4.6 Check | `α = 1`, `ℓ^m`, `1/ℓ^m` | `c_{1/ℓ}^ℓ − c_1 = 1`; `c_{ℓ^{m−1}}^ℓ = c_{ℓ^m}`; `c_{1/ℓ^{m+1}}^ℓ = c_{1/ℓ^m}` | sound |
| §4.8 Check 6 | `‖x‖ = 2^{−⌊v/2⌋}` | points `c^v` need `c ≤ 2^{−⌊v/2⌋/v}`: `v = 1`: 1; `v = 2`: `2^{−1/2}`; `v = 3`: `2^{−1/3}`; infimum `2^{−1/2}` | sound |
| §4.8 third clause | `M` `p`-power torsion | `M = colim (M ⊗ ℤ/p^m)[−1]`; each a `ℤ/p^m`-module | sound |
| §6.1 Check 1 | `C` nonarchimedean | `K₀(O_C) ≅ K₀(k)`, `O_C^× → k^×` onto, so `π₀ = π₋₁ = 0` of `K(C_{<1})`; `π₀ E_K = ℤ` | sound |
| §6.2 | `w ≠ 1` on `U(n)/T`; `n = 2` | `gẇT = gT ⇔ ẇ ∈ T`: free; character `(n!, 0, …)`: regular; `+1` on `H⁰`, `−1` on `H²` | sound |
| §7.2 route | `g₀ + ta`, `|t| ≤ 1`, `|a| < 1` | `g₀(1 + t g₀⁻¹ a)`, Neumann series in `M_n(A_{<1})` | sound |
| §7.4 API 2 | `ℚ_p`, `ℤ ⊕ pℤ_p → ℤ_p` | `(p, −p) ↦ 0` | not an inclusion: S02 |
| §7.4 Check 1 | fibre versus cofibre at `ℚ_p` | `π₁K(pℤ_p) → 1 + pℤ_p` onto; fibre `π₀ = ℚ_p^×/(1 + pℤ_p)`; cofibre `π₀ = ℤ` | sound |
| §7.5 route, `K = KH` | regular noetherian `A` | `A[Δⁿ] ≅ A[T₁..T_n]`; faces are retractions of equivalences | simplicial object constant |
| §7.7 | `π₀` | `ℤ[1/p] ×_{ℚ_p} ℤ_p = ℤ` | sound |
| gap:kh-excision | `ℤ ⊕ I → B` | carries `I` isomorphically onto an ideal | true (Weibel excision) |
| gap:padic-k-integers-oc | equal characteristic `p` | both sides `ℤ_p` (`K₀ = ℤ`, higher groups uniquely `p`-divisible) | true |
| gap:compact-hausdorff-dimension | `[0,1]`; Hilbert cube | `d = 1`; hypothesis fails | consistent with §9.6 Checks |
| §8.1 Check 2 | `ℤ(−1)` | `M_n = ℤ(n−1)`, `M₀ = Hom(ℤ(1), ℤ)`; shift gives `(ℤ(n))_n` | sound |
| §8.5 closed disc | `f_* f^! ℤ` versus `(f_* ℤ)^∨` | `ℤ(1)[2]` versus `ℤ`; `(Ḡ_m ⊗ ℚ)[1] ≠ ℚ` | sound |
| §8.5 right cancellation | `f = pr ∘ graph` | graph is a base change of the diagonal of `g`; `pr` is the base change of `g ∘ f` | sound |
| §9.3 | `{0} → [0,1]` | `Mod_{i_* ℤ} = D(ℤ) = Dmot({0})` | sound |
| §9.5 Check 3 | `n_{i,m}` | `K_{m−2i}^{(1−i)}` and `K_{2i−m}^{(i)}`; `m = 2i`; `(1, 1)`; `dim End = 2 < 3` | sound |
| §9.6 Check 2 | `j_! ℤ` on `[0,1]` | `RΓ_c((0,1]) = 0`; dualizables are constant perfect complexes | sound |
| §10.2 Checks | `𝔽̄₃`, `n = 2`; `n = 3` | `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; degree `1/3` | sound |
| §10.3 | `f_* ℤ`, dual | `ℤ ⊕ ℤ(−1)[−1]`; `ℤ ⊕ ℤ(1)[1]` | sound |
| §10.5 normalisation | `π_i(K[−2j])` | `K_{i+2j}`; Check 3: weight one `π₁ = (k^× ⊗ ℚ) ⊕ ℚ = Ḡ_m(C) ⊗ ℚ` | sound |
| §10.5 route | total cofibre | `cofib(fib(K(X_{O_C}) → K(X)) → K(X_C)) = cofib(K(X_{O_C} on X) → K(X))` | sound |
| §11.1 | `g_* ℤ` for the pro-torus | `colim_n ℤ = ℤ_{(p)}`, with `ℤ[1/p]`-linearity `ℚ`; cofibre `ℚ(−1)[−1]`; `Ψ(ℤ) = f_*ℤ ⊗_{f_*ℤ} ℤ = ℤ` | sound |
| §11.3 Check 4 | `H = ℤ[1/p] ⊕ (t−1)ℚ[t^{±1}]` | `H ⊗ 𝔽_ℓ = 𝔽_ℓ`; `H ⊗ 𝔽_p = 0`; ideal `≅ H ⊗ ℚ` | sound |
| §11.5 route | `x_n = t/n` | ring contains `(t/n) t^{d−1}`: `R ⊕ tℚ[t]` | sound |
| §11.5 | `k^×`, `k = 𝔽̄_p` | `⊕_{ℓ ≠ p} ℚ_ℓ/ℤ_ℓ = ℚ/ℤ[1/p]` | sound |
| §12.1 Check 4 | type-2 point of radius `ρ < 1` | image of `R°` in the residue field is `𝔽̄_p` for both `R⁺`; only the Gauss point changes | one point added |
| §12.1 Check 5 | perfection of `𝔽_p(x)` | `𝔽_p` algebraically closed in it; `O_K ⊄ K⁺` | sound |
| §12.3 Check 3 | `n = 1` | `ℤ/1 = 0` | empty statement |
| S03, Tate interchange | swap on `ℚ(1)[1]^{⊗2}` | Koszul sign `−1`; `+1` on `ℚ(1)^{⊗2}` (§5.1) | repair text uses `−1` |
| §5.2 Examples | multiplicities | `N` discs at `N`-th roots of unity; `p₁^N = p₁` gives `N − 1`; difference `1` | sound (Scholze lines 1781–1784) |
| S04 | seven lines | missing items listed in S04 | bookkeeping |

## Not verifiable

- BLR §9.2: settled as uncertified; not read. §4.3's route does not use it.
- The injectivity half of §4.4 ("interpolate coefficients; the Newton-polygon inequalities keep roots
  in the domain") was not recomputed.
- Errata E5, E6, E7 and E9 were confirmed in round 1 and not re-read against the text this round.
- The journal pagination of Scholze and the printed pagination of Vakil: locators are to arXiv v3 and
  to the 2024 draft, as `sources.toml` records.
- The proofs behind supplier sections: statements and hypotheses were compared, not proofs.
- Pinned Mathlib names of the contract were confirmed in round 1 and not re-opened; `roadmaps resolve`
  on this host does not check names outside the roadmaps.

## Source issues

- **Error** in Scholze at proof of Lemma 6.5, p. 38: the source says the section given by the roots of the product of powers of `T − a_i` minus `t` has degree vector `(k₁, …, k_d)`; it should be `(1, …, 1)`, since each product of `T_r − a_i` over the roots is `± t`; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the outer case is `|T| ≥ r₁ > 1` and bounds the inner product by `r₁ⁿ`; it should be `|T| ≥ r₂` and the bound `r₁^{k_i}`; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the ratio of two nearby coordinates is one plus `(T₂ − T₁)/(T₂ − a_j)`; it should be one plus `(T₁ − T₂)/(T₂ − a_j)`; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says each annular domain contributes a degree factor of rank `e`; it should be rank `d`, giving rank `de` in total; affects the proof.
- **Misprint** in Scholze at the construction before Definition 11.3, p. 58: the source says the map of the point to the pro-torus induces a map from `f_*ℤ` to `g_*ℤ`; it should be the pullback from `g_*ℤ` to `f_*ℤ`; affects nothing.

Source independence: 9 passages compared with 2 sources (Scholze 8: §1.7 with line 1021, §4.4 with lines 1621–1627, §5.2 Examples with lines 1780–1784, §7.1 with lines 1944–1948, §7.4 with lines 2070–2076, §9.2 with lines 2275–2278, §11.1 with lines 2454–2458, §11.4 with lines 2534–2537; Cisinski–Déglise 1: §10.2 with line 1258), none shared beyond what the mathematics forces (longest common run 7 words, "the colimit of … along multiplication by", Scholze line 1946); largest share Scholze, 105 of 123 locator groups; contents compared with Scholze: independent — the 13 layers stand against its sections 3–12 in the same order but not one to one (`Layers 2–3 ↔ §5`, `Layer 5 ↔ §7 and the first page of §8`, `Layers 6–7 ↔ the rest of §8`, `Layers 10–11 ↔ §11`; §§0.8, 1.8, 2.7, 10.1, 10.2, 10.4 have no section there), and the *Needs:* lines force the order (each of Layers 1–6 needs its predecessor, 7 needs 6, 8 needs 5, 9 needs 8, 10 needs 7 and 9, 11 needs 10, 12 needs 4, 8 and 9). No table, figure or list is taken over. BLR's text was not read (uncertified).

## For the human reviewers

- **Scope.** 105 of the README's 123 locator groups are to one article (`Scholze`, J. Amer. Math. Soc. 39 (2026)); the layers follow its section order, which the *Needs:* lines force.
- **Scope.** `README.md` "Corrections to the source" asserts nine slips (E1–E9) in that refereed article, and S01 adds a tenth; all were checked against arXiv v3 only, not the journal text.
- **Licence.** `Vakil` is read from a 2024 draft on the author's page (`sources.toml`, `licence_class = "author-page"`); it is cited for three locators in §9.5 only.
- **Not tested.** `BLR` (`sources.toml`, `status = "uncertified"`) could not be read; its three locators in §4.3 are background and its route does not use them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "40fb7992ab3a36f6dc87ae633b64b20df562e737", "job": "RT-MotivesAndAlgebraicCyclesPartII~2a", "model": "fable", "worker": "chris-x30"} -->
