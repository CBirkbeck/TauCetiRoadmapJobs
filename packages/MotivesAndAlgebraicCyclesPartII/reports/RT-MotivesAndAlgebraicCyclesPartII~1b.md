<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6912103425 -->
Red team round 1 pass b (claude) of 6309723

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §7.4 (and §7.5) drop "uniform": `A_{<1}` is not an ideal, so `KH(A_{<1})` is undefined

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:898`: "for every analytic
   nonarchimedean Banach ring `A`, the functor `A ↦ E_KH(A) = cofib(KH(A_{<1}) → KH(A))` is a sheaf";
   also the first two API bullets of §7.4 (lines 902–903) and the hypothesis of §7.5 (line 918).

   **Claim.** `E_KH(A)` is defined for every analytic nonarchimedean Banach ring, with `A_{<1}` an
   ideal of `A_{≤1}` and of `ℤ ⊕ A_{<1}`.

   **Witness.** The completion `A` of `ℚ₂[T]` for the sum norm `Σ |a_n|₂` is an analytic nonarchimedean
   Banach ring with `|2| = |2T| = 1/2`, `|2 + 2T| = 1`: `A_{<1}` is not additive. Scholze line 1366 and
   §3.1 assume uniform.

   **Repair.**
   - §7.4, statement: replace "for every analytic nonarchimedean Banach ring `A`" by "for every
     uniform analytic nonarchimedean Banach ring `A` (§3.1, so that `A_{<1}` is an ideal of
     `A_{≤1}`)". First API bullet: "A contractive map `A → A′` of uniform analytic nonarchimedean
     Banach rings …".
   - §7.4, Checks, add: "Uniformity is needed for the definition: on the completion of `ℚ₂[T]` for
     the sum norm `Σ |a_n|₂`, `|2| = |2T| = 1/2` and `|2 + 2T| = 1`, so the elements of norm less than one are not
     closed under addition; its uniform completion, the Tate algebra with the Gauss norm, has
     `|2 + 2T| = 1/2`."
   - §7.5, statement: "`A` is a uniform Banach `C`-algebra such that `A_{≤1}` is …".
   Tested on the witness: the sum-norm ring is excluded; its uniform completion `ℚ₂⟨T⟩` with the Gauss
   norm is admitted, and there `A_{<1} = 2ℤ₂⟨T⟩` is an ideal.

2. **F02** (P2) "analytic cover" and "analytic topology" are never defined, are used in two senses, and one use is false

   **Location.** README.md:160 ("that analytic covers are arc-covers"; "the analytic cover
   `A → A((T))_{1/2}`"), :203, :215 ("Analytic covers of strict rings by strict rings are
   quasi-pro-étale"), :890 and :898 ("is a sheaf for the analytic topology"), :1494.

   **Claim.** (a) §§0.3, 0.5, E9 use "analytic cover" for an arc-cover by an analytic ring. (b) §0.6
   asserts such covers between strict rings are quasi-pro-étale. (c) §§7.3–7.4 state headline sheaf
   properties for a topology with no definition in the README or in a cited section.

   **Witness.** `C → C′`, `C′` the completed algebraic closure of the Gauss-point field of `C⟨T⟩₁`: a
   strict arc-cover with one-point spectra, so §0.6's second API bullet would force `C′ ≅ C`. Scholze
   line 2023 uses closed subsets; the README names none.

   **Repair.**
   - Conventions, add: "For a uniform nonarchimedean Banach ring `A` and `f₁, …, f_n, g ∈ A`
     generating the unit ideal, the *rational localization* `A⟨f/g⟩` is the uniform completion of the
     quotient of `A ⊗̂ ℤ⟨T₁, …, T_n⟩₁` by the closure of the ideal `(gT_i − f_i)`; its spectrum is the
     closed subset `{|f_i| ≤ |g|}` of `M(A)`. A functor `F` on such rings is a *sheaf for the analytic
     topology* when `F(0) = 0` and, for every `A` and every finite family of rational localizations
     `A → A_i` whose spectra cover `M(A)`, `F(A)` is the limit of `F` over the Čech nerve of the
     family, formed with uniformly completed tensor products; for two members this is
     `F(A) = F(A₁) ×_{F(A₁₂)} F(A₂)`." For perfectoid `A` this is the rational localization of
     PerfectoidSpaces §P2.3.
   - §0.3 statement: delete "that analytic covers are arc-covers;". §§0.3, 0.5 and E9: replace "the
     analytic cover `A → A((T))_{1/2}`" by "the arc-cover `A → A((T))_{1/2}` by an analytic ring".
   - §0.6, third API bullet, replace by: "For a strict `A` and a closed `Z ⊂ M(A)`, the completed
     filtered colimit `A_Z` of the factors `A_U` over the clopen `U ⊃ Z` is strict with
     `M(A_Z) = Z`, and `A → A_Z` is quasi-pro-étale; so a finite cover of `M(A)` by closed subsets
     gives a quasi-pro-étale arc-cover."
   - §§7.3, 7.4: add to *Needs* "Conventions (rational localizations and the analytic topology);
     TropicalAndBerkovichArithmetic §0.16 (the completed pushout defining `A⟨f/g⟩`)".
   Tested on the witness: `C → C′` is not of the form `A → A_Z` (`M(C)` is a point, `A_Z = C`), so the
   repaired bullet no longer asserts it.

3. **F03** (P3) §2.4 *Needs* cites a diamond theorem the route does not use and cannot use; the Kummer input is pinned but uncited

   **Location.** README.md:442: "*Needs:* §§1.3, 1.8, 2.1; … DiamondEtaleCohomology §C6.1 (base-field
   invariance for coefficients prime to `p`)"; repeated at :106 and :511; scope bullet :18 ("base-field
   invariance", "C6").

   **Claim.** The route of §2.4 needs DiamondEtaleCohomology §C6.1.

   **Witness.** §C6.1 (DiamondEtaleCohomology README line 1568) is about small v-stacks and `n` prime to
   `p`; §2.4 includes residue characteristic zero. The route (Scholze lines 1237–1252) uses Kummer
   covers: `TauCeti.kummerIso`, TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:384.

   **Repair.** §2.4 *Needs*: replace the DiamondEtaleCohomology item by "ProfiniteCohomology §9.6
   (the Kummer isomorphism `K^×/(K^×)ⁿ ≃ H¹(G_K, μ_n)` for `n` invertible in `K`, Tau Ceti
   `TauCeti.kummerIso`), applied to the completed residue fields of the disc". Layer 2 Dependencies:
   drop "DiamondEtaleCohomology §C6.1", add "ProfiniteCohomology §9.6". Supplier contract (line 106)
   and scope (line 18): delete "§C6.1 (base-field invariance …)", "base-field invariance" and "C6";
   add `TauCeti.kummerIso` with its hypothesis `IsUnit (n : K)` to "From Tau Ceti".
   Tested on the witness: over the completed algebraic closure of `ℂ((t))` with `n = 2` the Kummer
   isomorphism applies (`2` is a unit); §C6.1 does not.

4. **F04** (P3) §10.2: the rational Nisnevich–étale comparison is cited to theorems that do not state it

   **Location.** README.md:1184: "rational étale and Nisnevich sheaves with transfers have the same
   `A¹`-local objects (Cisinski–Déglise Theorem 5.2.2 and Corollary 5.5.5)"; fifth item of §10.2 and
   its locator list (:1172).

   **Claim.** CD Theorem 5.2.2 and Corollary 5.5.5 give `DM_et^tr(k, ℚ) ≃ DM(k, ℚ)`.

   **Witness.** CD line 2048: Theorem 5.2.2 is `DM_B ≃ DM_h(−, ℚ)`; CD line 2521: Corollary 5.5.5 is
   `DM_et ≃ DM_h`. The comparison used is CD line 1258, Proposition 2.2.10, p. 27.

   **Repair.** Line 1184: "… have the same `A¹`-local objects (Cisinski–Déglise, Proposition 2.2.10,
   p. 27: for a `ℚ`-algebra of coefficients the comparison functors from Nisnevich to étale motives
   with transfers are equivalences) and the higher-Chow identification …". Add "Proposition 2.2.10,
   p. 27 (rational Nisnevich–étale comparison with transfers)" to the locator list of §10.2, to the
   References entry [CD] and to `sources.toml`.

5. **F05** (P3) three locator slips

   **Location and witness.**
   - README.md:940, §7.7: "Remark 1.8, p. 6". Scholze line 198: it is on p. 5.
   - README.md:201, §0.5: "Proposition 3.11, …, pp. 16–18". Scholze line 708: it begins on p. 17.
   - `sources.toml`, `Scholze`: `cited_for` has "1.1-1.7"; §1.8 (README.md:363) cites Remark 1.4.

   **Repair.** "Remark 1.8, p. 5"; "pp. 17–18"; `cited_for` "1.1-1.8" and add "Remark 1.4" to the
   `locator` string.

6. **F06** (P3) §9.6, third Check: the example is not shown to be infinite-dimensional

   **Location.** README.md:1104: "An infinite-dimensional base, such as a bounded product of copies of
   `ℂ⟨T⟩₁` over a countable set, violates the finite-dimension hypothesis."

   **Claim.** `d(Marc(∏^Ban_ℕ ℂ⟨T⟩₁)) = ∞`.

   **Witness.** No value is computed. The same product of the arc-equivalent rings `Cont(D̄, ℂ)`
   (§0.3) is `Cont(β(ℕ × D̄), ℂ)`, whose spectrum has covering dimension `dim(ℕ × D̄) = 2`. A product
   of two-dimensional pieces does not force infinite dimension.

   **Repair.** Replace the Check by: "The finite-dimension hypothesis excludes the free uniform Banach
   `ℂ`-algebra `A` on countably many elements `T₁, T₂, …` of norm at most one. Its spectrum is the
   infinite polydisc `D̄^ℕ`; for every `n` the closed subset `D̄ⁿ × {0}` carries the sheaf `j_! ℤ`
   extended from the open polydisc, with `H^{2n} = H^{2n}_c(Dⁿ, ℤ) = ℤ`, so by §1.3
   `d(Marc(A)) ≥ 2n` for every `n`."
   Tested: `n = 1` gives `H²_c(D, ℤ) = ℤ`, consistent with the covering dimension `2` of the closed
   disc used in §2.1.

7. **F07** (P3) §4.6, second Check: the stated reason for non-solvability of `x^ℓ − x = T` is false

   **Location.** README.md:691: "`x̄^ℓ − x̄ = T`, which forces nonzero coefficients at every
   `T^{1/ℓ^m}`, `m ≥ 1`, impossible for a polynomial."

   **Claim.** Every formal solution has all coefficients `c_{1/ℓ^m} ≠ 0`.

   **Witness.** `x̄ = −Σ_{m≥0} T^{ℓ^m}` satisfies `x̄^ℓ − x̄ = −Σ_{m≥1} T^{ℓ^m} + Σ_{m≥0} T^{ℓ^m} = T`
   and has no fractional exponent. The conclusion (no solution in `k[T^{1/ℓ^∞}]`) stands; the reason
   does not.

   **Repair.** Replace the clause by: "with `x̄ = Σ c_α T^α`, comparing coefficients gives
   `c_{1/ℓ}^ℓ = 1 + c_1`, `c_{ℓ^m} = c_1^{ℓ^m}` and `c_{1/ℓ^{m+1}}^ℓ = c_{1/ℓ^m}` for `m ≥ 1`; if
   `c_1 ≠ 0` every `c_{ℓ^m}` is nonzero, and if `c_1 = 0` every `c_{1/ℓ^m}` equals `1`; either way
   infinitely many coefficients are nonzero, impossible for a polynomial in the `T^{1/ℓ^m}`."
   Tested on the witness: it has `c_1 = −1 ≠ 0` and falls in the first case.

Seven findings: two P2 (R01, R02), five P3 (R03–R07). No P1. `Suggested.lean` states nothing and
none of the nine headline theorems is statable at the pins, so there is no Lean finding.

## Verified sound

**Counts.** Declarations read: 0 (the file is `import Mathlib`, one module docstring, an empty
namespace). README lines read: all 1505. Numbered targets read: 83. Locators verified against cached
text: all 102 Scholze citation groups (label and page), 8 Cisinski–Déglise statements, 10 Bachmann
statements, 2 van der Put, 3 Vakil; 2 page slips (R05) and 1 misattribution (R04). Check bullets
read: 180; recomputed with values: those in the 53 rows of the table below; 2 defective (R06, R07).
Sibling citations checked: 23 roadmaps, about 150 section ids and names, all present on main or at
the open head (`roadmaps resolve` also lists none missing); content read for 20 of them; 1 misused
(R03). Pinned declarations grepped: 14 Mathlib
files and 24 Tau Ceti names, all present with the stated hypotheses.

**`Suggested.lean`.** No `set_option`, `lemma`, `#eval`, sorry'd data or second import. The docstring
names each of the nine headline theorems of the Summary with the missing carrier. I grepped the pins:
no Berkovich spectrum as a declaration, no K-theory spectrum, no ∞-categorical sheaf category, so
none is statable. Nothing is padding. No `#check @name` audit was run: there is no declaration, and
this pass runs no Lean.

**Dependency check.**

```text
depcheck: 256 roadmaps, 2446 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 381 of the merge order; every named
supplier is on main or earlier.

**Ownership.** Searched the roadmaps on main and the open heads for the arc-topology on Banach rings,
`Dmot`, integral étale motives `DM_et`, motivic nearby cycles, homotopy K-theory, Breen–Deligne
resolutions and fracture squares. No second owner of any object this roadmap owns. No roadmap cites
this one as a supplier. AnalyticStacks (README line 1302 at its open head) assigns the monodromy identification
to this roadmap, as §11.6 says.

**Declared gaps.** All eight slugs agree between `design/plan.json` and the README. None has
supplier `none`. No roadmap I can read already provides `KH`, the K-theory of valuation rings, the
E∞ fracture square or the replete Postnikov theorem. Three gaps list several statements of one
construction; I did not count them compound.

**Errata of the README.** E1, E2, E4 (Scholze lines 1601, 1621–1624, 1631), E5 (line 1471), E8 (line
2453) and E9 (line 672) are confirmed as printed. E6 and E7 are consistent with lines 2182–2186 and
2398–2400.

**Policy.** The pull request changes only the package folder. No pull-request number or process
wording in the README or docstring. Every target has a locator.

**Adversarial table** (statement; instance; values; result).

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Conventions, analytic ⇔ nondiscrete residue fields | zero ring; trivially normed `k` | empty sum gives `1 = 0`; seminorm `0` on `m`, `1` off `m` is bounded since `a ∉ m ⇒ |a| ≥ 1` | holds |
| §0.1 Check 1 | `ℤ[T]_{r+1/n}` | colimit norm `r`, stage norms `r + 1/n` | holds |
| §0.1 Check 3 | `z = Σ pⁿ x_n` | `|z| = 1/p`; coefficient `p^{n+1}` at `x_{n+1}` | holds |
| §0.2 covers | zero ring; infinite family | `M(0) = ∅`; finite subfamily required | holds |
| §0.2 lifting criterion | discrete `K(x)` | lifts through `K(x)((T))_{1/2}` | holds |
| §0.3 norm of `A((T))_{1/2}` | `f = 1 + 2T` over `ℂ` | sup norms `1`, `2`; sum norms `2`, `4` | holds |
| §0.3 universal property | `u = 1/2`, `u = 1/3` | `T⁻ⁿ ↦ 2ⁿ` ok; `3ⁿ > 2ⁿ` fails | holds |
| §0.3 Check 1 | `k((T))_{1/2}` | one point, `|T| = 1/2` | holds |
| §0.4 Checks | `ℝ`; `βI`; trivial `k` | residue field `ℝ`; ultrafilter points; not analytic | holds |
| §0.6 definition | `C⟨T⟩₁` | spectrum connected, not `Cont(S, C)` | holds |
| §0.6 API 3 | `C → C′` | would force `C′ ≅ C` | fails: R02 |
| §0.8 Checks | `K[ε]/(ε²)`; `1 + T` at `r = 1` | `|b|² = |b²| = 0`; sup norms `1`, `2` | holds |
| §1.2 Check 3 | `Cont(S, C)` | `colim ℤ^{S_j} ≠ ℤ^S` | holds |
| §1.4 Checks | `{|a| < r}`, `a = 0, 1` | whole space; empty for `r ≤ 1` | holds |
| §1.8 Check 3 | `n` prime to residue characteristic | kernel of `n` on `C^×/(1 + C_{<1})` is `μ_n(C)` | holds |
| §1.8 Check 4 | `C` over complex `A` | `|1/2|_C ≥ 1 > 1/2`; `(1/2)^α > 1/2` | holds |
| §2.1 bound | `ℂ`; nonarchimedean `C` | `2 + 0`; `1 + 2` | `≤ 3` holds |
| §2.1 Check 2 | `1 + aT` | Gauss distance `|a| < 1`; not in `C^×` | holds |
| §2.7 (c) | `D^N_C`, closed cover | `3N`, plus `N` for the Čech complex | `≤ 4N` holds |
| §2.7 Check 1 | `ℙ¹` | `cofib(ℤ ⊕ ℤ(1)[1] → ℤ ⊕ ℤ)` | `ℤ ⊕ ℤ(1)[2]` holds |
| §2.7 Check 3 | skyscrapers at `1/n` | stalk of product `∏ℤ/⊕ℤ`, product of stalks `0` | holds |
| §3.1 Check 3 | `−1` in `ℚ₂`, `ℚ₃` | `‖2‖ = 1/2`, `1` | holds |
| §3.4 Checks | `ℂ`, `ℝ` | `ℤ[1][−1] = ℤ`; reflection acts by `−1` on `H₁` | holds |
| §3.5 criterion | `T² + T/2 + 4` over `ℂ₂` | slopes `−3`, `1`; norms `1/8`, `2`; bound `min(4, 1) = 1 < 2` | holds |
| §3.5 Check 1 | `T² − 1` | both formulas give `1` | holds |
| §4.3 | `ℙ¹`, `{0, ∞}` | `J_Z = G_m`, coordinate `a/b`; section `(t−x)/(t−y)` gives `x/y` | holds |
| §4.3 divisibility | extension of divisible groups | lift, subtract, divide in the torus | holds |
| §4.4 | disc, annulus | `d = 0`: `ℚ`; `d = 1`: `ℚ ⊕ Ḡ_m ⊗ ℚ` | agrees with §3.5 |
| §4.6 Check 2 | `x̄ = −Σ T^{ℓ^m}` | solves the equation with no fractional exponent | reason fails: R07 |
| §4.8 Check 6 | `‖x‖ = 2^{−⌊v₂/2⌋}` | `‖2‖ = 1`, spectral radius `2^{−1/2}` | holds |
| §4.9 Check 3 | `ℂ_p` | `μ_n(C) = μ_n(C♭)`, `|p| = 1/p`, `0` | holds |
| §5.4 Check 3 | `ℂℙ^∞` | one `ℚ` in each degree `−2n` | holds |
| §6.1 Check 1 | `ℂ₂`, `ℂ₃` | `π₀ = ℤ[1/2]`, `ℤ[1/3]`; no map to `ℤ` with `1 ↦ 1` | holds |
| §6.2 | `n = 2` | antipodal map, `+1` on `H⁰`, `−1` on `H²` | holds |
| §6.3 Examples | eigenvalues `1, 2, 4` | projectors give `(1,0,0)`, `(0,1,0)`, `(0,0,1)` | holds |
| §7.1 Check 2 | octahedral axiom | `E_K = K(C) ⊔_{K(O_C)} K(k)` | holds |
| §7.4 statement | `ℚ₂⟨T⟩`, sum norm | `|2 + 2T| = 1` | fails: R01 |
| §7.4 Check 1 | `ℚ_p` | `π₀ = π₋₁ = 0` of the fibre; `π₀ E_KH = ℤ`; fibre gives `ℤ × 𝔽_p^×` | holds |
| §7.7 Check 1 | `π₀` | `ℤ = ℤ[1/p] ×_{ℚ_p} ℤ_p` | holds |
| §8.1 Check 2 | `ℤ(−1)` | `M_n = ℤ(n−1)`, shift gives `(ℤ(n))_n` | holds |
| §8.2 | `ℂ` | `f_♯ℤ = ℤ ⊕ ℤ[2]`, `f_*ℤ ⊗ ℤ[2] = ℤ[2] ⊕ ℤ` | holds |
| §8.5 Check 2 | `βℕ` | not metrizable, no embedding in `ℂⁿ` | holds |
| §9.5 Check 3 | `E × E` | intersection matrix determinant `2`; `n_{i,2i} = 1, 1` | holds |
| §9.6 Check 2 | `[0,1]` | `RΓ_c((0,1], ℤ) = 0` | holds |
| §9.6 Check 3 | product of `Cont(D̄, ℂ)` | dimension `2` | unsupported: R06 |
| §10.2 Checks | `𝔽̄₃`, `n = 2, 3` | `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; degree `1/3` impossible | holds |
| §10.4 Check 1 | `ℙ¹`, `j = 1` | `π₋₂ = ℚ`, `π₀ = 0`; index `K_{i+2j}` matches CD (5.2.2.a) with `q = −i` | holds |
| §10.5 Check 3 | `Spec k` | `i^* i_* = 1 − [N^∨] = 0`; `π₁ = (k^× ⊗ ℚ) ⊕ ℚ` | holds |
| §11.3 Check 4 | `H = ℚ[t^±] ×_ℚ ℤ[1/p]` | augmentation ideal `≅ H ⊗ ℚ`, Tor amplitude `[−1, 0]`; `H ⊗ 𝔽_ℓ = 𝔽_ℓ` | holds |
| §11.5 route | band ring | `x_n = t/n`, `x_n = m x_{nm}`; ring `ℤ[1/p] ⊕ tℚ[t]` | holds |
| §11.6 Check 4 | `ℤ/2` over `ℤ[1/3]` | `A ⊗ ℚ = 0`, pair `(ℤ/2, 0)` | holds |
| §12.1 Check 4 | `C⟨T^{1/p^∞}⟩` | integral closure of `𝔽_p + R°°` has residue ring `𝔽̄_p` | holds |
| §12.3 Check 2 | extension by zero | specialization `0 → ℤ/n` | holds |

## Not verifiable

- BLR §9.2 (Proposition 3, Example 8, Proposition 10): recorded `uncertified`; cited by locator only.
- The works Scholze's proofs rest on ([Ber93], [Ram24a], [Aok24], [HN20], [Sus95], [KST18], [MR25]):
  not in the cache; the README routes them through suppliers and declared gaps.
- The journal pagination of Scholze and the printed pagination of Vakil's book: locators are to
  arXiv v3 and to the 2024 draft, as `sources.toml` says.
- Whether the spectrum of `∏^Ban_ℕ ℂ⟨T⟩₁` has finite covering dimension (R06): I computed only the
  `Cont(D̄, ℂ)` analogue.
- The proofs behind the supplier sections: I checked statements and hypotheses, not proofs.
- The correctness of Scholze's Theorems 7.1, 8.9–8.13, 10.1 and 11.9 beyond the instances in the
  table.

## Source issues

- **Misprint** in Scholze at proof of Proposition 5.19, p. 35: the source says the coefficients satisfy a bound by the maximum of the two radii conditions; it should be the minimum; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the outer estimate holds for `|T| ≥ r₁ > 1` and bounds the inner product by `r₁ⁿ`; it should be `|T| ≥ r₂` and `r₁^{k_i}`; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the ratio of nearby coordinates is one plus `(T₂ − T₁)/(T₂ − a_j)`; it should be `(T₁ − T₂)/(T₂ − a_j)`; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says each annular domain contributes a degree factor `ℚ^e`; it should be `ℚ^d`, giving `ℚ^{de}` in total; affects the proof.
- **Misprint** in Scholze at Lemma 6.5 and proof of Theorem 6.3, pp. 36–37: the source says the complements are taken in the projective line over `A`; it should be over `C`; affects nothing.
- **Misprint** in Scholze at the construction before Definition 11.3, p. 58: the source says the roots induce a map from `f_*ℤ` to `g_*ℤ`; it should be the pullback from `g_*ℤ` to `f_*ℤ`; affects nothing.
- **Error** in Scholze at Example 3.6, p. 16: the source says the bounded product of the residue fields is totally disconnected; it should require nondiscrete residue fields, as Proposition 3.11 does; affects nothing.
- **Misprint** in Scholze at Theorem 11.1, p. 57: the source says the rational mapping object is the weight-`j` Adams piece of K-theory; it should carry the shift by `−2j`; affects a stated result.
- **Gap** in Scholze at Lemma 6.4, pp. 36–37: the source says any smooth connected curve can be shrunk and compactified; it should assume the curve separated, as the doubled-origin line shows; affects the proof.
- **Gap** in Scholze at Theorem 8.13, p. 49: the source says the statement holds on all analytic nonarchimedean Banach rings; it should restrict to uniform ones, where the elements of norm below one form an ideal; affects a stated result.
- **Gap** in Scholze at the construction after Proposition 9.3, p. 52: the source says the formalism starts from all affine maps of finite cohomological dimension; it should start from the maps of Theorem 9.2, whose projection formula is proved; affects the proof.

## Copyright, licences and scope

Wording: I set 17 passages beside their sources (§0.2 with Definition 3.1; §1.4 with Definition 4.22;
§1.5 with Definition 4.19; §2.1 with Lemma 5.3; §4.5 route with the proof of Lemma 6.4; §4.7 with
Theorem 6.1; §7.6 with Theorem 8.9; §7.7 route with the proof of Corollary 8.10; §9.1 with
Proposition 10.1; §9.5 with Definition 10.7; §10.1 with Remark 11.2; §12.1 with Proposition 12.1;
§10.2 with CD Theorem 4.5.2 and Corollary 5.5.7 and with Bachmann Theorem 6.6; §4.2 with van der Put
Corollary 1.3; the `Suggested.lean` docstring with Scholze's introduction). The longest run of
shared consecutive words is 7, in the three-clause definition of §1.5 (Scholze lines 1010–1013);
the rest is formulas and standard names. No finding.

Arrangement: Scholze has 102 of 114 locators. Its sections 3–12 and the README's layers correspond,
in the same order, as `Layer 0 ↔ §3`, `Layer 1 ↔ §4`, `Layers 2–3 ↔ §5.1, §5.2`, `Layer 4 ↔ §6`,
`Layer 5 ↔ §7`, `Layers 6–7 ↔ §8`, `Layer 8 ↔ §9`, `Layer 9 ↔ §10`, `Layers 10–11 ↔ §11`,
`Layer 12 ↔ §12`. The correspondence is not one to one with equal scope: three sections are split,
Layer 0 takes Proposition 2.9 and Definitions 4.3–4.6, Layer 5 takes Corollaries 8.1–8.2, and
§§0.8, 1.8, 2.7, 4.2, 4.3, 10.1, 10.2 and 10.4 are the roadmap's own. The *Needs* lines force the
chains `0 < 1 < 2 < 3 < 4 < 5`, `5 < 6 < 7 < 10 < 11`, `5 < 8 < 9 < 10` and `9 < 12`. Two placements
are free and coincide with the source: Layers 8–9 after 6–7, and Layer 12 last. I did not raise a
finding; the facts are below for the human reviewers.

Reuse: no table, figure, list of examples or numerical data is taken over. `Suggested.lean` has no
declaration to compare with a public formalisation.

Source independence: 17 passages compared with 5 sources, none shared beyond 7 consecutive words; largest share Scholze, 102 of 114 locators; contents compared with Scholze: same order, forced by the Needs lines except two free placements, scopes differ in 7 of 13 layers; BLR could not be read.

## For the human reviewers

- **Scope.** Layers 0–9, 11 and 12 rest on one article (Scholze, J. Amer. Math. Soc. 2026, refereed); 102 of 114 locators are to it. No second source states these results for Berkovich motives.
- **Scope.** The 13 layers follow Scholze's sections 3–12 in order (pairs above); the dependencies force all but two placements; six layers have the scope of one source section plus own targets.
- **Licence.** Vakil's text is the author-page draft of 21 February 2024, marked as an early version of a book published by Princeton University Press; it is cited for three locators in §9.5 only.
- **Not tested.** BLR (`sources.toml`, `uncertified`) could not be read; its three locators in §4.3 are background only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6309723ccd937d2b3a283ac7f210832f492f15fe", "job": "RT-MotivesAndAlgebraicCyclesPartII~1b", "model": "fable", "worker": "chris-x82"} -->
