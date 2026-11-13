# Review of IntegralIwasawaTheoryPartII (pull request #2267 at f3022f4)

**Verdict:** needs changes

## R01 (P3) — 0.4: the locator of the regulator's definition points after (6)

**Location:** `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md` line 194: "(Dasgupta–Kakde–Ventullo §1, the definition following (6), p. 836; §1.1, (8), p. 838)".
**Claim:** The definition of `R_p(χ)` is not after (6).
**Witness:** DKV16 line 126 defines `R_p(χ)`; Conjecture 2 with (6) follows at DKV16 lines 129–130; (5) is at DKV16 line 113.
**Repair:** "(Dasgupta–Kakde–Ventullo §1, the definition preceding Conjecture 2 and (6), p. 836; §1.1, (8), p. 838)".

## R02 (P3) — 5.5: the cited passage does not contain the rank-zero statement

**Location:** `README.md` line 849: "(Dasgupta–Kakde–Ventullo §1, pp. 834–837, the discussion after Theorem 1)".
**Claim:** The discussion after Theorem 1 states no rank-zero identity `L_an(χ) = 1 = R_p(χ)`.
**Witness:** DKV16 lines 157–160 say only that the order statement is known for `r ≤ 1`; the input used is the interpolation (3), DKV16 lines 65–66, with (2), lines 56–58.
**Repair:** "(Dasgupta–Kakde–Ventullo §1, (2)–(3), p. 834, at `n = 0`; the source states the case `r ≤ 1` only for the order, p. 837)".

## R03 (P3) — 0.6: "in half of it" reads as a submodule

**Location:** `README.md` line 235: "`Ψ_ℓ` takes values in the `ℤ[1/ℓ][Γ_ℓ]`-submodule of distributions with values in `(1/m)ℤ[1/ℓ]` … and `Ψ_ℓ^+` in half of it".
**Claim:** The source gives the larger module `(1/2)M_ℓ`, not a half of `M_ℓ`.
**Witness:** CD14 line 228: the smoothed cocycle `Ψ_ℓ^+` has values in `(1/2)M_ℓ`, which contains `M_ℓ`.
**Repair:** "… and `Ψ_ℓ^+` takes values in `(1/2)M_ℓ`, the distributions with values in `(1/(2m))ℤ[1/ℓ]` on the same `P`".

## R04 (P3) — 2.2: the `*Needs:*` line lists the later target 2.2b, which 2.2 does not use

**Location:** `README.md` line 460: "*Needs:* 2.1, 2.2b; NoncommutativeAndEquivariantIwasawa §F.5 …".
**Claim:** A target needs a later one, and the statement and route of 2.2 use no product of forms.
**Witness:** The route of 2.2 (Fourier coefficients, stabilization, constant terms, `q`-expansion principle) names no product; line 462 says the products "are 2.2b"; 2.2b's own `*Needs:*` is 2.1.
**Repair:** "*Needs:* 2.1; NoncommutativeAndEquivariantIwasawa §F.5 …" (delete "2.2b").

## R05 (P3) — 2.5a: the `*Needs:*` line omits 2.5, whose family `F̃` the fourth statement uses

**Location:** `README.md` line 577: "the coefficient of the pair `(χ, ω^{1−k})` in `e·ν_k(F̃)` is `ν_k(W) − (f_χ(1 − k)/L(χ, 0))·a_k = 0`"; line 579: "*Needs:* 2.2, 2.2a, 2.2b, 2.3, 2.4; …".
**Claim:** `F̃` is defined in 2.5, which the line does not list.
**Witness:** `F̃ = E(1, χ) − E_1(1, χ)𝒢^♭ℒ_χ/L(χ, 0) + E(χ, 1)W` is the definition of 2.5 (line 553); 2.5's own `*Needs:*` does not list 2.5a, so no cycle arises.
**Repair:** "*Needs:* 2.2, 2.2a, 2.2b, 2.3, 2.4, 2.5; …".

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / other side) | Result | Change |
|---|---|---|---|---|
| 0.1 Gross–Stark data | `ℚ(i)`, `p = 2, 3, 5` | `χ(2) = 0`, `r = 0`; `χ(3) = −1`, `r = 0`; `χ(5) = 1`, `r = 1` / DKV16 lines 59–60, 74 | agrees | none |
| 0.4 regulator | `O=(2), L=(3)`; `diag(2,3), diag(5,7)`; right factor `diag(4,1)`; `𝔓 ↦ c𝔓` | `−3/2`; `35/6`; `140/24 = 35/6`; both rows scaled by `χ(c) = −1` / DKV16 (8), line 194 | agrees | R01 (locator) |
| 0.5 analytic leading terms | `f = 6Ds²`, `r = 2`; `ℚ(i)`, `p = 3`; `n = −(p−1)p^j` | coefficient `6`; `D_χ = 2·(1/2) = 1`; `L^*(χω^n, n) ≠ 0` since `χω^n` has parity `1 − n` | agrees | none |
| 0.6 smoothing factor | `χ_4`, `𝔠 = (3)`, `p = 2`; `ℚ`, `p = 3`, `𝔠 = (2)`, `k = 1` | `1 + 3(−3)^{−s}`: `4` at `0`, `0` at `1`; `(−3)(−2)(−1/12) = −1/2` | agrees | R03 (wording) |
| 0.7 edge isomorphism (Lean headline) | `S = 1`; `S = G = ℤ`, `M` trivial and regular; `S₃ ⊵ A₃`; `n = 0` | trivial `M`: `H_1 = ℂ_p → 0`, hypothesis fails; regular: both sides `ℂ_p, 0`; `n = 0`: `M_G = (M_S)_{G/S}` | agrees; true over any `k` | none |
| 0.8 induction identity | `x/π_i`-shift on `𝒪_{J₀}`; `ℚ(√5)`, `p = 11` | `(1−π_i)(1_{J₀}g_n) = 1_J g_n + 1_B D_i g_n`; `52^{10} ≡ 100`, `log_{11} 52 ≡ 22`, `c ≡ 88 (mod 121)` | agrees | none |
| Reciprocity convention | `ℚ_5`, `x = 2`; `ℚ_p`, `x = p` | `ε_cyc(rec 2) = 2`, `Art(2): ζ ↦ ζ³`; `ε_cyc(rec p) = p·p⁻¹ = 1` / pinned `localCyclotomicCharacter_artinMap_unit`: `N(u)⁻¹` for `Art` | agrees | none |
| 1.8 Greenberg's invariant, 1.9 | `X=(2), Y=(3)`; `r = 1` orthogonality | `2/3`; `x·o(u) + y·ℓ(u) = 0 ⇒ x/y = −ℓ/o`; `XO + YL = 0 ⇒ det X/det Y = det(−L)/det O` | agrees | none |
| 2.1 weight coordinate | `ν_k(π)`; `f = as² + cs` | `(u^{k−1} − 1)/log_p u`, derivative `1` at `k = 1`; leading terms `aπ²`, `−cπ` | agrees with DKV16 lines 524–530 | none |
| 2.2 `U_𝔮`-identity | `χ_4`, `p = 5`, `n = 1, 5`; general `𝔪 = 𝔮^a𝔪′` | `c(5)−c(1) = 1`, `c(25)−c(5) = 1`; `(a+2−a−1)c′(𝔪′) = c′(𝔪′)` / DKV16 (35), lines 692–697 | agrees | R04 (Needs) |
| 2.2a Eisenstein complement | `Γ_0(8)`, `k = 4`; `U_2` on `⟨E_4, E_4|B_2⟩`; `m = 2`; `(1,1)` vs `(ξ,ξ)` mod 5 | `σ_3`: `1, 9, 73, 585`; `X² − 9X + 8`; `X(X² − αX + β)`; `9` vs `−9` at `2`, `1332` at `11` | agrees with Lin12 lines 206–263 | none |
| 2.3 constant-term-one family | `p = 5`, `r = 2`; `a = 1 + g_0`; `d_η` | disc `25ℤ_5`, `10 ∣ j`; `1 − a^♭ = −u⁻¹T`; `ν_0(d_η) = (1 − η)(1 − η⁻¹Nλ⁻¹) ≠ 0` | agrees | none |
| 2.4–2.5 `W`, `F̃` | `𝔫 = 1`; `𝔫 = (4)`, `p = 5`; swap `χ ↔ χ⁻¹` | second constant cancels against `E(χ,1)W`; `ν_k(W) = (−4)^{k−1}`; `W ↦ ε(𝔫)²W⁻¹` | agrees; factor matches DDP11 (79), line 1304 | none |
| 2.5a tame-cusp constants | `N = 4`, `p = 5`, `k = 3, 5`; cusp `1/5` of level 20 | `ω(4)²/4³ = 4⁻¹⟨4⟩^{−2}`; `c = 5κ/1024`; `E` and `E|B_5` equal there (`d ≡ 1 mod 4`) | exponent `1 − k` confirmed over `ℚ` | R05 (Needs) |
| 3.1 `W_1`, 3.4 | `r = s = 1`; `r = 1, s = 2`; `r = 2, s = 3`; `r = 0` | `E[π]/(π²)`, dim 2; `ε_1 = −aπ²`; dim `4 + 3 − 1 = 6`; relation `2 = 0` | agrees with DKV16 lines 666, 726–729 | none |
| 3.2 `W_2`, 3.5 | `r = s = 1`; `w = −1`; `r = 2, s = 3` | `y = wπ/(1+w)`, `ε_1 = aπ/(1+w)`; `π^s = 0`, `z^s = −y^s`; dim `s + s + 2^r − 2 = 8` | source prints `2^{r_an}`; corrected count right | none |
| 3.3 `W_3`, 3.6 | `r = t = 1`, `s = 2` | `y = cπ²`, `ε_1 = −aπ² = by` with `c = −a/b`; basis `1, π, π²`; `(−1)^{t+1}bc = (−1)^{s+1}a` | agrees with DKV16 lines 905–908, 1478 | none |
| 3.7, 3.9 Hecke formulas | trace `ψ_1 + ψ_2`; `Y` on `E(χ,1)` | `ε_y + χε_z = 1 + χε + (χ−1)((1−ε)/π)y`; eigenvalue `(χ−1)(1−ε)` over the denominator `= π` | agrees with DKV16 lines 781, 789 | none |
| 4.1 coefficient ring | `y² = T²(T+p)`, `√p ∈ E`; complex conjugation | completion `(y − Ts)(y + Ts)`, two fields for one `L_H`; `det ρ(c) = χε(c) = −1`, `ε(c) = 1` | agrees | none |
| 4.2 good Galois element | both eigenvalue orders; finite union of stabilizers | `c` is a `χ`-cocycle, `cχ⁻¹` a `χ⁻¹`-cocycle; closed infinite-index subgroups are nowhere dense | agrees with DKV16 Lemmas 4.2–4.3 | none |
| 4.9 second-order bound | `σ ∈ I_{𝔮_i}` | `χ = η_i = 1`, `ε − a ∈ 𝔪`, so `b(σ) ∈ α_i𝔪` | agrees with DKV16 lines 1331–1334 | none |
| 5.1–5.2 determinant | `σ = rec(u)`; `s = r`; `s > r` | entry `ℓz + oε_i`; `det L + (−1)^{r+1}L_an det O = 0`; `∏ε_i ∈ 𝔪^{r+1}` | `L_an = det(−L)/det O`, as DKV16 lines 1425–1429 | none |
| 5.4 inverse character | `t = r`; `t > r` | entry `ℓy + oε_i`; `det L⁻ + (−1)^{r+1}b det O⁻ = 0`; `y^t ∈ y^{r+1}W_3` | agrees with DKV16 (88)–(89) | none |
| 5.5 rank zero | `ℚ(i)`, `p = 2, 3` | `f_χ(0) = 1/2 = D_χ`; `f_χ(0) = 2·(1/2) = 1 = D_χ`; empty determinant `1` | agrees | R02 (locator) |
| 5.6 Gross–Stark theorem | `ℚ(i)`, `p = 5` | `L_5′(χω, 0) = (1/2)(−log_5((2+i)/(2−i)))` / DKV16 Theorem 1 with (6), lines 130, 156 | agrees | none |
| 5.8 rank one | `ℚ(i)`, `p = 5`; `u = p` | valuations `(n, −n)` vs `(a, a)` force `n = 0`; `ℓ(p) = 0`, `ord(p) ≥ 1` in the plus part | route sound | none |

- Source locators checked against the text: 41 (DKV16 27, DDP11 6, CD14 5, Lin12 2, V15 1); 2 inexact (R01, R02).
- Library declarations opened at the pins: 34, all found where cited (for example `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:864` `coinfNatTrans`; `TauCeti/RepresentationTheory/Homological/GroupHomology/Induced.lean:49, 59, 70`; `TauCeti/RingTheory/DedekindDomain/SInteger/Rank.lean:108`).
- No Iwasawa logarithm and no Deligne–Ribet function occur at either pin, as the module docstring says; Mathlib has no group-homology edge isomorphism beyond `H1CoresCoinf`.
- Cross-roadmap citations resolved: 12 suppliers, 34 sections and 24 declaration names, on main or at the suppliers' open heads; `Determinant.eq_of_charpoly_frobenius` is IntegralHeckeAndGaloisDeterminants §4.1.
- Gate: every check passes; the eight declared supplier gaps carry the same slugs in the README and in the plan's `gaps`, each with its supplier and section. Dependency check: `depcheck: 221 roadmaps, 1962 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; `#check @` of its one declaration keeps every binder (`CommRing k`, `Group G`, `S.Normal`, the vanishing hypothesis).
- One-tactic probe of the headline: `infer_instance`, `simp`, `aesop_cat` and `exact?` all fail; it is not padding.
- Overlap check: read NoncommutativeAndEquivariantIwasawa, IntegralIwasawaTheory, PadicFamilies, EulerSystemsCyclotomicMainConjecture, OrdinaryAutomorphicFormsAndModularityLifting, ClassicalSerreModularity; nothing shared (the Hilbert families, `E_k(η, ψ)` and the Rubin–Stark lattice are cited from their owners; the Eisenstein complement 2.2a has no other owner).

Source independence: 22 passages compared with 5 sources, none shared beyond formulas and theorem statements; largest share DKV16, 61 of about 123 locators; contents compared with DKV16: independent (Layer 0 has no counterpart, its §3 is split over Layers 2–3 with half of Layer 2 from other sources; Layers 4 ↔ §4 and 5 ↔ §5 are forced by the `*Needs:*` lines 4.1 → 3.8–3.10 and 5.1 → 4.9).

## Not verifiable

- Sc93, Theorem 4: paywalled, settled as uncertified; checked only through its restatement, CD14 lines 349–351.
- AL13, Proposition 3.11 and Theorem 3.6: paywalled; checked only through Lin12 lines 246–263.
- W86, Proposition 1.5 (weight two in 2.2a): paywalled; the attribution is at DDP11 line 1162.
- Br82, Chapters III §6, V §3, VII §6: not in the cache; standard textbook locators.
- DKV16 preprint (arXiv v1), Theorem 3.2, p. 16, the normalization of `t`: the cached text is the published article, which lacks it (DKV16 lines 644–645).

## Source issues

- **Misprint** in DKV16 at Remark 1.1, p. 837: the source says the regulator endomorphism acts on the unit component; it should be an endomorphism of the divisor component `X_χ`; affects nothing.
- **Misprint** in DKV16 at §1.3, display defining the first leading term, p. 841: the source says the derivative is of the branch of `χ`; it should be the branch `L_p(χω, s)`; affects nothing.
- **Misprint** in DKV16 at §3.1, footnote 6, p. 847: the source writes the weight-one constant with `χ`; it should use the footnote's general character `η`; affects nothing.
- **Misprint** in DKV16 at §3.2, parenthesis before the case division, p. 849: the source ends the chain of equal orders with the order of `χ`; it should end with the order of `χ⁻¹`; affects nothing.
- **Gap** in DKV16 at Theorem 3.2, p. 849: the source asserts only that some `t` makes the projected family cuspidal; it should also require `t` to fix `E_1(1, χ_S)` at weight one, since `t = 0` qualifies; affects the proof.
- **Error** in DKV16 at §3.2, (29)–(31), pp. 848–849: the source gives the coefficient of the reversed Eisenstein series with no level factor; it should carry `⟨N𝔫⟩^{k−1}` as in DDP11 (79); affects the proof.
- **Misprint** in DKV16 at §3.3, sentence after the Fourier embedding, p. 850: the source refers to (2) for the analytic order and leading term; it should refer to the definitions of §1.3, p. 841; affects nothing.
- **Misprint** in DKV16 at §3.4, (41)–(42), p. 853: the source prints the modulus as a power of `π` plus one; it should be `π^{r_an+1}`; affects nothing.
- **Misprint** in DKV16 at proof of Theorem 3.6, p. 854: the source gives the dimension of `W_2` with exponent `r_an` and indexes the product by `i`; it should be `2^r + 2r_an − 2` and `ε_j`; affects nothing.
- **Gap** in DKV16 at Lemma 4.3 and the sentence before it, p. 860: the source avoids the ordinary lines only at primes of `R`; it should avoid them at every prime above `p`, as Lemma 4.7 uses; affects the proof.
- **Misprint** in DKV16 at (63), p. 860: the source writes the characteristic polynomial of one `ρ_H`; it should be that of the product representation `ρ`; affects nothing.
- **Error** in DKV16 at proof of Lemma 4.7, p. 864: the source says inertia has pro-`ℓ` image and the coefficient space is pro-`p`; it should treat the finite torsion separately and use compact images in lattices; affects the proof.
- **Misprint** in DKV16 at §5.2, lower-entry identity, p. 867: the source evaluates `a` at the first argument; it should be `c(σσ′) = c(σ)a(σ′) + d(σ)c(σ′)`; affects nothing.
- **Misprint** in DKV16 at §5.2, after (89), p. 868: the source equates the two leading terms of `χ` when `t = r`; it should be those of `χ⁻¹`; affects nothing.
- **Misprint** in DDP11 at Proposition 2.3, p. 462: the source gives the constant term with exponent `k − 1` on `⟨N𝔫⟩`; it should be `1 − k`, as its Proposition 2.7 requires; affects a stated result.
- **Gap** in CD14 at proof of Theorem 5.1, p. 31: the source deduces degeneration from a homological dimension of one for a free module; it should use vanishing of positive-degree homology of free modules; affects the proof.

## For the human reviewers

- **Licence.** CD14 is read from an author page (`sites.math.duke.edu`), in the pagination of an author copy dated 4 November 2014, not the published Cambridge Journal of Mathematics pagination (README line 945).
- **Not tested.** The normalization of DKV16 Theorem 3.2 is cited to the arXiv v1 preprint, p. 16, which was not read; 2.6 states it as part of the theorem independently of that locator.
- **Scope.** The roadmap applies corrections to published statements (README lines 899–935, including a level factor in DKV16 (29)–(31) and an exponent in DDP11 Proposition 2.3); no published erratum was found in the cached sources.
