<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6862066032 -->
Red team round 2 pass b (claude) of c038ca8

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §6.8 rests on theorems that no layer, supplier or pin provides, and its low-genus Eichler claim has no route

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2554-2570`, "the `T_p` act on
   `ℂ[X₈]`, `ℂ[X₁₆]`, `ℂ[X₂₄]` with `1`, `2`, `24` distinct joint eigenlines … Prove also the low-genus
   Eichler basis theorem", with `*Needs:* §§5.3, 6.3–6.5; MetaplecticAutomorphicForms §3.21; …`.

   Claim: these statements follow from the named inputs, inside Layer 6.

   Witness: CL14 line 12452–12466 (IX §4.3, p. 326) uses Nebe–Venkov's distinct eigenvalues and Erokhin's
   bound (line 11130–11136); line 12625–12631 (p. 331) applies Böcherer's criterion to every weight-12
   eigenform. `roadmaps grep` finds "Erokhin" in no roadmap; README line 430 excludes any neighbour
   enumeration.

   Further detail: in rank 16, "degree 4" (line 2556) needs `θ₄[E₈ ⊕ E₈] ≠ θ₄[D₁₆⁺]`, which appears only as
   a Check (line 2508).

   Why the present text cannot close: §6.5 proves only `g₀ ≤ n = 24`; for `13 ≤ g₀ ≤ 24` the cusp form
   `θ_{g₀}(v)` has singular weight, and its exclusion is §7.6, which itself needs §6.8.

   Repair (four edits; the numbering of §§6.1–6.12 is unchanged).

   1. Add to §6.5, as targets owned here, after "that `θ_n` is injective on `ℂ[X_n]`":

      > Prove also the two injectivity theorems in lower genus that the classification of §6.8 uses:
      > `θ₄` is injective on `ℂ[X₁₆]`, that is `θ₄[E₈ ⊕ E₈] ≠ θ₄[D₁₆⁺]` (Witt's conjecture, proved by Igusa
      > and Kneser; CL14 V §2, pp. 137–138), and `θ₁₂` is injective on `ℂ[X₂₄]` (Erokhin; CL14 V §3, p. 140,
      > and IX Lemme 2.9, p. 290). Hence every eigenvector of `ℂ[X₁₆]` has degree at most `4` and every
      > eigenvector of `ℂ[X₂₄]` degree at most `12`.

      Record Erokhin's paper (CL14 line 16872) in `sources.toml` under its own key; CL14 only quotes it.

   2. Replace the last sentence of §6.8's first paragraph ("Prove also the low-genus Eichler basis theorem
      … `g ≤ 23`).") and the third API bullet by this route, and rename the heading "The small-rank lattice
      eigenparameters and their degrees":

      > Route in rank 24 (CL14 IX §4.3, p. 326, with the regular packets of §3.5 in place of CL14's
      > Proposition VIII.7.1). The `T_p` commute and are self-adjoint (§6.3), so `ℂ[X₂₄]` has a basis of
      > joint eigenvectors. Let `v` be one, of degree `g₀ ≤ 12` (§6.5). If `1 ≤ g₀ ≤ 11`, the cusp eigenform
      > `θ_{g₀}(v)` has weight `12 > g₀`, so it has a parameter `ψ_F ∈ Ψ₁(Sp_{2g₀})` with weights
      > `0, ±(12 − j)`, whose blocks have motivic weight at most 22 and lie among the eleven classes of §5.3;
      > by §3.5 its one odd block has length one, so `ψ_F` has no block `[d]` with `d ≥ 3`; and §6.9 gives
      > `ψ_G = ψ_F ⊕ [23 − 2g₀]`. So `g₀` is the least `g` with `[23 − 2g]` a summand of `ψ_G`, and two
      > eigenvectors with the same `ψ_G` have the same degree and, by multiplicity one in §3.5, proportional
      > images under `θ_{g₀}`; a combination of them would then lie in `ker θ_{g₀}` with the same `ψ_G` and a
      > larger degree. If `g₀ = 12`, then `ψ_F = ψ_G ⊕ [1]` (§6.9) lies in `Ψ₁(Sp₂₄)` and its packet contains
      > `ρ₁₂^{(12)}`; by §3.8 it is in case (I) or (H1), case (H2) needing `Sym²Δ₁₁[3]`, of weight `12 > 11`;
      > in both, every zero-weight block has length one, and `[1]` cannot occur twice, so `ψ_G` has no
      > trivial summand, unlike every parameter of degree at most 11; and §§3.3 and 3.8 give multiplicity
      > one. Hence the 24 eigenlines have pairwise distinct parameters. There are exactly 24 formal
      > sums of dimension 24 with blocks among the eleven classes and the weights `±11, …, ±1, 0, 0` (CL14 IX
      > Théorème 4.4, p. 326), so each occurs once. In rank 16 the same argument with `g₀ ≤ 4` gives
      > `Δ₁₁[4] ⊕ [1]` in genus 4, the only parameter with weights `0, ±7, …, ±(8 − g₀)` for `1 ≤ g₀ ≤ 4`.
      > The distinctness of the eigenvalues of `T₂` on `ℂ[X₂₄]` (Nebe–Venkov, CL14 III §3.3, p. 65) is a
      > consequence and is not used.

      `*Needs:* §§3.1, 3.3, 3.5, 3.7–3.8, 5.3, 6.3–6.5, 6.9 (which does not use §6.8);
      MetaplecticAutomorphicForms §3.21; AutomorphicFormsOnReductiveGroups §§6.8 and 7.2a with the
      extensions requested there, and §7.4; ModularityAndLanglandsExtensions §§3.8, 3.21 and 3.22 with its
      standing premises.`

   3. In §8.1 replace "For `g ≤ k` this is §6.8; for `g > k`, `S_k(Γ_g) = 0` by §7.9, so `Φ_g` is injective,
      and" by:

      > For every `g ≥ 1`, `θ_g` maps `ker θ_{g−1}` onto `S_k(Γ_g)`: the eigenvectors of degree `g` have
      > linearly independent images in `S_k(Γ_g)` (§§6.5, 6.8), and their number is `dim S_k(Γ_g)` by the
      > degree distribution of §6.8 and §7.9 (for `k = 12`: `1, 1, 1, 2, 2, 3, 3, 4, 2, 2, 1, 1` in genus
      > `1, …, 12` on both sides, and `0` above; for `k = 8`: one in genus `4`; for `k = 4`: none). Then

      and keep the induction. Change the layer introduction (line 2920) and §8.2's `*Needs:*` accordingly;
      CL14 Théorème D becomes an independent confirmation, as §7.9's Check already says.

   4. In the Layer 6 `### Dependencies` paragraph (lines 2675–2679) add "AutomorphicFormsOnReductiveGroups
      §6.8" and "ModularityAndLanglandsExtensions §§3.8, 3.21, 3.22"; §3.8 is already in §6.8's `*Needs:*`
      line and missing there.

   Tested on the refuting instance: the step "degree at most 12" now has the owner §6.5; the step
   "24 distinct parameters" is derived (`24` eigenlines inject into `24` formal sums); the degree-11
   eigenvector has `ψ_F` with weights `0, ±1, …, ±11`, whose trivial blocks are `[1]` only, so the rule
   gives `g₀ = 11` and not a smaller value; and `1 + (1+1+1+2+2+3+3+4+2+2+1+1) = 24 = |X₂₄|`.

2. **F02** (P2) the Conventions' list of statements that carry the standing premises omits Layer 6

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:171-174`, "this applies to the
   type criterion … of §1.8 …, to §§3.2–3.16, 4.11 and after, all of Layer 5 from §5.3 on …, and Layers 7–8
   except §§8.3–8.6".

   Claim: every statement outside this list is unconditional.

   Witness: §6.8 (`*Needs:*` ModularityAndLanglandsExtensions §3.8, line 2570) and §§6.9, 6.10, 6.12 assert
   Arthur parameters `ψ_F` of Siegel forms; CL14 stars the corresponding statements as conditional (CL14
   line 12443, 12518, 12574, pp. 326–329).

   Repair: in the Conventions replace "and Layers 7–8 except §§8.3–8.6" by

   > §§6.8–6.10 and 6.12 of Layer 6 (the parameters of lattice eigenvectors and of their theta lifts), and
   > Layers 7–8 except §§8.3–8.6

   and add to the Layer 6 introduction: "§§6.8–6.10 and 6.12 carry the standing premises of the Conventions;
   §§6.1–6.7 and 6.11 do not." Tested: §6.11 uses only §§2.6, 2.12 and the list of §5.3, whose exhaustion
   half is the explicit-formula exclusion; §6.8 uses §3.5.

3. **F03** (P3) the module docstring says the Leech lattice in Golay coordinates is absent from the pins; it is there

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/Suggested.lean:51-53`, "the Leech lattice
   in Conway's Golay coordinates, the Mathieu group action that normalizes `ω_g`, and the sublattices `Q_g`
   are absent."

   Claim: no Leech lattice in Golay coordinates exists at the pinned Tau Ceti.

   Witness: `TauCeti.leechLattice : IntegralLattice (Fin 24 → ℚ)`
   (`TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean:236`), with
   `mem_leechLattice_carrier_iff_exists` (`…/Leech/Minimum.lean:98`: `x = a/2`, `a = 2b + m𝟙`, `b` a Golay
   word mod 2, `Σ a_i ≡ 4m mod 8`) and `vectorsOfNorm_two_leechLattice` (`…/Minimum.lean:189`).

   Repair, three edits.

   1. `Suggested.lean` lines 51–53:

      > * the exact value `±n_g e_g` of the `Q_g`-Fourier coefficient of the Leech theta series (§8.6):
      >   the pinned `TauCeti.leechLattice` has the Golay coordinates, but the subgroup `2¹²M₂₄` of its
      >   isometries, the forms `ω_g` it normalizes, the fixed sublattices `Q_g` of elements of `M₂₄` of
      >   order 3 and 5, and the order of `O(Leech)` are absent.

   2. `README.md`, "From Tau Ceti", new bullet (and the name in the list at lines 113–116):

      > `TauCeti.leechLattice` (`TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean`) with
      > `isEven_leechLattice`, `isUnimodular_leechLattice`, `isPosDef_leechLattice`, its congruence model
      > `mem_leechLattice_carrier_iff_exists` and `vectorsOfNorm_two_leechLattice`
      > (`…/Leech/Minimum.lean`): the Leech lattice of Rank24LatticeConstructions Layer 6 on `Fin 24 → ℚ`
      > with the halved dot product. It satisfies the hypotheses of the two rootless theorems of §§8.5–8.6,
      > which are therefore not vacuous. It does not include the isometry group or its order.

   3. `Suggested.lean` line 62: the section comment "Layer 4: geometric torsion classes and masses" does not
      match the README heading; write `/-! ## Layer 4: geometric torsion classes and exact mass recovery -/`.

4. **F04** (P3) §8.6 locates the embedding counts in a lemma that does not contain them

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:3085-3086`, "`n_g =
   |O(Leech)|/κ_{24−g}` … where `κ_h = 1` for `h < 12`, `κ₁₂ = 3` and `κ₁₆ = 10` (CT19a Lemma 2.4)".

   Claim: CT19a Lemma 2.4 gives `n_g` and the `κ_h`.

   Witness: CT19a line 496–499 (Lemma 2.4, p. 12) gives only the values `±5`, `±5`, `±18` of `ω_g` on a basis,
   that is `e_g`. The relation `n_g |K_{24−g}| = |O(Leech)|` is CT19a line 989–990 (Proposition 3.13, p. 24),
   with `|K_g|` at line 987–988 (from Propositions 3.6 and 3.11).

   Repair: replace "(CT19a Lemma 2.4)" by "(CT19a Lemma 2.4, p. 12, for `e_g`; Proposition 3.13, p. 24, with
   Propositions 3.6 and 3.11, for `n_g` and `κ_h`, the order of the kernel of `O(Q_h) → O(res Q_h)`)", and
   add "Propositions 3.6, 3.11" to the CT19a locator in `sources.toml`. Tested: `n₈ = |O(Leech)|/κ₁₆ =
   |O(Leech)|/10` and `n₁₂ = |O(Leech)|/3`, as the first Check of §8.6 says.

Round 2. Both files were read in full (`packages/LevelOneAutomorphicFormsForClassicalGroups/README.md`,
3303 lines; `packages/LevelOneAutomorphicFormsForClassicalGroups/Suggested.lean`, 162 lines). No Lean
was run and no file of the package was edited. The fifteen round-1 findings are all repaired at this
head (table below) and no repair introduced an error. Four new findings: S01 (P1), S02 (P2), S03 (P3),
S04 (P3).

Dependency check (command of the brief, README unchanged):

    depcheck: 239 roadmaps, 2175 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` lists 11 files, all under
`packages/LevelOneAutomorphicFormsForClassicalGroups/`.

## Round-1 findings at this head

| Id | Status | Repaired passage (README line) | Witness recomputed |
|---|---|---|---|
| 1a/F01 | repaired | §8.4 Checks, 3013–3022: "Sign changes act diagonally on wedge monomials, not on orbit sums" | `β_T ↦ (−1)^{|S∩T|}β_T`; `T = {p}`, octad `S ∋ p`: 8 coefficients `−1`, 16 `+1` |
| 1a/F02 | repaired | Conventions 137–140 "groups of positive rank"; §3.16 Check 1660–1664; §4.3 1759–1760; §4.11 1966–1967 | `SO₁`: `m_G = 0`, `EP = 1`, no `κ`; `SO₃`: `EP(0) = −1·0 + 1` |
| 1a/F03 | repaired | §6.11 2617–2628: order `(1 − ε(π))/2`, `ε = −1` exactly for `Δ₁₇`, `Δ₂₁` | eleven root numbers recomputed: `i¹², i¹⁶, i¹⁸, i²⁰, i²²`; `i²⁰i⁸`, `i²²i⁶`, `i²²i¹⁰`, `i²²i¹⁴`; `i²³·i`; quadratic form in `(a, b)` rederived from §2.6 |
| 1a/F04 | repaired | §4.11 Check 1975–1978 | `[[1,0,0],[0,1,0]]`: rank 2, kernel `(0,0,1)` |
| 1a/F05 | repaired | §4.9 1906–1928 (relations and six counts); §8.7 3114–3125 (rules) | enumeration script: `(|P|, |P^−|)` = `(5,1)`, `(19,5)`, `(2257,59)`, `(4877,165)`; `|P₁|`: `3`, `1339`, `(1885+99)/2 = 992`, `2948`; five order sums all `0` |
| 1a/F06 | repaired | Conventions 128–134: "`det^{k_g}` times the polynomial representation of highest weight `(k₁ − k_g, …, 0)`" | `g = 1`, `k = −1`: `det⁻¹`; `(1, −1)`: `det⁻¹ ⊗ Sym²` |
| 1a/F07 | repaired | §6.2 2399–2400 pointer; §6.4 2471–2474 target; §8.14 3244 cites §6.4 | `k = 4, g = 9`: `M₄(Γ₉) = ℂθ₉[E₈]`; `k = 2, g = 5`: `0` |
| 1a/F08 | repaired | contract 284–290; §2.6 928–930 and Check 951–953 | supplier text read at its head: poles at `iσ`, `1 + iσ`; central character `|·|^{inσ}` forces `σ = 0` |
| 1a/F09 | repaired | §3.5 1395–1407 "which is imported and not proved again"; contract 351–356 | ModularityAndLanglandsExtensions §3.21 at its head states the criterion with `d_{i₀} = 1`; `Δ₁₁[2] ⊕ [3]`: weights `±6, ±5, ±1, 0` = `k = (7,7,4)` |
| 1a/F10 | repaired | §4.1 Checks 1727–1736 | square classes of `ℚ^×` infinite; `u^r = [[1,r],[0,1]]` |
| 1a/F11 | repaired | §4.10 1932–1942, Check 1957–1960 | `2(X−1)²`: `e = (1,2,1)`, coefficients `(2,4,2)` |
| 1b/F01 | repaired | §4.18 2088–2091 "which print no values" | CT20 line 516, 525 |
| 1b/F02 | repaired | §6.3 Check 2443–2444 "CL14 III §3.1, pp. 63–64", "III §3.2, p. 64" | `12870·405 = 18225·286 = 5212350`; `405/286 = 3⁴·5/(2·11·13)` from `2·696729600²/(2¹⁵·16!)` |
| 1b/F03 | repaired | *Needs:* at 510–512, 1144, 1381, 2376–2377, 2476–2477, 2605–2606 | each named section found by heading at the supplier's head |
| 1b/F04 | repaired | §2.6 909–917, Check 947–950 | `2(2π)^{−11/2} = 8.14781·10⁻⁵`; supplier (iv) read on main: `A^s ∏ Γ(a_i s + b_i)`, `Re b_i ≥ 0` |

## Verified sound

Counts: 8 declarations read (all of `Suggested.lean`); 143 README sections read; 81 locators found at
their place in the cached texts (CT20 42, CL14 15, CT19a 16, Tai17 5, Mil02 1, vdG08 2), of which 38 read
for content; about 130 Checks recomputed (table below); 83 cited supplier sections resolved by heading at
the supplier's current text (on main or at its open head), 15 of them read for content; 36 pinned
declarations grepped at the pins, all present under the names and files the README gives.

### Suggested.lean declarations

No section `variable` exists in the file; every binder is in the declaration's own signature. The eight
elaborated types of the worker's signature record were compared with the README statements (§§4.7, 8.5,
8.6): no binder lost, same generality. I ran no `#check` myself (no Lean in this pass).

| Declaration (section; context) | Instances computed | Result |
|---|---|---|
| `IsRegularIntegralForm` (Layer 4; `{n} (c : Matrix (Fin n) (Fin n) ℤ)`) | `n = 0`: empty determinant `1`, even: regular. `[1]`: `det = 2`, odd: regular. `[[0,1],[0,0]]`: `−1`: regular. `x₁x₃ + x₂²`: `−2`: regular. `x₁² + x₂²`: `4`: not regular. Wrong model "perfect polar pairing": excluded by the odd branch | determines CT20's notion on free modules |
| `specialOrthogonalPoints` (Layer 4; `(R) [CommRing R]`) | `R = ℤ_[p]`, hyperbolic plane: `diag(t, t⁻¹)`, `t` a unit; the swap has `det = −1`: excluded. `n = 0`: the empty matrix. `n = 1`: `{1}` (`det = 1`) | real body on `Matrix.toQuadraticForm'` (found at the pin) |
| `spinor_charpoly_obstruction` (Layer 4; no instance context beyond `Fact p.Prime`) | `n = 0`: `P = 1`, `a = b = 0`, `Q = 1`: `1 = 1²`. `n = 1`: `P = X − 1`: `(a, b, Q) = (1, 0, 1)`; the other factorization `Q = X − 1` fails `Q(1) ≠ 0`. Plane, `t ≠ ±1`: `Q(−1) = (1+t)²/t`, `Q(1) = −(1−t)²/t`, even valuations; `t = ±1`: `Q = 1`. `E₈`: `Φ₃⁴` gives `(1, 81)`, `Φ₅²` gives `(1, 25)`, `Φ₉Φ₃` gives `(1, 9)`. `a = 0` forces `n` even, so `−γ` has determinant one and charpoly `(X−1)^{2b}Q(−X)`. `Q ∈ ℚ[X]` is integral since `P ∈ ℤ_p[X]` for all `p` | true as typed; equals CT20 line 1245–1260 |
| `invariantAlternatingForms` (Layer 8; `[AddCommGroup V] [Module ℚ V]`) | `g = 0`: all of `ℚ`. `Isometry L L` at the pin extends `L.form.IsometryEquiv` with `map_carrier` (`…/Isometry/Basic.lean:77`), so it is the full `O(L)`, `−1` included: odd `g` gives `0`. Wrong model "proper isometries only": would leave `ω₁` on `ℤx`; excluded since the reflection is an `Isometry` | submodule proofs are real |
| `thetaCoefficient` (Layer 8) | `g = 0`: one tuple, value `ω()` if `T` is the empty matrix. Indefinite `L`: infinite fibre, `finsum = 0` (docstring says positive definite). `g = 24`, `T` = Gram of a basis `u`: fibre `O(L)·u`, value `|O(L)|ω(u)` | matches §8.6 |
| `finrank_invariantAlternatingForms_of_rootless` | `g = 0`: `1`. `g = 25`: `⋀²⁵ = 0`: `0`. `g = 24`: `det = 1` on `O(Leech)`. Odd `g`: `0` by `−1`. Hypotheses are satisfied by the pinned `TauCeti.leechLattice` (`Fin 24 → ℚ`, `vectorsOfNorm_two_leechLattice`), so not vacuous | true given the gap `conway-group-average-charpoly` |
| `invariantAlternatingForms_eq_bot_of_roots_span` | `V = 0`: span `= ⊤`, and every alternating `g`-form with `g ≥ 1` is `0`. `ℤx`, `x·x = 2`, `g = 1`: `ω(x) = ω(−x)`. Degenerate or indefinite form: `s_x(y) = y − (x·y)x` still preserves the form (`−2(x·y)(x·z) + 2(x·y)(x·z) = 0`) and the carrier. `g = 0` excluded by `0 < g` (constants are invariant) | true as typed, at CT19a line 1052 generality (no positivity needed) |
| `exists_thetaCoefficient_ne_zero_of_rootless` | `g = 24`: `T` = Gram of a basis gives `±|O(L)|ω(u) ≠ 0`. `g ∉ {8,12,16,24}`: excluded by `hg`; for `g = 0` the claim would hold trivially, so its exclusion loses nothing. `ω = 0` excluded by `hω0` | true; CT19a line 105–109 |

Padding probe: none of the four theorems follows from one tactic or one pinned lemma (the pins have the
reflection as an isometry but no statement about alternating forms; `library-matches.md` has no
same-statement hit). Headlines statable but absent: none found. The `g = 24` value `±|O(Leech)|` alone is
statable, but it is the elementary case of CT19a Theorem 2 and stating it alone would be a weakened
substitute for the headline.

### README statements (adversarial pass)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, `det I_w = e^{w+1}` | `w = 0, 1, 2` | `e·1`, `e²  = 1`, `e³ = e`; `χ(−1) = (−1)^w` times `ε_{ℂ/ℝ}` | holds |
| 1.2 ring `K∞` | `I₁²`, `I₂₃²`, `K∞^{≤23}` | `I₂ + 1 + e` (dim 4); contains `I₄₆`; `I₂ ∉` | holds |
| 1.4 `Γ`, `ε` | `I₀`, `I₁₁` | `Γ_ℝ(s)Γ_ℝ(s+1) = 2(2π)^{−s}Γ(s)`; `ε(I₀) = i = i^{0+1}`; `i¹² = 1` | holds |
| 1.6 regular vectors | `(1,0,0,−1)`, `(1,1,−1,−1)`, `3·1` vs `1 + 2e` | regular; not; both `det = 1` with weights `0,0,0` | holds |
| 1.8 type and root numbers | `Δ₁₁ × Δ₁₅`, `Δ₁₇ × 1`, `I₁ + 2I₂₃`, `2I₁` | `i²⁷·i⁵ = 1`; `i¹⁸ = −1`; `det = e²e⁴⁸ = 1`; both forms on `I₁ ⊗ ℂ²` | holds |
| 1.9 weight dictionary | `Sp₂`, `SO₃`, `SO₄`; rank-14 integral vectors | `(k+1, 0, −k−1)`; `(k + 1/2, …)`; `(1,1)`, `(1,−1)` same image; seven `I_{even}` give `det = e⁷ ≠ 1`, so no image is missed | holds |
| 2.2 Odlyzko kernel | `g″` on `[0,1]`; `Ĝ_ℓ(i/4π)` | `π sin πx − π²(1−x) cos πx`: `0` at `1`, `−π²` at `0`; `û = 2cos(πξ)/(π(1−4ξ²))`, so `ℓ·8cos²/(π²(1−4ℓ²ξ²)²)` gives `4π²ℓ(1+cosh(ℓ/2))/(ℓ²/4+π²)²` | holds |
| 2.3 `J_F(1 − e)` | recurrence; test function `(1−x²)³` | `D(s) + D(s+1) = −1/s`, `D₀(s) + D₀(s+1) = 1/s`; numerical integral `0.2254836448` | holds, sign as stated |
| 2.6 explicit formula | `(1,1)`, `(1,Δ₁₁)`, `(1, |·|^{2i})` | `κ = 1`; `κ = 8.14781·10⁻⁵`, `A = (2π)⁻¹`; excluded by central character; `Re b_i ≥ 0` for `Γ(s/2)`, `Γ(s/2 + 1/2)`, `Γ(s + w/2)` | holds |
| 2.7–2.8 cone inequality | `x = m⁻¹Σπ_i`; signed `x` | `A_F/m − J_F(U²) − …`; cross term `−2` | holds |
| 2.9 `ε(U²)` | `U = a + be + Σc_vI_v`; `U = 1 + e` | exponent `ab + (a+b+1)Σc_v(v+1)`, `≡ b(b+1) ≡ 0` when `det U = 1`; `−1` for `1 + e` | holds |
| 2.11–2.12 | `[[1,2],[2,1]]`, `diag(0,1)`; `a = 0 < c`, `b < 0` | `μ = 1` on a singleton; `μ = 0` on `{1}`; `2bxy + cy² < 0` for small `y`, and `b² > 0 = ac` | holds |
| 2.13–2.15 | one block of size two, `A_F = 1`, kernel `1` | expanded `[[0,−1],[−1,0]]`: `−1`; compressed `−1/2`; `Σ m_i A (t_i/m_i)² = Σ A t_i²/m_i` | holds |
| 2.17 negative control | `F = −F₁`, `p = 2`, `k = 1` | `F₁(log 2)(log 2)/√2 = 0.0399754`; `log 3 > 1`, `2 log 2 > 1` | holds |
| 2.19 Miller | `n = 0, 12` in both families | ranks `2, 26` and `1, 25`; `det = e^n e^n = 1`; CT20 line 716–717, Mil02 line 137–139 | holds |
| 2.20–2.21 | `w = 23, 53` | `dim S₂₄ = 2`; `dim S₅₄ = dim M₄₂ = 4`; 27 odd `w` | holds |
| 3.1–3.2 | `Δ₁₇[8]⊕[9]⊕[7]⊕[1]`, `Δ₁₁[12]⊕[25]`; three odd blocks | `33 = 2·16+1`; `49`; `|C_ψ| = 4`; supplier §3.8 has the same sign group | holds |
| 3.3 | `Δ_w[2]⊕[1]`, `k = (w+3)/2` | `−1 = (−1)^{k−1}` iff `k` even | holds |
| 3.4 | `g=1,k=0`; `(1,1)`; `(1,0,0)` | `0 ≥ 0`; `1 ≥ 0`; `0 ≥ 1/2` false | holds |
| 3.5 | `Δ₁₁[2]⊕[3]`, `Sym²Δ₁₁[1]⊕[3]⊕[1]` | `±6,±5,±1,0`; weight `0` thrice | holds |
| 3.7–3.8, 3.13 | `Δ₁₁[12]⊕[1]`, `g = k = 12` | weights `11..0`, `0..−11`, `0`: zero thrice, as `0, ±(12−i)`; `χ = (−1)⁶ = 1 = i¹²` | holds |
| 3.15–3.16 | `SO₈`, `λ = (9,7,4,2)`; `SO₃` | `(12,9,5,2) − (3,2,1,0)`; `q = 8`; `κ = −1` | holds |
| Layer 3 Examples | `Sp₄`, `k = 20` | `dim M₂₀(Γ₂) = 5`, minus `dim M₂₀ = 2`: `3 = 1 + 2 + 0`, `dim S₃₈ = 2` | holds |
| 4.4, 4.8, 4.9, 4.16 | degrees 2, 3, 4, 5, 14–17 (script) | `|P|`: 5, 5, 19, 19, 2257, 2257, 4877, 4877; fixed: 1, 5, 59, 165; orbits 3, 12, 1158, 2521; `|P₁|`: 3, 12, 1339, 2948, `SO₁₆`: `(1885+99)/2 = 992`; hard `Sp₁₆`: `(1449+83)/2 = 766` | all as stated; CT20's `1157` is a misprint |
| 4.6 Zassenhaus form | rotation of order 4, of order 3, `−1` on a plane | `det((1+γ)/2) = 1/2 ~ 2 = Φ₄(−1)`; `Φ₃(−1) = 1`; `disc(q)` | holds |
| 4.7 Checks | `Φ₆(−1)`, `Φ₃(−1)`, `Φ₄(−1)`, `Φ₅(±1)` | `3`, `1`, `2`, `(5, 1)` | holds |
| 4.10 | `Sp₂`, `SO₃`, `λ = (2)`, `(1)` | `e₁² − e₂`; `(2e₁² − 2(e₂+1))/2`, `= 5` at the identity; `e₁` | holds (Jacobi–Trudi with `e`, as in the standard texts) |
| 4.12 `SO₃` | five rows, `k = 5` | traces recomputed from `sin((2k+1)π/i)/sin(π/i)`; `det = 288`; `A m = b` checked row by row; `11/12 + 1/4 + 1/3 − 1/2 = 1` | holds |
| 4.13–4.18 | row and column counts | CT20 line 1334, 1349, 1359–1364, 1369–1371, 1379, 1412–1413 | as stated |
| 5.4–5.8 | `U_exc`, `A`, six residuals | `ℓ = 487/50 = 9.74` (CT20 line 1432); dims 14 and 16; ranks 10, 8, 10, 10, 10, 8 (duals `SO₁₁`, `SO₉`); `181 + 2 = 183` | holds |
| 5.9–5.10 | four survivors | `ε`: `i¹⁰⁰`, `i¹⁰⁴`, `i¹²⁴`, `i¹²⁸`, all `1`; `det = e⁶`, `e⁶`, `e⁸`, `e⁸`; 16 classes in 15 blocks | holds |
| 6.2 | `g ≥ 2k` versus `g > 2k` | CT20 line 2290 (Weissauer, `g ≥ 2k`), line 2321 (`g > 2k`) | as stated |
| 6.3 | `E₈`, rank 16 | `(2⁴−1)(2³+1) = 135`; rows sum to `255·129 = 32895`: `14670 + 18225`, `12870 + 20025`; eigenvalues `32895`, `1800` | holds |
| 6.8 | degree rule, distribution | `1+1+1+1+2+2+3+3+4+2+2+1+1 = 24`; `23 − 8 = 15` | arithmetic holds; route: S01 |
| 6.9–6.10 | `n = 8`, `g = 8` | `7 + 1 + 9 = 17` | holds |
| 6.11 | eleven classes | see the round-1 table | holds |
| 6.12, 8.7 | five cases | `L`-arguments `0, 4, 0, −4, −12`; orders `(0,0,0,−1,1)`, `(0,0,0,0,0)`, `(0,0,0,−1,1)`, `(0,−4,−4,−1,9)`, `(0,−12,−12,−1,25)`; `Γ_ℂ` of `Δ₁₇[8]` at `8, …, 1`, of `Δ₁₁[12]` at `−1, …, −12`; `Δ₁₉,₇[6]` passes through `1/2` | holds |
| 7.4, 7.9 | counts | scalar: `1 + 4 + 23 + 4 = 32`; regular scalar `22 + 2 + 4 + 1 = 29`; `29 + 29 = 58` | consistent |
| 7.6–7.7 | `(14,13)`, `(16,13)`, `(24,13)` | `9+16+3+1 = 29`; `ε(I₁₁(I₂₂+e)) = i³⁴ = −1`; remainder `16+7+1 = 24` without `±4`; `24 + 25 = 49` | holds |
| 7.8, 7.10 | `(11,11,7,7)`, `(13,10,7)`, `g = 8, 12, 16, 24` | `10,9,4,3`; `12,8,4`; `12..5`; `12..1`; `±4` once, `±3,±2,±1` twice, `0` thrice; `(19±7)/2 = 13, 6`, so `k = (14, 8)` | holds |
| 8.1–8.2, 8.11–8.14 | `k = 0, 2, 4, 8, 12` | `(−1)^{k/2}`; `2(g′−k)+1 ≥ 2k+1 > k`; `dim M₈(Γ₁₆) = 2`; CT20 line 2216–2222, 2292–2339 | holds (8.1's first step: S01) |
| 8.3–8.4 | `S₃`, `A₃`, `ℤ`; orientable subsets | dimensions from `C + P`: `g = 1, 7, 9, 11, 13, 15, 17, 23` one each, `8, 12, 16` two each, matching the polynomial of CT19a line 213 | holds |
| 8.5–8.6 | `{1}`, `{±1}`; `n_g` | `(t−1)²⁴`: `−24`; `e = (5,18,5,1)` at CT19a line 496–499; `n₈ = |O|/10`, `n₁₂ = |O|/3`, `n₁₆ = n₂₄ = |O|` | holds (locator: S04) |

Supplier contracts read for content at the suppliers' current text: ModularityAndLanglandsExtensions
§§3.4, 3.8, 3.17, 3.21 and "The twisted weighted fundamental lemma"; AutomorphicLFunctionsAndLocalFactors
§§AL.3.6.1, AL.3.9.4; AnalyticNumberTheoryPartI §1.8 (on main); AutomorphicBundles §§11.16, 12.13;
AutomorphicSpectralTheory §6.17; MetaplecticAutomorphicForms §6.14;
GeometryOfNumbersAndQuadraticArithmetic §2.4.2; SymplecticReidemeisterTorsionModSquares §4.1;
CFSGBasicProperties P2-L (on main); IntegralLattices §4G (on main). Each says what the README says of it.
The eight gap slugs of `design/plan.json` are the eight of the README, with the same suppliers and
sections; none has supplier `none`.

Ownership against open pull requests: SiegelModularForms (the closest open roadmap) cites this roadmap's
§§6.1, 6.2, 6.4 and 6.7 as a consumer and owns none of them; S01's repair moves no id it cites. The other
open pull request that changes this roadmap is its own submission to the content repository. No
`Suggested.lean` name of this roadmap is declared by a roadmap I searched (`roadmaps grep` on the eight
names: no hit outside this roadmap).

## Not verifiable

- KT87 (§4.10): settled as uncertified; the determinantal formulas were checked against the standard
  Jacobi–Trudi identities for `Sp` and `O` and on `λ = (1), (2)` only.
- The 187 residual parameters, the set `V`, the sets `Λ` and the masses themselves (§§4.13–4.18, 5.4, 5.9):
  they live in the authors' online dataset, which is not in the manifest; only the counts printed in CT20
  were compared.
- Weissauer's Satz 3, Böcherer 1989, Erokhin 1979, Igusa and Kneser 1967: not in the cache; cited through
  CT20, BoechererNote and CL14.
- BoechererNote was not reopened in this round: the orders of §§6.12 and 8.7 were recomputed from the
  README's own definitions, and its page locators rest on round 1.
- `gap:split-orthogonal-regular-form`: whether the pinned Tau Ceti already identifies some Chevalley
  groups of type `B_n` or `D_n` with special orthogonal groups over `ℤ` was not settled (the pinned
  `TauCeti.SpecialOrthogonal` smoothness instance assumes `2` invertible, which does not cover `ℤ₂`).
- Elaboration: no Lean was run in this pass; the signature comparison uses the worker's record.

## Source issues

- **Misprint** in CT20 at §3.3, p. 33 (CT20 line 1349): the source says the number of classes of `P₁(Sp₁₄)` under negation is 1157; it should be 1158, half of 2257 plus 59; affects nothing.
- **Misprint** in CT20 at §4.1, proof of Proposition 4.1, p. 36 (CT20 line 1478 and 1484): the source evaluates the bound at `i/π` and speaks of 187 elements of the two-class list; it should be `i/(4π)` and the one-class list; affects nothing.
- **Error** in CT20 at §4.1, p. 36 (CT20 line 1493–1495): the source says no self-dual class has any of the six multiplicity-free residual parameters; it should except the first, the parameter of the known rank-10 class; affects nothing.
- **Misprint** in CT19a at the proof of Theorem 2, p. 13 (CT19a line 558–565): the source uses `n_g` for the number of sublattices and gets `n_g |O(Q_g)| ω_g(u)`; it should be the number of embeddings times `ω_g(u)`, as stated; affects nothing.

Source independence: 25 passages compared with 6 sources (CT20 9, CT19a 7, CL14 6, Mil02 1, vdG08 1, Tai17 1; BoechererNote not reopened in this round), none shared beyond standard technical phrases of at most eight words; largest share CT20, 121 of 187 locators; contents compared with CT20: independent (Layer 3 ↔ §§5.1–5.2 precedes Layer 4 ↔ §3 because §3.16 feeds §4.11; Layers 5–6 and 8 draw on CL14 and CT19a; no run of layers maps one to one onto a run of its sections).

## For the human reviewers

- **Licence.** `BoechererNote` is an unpublished companion note on an author's page; `sources.toml` records `licence_class = "answered-by:CBirkbeck"`. It is the only source for §§6.12 and 8.7.
- **Licence.** The mass values, the 181 parameters of `V` and the witness triples exist only in the authors' online dataset (CT20 line 516, 1430, 1485), which has no manifest entry; the README states their existence, not their values.
- **Scope.** S01's repair adds two classical theorems (Erokhin 1979; Igusa and Kneser 1967) as targets; their primary sources are not in the manifest and are cited through CL14.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c038ca8155d5847b20e97f42a9e001abd542d86d", "job": "RT-LevelOneAutomorphicFormsForClassicalGroups~2b", "model": "fable", "worker": "chris-x27"} -->
