<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6901028604 -->
Review (claude) of 3cfd078

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Four consumed suppliers are missing from the supplier contracts, two of them from the scope as well

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:256` "*Needs:* QuadraticFormInvariantsPartII §§2.5, 3.9, 5.6; ArithmeticGaloisDuality §R02.4.4; ClassicalAdicEtaleCohomology §11.2", `:364` "AnalyticNumberTheoryPartI §0.21 (Mertens's second theorem)", `:308` "JacobianChallenge Layer F".

   **Claim.** `## Exact supplier contracts` states, per supplier, every section consumed, and `## Scope and ownership` names every roadmap the text imports from.

   **Witness.** Counted by lines 5–35 (scope) and 49–123 (contracts):

   | Citation | Used at | In scope | In contracts |
   |---|---|---|---|
   | ClassicalAdicEtaleCohomology §11.2 | 242, 256, 460 | 0 occurrences | 0 occurrences |
   | AnalyticNumberTheoryPartI §0.21 | 364, 460 | 0 | 0 |
   | QuadraticFormInvariantsPartII §2.5 | 240, 256, 460 | not in the list of line 20 | not in the paragraph of line 75 |
   | JacobianChallenge Layer F | 295, 308, 460 | line 31 | 0 |

   All four resolve at the suppliers' heads (§11.2 `field_cohomological_dimension_transcendence`; §0.21 "Mertens's second theorem: the reciprocal-prime sum"; §2.5 "Springer's theorem", `anisotropic_extendScalars_of_odd_finrank`, stated for inseparable extensions; Layer F "Abel–Jacobi and the universal property"), and all four suppliers are earlier in the merge order or on main, so only the contract text is missing.

   **Exact repair.**

   - Scope, line 20: after "§1.5 (isotropy equals hyperbolicity)," insert "§2.5 (Springer's theorem for odd-degree extensions, separable or not),".
   - Scope: add two bullets after the ArithmeticGaloisDuality bullet: "**ClassicalAdicEtaleCohomology** §11.2 (the transcendence-degree bound for the cohomological dimension of a field)." and "**AnalyticNumberTheoryPartI** §0.21 (Mertens's second theorem)."
   - Contracts, QuadraticFormInvariantsPartII paragraph (line 75): after the §1.5 item insert "§2.5 an anisotropic quadratic form stays anisotropic over every finite extension of odd degree, inseparable extensions included;".
   - Contracts, "From the other earlier roadmaps": add "ClassicalAdicEtaleCohomology §11.2: `field_cohomological_dimension_transcendence`, `cd_ℓ(L) ≤ cd_ℓ(K) + trdeg_K(L)` for every field extension `L/K` and prime `ℓ`; used with `ℓ = 2` in 0.6(c)." and "AnalyticNumberTheoryPartI §0.21: `Σ_{p ≤ x} 1/p = log log x + B + O(1/log x)`; 0.11(a) uses only the bound `O(log log x)`."
   - Contracts, "From the roadmaps on main": add "JacobianChallenge Layer F: the pointed Abel–Jacobi morphism of a smooth proper curve with a rational point and its Albanese universal property; the curve case of 0.8a."

   Tested on the witness: after these insertions each of the four names occurs in lines 49–123 and the first three in the scope list.

2. **F02** (P3) A theorem of a work the manifest does not record is cited by number

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1146`: "(Stacks, Lemma 10.157.6, tag 031T; Dittmann–Pop, proof of Proposition 5.1, p. 16, citing Matsumura, Theorem 11.5)".

   **Claim.** Every cited work is recorded in `sources.toml` and in the References.

   **Witness.** "Matsumura" occurs once in the README (line 1146), not in `## References` and not in `sources.toml` (19 entries, none for it). The statement is located already: `stacks` tag 031T reads "R a Noetherian normal domain … `R = ⋂_{height(𝔭)=1} R_𝔭`", and `dittmann_pop line 711` is the use.

   **Exact repair.** Delete ", citing Matsumura, Theorem 11.5" from line 1146. The two remaining locators carry the statement; nothing else changes.

3. **F03** (P3) Resolution of surfaces is located only by a chapter

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:513` "for `d = 2` resolution of surfaces supplies it (Stacks, chapter *Resolution of Surfaces*)"; the same chapter-level citation at lines 522, 540, 569, 1031, 1106 and 1455; the uses without any locator at lines 526 ("it exists by resolution of arithmetic surfaces") and 1021.

   **Claim.** Three targets (the smooth projective model of 1.4 for `d = 2`, the regular model `𝒳` of 1.5, the smooth surface `X` of 5.4) rest on a theorem; every theorem has an exact locator.

   **Witness.** The theorem is one statement of that chapter: Stacks, Theorem 54.14.5 (Lipman), tag 0BGP, read in the chapter text the sources service fetched (line 1880 of that extraction): for a two-dimensional integral Noetherian scheme `Y`, a resolution by normalized blow-ups exists exactly when the normalization is finite, has finitely many singular points and has normal completed local rings there. The README names neither the theorem nor why its condition holds.

   **Exact repair.**

   - Lines 513, 522, 540, 1031: replace "Stacks, chapter *Resolution of Surfaces*" by "Stacks, Theorem 54.14.5, tag 0BGP (Lipman)". In the Dependencies lines 569 and 1106 likewise.
   - Line 513, after the locator, add: "its condition (4) holds because a projective surface over a field is excellent: the normalization is finite, a normal surface has finitely many singular points, and the completions of an excellent normal local ring are normal; a resolution by normalized blow-ups of a projective surface is projective, and regular is smooth over the perfect field `𝔽₂`".
   - Line 526: "(it exists by resolution of arithmetic surfaces)" → "(it exists by Stacks, Theorem 54.14.5, tag 0BGP, applied to a projective flat model, which is excellent)".
   - Line 1021: "(resolution of surfaces)" → "(Stacks, Theorem 54.14.5, tag 0BGP)".
   - Line 1455 (References): replace "chapter *Resolution of Surfaces*" by "*Resolution of Surfaces*: Theorem 54.14.5 (tag 0BGP)". In `sources.toml`, in the `locator` of `stacks`, replace "chapter Resolution of Surfaces (tag 0ADX)" by "Theorem 54.14.5 (tag 0BGP)".

   Tested: for `Y` a projective closure of an affine model of `𝔽₂(s, t)`-type fields (`d = 2`), `Y` is of finite type over a field, so (4) holds and (3) gives a regular projective `X`; for 1.5, `Y` projective flat over `ℤ` or over a curve over a finite field is excellent of dimension two.

Three findings, none blocking (all P3). The three findings of the previous round are repaired, and the mathematics of the changed passages holds on the instances that refuted the old text. What remains is in the supplier contracts and in two locators; each repair is a few lines of README text, and `Suggested.lean` needs no change. No author file was changed by this review, except that the sources service appended two section labels to the `cited_for` list of the existing `stacks` entry of `packages/LogicAndDefinabilityInNumberTheoryPartII/sources.toml` when it fetched the Stacks chapters named below.

## Verified sound

### Previous findings, finding by finding

| Previous finding | Repaired passage (quoted) | Status |
|---|---|---|
| F01 (P2): the route of `gap:finite-field-divisor-adapted-fibration` chose `g` by a condition that does not make `C` dominate `B` | `README.md:103`: "the ratios `g/f` of degree-`d` forms `g` over `k`, restricted to `C`, generate the function field `k(C)` … so some degree-`d` form `g` over `k` has `(g/f)|_C` transcendental over `k`"; "because `(f/g)|_C` is transcendental over `k`, so that the image of `C` is not a closed point of `ℙ¹_k`"; new Check at `README.md:1027` | **Repaired** |
| F02 (P3): "onto which" attached to the generic fibre | `README.md:103`, `:1021` and `design/plan.json`: "whose generic fibre is smooth and geometrically integral over `k(B)` and under which the strict transform of `C` maps dominantly onto `B`" | **Repaired** (three places; no "onto which" remains) |
| F03 (P3): four page locators off by one | `:370` "pp. 9–10"; `:422` "p. 10"; `:947` "pp. 14–15"; `:988` "p. 15"; and the three further ones the repair found: `:727` "pp. 8–9", `:1114` "pp. 16–17", `:1213` "p. 17" | **Repaired**; all seven agree with the page markers (`poonen_uniform` page 10 = lines 454–495; `dittmann_pop` pages 8, 14–17 start at lines 322, 606, 648, 691, 734) |

Pattern search for the repaired defects in the rest of the package: no other step argues dominance from "not a `k`-multiple" (searched "multiple of", "constant on", "dominat"); every Dittmann–Pop page locator of Layers 2–7 was compared with the page markers while reading pp. 8–18 (Definitions 3.3, 3.7, Propositions 3.4, 3.8, 3.10 and its Claims 1–3, Notations/Remarks 4.1, Theorem 4.2, Recipe 4.3, Remark 4.4, Proposition 5.1, Fact 5.2, Lemma 5.3 and its Claim, Remark 5.4, the bi-interpretability proof): all agree.

The maintainer left no notes for this roadmap.

### Principles and shape

Read in full: the README (1459 lines, 9 layers, 74 numbered subsections, 74 Checks blocks), `Suggested.lean` (10 declarations), `metadata.toml`, `sources.toml` (19 entries) and the four gaps of `design/plan.json`. No route-specific shortcut, re-planned roadmap, computational algorithm, sorry'd data or `set_option`. A scan of both files for process words, pull-request numbers, machine paths, HTML anchors and LaTeX delimiters found none. Every layer ends with Examples and Dependencies. The layer order is forced by the Needs lines (3.1 needs 1.2–1.4 and 2.1; 4.6 needs 3.8; 5.2 needs 4.7; 6.4 needs 5.7; 7.6 needs 6.9; 8.5 needs 7.6).

### Seeded source sample (15 targets)

| Target | Text read | Result |
|---|---|---|
| 0.5 | `stacks` Lemma 160.10 (tag 0C0S) and Theorem 160.8 (tag 032A) in the algebra chapter fetched this round; `poonen_uniform lines 615–627` (Lemma A.5, statement p. 13, proof p. 14); `pop_eei line 257`, p. 8 | Supports: 0C0S(2) needs a field mapping isomorphically to the residue field, which the README obtains by lifting the separable `k_x`; the order of the Laurent variables agrees with Pop's |
| 0.12 | `poonen_uniform lines 415–487`, pp. 9–10 | Supports (a), (c); (b) and (d) are the README's corrected forms (see Source issues), and the README's own proof of (b) was recomputed below |
| 2.6 | `dittmann_pop lines 457–460` (Definition 3.7, p. 10), `601–604` (4.1(1)(c)–(d), p. 13) | Supports; the README takes `ε_i ∈ k₁ˣ` as 4.1(1)(c) does |
| 3.4 | `dittmann_pop lines 530–542`, Claim 1, p. 12 | Supports; the README's factorization has the right sign, the source's a misprint |
| 4.3 | `dittmann_pop lines 616–617` and `636–637`, p. 14 | Supports (oddness from Proposition 3.4(2) since lower slots lie in `k_t`) |
| 4.4 | `dittmann_pop line 617`, p. 14 | Supports: `b_w = {τ : w(τ²) > w(a_d)}` |
| 4.5 | `dittmann_pop line 618`, p. 14 | Supports |
| 5.1 | `dittmann_pop lines 340–345` (Definition 3.3, p. 8), `665–672` (Recipe 4.3, p. 15) | Supports; the Hensel and preordering formulas are the README's own |
| 5.2 | `dittmann_pop lines 665–672`, p. 15 | Supports |
| 6.2 | `dittmann_pop lines 697–702`, p. 16 | Supports |
| 6.3 | `stacks` Lemma 157.6 (tag 031T); `dittmann_pop line 711`, p. 16 | Supports; R02 |
| 6.6 | `dittmann_pop lines 738–739`, p. 17, and `708–711`, p. 16 | The source asserts the inclusion without argument; the README's construction was checked (below) |
| 6.7 | `dittmann_pop lines 751–762`, p. 17 | Supports; the README restricts `ζ` to the torus, which the source's "roots of unity" needs |
| 6.8 | `dittmann_pop lines 737–748`, p. 17 | Supports |
| 8.1 | `akns lines 903–956`: Proposition 2.28 and Lemma 2.29, p. 20; proof and Lemma 2.30, pp. 20–21 | Supports |

Also read this round, outside the sample: `poonen_uniform lines 226–414` (Lemmas 4.1–4.6, pp. 6–9: 0.11's five statements and page range agree), `lines 489–542` (proofs of Theorems 1.1–1.4 and Lemma 5.2, pp. 10–12), `akns lines 1063–1084` (proof of Theorem 3.1, p. 23), `pop_eei2 lines 474–477` and `734` (Notation/Remarks 3.5, p. 2102; Recipe 5.1), and Stacks tags 00NP, 00NQ, 00PD, 00TT, which say what 0.6(e) uses them for.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Gap route, choice of `g` (README 103) | `𝔽₂`, `ℙ²`, `C: x²+xy+y²`, `f = y`; `g = x`, `g = z` | `(x/y)|_C = ω`, `ω²+ω+1 = 0`, algebraic: excluded; `(z/y)|_C` transcendental: chosen; base point `(1:0:0)`, `1 ≠ 0` so off `C`; `deg(C → ℙ¹) = 2` | holds |
| Gap route, `g` not vanishing on `{f = 0}` | `g = cf`, `c ∈ k` (incl. `c = 0`) | `(g/f)|_C = c` algebraic, contradiction | holds |
| Gap route, existence in every large degree | Poonen's density is a limit | positive limit ⇒ nonempty for all large `d`; `ℙ²_{𝔽₂}`, one rational point avoided: `(1−1/8)(1−1/4)(1−1/2)/(7/8)·(1/2) = 3/16 > 0` | holds |
| 5.4 new Check (README 1027) | `𝔽₂(s,t)`, `v` = valuation of `s²+s+1` | residue field `𝔽₄(t)`; `v(s²+s+1) = 1` so nontrivial on `𝔽₂(s)`; `v(t) = 0`, residue of `t` transcendental, `[𝔽₄(t):𝔽₂(t)] = 2`; `δ(𝔽₄(t)) = 1 = 2 − 1` | Check true, both halves |
| 5.4 model step | `A′ = 𝔽₂[s,t]`, `t`-adic `v` | `𝔪_v ∩ A′ = (t)`, height 1, residue of `s` transcendental, `A′_(t) = O_v` | holds |
| 0.5 | `𝔸¹_ℚ` at `0`; node; `𝔽₂(s)`, point `t² = s` | `1/(1−t) ↦ Σ tⁿ`; completion of the node has two branches; a coefficient field `C ⊇ k` would give `r ∈ C`, `r² = s`, and `(t−r)² = t²−s` of value 1, impossible in a discrete valuation ring | separability needed, as stated |
| 0.6(a), cubic over a quadratic extension | `𝔽₂(s)`, `r² = s`, `q = X³ + sY²Z`, `P = (r,1,r)` | `r³ + s·r = 2sr = 0`; `f(X,Y) = Y(Y² + sX²)`; linear factor gives `P₀ = (0,1,0)`, `q(P₀) = 0` | holds for inseparable `L` |
| 0.6(c) number-field case | `ℚ`, `⟨⟨1,1⟩⟩₂ ⊗ ⟨1,1⟩₂` | `8⟨1⟩`, anisotropic, `n = 2 = r + ε`; with `√−1`: `(n+1)`-fold Pfister, `n + 1 ≥ r + 3 > cd₂(K) = r + 2` | `√−1` needed, as stated |
| 0.6(e) | `𝔽₂(s)`, `π = u² + s`, `q = X³ + sY³` | reduction `X³ + r²Y³`: `3·ord x = 2 + 3·ord y` impossible; blocks have values `0, 1, 2 mod 3` | anisotropic; inseparable residue field covered |
| 0.12(a)–(b), example | `𝔽₅`, `E: y² = x³+x+1`, `c = 2` | points over `x = 0,2,3,4`: `2+2+2+2`, plus `O`: `9`; trace `5+1−9 = −3`; `P₀ = (2,1)`: `8+2+1 = 11 ≡ 1`; `z(P₀) = 1/2 = 3`, `b = 2·3 = 1`, `∂(s²−b)/∂s = 2 ≠ 0` at `s = 1`; `2` nonsquare mod 5 | README Checks 384–386 true |
| 0.12(b), sums cut down to `K` | same, `b = 0`, `t = s²` | `z ∈ y_u·K` on anti-invariant points, so sums in `K` are `0`; `⟨1, s²⟩`: `(2s)² + s² = 5s² = 0` | a test over `K` would accept `s² ∉ L`: the README's form over `K_u` is needed |
| 0.12(b), slot from `z` | `ord_O x = −2`, `ord_O y = −3` | `ord_O z = −1`; `z∘η` has a simple pole at `P`, `x∘η` a double one | parameter of order one only with `z` |
| 0.12(b), `t ∈ L` | two slots over `L_u`, trdeg 1 over finite `κ` | `n = 2 ≥ r + ε = 1 + 1`, `m = 2` | isotropic by 0.6(c) |
| 0.12(d), maximality | `𝔽₄(s,t)`, fibre `𝔽₂(s)` | `δ = 1`, not relatively closed; `𝔽₂(s) ⊊ 𝔽₄(s)` removes it; `L(ζ₃) ∩ K = L` since `K/L` is regular | members are exactly `𝓛(K)` |
| 2.6 | `v(a₁) = 1`, `v(ε₂) = 1`; `d = 3` | fails the unit clause; one middle slot `t₂ − ε₂ ≠ 0` (transcendental minus constant) | Checks true |
| 2.4 example | `a₀ = 3`, `a₁ = 145`, `l₁ = ℚ(i)`, `Σ = {2}` | `145 = 5·29 = 2·72 + 1`; `145 ≡ 1 mod 8` and `mod 3`: square in `ℚ₂`, `ℚ₃`; squares mod 5 are `1, 4`, so `3` is not; `5 ≡ 1 mod 4` splits | nice, anisotropic over `ℚ₅ ⊇ ℚ(i)` |
| 2.1 Check | `(21,−1)`, `(7/3,−1)` | `(21,−1)₂ = (−1)^{10·(−1)} = 1`; `v₃(7/3) = −1` odd, `−1` nonsquare mod 3 | first nice, second not |
| 3.4 | `w̃(u_i) < 0` | `a_i = u_i² − u_i − ε_i = u_i²(1 − 1/u_i − ε_i/u_i²)`, second factor `≡ 1` | square times principal unit; sign as in the README |
| 3.5 | `N = 1`, values `(5, 2, 0)`; all lower values `0` | `5 ≥ 2·1·(2+0) = 4`, `5 > 2`, `5 > 0`; `w(a_d) > 0 = N·0` | strict inequalities hold |
| 4.3 | `a_d ∈ k_tˣ`; one zero of odd order | no zero, `V_a = ∅`; lower slots in `k_t` have value 0, so 3.2 gives `w(a_d)` odd | holds |
| 4.4 | `w(a) = 1, 3`; `τ = 0` | `m = 0`: ball `𝔪`; `m = 1`: `2·1 ≤ 3` out, `2·2 > 3` in; `0` in by the explicit branch, while `ord 0 = 0` would give `0 > 3` false | `B = 𝔪^{m+1}` |
| 4.5 | `a = t³`, `x = t`, `x = 1/t` | `t·t²` has value 3 ≥ 2; `(1/t)·t² = t`, value 1 < 2 | `Stab = O_w` |
| 4.6 identity | `β² − β = τ²/a_d` | `(a_dβ/τ)²(1 − 1/β) = a_d²(β²−β)/τ² = a_d` | holds |
| 4.6, ramification | `[L:K] ≤ 2`, `w_L(a_d)` odd | `e·w(a_d)` odd forces `e = 1` | inequality descends to `K` |
| 4.7 Check | `ℤ ∪ ℤ√2 ⊂ ℚ(√2)` | `√2·ℤ ⊆ ℤ√2`, `√2·ℤ√2 = 2ℤ ⊆ ℤ`: `√2` stabilizes the union, not `ℤ` | no general identity, as stated |
| 5.1, real clause | `a₀ = a₁ = −1`; `a₀ = 3` | `−1 = σ₀ + σ₁ + σ₂ + σ₃` impossible in `ℚ`; `a₀ > 0`: tail indefinite | formula rejects and accepts correctly |
| 5.1, dyadic Check | `⟨1,−3,−5,15⟩` | `(5,3)₂ = (−1)^{2·1} = 1`; `(5,3)₃ = (5/3) = (2/3) = −1` | isotropic over `ℚ₂`, anisotropic over `ℚ₃` |
| 5.2 | `O_P ∩ O_Q`; `K`; zero slot | `x` with orders `(−1, 1)`: neither `x` nor `1/x` in; `K` omits nothing; guard fails | all three fibres empty |
| 5.5 threshold | `𝔽₂(t)`, `n = 3`, `δ = t` | `c_n = 3`, `v_t(3) = 0`: condition `v_t(β−1) > 0`; printed `2v_t(6) = ∞` excludes `β = 1` | README's `c_n` needed |
| 5.7; `exists_formula_isGeometricPrimeDivisor` | `d = 0`; `ℚ`; `𝔽_q(t)`; `ℚ(t)` with `ℤ_(p)[t]_{(p)}` | a field is no discrete valuation ring; residue char `p ≠ 0`; residue `δ = 0`, `0 + 1 = 1`; residue `𝔽_p(t)` char `p ≠ 0` | none; none; all places; excluded |
| 6.2 | `𝔽₂(t^{1/2}, s)`, `T = (t, s)`; `ℚ(√2)`, `T = ()` | `R_T = 𝔽₂[t^{1/2}, s]`, rank 2; `R_T = ℤ[√2]`, `√2/3 = (1/3)√2` | finite, fraction field `K` |
| 6.3 | `ℤ`; `k[t², t³]` | `⋂ ℤ_(p) = ℤ`; discrete valuation rings among the localizations are `k[t]_{(p)}`, `p ≠ t`, with intersection `k[t, t⁻¹]` | Check true |
| 6.6 | `e = 1`; `ℚ(s,t)`, `w` = `s`-adic | residue field already a number field; elements of `k[[x,y]]` have `v_y ≥ 0` and leading coefficient in `k[[x]]`, so are integral for the rank-two valuation; through `t = ∞`, `t` is not | inclusion `⋂_{V_T} ⊆ S_T` holds |
| 6.7 | `f = (s+2)/3` | `ḡ = s + 2`, `ḡ(2) = 4 = 1 ≠ 0` in `𝔽₃`; lift `−1`; `g(−1) = 1`; value of `f` is `−1` | excluded; `ζ` must be chosen in the torus |
| 6.8 | `ℚ(i)`, `5 = (2+i)(2−i)`; rank | `v_{2+i}(1/(2−i)) = 0`; a finite-index subgroup of lexicographic `ℤ^{e+1}` is again lexicographic `ℤ^{e+1}` | all prolongations needed; `V_T` restricts and prolongs |
| 6.9; `exists_formula_arithmeticNormalization` | `(0,0)` `𝔽₄`; `(1,0)` `ℚ`; `(1,1)` `𝔽₂(t)`, `T = (t²)`; wrong `e` | all of `𝔽₄`; `ℤ`; `𝔽₂[t]` via `X² − t²`; no transcendence basis of that length, vacuous | `IsIntegral` over `Subring.closure (range T)` is `R_T` |
| 0.8; `exists_sentence_kroneckerDimension_eq` | `𝔽₄`, `ℚ`, `ℚ(t)` | `δ = 0, 1, 2`; `m = δ + 1 = r + ε`: `0+1`, `0+2`, `1+2` | thresholds meet with equality |
| 0.10(e); `exists_sentence_charZero` | `ℚ`; char 3; char 2; `Z = ∅` | `ℤ ≠ 2ℤ`; `s = 2·(2s)`, so `Z = 2Z`; `2 = 0`; `∅ = 2∅` | true in `ℚ`, false in every field of positive characteristic |
| 0.13; `exists_formula_isAlgebraic_primeField` | `𝔽₉`, `𝔽₉(t)` | empty family gives `K`; members have constants `𝔽₉` | agrees |
| 0.14(b); `exists_formula_not_algebraicIndependent` | `n = 0`; `n = 1`; `(s, s²)`; global `K`, `n = 2` | false; `t₁ ∈ κ`; member `L ∋ s`, `s²` dependent over `L`; `L = K`, every `t₂` dependent | both directions hold |
| 8.1 | `ℚ` as a ring; `ℤ` | not finitely generated, out of scope; no sentence among all rings (compactness) | scope as stated |
| 8.4; `…_of_isDomain` | `B = 𝔽₉`, `S` zero ring, `ℤ/9` | zero ring fails `0 ≠ 1`; `3·3 = 0` fails the field axioms | only `𝔽₉` realizes `θ₉` |
| 8.5; `exists_sentence_realize_iff_nonempty_ringEquiv` | `K = 𝔽₄` vs `𝔽₂`, `𝔽₄(t)` | cardinalities `4`, `2`, infinite | `L` carries only `Field.FG` |
| R01 | lines 5–35, 49–123 | occurrence counts `0/0`, `0/0`, `0/0`, `1/0` | finding |
| R03 | Theorem 54.14.5 (4) for a projective surface over `𝔽₂` | excellent: finite normalization, finite singular set, normal completions | theorem applies; locator missing |

### Lean acceptance test

- `lake env lean` on `packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean`, run from the content checkout: exit 0; the only output is eight "declaration uses `sorry`" warnings (lines 54, 62, 73, 81, 93, 113, 128, 139). The import header is the single `import Mathlib`.
- `#check @name` for all ten declarations in one scratch copy: every elaborated type agrees with its README statement (§§0.1, 0.2, 0.8, 0.10(e), 0.13, 0.14(b), 5.7, 6.9, 8.4, 8.5); no binder is lost; nothing changed.
- One-tactic probe on all eight sorried theorems in the same scratch copy, each with `simp`, `rfl`, `infer_instance`, `trivial` and `exact?` under `fail_if_success`: all 40 failed to close (exit 0). No padding; no declaration mirrors a Check or treats a boundary case.
- Headlines of the Summary: uniform geometric prime divisors (stated), finite normalizations (stated), bi-interpretability with ℤ (named in the docstring as not statable; no `Interpretation` structure exists under `Mathlib/ModelTheory` at the pin), the single sentence (stated for fields and for domains), and the Layer 0 results of Pop and Poonen (four stated). The characteristic-two cases above dimension three are named in the docstring. All ten Lean names occur in the README and every backticked name the README attributes to this roadmap is one of the ten.

### Pinned declarations opened

Mathlib: `Field.FG` (`Mathlib/Algebra/Field/Subfield/Basic.lean:458`), `FirstOrder.Ring.CompatibleRing` and `compatibleRingOfRing` (`Mathlib/ModelTheory/Algebra/Ring/Basic.lean:156, 223`), `Set.Definable` (`Mathlib/ModelTheory/Definability.lean:54`), `algebraicClosure` (`Mathlib/FieldTheory/AlgebraicClosure.lean:39`), `ValuationSubring.ofPrime` (`Mathlib/RingTheory/Valuation/ValuationSubring.lean:298`), `LocalSubring.exists_le_valuationSubring` (`Mathlib/RingTheory/Valuation/LocalSubring.lean:117`), `QuadraticMap.Anisotropic` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054`), `HenselianLocalRing` (`Mathlib/RingTheory/Henselian.lean:95`), `FiniteField.ringEquivOfCardEq` (`Mathlib/FieldTheory/Finite/GaloisField.lean:260`). Tau Ceti: `Scheme.Hom.exists_finite_isSeparable_comp_eq` (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43`), `patchTopology`, `compactSpace_patchTopology`, `isClopen_patchTopology_basicOpen` (`TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96, 196, 209`), `Place`, `Place.integers`, `Place.ord` (`TauCeti/FieldTheory/FunctionField/Place/Basic.lean:103, 132, 145`), `Place.exists_ne_zero_forall_mem_ord_eq` (`…/Place/Approximation.lean:145`), `Place.exists_ord_eq_neg_and_forall_ne_ord_nonneg` (`…/Consequences/HighDegree.lean:247`), `Place.exists_forall_mem_valuation_sub_le_and_forall_mem_integers` (`…/Consequences/StrongApproximation.lean:88`), `AbelianVariety.IsAlbanese` (`TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84`). The five names the citation resolver listed are supplier-planned names; each was found in its supplier's README at the head (`polarizedDescentComparison`, `valuation_prolongation_integrality`, `root_coefficient_descent` in AlgebraicModuliForArithmeticGeometry §§3.5, 7.5; `properAlbanese_exists` in ColemanIntegrationPartII §4.0b; `lang_weil_uniform` in SieveMethodsAndPrimePatterns §5.4).

### Duplication, suppliers and merge order

- Every cross-roadmap citation was resolved this round. On main: AlgebraicCurves Layers 0, 2, 6, 12; ClassFieldTheory Layers 10, 13 (`cyclicHasseNorm`); EllipticCurves Layers 0, 1, 3, 4, 5, 6; GlobalQuadraticForms §5.5; JacobianChallenge Layer F; SchemeAndStackFoundations §§0.12, 0.20, 2.15, 4.13; Chebotarev Layer 10 (`hasDirichletDensity_frobeniusPrimeSet`); GlobalNumberFields Layers 1, 6 (both declarations); RealAlgebraicGeometry Layer 1. At open heads: LogicAndDefinabilityInNumberTheory §§0.1–0.4; QuadraticFormInvariantsPartII §§1.1, 1.2, 1.5, 2.5, 3.1, 3.7–3.9, 4.1–4.3, 5.6, 5.7, 6.3, 6.5, 7.2; LocalFieldsRamificationPartII §§1.1–1.3, 5.1–5.3 (1.3 and 5.2 are run-in sections it cites itself); AlgebraicModuliForArithmeticGeometry §§3.5, 7.5; AdicCoefficientsAndComparisonsPartII §§PA.6.8, PA.6.10; ArithmeticGaloisDuality §§R02.3.2, R02.4.4; FunctionFieldArithmetic §5.8; AbelianSchemesAndArithmeticModuli §§A1.8, A3.1, A6.5; NeronModelsAndSemistableAbelianVarieties §5.1; ColemanIntegrationPartII §4.0b; WeilConjectures §5.29; SieveMethodsAndPrimePatterns §5.4; LefschetzPencilsAndVanishingCycles §3.5; DeligneWeightsAndPurity §§7.12, 7.15; MotivesAndAlgebraicCycles §0.5b; KTheoryFiniteLocalFields §§3.0, 3.0a; ClassicalAdicEtaleCohomology §11.2; AnalyticNumberTheoryPartI §0.21. All exist and say what they are cited for.
- Remark, no change here: AdicCoefficientsAndComparisonsPartII (its README line 1754) names "LogicAndDefinabilityInNumberTheoryPartII §2.1" as the consumer of its §PA.6.10; the consumer is §3.1 of this roadmap.
- Ownership by object, searched on main, at the open heads and in the board packages: no other `Suggested.lean` declares `IsGeometricPrimeDivisor` or any of the eight theorem names; "geometric prime divisor", "bi-interpretab", "Kerz–Saito" and definable homotopy of interpretations occur nowhere else; the cyclic Hasse norm theorem for function fields occurs nowhere; no roadmap constructs the Albanese variety or torsor of a higher-dimensional variety over an arbitrary field (ColemanIntegrationPartII §4.0b has the pointed characteristic-zero case and is cited). `kroneckerDimension` is declared by QuadraticFormInvariantsPartII in its own namespace with the same body; this package says in its scope that it restates that notion, and the fully qualified names differ.
- Gaps: the four slugs agree between `design/plan.json` and the README's contracts; each names an earlier supplier (ORDER lines 324, 62, 69, 69; this roadmap is line 392), is precise, and asks for what nobody provides.
- Overlap facts: no other pull request changes this roadmap, no cited id is dropped, none is defined only by a revision.

Dependency check:

```text
depcheck: 243 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Overlap check: read QuadraticFormInvariantsPartII, AdicCoefficientsAndComparisonsPartII, LogicAndDefinabilityInNumberTheory, LocalFieldsRamificationPartII, MotivesAndAlgebraicCycles; one object shared: the Kronecker dimension, owner QuadraticFormInvariantsPartII §5.7 (restated here on pinned carriers and cited); nothing else shared.

### Copyright, licences and scope

Wording: 21 passages set beside the sources (the 15 sampled statements; the routes of 0.14(a), 4.6 and 7.3; 0.10(e), 0.11(b) and 5.5). The longest shared runs are one-line theorem statements that admit little variation: 0.11(b) with `poonen_uniform lines 323–325` (about 10 words) and the three clauses of 0.10(e) with `line 491`. The route of 0.14(a) lists the ingredients of Poonen's proof (`lines 526–536`) in the order the argument forces, in about a third of the length and in other words; I do not count it as shared expression.

Arrangement: Dittmann–Pop has the largest share (59 of 138 parenthetical locators). Its sections are 1 Introduction, 2 local–global principles, 3 A/B/C, 4 uniform definability, 5 main theorem. The layers do not map onto them one to one: Layer 0 is Poonen, Rumely and Pop 2002; Layer 2 takes §3 B with the definition of §3 A; Layer 3 takes Proposition 3.4 of §3 A with §3 C; Layers 4 and 5 divide §4 and add Pop 2017; Layers 7–8 are mostly AKNS. The order is the one the Needs lines force.

Reuse: no table, figure or list of examples is taken over. I know of no public formalisation that `Suggested.lean` resembles.

Source independence: 21 passages compared with 5 sources, none shared; largest share dittmann_pop, 59 of 138 locators; contents compared with dittmann_pop: independent.

## Not verifiable

- `kato_hasse`, `merkurjev_suslin`, `moret_bailly` and `lenstra_cm` are settled as uncertified; only the papers that quote them were read (`pop_eei2 line 258`, `poonen_uniform line 326`).
- Matsumura's Theorem 11.5 (R02) was not opened: no legal copy is recorded, and the statement is located by the Stacks tag.
- Sections outside this round's sample and the previous round's (0.7, 0.8a, 0.9, 1.3–1.6, 2.3, 2.7, 5.5, 5.6, 7.1, 7.2, 7.4) were read in full and their Checks recomputed where they carry numbers, but not compared line by line with their sources this round, except where listed above.
- Ownership against open pull requests was checked through the roadmap service's index (473 open pull requests) and the board packages; nothing outside that index was checked.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, p. 9: the source says the sums of the coordinate function are taken in `K` and the form is tested over `K`; it should take them in the quadratic extension `K_u` and test there; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, p. 10: the source says `x` composed with a separable endomorphism has a simple pole at the point; it should use `z = y/x`, since `x` has a double pole; affects the proof.
- **Gap** in poonen_uniform at Proposition 4.10, p. 10: the source says keeping the fibres that are fields of Kronecker dimension one leaves exactly the relatively closed ones; it should also discard non-maximal fibres, or prove closedness; affects a stated result.
- **Misprint** in dittmann_pop at Proposition 3.10, proof of Claim 1, p. 12: the source says the unit factor is `1 − 1/u_i + ε_i/u_i²`; it should be `1 − 1/u_i − ε_i/u_i²`; affects nothing.
- **Misprint** in dittmann_pop at Notations/Remarks 4.1(2) and proof of Theorem 4.2, p. 14: the source says the divisor set is taken over `k_a`; it should be over `k_t`; affects nothing.
- **Misprint** in dittmann_pop at Proposition 5.1, Case 2, p. 16: the source says the composites `v ∘ w` are indexed by the rank-one family `W_T`; it should index them by the geometric prime `e`-divisors just defined; affects a stated result.
- **Gap** in dittmann_pop at proof of Lemma 5.3, p. 17: the source says the intersection lies in the geometric normalization "as above"; it should show that each pole-detecting divisor is refined by a flag with a terminal place keeping `T` integral; affects the proof.
- **Error** in akns at proof of Theorem 3.1, p. 23: the source says the finitely generated one-dimensional core is therefore Dedekind; it should first invert a conductor element, since the core of `ℤ[√5, t]` is `ℤ[√5]`; affects the proof.
- **Error** in pop_eei2 at Notation/Remarks 3.5, p. 2102, and Recipe 5.1: the source says the congruence threshold is twice the value of `2n`; it should use `n` in characteristic two, where `2n = 0` has infinite value; affects a stated result.

## For the human reviewers

- Licence: `achter_casalaina_vial` is recorded with venue Annales de l'Institut Fourier 76 (2026) and was read as arXiv v3; the published volume was not confirmed (`packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1459`).
- Scope: two gaps of this roadmap rest on Poonen's Bertini theorem over finite fields, which no roadmap owns (LefschetzPencilsAndVanishingCyclesPartII excludes it); whether one supplier should state it once is a maintainer's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3cfd0780661e84fd4198b554a3a0031dd41281de", "job": "REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~7", "model": "fable", "worker": "chris-x89"} -->
