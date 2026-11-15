<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6895915563 -->
Review (claude) of eb3c68e

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.6 restates variations of mixed Hodge structure and their admissibility, which MixedHodgeModulesAndIrregularHodgeTheory §§3.1 and 3.3 own

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:457` (§3.6): "define good variations of mixed ℚ-Hodge–Tate structures as variations of mixed Hodge structures (fibrewise `TauCeti.Hodge.MixedHodgeStructure`, HodgeStructures Layer L2) … with Griffiths transversality and the admissibility conditions at infinity of [G08] §5". Also `README.md:25` (Scope) and the *Needs* line of §3.6.

   **Claim.** The notion of a variation of mixed Hodge structure on a smooth complex variety, with transversality and admissibility, is built here on HodgeStructures Layer L2.

   **Witness.** MixedHodgeModulesAndIrregularHodgeTheory, earlier in the merge order and already a supplier here (`README.md:26`, `:113`), states both: `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md:366` (§3.1, the definition on a complex manifold, with Griffiths transversality) and `:395` (§3.3, admissibility on a punctured disc, on a higher-dimensional base and on a smooth complex variety). §3.13(3) of this package already applies that roadmap's limit of "an admissible variation" to these good variations, so the two notions have to be the same one. The cited locator is also wrong: [G08] §5 (pp. 53–63) has no conditions at infinity; they are in §9, p. 87, G08 lines 3812–3820 (Hodge bundles extend to the canonical extension; `N(W_l) ⊂ W_{l−2}`).

   **Exact repair.**

   - §3.6, first sentence: "On a smooth complex variety `X`, a good variation of mixed ℚ-Hodge–Tate structures is a variation of mixed Hodge structure on `X` (MixedHodgeModulesAndIrregularHodgeTheory §3.1) whose weight-graded pieces are sums of Tate structures `ℚ(n)` and which is admissible (§3.3 there). For such a variation with unipotent local monodromy, admissibility along a curve is the pair of conditions of Hain and Zucker recalled in [G08] §9, p. 87, G08 lines 3812–3820: the Hodge bundles extend to the canonical extension, and `N(W_l) ⊂ W_{l−2}`, which says that the relative monodromy filtration is `W`."
   - §3.6 *Needs*: add "MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3".
   - Scope (`README.md:26`) and the supplier contract (`README.md:113`): change "§§3.2–3.3" to "§§3.1–3.3" and add "variations of mixed Hodge structure on a complex manifold (§3.1), of which the good Hodge–Tate variations of §3.6 are the admissible ones with Tate graded pieces".
   - Scope (`README.md:25`): drop "their variations on punctured curves" from what is built on HodgeStructures alone.
   - Layer 3 Dependencies: move the citation out of the "(§3.13)" group and write "MixedHodgeModulesAndIrregularHodgeTheory §§3.1–3.3 (§§3.6, 3.13)".

   **Tested on the instance.** The Kummer variation on `Δ^*`: `N` maps `gr^W_0` onto `gr^W_{−2}`, so `N(W_0) ⊂ W_{−2}`; the supplier's own Check (§3.3, line 411) records it as admissible with relative monodromy filtration equal to `W`. The two formulations agree there, and §3.6's Check on weight one is unchanged.

2. **F02** (P2) §3.13(4) lacks the hypothesis that the symbol is defined over the number field

   **Location.** `README.md:566`: "(4) For a number field `F ⊂ ℂ`, a smooth `F`-variety `X_F` with `X = X_F ⊗_F ℂ` and an `F`-point `x` of the admissible open of a symbol, the fibre at `x` of its variation is the Hodge realization … of the motivic image".

   **Claim.** For every symbol of the paragraph (arguments in `ℂ(X)ˣ`) the motivic image of the symbol evaluated at `x` exists.

   **Witness.** `X_F = Spec ℚ`, `X = Spec ℂ`, `x` the point, symbol `S₄(π)`: its admissible open is `X`, and `x` is a `ℚ`-point of it, but `π ∉ ℚ`, so the motivic realization (stated for arguments in `Fˣ`) takes no input `S₄(π)`. Likewise `S₄(π·t)` at `t = 1` on `𝔾_m` over `ℚ`.

   **Exact repair.** Replace the opening of (4) by: "For a number field `F ⊂ ℂ`, a smooth `F`-variety `X_F` with `X = X_F ⊗_F ℂ`, a symbol whose arguments lie in `F(X_F)ˣ ⊂ ℂ(X)ˣ`, and an `F`-point `x` of its admissible open, …". With this clause the symbol evaluated at `x` has arguments in `Fˣ`. The witness `S₄(π)` is excluded (`π ∉ ℚ(X_F) = ℚ`), and the two uses of (4) are unaffected: §3.13's route evaluates the generic relations, whose arguments are cross-ratios defined over `ℚ`, and §6.3 uses `S₄(t)` on `ℙ¹_F ∖ {0,1,∞}` at `t = z ∈ F`.

3. **F03** (P3) §3.9 cites theorems on real mixed Hodge structures for a rational variation

   **Location.** `README.md:511`: "form a good variation of mixed Hodge–Tate structures, described by Goncharov's Green data in families ([G08] §1.10, Theorem 1.12, p. 19, G08 line 796; §7, Theorems 7.8–7.9, pp. 77–78, G08 line 3399; §9, Theorem 9.1, p. 86, G08 line 3781)".

   **Claim.** These theorems give the variation whose image lies in `L^HT_•(Conf_n)` of §3.6, a Lie coalgebra of rational variations (`L^HT_1 = O(X)ˣ_ℚ`).

   **Witness.** G08 line 796 and line 3781: both theorems are about "the variation of mixed R-Hodge structures" given by the Green datum and its isomorphism with the standard one; G08 line 3861 likewise. The rational setting is elsewhere in the same source: §10.1, setting 5 (variations of mixed ℚ-Hodge structures over a base, `K = ℚ`), p. 92, G08 lines 4016–4019; §10.2, p. 93, G08 lines 4060–4063; §10.3, Theorem 10.3, p. 95, G08 line 4176; §10.4, (235)–(236) and Definition 10.4, p. 97, G08 lines 4237–4254.

   **Exact repair.**

   - In §3.9 replace the parenthesis by: "(the rational variation of the fundamental Lie algebra with tangential base point, the action of the Lie algebra of the category by special derivations and the resulting correlator map: Goncharov [G08], §10.1, setting 5, p. 92, G08 line 4016; §10.2, p. 93, G08 line 4060; §10.3, Theorem 10.3, p. 95, G08 line 4176; §10.4, (235)–(236) and Definition 10.4, p. 97, G08 line 4237. Its underlying real variation is the one given by Goncharov's Green data in families, which is what the period maps of §3.7 read: §1.10, Theorem 1.12, p. 19, G08 line 796; §7, Theorems 7.8–7.9, pp. 77–78, G08 line 3399; §9, Theorem 9.1, p. 86, G08 line 3781)", and change "described by Goncharov's Green data in families" to "whose underlying real variation is described by Goncharov's Green data in families".
   - In `sources.toml`, entry `G08`, add "§§10.1–10.4, Theorem 10.3 and Definition 10.4, pp. 92–97" to `locator`.

Three findings: two P2, one P3. Both findings of the previous review are repaired. The three new findings all sit in passages the last repair added or relies on (§§3.6, 3.9, 3.13): an ownership overlap with a supplier the repair itself introduced, one missing hypothesis, and one set of locators that supports the real but not the rational statement. `Suggested.lean` elaborates with `sorry` as the only warning and has no padding.

## Verified sound

### The two findings of the previous review

| Previous finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2), the universal lift needs an extension and a specialization construction | New §3.14, `README.md:586`: "Define `sp_v: Rawₙ(F) → Rawₙ(k)`, `n = 3, 4`, by the table of §1.2 read with `a = v(x)`, `b = v(y)`", with (1) relation preservation, (2) cobracket compatibility for every uniformizer, (3) valued-field extensions, (4) point evaluation. §5.7, `README.md:899`: "The open content of the target is the vanishing in (a) and (b) and the regularity (d)." Both requested Checks are present (`README.md:911`, `:912`); §§5.7–5.9 *Needs* list §3.14. | repaired |
| F02 (P2), the number-field realization does not give realizations in complex families | §3.13, `README.md:561`: "defines a morphism of graded Lie coalgebras `r_X: U ⊕ B₂ ⊕ L₃ ⊕ L₄ → L^HT_•(η_X)` of the combinatorial Lie coalgebra of `ℂ(X)`", with properties (1)–(4); §3.9 defines the Hodge correlator variations over `Conf_n`; Conventions (`README.md:32`), §§5.1, 5.4, 5.7 and 6.3 use `r_X`. The requested Check on `S₄(t)` is at `README.md:581`. | repaired |

No finding of the repair report was marked not actionable. The repaired patterns were searched for in the rest of the text. Specialization outside `K(t) → K` occurs in §§5.3, 5.8 and 5.9 and each now cites §3.14. The motivic realization is applied only to number fields (§§3.8, 3.11–3.13, 5.7 motivic lift, 6.2–6.4); §5.2 uses no motive. R01–R03 are what the pass over the new passages found.

### Adversarial table

Fresh rows are for every passage the repair changed or added, the sampled targets and the headlines. Rows marked "r5" rely on the computed values of the previous review's table for text the repair did not touch (compared line by line with the current README where a value is quoted).

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.2 table against §1.5 formula (sampled 1.5) | GR bracket `[a,b,c,d] = s`; (30) term by term | `s(∞,0,x,1) = 1−1/x`; `s(∞,1,y,0) = y/(y−1)`, inverse of `1−1/y`; `s(∞,y,0,x) = x/y`, inverse of `y/x`; `s(∞,x,1,y) = (1−y)/(1−x)`; `s(0,x,1,y) = x(1−y)/(y(1−x)) = (1−1/y)/(1−1/x)` | README formula equals GR (30) up to inversion in `B₃`; sound |
| §1.6, §3.1 formulas on degenerate generators | `D₂₁(1,y)`, `D₂₁(x,x)`, `D₃₁(x,1)`, `D₃₁(x,x)`, reading `u(a/b) = u(a) − u(b)`, `u(0) = 0`, `[∞]₂ = 0` | `δD₂₁(1,y) = [y]₂⊗u(1−y)`, equal to `δ(−S₃(1−y))`; `δD₂₁(x,x) = 2[x]₂⊗(u(1−x)−u(x)) = δ(2S₃(1−1/x))`; `δD₃₁(x,1) = −S₃(1−x)⊗u(x) + S₃(x)⊗u(1−x) − S₃(1)⊗u(1−1/x)`, equal to `δ` of (33) by the three-term relation; `δD₃₁(x,x) = 0` | total formulas give the specialized values; reading `u((1−x)/0)` as `u(0)` would lose `S₃(x)⊗u(1−x)`, and the Conventions' multiplicative reading excludes it |
| §1.4 (sampled) | `Q₄` against GR (32); (33) at `x = −1` | signs `−,+,−`, single terms `−S₄(s(1,2,4,6))`, `+3S₄(Z)`: identical; `D₃₁(−1,1) = −2S₄(2) + S₄(−1)` | sound |
| §2.2 flip identity | all 12 wedge terms with Plücker `Δ₁₃Δ₂₄ = Δ₁₂Δ₃₄ + Δ₁₄Δ₂₃` | `(1+X)∧X` expands to 12 terms after `23∧14 + 14∧23 = 0`; `W_T − W_T′` has the same 12; `X = 6` gives `u(7)∧u(6)` | sound |
| §2.3 square | vertex forms `W, W+δA, W+δA+δB, W+δB` | edge sum `−2A⊗δB + 2B⊗δA`; `δ(2B∧A) = 2(B⊗δA − A⊗δB)` | sound |
| §3.2 (sampled) | `[1]`, `[2]`, `[x]+[x⁻¹]` | `u(1) = 0`; `[2]₃⊗u(2)` pairs to `7ζ(3)/8`; `b(x⁻¹)⊗(−u(x)) + b(x)⊗u(x) = 0` | sound; r5 for the value |
| §3.3 (sampled) | cokernel of `Γ → CE` | degrees 1, 2 only: `Λ²B₂ → Λ²B₂`, identity, so acyclic; GR line 702 has the same argument | sound |
| §3.5 (sampled) | weight one, `n` finite punctures | cyclic words of length two: `n(n+1)/2`; special derivations: `n(n−1)` parameters, `n(n−1)/2` conditions, so `n(n−1)/2`; difference `n` = the pure words | the reduction by pure words is needed, as stated; G08 line 4175 removes the same summand |
| §3.8 (sampled) | `(0,1,y)` | cuts `u(−1)∧u(1−y) + u(1−y)∧u(y) + u(y)∧u(−1) = (1−y)∧y`; `s(∞,0,1,y) = 1−y`, so (67) gives `−Li₂^M(1−y)` | sound |
| §3.9 (sampled), weight two | M20 (4) against its example | (4): `L₂((0−1)/(z−1)) = L₂(1/(1−z)) = L₂(z)`, coefficient `+1`; example: `−1/2` | the README's reading of the inconsistency is right; `c_m` kept as a target constant |
| §3.13 realization, signs against §1.2 (changed) | partial collisions of the words | `D₃₁`, `x → 0`: `Cor(0,0,0,1,v₀)`, table `+S₄(v₀)`; `D₂₁`, `x → 0`: `−Cor(0,0,1,v₀)`, table `−S₃(v₀)`; `D₃₁`, `y → 0`: `Cor(0,0,0,1,1/u₀)`, table `−S₄(u₀)`; `D₂₁`, `y → 0`: `−Cor(0,0,1,1/u₀)`, table `−S₃(u₀)` | (3) agrees with the table in each case tried |
| §3.13(4) (changed) | `X_F = Spec ℚ`, `S₄(π)` | admissible open `X`, `x` a `ℚ`-point, `π ∉ ℚ` | R02 |
| §3.13 use at collisions (changed) | regular class with `x(y₀) = y(y₀)` | pull back along a curve through the point: (2), then (3) with `X` a point and `a = b = 0`; continuity from §3.10, the word never reaching the full diagonal since `0 ≠ 1` | point values of periods follow from (2), (3), §3.10; sound |
| §3.14 `sp_v` independent of `π` (added) | Gauss valuation at 2 on `ℚ(t)`, `π = 2` and `2(1+t)` | `D₃₁(2,t) ↦ S₄(t)`; `S₄(2t) ↦ 0`; `D₃₁(1/2,t/2) ↦ 3S₄(1/t)`; `sp_π(2) = 0` against `u(1/(1+t))` | sound |
| §3.14(2) on `L₃` (added) | `S₃(x)`, `v(x) = 1`; `v(x) = 0`, `x̄ = 1`; `D₂₁`, `a > 0 = b`; `D₂₁`, `a = b < 0` | `0 = 0`; `δS₃(1) = 0` and `sp[x]₂ = 0`; `[1−v₀]₂⊗(u(v₀)−u(u₀)) − [v₀]₂⊗u(u₀) = −[v₀]₂⊗u(v₀)`; `2[v₀/u₀]₂⊗u(v₀/u₀) = 2[u₀/v₀]₂⊗u(u₀/v₀)` | sound for every `π` |
| §3.14(2) on `L₄` (added) | `D₃₁(2,t)`, both uniformizers | `π = 2`: `S₃(t)⊗u(t) + 0`; `π = 2(1+t)`: `S₃(t)⊗u(t) + S₃(t)⊗u(1+t) − S₃(t)⊗u(1+t)` | both `δS₄(t)`; sound |
| §3.14(1) on `B₃` (added) | three-term element, `x̄ = 1` and `v(x) > 0` | `[1] + 0 + 0 − [1] = 0`; `0 + [1] + 0 − [1] = 0` | consistent with `[1]₃` retained |
| §3.14(4) (added) | `S₄((s+2t)/t)`, `S₄(2+s+t)` at the origin; intermediate fields | `S₄(2)` against `0`; `S₄(2)` both ways; fraction field of a local domain of positive dimension is infinite | well defined on regular classes only; sound |
| §3.14 residue field (added) | 3-adic valuation, five-term element at `(−1,4)` | arguments `−1, 4, −4, 8/3, −2/3` reduce to `[−1], 0, [−1], 0, 0`: `2[−1] ≠ 0` in `P(𝔽₃)⊗ℚ` | hypothesis needed; agrees with Polylogarithms §3.3, line 396 |
| §5.7 Check, moment curve (added) | `t = (2,3,4,5,6,8/5,0,1)`, exact rationals, all `8!` permutations | 70 of 70 minors nonzero; `ρ = (4, 5/2, 2, 4)`; 720 permutations with a coincidence, 144 with `ρ₁ = ρ₄`, 288 with `ρ₁ = ρ₃`, 288 with `ρ₂ = ρ₄`, 0 adjacent | every number of the Check confirmed |
| §5.7 scheme `𝒞` (added) | dimension; a fibre | `8·3 − 15 = 9`; frame for five points, the other three with all coordinates nonzero, so open in `𝔸⁹_ℤ`; distinct Vandermonde parameters exist over every infinite field | sound |
| §5.7 uniqueness Check (changed) | nine faces | `Σ_{i=0}^{8}(−1)^i = 1`, so `c = 0` | sound |
| §5.7 (e), (iii) (added) | `x` over `O_v`, mixed characteristic | a unit of the local ring at the image of `x̄` pulls back to a unit of `O_v`; reduction mod `p` represents `ℓ_p` by (d) | follows from (c), (d) and §3.14(4) |
| §4.1 (sampled) | degrees 4, 5, 6 | `BC₄ = 0`, `BC₅ = C₅(4)`; `C₆(4) → C₅(3)` killed | sound; r5 for the mixed-face signs |
| §4.4 (sampled) | `N = 4`; `𝔽₂`, `N = 2` | flag length 1, `t` the identity; three lines only | sound; GR lines 4276–4291 give the `GL₃`-invariant section |
| §4.7 (sampled) | Example 10.6; three-term sum | GR line 4393: 10; GR line 4395: 55; `[x]+[1−x]+[1−x⁻¹] = [1]₃`, killed by `δ₃` | sound; ranks recomputed in r5 |
| §5.1 (sampled) | `z = i` on `∂θ` | `dR(S₄) = (2/5)i(5/16)(−3ζ(3)/32) = −3iζ(3)/256`; `R([z]₃⊗z) = (2/5)(5/6)(−9ζ(3)/256)i = −3iζ(3)/256` | sound |
| §5.3 (sampled) | two coordinate divisors | `ū∧w̄` and `−ū∧w̄`; degrees `1+2 = 3`, `0+8 = 8` | sound; r5 |
| §5.5 (sampled) | `a₁⟨∞,0;1,2⟩` and a rescaled lift | `r(∞,0,1,2) = 2`; `(1·(−6))/(3·(−1)) = 2` | sound; r5 for the triangle and tetrahedron values |
| §6.1 (sampled) | degrees | `(7,1), (6,2), (5,3), (4,4)`; `ℚ(t)`, `𝔽₂(t)` infinite, not number fields | sound |
| §6.3 (sampled) | zero cycle, `[x]+[x⁻¹]`, `[i]` | `0`; `L₄(x) + L₄(1/x) = 0`; `p = β(4)/8 ≈ 0.123618` | containment only; sound |
| `polylog` (Lean) | `n ≥ 2` | `∫₀¹ t^{k−1}(−log t)^{n−2}dt = (n−2)!/k^{n−1}`, times `1/k` from `−log(1−tz)`: coefficient `1/kⁿ` | body is `Liₙ` |
| `singleValued 4` (Lean) | Bernoulli terms | `k = 0`: `Li₄`; `k = 1`: `2·(−1/2) = −1`; `k = 2`: `4·(1/6)/2 = 1/3`; `k = 3`: `0` | Zagier's `L₄`; equal to PolylogarithmFunctions' definition at natural weights |
| `trilogCyclic`, `TrilogRelationFunction`, `unitVector` (Lean) | text against Polylogarithms' `Suggested.lean` | identical bodies, different namespace; constant `b ≡ v`: block `2v`, relation `7v` | sound; no shared fully qualified name |
| `zagier_four_exists` | `ℚ`; `ℚ(i)` with `[i]` | `π⁴ = 90ζ(4)`; `π⁴β(4)/2 = 45ζ(4)β(4)` | `q = 90`, `q = 45`; nonzero multiple needed |
| `zagier_four_everyFamily` | zero column; conjugate embedding | determinant `0`, `q = 0`; row negated, `q ↦ −q` | sound |

### Sources: the seeded sample

All seven texts were read from the cache; no locator was flagged unverified by the author. For each of the 15 targets the locator was opened and the statement compared.

- **1.4**: GR Definition 1.11 and (32), p. 12, GR line 505; (33), GR lines 519–521. Formula and signs agree.
- **1.5**: GR (29)–(31), p. 12, GR lines 494–503; Lemmas 5.1–5.2, p. 54, GR lines 2391, 2421. The source defers the isomorphism to another paper (GR line 503); the README gives its own route and the declared gap.
- **3.2**: GR Definition 1.11, GR line 517; Theorem 1.14(c) and (44), p. 16, GR lines 682–700.
- **3.3**: GR Theorem 6.1, p. 57, GR line 2604; Lemmas 6.2–6.6 and Corollary 6.5, GR lines 2638–2733; Corollary 1.15, GR line 701. Infinite fields: GR line 393.
- **3.5**: GR Theorem 2.1 with (62)–(63), pp. 26–27, GR lines 1155–1177; G08 Lemma 8.1 and Propositions 8.2–8.4, pp. 84–85, G08 lines 3667–3713.
- **3.8**: GR §2 items 2–5, GR lines 1122–1262: (64)–(67), Theorem 2.2. The README's sign change against Theorem 1.13 (GR lines 665–669) is stated and recomputed.
- **3.9**: M20 (3), p. 3, M20 line 114; (4), p. 4, M20 line 145; Theorem 6(a), p. 13, M20 line 626; example, p. 18, M20 lines 889–895; G08 line 4632. The three G08 theorems are at the lines given but concern real structures: R03.
- **4.1**: GR (129)–(130), pp. 62–63, GR lines 2826, 2866; (159), p. 69, GR line 3209.
- **4.4**: GR (240), p. 94, GR line 4285; §9.1, pp. 86–87, GR lines 3962–3982.
- **4.7**: GR Definition 10.2, p. 95, GR line 4350; Example 10.6 and Definition 10.7, p. 97, GR lines 4393–4406; evaluation to `B₃(F)`, GR line 4411.
- **5.1**: GR (190)–(191), p. 77, GR lines 3588, 3595; G08 p. 105, G08 line 4628 (the differential equation of `L*ₙ`).
- **5.3**: GR Theorem 8.1 with (171), pp. 72–73, GR lines 3377–3397; the homotopy for the general case, GR lines 3425–3427; Theorem 8.6, p. 80, GR line 3700.
- **5.5**: G00 §2, PDF pp. 5–6, G00 lines 149–196; `a₁`, G00 line 178.
- **6.1**: GR Theorem 1.3(i), p. 6, GR lines 230–232; GR lines 4274–4291; number subfield, GR lines 4236–4239; GR lines 1126–1127.
- **6.3**: GR Theorem 1.13, pp. 15–16, GR lines 660–671; GR line 1075.

Also read for the new text: GR footnote 4, GR line 465; GR lines 3554–3556 (the map to `L^HT_•(η_X)`); CGR Theorem 9 and Remark 10, p. 8, CGR lines 440–466 (denominator `ρ₁ − ρ₄` at lines 448–450); GR Theorem 1.2, GR lines 196–200.

### Lean form, headlines and padding

- **Elaboration.** `lake env lean` on the absolute path of `packages/ZagierConjecturePolylogarithms/Suggested.lean`, from the content checkout: exit 0, two warnings, both `declaration uses sorry` (lines 124, 133). One import, `import Mathlib`; no `set_option`, `lemma`, `#eval`, `#print` or sorry'd data.
- **One-tactic probe, every sorried theorem.** On a scratch copy, both theorems were tried with `rfl`, `simp`, `infer_instance`, `exact ⟨0, by simp⟩`, a zero-family witness closed by `simp`, `exact riemannZeta_four`, `aesop` and `decide`: 16 probes, 16 failures. No padding.
- **`#check @name`** for all ten declarations in the same scratch file: `[Field F]` on the field-level definitions, `[NumberField F]` on `periodMatrixFour`, `zagierDeterminantFour` and both theorems, `hc : ∀ j, IsCycle4 (c j)` on `zagier_four_everyFamily`. They equal README §6.4.
- **Headlines.** The README's end theorems are `zagier_four_exists` and `zagier_four_everyFamily`, both stated. The extension theorem with the cluster map and cobracket, the two realizations with base-point change and depth reduction, collision continuity, the configuration chain map and Chern cocycle, and the K-theory maps with the regulator comparison are each named in the module docstring with the missing carrier. Checked at the pins: no polylogarithm, Bloch group, K-group of a field or variation of mixed Hodge structure (the word occurs in docstrings only); `TauCeti/Algebra/Homology/AInfinity/Stasheff.lean` holds the `A∞` identities, not the polytope cell complexes of §2.1.
- **Names.** The ten backticked names the README attributes to this roadmap are the ten declarations of the Lean file, and conversely.

### Pinned declarations opened

Mathlib: `Finsupp.linearCombination` (`LinearAlgebra/Finsupp/LinearCombination.lean:54`), `Submodule.mkQ` (`LinearAlgebra/Quotient/Defs.lean:227`), `exteriorPower.ιMulti` (`LinearAlgebra/ExteriorPower/Basic.lean:56`), `ExteriorAlgebra.exteriorPower` (`LinearAlgebra/ExteriorAlgebra/Basic.lean:79`), `Matrix.det_isEmpty` and `Matrix.det_mul` (`LinearAlgebra/Matrix/Determinant/Basic.lean:97`, `:141`), `FreeLieAlgebra` (`Algebra/Lie/Free.lean:121`), `LieDerivation` (`Algebra/Lie/Derivation/Basic.lean:43`), `groupHomology` (`RepresentationTheory/Homological/GroupHomology/Basic.lean:226`), `ProjectiveResolution` (`CategoryTheory/Preadditive/Projective/Resolution.lean:41`) and its `lift` between two projective resolutions (`CategoryTheory/Abelian/Projective/Resolution.lean:92`), `NumberField.dedekindZeta` (`NumberTheory/NumberField/DedekindZeta.lean:50`), `NumberField.discr` (`NumberTheory/NumberField/Discriminant/Defs.lean:36`), `InfinitePlace.embedding`, `IsComplex`, `nrRealPlaces`, `nrComplexPlaces` (`NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, `:188`, `:437`, `:441`), `bernoulli_one` (`NumberTheory/Bernoulli.lean:207`).

Tau Ceti: `MixedHodgeStructure` (`Geometry/Hodge/Mixed/Basic.lean:72`), `MixedHodgeStructureCat` (`Mixed/Category.lean:56`), its `abelian` instance (`Mixed/Abelian.lean:33`), `Hom.range_inf_F_eq_map_F` (`Mixed/Strictness.lean`), `tate` (`Tate/Basic.lean:93`).

### Suppliers, gaps and order

Every cross-roadmap citation was resolved against main or the open head.

- **Polylogarithms** (open): §2.1 `blochWignerDesc` (line 139), §2.2 `stableK_hurewiczPrimitive` (168), §3.1 `trilogGroup` (313), §3.2 predicates (356), §3.3 unit-part homomorphism (380) and the `𝔽₃` Check (396), §3.4 `genericVectorConfig`, `stabilizedConfigurationComparison` (400–402), §3.5 `r₆ = 18M₃` (461), §§3.6–3.7, §§4.1–4.7 with `zagierPeriod_calibration` (660), `explicitRawCycleFour` (679), `cycleObstruction` (701), `zagierExistence_totallyRealEven` (722), Layer 5 §§5.1, 5.2, 5.4, 5.5, 5.9.
- **K3BlochGroups** (open): §§3.2–3.5, 3.8 (lines 593–826); §4.21 `preBloch_rationalSpecialization` with `|k| ≥ 4` (line 1761), the hypothesis §3.14 meets with an infinite residue field.
- **MixedHodgeModulesAndIrregularHodgeTheory** (open, earlier in the order): §§3.2–3.3 (lines 384, 395), as described; §3.1 is R01.
- **PeriodsAndSpecialValues** (open): PS.3.0 (752), PS.9.3 (2085), PS.9.8–PS.9.10 (2190, 2211, 2231).
- **BorelRegulators** (open): §§1.1, 2.2, 2.3, 5.3, 5.4, 6.0a, 6.2 (lines 171–795).
- **MotivicEtaleKTheory** (open): §§3.3, 3.4, 7.1 (398, 421, 651). **MotivesAndAlgebraicCycles** (open): §3.6, Layer 4, §§6.1–6.3 (537, 556, 1117–1150).
- **PolylogarithmFunctions** (main): §§1.1, 4.2, 4.6, 4.7, 5.1, 5.2, 5.7. **HodgeStructures** (completed, main): Layer L2.

The four declared gaps have the same slugs in `design/plan.json` and in the README, each with a named supplier and section, a single precise `needs` sentence with its hypotheses, and nothing the supplier already states at that generality (Polylogarithms §3.1 has no specialization closure; its §3.4 comparison is stated for the weight-three flags; PS.9.8–PS.9.10 are over `ℤ`, `ℚ` and the three-punctured line). The acceptance of a later round would be conditional on them.

Dependency check:

```text
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The overlaps ledger lists no other pull request changing this roadmap, no dropped id and no id only a revision defines; this package drops no section (§3.14 was appended).

Duplication by object: searched the pins and the supplier texts for polylogarithms, Bloch groups, Stasheff cells, cyclic shuffle coalgebras, special derivations, framed Hodge–Tate structures, Hodge correlators, scissors-congruence groups, Grassmannian configurations and specialization of Bloch symbols. The only shared object found is the one of R01. Polylogarithms §4.1 specializes its inductive groups, a different presentation from `L₃`, `L₄`.

Overlap check: read Polylogarithms, BorelRegulators, K3BlochGroups, PeriodsAndSpecialValues, MotivicEtaleKTheory and PolylogarithmFunctions; variations of mixed Hodge structure and their admissibility are shared with MixedHodgeModulesAndIrregularHodgeTheory, owner MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3 (R01); decorated flags and their acyclic resolution, owner Polylogarithms §3.4 (declared gap decorated-flag-lengths); the weight-four theorem, `L₄*`, `κ` and the transfer to inductive cycles, owner this roadmap (Polylogarithms lines 22, 681, 1554); nothing else shared.

### Shape, style and copyright

- Six layers, each with Examples and Dependencies; every definition has an API list and at least three Checks; every theorem target has hypotheses and a locator. The layers are the roadmap's own: against GR's table of contents (§§1–10), Layer 1 draws on §§1.2 and 5.1, Layer 2 on §§1.3, 3 and 4, Layer 3 on §§2, 5.2, 6 and 8.2, Layer 4 on §§7 and 10, Layer 5 on §§8 and 9 with G00, G09, CGR and G93, Layer 6 on §§1.1 and 9.3. No run of layers maps one to one onto a run of sections.
- No process words, pull-request numbers, paths, HTML anchors or LaTeX delimiters in the README or the Lean file (pattern scan, no hit).
- Wording: nine passages compared with five sources: §1.4 with GR Definition 1.11; §1.5 with GR (30); §3.4 with GR lines 1159–1171; §3.9's tree integral with M20 lines 104–122; §3.9's variation with G08 lines 780–798; §5.5's relations with G00 lines 155–175; §6.1 with GR lines 4274–4291; §6.4 and the docstring of `zagier_four_exists` with GR lines 196–200; §5.7's candidate with CGR lines 440–466. Formulas agree where the mathematics forces them; no sentence is taken over, and no table, figure or list is reused.

Source independence: 9 passages compared with 5 sources, none shared; largest share GR, 64 of 117 locators; contents compared with GR: independent.

## Not verifiable

- The truth of the owned research-level targets: §3.14(1) for an arbitrary discrete valuation with infinite residue field, the family realization of §3.13, and the vanishing and regularity (a), (b), (d) of §5.7. They were tested on the instances in the table, not proved; see the last section.
- The full `8!` alternation of §4.8, the tetrahedron coassociativity of §5.5 and the off-unit-circle finite differences of §5.1 were not rerun; the previous review's rows carry their computed values and the text is unchanged.
- G93 was read through OCR; its two locators (§5.9, §5.10) are outside the sample and were not reopened.
- Ownership was checked against main, the board index and the open heads the tools serve; the two other board packages (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened, their subjects being disjoint.

## Source issues

- **Error** in GR at Theorem 1.2, printed p. 5, GR line 199: the source states an exact equality of the determinant expression with the zeta value for every number field; it should allow a nonzero rational factor, which is 90 over the rationals; affects a stated result.
- **Gap** in GR at §9.3 item 2, printed p. 93, GR lines 4236–4243: the source obtains a map to the combinatorial complex from motivic expressions over a number subfield; it should give a lift compatible with relations and cobracket over every infinite field; affects the proof.
- **Error** in M20 at (4) and the example after (16), printed pp. 4 and 18, M20 lines 145 and 895: the two weight-two values differ by the factor minus one half; it should use one normalization; affects a stated result.

The other source issues recorded by the previous review (GR (99), (187)–(192), §9.3 footnote 24, the coefficient before Lemma 9.6, Definition 10.7's evaluation, Lemma 7.9; M20 (3)) lie in text this round did not reopen and are not repeated here. The README's sign change against GR Theorem 1.13 and its own route for GR (31) were read as the roadmap's choices, not checked as mistakes of the source.

## For the human reviewers

- **Scope.** `README.md:899` states that part of the §5.7 target is open; §§5.8, 6.1 and 6.2 use it, so `zagier_four_exists` rests on it. `zagier_four_everyFamily` (§6.3) does not.
- **Scope.** The main source GR is cited as an arXiv preprint (v5) only, in the README and in `sources.toml`; this and the previous review record gaps in its proofs of Theorems 1.3 and 1.13.
- **Scope.** Polylogarithms' scope sentence (its README line 22) lists "decorated flags" among what this roadmap owns, while its own §3.4 states them and the declared gap names §3.4 as supplier.
- **Licence.** G93 is read from the author's page (`sources.toml`, `licence_class = "author-page"`), an OCR of a 1993 volume chapter.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eb3c68e89c8072dc5dfb495055b4c6a90e55a0aa", "job": "REV-PKG-ZagierConjecturePolylogarithms~6", "model": "fable", "worker": "chris-x52"} -->
