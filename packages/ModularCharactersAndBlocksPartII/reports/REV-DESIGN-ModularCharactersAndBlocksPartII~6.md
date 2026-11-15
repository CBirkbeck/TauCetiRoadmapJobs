<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16344#issuecomment-6894927431 -->
Review (claude) of 81cac4b

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) Layers 6–8 are stated at a group's own system and used at the ambient one

   **Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:173`–174 (“`(K, O, k)` is the splitting `p`-modular system of base §1.1 at a finite place `v` of `F = ℚ(ζ_e) ⊆ ℂ` over `p`, `e = exp(G)`”); the same hypothesis on the 14 plan targets of Layers 6–8 (“`F = ℚ(ζ_e)`, `e = exp(G)`”). Uses: line 1337 (“§8.2 applies to `b`”, a block of `N = D C_G(D)`), lines 1061–1062 and 1419 (`Irr₀(b')`, `b'` a block of `k[N_G(D)]`), line 1213 (`h(ψ)` for a block of the stabiliser `T`), line 1313 (blocks of `G/P`).

   **Claim:** The theorems of Layers 6–8, stated for a finite group with the §1.1 system of its own exponent, give the statements about subgroups and quotients of `G` at the system of `G` that §§6.4, 7.3, 7.4, 8.2, 8.3 and 9.2 use.

   **Witness:** README §6.4, last Check: `S₃`, `p = 2`, `b'` a block of `𝔽₄[C₂]`; `exp(C₂) = 2` gives `K = ℚ₂`, `k = 𝔽₂`. `SL(2,3)`: §8.3 applies §8.2 to `Q₈` over `𝔽₄`; `exp(Q₈) = 4` gives `ℚ₂(i)`, `𝔽₂`. `A₅ ⊇ A₄`: `𝔽₁₆` against `𝔽₄`.

   **Repair:** Keep every statement at `e = exp(G)` and add the comparison that carries it to the ambient system; all its inputs are in the base.

   1. §6.3, a new API bullet beside the change of place (“change of level”), mirrored in plan 6.3: let `H` be a finite group, `e` a positive multiple of `exp(H)`, `v` a place of `ℚ(ζ_e)` over `p` and `w` the place of `ℚ(ζ_{exp H})` below it. Then `ℚ(ζ_{exp H})_w ⊆ ℚ(ζ_e)_v` with `m_v ∩ O_w = m_w` and `k_w ⊆ k_v`, and scalar extension is a bijection from the blocks of `k_w[H']` to those of `k_v[H']` for every `H' ≤ H`, with the same central characters on class sums, defect classes, `Br_P`, defect groups, block induction, covering and domination (base §6.2, the scalar extension for a field splitting the group: `k_w` splits `H` and its subgroups by base §2.3); with the same `Irr(B)` (base `exists_blockIdempotent_iff_centralCharacter_congr`, stated for every complete discrete valuation ring of characteristic zero containing the `exp(H)`-th roots of unity: the differences `|𝒞|(χ(g)/χ(1) − ψ(g)/ψ(1))` lie in `ℚ(ζ_{exp H})`, so they are in `m_v` exactly when they are in `m_w`); and with the same `IBr(B)` and decomposition numbers (base §2.4, change of splitting modular system). Hence the same heights and `Irr₀(B)`. *Needs:* base §§1.1, 2.3, 2.4, 4.2, 6.2.
   2. Conventions, Blocks, one sentence after “it serves every subgroup, centraliser and quotient of `G`”: a statement of Layers 6–8 about a subgroup or a quotient `H` of `G` is read at the system of `G`, and follows from the same statement for `H` at its own system by the change of level of §6.3 (`exp(H)` divides `e`).
   3. Add §6.3 (it is already there for most) to the *Needs:* of §§6.4, 7.3, 7.4, 7.5, 7.6, 8.2, 8.3 and 9.2 and to the corresponding plan prerequisites, and one Check to §6.3 with the witness below.

   An acceptable alternative states every target of Layers 6–8 for `e` any positive multiple of `exp(G)`; it needs the same comparison, since the base states its Layers 2–8 for the system of its fixed group.

   **Repair test:** `C₂` at `p = 2`, `e = 6`: `k_w = 𝔽₂ ⊆ 𝔽₄ = k_v`, and `𝔽₂` splits `C₂`. One block on each side (idempotent `1`); `ω_1(t) − ω_sgn(t) = 2` lies in `2ℤ₂` and in `m_v`, so `Irr(b') = {1, sgn}` at both; defect group `C₂`; heights `0 − (1 − 1) = 0`; `|Irr₀(b')| = 2`, the value the §6.4 Check uses. `Q₈` in `SL(2,3)`: one block over `𝔽₂` and over `𝔽₄`, five characters, heights `0, 0, 0, 0, 1` at both, so §8.2 at `ℚ₂(i)` gives the statement §8.3 needs at `ℚ₂(ζ₁₂)`. `A₄` in `A₅`: one block over `𝔽₄` and `𝔽₁₆`, heights `0, 0, 0, 0`, so `4 = 4` in §9.2.

One finding, P2, blocking. The three round-5 findings are repaired (quoted below). The finding is a consequence of the round-5 repair of the modular system: the block strand now ties the system to `e = exp(G)` for the group `G` of each statement, while its own layers apply those statements to subgroups, normalisers and quotients of `G` at the system of `G`, which is not the system of those groups. The mathematics is not in doubt; the statements and their uses are at two different generalities, and no target connects them. Everything else read this round is sound.

## Verified sound

### Round-5 findings, checked first

- **R01 (system of the base) — repaired.** Lines 173–183: “`(K, O, k)` is the splitting `p`-modular system of base §1.1 at a finite place `v` of `F = ℚ(ζ_e) ⊆ ℂ` over `p` … Every place `v` of `F` over `p` is allowed”; §6.3 lines 1026–1039 state the change of place; §§9.1–9.2 quantify over places (lines 1394, 1420). Base head, §1.1: the system is `F_v` for `F` generated by a primitive `e`-th root, `e` the exponent, and “All later layers use this system”; base §7.2 passes to “the system of §1.1”. The 14 plan targets of Layers 6–8 carry the new hypothesis; plan 6.3, 9.1, 9.2 carry `height_changeOfPlace`, `brauerHeightZero_iff_one_place`, `alperinMcKay_iff_one_place`. R01 above is what this repair left open.
- **R02 (compatibility law) — repaired.** Lines 831–835: “for every `T ⊴ S` and every `χ ∈ Irr_S(Γ)`, the character `π(Γ, T)(χ)` of `C_Γ(T)` is `S/T`-invariant and `π(Γ, S)(χ) = π(C_Γ(T), S/T)(π(Γ, T)(χ))`; the invariance is part of the law”. Plan 4.5 statement, `glauberman_compat` and `glauberman_family_unique` agree.
- **R03 (base descriptions) — repaired.** Line 214: “`λ_B : Z(k[G]) → k` is the central character of a block (base §6.2)”; lines 334–338: “The base's `brauer_first_main` is stated over an algebraically closed field; its form over a field splitting `G` and all its subgroups (base §7.1) agrees with the Brauer correspondent of Conventions”. Base §6.2 introduces `λ_B`; base §7.1, second bullet, states the splitting-field form.

No round-5 finding was marked not actionable. Maintainer notes: none.

### Principles, shape, policy

Read the README in full (1492 lines) and the plan (9 layers, 35 targets, minimum 3 tests per target, 4 suppliers, 1 gap). Nine layers named by their mathematics, each ending with Examples and Dependencies; 35 `*Needs:*` paragraphs; no sentence says the roadmap follows a source. No LaTeX delimiters, machine paths, pull-request numbers, round labels, algorithms, `set_option` or sorry'd data (searched). The gap `clifford-multiplicity-dvd-index` is precise (one statement, hypotheses `N ⊴ G`, `χ ∈ Irr(G)`, `θ` under `χ`), minimal (`FDRep.clifford_restrict_dvd_finrank`, `TauCeti/RepresentationTheory/Induction/Clifford/Dimension.lean:113`, gives `dim V ∣ dim W` and `[G : inertia V] ∣ dim W`, not the bound on the quotient; InductionRestriction on main states no such divisibility) and declared under one slug in the README (line 378) and the plan with supplier InductionRestriction, Layer 7.

### Sources: the 15 sampled targets

No locator is flagged unverified. Texts opened at the cited lines:

| Target | Lines read | Result |
|---|---|---|
| 1.1 | glauberman line 94; hartley-turull line 302 | the conjugate of a character and fixed characters; the source writes operators as exponents, the README as a left action with the same fixed set |
| 2.1 | glauberman lines 100–115 | Theorem 1: absolutely irreducible, `|A|` prime to the degree, twists equivalent, unique extension with determinant `1` on `A`; the README's scalar-endomorphism hypothesis is the property the proof uses at line 113 |
| 2.3 | glauberman lines 173–177, 238–239 | Lemma 1 (a), (b); Theorem 2 (b) |
| 3.2 | glauberman lines 299–307; hartley-turull lines 306–310 | Theorem 3 (a), (b): unique sign and character for every generator, bijectivity |
| 3.4 | glauberman lines 375–390, 454–462, 478–479 | Corollary 5: `B ≠ A`, fixed points of elements outside `B`, `θ₀² = 1`, both cases of (b) with the factor `|A/B|⁻¹`; Corollary 6 (c) from 5 (b) |
| 4.4 | glauberman lines 601–629 | Corollaries 7, 8, 9 as stated |
| 5.1 | glauberman line 644 | Theorem 5 (e) |
| 6.1 | martinez lines 351–354, 373, 414–417, 512–515, 566, 694–699, 756–761 | central characters, `λ_B`, Osima, integrality and vanishing of coefficients, connectedness, defect classes and their `p`-regularity |
| 6.3 | martinez lines 718–726; reynolds lines 60–61 | height through the defect group is Reynolds' form; Martínez defines it through the numerical defect, equal by his Theorem 3.4 (line 728) |
| 7.2 | martinez lines 1642–1653, 1760–1764, 1790–1791, 1976–1980 | Problem 7.4, Propositions 7.6, 7.9, 7.11, Corollary 7.8, Lemma 8.6 |
| 7.3 | martinez lines 1895–1897, 1904–1910, 1924–1932 | Corollary 8.2, Definition 8.3, Proposition 8.4, the central-character identity, Theorem 8.5 (i), (ii), for any `N ⊴ G` |
| 7.6 | martinez lines 1985–1988, 2295–2296; sambale lines 499–502 | Theorems 8.8 and 9.6; Sambale Theorem 1.18 |
| 8.1 | martinez lines 2011–2013 | Theorem 8.10, proof by reference to navarro-1998 Theorem 5.9 (uncertified) |
| 8.3 | reynolds lines 531–540; martinez line 2131 | Theorem 8; the Schur step at line 538 is the declared gap |
| 8.4 | reynolds lines 542–543; martinez lines 2328–2329 | Theorem 9; Theorem 9.8 |

`sources.toml`: 15 entries with distinct keys (10 certified, 5 uncertified); every work of the References has one; no entry added or changed, and no text is missing.

### Adversarial pass (computed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, system at a place (changed) | `S₃`, `p = 2`; `C₇ × C₂`; `S₄`; `SL(2,3)` | `e = 6`, `2` inert in `ℚ(ζ₃)`, `k = 𝔽₄`; `e = 14`, order of `2` mod `7` is `3`, `6/3 = 2` places, `𝔽₈`; `e = 12`, `e = f = 2`, `𝔽₄`; `e = 12`, `𝔽₄` | holds |
| Layers 6–8 at subgroups (R01) | `C₂ ≤ S₃`; `Q₈ ≤ SL(2,3)`; `A₄ ≤ A₅` | own systems `(ℚ₂, 𝔽₂)`, `(ℚ₂(i), 𝔽₂)`, `(ℚ₂(ζ₃), 𝔽₄)`; ambient `𝔽₄`, `𝔽₄`, `𝔽₁₆` (order of `2` mod `15` is `4`) | R01 |
| 1.1 action | `C₇`, `r ↦ r²`; `Q₈` with `C₃` | `s⁻¹ • r = r⁴`, `(s·χ)(r) = ζ₇⁴` against `ζ₇²`; fixed characters `{1, χ₂}`, `C = {±1}` | holds |
| 1.2 route | general; `A₅` on `𝔽₇⁵`; swap on `C₂²` | `(xy) S (xy)⁻¹ = S` from `x⁻¹Sx = ySy⁻¹`; `[xy, s] ∈ inl(X) ∩ inr(S) = 1`; `5⁻¹ = 3` in `𝔽₇`; coset `{(1,0),(0,1)}` has `0` fixed points | holds; controls fail as stated |
| 1.3 | `C₂²` on `𝔽₂³` | fixed vectors `8, 4, 4, 4`, fixed characters `8, 4, 4, 4`, common `2` against `4`, orbits `20/4 = 5` | holds |
| 2.1 normalised extension | general; `Q₈`, `A = ⟨i⟩`; `A = 1` | `c^r = d(a)d(b)/d(ab)`, `c^n = e(b)e(c)/e(bc)`, `c = c^{in+jr}`; `δ^n = 1`, `h = δ^{−r'}`, `h^r δ = 1`; uniqueness `h^r = h^n = 1`. `S = ±√−1 ρ(i)`, `det = −1`, `gcd(2, 2) = 2` | holds; coprimality needed |
| 2.2 canonical extension (headline) | `SL(2,3)`; `S₃` | eigenvalues `ω, ω²`: trace `−1`, det `1`; twists have det `λ² ≠ 1`; `1_{C₃}` extends to `1` (det `1`) and `sgn` (det `−1`); order of a linear character is the lcm of its orders on `Γ` and `S` | holds |
| 2.3 values | `SL(2,3)`; `4, 8` | `2, −2, 0, −1, −1, 1, 1` rational; `χ̂ω` takes `−ω`; `ℚ(ζ₄) ∩ ℚ(ζ₈) = ℚ(i)` | holds |
| 2.4 Gallagher (headline) | `SL(2,3)`; `Z(Q₈)`; `N = G`, `N = 1` | `3 = 3`; `1` against `4`, no extension; `{θ}`; identity | holds |
| 3.1 | `SL(2,3)`; `D₈` | `(−a)⁴ = a`, `(−a)³ = −1`; classes of size `24/6 = 4`; reflections `{a, ax²}`, `{ax, ax³}` | holds |
| 3.2 sign | `SL(2,3)`; `C₂` on `C₅`; `A = 1` | `χ̂(a) = −1`, `χ̂(−a) = 1`: `ε = −1`, `χ* = sgn`; `ε = 1`; `ε = 1`, `χ* = χ` | holds |
| 3.4 restriction formulas | `SL(2,3)`; `3^{1+2}`, `C₂`; `C₃ × C₅` | `(2 sgn + sgn)/3 = sgn`; `χ̂(a) = −1` (eigenvalues `1, −1, −1`, det `1`), `(3ω − ω)/2 = ω`; `Γ = C₃ · (ker ψ × C₅)`. For a generator, `ε' θ₀(a) = ε(χ)`; `θ₀² = 1` and odd `|A|` give `θ₀ = 1` | holds |
| 4.1/4.3 two series | `C₁₅` on `Q₈ × C₁₁` | `3⁵ = 243 = 22·11 + 1`; `C_Γ(C₃) = {±1} × C₁₁`, `C_Γ(C₅) = Q₈`; both series end at `χ₂ × 1` | holds |
| 4.2 `p`-group case (headline) | `SL(2,3)`; `S = 1` | `[χ₂|_C, sgn] = 2 ≡ −1 (mod 3)`; `ε = 1`, quotient `0` | holds |
| 4.4 count (headline) | `Q₈, C₃`; `C₇, C₃`; `C₇ ⋊ C₃` | `2 = 2 = 2`; `1 = 1 = 1`; `3 = 3 = 3` | holds |
| 4.5 law as a conjunction (changed) | `T = 1`; `T = S`; prime index `T`; `S` of order `p` | `π'(Γ, 1)(χ)` a constituent of `χ`, so `χ`; `π(C, 1) = id`; `π' = π'(C_Γ(T), S/T) ∘ π'(Γ, T)` with the first factor fixed by the unique constituent of multiplicity prime to `p` and the second by induction; base case from the `p`-group property alone | existence and uniqueness hold |
| 4.6 | swap on `C₃²` | `(ψ_{2a} × ψ_{2a})* = ψ_{4a} = ψ_a` | holds |
| 5.1 degree relation (headline) | `SL(2,3)`; `3^{1+2}`; induction step | `2 ∣ 4`; `3 ∣ 9`; class of `a` has `|Γ||A|/(|A||C|) = |Γ : C|` elements; `θ(1) ∣ |Γ : C_Γ(T)| μ(1)` and `μ(1) ∣ |C_Γ(T) : C| θ*(1)` | holds |
| 6.1 | `S₃`, `p = 2`; `C₃` | coefficients `1/3, 1/3, 0` and `2/3, −1/3, 0`; `λ_{B₀} = 1, 0, 1`; Osima at `r`: `2/6 = 1/3`; `ζ₃ · ζ₃² = 1` | holds |
| 6.2 Brauer heights (headline) | route; `S₃`; `A₅`; `SL(2,3)`, `p = 3` | `Φ_φ(1)/|G|` has `ν_p ≥ 0` since `|G|_p ∣ Φ_φ(1)`; both inequalities meet at the `χ` with `χ(x⁻¹)` a unit; `0 = 1 − 1`, `1 = 1 − 0`; `0 = 2 − 2`, `2 = 2 − 0`; `0 = 1 − 1`, `1 = 1 − 0` | holds |
| 6.3 heights and change of place (changed) | `SL(2,3)`, `p = 2`; `C₇ × C₂`; `x ∈ 𝔭^n` | heights `0, 0, 0, 1, 1, 1, 0`; decomposition group `{1, 2, 4}`, `3` outside it; `σx ∈ σ(𝔭)^n`, `σ(e_χ) = e_{σ∘χ}`, degrees fixed, `h_{σv}(σ∘χ) = h_v(χ)`; `Br_D` acts on supports, so commutes with `σ` | holds |
| 6.4 | `A₅`; `SL(2,3)`, `p = 3` | `4` and `4`; `N_G(C₃) = C₆` (`24/4`), blocks of `3` | holds |
| 7.1 Min–Max | `S₃`, `p = 2, 3` | `λ(T) = 3 ≡ 1`, `a(R) = 1`; `λ(T) ≡ 0`, `λ(R) = 2 ≢ 0`; `Tr_{D_x}^G(x) = |C_G(x) : D_x| 𝒞⁺` | both directions hold |
| 7.2 covering | `S₃`, `C₃`; `S₄`, `A₄`, `p = 2` | `ω_std = 2·(−1)/2 = −1 = ζ₃ + ζ₃²`; `W|_{A₄} = λ ⊕ λ̄`, `Ind λ → W` onto, both of dimension `2` | holds |
| 7.3 domination | `S₃`, `C₃`, `p = 2, 3`; `S₃ × C₂`; `N = G` | images `(1, 0)`; `1 = e₊ + e₋`; `(1, 0)`; augmentation; fibres of `G/D → G/DN` have `|N : N ∩ D|` elements | holds; no bijection at `p = 3` |
| 7.4 Fong–Reynolds (headline) | `S₃`, `C₃`, `p = 2`; `S₄`, `V₄`, `p = 3` | `0 = 0`; `T = D₈`, two extensions, induced degree `3`, defect zero on both sides | holds |
| 7.6 extended first main | `S₃`, `p = 2, 3`; `S₄`, `V₄`, `p = 2` | indices `1`, `2`; `6`, even, and the block has defect group `D₈` | index condition needed |
| 8.1 vanishing | `S₃`; `SL(2,3)`, `p = 3` | `std(t) = 0`; `χ₃ = 3, 3, −1, 0, 0, 0, 0` | holds |
| 8.3 height formula | general; `SL(2,3)`, `p = 2` | `ν(χ(1)) ≥ ν(|G:T|) + ν(|N:D|) + ν(ξ(1)) = ν(|G:D|) + ν(ξ(1))` as `p ∤ |T:N|`, equality when `ψ(1)/θ_ξ(1) ∣ |T:N|`; heights `{0, 1}` | holds, conditional on the gap |
| 8.4 Reynolds (headline) | `D₈`; `A₄`; `D = 1` | heights `0, 0, 0, 0, 1`; all `0`; one character | both directions hold |
| 9.1 predicate (changed) | `S₄`, `p = 2`; `C₇ × C₂`, two places; `G = 1` | height `1` with `D₈`; heights `0`, `C₂` at both; one block | holds |
| 9.2 predicate (headline, changed) | `S₃`; `A₅`; `SL(2,3)`, `p = 3` | `2 = 2`; `4 = 4`; `3 = 3` twice | values hold; `Irr₀(b')` at the ambient system is R01 |
| Gap | `N = G`; `Z(Q₈)`; nonnormal `C₂ ≤ S₃` | `1 ∣ 1`; `2 ∣ 4`; `2 ∤ 3` | precise; normality needed |

Sections not in the sample and untouched by the repairs (§§3.3, 5.2, 7.5, 8.2) were read in full and their Checks recomputed (`ε = −1`, `λ = sgn`; `1 ∣ 2`, `2 ∤ 1`; `λ_{B₀}(T) = 1`, `λ_{std}(T) = 0`, `|G : PN| = 2`; `θ_ξ(1) = θ(1) ξ(1)`); no disagreement with their theorems.

### Pins and citations resolved

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. Opened at the pins this round: `Ideal.exists_smul_eq_of_isGaloisGroup` (`Mathlib/NumberTheory/RamificationInertia/Galois.lean:127`; primes `P`, `Q` of `B` lying over `p`, finite `G`, `IsGaloisGroup G A B`) and the instance `IsGaloisGroup G ℤ (𝓞 L)` (`Mathlib/FieldTheory/Galois/IsGaloisGroup.lean:56`, from `IsGaloisGroup G ℚ L`); `arrowAction` (`Mathlib/Algebra/Group/Action/Basic.lean:103`); `SemidirectProduct.inl_aut` (138), `range_inl_eq_ker_rightHom` (175); `Subgroup.exists_right_complement'_of_coprime` (`Mathlib/GroupTheory/SchurZassenhaus.lean:277`); `FixedPoints.subgroup` (`Mathlib/GroupTheory/GroupAction/Defs.lean:203`) and the quotient instance (`Mathlib/GroupTheory/GroupAction/OfQuotient.lean:62`); `Subgroup.normalizerMonoidHom` (`Subgroup/Centralizer.lean:186`); `Rep.indResAdjunction` (`Mathlib/RepresentationTheory/Induced.lean:155`); `Representation.isIntegral_character` (`Character.lean:102`); `ZMod.chineseRemainder` (`Data/ZMod/Basic.lean:889`); `IsPrimitiveRoot.autToPow` (`RingTheory/RootsOfUnity/PrimitiveRoots.lean:791`); `padicValRat.zero` (`PadicVal/Basic.lean:144`). Tau Ceti, under `TauCeti/RepresentationTheory/`: `CharacterTable/Table.lean` (`irreducibleCharacters` 114, `mem_irreducibleCharacters_iff` 123, `card_irreducibleCharacters` 181, `characterTable` 337, `sum_characterTable_mul_conj` 585); `CharacterTable/Determined.lean:49` (`Representation.nonempty_equiv_of_character_eq`); `CentralCharacter.lean` (`centralCharacter` 89, `centralCharacter_classSumCenter_mul_character_one` 162, `isIntegral_centralCharacter_classSumCenter` 180); `Degree.lean:117`; `CentralIdempotent.lean:301`; `ClassSum/Basic.lean:31`, `ClassSum/Basis.lean:76`; `Pairing.lean:48`; `VirtualCharacter.lean:127`; `FieldOfValues.lean:44`; `Cyclotomic/Action.lean` (172, 201); `Induction/Conjugate.lean` (485, 683, 836); `Induction/Inertia.lean` (94, 100, 111); `Induction/Clifford/Basic.lean:327`, `Decomposition.lean:305`, `Dimension.lean` (113, 142), `Classes.lean:125`, `Obstruction.lean` (87, 162, 304), `TensorFactorization.lean` (108, 329), `ProjectiveCorrespondence.lean:223`; `TauCeti/GroupTheory/SemidirectProduct.lean:33`. All exist with the hypotheses the contracts state.

Cross-roadmap citations, resolved now:

- ModularCharactersAndBlocks at the head of its open pull request (a new roadmap): all cited sections exist; read Conventions, §§1.1, 2.3, 2.4, 4.2, 6.2, 7.1, 7.2, 8.1, 8.2 in full. `existsUnique_blockIdempotent_map_residue` (§1.3), `exists_blockIdempotent_iff_centralCharacter_congr` and `SameBlock` (§4.2), `IsDefectGroup`, `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (§6.2), `brauer_first_main` (§7.1) are there; §7.2 is stated for the system of §1.1; §8.1 for normal `p`-subgroups; §8.2 has covering for arbitrary `N`.
- InverseGaloisAndArithmeticFundamentalGroups at its open head, earlier in the merge order: IG.3.4, target *Conjugacy of coprime complements*, with `N` or `G/N` solvable and conjugacy by an element of `N`.
- CharacterTheory on main: §§2.1, 3.5, 3.6, 4.3, 4.4; `fieldOfValues_eq_map_fixedField_stabilizer` in §4.4.
- InductionRestriction on main: Layers 1, 2, 5, 7.

Dependency gate, run on the candidate:

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after InverseGaloisAndArithmeticFundamentalGroups (the intake inserts it when its design is accepted)
note: supplier ModularCharactersAndBlocks of ModularCharactersAndBlocksPartII is not in the merge order; it must be inserted before ModularCharactersAndBlocksPartII
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

No UPWARD and no CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

### Ownership and overlaps

Read the board package index. Searched main and the open heads by object: Glauberman correspondence, canonical extension, Gallagher, Fong–Reynolds, Osima, Alperin–McKay, height zero, block domination, coprime complements, permutation lemma, change of place. Fong–Reynolds, Osima, Alperin–McKay and change of place have no match outside this roadmap. OddOrderTheorem §1.3 (coprime action) states commutator and centraliser facts and Maschke, not the fixed-class and fixed-coset statements of §1.2 here, and no character correspondence; it cites the same IG.3.4 target. FiniteGroupInvariants §6.2 states the permutation lemma for the Galois action, which Scope cites and §1.3 does not restate. GlaubermanZStar consumes the base and adds no block theory. FiniteGroupExtensionSplitting on main leaves the conjugacy of coprime complements to another roadmap. The overlap report lists no pull request changing this roadmap, no dropped id and no id defined only by an open revision.

Overlap check: read ModularCharactersAndBlocks, GlaubermanZStar, OddOrderTheorem, FiniteGroupInvariants, CharacterTheory, InductionRestriction, FiniteGroupExtensionSplitting; domination for normal `p`-subgroups, defect classes and the central character of a block: ModularCharactersAndBlocks; conjugacy of coprime complements: InverseGaloisAndArithmeticFundamentalGroups; the permutation lemma for the Galois action: FiniteGroupInvariants; nothing else shared.

### Headlines and the acceptance file

Headlines from the Summary and *How to read the build*: the canonical extension (§2.2), Gallagher's correspondence (§2.4), the `p`-group characterisation (§4.2), the counting theorem (§4.4), the Glauberman bijection with its constituent, field and degree properties (§§4.5–5.1), Brauer's theorem on heights (§6.2), Fong–Reynolds with heights (§7.4), Reynolds' theorem (§8.4), and the two predicates (Layer 9). The package is at the design stage and has no `Suggested.lean`: nothing to probe for padding, no `#check @name` comparison, no import audit. Elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.

### Copyright, licences and scope

Wording: the 15 sampled statements and five further passages (the §1.2 route, the §2.1 route, the §7.3 route, the §8.4 route, the Conventions on conjugate characters) were set beside glauberman, hartley-turull, martinez, reynolds and sambale at the lines above. The longest run shared with a source is six words, in the statement of the extended first main theorem (martinez line 1987), which the mathematics forces; no proof plan follows a source clause by clause (the §1.2 and §8.4 routes are not in the sources cited for them). Arrangement: martinez has the largest share, 38 of 100 locators; its contents (Lectures 1–9: Brauer characters, blocks, defect groups, the Brauer map and first main theorem, the second main theorem, Clifford theory, covering and Fong–Reynolds, domination and `P C_G(P)`, regular blocks and height zero) were set beside Layers 6–9. Layer 6 draws on its §§2.1, 3.1–3.2; Layer 7 on §§3.1, 4.2, 7.1, 7.2, 8.1, 8.2, 9.1, 9.2; Layer 8 on §§8.2, 9.3 and on reynolds: no one-to-one run. Layers 2–4 follow the order extension, cyclic case, solvable case, which glauberman (24 locators) shares; the dependency lines force it (§3.2 needs §§2.2–2.4, §4.1 needs §3.2, §4.2 needs §3.4), and the scopes differ (the fixed-class lemma is in Layer 1, the degree bound in Layer 5, the uniqueness of the family and Gallagher's correspondence for any normal subgroup are not in that paper). Reuse: no table, figure or list is taken over.

Source independence: 20 passages compared with 5 sources, none shared; largest share martinez, 38 of 100 locators; contents compared with martinez: independent.

## Not verifiable

- `isaacs` (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13), `isaacs-1973`, `navarro-1998` (Chapter 3, Theorem 5.9), `navarro-2018` (Chapter 2), `feit` (Chapter IV): settled as uncertified, cited by locator, texts not available and not requested.
- Published pagination of kessar-malle, mnst and ruhstorfer: the cached texts are preprints; their lines were not reread this round (outside the sample, untouched by the repairs; the round-5 rows carry the lines read).
- Lean elaboration and the one-tactic probe: no acceptance file at the design stage.

## Source issues

- **Misprint** in martinez at §3.2, printed p. 18 (martinez line 725): the source says a character has height zero when the block's numerical defect equals the `p`-part of its degree; it should be that the `p`-part of the degree equals `p` to the power `a − d(B)`; affects a stated result.

## For the human reviewers

- **Licence.** `martinez`, the source with the largest share of locators (38 of 100), is unpublished course notes (Firenze 2024) read from an author page; `sources.toml` records it as certified.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "81cac4ba7ed9a524e9dbe3034fd63bdfdbe3f15c", "job": "REV-DESIGN-ModularCharactersAndBlocksPartII~6", "model": "fable", "worker": "chris-x30"} -->
