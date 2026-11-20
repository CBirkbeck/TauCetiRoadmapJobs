# Review of NewtonPolygons (pull request #2609 at 5007ca6)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the Eisenstein target of §6.1 is false for the constant polynomial `1`, which satisfies Mathlib's `Polynomial.IsEisensteinAt` and is not irreducible; the hypothesis `d ≥ 1` is missing. Everything else computed in this round holds, including the six statements of `Suggested.lean`, which elaborate with `sorry` as the only warning and none of which closes by one tactic. There are four small corrections and one format note, none blocking, and two points for the human reviewers.

## R01 (P2) — The Eisenstein target of §6.1 is false in degree zero: `1` is Eisenstein in Mathlib's sense and is a unit

An implementer who formalises the bullet as written proves a false statement. In §6.1 (lines 872–875) the target reads "a monic `f ∈ O[X]` of degree `d` satisfying Mathlib's `Polynomial.IsEisensteinAt` at the maximal ideal has … the single slope `-1/d` with multiplicity `d`, and is irreducible over `K`".

Take `f = 1`, `d = 0`. Mathlib's structure (`Mathlib/RingTheory/Polynomial/Eisenstein/Basic.lean:57`) asks for `leadingCoeff ∉ 𝓟`, `coeff n ∈ 𝓟` for `n < natDegree`, and `coeff 0 ∉ 𝓟 ^ 2`. For `f = 1` these are `1 ∉ m`, a vacuous condition, and `1 ∉ m²`, so all three hold. But `1` is a unit, hence not irreducible, and its polygon is the single point `(0, 0)`. The theorem the bullet says it recovers carries exactly the missing hypothesis: `Polynomial.IsEisensteinAt.irreducible` (same file, line 232) has `hfd0 : 0 < f.natDegree`. Tau Ceti's valuation form (`TauCeti/NumberTheory/NewtonPolygon/Irreducible.lean:142`) escapes the case because `v(leadingCoeff) = 0` and `v(coeff 0) = 1` force positive degree.

The smallest change: "a monic `f ∈ O[X]` of degree `d ≥ 1` satisfying …". The Check below it (line 885, endpoints `(0, 1)` and `(d, 0)`) needs the same two characters. `f = 1` would make a good negative-control Check.

## C01 — The converse-and-uniqueness bullet of §5.3 names neither its field nor what "zero divisor" means

In §5.3 (lines 823–827), "two entire series with constant term one and the same zero divisor are equal" depends on a term the README never defines, and the bullet states no field. If the divisor is read as the zeros in the coefficient field, the sentence fails over `ℚ_p`: `1` and `1 - X²/p` are entire with constant term one, and neither has a zero in `ℚ_p` (the second is irreducible, as the Layer 4 examples say). The last clause, "over an algebraically closed field an entire series with finitely many zeros is a polynomial", also needs completeness: over the algebraic closure of `ℚ_p` one can choose coefficients `c_k` there with `Σ c_k β^k = 0` for a transcendental `β ∈ ℂ_p`, decaying as fast as one likes.

The Product bullet just above already has the right frame. Opening this bullet with "Over a complete algebraically closed field, with the zero divisor the multiset of zeros with multiplicity" makes all four clauses true as written.

## C02 — The purity sentence of §2.4 lost the slope `m` from its right-hand side

In §2.4 (lines 554–557), "all finite slopes equal `m` exactly when the coefficient points lie on or above the line through the first and last points" has a right-hand side that does not mention `m`. For `1 + pX` it holds for every `m`, while the left side holds only for `m = 1`. The lemma it paraphrases, `Polynomial.forall_mem_newtonSlopes_eq_iff` (`TauCeti/NumberTheory/NewtonPolygon/Slopes.lean:432`), says the line of slope `m` through the first point passes through the last point and lies on or below every point. Inserting "that line has slope `m` and" restores the equivalence.

## C03 — In the Check of §2.3 the secant slopes `⌈√n⌉ / n` do not decrease

The Check of §2.3 (lines 538–539) says these slopes "decrease to `0` without reaching it". They are `1, 1, 2/3, 1/2, 3/5, …`: the value at `n = 5` exceeds the value at `n = 4`. What the Check uses is true and enough: they are positive and tend to `0`, so the infimum `0` is not attained and the polygon is the horizontal ray. "tend to `0` without reaching it" would be exact. (The other two "decrease" claims, in the Checks of §0.1 and §0.2, are monotone as stated.)

## C04 — Four locators point at text that does not contain the statement they are attached to

A reader who opens the source at these places finds something else.

- §4.3 (line 731) cites Lazard §3 for analytic multiplicity and exact counts. Lazard §3 has the factorisations only (Propositions 2 and 4, Lazard line 288 and line 358), and Lazard says at the start of §4 that §3 never mentions zeros or their multiplicities (Lazard line 415–419). The root-norm reading is (2.7′) (Lazard line 209–210). Citing "Propositions 2 and 4 with (2.7′)", and saying that the Hasse-derivative multiplicity is the roadmap's own definition, would be accurate.
- §0.6 (line 322) cites Lazard §1 for slope presentations. Lazard §1 (Lazard line 65–148) has the Newton function, the Legendre duality and the indices `n`, `N`; it has no slope data, raw segment lists or reconstruction. These targets are elementary and can stand without a source.
- §5.2 (line 794): Lazard p. 48 gives the convergence criterion (Lazard line 73–81), which supports the Converse bullet; the Point-radius bullet is not there.
- §6.1 (line 872): the Eisenstein bullet has no locator; "by direct computation from the Eisenstein conditions", as §6.5 does, would say so.

The last two were noted in the previous round and are unchanged.

## N01 — RestrictedPowerSeries has a Layer 7, not a §7

The citations "RestrictedPowerSeries §7" (lines 853, 1048, 1285) resolve to that roadmap's "Layer 7: Open-disc, entire and overconvergent series" (§§7.1–7.2 are the parts used). "Layer 7" or "§§7.1–7.2" would match its headings, as the other citations of it do.

## Previous findings

The previous review read this same head and had no finding. Its one format note (two locators one bullet away from their claim, §5.2 line 794 and §6.1 line 872) is not repaired, since the folder did not change; it is the last two items of C04.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| §0.1 polygons: sup, inf, envelope (sample) | `n` and `2 − n`; `P = ⊤` | Min `0,1,0,−1,…`; `2·1 > 0+0`. Secants `(2−n)/n → −1`, not attained; `−n ≤` both. Lower bound `min c + min m · n` | true |
| §0.2 walk, vertices, slope multiset (sample) | `(0,0,1/2,1/3,…)`; `⌈n√2⌉`; `(0,1,2)`; slopes `0` then ray `1` | Secants from 1: `(1/n)/(n−1) ↓ 0`, 1 not a vertex. `⌈n√2⌉/n > √2`. Multiset `{1,1}`, sum `2`. Vertices `{0,1}` | true |
| §0.3 trichotomy (sample) | slopes `1 − 1/(n+1)`; `n²`; `0,1,0,1,…` | Case 3: `h(n) − n = −H_n → −∞`, `S_h(1) = ⊥`. Case 1: faces `[n, n+1]`. Case 2: ray, face at `0` infinite | true, cases exclusive |
| §1.3 extensions and completion (sample) | `√p`, `∛p`; trivial norm; `ℚ_p(√p)` | `v_p = 1/2, 1/3`; `‖x‖^d = ‖N(x)‖` gives commensurability; `e = 2 ≤ 2` | true; Neukirch not readable |
| §2.2 local form (sample) | `1 − pX`, `σ = 2` and `σ = 1` | `S(2) = min(0, 1−2) = −1 = −log_p p`. At `σ = 1`: left derivative `0`, right `−1`, slope `1` | true; Lazard (1.8)–(1.9) |
| §2.3 faces, unit criterion, `finiteFace_of_gaussExtrema` (sample) | `1 + Σ p^⌈√n⌉ Xⁿ` at `r = 1`; `f = 0`; non-complete `K` | Contact set at slope 0 is all of ℕ, so `r < s` needed (present). `0 < 0` excludes zero. `(1−g)⁻¹ = Σ gᵏ` restricted | true; C03 on wording |
| §2.4 first breaks (sample) | `(0,0,1/2,1/3,…)`; `1 + pX + p²X²`; `1 + pX` | No break at 1 (secants → 0). Heights `0,1,2` pure. `max(L, L') ≤ c` gives slope `≥ τ > σ₀` at `j` | true; C02 on purity sentence |
| §3.2 local product law (sample) | `(1−X)·ΣXⁿ = 1`; `(1−X)(1−pX)` | `σ < 0`: faces `{0}+{0}={0}`. Globally ray ≠ point. Heights `0,0,1` = `(0,0) ⊕ (0,1)` | true; Lazard Prop. 1 |
| §3.3 roots, ball counts, realisability (sample) | `X²(1−pX)`; empty multiset | Slope `1` ↔ root `1/p`, valuation `−1`; `l = 2` zero roots. Empty ↦ polynomial `1` | true; Kedlaya Cor. 3, sign reversed |
| §4.1 `discFactor_unique` | `(1−X)(1−pX)`, `r = 1`; `d = 0` | `d = 1`: `(1−X, 1−pX)` ok, `‖−pX‖ = 1/p`; swap gives `‖−X‖₁ = 1`, excluded. `d = 0`: `(1, f)` | true; Lazard Prop. 4(2) |
| §4.2 vertices, `existsUnique_slopeFactors` (sample) | constant `f`; `X² + X + 2` over ℚ, 2-adic; trivial norm; `X² − p²` | Empty index: `f = C f₀ · 1`. Slopes `{−1,0}` but irreducible over ℚ: completeness needed (present). Trivial: one factor `f/f₀` | true; Kedlaya Th. 7, §5 |
| §4.3 `discPolynomial_root_counts` (sample) | `X − α` with `‖α‖ <, =, > r`; `P = 1` | `l = 1, 0, 0`; `u = 1, 1, 0`. `∏ max(r, ‖αᵢ‖) = r^d` forces `‖αᵢ‖ ≤ r`. `P = 1`: all `0` | true |
| §4.3 `exists_zeros_card_eq` (sample) | `1 + X + Σ_{n≥2} p^⌈√n⌉ Xⁿ`, `r = 1`; non-zero `x` | `l = 0, u = 1`: one zero on the sphere. Count `0` ⇔ `f(x)` unit (`IsGoodZero x 0`); `e(x) ≠ 0` | true |
| §5.3 `exists_zeros_tendsto_gaussNorm_sub_prod` (sample) | `ρ < 0`; trivial norm; `Σ p^(n²) Xⁿ` | `Z ρ = ∅`. Trivial norm: `f` polynomial, exact for `ρ ≥ 1`. `‖f − P_ρ‖_s ≤ ‖f‖_s · s/ρ → 0` | true; Lazard (4.13) |
| §5.3 converse and uniqueness | `1`, `1 − X²/p` over `ℚ_p` | Both have no zero in `ℚ_p`; unequal. In `ℂ_p` divisors `∅` and `{±√p}` differ | true only with field named: C01 |
| §6.1 Mathlib's Eisenstein | `f = 1`; `X² + 2X + 2`; `X² − 9`, `X² − 18` over `ℚ_3` | `1`: Eisenstein, a unit. Heights `(1,1,0)`, slope `−1/2`. `d_m = 2, q_m = 1`: 2 factors and 1 | false at `d = 0`: R01 |
| §6.2 ramification (sample) | `X^p − p`; `ξ₂` over `ℚ₂(i)`; slope `0` | `q = p = e`. `v(i−1) = 1/2`, `q = 2 = e`. Slope `0/1`: `q = 1` | true; Kedlaya Cor. 3 |
| §6.4 formal against normed (sample) | `p + X + X²`, also `p = 2`; `ΣXⁿ` | Valuations `1,0,0`: `μ = 0, λ = 1`, normed degree `2`; roots of valuation `1` and `0`. `ΣXⁿ`: `μ = λ = 0` | true; Washington, NSW not readable |
| §6.5 `ξ₂` (sample) | roots `−1 ± i` | Sum `−2`; product `−i² + 1 = 2`. `ℚ₂`: heights `(1,1,0)`, slope `−1/2`; `ℚ₂(i)`: `(2,2,0)`, slope `−1` | true |
| Radius headline (overview, Layer 5 intro) | `Σ p^⌈n/2⌉ Xⁿ`; `1 − pX`; exp | `liminf = 1/2`, `R = √p`, points in `ℚ_p` only to norm `1`. Polynomial: `λ = ∞`. exp: `p^(−1/(p−1))` | true |
| Hodge example (Layer 2) | `diag(p,p)`, `[[p,1],[0,p]]`; `p = 2` | Both `(1−pT)²`; invariant factors `(p,p)`, `(1,p²)`. `p = 2`: heights `(0,2,2)`, envelope `(0,1,2)` | true; KedlayaNumerical Th. 16 |

- Source locators checked against the text: 13. Lazard p. 48 (line 73–81), (1.7)–(1.11) (line 107–148), Proposition 1 (line 162–167), Proposition 2 (line 288–298), Proposition 4 (line 358–362), the opening of §4 (line 413–419), (4.13) (line 560–564); Kedlaya §1 (line 18–23), Corollary 3 (line 86–88), Theorem 7 (line 144–147), §5 (line 170–176); KedlayaNumerical §3 (line 166–167), Theorem 16 (line 191–194).
- Library declarations opened at the pin: 13. `TauCeti/RingTheory/PowerSeries/Entire/GoodZero.lean:84,149`, `TauCeti/RingTheory/PowerSeries/GaussNorm.lean:351,459`, `TauCeti/Analysis/Convex/Sequence/Face.lean:203`, `TauCeti/NumberTheory/NewtonPolygon/Slopes.lean:110,432,479`, `Irreducible.lean:142`, `Radius.lean:163`, `TauCeti/RingTheory/PowerSeries/Weierstrass/Preparation.lean:467`, `Mathlib/RingTheory/Polynomial/Eisenstein/Basic.lean:57,232`. The pin has no slope-factorisation or disc-preparation file, so §§4.1–4.2 are targets against it.
- Cross-roadmap citations resolved on main: RestrictedPowerSeries (Layers 0–1, §§2.1–2.4, §3.2, Layer 4, Layer 7), FormalLaurentPuiseux L1 and L5, CompactOperators §1.2 and Layer 4, PadicMeasuresIwasawaAlgebras §4.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.16 and R07.3.2, CrystallineCohomology §CR.4.7, LocallyAnalyticDistributions §4.13, LocalFieldsRamification (completed). Consumers' citations of §§0.4, 0.7, 2.1, 2.5, 3.1, 3.4, 5.1 and 6.3 are covered by the table in the scope section.
- Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. No change outside the folder.
- Automatic checks: all passed.
- Elaboration of `TauCetiRoadmap/NewtonPolygons/Suggested.lean`: six `sorry` warnings and nothing else. `#check @name` on all six: each elaborated type equals its README statement, no binder lost, nothing changed. One-tactic probe (`rfl`, `infer_instance`, `simp`): none of the six closes.
- Headline theorems: slope factorisation, zeros in a disc and the entire product are stated; the five others the docstring lists are proved at the pin and cited. No `set_option`, no sorry'd data, one `import Mathlib` and five Tau Ceti modules.
- Checks and examples: 18 and 28, as the description says; every one was recomputed.

Overlap check: read CompactOperators (main and its open revision), PadicExtensionFamilies (main and its open revision), FormalLaurentPuiseux (main and its open revision) and RestrictedPowerSeries (main). Owners: restricted series, preparation and Strassmann — RestrictedPowerSeries; Fredholm determinants and minor estimates — CompactOperators; the Laurent specialisation and Newton–Puiseux — FormalLaurentPuiseux; ramification polygons — PadicExtensionFamilies; convex sequences, coefficient polygons, slope factorisation and zero counts — this roadmap. Nothing has two owners. NewtonPolygons §1.2 and FormalLaurentPuiseux L5 cite each other's roadmap at different layers; the dependency check reports no cycle.

Source independence: 12 passages compared with 3 sources (Lazard, Kedlaya, KedlayaNumerical), none shared and none translated; largest share Lazard, 19 of 48 locators; contents compared with Lazard (§§1–9): independent — Layers 0, 1 and 6 have no counterpart there, Lazard §§5–9 are unused, and the order 2 → 3 → 4 → 5 is forced by §2.3 → §3.2 → §4.1 → §5.3. Koblitz, Neukirch, BGR, Washington and NSW could not be read.

Research link: Layers 4–5 state Lazard's 1962 theory of zeros of analytic functions over complete valued fields (Propositions 2 and 4, (4.13)); §4.2 is Kedlaya's 2007 slope factorisation (Theorem 7); the Hodge comparison is "Newton above Hodge" (KedlayaNumerical Theorem 16), used for Fredholm determinants; Layer 6 serves Iwasawa-theoretic preparation. Rests on the README and the three texts read.

## Not verifiable

- Koblitz IV §§3–4 (cited in §§0.1–0.3, 0.5, 0.6, 2.4): a Springer book, not in the sources cache or the manifest; the statements were checked by computation and against Lazard §1 only.
- Neukirch II §§3–4, 6, 8 (Layer 1, including the sampled §1.3): Springer book, not in the cache.
- BGR §5.2 (§§4.1, 4.3): Springer book, not in the cache; the Lazard locators beside it were read.
- Washington §7.1 and NSW (5.3.1)–(5.3.4) (§6.4): Springer books, not in the cache.
- The public repository named in the provenance section was not opened, so its declarations were not compared with `Suggested.lean`.

Automatic checks set aside as false positives: the citation resolver reads the source key KedlayaNumerical §3 in the Layer 2 dependencies (line 596) as a citation of a roadmap; it is a reference key listed under References.

## Source issues

- none

## For the human reviewers

- Licence: the provenance section (README lines 988–1007) names a public repository (WilliamCoram/PhD at a fixed revision) as a source of candidate implementations for reuse with attribution. Its licence was not read, and its declarations were not compared with `Suggested.lean`.
- Scope of the pin: the folder's generated `STATUS.md` (lines 18 and 26) lists a pure slope factorisation and a normalised disc preparation as landed in Tau Ceti; neither is at the pinned revision `2fd255d`, where §§4.1–4.2 are still targets. A newer pin would turn them into supplier contracts.
