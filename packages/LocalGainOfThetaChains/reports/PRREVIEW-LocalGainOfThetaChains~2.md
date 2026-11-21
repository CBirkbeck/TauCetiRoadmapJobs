# Review of LocalGainOfThetaChains (pull request #2915 at e3878a8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** needs changes

**Summary.** Changes are needed for two findings. First, 38 of the 41 targets are marked *NEW* and cite the formal proof only as a whole repository, with no file or declaration, so none of the roadmap's own theorems can be checked against its source (R01). Second, the route of 4.14 bounds the excess `𝔵_v` through an inequality that is false as written, although the stated bound is true (R02). Every Check recomputed holds: the CM values `|√−d·s₂|`, the diagrams of a step, the sandwich exponent for `GL_2`, the projector and exchange examples. Supplier citations resolve, and no object has two owners. There are four small corrections and one format note, and the human reviewers have a scope question to decide (an unrefereed formal proof is the main source).

## R01 (P2) — No target marked *NEW* has a locator into the formal proof, so none of the roadmap's own statements can be checked against its source

A reader or implementer who wants to confirm a target has nothing to open. This matters most where the README gives no proof either: 4.14c′ ("The route is not given here", with "no published statement is known"), the five layers of 4.15e ("no proof below them is given"), and the steps flagged as not given in 4.12, 4.14d–4.14g, 4.16a–4.16c and 4.17a.

How I know:
- References, line 1617, makes [FormalProof] "the reference of every target marked *NEW*" but names only the repository. The README contains no path or Lean name from it (no `src/`, no `.lean`).
- 38 of the 41 target sections carry *NEW*.
- 17 passages say that a step is not given or not proved here (lines 203, 271, 418, 487, 583, 654, 801, 824, 915, 996, 1046, 1141, 1190, 1281, 1283, 1325, 1421).
- The repository's `src/` directories (BuildAid, CompanionTheory, Development, Formalism, GroundTheory, Lemmata, PositivityTheory, ReciprocityTheory, Supplements/Kernels) carry no name of these objects.

The smallest change: after each *NEW* status, give the file and the declaration of [FormalProof] that the target is taken from. Do this at least for the headline targets 4.10, 4.11, 4.14, 4.15c, 4.16 and 4.17a, and for the targets whose route is not given (4.14c′, 4.14d–4.14g, 4.15e, 4.16a).

## R02 (P2) — The route of 4.14 bounds a sum of positive parts by a sum that can be negative, so its chain of inequalities for `𝔵_v` is false as written

An implementer who follows the route would be proving a false inequality. At line 651 the route asserts `Σ_j(r^H_j − P_j − r⁰_j)₊ ≤ Σ_j(γ_LTΣα_s − P_j)`. When `γ_LTΣα_s < P_j` for some `j`, the `j`-th term is `≥ 0` on the left and negative on the right. This happens in range: `P_j` grows with `j` by at least `(n′/2)·r_H·(t+1)` (4.9e (b)).

Instance, with `m = 2`, `r⁰ = 0`, `γ_LTΣα_s − P_1 = 10`, `r^H_1 − P_1 = 9` and `γ_LTΣα_s − P_2 = −5`: the left side is `9`, the right side `5`.

The bound `𝔵_v ≤ m·γ_LTΣα_s` of 4.14 (a) still holds. Each positive part is `0` when `γ_LTΣα_s < P_j`, and otherwise at most `γ_LTΣα_s − 1` (because `P_j ≥ 1` and `r^H_j ≤ γ_LTΣα_s`). So the sum is `0`, or at most `m·γ_LTΣα_s − 1`, and the ceiling stays `≤ m·γ_LTΣα_s`. Replace the sentence with this argument.

## C01 — The summary credits 4.17b with bounding the `log p`-weighted sums of `ℒ_f`, which 4.17b does not state

Line 5 says of `ℒ` and `ℒ_f` that their "sums over the primes weighted by `log p` are at most a constant times `b` (4.17b)". But 4.17b (lines 1427–1430) bounds the sums of `ℒ` only. The consumer ThetaChainsAndFrobeniusPrimeSums §10.2 cites "LocalGainOfThetaChains §4.17b" for the sums of both `ℒ` and `ℒ_f`, so the missing statement is also an interface gap.

Either add to 4.17b the bound `Σ_{p≤X″}log p·ℒ_f(p) ≤ C·f·X″·(N_m²·log 2a + log²2a)`, together with the size hypothesis under which it is `≤ C·b`, or restrict that clause of the summary to `ℒ`.

## C02 — `Re(e′)` in the definition of `C(e)` is never identified with `H^{½}(e′)`, the lattice on which the depth property states its separation

- `C(e)` (4.14b, line 696) uses `w^cRe(e′)`.
- `Re(e_g)` appears only in a parenthesis 24 lines later (line 720), as the polynomials of order `≥ 0` at `g`.
- `DepthBound` asks for `F_i ∈ p^{c*/2}H^{½}(e′)` (line 1012).
- 4.15f obtains `DepthBound` from 4.14h (lines 1183–1187), which needs `w^cRe(e′) ⊂ p^{c*/2}H^{½}(e′)`.

Where `C(e)` is defined, define `Re(e)` and state `Re(e) = H^{½}(e)` (or the inclusion that is meant). Alternatively, write `H^{½}(e′)` in `C(e)`.

## C03 — The downstream-consumer bullet for TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f presents a supplier as a consumer

Line 1519 says that §4.19f "bounds the depth of the row side by the bulk `F_j` of 4.9f (d)". Yet the supplier contracts cite the same section as an input (line 1557). TaylorBounds §4.19f (a), (g3) bounds the depth by the flow-programme values `Σ𝔉_ℓ(n·w)`, does not cite 4.9f, and comes earlier in the merge order. Drop the bullet: 4.9f (d) already says that the row depth is bounded by this number. Or reword it, for instance: "4.9f (d) names `F_j` the programme value by which TaylorBounds §4.19f bounds the row depth".

## C04 — The symbol `o` in the hypothesis `δ_top|A| ≥ 16o²/ω₀²` of 4.17 (line 1346) is not defined in this README

In FrobeniusRestrictedRieszSums §0.7, `o` is the index of the subgroup `A₀` of the coset law, and this README does not say which `A₀` the coset profile uses. Name the subgroup and its index.

## N01 — Clause letters run across sections out of order

The clause letters (a)–(h) run across 4.9, 4.9e and 4.9f, and (f) sits in 4.9e ahead of (d) and (e) of 4.9f. References such as "4.9e (f)" would be easier to follow if the letters restarted in each section or ran in order.

## Questions for the author

- In 4.15d (B), when the incomplete tile is among the next `M₀` tiles of a tile, only `M₀ − 2` complete tiles may avoid the given top. Does "the next `M₀`" skip the incomplete tile? If it does not, the bound is `(1 − q)^{M₀−2}`, and the factor 2 is absorbed only for `q ≤ 1 − 2^{−1/2}`. The text does not say how tiles are counted near the incomplete one.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.9 types, sides | `A` cyclic of order 6, `h` of order 1, 2, 3, 6 | `h = 1`: `Frob = c`; order 3: `c = Frob³`, `n′ = 6`; orders 2, 6: `c ∉ ⟨Frob⟩`, `n′ = ord h` | holds; split in `ℚ(√−q)` puts odd positions in `cσ_dA` | none |
| 4.9a host property (route step) | `ℓ_{−1}(𝔲T)` with `𝔲^{p²−1} = −1`, `p = 5` | `𝔲^{p^{2j}} = (−1)^j𝔲`, both sides `𝔲·Σ_jT^{p^{2j}}/p^j`; `𝔲` exists since `2(p²−1) ∣ p⁴−1` | holds | none |
| 4.9a `s₂` integrality | `Σ_{P∈ker α∖0}℘(P) = s₂(α^{−1}Λ) − Nα·s₂(Λ)` | equals `α²s₂ − αᾱs₂ = α(α−ᾱ)s₂` | holds | none |
| 4.9b hyperbolic shape | inputs: TaylorBounds §4.4a, HodgeTate §3.6 (a), (c) | both sections exist; (C), (N) are exactly §3.6's hypotheses | consistent | none |
| 4.9c Check | `d = 7, 11, 19, 43, 67, 163`, `Δ(Λ) = 1` | `√d·|G₂*(τ)|/(4π²|η(τ)|⁴)` = 0.2500, 0.6667, 2.000, 12.00, 38.00, 724.0; each `v_d = 0` | Check true | none |
| 4.9e Checks | `n′ = 2`, `𝔗 = {0}`; unlinked `v` | TaylorBounds §4.8 (J1), (J2): `r^H = γα̂_0`, `r⁰ = Σ_{e odd}(α̂_0/p^e − ĉ(1))₊`, `Dist = ∅` | match | none |
| 4.9f diagrams Check | `(6,2,13)`, `e′ = (10,26)`, `e = (18,34)`, `v = (−5..−9)`, `j = 1` | `a⁺_i = 1` (i = 0..5); `a⁻_0 = 26−18−7 = 1`; other expression `−26+18−7 = −15` | Check true | none |
| 4.9f cost at `d` | `f/2` pairs, `w ≤ 2b′` | `F ∈ [−(k−1)fb′/2, 0]`; second summand `≤ fkb′ + |Φ_top|b` | holds | none |
| 4.10 with 4.11 (headline 1) | `m = 1`; general `m` | step: `g⁰+F−E+[j=1]v_p(D_Γ)`; sum `Σ(g⁰+F−E) + v_p(D_Γ)` = 4.11 (iii) | consistent | none |
| 4.11 periods | (ii) with that `s` | `≥ e_𝔭(s − v_p(D_Γ)) = e_𝔭Σ(g⁰+F−E)`; floor because valuations are integers | matches headline | none |
| 4.12 Check | `n′ = 2`, `j = 1`, `i ≤ t+1` | `Σλ_a − i(t+1)/2 + i(w₁−k/2) = Σλ_a + i·w̃₁`, `κ₁ = (k+t+1)/2` | holds | none |
| 4.13 integrality | `𝗁_l` of the segment numbers | `N𝔓`-exponent `(n′/2)l(N_j−2r_H+l−t) ≥ (n′/2)l(k+1−2r_H+l) > 0` | holds | none |
| 4.14 `𝔵_v` bound | `m = 2`, `γΣα−P₁ = 10`, `γΣα−P₂ = −5` | route's sums: 9 vs 5 (false); claim `𝔵 ≤ mγΣα` holds | route step false | R02 |
| 4.14a | `n = 1`, `M = X`, `t_j = j`, `Y₀ = p^H` | mean `p^{−E}` ≤ `p^{−H} + 1/((p−1)E) + H/(p^HE)`; `E > H`: `p^{−H}` vs `p^{−H}` | holds | none |
| 4.14b Fock dual | rank 2, `⟨X^d, ξ^d⟩ = 1` | `⟨X^{d−1}Y, ξ^{d−1}η⟩ = 1/d`; dual functional `dξ^{d−1}η`; `ξ^{d−1}η` not dual when `p ∣ d` | holds | C02 (`Re`) |
| 4.14f′ Checks | `k = 3`; `5⁵` letters | composites on `e₁⊗e₂`: `0` vs `½e₂⊗e₁`; `max v₅ C(5⁵, j)` = 5 = `⌊log₅(5⁵+1)⌋` | holds | none |
| 4.15 edge-family lemma | cross terms with `c* = 2(D+1)`; Smith form of `S` | off-block pairings `≡ 0 mod p^{D+1}`; a divisor `> D` is excluded by its dual vector | holds | none |
| 4.15b walk lemma | one place, `β = 0`; `β ≥ |V|` | `E = a+b+(m−1)c+mc₀`, `m·g` vectors; `β ≥ |V|`: `C = ∅`, `βS ≥ ΣS_v` | holds | none |
| 4.15c (headline 2) | `√p` units, `mΣsh = 1/2` | `E/2 = Σm(⌈dep⌉+D+1) + βS`; `Σg_β ≤ 0.649·rank ≤ 1.0·rank` | holds | none |
| 4.15d probability | data of 4.17, `uδ ∈ [1, 1+δ)` | marked probability ≈ `e^{−1}(0.0677ω₀)^{3r} ≥ e^{−1}(0.067ω₀)^{3r}`; `(1−q)^{M₀−1} ≤ 2(1−q)^{M₀}` iff `q ≤ 1/2` | holds | question |
| 4.15a Check | `R = S = ℤ_p`, `B = p^{−1}ℤ_p`, `U = p`, `D = 1`, `b = e = 1` | left 2; right `2 + 1 = 3` | holds | none |
| 4.15e Theorem II | (L3) depths against the threshold | `t₀ + |𝔗|c₀ + om ≤ Cr|𝔗|(…+c₀) + 2rn′c″`; `c* ≥ 8(D+1)` gives both lemma hypotheses | consistent | none |
| 4.16 (headline 3) | `𝒱_p = ∅`; places split in `K` | length 0, `N_u ⊂ M_u`; `𝔊_u = −m·v_p(D_Γ)` = 4.10 (iv) with 4.11 | holds | none |
| 4.16c (b) | `ϖ^e = T^{k−1}` | ThetaChains §3.7: `D_vU_v = q_v^{N_0−1}`, `q_v = T` (split completely) | holds | none |
| 4.17 Check | `GL₂`, `λ = (n,0)`, `n < 800`, `p ≤ 7` | `max_i v_p C(n,i) = ⌊log_p(n+1)⌋ − v_p(n+1)`: 0 mismatches; `A_w = 26` gives `p₀ = k²x^{26}` | holds | C04 (`o`) |
| 4.17a (headline 4) | `γ_LT ≤ 2/p`; matching lemma | `g_j ≤ (2/p)·|Φ_top|·2a = 4|Φ_top|a/p`; `y ↦ (y⁻, d(y))` injective, `d(y)` odd | holds | none |
| 4.17b | `b′/x` term; `ℒ_f` | `Σ_{p<X′}log p·b′/x ≤ log 4·b` (`X′b′ = xb`); `ℒ_f` sum not stated | `ℒ` holds | C01 |
| 4.17c, 4.17d | `p = 13`; data of 4.17 | `γ_LT·p = 169/168`; `8C_bx^{−2}(x^{ε/3}+C) ≤ x^{−2+ε}`; Chernoff `2^{−(N₁−1)} ≤ x^{−(h_A+3)}` | holds | none |
| Downstream bullet, TaylorBounds §4.19f | supplier text at its head | §4.19f bounds `T·ν` by `Σ𝔉_ℓ(n·w)`; no citation of 4.9f | supplier presented as consumer | C03 |

- Sources: the Announcement (author's page) was read in full, 4 pages; the formal proof's top level and `src/` listing were opened. None of the 15 sampled targets could be matched to a declaration, because no locator exists.
- Library declarations opened at the pins: Mathlib `Matrix.unitaryGroup` (LinearAlgebra/UnitaryGroup.lean:105), `FormalGroup` (RingTheory/FormalGroup/Basic.lean:57), `Chebyshev.theta_le_log4_mul_x` (NumberTheory/Chebyshev.lean:191); Tau Ceti `WeierstrassCurve.formalGroup` (AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58), `weylModuleOfShape` (RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:431), `kostantFormBasis` (Algebra/Lie/Sl2/Kostant/Basis.lean:152).
- Citations to open heads resolved: every cited section of ThetaChains (25 ids), TaylorBounds (13), FrobeniusRestrictedRieszSums (6), IntegralWeyl (4), ThetaLifts (3), HodgeTate (3), LubinTate (2), DiscreteSeries (2), and PotentialAutomorphyInfrastructurePartII §3.8.
- Citations to roadmaps on main resolved: AnalyticNumberTheoryPartI §0.11, AutomorphicFormsOnReductiveGroups §§7.4–7.6, SmoothRepresentationsOfLocalGroups SR.4.3, ReductiveGroups §10B, ClassicalGroups §6.1, ArithmeticLocallySymmetricSpaces ALS.F.7, ArithmeticStatisticsPartIV §3.2.
- Supplier content read against its use: TaylorBounds §§4.6, 4.8, 4.19f; FrobeniusRestrictedRieszSums §0.7; ThetaChains §§2.3, 2.3b, 2.7, 3.6, 3.7, 3.8.
- Computations: `s₂` at six discriminants, the binomial formula (3,200 cases), the 4.14f′ denominators, `γ_LT(13)`.
- Automatic checks: the worker's gate passed. My own gate run flagged only the family-index files and the absence from the merge order (both set aside below). The dependency check reports `depcheck: 171 roadmaps, 1995 edges, 0 problem(s)`.
- Lean: `Suggested.lean` elaborates with exit code 0 and no messages. It declares nothing, so there were no signatures to compare and no one-tactic probe to run.

Overlap check: I read GluedTargetAndDivisionInequality, ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, TaylorBoundsAndDepthsOnHeightTwoFormalGroups and CongruenceModulesOfThetaLifts; the lists for main and for results are empty. The ledger, `DepthBound`, the gain sublattice and the gain inequality are owned here and cited by GluedTarget and ThetaChainsAndFrobeniusPrimeSums. The flow programme and the jet bounds are owned by TaylorBounds, the chain data by ThetaChains; both are cited here. Nothing is owned twice.

Source independence: 6 passages (README lines 3, 95, 97–109, 389–400, 1444–1452, and the docstring of `Suggested.lean`) were compared with 1 readable source (Announcement lines 9–53 and 115–138). Nothing is shared beyond the formula `p^{a/p + a/p³ + ⋯ − O(log a)}`. The largest share of the locators belongs to [FormalProof], cited for 40 of the 41 targets (38 *NEW*, 2 *NEW* with *KNOWN* in kind). Its contents could not be compared, because no table of contents is readable.

Research link: Layer 4 is the inert-prime local gain of Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026). Announcement lines 115–117 state the divisibility of CM theta derivatives by `p^{a/p + a/p³ + ⋯ − O(log a)}` at inert primes, which 4.9a–4.11 carry to chains. Basis: the README's References and the Announcement.

## Not verifiable

- 4.9 against [FormalProof]: no file or declaration is cited, and the `src/` directory names do not name the object.
- 4.9a: same reason.
- 4.9b: same reason.
- 4.9f: same reason.
- 4.10: same reason.
- 4.11: same reason.
- 4.14: same reason.
- 4.14b: same reason.
- 4.15b: same reason.
- 4.15d: same reason.
- 4.15e: same reason. In addition, the README gives no proof below its five layers.
- 4.16: same reason.
- 4.17: same reason.
- 4.17a: same reason.
- 4.17b: same reason.
- The *KNOWN* citations (Gross 1999, Mumford, Jacobowitz 1962, Jantzen II.5–II.6, Bannai–Kobayashi 2010) carry no theorem or page locators and were not in the sample. They were not fetched.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside the roadmap's own folder, which flagged only the three files of the family index directly above this folder (they are this pull request's own, as the family's index, so nothing outside its scope was changed); the dependency check's line that this roadmap is not in the merge order, which holds for every new roadmap until it is inserted after its last supplier and says nothing about the direction of supply; and the error of the listing of elaborated signatures ("Unknown identifier `sets`"), which read a word of a docstring as a declaration name, although the Lean file elaborates cleanly and declares nothing.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof]. It is an unrefereed Lean development, announced on 20 November 2026 with no accompanying paper (References; Announcement lines 9–13 and 45–49). The main source is therefore unpublished.
- Licence: I classified `alpo.ge` as the author's own page in order to read the Announcement. The licence of the repository `github.com/leanprover-community/riemann-hypothesis` was not read.
- Not tested: for [FormalProof], the source of 40 of the 41 targets, the README gives no locators, and its directory names are not a readable table of contents. Wording and arrangement were not compared against it.
