# Review of HodgeTateLatticesAndLubinTateLogarithms (pull request #2904 at dd1edbb)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HodgeTateLatticesAndLubinTateLogarithms/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the Check "Ordinary case: `S = 0`" of 0.5d is false for an ordinary abelian scheme (for an ordinary elliptic curve with `𝒪 = ℤ`, `S = 1/(p − 1)`). The stated results themselves survived the computed pass, including the cokernel bound at `p = 2`, whose route I checked step by step. There are four small corrections and one format note, none blocking. The locators into [FormalProof] and into Hazewinkel's book could not be read from a legal copy, and the human reviewers have to decide on scope and on the licence of [FormalProof].

## R01 (P2) — The Check "Ordinary case: `S = 0`" of 0.5d is false in general

A reader who takes this Check at its word concludes that 0.5d (a) gives surjectivity of the character differentials whenever the reduction is ordinary, and it does not. In the Checks of 0.5d (line 288), `S(τ_s) = Σ_{i≥0} p^{−(i+1)}·r(τ_{s+i+1}∘c)` vanishes exactly when `r(τ∘c) = 0` for every embedding `τ` at `w`. Since `τ ↦ τ∘c` permutes all the embeddings and `Σ_τ r(τ) = g`, this cannot hold at every place when `g ≥ 1`. Take `𝒪 = ℤ`, `c = 1` and an ordinary elliptic curve: there is one embedding, `r = 1`, and `S = Σ_{i≥0} p^{−(i+1)} = 1/(p − 1)`, while the colength is `0` (0.5a, second Check). At a split place of an imaginary quadratic field with ranks `(1, 1)` and ordinary reduction, again `S = 1/(p − 1)`.

The smallest repair is to state the case in which the Check is true: "If `r(τ∘c) = 0` for all `τ` at `w` (the part of the `p`-divisible group at `w` is of multiplicative type), then `S = 0` and the differentials span. For an ordinary elliptic curve with `𝒪 = ℤ`, `S = 1/(p − 1)` while the colength is `0`: (a) is not sharp there."

## C01 — The second Check of 0.5c proves "the order does not matter" by a clause that does not apply to `ℓ₁`

The Check (line 257, repeated in the Examples at line 553) says the modification for `ℓ₂` is an isomorphism over `ℓ₁` "by the last clause of (b)". That clause concerns primes at which the order is étale over `ℤ`. Over `ℓ₁` the sheaves of `ℓ₂` are `ω_G` and its eigen-quotients `ω_{G,σ}`, and the latter are direct summands only when the order is étale at `ℓ₁`; if `ℓ₁` ramifies, nothing in the text makes them locally free after the first modification. The conclusion is still true, by (c): both orders give a model with the same universal property. Either add "if the order is étale at `ℓ₁`" to the isomorphism claim, or derive the independence of the order from (c).

## C02 — The congruence in the route of 3.2 (a) has a placeholder for its modulus

At line 614 the route reads "`(a + pb)^{p²} ≡ a^{p²} (mod p^{…})`". The exponent was never filled in, so an implementer cannot tell which congruence the induction uses. For integral `a`, `b` the congruence holds modulo `p³`.

## C03 — The route of 3.3 states Dwork's criterion with the quotient inverted

At lines 631–632 the route says a series `1 + (higher)` is integral iff "its quotient by the `p`-th power of its Frobenius twist" is `≡ 1 (mod p)`. Read literally this is `F/(F^σ(X^p))^p`, and for `F = 1 + X` it gives `(1 + X)/(1 + X^p)^p ≢ 1`. The displayed identity just before it has the right quotient, `F^σ(X^p)/F^p`. Write "iff the quotient of its Frobenius twist `F^σ(X^p)` by its `p`-th power `F^p` is `≡ 1 (mod p)`".

## C04 — The routes of 0.5d and 0.5e say "length" for what 0.5h calls the degree

0.5h (lines 349–351) defines `deg M = Σ_i v(c_i)` and remarks that the ordinary length of such a module is infinite. The routes of 0.5d (b) ("`ξ(τ) := length(Hom_τ/𝔄_τ)`", line 275; "of length at most `v(det B_σ)`", line 279) and of 0.5e ("`length(S/M)`", "`length(S′/M′)`", line 303) then use "length" for these modules over `O`. Taken literally every one of these quantities is infinite. Write `deg` there, or say once in 0.5d that "length" means the degree of 0.5h.

## N01 — The numbering is borrowed from another roadmap

The items of Layer 0 carry the section numbers of HodgeTateAndCanonicalSubgroups (0.5a–0.5h, 0.17a, 0.17b, 0.18a, and an item 2.4 inside Layer 0), and the second layer is "Layer 3" with no Layers 1 and 2. A reader looking for "2.4" finds it in Layer 0. Numbers of the roadmap's own, in the construction order the Dependencies paragraph already gives, would avoid this.

## Questions for the author

- 3.2 (a) is stated for the single type `p^{−1}σ²` with `q = p²`, while the text itself describes it as an instance of "Hazewinkel's functional-equation setting". Does the cited lemma (I.2 and II.10) give the several-variable statement for every type `Σ s_iσ^i` and every `q`? If so, would 3.2 state that form, with the type `p^{−1}σ²` as the case used? I could not read the book from a legal copy, so I could check neither the locators nor the generality.
- 0.5h (6) asks for a complete noetherian *normal* local domain `T` and calls this "the setting of 0.5d", which does not assume normality. Which is meant?

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 0.5b (a), finite flat form; headline 1; Lean `smul_mem_span_cotangentMap_groupLike` | `μ_p`; `ℤ/p`; Oort–Tate `x^p = ax`, `ab = p`; `n = 0`; `p = 2` | `μ_p`: `T − 1` generates `O_C/p`. `ℤ/p`: `ω = 0`. Oort–Tate: image `y·ω`, `v(y) = (1 − v(a))/(p − 1) ≤ 1/(p − 1)`; at `p = 2`, `≤ 1` | holds |
| 0.5b (a), route steps (i)–(iii) | general `p`, `p = 2` | `‖e^l/l!‖ ≤ (\|c\|·\|p\|^{−1/(p−1)})^l < 1`; term `(k,k,0)` has norm `t(k)²`, all others smaller; left side `≤ t(2k) < t(k)²` | holds; no use of `p ≠ 2` |
| 0.5b (b), `κ₀` at `p = 2` | `p = 2` | `ζ₂ − 1 = −2`, `v = 1 = 1/(p − 1)`; `2^R·ω ⊆ 2·ω` for `R ≥ 1` | holds |
| 0.5a (b), ramified example | `E = ℚ(i)`, `p = 2` | `det[[1, i],[1, −i]] = −2i`, square `−4 = disc` | holds |
| 0.5c (b), (c) | iterated Nash modification, two orders | each order is terminal among dominant normal models with all lattices locally free; clause on étale primes does not cover `ℓ₁ ∈ Σ` | (c) holds; Check's reason fails (C01) |
| 0.5d, Check 1 | `𝒪_w = ℤ_{p²}`, `r = (1, 0)`, conjugates `(0, 1)` | `S(τ_0) = 1/p + 1/p³ + ⋯ = p/(p² − 1)`; (b): `x(τ_0) = 1/(p−1) − 1/(p²−1) = p/(p² − 1)`, `x(τ_0∘c) = 0` | holds |
| 0.5d, Check "Ordinary case" | `𝒪 = ℤ`, ordinary elliptic curve; split place, ranks `(1, 1)` | `S = 1/(p − 1)` in both; colength `0` | false (R01) |
| 0.5d, Check 3 | Lubin–Tate, height `h` | `S(τ_0) = Σ_{m≥1, h∤m} p^{−m} = 1/(p−1) − 1/(p^h−1)`; source: `s = 1/(p−1) − 1/(e(q−1))`, `e = 1`, `q = p^h` | holds |
| 0.5d (b), route | Lubin–Tate `h = 2` with its dual | `ξ = (1/(p²−1), p/(p²−1))`; `pξ(τ_0) − ξ(τ_1) = 0 = r(τ_1)`; `pξ(τ_1) − ξ(τ_0) = 1 = r(τ_0)`; `Σξ = 2/(p−1) = g·v(c_p)` | holds |
| 0.5e | `E_w = ℚ_3(ζ_9)`, `r⁺ = 2`, `r⁻ = 1`; ramified quadratic, `r⁻ = 0`; route (I), (II) | `disc = 3⁹`, `vd = 3/2`, bound `15/2` against `6`; bound `0`; `length(S/S′) ≤ len(M/M′) + (h − r⁺)·n·vd/2`, `h − r⁺ = r⁻_B` | holds |
| 0.5f | `O = O_C`, `H = G̃[p^∞]` | image of `T_p(H^D) ⊗ O` contains `κ·ω_H` by 0.5b (a) | holds |
| 0.5g | ordinary elliptic curve, `𝔥 = (0,1)`, `𝔟 = (c,κ)` | `𝔟^T𝔥 − 𝔥^T𝔟 = [[0,c],[−c,0]] = c·E`; `det Π² = c^{2g}·det E`; `p = 2`: `c = −2` | holds |
| 0.5h | `μ_p × ℤ/p`; `μ_p` alone for (4) | `𝔄 = (c) ⊕ O_C`, degree `v(c) = g·v(c)`; `v(disc(T^p − 1)) = p = p·deg ω` | holds |
| 0.17a | Katz–Mazur model; DVR with ordinary curve | primitive lines: `p^{R−1}(p + 1)`; `e ≥ p^{R−1}(p − 1) ≥ 2` for `R ≥ 2`; `deg Δ = deg ω\|_Γ > 0` | holds |
| 0.17b (a)–(d) | `E = ℚ`; ramified quadratic `N = 1`; `κ = 4`, `ℓ = 2`; `N = 3` | ranks `rk Lie_σ + rk Lie_σ̄ = N`; eigen-sublattice `f′(a)·B = 𝔡_σ·B`; modulus `2^{R−2}`; exponent of `gr_i` in `L_λ`: `−λ_i` | holds |
| 0.18a | abelian scheme; Tate curve | order `p^{n(2(g−r)+r)} = p^{n(2g−r)}`; Tate curve: `H_n = μ_{p^n}`, kernel `ℤ_p(1) ⊗ O_C`, rank `1 = g` | holds |
| 2.4 (a), (b) | `μ_{p^∞}`; `ℚ_p/ℤ_p`; `(ℚ_p/ℤ_p)²` with `[[0,ε],[−ε,0]]` | kernels of rank `1`, `0` `= dim G`; counterexample: `ω_G = 0`, kernel of rank `2 ≠ 1` | holds; height condition needed |
| 3.1; headline 4; Lean `exists_twistedLog_inverse_norm_coeff_le` | `S = {x}`, `q = p²`; `p = q = 2`; `p = 3`, `q = 2`; `S = ∅` | coefficient of `T^q`: `−1/p`, `v = −1 = −(q−1)/(q−1)`; `q = 2`: `T²: −1/2`, `T³: +1/2`, bounds `−1`, `−2`; `(q^e − 1)/(q − 1) ≥ e` | holds, attained |
| Lean `twistedLog` | `n = 0`; `n = single(ς^e x, q^e)`, `q ≥ 2` | constant coefficient `0`; `q^e > e`, so `e` lies in the range; exponents `q^e` distinct, one term | agrees with README |
| 3.2 (b), (c) | system `λ_s`, `ς : s ↦ s − 2` | `λ_s − p^{−1}λ_{s−2}(X^{p²}) = T_s`; `p^{−1}g^{σ²}(X^{p²}) ≡ Σ σ^{s+2}(c)L_{s+2} = g` | holds |
| 3.3 | `Ψ = X`; Artin–Hasse; `p = 2` | `X^p − pX ∉ pO[[X]]`; `Ψ(X^p) − pΨ = −pX`; `v(2^k/k!) ≥ 1` for `k ≥ 1` | holds; route wording inverted (C03) |
| 3.4 (a), (c), (e), Check 2 | `π^{p²−1} = p`; `ε^{p²−1} = −1` | `v(π^{p^{2j}−1}/p^j) = 0, 0, p² − 1` for `j = 0, 1, 2`; inverse telescopes to `t`; `ε^{p^{2j}} = (−1)^jε`; (c) from (b): `A = 0`, `B = βℓ_s` | holds |
| 3.5 | `d = 2`; general `d` | `Σ_r σ^{s′}(ω_r)σ^s(ω*_r) = δ_{ss′}` for even `s, s′`; odd case is `σ` of it; `d = 2`: `T_0 = X`, `T_1 = Y` | holds |
| 3.6 (o), (a), (c) | `δ = (ζ)`, `ζσ(ζ) = 1`; general `δ` | `ασ(α) ∈ ℤ_p`; pure terms `(δ^*δ)_{jj} = 1`; cross terms `β₀(u_j, [0]u_{j′}) = 0`; hyperbolic: `δ_{ee′}β₀(X_e, Y_e)` | holds |

- Source locators checked against the text: 1 (SchneiderTeitelbaum2001 lines 1230–1234, Appendix, Theorem (c), p. 33 of the arXiv version: agrees). Announcement lines 9–13 and 53 read for the reference entries.
- Library declarations opened at the pin: `TauCeti.Bialgebra.CotangentSpace`, `cotangentMap` (`TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean:68, 81`); Mathlib `GroupLike` (`RingTheory/Coalgebra/GroupLike.lean:66`), `Coalgebra.IsCocomm` (`RingTheory/Coalgebra/Basic.lean:186`), `MvPowerSeries.gaussNorm` (`RingTheory/MvPowerSeries/GaussNorm.lean:58`), `Scheme.Hom.toNormalization` with its open-immersion instance (`AlgebraicGeometry/ZariskisMainTheorem.lean:359`).
- Cross-roadmap citations resolved: 39 section ids in 12 roadmaps (HodgeTateAndCanonicalSubgroups and LubinTateFormalModulesAndQuasiCanonicalLifts at their open heads, PerfectoidShimuraVarieties §3.9 and HeightsRationalPointsAndObstructions §1.16 at their open heads, eight roadmaps on main), each read against the use made of it; the downstream ids in four family roadmaps exist at their heads.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1997 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings and nothing else; single `import Mathlib` plus one `TauCeti` module; no `set_option`. The three elaborated types were compared with 0.5b (a) and 3.1: no binder lost.
- One-tactic probe: neither theorem closes by `rfl`, `simp`, `infer_instance` or `trivial`.
- Headlines: 1 (finite flat form) and 4 are stated; 2 and 3 and the `p`-divisible form of 1 are named in the docstring with the carriers they lack.
- No change outside the folder and the family index. The description agrees with the head.

Overlap check: read TaylorBoundsAndDepthsOnHeightTwoFormalGroups, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ShimuraCompactifications, ArakelovGeometryAndAbelianHeights, FiniteFlatGroupsAndIntegralPadicHodgeTheory; nothing shared. TaylorBoundsAndDepthsOnHeightTwoFormalGroups hands 3.1–3.5 and 0.5d to this roadmap (its §4.8c is an instance). HodgeTateAndCanonicalSubgroups owns the cokernel bound for odd `p` (§0.5, `HodgeTate.farguesHodgeTateCokernel_finite`); this roadmap's statement is the same without `p ≠ 2`, and owns only the extension to `p = 2`.

Source independence: 6 passages compared with 2 sources (SchneiderTeitelbaum2001, Announcement), none shared; largest share FormalProof, 29 of 32 locators; contents not compared with FormalProof, whose text and table of contents could not be read.

Research link: Layer 0 extends Fargues' cokernel bound (2010–2011) and the modified Hodge bundle of Pilloni–Stroh to `p = 2` and to eigen-lattices; Layer 3 uses Hazewinkel's functional-equation lemma (1978) and the Schneider–Teitelbaum period (2001). Both feed the family built on Alpöge's announced formalization (2026). Rests on the README and its suppliers.

## Not verifiable

- The 29 file and declaration locators into [FormalProof], which cover every sampled target (0.5b–0.5h, 0.17a, 0.17b, 0.18a, 2.4, 3.2 (b), 3.4–3.6): the repository named in the References is on a host that is not among the legal places I may read from, and no local copy is held.
- The sentences on what [FormalProof] states (factor `4` at `p = 2`, modulus `2^{R−2}`, `q = p²` in 3.1, sign `s = 1` in 3.4, odd `p` in 3.2): same reason.
- 3.2: Hazewinkel, *Formal groups and applications*, I.2, II.10 and §2.2: no legal copy found; the theorem numbers, pages and hypotheses were not checked.
- Katz–Mazur (Checks of 0.17a and 0.5c): cited without chapter or theorem number; not opened.

## Source issues

- none

## For the human reviewers

- Scope: the source of 29 of 32 locators is [FormalProof], an unrefereed Lean formalization announced on 20 November 2026 with no written account (Announcement lines 45–49). The bound at `p = 2` and 0.5d–0.5h, 0.17b, 3.4–3.6 have no refereed source.
- Licence: the README gives [FormalProof] as a GitHub repository; the announcement's footnote (Announcement line 53) gives archives on the author's page instead. I could read neither, and found no licence statement.
- Licence: the docstrings of `smul_mem_span_cotangentMap_groupLike` and `twistedLog` name the [FormalProof] declarations they follow (`smul_dUnit_mem`, `genLog`); whether the Lean is adapted from them could not be checked.
- Not tested: wording and arrangement were not compared with [FormalProof], the source with the largest share of the locators; nor with Hazewinkel's book.
