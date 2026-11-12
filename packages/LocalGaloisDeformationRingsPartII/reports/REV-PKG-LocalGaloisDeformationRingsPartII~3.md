<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12941#issuecomment-6788269738 -->
Review (claude) of c63be8b

Verdict: needs_changes

1. **F01** (P2) `gap:regular-local-factorial` asks for a theorem an earlier roadmap already states

   **Location.** `packages/LocalGaloisDeformationRingsPartII/README.md` line 86: "What DeformationAndDerivedPatchingAlgebra must provide (gap:regular-local-factorial): the Auslander–Buchsbaum theorem that a regular local ring is a unique factorization domain, in particular `𝒪⟦x₁,…,x_n⟧` …". Also line 548 (5.3, route and *Needs:*), line 617 (Layer 5 Dependencies), and the `regular-local-factorial` entry of `gaps` in `design/plan.json`.

   **Claim.** No roadmap earlier in the merge order provides the theorem, so it must be requested from DeformationAndDerivedPatchingAlgebra §3.2.

   **Witness.** PurityForFlatCohomology (open, new roadmap; merge order 221, this roadmap 353), README line 2298: "### 7.4 Regular local rings are factorial … Prove `isRegularLocalRing_uniqueFactorizationMonoid`"; its `Suggested.lean` (docstring at line 264) states `[IsRegularLocalRing R] : UniqueFactorizationMonoid R`.

   **Repair.**

   1. Delete the bullet at README line 86 and the `regular-local-factorial` entry of `gaps` in `design/plan.json`.
   2. Add after the DeformationAndDerivedPatchingAlgebra contracts:

      > ### From TauCetiRoadmap.PurityForFlatCohomology
      >
      > - §7.4 (`isRegularLocalRing_uniqueFactorizationMonoid`): a regular local ring is a unique factorization domain (Auslander–Buchsbaum). Used in 5.3 for `𝒪⟦x₁,…,x_n⟧`.

   3. Under "From Tau Ceti" add: "`TauCeti.PowerSeries.isRegularLocalRing` (`TauCeti/RingTheory/RegularLocalRing/PowerSeries.lean`): power series in one variable over a regular local ring form a regular local ring."
   4. In 5.3 replace "primality follows because `A` is factorial (gap:regular-local-factorial)" by "`A` is a regular local ring, one variable at a time from `TauCeti.PowerSeries.isRegularLocalRing` starting at the discrete valuation ring `𝒪`, hence factorial (`PurityForFlatCohomology` §7.4), so the irreducible element is prime". In its *Needs:* replace "gap:regular-local-factorial" by "Tau Ceti `TauCeti.PowerSeries.isRegularLocalRing`; `PurityForFlatCohomology` §7.4".
   5. In the Layer 5 Dependencies replace "gaps regular-local-factorial, ghls-existence, …" by "`PurityForFlatCohomology` §7.4; gaps ghls-existence, …". In Scope and ownership add to the imported list: "Factoriality of regular local rings: `PurityForFlatCohomology`, §7.4."

   Tested: on a scratch copy of the README with these replacements the dependency check prints `depcheck: 236 roadmaps, 2139 edges, 0 problem(s)` (one new edge, downward). At the pins, `#check @TauCeti.PowerSeries.isRegularLocalRing` gives `[IsRegularLocalRing R] → IsRegularLocalRing (PowerSeries R)`, and `UniqueFactorizationMonoid (MvPowerSeries (Fin 3) O)` is not found by instance search, so the pins alone still do not give the statement and the citation is needed.

2. **F02** (P3) GHLS17 Theorem D is quoted with `p ∤ n`; the source has `p ≠ n`

   **Location.** README line 76 (`gap:ghls-existence`): "GHLS17 Theorem D (Theorem 3.1.5): for `K/ℚ_p` unramified, `p ∤ n` and `r̄ : G_K → GL_n(𝔽̄_p)` …"; the same words in the gap's `needs` in `design/plan.json`.

   **Claim.** The theorem's hypothesis on `p` and `n` is `p ∤ n`.

   **Witness.** `GHLS17 line 174` and `line 1041` print the hypothesis with the not-equal sign, the glyph used for "≠ 0" throughout (lines 448, 481); non-divisibility is printed differently (`p ∤ 2n`, lines 160, 962). `GHLS17 lines 1044–1046` derive `p > n` from it.

   **Repair.** Write `p ≠ n` in both places. Tested at `n = 2`: both read `p ≠ 2`; in general, with a lift of extended Fontaine–Laffaille weight, `p ≠ n` gives `p > n` (line 1046), so no instance is lost or gained and 5.6 is unaffected.

Two findings, one blocking. The five findings of round 2 are all repaired, and the new §3.10 is mathematically sound. What remains is one declared gap that an earlier open roadmap already proves (R01), and one hypothesis of a cited theorem transcribed differently from the source (R02). `Suggested.lean` needs no change.

## Round-2 findings

| Id | Status | Repaired passage (README line) |
| --- | --- | --- |
| F01 (P2), framed ring of `G_{K∞}` unowned | repaired | §3.10, line 410: "Define the **framed deformation ring** `R□_{ρ̄,Γ} = lim_H R□_{ρ̄_H}`, the limit over the open normal subgroups `H ⊆ ker ρ̄`"; 7.3, line 712: "the pro-representing ring `R□_{ρ̄|G_{K∞}}` of 3.10 (not Noetherian)"; 5.7 and 7.3 list 3.10 in *Needs:* |
| F02 (P2), supplier cited by `MP.` ids | repaired | line 80: "§3.1: regular weights, depth and the central twist. §3.2: `t_λ(ω)` … §3.4 … §5.5"; no `MP.` string remains; the gap's `section` is `§3.2` |
| F03 (P3), four supplier names that exist nowhere | repaired | line 85: "§1.9 (the relative cotangent space `𝔪_B/(𝔪_B² + 𝔪_A B)` and `seriesPresentation_surjective`)"; line 99: "§0.3 (fundamental characters, Teichmüller lift)" |
| F04 (P3), equivalence attributed to Lemma 3.3.1 | repaired | 5.3, line 548: the sentence is gone; line 558: "The converse of the residue test, which the source does not claim, fails" |
| F05 (P3), page of Definition 3.2.5 | repaired | line 333: "(BHHMS23, Definition 3.2.5, p. 22)" |

Pattern search: no other `MP.` id, no other backticked supplier name that fails to resolve (`roadmaps resolve` lists none; I opened `heightLatticeFunctor`, `kisinOpenDiscBounded`, `KisinModule`, `KisinModuleCoeff`, `seriesPresentation_surjective`, `flatCompletion_finiteComparison` at the suppliers' heads), no other object used without an owner in a route.

## Verified sound

**Principles.** Every statement keeps the full profile set `{(3,0),(2,1)}^f`, reducible and irreducible `ρ̄`, and ramified `𝒪`. The base roadmap is imported by section. No copied passage, no algorithm, no sorried data, no `set_option`. Supply runs one way.

**Elaboration.** `lake env lean` on `packages/LocalGaloisDeformationRingsPartII/Suggested.lean` from the content checkout: one message, `47:8: warning: declaration uses 'sorry'`. `import Mathlib` only. Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

**Binder check.** `#check @crossing_prime` carries `CommRing O`, `IsDomain O`, `IsDiscreteValuationRing O`, `IsAdicComplete (IsLocalRing.maximalIdeal O) O`, `Irreducible ϖ`, `0 < d`, a unit `u` of `MvPowerSeries (Fin (n + 2)) O`, and concludes `Prime (X 0 * X 1 + C (ϖ ^ d) * ↑u)`: README 5.3's first assertion, same generality. Nothing changed.

**Padding probe** (the one sorried theorem): `simp` leaves the goal, `rfl` fails, `infer_instance` fails ("type class instance expected"), `aesop` fails, `exact?` proposes only the sibling probe copy. Not padding.

**Headlines.** 6.1, 6.2, 6.3, 7.3, 7.5, 3.6, 3.9, 4.3 and 5.3. Only 5.3 is statable and it is stated; the docstring names the others with the missing carriers. I confirmed that neither pin has a framed deformation ring, a Kisin module or an étale `φ`-module carrier (a search of both libraries finds none). The only backticked name of this roadmap's own is `crossing_prime`, which the file declares.

**Dependency check** (the brief's command):

```text
depcheck: 236 roadmaps, 2138 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Pinned declarations**, opened with `#check` in one scratch file: `PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`, `IsRegularLocalRing`, `IsLocalRing.notMem_maximalIdeal`, `Ideal.span_le`, `Ideal.minimalPrimes`, `Matrix.det_fin_two`, `Matrix.adjugate`, `Polynomial.derivative`, `Field.absoluteGaloisGroup`, `modularCyclotomicCharacter`, `LaurentSeries`, `TauCeti.inertiaTameCharacter`, `TauCeti.quotientWildInertiaSubgroupEquiv`: all present. Also `TauCeti.PowerSeries.isRegularLocalRing` (`TauCeti/RingTheory/RegularLocalRing/PowerSeries.lean:157`) and `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (`…/UniqueFactorization.lean:59`, dimension at most two only).

**Suppliers resolved now** (heads of 2026-11-11).

- LocalGaloisDeformationRings §§1.1, 1.2, 1.8, 3.1, 3.4, 3.5, 3.9, 3.10, 6.9, 6.28, 8.10 at its lines 1276, 1284, 1399, 2241, 2292, 2300, 2388, 2396, 3052, 3380, 3810. §6.9 is rank three with `𝒪_{ℰ,K,R}` and a contravariant `T*_dd`; §8.10 is the reducible case over `ℚ_p`.
- PadicLocalLanglandsForGL2Qp §§0.3, 0.4, 4.4 at 268, 292, 1473. §0.4 defines the framed functor for every profinite group and proves pro-representability only under `Φ_p`, as 3.10 says.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1, .2, .5, .6, .24, .36, .39 at 5483, 5559, 5684, 5715, 6528, 7307, 7412.
- DeformationAndDerivedPatchingAlgebra §§1.8, 1.9, 1.11, 1.12, 1.13, 1.14, 3.2, 4.6, 4.7, 6.8 at 213, 233, 262, 282, 305, 325, 573, 991, 1006, 1327.
- ModpRepresentationsOfGL2OverLocalFields (board package) §§3.1, 3.2, 3.4, 5.5 at 938, 963, 1008, 1373.
- LocalFieldsRamification "Layer 4: the tame quotient of the absolute Galois group" (line 1155) and ClassFieldTheory Layer 7 (line 1205), both on main.

**Gaps.** The ten gaps agree mechanically between `design/plan.json` and the README (slug, supplier, `needs`); none has supplier `none`. Searched by object over main, the open heads and the board packages: Hamann's theorem, the Deligne–Lusztig reduction formula, GHLS17, the Kummer-tower restriction lemmas, the tame quotient of the Kummer tower and the Artin value of `ω_f` have no other owner. The exception is R01.

**Ownership and overlaps.** No open pull request changes this roadmap and no id is dropped. `crossing_prime` is declared in no other `Suggested.lean` (main, open heads, board packages). §3.10: the only other non-`Φ_p` statement found is LocalGaloisDeformationRings line 944, a pseudodeformation Check, not this object.

**Sources, seeded sample**, each read at its locator in the cached text.

| Target | Locator checked | Result |
| --- | --- | --- |
| 0.2 | BHHMS23 Definition 2.3.3, lines 653–659 (pp. 14–15); Definition 2.3.4, lines 661–664 (p. 15) | matches, `η` shift as stated |
| 2.1 | Proposition 3.1.7, lines 905–909 (p. 20); `𝒪^rig_R`, `λ`, `N_∇` at 878–901 | matches |
| 2.2 | Definition 3.1.8, lines 913–917 (p. 20) | matches |
| 2.3 | equation (16) and Proposition 3.1.9, lines 947–971 (p. 21) | matches: `N ≥ 2h − 3`, `(N−1)(p−1) ≥ h`, remainder in `p^{N−(h−1)−t}` |
| 3.2 | Lemma 3.2.3, lines 1025–1032 (p. 22) | matches |
| 3.3 | Definition 3.2.4, line 1033; `V*_K` at 1045–1047 (p. 22) | matches |
| 3.6 | Proposition 3.2.7 and (19), lines 1075–1093 (p. 23) | matches |
| 3.10 | proof of Proposition 4.3.1: `ψ₀` at line 1700 (p. 35); the two surjections at 1826–1827 (p. 37); LLHLM18 Proposition 3.12 cited there | matches; the source uses the ring without constructing it |
| 4.1 | lines 1176–1190 (p. 25) | matches |
| 4.2 | Lemma 4.1.1, lines 1201–1215 (pp. 25–26) | matches |
| 5.6 | lines 1523–1536 and (26) (p. 32); GHLS17 Theorem D, line 174 (p. 4); Theorem 3.1.5, line 1041 (p. 21) | matches; hypothesis slip R02 |
| 5.7 | equation (22), lines 1415–1423 (p. 29) | matches, `2f` and `4` variables |
| 6.1 | Proposition 4.2.1, lines 1319–1333 (p. 28), proof to line 1578 (p. 33) | matches |
| 6.2 | lines 1328–1329, 1555–1565; `(f + 4) + 2f = 3f + 4` at 1893 (p. 38) | matches |
| 6.3 | Corollary 4.2.6, (27)–(28), lines 1588–1616 (pp. 33–34); Lemma 8.1.2, line 4405 (p. 88) | matches |

Also checked while there: Definition 2.3.1 and (11)–(12) (p. 14), Remark 2.3.6 and (13) (p. 15), Definition 3.1.4 and Proposition 3.1.5 (p. 19), Definition 3.2.1 (p. 22), Lemmas 3.2.6, 3.2.8, Corollary 3.2.9, Lemma 3.3.1 (pp. 23–24), Lemma 4.1.2 (pp. 26–27), Lemma 4.2.3 (p. 31), Lemma 4.2.4 (p. 32), Remark 4.2.5 (p. 33), Figure 2 (p. 38). All eight cited works are in `sources.toml`; no local path.

**Adversarial table** (values I computed this round).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3.10 index set and locality | `H ⊆ ker ρ̄` open normal; limit of local rings | `ker ρ̄` is itself open normal, so the set is nonempty and closed under intersection; an element with nonzero residue is a unit in every term with compatible inverses | profinite local, projections onto | none |
| 3.10 transition maps | `H′ ⊆ H` | inflation injective on `𝔽[ε]`-lifts gives a surjection on `𝔪/(𝔪², ϖ)`, hence a surjection of complete rings | holds | none |
| 3.10 (i) | Artinian `A` | `A` is finite; a lift has open normal kernel inside `ker ρ̄`; an open ideal of the limit contains the kernel of one projection | bijection | none |
| 3.10 (ii) | `Γ = ℤ_p`, `n = 1`, trivial | terms `𝒪[T]/((1+T)^{p^m} − 1)`, equal to `𝔽[T]/T^{p^m}` modulo `ϖ`, local; limit `𝒪⟦T⟧` | equals the `Φ_p` ring | none |
| 3.10 (iii) | `G_{K∞} → G_K` | lifts of `G_K` restrict; the ring map goes from the ring of `G_{K∞}` to the ring of `G_K` | direction as stated | none |
| 3.10 (iv) | general proof; `T ↦ T²` on `𝒪⟦T⟧` | a form `ℓ` on `𝔪_B/(𝔪_B² + ϖB)` vanishing on `g(𝔪_P)` gives `t(a + m) = ā + εℓ(m)` with `t ∘ g = t₀ ∘ g`; `g(P)` compact, contains the dense `𝒪[x₁..x_m]`. Control: pullback of `T ↦ aε` is `a²ε² = 0`, image `𝒪⟦T²⟧ ∌ T` | holds; hypothesis needed | none |
| 3.10 (v) | `K = ℚ_p`, `ρ̄ = ω ⊕ 1` | `[[ω, εc],[0,1]]` multiplies to `[[ω(gh), ε(c(g) + ω(g)c(h))],[0,1]]`; `c` Kummer cocycle of `−p`, nonzero on `G_K`, zero on `G_{K∞}`; `ad^ss ⊗ ω^{−1}` contains `1` for every `K′` | not surjective without the hypothesis | none |
| 3.10 not Noetherian | `G_{ℚ_p,∞}`, `n = 1` | `𝔽_p((v))/℘` contains the independent classes `v^{−m}`, `p ∤ m` | infinite tangent space | none |
| 0.1 | `f = 1`, `s = w` | `α′₀ = (μ₁+1, μ₂)`, `α′₁ = (μ₂, μ₁+1)`; `p(μ₁+1+pμ₂) ≡ μ₂ + p(μ₁+1)` mod `p² − 1` | holds | none |
| 0.3 | `f = 1`, `p = 5`, `s = w`, `μ = (1,0)` | `a′^(0) = (2,10)`, `a′^(1) = (10,2)`; orientations `w, 1`; (13): `w(2,0) = (0,2)` on both sides | holds | none |
| 1.1 conjugation order | `P` swap, `D = diag(1,2)`, `C = E₁₂` | `Ad(P^{−1}D)(C) = E₂₁/2`; `Ad(DP^{−1})(C) = 2E₂₁` | Check right | none |
| 1.3 degrees | the three shapes against `A₁, A₂, A₃` | `t^(2,1)`: bounds `2, 0; 2, 1`; `w t^(2,1)`: `1, 1; 2, 1`; `t^(1,2)`: `1, 1; 1, 2`; all met by the chart matrices | consistent with 5.2 | none |
| 2.1 Frobenius rule | `u′e` in the trivial module | `−p(u′)^p λ` and `−E (u′)^p φ(λ)`, equal by `λ = (E/p)φ(λ)` | holds | none |
| 2.3 exponents | `L = N − 1`, `h = 3`, `N = 12`; `h = 2` | `p^{N−3−t}`: `p⁹, p⁸`; one jet, `L ≥ 1`, `(L−1)(p−1) ≥ 2` | holds | none |
| 3.1 / 3.2 | `f = 1`, `s = w`, `μ = (1,0)`, `(3,1)` at `p = 5`, `(a,a)`; `f = 2`, `p = 3`, `δ = (2, −1)` | exponents `1, p`; `8 ≡ 2` mod `6`; `(p+1)a`; `|2 − 3| = 1 < 9`; in general `|Σ p^j δ_j| ≤ q − 1` and `≢ 0` mod `p` | holds; wall excluded | none |
| 4.1 depth | `μ(τ)_j + η = (r_j, 0)` or `(r_j+1, −1)` | root coordinate `r_j` or `r_j + 2`, both in `(N − 1, p − N + 1)` | `(N−1)`-deep | none |
| 4.2 bound | `N ≥ 12` | coordinate `≥ 12 > 3` and `≤ p − 11 < p − 4` | holds | none |
| 5.2 constants | `f = 1`, `s = 1` and `s = w`, three shapes | `a₁ = −r` or `r+2`; `a₂ = r+2` or `−r`; `a₃ = −r−2` or `r`; denominators `a₁`, `a₂ ± …`, `a₃ − 1` all nonzero mod `p` for `12 ≤ r ≤ p − 14` | units | none |
| 5.2 `G₅`, chart 2 | `t = xy` | `κ = (a−2)(a+1)/(a(a−1))`, `κ − 1 = −2/(a(a−1))` | holds | none |
| 5.3 / `crossing_prime` | `d = 0`; non-unit `u = x₀`; two variables | unit; `x₀(x₁ + ϖ^d)` reducible; `Fin 2` allowed | hypotheses needed and present | none (R01 touches the route only) |
| 5.4 identity | expansion in `w = xy` | `w³`: `2(κ+1) − 2(κ+1)`; `w²`: `(κ+1)² + (κ−1)² − 2κ² − 2 = 0`; `w`: `(κ+1)(2κ + (κ−1)² − κ² − 1) = 0`; constant `κ(κ−1)²p³` | `p³(κ−1)²` | none |
| 5.5 | `N = 12`; Elkik with `h = 3`, `k = 0` | `n = 7 > 6`; `p³(1 − p^{n−3}x) ∈ H(a)`; correction in `p⁴` | holds | none |
| 5.6 | `λ_j − (1,0)` | `(2,0)` or `(1,1)`; middle summand `L(a+1, b+1)` | matches (26) | R02 on the gap's wording |
| 6.3 | `f = 1`: `U₂` with either label; `U₁` with `(2,1)`, `(3,0)` | `xy = 0`: `m = 1`, `𝔽⟦U₁..U₆⟧/(U₁U₂)`; `c₁₂ = 0`: `m = 0`; `c₁₂d₂₁ = 0`: `m = 1`; variables `3f + m + 4 − 2f = f + 4 + m` | holds | none |
| 7.1 substitution | `U₁` into Table 4; `U₂` | `z²d₁₂* + z(c₁₂ − p d₁₂*) + b₁₂ − p c₁₂ = v(z d₁₂* + c₁₂) + b₁₂`; `(z − p)d₁₁/v = d₁₁`; `A₂ w diag(1, v^{−1})` is the common matrix at `b = 0` | matches Figure 2 | none |
| 7.3 `p ∈ I_{w̃} + I_{w̃′}` | Table 4 | difference `p(a₂−1)d₁₂* + (a₁+a₂−2)d₁₁d₂₂/d₂₁*`; `a₁ + a₂ ≡ 2`, `a₂ − 1 ≡ ±(r+1)` | holds | none |
| 7.4 | transport of Remark 4.2.5; integer points | `Q₁ = (b₁₂ − p c₁₂, d₁₁, c₂₂, c₂₁, c₁₂ − p d₁₂*, c₁₁)`; `Q₃` likewise; `(0,0,5,0,0,0,25)` kills `Q₁` at `p = 5` | holds | none |
| 7.5 | elimination | `t + p = 2p/(a(a−1))`; `c₂₁ + (2p/a)d₂₁*`; Table 5: `c₁₂ − (2p/(a−1))d₁₂*` | holds | none |

For 3.7, 3.8, 3.9, 0.4, 1.2, 4.3, 5.1, 7.2 and the `ϖ` control of 7.5, the round-2 table carries computed rows; I re-read those statements against the source lines above and found no discrepancy.

**Shape and style.** Every definition has its API and at least three Checks (3.10 has six bullets and five Checks); every theorem has hypotheses and a locator; every layer ends with Examples and Dependencies. Layers are named by their mathematics and their order is forced by the *Needs:* lines. No LaTeX delimiter, pull-request number, path, HTML anchor or process word.

**Remark for the maintainer (no change here).** HilbertModularVarietiesAndShimuraCurvesPartII still cites this roadmap by `T.0`, `T.6–T.7` (its lines 14, 427) and declares on it the gaps `tame-types`, `single-type-rings`, `breuil-mezard-pbt`, which lie outside this roadmap's scope; it also requests Hamann's theorem from DeformationAndDerivedPatchingAlgebra under a second slug, `power-series-cancellation`. Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-11.

## Not verifiable

- Kisin06, Corollary 1.3.15: recorded `uncertified`. It is cited behind BHHMS23 Proposition 3.1.7, which states the result used.
- LLHLM18, LLHL19 and LLHLM23 are cited in their arXiv versions; I did not compare their numbering with the published versions beyond BHHMS23's own citations.

## Source issues

- **Misprint** in BHHMS23 at the note below Table 5, printed page 45: the note says the constants and tails come from Tables 1–2; it should be Tables 2–3, the tables of the two shapes Table 5 covers; affects nothing.
- **Misprint** in BHHMS23 at the proof of Theorem 8.3.9, printed page 102: the type-indexing condition twists the weight by the inverse determinant character while the displayed bijection a few lines later twists by the determinant character; it should use the inverse twist in both places; affects nothing.
- **Gap** in BHHMS23 at Lemma 4.1.2, printed page 27: the "only if" direction concludes from the length of the rational projective cover alone; it should also use that the representations attached to the distinct admissible types are pairwise non-isomorphic; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c63be8b73744f2c1050f827ebbcc1075d258c5d3", "job": "REV-PKG-LocalGaloisDeformationRingsPartII~3", "model": "fable", "worker": "chris-x10"} -->
