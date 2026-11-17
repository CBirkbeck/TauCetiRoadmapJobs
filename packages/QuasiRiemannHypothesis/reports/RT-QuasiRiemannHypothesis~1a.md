<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18800#issuecomment-6940555700 -->
Red team round 1 pass a (claude) of eba3543

Verdict: needs_changes

**Source independence:** 16 passages compared with 5 sources, and a scan for shared runs of seven words between the README and ten source texts, none shared beyond formula strings and one definition's hypothesis list (longest prose run 9 words, `goldmakherlouvel2013` line 46); largest share `openai2026quasiRH`, 63 of 141 locators; contents compared with `openai2026quasiRH`: independent at the layer level (Layers 2–5 split and reorder its §4, Layers 6 and 8 come from other sources, its §8 is Layer 7 and precedes its §5 as Layer 9), with two titles and three labels taken from it (R07).

**Research link:** Layers 6 and 8 are the large sieves and the cubic theta function of Heath-Brown 2000, Blomer–Goldmakher–Louvel 2014 and Patterson 1977 that Dunn–Radziwiłł 2024 use for cubic Gauss sums; §11.2 extends Lamzouri–Li–Soundararajan 2015; the headline rests on the OpenAI 2026 and Liu 2026 preprints. Basis: the README's sources and those texts.

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the Tau Ceti lemma cited for orthogonality is the converse expansion

   Location: `packages/QuasiRiemannHypothesis/README.md:249-250` ("orthogonality on ray class groups
   `TauCeti.LFunctions.sum_smul_rayClassCoeff` (`LFunctions/Hecke/Orthogonality.lean`)"), and the same
   name at README:974 and README:990.

   Claim: `sum_smul_rayClassCoeff` supplies the orthogonality used for the finite Fourier expansion of
   §4.6 (`Φ = Σ_θ a_θ θ`, a function written through characters).

   Witness: pinned Tau Ceti `NumberTheory/LFunctions/Hecke/Orthogonality.lean:68`:
   `sum_smul_rayClassCoeff` writes a character through class indicators (`∑_c χ(c) 1_c = χ`). The
   orthogonality direction is `sum_inv_smul_toUnitaryIdealWeight` (line 86).

   Repair: at README:249-250, 974 and 990 replace `TauCeti.LFunctions.sum_smul_rayClassCoeff` by
   `TauCeti.LFunctions.sum_inv_smul_toUnitaryIdealWeight` (`#Cl_𝔪 · 1_c = ∑_χ χ(c)⁻¹ χ`, column
   orthogonality on a ray class group). Tested: `T = ℤ/2`, `Φ = 1_0`: the pinned line-86 identity gives
   `2 · 1_0 = 1 + θ`, the `a_θ = 1/2` of the §4.6 Check; line 68 gives nothing about `1_0`.

2. **F02** (P3) §6.1: the pairing is written in the order for which the phase is not defined on the torus

   Location: README:1175-1178 ("dual lattice `Λ^∨ = {y : B(Λ, y) ⊆ ℤ}` … `Σ_{m ∈ Λ^∨, |m| ≤ Q} |Σ_j a_j
   e^(2πi B(m, z_j))|²`").

   Claim: for a nondegenerate real bilinear pairing `B` the phase `e^(2πi B(m, z_j))` is a function of
   `z_j ∈ ℝ^d/Λ`.

   Witness: `d = 2`, `Λ = ℤ²`, `B(x, y) = x₁y₁ + x₁y₂/2 + x₂y₂`. Then `m = (1/2, 1) ∈ Λ^∨`
   (`B(e₁, m) = 1`, `B(e₂, m) = 1`), but `B(m, e₂) = 5/4`: replacing `z_j` by `z_j + e₂` multiplies the
   phase by `i`.

   Repair: write the phase as `e^(2πi B(z_j, m))` (the dual lattice pairs in the second slot). On the
   witness `B(e₁, m) = B(e₂, m) = 1 ∈ ℤ`, so the phase is well defined; for `ℂ/𝓞` with `e(xy)` the
   pairing is symmetric and nothing changes in §10.2 or the Examples.

3. **F03** (P3) §5.4: the group `X(K)` is named but not determined

   Location: README:1090-1092 ("with group `X(K)` of the primitive Dirichlet characters attached to `K`
   by Kronecker–Weber (`[K : ℚ]` of them)").

   Claim: `X(K)` is an object the factorization `L^S_K(s, χ ∘ N) = ∏_{ψ ∈ X(K)} L^S(s, χψ)` and the
   route of §5.5 can quantify over.

   Witness: `TauCeti.ClassFieldTheory.kroneckerWeber` gives only `∃ n ≠ 0, Nonempty (E →ₐ[ℚ]
   CyclotomicField n ℚ)`; no set of characters is attached. The route's step "`ψ(p)` runs over the
   `f`-th roots of unity, each `g` times" needs `ψ(p) = ψ(Frob_p)`.

   Repair: replace the parenthesis by: "`X(K)`: for any `n` with `K ⊆ ℚ(ζ_n)`
   (`kroneckerWeber`), the primitive characters inducing the Dirichlet characters modulo `n` that are
   trivial on the subgroup of `(ℤ/n)ˣ ≅ Gal(ℚ(ζ_n)/ℚ)` fixing `K`; the set does not depend on `n`, is a
   group of order `[K : ℚ]` dual to `Gal(K/ℚ)`, and `ψ(p)` is the value of `ψ` at the Frobenius of an
   unramified `p`." Tested: `K = F`, `n = 3`: the fixing subgroup is trivial and `X(F) = {1, χ₋₃}`, as
   README:2153 uses; `K = ℚ`: `X = {1}` and the factorization is `L^S(s, χ) = L^S(s, χ)`.

4. **F04** (P3) §11.1: the Hecke clause of the zero strip is stated for `F` only

   Location: README:2185-2186 ("and the same for the primitive finite-order Hecke characters of `F`,
   under the hypothesis for that family").

   Claim: the conditional strip `1 − θ ≤ Re ρ ≤ θ` under a zero-free half-plane `Re s > θ` is a
   statement about `F`.

   Witness: the route (README:2186-2190) uses only the functional equation of LFunctions Layer 5 and
   the nonvanishing of Layer 7, both stated for every number field; the gamma factors `Γ_ℝ(s + a)`,
   `Γ_ℂ(s)` have no zero or pole in `0 < Re s < 1`. Nothing uses `F`.

   Repair: "and the same for the primitive finite-order Hecke characters of any number field `K`, under
   the hypothesis for the family of `K`; the instance `K = F`, `θ = 11/12` is
   `re_mem_Icc_of_heckeLFunctionC`." No change to `Suggested.lean`. Tested: `K = ℚ` gives back the
   Dirichlet clause (the trivial character is `ζ`, pole at `1` of order `−1`, not a zero); `θ = 1/2`
   gives `Re ρ = 1/2`.

5. **F05** (P3) terms of the main source used without a definition

   Locations and the terms: README:1761 "finite-ray characters"; README:1373-1374 "deleted radicals";
   README:1811 "express the masks"; README:1404-1406 "a finite height order `A`", "the external tail
   order"; README:1862 "the primary phases of §4.5"; README:75 and 1831 "unmarked reflected energy".

   Claim: these are standard or defined in the roadmap.

   Witness: none is defined in the README; each occurs in `openai2026quasiRH` (lines 421, 1008, 1168,
   509, 2582, 24). README:1404-1406 follows `openai2026quasiRH` line 2582 with four consecutive words
   shared ("the external tail order").

   Repair, term by term:
   - README:1761: "a finite family `𝒳` of ray class characters of moduli of `F`, read on primary
     generators with their zero extensions".
   - README:1373-1374: "whose primitive conductors, and the products `∏_{𝔭 ∈ E_ψ} 𝔭` of the primes of the
     defining modulus not dividing the conductor, have norm `≪ U`".
   - README:1811: "express the congruence and character restrictions on the index (the `L`-periodic `Φ`
     and the twists `χ_p^(j_p)`) by finite Fourier inversion".
   - README:1404-1406: "an exponent `A ≥ 0` of the height factor `(1 + T₁)^A`" and "the decay exponent
     `N` of the tails beyond height `T₁` (§3.2) is chosen after `T₁`, and `A` does not depend on it".
   - README:1862: "through which `R`, `G`, `n ↦ χ_n(−1)` and `c ↦ χ̄_c(4)` of §4.5 factor".
   - README:75 and 1831: add once, in §9.4: "*unmarked*: no prime factor of the index is singled out
     (the marked form belongs to QuasiRiemannHypothesisPartII)".

6. **F06** (P3) one `*Needs:*` line for several theorems with different needs

   Locations: README:1829 (§9.3: three theorems, "*Needs:* §9.2; §2.4; §3.2; §3.5"); README:1847 (§9.4:
   two theorems, "*Needs:* §§9.2–9.3; §6.2; §3.3"); README:2109 (§10.5: five theorems, one line).

   Claim: each target's prerequisites can be read off.

   Witness: in §9.4 the quadratic reduction uses §6.2 alone, the energy bound uses §§9.2–9.3 and the
   reduction; in §9.3 the lattice-tail bound uses §3.5 and the sectors §2.4; the single lines hide this.

   Repair: split the lines.
   - §9.3: "*Needs (sectors):* §§2.4, 4.5, 9.2. *Needs (common kernels):* §§3.2, 9.2. *Needs (lattice
     tails):* §3.5; §9.2 for `K = V♯`."
   - §9.4: "*Needs (quadratic reduction):* §6.2. *Needs (reflected energy):* §§9.2–9.3, the quadratic
     reduction, §3.3."
   - §10.5: "*Needs (external tails):* §3.2. *Needs (moving a bin):* §§7.2–7.3, 10.3–10.4, 5.1, 3.2.
     *Needs (retained integral):* §§10.4, 7.2, 5.3. *Needs (principal signal):* §§10.3, 5.3, 3.4, 1.3.
     *Needs (outer row norms):* §§5.1–5.2, 10.3, 3.2."

7. **F07** (P3) two titles and three target labels are the main source's own

   Locations: README:1896 "### 10.2 The balanced low estimate"; README:2045 "**Moving a fixed bin**";
   README:1820-1826 ("Prove: (Lemma 5.2) for a fixed finite family … (Lemma 5.3) the transforms …
   (Lemma 5.4) for the lattice").

   Claim: the organisation and the names are the roadmap's own.

   Witness: `openai2026quasiRH` line 33 (contents, §6.2, the same four words) and line 48 (§10.4, the
   same four words); §9.3 names its three targets by that source's lemma numbers, in its order.

   Repair: retitle §10.2 "The low estimate at `X = Y = Z^(1/2)`"; retitle the bullet "**Contour shift
   for the rows of one bin**"; in §9.3 name the targets by their mathematics — "(sectors of twisted
   characters)", "(uniform smoothness of the transforms `V♯`)", "(lattice tails)" — and move the three
   lemma numbers into the closing locator, which already carries them. The order of §§9.1–9.4 and
   10.1–10.7 is forced by their `*Needs:*` lines (9.2 ← 9.1; 9.3 ← 9.2; 9.4 ← 9.3; 10.2, 10.3 ← 10.1;
   10.5 ← 10.3–10.4; 10.6 ← 10.5; 10.7 ← 10.6) and is no finding.

Seven findings, all P3. No statement of `Suggested.lean` or bold README target was refuted on any
instance tried; the tables under `## Verified sound` carry the computed values. The dependency check
is clean:

```text
depcheck: 261 roadmaps, 2606 edges, 0 problem(s)
```

`git diff --stat origin/main...HEAD` shows only `packages/QuasiRiemannHypothesis/` (README.md,
Suggested.lean, metadata.toml, two reports).

## Verified sound

Counts: 11 declarations read (all of `Suggested.lean`, 182 lines); 55 targets read (the whole
README, 2361 lines); 83 locators verified against the texts (40 numbered results of
`openai2026quasiRH` with their printed pages, 43 in sixteen other sources); 148 Checks recomputed; 50
sibling citations resolved to a heading (9 of them read in full); 82 pinned declaration names
grepped (37 Mathlib, 45 Tau Ceti), all present.

Elaborated signatures: no Lean was run in this pass. The 11 elaborated types of the worker's
`#check @name` file (scratch `signatures.md`) were compared one by one with the README statements;
no binder is lost and nothing changed.

### `Suggested.lean`, declaration by declaration

| Declaration (section; context) | Instances tried, values on each side | Result |
| --- | --- | --- |
| `ZeroFreeRightOf` (Layer 1; none) | `s − 2`: order `1` at `2`, so false at `σ = 3/2`, true at `σ = 2`. Zero function: order `⊤`, false for all `σ`. `1/(s − 1)`: order `−1`, true. `s ↦ s̄`: junk order `0`, true | determines the object for meromorphic `f`; no change |
| `zeroFreeRightOf_LFunction_of_isAbelianGalois` (Layer 5; `K`, `[IsAbelianGalois ℚ K]`, `0 ≤ σ₀`) | `K = ℚ`: hypothesis is the conclusion for primitive characters; imprimitive: deleted factors vanish only on `Re s = 0`. `K = F`, `χ = χ₋₃`: cofactor has a pole at `1`, `L(1, χ₋₃) = π/(3√3) = 0.6046 ≠ 0`. `σ₀ < 1/2`: hypothesis false (zero `1/2 + 14.13i`). No continuation: `heckeLFunctionC = 0`, hypothesis false | true as typed; no change |
| `zeroFreeRightOf_heckeLFunctionC` (Layer 10; `F`, `[IsCyclotomicExtension {3} ℚ F]`) | trivial character of `𝔪 = (2)`: `ζ_F(s)(1 − 4^(−s))`, order `−1` at `1`, zeros of the factor on `Re s = 0` | not refutable on instances; rests on the sources (see the human reviewers) |
| `zeroFreeRightOf_LFunction` (Layer 10) | `N = 4`, `χ = 1`: order `−1` at `1`; `N = 1`: `ζ` | same |
| `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` | `s = 1` excluded; Mathlib `ζ(1) = (γ − log 4π)/2 = −0.977` is not read | same |
| `re_mem_Icc_of_LFunction_eq_zero` (Layer 11) | `N = 1`, `ρ = 1`: value `−0.977 ≠ 0`, hypothesis false. Even primitive `χ`: trivial zero `ρ = 0` has `Re ρ = 0`, excluded. Imprimitive principal mod `p`: zeros on `Re s = 0`, and `IsPrimitive` fails | true given 10.7; no change |
| `re_mem_Icc_of_heckeLFunctionC` | trivial `ψ`: pole at `1` has order `−1`, not `> 0`; `ζ_F(0) ≠ 0` and `Re 0 = 0` anyway | true given 10.7 and LFunctions Layer 5 |
| `exists_ne_zero_ne_one_le_log_rpow` | `q = 2`: no `χ ≠ 1`. `q = 3`: `n = 2`. `q = 3∏_{p ≤ y} p` induced by `(·/3)`: least `n` is about `y ≤ 2y`, bound `≍ y^(1/(1−θ)) ≥ y²`. Prime side differs by `O(ω(q) log x)`, `ζ` side by the prime number theorem | true; no change |
| `exists_prime_ne_zero_ne_one_le_log_rpow` | `𝔪₀ = (1)`: `log 1 + 2 = 2 > 0`. Trivial `η`: excluded by `η ≠ 1`. `K = ℚ(i)`, `𝔪 = (3)`: `η((1+i)) = (2/3) = −1`, norm `2` | true; no change |
| `exists_jacobiSym_eq_neg_one_le_log_pow` | `p = 3`: `n = 2`, `log 3 = 1.0986`; `p = 7`: `n = 3` | follows from 10.7 and 11.2 at `θ = 11/12` (`1/(1 − θ) = 12`) |
| `exists_jacobiSym_eq_neg_one_le_rpow` | `(log p)^12 ≪_δ p^δ` | follows from the previous |

Headline theorems (README Summary): the `11/12` half-plane (stated, three forms), the zero strip
(stated, two forms), the conditional least-character-value bound (stated, two forms), the least
nonresidue and Vinogradov's conjecture (stated), the transfer (stated). Layers 8 and 9 are named in
the module docstring as not statable, with the missing carriers. No padding found: the two short
corollaries (`ζ`, Vinogradov) are named results, not one-tactic consequences of the pinned library.

### README, statement by statement (values computed)

| Statement | Instances and values | Result |
| --- | --- | --- |
| §1.2 abscissa, four bullets | `{s − 3/4}` gives `3/4`; `{s − 1/4}` gives `1/2`; `{s − 2}` gives `2 ∉ [1/2, 1]` | consistent |
| §1.3 continuation principle | empty family: `β* = 1/2 < σ₀`, vacuous. `E* = min(β* − σ₀ − ω, σ) > 0`, `β* − E* ≥ σ₀ + ω`; Gaussian `e^((7/6)² − t²)` on `Re s = 2` | proof route closes |
| §1.4 | `(1 + Z^τ)^A ≤ 2^A Z^(m/4)`; total `Z^(C(β*) − 3m/4)`, then `N` | sound |
| §2.1 | `K = ℚ`, `n = 2`, `a = 5`: `(5/3) = −1`, conductor `5`. `K = F`, `a = −1`: `−1` at norm `7`, `+1` at norm `13` | sound |
| §2.2–2.3 | `𝔽₇`, `ω ↦ 2`: values `1, ω, ω², −1, −ω, −ω²` at `1, 2, 4, 6, 5, 3` | sound |
| §2.5 | `1 − λ² + λ³ = 1 − 6ω ≡ 1 + 3ω (mod 9)`; `(ω/d)_3 = ω²`; `(λ/d)_3 = 5² ≡ 4 = ω²`; conjugate pair: `t = −7` | sound; `cubic_reciprocity_intCast` read at the pin |
| §3.3 | `∫ (2√π)⁻¹ e^(−u²/4 + su) du = e^(s²)`; variant `√π e^(s²/4)` | sound |
| §3.5 | `e(ω) = 1`, `e(ω/2) = −1`; residue `2π/(6√3) = π/(3√3)`; `H = 3`: `2` ideals against `1.81` | sound |
| §4.1–4.3 (numerical, `p = 1 + 3ω`) | `γ_3 = i`; `γ_6 = −0.37796 = −1/√7`; `γ_2³ = 0.18898 − 0.98198i = −α(p)`; `γ_1γ_2 = −0.65465 + 0.75593i = −α(p) ω i` | sound |
| §4.4 | `Γ(1) = Γ(−1) = 1`, `Γ(λ) = i`, `Γ(−λ) = −i`, `Γ(−3) = Γ(3) = 1`, `Γ(1 + 3ω) = i`, `Γ(4 + 3ω) = 1`; `τ(λ, −λ) = 1` matches `(−1)^(fg + fh)` | sound |
| §4.5 | `a = 1 + 3ω`, `b = −2 + 3ω`: `ω ↦ 7` in `𝔽₁₉`, `χ_b(a) = 27 ≡ 8 = −ω²`, `χ_a(b) = ω²`; both in the class of `λ` mod `4` (`aω ≡ λ`, `bω² ≡ λ`) | sound |
| §5.1 | `1 − 2^(−σ₀) ≤ |1 − a N𝔭^(−s)| ≤ 2`; `D'/D` bounded by `log N𝔯/(2^(σ₀) − 1)` | sound |
| §5.2 | `ζ(11/10) = 10.5844`; `ℒ(−1/10) = 0.50995`; `3 (0.9/2π)^(3/5) ζ(11/10) = 9.895`; `61.385`; supplier contract read at ExplicitZetaBounds §3.2 | sound |
| §5.4 | `ℚ(√2)`, `1 + 3√2`: norm `−17`, `χ(17) = −1` | sound |
| §6.1 Checks | `N²` against `(Q + N) N` | sound after R02 |
| §6.2 negative control | quadratic family over `ℚ(i)` as fourth-order: `N³` against `N^(2+ε)` | sound; see Source issues |
| §6.3 | cubing `1 + λ²x ↦ 1 − λ⁴x + …`, onto units `≡ 1 (mod λ⁴)`; `10² ≡ 2 = ω` in `𝔽₇` | sound |
| §7.2 | failures give `M_I > a₀ + (I − 1)ε ≥ a₀ + 1 + ε`; disc heights `(3i + 2)T₁ + 2 ≤ 3(i + 1)T₁` | sound |
| §7.3 | exponents `δr + ε'/2`, `δ(1 − m) + 3ε'/4`, height `9^C U^(ε'/10)` | sound |
| §8.1 | first matrix: determinant `1`; `(c/a)_3 = ω`, `(b/d)_3 = 4⁴ ≡ 9 = ω`, `(c/d)_3 = 81 ≡ 3 = ω²` in `𝔽₁₃`; second: `κ_P = ω`, `κ = ω²` | sound; `κ_P = κ̄` confirmed |
| §8.3 | `φ(1) = π(−1/4)/(π/4) = −1` | sound |
| §8.5 | `648/2 = 324`, `324/27 = 12` cusps | sound |
| §8.7 | `g̃(1 + 3ω) = 0.89595 − 0.44415i`, cube `−α`; bounds `3^(n/2 + 7/3)`, `27 · 3^(−2/3) = 12.98` | sound |
| §9.2 | `𝓜_{0,0}(V_G) = √π e^(1/16) = 1.887`; poles of the quotient at `−5/6, −7/6, …`; growth `|u|^(4A)` | sound |
| §10.4 | `R(1/50) = 1`, `R(2/3) = 2/3`, `R(1) = 1/2` | sound |
| §10.5–10.6 | `C(s) = s − 2/3`; `13/150 − 1/4 + 1/50 = −43/300`; slope range `[33/50, 62/75]`; at `d = h` the margin is `β*/2 − 5/12 > 1/24`; `1021/25000`; `7/4 + 0.501 − 4 < −1`; `46 · 10⁻⁶ < 1/4800` | sound |
| §11.3 | `4/(1 − 2ϵ)`: `32` at `7/16`, `48` at `11/24`, infimum `24` | sound |

Ownership: `roadmaps grep` over main and the 451 open heads for the Kubota character, the cubic
theta function, Fisher–Friedberg characters, sextic symbols, cubic and sextic large sieves,
zero-free half-planes, fixed-numerator characters and bounds for the least nonresidue found no other
owner. ExplicitMultiplicativeFunctions (earlier in the order) mentions the `7/8` half-plane in its
scope and plans none of its consequences. No declaration of `Suggested.lean` has a fully qualified
name used by a readable roadmap. No roadmap of the never-cite list is cited.

Policy: no pull-request number, process word, `lemma`, `set_option`, `#eval` or algorithm in the
README or the Lean file; the clause on square roots modulo `p` is excluded as background.

Source independence: 16 passages compared with 5 sources, and a scan for shared runs of seven words between the README and ten source texts, none shared beyond formula strings and one definition's hypothesis list (longest prose run 9 words, `goldmakherlouvel2013` line 46); largest share `openai2026quasiRH`, 63 of 141 locators; contents compared with `openai2026quasiRH`: independent at the layer level (Layers 2–5 split and reorder its §4, Layers 6 and 8 come from other sources, its §8 is Layer 7 and precedes its §5 as Layer 9), with two titles and three labels taken from it (R07).

Research link: Layers 6 and 8 are the large sieves and the cubic theta function of Heath-Brown 2000, Blomer–Goldmakher–Louvel 2014 and Patterson 1977 that Dunn–Radziwiłł 2024 use for cubic Gauss sums; §11.2 extends Lamzouri–Li–Soundararajan 2015; the headline rests on the OpenAI 2026 and Liu 2026 preprints. Basis: the README's sources and those texts.

## Not verifiable

- The truth of the `11/12` half-plane itself (§§9.2–9.4, 10.2–10.6 as a whole): the constants and
  the exponent bookkeeping were recomputed, the analytic estimates were not re-proved.
- The conjugation bars in `patterson1977` Theorem 8.1 and (8.8)–(8.9), and in `openai2026quasiRH`
  Lemmas 4.2 and 4.4: both texts are OCR and lose overlines. The README's conjugates were checked by
  computation at `p = 1 + 3ω` (table above), not against the print.
- `dunnradziwill2024` Remark 5.1: the extraction reads `(c/a)_3 = (c/d)_3`; the computation at
  README:1484-1486 gives `ω` and `ω²`, so the print must carry a bar the extraction dropped.
- §8.6: the six functional equations and the nine additive shifts `β_(a,b)` against `patterson1977`
  (7.1)–(7.5): the OCR of these displays is unreadable; the hypotheses (7.4), the residue relations
  and the page numbers were confirmed (`patterson1977` lines 930-953).
- §9.2: the scalar `ζ_t`, the bound `1/81` and the kernel constant `(2π)⁴/27` against
  `openai2026quasiRH` Proposition 5.1: located (line 1041, p. 24), displays not legible in the OCR.
- `kubota1968` (German, OCR): the formulas (12), (16)–(17), (22)–(25) and the interval on p. 265 were
  not compared; the normalisation of §8.3 was checked by the `ℤ[i]` computation instead.
- `gaozhao2020`, `maynardpratt2024`, `guthmaynard2026`, `baierbansal2018`, `gaozhao2024`: the locators
  exist in the texts; the statements were not compared in detail.
- Forty-one of the 50 sibling citations were resolved to their headings only.

## Source issues

- **Error** in goldmakherlouvel2013 at Remark 3 and Corollary 1.2, printed page 2: the source says the `n/d`-th powers of any `n`-th order Hecke family form a `d`-th order family and satisfy the quadratic sieve bound; it should assume that the primitive characters inducing the powers satisfy the reciprocity and primitivity axioms (a quadratic family over `ℚ(i)` read as fourth-order has trivial squares); affects a stated result.

## For the human reviewers

- **Scope.** The headline (`11/12` half-plane) is stated only in unrefereed preprints: `openai2026quasiRH` (author given as "OpenAI", 30 September 2026), `openai2026quasiRHalt`, and `liu2026improved`, whose Part I is a summary crediting the first (README:32-35).
- **Licence.** `openai2026quasiRH` and `openai2026quasiRHalt` are read from a GitHub repository (`openai/math`, manifest class `open-repository`); I did not read that repository's licence.
- **Licence.** `liu2026improved` line 25 says its result is formalised in Lean; that formalisation was not read, so `Suggested.lean` was not compared with it.
- **Not tested.** `openai2026quasiRH` is an OCR extraction: its table of contents and prose were compared, its displayed formulas only where legible (see `## Not verifiable`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eba3543bd348ddb197b82d96e7b2d38afbc0f035", "job": "RT-QuasiRiemannHypothesis~1a", "model": "fable", "worker": "chris-x29"} -->
