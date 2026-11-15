<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6895596534 -->
Review (claude) of eb7f141

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Six sieve tables are taken over from BFP as they stand

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1127–1132`, `:1146–1151`, `:1164–1169` (§§8.9–8.11) and `:1207–1211`, `:1215–1219`, `:1223–1227` (§8.14): "prove that the sieve term `S_d(C^con_n)` … is the polynomial in the following table".

   **Claim.** The 84 sieve terms are stated in the roadmap's own form.

   **Witness.** bfp lines 774, 795–806, 876–877, 887–898, 935–937, 949–962, 1461–1474, 1503–1514, 1537–1548: all 84 entries agree, in the source's order and its mixed factored/expanded forms (e.g. bfp line 896), truncated where it truncates. bfp line 39: © Princeton.

   This is maintainer note 1; it holds. The end theorems use less: §8.13 and §9.5 consume only the per-type sums `Σ_{d≤3} S_d/#Aut(Q^•)` to `o(q^{(9+n)/2})` (`n ≤ 2`) or `B q⁶ + o(q⁶)` (`n = 3`).

   **Exact repair.** Delete the six tables. In each of §§8.9–8.11 and §8.14 keep as targets:

   1. The rules the entries instantiate, in prose (the routes and Checks already state most of them): `S_d(C^nsp_0) = s_d(Q_nsp)·p_{15−3d}` and `S_d(C^spl_0) = s_d(Q_spl)·p_{15−3d}` for `d ≤ 3`; on the cone `S₁ = q¹² s₁(X)`, `S₂ = q⁹(s₂(X) − (q + 1)s₂(𝔸¹))`, `S₃ = 0`; `S₀(C^•_n)` as the count of ordered `n`-tuples of distinct points times the equations through them; the three/one/two condition counts. Cite BFP Propositions 8.1–8.2, 8.4–8.7 and 11.2–11.4 by locator for the term-by-term values.
   2. One theorem in the roadmap's own normal form: the truncated smooth-fibre contribution `F^•_n(q) = Σ_{d≤3} S_d(C^•_n)/#Aut(Q^•)`, an expanded polynomial in descending powers at the precision §9.5 uses. Values computed in this review from the README's own entries:

   | Type | n = 0 | n = 1 | n = 2 | n = 3 |
   | --- | --- | --- | --- | --- |
   | cone (exact) | q⁸ | q⁹+q⁸−q⁷ | q¹⁰+2q⁹−2q⁸−2q⁷+q⁶−q⁵ | q¹¹+3q¹⁰−3q⁹−8q⁸+6q⁷−3q⁶+2q⁵−6q⁴+6q³ |
   | non-split | ½(q⁹−q⁶)+o(q^{9/2}) | ½(q¹⁰−q⁶)+o(q⁵) | ½(q¹¹−q⁹+q⁸−q⁷−q⁶)+o(q^{11/2}) | ½(q¹²−3q¹⁰+2q⁹+2q⁸−6q⁷)+O(q⁶) |
   | split | ½(q⁹−q⁶)+o(q^{9/2}) | ½(q¹⁰+2q⁹−2q⁷−q⁶)+o(q⁵) | ½(q¹¹+4q¹⁰+3q⁹−5q⁸−3q⁷−q⁶)+o(q^{11/2}) | ½(q¹²+6q¹¹+9q¹⁰−10q⁹−10q⁸+2q⁷)+O(q⁶) |

   | Type | cycle type (2) | (2,1) | (3) |
   | --- | --- | --- | --- |
   | cone (exact) | q¹⁰−q⁶+q⁵ | q¹¹+q¹⁰−q⁹−q⁶+2q⁵−2q⁴ | q¹¹+q⁸−q⁵ |
   | non-split | ½(q¹¹+q⁹−q⁸−q⁷+q⁶)+o(q^{11/2}) | ½(q¹²+q¹⁰−2q⁸+2q⁷)+O(q⁶) | ½(q¹²−q⁹−q⁸)+O(q⁶) |
   | split | ½(q¹¹+q⁹−3q⁸+q⁷+q⁶)+o(q^{11/2}) | ½(q¹²+2q¹¹+q¹⁰−4q⁹−2q⁸+2q⁷)+O(q⁶) | ½(q¹²−q⁹−q⁸+2q⁷)+O(q⁶) |

   Keep the existing Checks (they are in the roadmap's words and still evaluate), reword the Layer 8 opening sentence about "the coefficient tables below", and leave the section numbers unchanged so that §§9.5 and 9.9 keep their `*Needs:*` lines.

   **Regression.** At `n = 1`: `F^con + F^nsp + F^spl + #H_{4,1} = (q⁹+q⁸−q⁷) + ½(q¹⁰−q⁶) + ½(q¹⁰+2q⁹−2q⁷−q⁶) + (q⁸+q⁷) = q¹⁰+2q⁹+2q⁸−q⁷−q⁶`, the §9.6 row above degree five. For cycle type `(2)`: `(q¹⁰−q⁶+q⁵) + ½(2q¹¹+2q⁹−4q⁸+2q⁶) + (q⁹−1) = q¹¹+q¹⁰+2q⁹−2q⁸+q⁵−1`, and §9.9 gives `s_{(2)} − s_{(1,1)} = q¹¹+q¹⁰+2q⁹−2q⁸` (difference of degree five, inside the precision `o(q^{11/2})`). The remaining differences computed: `n = 0`: `0`; `n = 2`: degree 5; `n = 3`: `−6q⁶ + …` (the term `B q⁶`); `(2,1)`: degree 4; `(3)`: degree 5.

2. **F02** (P3) §12.1 lists §7.7 although no genus-seven pair enters

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1680` and `:1682`, §12.1: "all of them except `(2, 11), (1, 11), (1, 12), (1, 13)` have the CKgP (§§5.4, 7.7)"; the `*Needs:*` line lists `7.7`.

   **Claim.** The degree-thirteen reduction uses the genus-seven theorem.

   **Witness.** The base pairs have `2g ≤ 13` (`n ≤ 1`) or `2g − 2 + n ≤ 13` (`n ≥ 2`). At `g = 7`: `2g = 14 > 13` and `12 + n ≥ 14 > 13`. The largest genus is six: `(6, n ≤ 3)`, inside `c(6) = 5`.

   **Exact repair.** In §12.1 replace "(§§5.4, 7.7)" by "(§5.4)" and delete `7.7` from the `*Needs:*` line, so that §12.1 is not blocked behind Layers 6–7. §12.2 keeps §7.7: there `2g ≤ 15` admits `(7, 0)`, `(7, 1)`. Regression: the listed base pairs `(1, ≤13)`, `(2, ≤11)`, `(3, ≤9)`, `(4, ≤7)`, `(5, ≤5)`, `(6, ≤3)` against `c = 10, 10, 11, 11, 7, 5` leave exactly the four exceptions named.

Two findings: one P2 (reuse of a source's tables) and one P3 (a `*Needs:*` edge that nothing uses). The mathematics of the round-4 repairs is sound, `Suggested.lean` elaborates with no output, and the dependency check reports no problem. No author file was changed by this review.

## Previous findings (round 3), checked first

| Finding | Current passage | Disposition |
| --- | --- | --- |
| F01 (P1) boundary injectivity at `n = 11` | README:646: "For `n ≥ 12` prove that pullback `H¹¹(M̄_{1,n}) → ⊕_{|B|=10} H¹¹(D_B)` … is injective … For `n = 11` the injectivity fails"; README:1509 treats `|A^c| ≥ 2` through `Φ_A`, `Φ_{A^c}` | Repaired. Recomputed below; clp-h11 lines 545–577 read. |
| F02 (P2) all-degree form of CLP Lemma 3.2 | README:623: "`T^k_n = 0` when `k` is odd or `k ≤ 23` … this roadmap neither asserts nor refutes that containment"; README:641: "This is a statement about `V`; it does not place `T^{24}_{23}` outside the generated STE" | Partly repaired, remainder settled. The Check no longer claims a cohomological obstruction. The repair report declined to restore the unproved form as a target; its reason (clp lines 435–437 give no argument, no source proves it, nothing consumes it) is correct, so it is not re-raised. See the human reviewers' section. |
| F03 (P3) Arsie–Vistoli venue | `sources.toml:329–330`: `venue = "Compositio Mathematica 140 (2004), no. 3, 647–666"`, `doi = "10.1112/S0010437X03000253"` | Repaired. |
| F04 (P3) API of `T^k_n` | README:627–634: six prose bullets (Gysin source and target with one twist, `S_n`-stability, Koszul sign, three vanishing ranges, containment) and five Checks | Repaired. |
| F05 (P2) Brill–Noether ownership | README:23, :67–69, :792–794: CanonicalModelsAndGonality §5.4 and AlgebraicCurves Layer 12 cited; `ρ(7,1,5) = 1`, `ρ(7,1,4) = −1` Check | Repaired. §5.4 exists at the head of the open pull request #1726 (heading "5.4 Brill–Noether existence and the gonality bound", with the corollary `gon_{k̄}(F) ≤ ⌊(g + 3)/2⌋`); that pull request is by another author and adds a new roadmap folder, which this package may consume; the dependency check accepts the edge. |

Same patterns elsewhere: no other use of the §4.7 injection on an eleven-flag factor (§§10.9, 11.3 use the basis and the boundary rule only); no other supplier cited for a statement it does not make (all citations resolved again below).

## Maintainer notes

1. Tables taken over: holds; raised as R01 with this review's own witness.
2. No finding elsewhere in the end theorems and the arrangement: confirmed. §§9.4–9.6 and 9.9 are in ascending expanded form with the elided terms written out (bfp lines 111–117, 133–136, 1299–1305 print descending forms with ellipses); the layer comparison is under "Source independence" below.
3. Licence notes: carried to the human reviewers' section.

## Verified sound

### Seeded source sample (15 targets, all read in the cached texts)

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.6 | bfp lines 249–257 (p. 1329); lines 1324–1327 (p. 1354); bergstrom-genus-three lines 95–110 (Theorems 2.1–2.4) | Ranges `g = 1, n ≤ 10`; `g = 2, n ≤ 7`; `g = 3, n ≤ 5` as stated. |
| 2.7 | arbarello-cornalba line 474 (Theorem (2.1)); bfp lines 249–251 | Degrees 1, 3, 5, all stable pairs. Base region for `k = 5`: `(1, ≤5)`, `(2, ≤3)`, inside §1.6. |
| 5.1 | clp lines 458–462 (Definition 4.1, p. 11) | Smooth, finite type, stratified by quotient stacks; all `Y`. |
| 5.2 | clp lines 465–472 (Proposition 4.2, p. 11) | Six permanence clauses with their qualifiers. |
| 6.1 | clp lines 547–557 (p. 13) | Nested gonality loci, maximal gonality five. The Brill–Noether input is now the supplier's. |
| 7.7 | clp line 154 (Theorem 1.10, p. 4); lines 948–952 (Lemma 5.17, p. 22) | `n ≤ 3`; the `n = 0` route by `κ₀ = 12` is the roadmap's own. |
| 8.10 | bfp lines 875–898 (Propositions 8.4–8.5, pp. 1343–1344) | 16 entries agree (see R01 for the form). |
| 9.2 | bfp lines 1429–1434 (§11.1, p. 1357); bergstrom-hyperelliptic line 1631 (Theorem 10.3) | Both Schur expansions agree. |
| 9.4 | bfp lines 1298–1305 (Proposition 9.6, p. 1353), 1331–1340 | All 44 coefficients agree; the single automorphism-free graph for `n = 3` is at lines 1337–1340. |
| 10.2 | clp line 86 (Theorem 1.5(1), p. 2); lines 956–959 (§6.1, p. 22) | `g′ < 7`, `n′ ≤ 4`. |
| 10.8 | clp-h11 lines 463–577 (§4.3, pp. 11–14); line 386 (Lemma 3.4) | Three graph types and Cases 1–3 as restated; the source's `n = 10, 11` step (rationality) is replaced by §§5.4 and 4.6. |
| 11.5 | clp lines 1084–1091 (Lemma 7.6, p. 26) | Count `6006` and the straightening route; the five families are in a figure (see Not verifiable). |
| 12.1 | clp line 89 (Theorem 1.6, p. 2); lines 1006–1021 (pp. 23–24) | Exceptional set `{(2,11),(1,11),(1,12),(1,13)}`; R02 concerns the `*Needs:*` line only. |
| 12.5 | clp lines 1165–1172 (Lemma 8.1, p. 28) | Homological form and `L²S₁₂` in both realizations. |
| 12.8 | clp lines 1186–1206 (pp. 28–29, Figure 3) | `b = 1`, `|A^c| ≥ 14`, loop added at the genus-`(g − 1)` vertex. |

No locator was flagged by the author as unverified. Nothing was fetched; the manifest has 25 works (23 with text, 2 settled uncertified) and every work the README cites has an entry.

### Adversarial table (values computed in this review)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §4.7 rank and injectivity | `n = 11, 12, 13` | ranks `2·C(10,10) = 2`, `2·C(11,10) = 22`, `2·C(12,10) = 132`; at `n = 11`, `|B^c| = 1` gives `M̄_{0,2}`, map `ℚ² → 0`; at `n = 12`, restriction to `D_B`, `B ∌ 1`, reads off the coefficient of `ω_{B∪1}` | Sound with `n ≥ 12`. |
| §4.6 route, tree case | `Γ` a tree, one genus-two vertex | at least two leaves, so a genus-zero leaf `w` with `l ≥ 2` legs; contraction `(2, m)`, `m = n − l + 1 ≤ n − 1`; `ξ_{e*}(pr₁^*γ) = [D_e]·π^*γ` since `π ∘ ξ_e = pr₁` | Sound. |
| §4.6 `T^k_n` | `k = 23, 24`; `n = 19, 21, 23` | odd `a, b ≥ 11` force `k = a + b + 2 ≥ 24`, even; flags `n + 2 ≥ 22` force `n ≥ 20`; `n = 21`: `23 = 11 + 12`, `|A| ∈ {10, 11}`; `n = 23`: `25 = 11 + 14 = 12 + 13` | Vanishing ranges and first cases as stated. |
| §4.6 fourth Check | `(n, k) = (23, 24)` | middle cohomology of `H²⁰(D^{(2)})(−2) → H²²(D^{(1)})(−1) → H²⁴` is `Gr^W_{24}H²³(M_{2,23})` | Stated correctly; no cohomological claim remains. |
| §10.8 ordering | `n = 12`; `|A^c| = 0, 1, 2` | `|A^c| ≤ 1`, `p ∈ B`: other contraction has a genus-two vertex with `9 + |A^c| + 1 ≤ 11 < n` markings; `p ∉ B`: sides `10` and `n − 10 = 2`, later in the order; loop graph with `p₁, q₁ ∉ B`: sides `10`, `n − 10`, later; `Φ_A`: genus-two vertex | Block triangular with injective diagonal; holds. |
| §10.9 | `(3,7), (4,5), (5,3)`; `(3,12)` | `max(2g, 2g−2+n) = 11` at each; `c = 11, 11, 7`; at `(3,12)` the summand has rank 22 and the other contraction is `(2, 14)` | Base region and detection correct. |
| §6.1 | `g = 7` | `ρ(7,1,5) = 7 − 2·3 = 1`, `ρ(7,1,4) = −1`, `⌊10/2⌋ = 5` | Agrees with the supplier's corollary. |
| §§8.1–8.3 | `g = 4`, general `g` | `(q−1)(q^{2g+2}−q^{2g})/((q²−1)(q²−q)) = q^{2g−1}`; `q(q+1)q^{2g−1} + q^{2g} − 1 = (q+2)q^{2g} − 1`; `(q³−q)q^{2g−1} + 3q(q^{2g}−1) = (q²+3q−1)q^{2g} − 3q` | All three counts follow from the moments. |
| §8.4, §8.8 | orders, `s_d` | `q⁷−q⁶−q⁵+q⁴ = q⁴(q−1)²(q+1)`; `#Aut(Q_spl)(2) = 72`; `s₂(Q_nsp) = q² − q² = 0`; `s₃(Q_nsp) = q⁴+q²`; `s₃(Q_spl) = −(q⁴+2q³+q²)` | Correct. |
| §§8.9–8.11 (R01) | `q = 2`, `(S₀,…,S₃)` | cone `n = 0…3`: `(32768, −24576, 4096, 0)`, `(98304, −86016, 18432, 0)`, `(245760, −245760, 64512, −1536)`, `(491520, −552960, 172032, −8448)`; non-split: `(65535, −40955, 0, 2540)`, `(163835, −122855, 10240, 7580)`, `(327660, −286620, 46080, 13680)`, `(491460, −491220, 115200, 14160)`; split `n = 0`: `(65535, −73719, 28644, −4572)` | Entries are mathematically consistent; the finding is their form. |
| §8.14 (R01) | per-type sums over `#Aut` | the second table of R01; total against §9.9 differs in degree `≤ 5` for `(2)`, `≤ 4` for `(2,1)`, `≤ 5` for `(3)` | Consistent with §8.13 precision. |
| §9.4 against §§9.5–9.6 | every row | closed − boundary: `n = 0`: `−q⁶+q⁷+q⁸+q⁹`; `n = 1`: `−q²−q⁶−q⁷+2q⁸+2q⁹+q¹⁰`; `n = 2`: `−2q²−2q³−4q⁷−2q⁸+4q⁹+3q¹⁰+q¹¹`; `n = 3`: `−1+2q+2q²−11q³−q⁶+4q⁷−13q⁸−4q⁹+7q¹⁰+4q¹¹+q¹²` | Equals §9.6 in every coefficient. |
| §9.4 leading coefficients | `n = 0…3` | boundary divisors counted: `3`, `4`, `1+1+4+2 = 8`, `1+4+8+4 = 17` | Match `3, 4, 8, 17`. |
| §9.1, §9.6, §9.9 | `q = 1` | `χ(M₄) = 2`; `n = 3`: `−10`; open `S₃` class `(2, −6, 0)`; `−5/3+1+8/3 = 2`, `−10/3−8/3 = −6`, `−5/3−1+8/3 = 0` | Agree. |
| §9.9 dimensions | `n = 2, 3` | compact `n = 3`, `q⁶`: `3414 + 2·3304 + 583 = 10605`; `q³`: `424+698+46 = 1168`; open `n = 3`, `q³`: `−1−8−2 = −11`, `q⁸`: `−4−8−1 = −13`; `n = 2` compact `q⁵`: `901+461 = 1362` | Recover §§9.5–9.6. |
| §9.10 | `λ = (1)` | `(q⁹+q⁸+q⁷−q⁶)(q+1) − (q⁷+q²) = q¹⁰+2q⁹+2q⁸−q⁷−q⁶−q²` | The §9.6 row. |
| §9.3, §9.8 headline | `n ≤ 3` | `2d − s = 2(9+n) − (9+2n) = 9`; `k = 9` base region `(1,≤9), (2,≤7), (3,≤5), (4,≤3)`, no genus five since `2·5 = 10 > 9` | Sound. |
| §4.9, §10.2 headline | `k′ = 4`; `k′ = 13` | `g′ < 7`, `n′ ≤ 4`, `c(g′) ≥ 5`; `k′ = 13`: `g′ ≤ 20`, genus one `n′ = 13`, genus two `9 ≤ n′ ≤ 13` | Seeds lie in the CKgP ranges. |
| §10.4 headline | `k = 14` | `g ≥ 3` base pairs `(3,≤10), (4,≤8), (5,≤6), (6,≤4), (7,≤2)` against `c = 11, 11, 7, 5, 3` | Covered. |
| §12.1 (R02), §12.2 headlines | degrees 13, 15 | degree 13: no `g = 7` (`14 > 13`); degree 15: `(7, 0), (7, 1)` (`14 ≤ 15`), `(7, n ≥ 2)` needs `12 + n ≤ 15` | §7.7 needed in §12.2 only. |
| §12.5, §12.8, §12.9 headline | `g = 3`; `(1, 15)` | `Γ′` vertex of genus `g − 2 = 1` with `|A| + 3` flags, stable; other contraction `(g − 1, n + 2)`; weights `2 + 11 = 13`, `14`, `4 + 11 = 15`; `S₁₆` at `(1, 15)` | Sound; `g ≥ 2` essential. |
| §7.1, §7.5, §7.7 headline | `n = 0, 4` | `45 − 35 = 10`; `dim G₀ = 9·7 = 63` and `63 − 45 = 18 = 3·7 − 3`; `rank Q₄ = 12`, `rank E₄ = 3`; `κ₀ = 12` | Dimensions consistent with `M°_7`. |
| §11.5 | family sizes | `C(14,4) = 1001`; `C(14,3)·11 = 4004`; `11`; `12·11 = 132`; `13·C(12,2) = 858`; sum `6006` | Agrees with clp line 1084. |
| §§2.1–2.3 | `(1,1)`, `(g,0)`, `(g,n≥1)` | `2d − vcd = 2g − 1` (`n = 0`), `2g − 2 + n` (`n ≥ 1`); with top vanishing `2g` for `n ≤ 1` | Matches bfp lines 221–231. |

Unchanged targets outside the sample rely on the computed rows of the round-3 table, which I compared with the present text where a repair touched a neighbour (§§2.4, 4.8, 11.3).

### Lean form and headline theorems

`lake env lean` on `packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace: zero declarations, zero `sorry`, no `set_option`, no `lemma`. The one-tactic probe and the `#check @name` comparison have no subject (the listed lead `and` is English in the docstring).

Headline theorems of the README summary, each named in the docstring as not statable: odd vanishing through nine (§9.8); polynomial count and pure Tate cohomology of `M̄_{4,n}` (§§9.5, 9.7); finite generation and finitely many simple realizations (§§4.9, 4.11); `H⁴`, `H⁶` for `g ≥ 10`, even homology through fourteen (§§10.2–10.4); cusp generation in homological degrees 13 and 15 (§§12.1–12.2); CKgP of `M_{7,n}` (§7.7); the classification in degrees 13–15 (§12.9); and §12.10. None is statable: a search of both pinned trees finds no stable pointed moduli stack, Deligne–Mumford stack, stack Chow group or geometric cohomology of stacks. No statable headline is absent and nothing is padding.

Pinned declarations opened (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:167` (`CuspForm.rank_eq_zero_of_weight_lt_twelve`), `:172` (`CuspForm.rank_eq_one_of_weight_eq_twelve`), `:262` (`ModularForm.dimension_level_one`, even weight); `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120`, `:239` (`quadraticChar_sum_zero` needs `ringChar F ≠ 2`; §8.2 is stated for odd `q`); `Mathlib/Algebra/IsPrimePow.lean:28`; `TauCeti/RepresentationTheory/Spin/HalfSpin/Basic.lean:119`, `:260`, `:324`; `TauCeti/RepresentationTheory/Spin/Dimension.lean:73`; `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106`, `:127`; `TauCeti/NumberTheory/ModularForms/LevelOne/PeriodPolynomial/Finrank.lean:213`; `TauCeti/Geometry/Hodge/Structure.lean:53` (namespace `TauCeti.Hodge`, with `Mixed/` and `Tate/`). Every backticked name in the README is a library name or a supplier's (`coherentGrassmannian`, `grassmannSmoothness` at AlgebraicModuliForArithmeticGeometry §1.3); none is presented as this roadmap's own.

### Suppliers, gaps, duplication

Every cross-roadmap citation was resolved again, on main or at the open head:

- Main: SchemeAndStackFoundations §§1.18–1.23, 3.2, 4.15, 4.17, 5.1–5.8 and Layers 0, 3 (README lines 3538–3829, 5785, 7054, 7411, 7957–8498); StableReduction Layer 1 (line 372); RepresentationTheory/SchurWeyl Layers 7 and 9 and §9.7 (lines 580, 1102, 1429); AlgebraicCurves Layer 12, items 12B and 12C (lines 1597, 1610).
- Open heads: StableReductionPartII §§0.4, 2.248, 3.1–3.3, 3.5, 3.7, 3.10–3.11, 4.1, 4.14, 5.1, 5.10–5.11, 7.11 (all headings present; §7.11 assigns tautological rings and cohomological structures to the consumer); WeilConjectures §§1.7–1.15, 5.22–5.27, 6.8; DeligneWeightsAndPurity §§8.24, 9.6; MixedHodgeModulesAndIrregularHodgeTheory §§4.5, 5.1; MotivesAndAlgebraicCycles §§0.6, 2.4, 2.6, 2.7; AutomorphicGaloisRepresentations §1.2; AlgebraicModuliForArithmeticGeometry §§1.3, 5.1; ArithmeticGaloisRepresentations §§5.1, 5.3; SchemeKTheoryOperations §§6.2.1–6.2.2; HabiroNahmSeries §5.1 (which supplies the augmentation-complete `mvLog`, `mvExp`); MappingClassGroupsAndCanonicalRepresentations §2.3; CanonicalModelsAndGonality §5.4.

`roadmaps resolve` lists nothing found nowhere. The eight gaps have the same slugs and suppliers in `design/plan.json` and in the README, each with a named supplier and a single precise requirement; none asks for what its supplier already states (DeligneWeightsAndPurityPartII, an open roadmap, concerns weight–monodromy by tilting and plans no stack hard Lefschetz).

Duplication by object, searched across main and the open heads: "semi-tautological", "Chow–Künneth generation", "Getzler–Kapranov", the quadric-surface classification over finite fields and the kappa classes occur in no other roadmap; "tautological ring" occurs only in StableReductionPartII §7.11, which hands it here. HomologicalStabilityOfGeneralLinearGroups names §3.4 of this roadmap as the owner of stability for mapping class groups, consistently. `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no revision-only id; this package declares no Lean name, so none collides.

Overlap check: read WeilConjectures, StableReductionPartII, AlgebraicGromovWittenTheory, CountingBundlesAndHallAlgebrasOfCurves, CanonicalModelsAndGonality and, on main, StableReduction (the third list is empty); the pointed stacks and clutching maps are StableReductionPartII's and SchemeAndStackFoundations', counts and traces WeilConjectures', the Brill–Noether gonality bound CanonicalModelsAndGonality's, dual graphs StableReduction's; nothing has two owners.

Dependency check, with `--movable`:

```text
depcheck: 245 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Shape

109 numbered targets, each with a `*Needs:*` line and a Checks list of at least two items; the 19 definitions with an API list have at least three Checks each; all 13 layers end with Examples and Dependencies. No LaTeX delimiters, pull-request numbers, dates, machine paths or process words in the README, the Lean file or the manifest.

### Copyright and arrangement

Twelve passages were put beside their sources: §4.4 (clp lines 57–59), §5.1 (clp 458–462), §5.2 (clp 465–472), §12.4 statement and route (clp 1209–1224; longest shared run seven words, "the inclusion of W is dual to"), §12.8 (clp 1193–1205), §10.8 (clp-h11 463–577), §2.5 (bfp 241–243; arbarello-cornalba line 566), §8.9 route and third Check (bfp 779–790), §4.12 (clp 106–109), §9.3 (bfp 272–277), §6.1 (clp 547–557) and the module docstring of `Suggested.lean` (clp 72–90, 142, 154; bfp 46–47, 109–117). Apart from R01, each is a restatement in the roadmap's words; what coincides is a definition or a statement that admits one form.

Arrangement against clp (sections 2 Preliminaries, 3 Finite generation, 4 CKgP, 5 Genus 7, 6 Even cohomology, 7 Thirteenth and fifteenth homology, 8 Proof of Theorem 1.1): Layer 4 draws on clp §§2–3 and clp-h11 §2; Layer 5 on §4; Layers 6 and 7 split §5; Layer 10 joins §6 with clp-h11 §§3–4; Layer 11 takes Lemmas 7.1–7.10 and Proposition 2.8; Layer 12 takes the proofs of Theorems 1.6, 1.7, 1.1 and 1.9 (the last from §4). clp §2 is distributed over Layers 0, 3, 4 and 11, and Layers 1, 2, 8, 9 come from bfp. The order is forced: §§6.2–6.8 and 7.1–7.7 need §5.2; §10.2 needs §§4.5, 4.9, 5.4; §10.4 needs §7.7 and §9.8; §11.10 needs §10.9; Layer 12 needs §§11.9–11.10. Only Layers 4 and 5 are mutually free. No sentence says the roadmap follows a source and no layer is named after a chapter.

Source independence: 12 passages compared with 4 sources (clp, bfp, clp-h11, arbarello-cornalba), none shared beyond a run of seven words; six tables (84 entries) taken over from bfp, raised as R01; largest share clp, 85 of 181 locators; contents compared with clp: independent.

## Not verifiable

- `harer-vcd` and `mukai`: settled as uncertified; cited by locator, no text read.
- The graph families of §§11.4–11.7 are drawn in figures of clp (Lemmas 7.5–7.7, Figure 2) that the text extraction does not carry; the family descriptions were checked only through their counts and the surrounding proofs.
- Whether `T^k_n` lies in the extension generated by the three printed families for even `k ≥ 24`: no source decides it and this review did not.
- The rank `825` of the restriction matrix of §11.7 was not recomputed; the index and dimension counts of §§11.8–11.9 were.

## Source issues

Confirmed against the texts in this round (the earlier rounds' entries for passages not reread now stand as recorded there):

- **Error** in clp-h11 at Corollary 2.5, arXiv v2 p. 7: the source says boundary pullback of the genus-one degree-eleven holomorphic forms is injective for every n; it should require n ≥ 12, the map being zero on a rank-two group at n = 11; affects a stated result.
- **Gap** in clp at proof of Lemma 3.2, p. 10: the source says the three listed families generate every boundary class; it should justify classes with two odd genus-one factors, possible from degree 24; affects the proof.
- **Misprint** in clp at §6.2, first sentence of the proof of Theorem 1.5(3), p. 23: the source says the range is degrees at least fourteen; it should be at most fourteen; affects nothing.
- **Gap** in clp at proof of Lemma 8.2, p. 28: the source says vanishing holds once 2g − 2 + n exceeds fifteen and otherwise the CKgP applies; it should also use 2g > 15 for n ≤ 1, covering (8,0) and (8,1); affects the proof.
- **Misprint** in bfp at Remark 2.2, p. 1328: the source says a later result improves "Proposition 2"; it should be Proposition 2.1; affects nothing.
- **Misprint** in bfp at §9 opening, p. 1351: the source says the Getzler–Kapranov character formula is Theorem 8.3; it should be Theorem 8.13, as its own §9.3 cites; affects nothing.
- **Misprint** in bfp at §10.1, display for the open genus-four count with three markings, p. 1355: the source says the coefficient −11 belongs to the fourth power; it should be the third power, as in its Theorem 1.5; affects nothing.

## For the human reviewers

- **Scope.** CLP Lemma 3.2 is printed for all degrees; README §4.6 (line 623) proves it for odd `k` and `k ≤ 23` and records the even `k ≥ 24` case as unproved and not a target. Whether to carry the printed form is yours.
- **Licence.** `bfp` is an author-page copy of an Annals article marked © Princeton (bfp line 39); `sources.toml` records `licence_class = "author-page"` and no reuse licence. R01 concerns data from it. `clp` is CC BY (clp lines 46–47).
- **Licence.** `kannan` is a 2026 arXiv preprint (`sources.toml`, arXiv 2602.09117v2), used in README §9.1 only for a misprint note.
- **Licence.** `harer-vcd` and `mukai` have status `uncertified` and no cached text.
- **Scope.** The package now consumes CanonicalModelsAndGonality §5.4, an open pull request (#1726) by another author that is not yet in the merge order; it must merge first.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eb7f14105f235b4eb9773009bc6a305b9e59664f", "job": "REV-PKG-MotivicStructuresInModuliOfCurves~4", "model": "fable", "worker": "chris-x30"} -->
