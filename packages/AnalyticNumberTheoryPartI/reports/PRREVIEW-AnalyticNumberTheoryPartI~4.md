# Review of AnalyticNumberTheoryPartI (pull request #1126 at 294c990)

**Verdict:** needs changes

Full review (438 changed lines since 89a4c37, the head r3 read). Nothing changed outside the folder (`git diff --stat origin/main...HEAD` excluding `TauCetiRoadmap/AnalyticNumberTheoryPartI` is empty). The worker's gate at this head fails: `latex=6 tex=14 sorry-examples=2 build=2`, every other scanner 0. Dependency check (my run of the brief's command): `depcheck: 240 roadmaps, 2372 edges, 0 problem(s)`, no UPWARD or CYCLE line. My elaboration of `TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` with `lake env lean` from the worktree: 39 `declaration uses sorry` warnings (37 theorems and the 2 examples), nothing else, exit 0.

The head's main change is a new headline, §0.34, the uniform exclusion of Landau–Siegel zeros, `(1−β) log q ≥ c_LS`, with Siegel's bound, Landau–Page, the character prime-number estimate and Siegel–Walfisz restated without exceptional terms and with effective constants. I verified the three new sources exist and say what the README cites them for (table under Verified sound): the OpenAI mathematics release preprint of 1 October 2026 (Theorem 1 is the README's §0.34 statement verbatim in content; its §2 Lemma 2 is §0.34b), Ben Green's Hexagon note 2610.00311v2 (Theorem 1.1 and §§2–6 are the determinant method of §0.34c), and Tao's blog sketch of 19 October 2026. I recomputed the README's own variant of the determinant argument and the deductions of §§0.9, 0.34, 0.6, 0.18 and 0.32 from it (adversarial table). The mathematics of the new sections is sound; the findings are a failing gate, two supplier/ownership defects against open pull requests, and padding and shape defects in the new Lean section.

## R01 (P1) — Gate build fails on lake's `module` advisory

Location: `TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` line 1 (`import Mathlib`); gate `build=2`.

Claim: the targeted build is clean.

Witness: the worker's gate records twice "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file" and marks `build=2 FAIL`. Elaboration itself is clean (39 sorry warnings only), so this is the advisory alone; the gate's build counter nevertheless blocks acceptance.

Repair: put the single line `module` before `import Mathlib` (the form TypeAHeckeAlgebras uses on main), rebuild, and confirm the gate shows `build=0`.

## R02 (P2) — Supplier citation "LocalFieldsRamification Layers 3–4" is dropped by the open revision of that roadmap

Location: `README.md` line 124 ("The lower filtration/different are LocalFieldsRamification Layers 3–4's, retaining wild terms").

Claim: the lower numbering filtration and the local different are supplied by Layers 3–4 of LocalFieldsRamification.

Witness: `scratch/overlaps.md` lists this id as dropped by pull request #617. On main, `Completed/LocalFieldsRamification/README.md` has "### Layer 3: ramification, the tame and wild cases, and the filtration" (line 724) and "### Layer 4: the tame quotient of the absolute Galois group" (line 1154); at the head of #617 the roadmap is restructured into Layers 0–2 (unit filtration of `ℚ_p`, lower breaks, Hasse–Arf) and the lower numbering and the different are listed as Tau Ceti natives in its supplier contracts (its lines 93, 205 and 252: `TauCeti.IsLocalRing.lowerIndex`, `TauCeti.LocalFieldsRamification.lowerRamificationGroup`, `TauCeti.differentExponent`). When #617 merges the citation points at nothing.

Repair: cite the objects as they are at the pin, which is what #617's head does: `TauCeti.LocalFieldsRamification.lowerRamificationGroup` (`TauCeti/NumberTheory/LocalField/RamificationGroup.lean` line 99) for the lower filtration and `differentExponent` with `differentExponent_eq_zero_iff` (`TauCeti/NumberTheory/LocalField/Different/Basic.lean` lines 92 and 162) for the local different, keeping LocalFieldsRamification as the roadmap name only for what its head still states (Hasse–Arf, Layer 2).

## R03 (P2) — §0.34a's classification of primitive real characters has a second owner in an open pull request

Location: `README.md` line 817 (§0.34a, `quadratic_character_kronecker`) and `Suggested.lean` line 136.

Claim: this roadmap owns the theorem that every primitive nonprincipal real Dirichlet character of conductor `q` is the Kronecker character of the fundamental discriminant `D = χ(−1) q`, with `χ(p) = (d/p)` at odd `p ∤ q` for the squarefree part `d`.

Witness: pull request #1904 (QuadraticCharactersAndReduction, kim-em, a new roadmap folder) states the same object as its §Q2 "Classification by fundamental discriminants": "For any primitive nonprincipal real complex character at level `q`, export a unique fundamental `D ≠ 1` with `D.natAbs = q` and equality to `fundamentalDiscriminantCharCast ℂ D hD`", with "`|d| ≤ q`" and "the odd-prime dictionary `χ(p) = (r/p)`", and it names this roadmap's §0.34a as its consumer: "The classification and its CRT proof have this owner". Two open roadmaps own one object. On the merge order the owner must be the earlier one: this roadmap is at `ORDER.txt` line 84; QuadraticCharactersAndReduction is not yet in the order and its supplier MultiquadraticPartII is at line 238, so it is placed after this roadmap and cannot supply it. (The Frobenius congruence `(x+y√d)^p ≡ x−y√d mod pℤ[√d]` of §0.34c, which #1904's §Q4 also exports, is proved inline here in one line from Euler's criterion and raises no second-owner question.)

Repair: keep §0.34a here and say so where ownership is read: add to `## Scope and ownership` one sentence that this part owns the classification of primitive real characters as Kronecker characters (§0.34a) and that QuadraticCharactersAndReduction §Q2 consumes it, and list QuadraticCharactersAndReduction under Downstream consumers. The matching repair on #1904 (citing §0.34a instead of restating it) is that pull request's.

## R04 (P3) — Gate `latex`: six display formulas with `\[ … \]` delimiters

Location: `README.md` lines 349, 376, 389, 414, 428, 435 (§§0.11a–0.11c).

Claim: house style, mathematics in Unicode or in code spans.

Witness: the gate lists the six `\[` lines; for example line 350 reads `\sum_{p\ge y}\frac{\log p}{p^2}\le C/y\qquad(y\ge2).`

Repair: write each display as an inline code span in the house style, e.g. `Σ_{p≥y} (log p)/p² ≤ C/y` for `y ≥ 2`; `|L′/L(σ,χ) + Σ_p χ(p) log p/p^σ| ≤ C`; `−ζ′/ζ(1+η) = η⁻¹ + O(1)` for `0 < η ≤ 1`; `Σ_p a_p log p/p^(1+η) = η ∫₁^∞ A(t) t^(−1−η) dt`; `η ∫₁^∞ t^(−1−η) dt = 1`, `η ∫₁^∞ (log t) t^(−1−η) dt = η⁻¹`; `η ∫₁^∞ log log(3t) t^(−1−η) dt ≤ log(log 3 + η⁻¹)`.

## R05 (P3) — Gate `tex`: fourteen TeX-only constructs

Location: `README.md` lines 350, 377–378, 390, 415–416, 429–430, 436–437.

Claim: as R04.

Witness: the gate lists `\sum_{`, `\frac`, `\left|`, `\int_1^\infty`, `\qquad` on those lines; they are the bodies of the six displays of R04.

Repair: the rewrite of R04 removes all fourteen hits; rerun the gate to confirm `latex=0 tex=0`.

## R06 (P3) — Gate `sorry-examples`: two admitted examples

Location: `Suggested.lean` lines 120 and 122.

Claim: "two endpoint checks on the weighted prime sum" (`README.md` line 450).

Witness: both examples end in `sorry`; an admitted example tests nothing. My probe closes the first (`weightedPrimeSum a 1 = 0`) by `simp` alone (`Nat.primesLE 1 = ∅`), so it is also padding; the second is `weightedPrimeSum (fun _ => 1) 2 = log 2 / 2`, a computed value (`Nat.primesLE 2 = {2}`).

Repair: delete both lines; keep the two facts as prose Checks of the weighted prime sum in §0.11c (see R08). Together with R07 the whole section goes.

## R07 (P3) — The `WeightedPrimeSmoothing` section is an API catalogue, not headline theorems, and none of its names is in the README

Location: `Suggested.lean` lines 43–124 (`weightedPrimeSum`, `prime_tail_bound`, `uniform_logDeriv_prime_sum`, `uniform_regularized_zeta`, `prime_mellin_identity`, `mellin_mass`, `mellin_log_moment`, `mellin_mono`, `mellin_loglog_bound`, `mellin_loglog_coarse`).

Claim: these are the roadmap's headline results of §§0.11a–0.11c (module docstring lines 9–10, README line 5).

Witness: the README itself calls them "interfaces" and "suggested forms" (lines 335–336, 450); none of the ten names occurs in `README.md` (grep count 0 for each), against the rule that every Lean name appears in the README. By the one-tactic probe, `mellin_mono` closes with one `exact mul_le_mul_of_nonneg_left (setIntegral_mono_on hf hg measurableSet_Ioi …) hη.le`, and `mellin_mass`, `mellin_log_moment` are the calculus values `η·(1/η) = 1` and `η·(1/η²) = 1/η` (`integral_Ioi_rpow_of_lt` plus `field_simp`), `mellin_loglog_coarse` is an inequality between bare scalars; `mellin_mono` and `mellin_loglog_coarse` are theorems about free functions and scalars only, which the brief says are not headlines. No headline theorem of the file uses `weightedPrimeSum`: `split_prime_sum_le_of_real_zero` and `inert_prime_sum_le` write their sums over `Nat.primesLE` directly.

Repair: delete lines 43–124 (the section and its two examples); the README keeps §§0.11a–0.11c as targets with their API lists and Checks (R08). Then drop "the uniform prime-series and Mellin-smoothing interfaces of §§0.11a–0.11c" from the docstring (lines 9–10) and from README line 5, and reword README line 450 as a Checks list rather than a reference to the Lean file.

## R08 (P3) — §§0.11a–0.11c: the weighted-prime-sum definition has no API bullets and no Checks, and the prose refers to the Lean file and to Mathlib's future

Location: `README.md` lines 335–452.

Claim: README shape (every definition with its API and at least three discriminating Checks; timeless prose).

Witness: §0.11c defines `A(x) = Σ_{p≤x} a_p log p/p` ("Define it by native finite primes `p ≤ ⌊x⌋₊`", line 408) with no `**Checks.**` list; line 338 says to "name and shape them as Mathlib's Mertens-weight interface develops"; line 450 points the reader to `Suggested.lean` for "two endpoint checks". §0.11a and §0.11b also have no Checks lists, unlike every other subsection of Layer 0.

Repair: give §0.11c an API list (finite sum over `Nat.primesLE ⌊x⌋₊`, `A(x) = 0` for `x < 2`, `A(2) = (log 2)/2` for `a ≡ 1`, linearity in `a`, the bound `|A(t)| ≤ C + log t` for `|a_p| ≤ 1`) and at least three Checks in prose (the two endpoint values of R06, plus `A` is unchanged when `a` is altered at non-primes, and a negative control: `a_p = −1` gives `−Σ log p/p`, so the Mellin identity's sign follows the coefficients); add Checks to §0.11a (`y = 2` includes the prime 2; the tail constant `C = 2 log 4` from `θ(t) ≤ (log 4) t`) and §0.11b (`η = 1`: `−ζ′/ζ(2) = Σ Λ(n)/n² ≈ 0.570` against `η⁻¹ = 1`, difference bounded; the principal character is allowed); rewrite line 338 without the process clause and line 450 without the reference to the Lean file.

## R09 (P3) — §0.11a (Layer 0) needs §3.17 (Layer 3)

Location: `README.md` line 364 ("*Needs:* §0.11, §3.17; …") and lines 356–357.

Claim: the distinct-prime-divisor bound `Σ_{p|q} log p/p ≤ log log q + C` is consumed from §3.17.

Witness: §3.17 "Logarithmic weight of prime divisors" is in Layer 3 (line 2193) and itself needs §0.11 (Layer 0). A Layer-0 target that needs a Layer-3 target is a backward edge in the build order (Layer 0 → Layer 3 → Layer 0 at layer level). Nothing in §0.34 uses this bound: §0.34 bounds the primes dividing `q` by `log q` directly (line 815).

Repair: delete the clause at lines 356–357 and `§3.17` from line 364 (or move §3.17 into Layer 0 next to §0.11, where its only need lives, and renumber with an old → new line).

## R10 (P3) — Downstream consumers lists two suppliers as consumers

Location: `README.md` lines 15 and 3187–3195 ("Downstream consumers of §0.34 and its corollaries … are ZerosOfLFunctions, ImaginaryQuadraticClassNumber, …"; "ZerosOfLFunctions and ImaginaryQuadraticClassNumber also stand before this part").

Claim: ZerosOfLFunctions and ImaginaryQuadraticClassNumber consume §0.34.

Witness: both are earlier in the merge order (`ORDER.txt` line 79 and on main as suppliers of this roadmap, lines 66–86 of the README) and line 3185 says consumers "supply no input to this roadmap". A roadmap earlier in the order cannot cite a later one; the open revision #1913 of ZerosOfLFunctions does exactly that ("The exclusion of Landau–Siegel zeros, consumed downstream", its lines 325–338, taking `landau_siegel_exclusion` and `ExceptionalRealZero.empty` for its 6.3, 6.4, 8.6–8.8 over `ℚ`), which is an upward supply for that pull request; this README endorses it by naming them consumers.

Repair: remove ZerosOfLFunctions and ImaginaryQuadraticClassNumber from the consumer list (lines 15, 3189–3190, 3195) and say instead, in Scope and ownership, that the exception-free forms over `ℚ` of ZerosOfLFunctions 6.3–6.4 and 8.6–8.8 and the effective forms of ImaginaryQuadraticClassNumber H2.4 are stated in this part (§§0.1, 0.6, 0.9, 0.18, 0.32), where later roadmaps consume them; ZerosOfLFunctions and ImaginaryQuadraticClassNumber keep their statements as on main.

## R11 (P3) — Locator slips in the new citations

Location: `README.md` lines 3252 ([109]), 773 (§0.31) and 829–830 (§0.34c "Source: [110], Theorem 1.1").

Claim: exact locators into identified sources.

Witness and repair, one item each:

- [109] reads "OpenAI, *Uniform exclusion of Landau–Siegel zeros*, preprint, 2026, open repository" with no identifier. Two versions exist: the OpenAI mathematics release of 1 October 2026 (`openai/math`, `preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf`, 9 pages) and a community-revised version of 26 October 2026. The numbering the README uses (Theorem 1, §2 Lemma 2, §6) is that of the 1 October version (openai2026lspdf lines 23, 98, 443). Name the release and the version.
- §0.31 cites "[58] Lemma 4.9 and proof pp.713–714": the statement of Lemma 4.9 is on printed p.712 (skorobogatovsofos line 2150, page header line 2130), its proof runs to p.714. Write "Lemma 4.9, pp.712–714".
- §0.34c cites Green's Theorem 1.1 for the bound `(3/4) log X + K_C` with `3 ∣ C`. Green's Theorem 1.1 (green2026 lines 25–34) is `(1/2 + O(1/C)) log X + O_C(1)` for even `C`, with the parameters `R = X`, `S = J = ⌊X/C⌋`, `N = 2X^{1/2}` (line 43); the README's parameters are `N = X^{2/3}`, `J = N`, and its constant `(1+1/C)(2/3+1/(2C))` is its own weakening. The route is correct (recomputed below), but the sentence should say that the parameters differ from the source's and that `3/4` is the weakened constant, so that an implementer does not look for `3/4` in the paper.

## Previous findings

- r3 R01 (P3, Montgomery attribution) — repaired: line 1027 now reads "Montgomery [108], *Zeros of L-functions*, Invent. Math. 8 (1969), 334–345, for the original, and Montgomery [100], Theorem 12.1, for the textbook form", and reference [108] is added at line 3251.

## Verified sound

**The new sources and what they say.**

| Citation | Cache | What the source says, in my words | Result |
| --- | --- | --- | --- |
| [109] Theorem 1 (§§0.34, 0.1, 0.9, 0.31b) | openai2026lspdf 23–25 (printed p.1) | there is an absolute `c > 0` with `(1−β) log q ≥ c` for every real zero `β ∈ (0,1)` of every primitive nonprincipal real Dirichlet `L`-function of conductor `q ≥ 3` | matches §0.34 and `landau_siegel_exclusion` exactly (q ≥ 3, primitive, nonprincipal, real, `β ∈ (0,1)`) |
| [109] §2 Lemma 2 (§0.34b) | openai2026lspdf 93–112 (p.2) | with `ℓ = log q`, `δ = (1−β)ℓ`: `Σ_{p≤X, χ(p)=1} log p/p ≪ ℓ + δ(log X)²/ℓ` for `X ≥ 3`; consequently the inert primes in `(H, X]` carry at least `log X − Cℓ − Cδ(log X)²/ℓ − CH` | `δ(log X)²/ℓ = (1−β)(log X)²`: matches `split_prime_sum_le_of_real_zero` |
| [109] §6 (§0.34 deduction) | openai2026lspdf 443–475 (p.8) | completion by contradiction along `q → ∞`, `δ → 0`, with finitely many small conductors handled by nonvanishing at 1 | the README replaces the limit by an explicit threshold and §0.12; see the table below |
| [109] §1 (§0.6) | openai2026lspdf 30–32 | Page's theorem: at most one primitive real character of conductor `≤ Q` has a real zero in `(1 − c₂/log Q, 1)` | supports the cited history; §0.6's exception-free form follows from Theorem 1 |
| [110] Theorem 1.1 (§0.34c) | green2026 25–34 (p.1) | for `χ` primitive nonprincipal real of large conductor `q`, `χ(p) = (d|p)`, `C` a large even integer, `X = q^C`: `Σ_{p≤X, χ(p)=−1} log p/p ≤ (1/2 + O(1/C)) log X + O_C(1)` | R11; the README's `3/4` with its own parameters is implied and recomputed below |
| [110] §2 (2.1), §§3–6 | green2026 39–53, 71–92, 137–153, 157–225, 226–260 | `R = X`, `S = J = ⌊X/C⌋`, `N = 2X^{1/2}`; Lemma 3.1 (independence under `nJ > 2RS + J(R+S)` and Schwartz–Zippel with `J ≥ N`); Hadamard bound (4.2); Lemma 5.1 `e_p ≥ 2 Σ min(⌊r/p⌋, S−1−s)`; completion | the README's facts 1–3 are these, at its own parameters |
| [111] Tao, blog post 19 Oct 2026 | read online | sketch of Green's argument (lattice `Λ`, grid `E`, Lemmas 1–3, archimedean and `p`-adic bounds), consequence `Σ_{p≤x,(D/p)=−1} log p/p ≤ (1/2) log x + O(log|D|) + O(log log x)`; a correction of 26 Oct adds a lower-order `−O(1)` | exposition only, as cited |
| ZerosOfLFunctions 6.4 (4d) (§§0.34b, 0.9) | main `TauCetiRoadmap/ZerosOfLFunctions/README.md` lines 1116–1127 | for nontrivial primitive `χ` and `1 < σ ≤ 2`: `−Re logDeriv L_χ(σ+it) ≤ ½ log analyticConductorAt d(it) + O(1) − Σ_ρ Re 1/(σ+it−ρ)`, summands positive by 5.6 | the label "6.4d" resolves; at `t = 0` the conductor term is `½ log q + O(1)` as §0.34b uses |
| ImaginaryQuadraticClassNumber H2.2–H2.4 | main lines 57–78 | H2.2 class-number formula; H2.3–H2.4 the ineffective two-character proof of `L(1,χ) ≥ c_ε q^{−ε}` | the README now consumes H2.2 only (line 69), as its Needs lines say |

**Seeded sample (15 targets).**

| Target | Source, locator | Cache line(s) | What the source says | Result |
| --- | --- | --- | --- | --- |
| 0.1 Exceptional real zero | [47] Prop. 7.1 and following, pp.373–374 | bennettsiksek 799–812 (printed = PDF + 354) | effective absolute `c*`; (24) `1 − c*/log N < β < 1`; such a zero is real and simple; "exceptional conductor" | supports; the emptiness clause is [109] Thm 1 |
| 0.10 Prime-number input | [50] §3.5 proof of Theorem 2, p.25 | bskk 1347–1348 (page 25 header at 1322) | `P` = primes in `(x, 3x]`, `4 + x/log x ≤ #P ≤ 3x/log x` for large `x`, by the PNT | supports exactly |
| 0.20 Weighted prime sum on an interval | [47] §9 p.384; Rosser–Schoenfeld Thm 6 p.70 | bennettsiksek 1317–1323 (page 30) | the prime sum over `(k^{7/16}, k]` bounded from "Theorem 5 of [44], Theorem 6 of [34]" | the application is as cited; RS Thm 6 itself not readable (Not verifiable), the subtraction route is the standard one |
| 0.23 Finite-order Hadamard | [54] App. B.1 (B.1)–(B.3) pp.901–902; Kupers Thm 14.1.1, Lemmas 14.1.4–14.1.5, pp.89–93 | yunzhang 5928–5973 (902 header at 5950); kupers 3584–3591, 3623, 3646 (printed = PDF − 6) | (B.1) product with polynomial `h` and genus `n`, (B.2) summability at `n+1`, (B.3) `g ≤ ρ ≤ g+1`; Kupers: order `k ≤ ρ ≤ k+1`, `f = e^P z^m ∏ E_k`, `deg P ≤ k` | supports; the README's strict `ρ < n+1` is the form Kupers's proof uses |
| 0.24 Repulsion of exceptional conductors | [47] Prop. 7.1 and (25), pp.373–374 | bennettsiksek 813–819 | from (23) and (24), two exceptional conductors satisfy `N₂ > N₁²` | supports; now vacuous by §0.34, as the README says |
| 0.30 Dirichlet-to-ray-class dictionary | [56] Milne CFT V §1 Example 1.4, Theorem 1.7, pp.149–151 | milne 6627 (p.149), 6660 (p.150) (printed = PDF − 9) | Example 1.4: moduli of `ℚ`; Theorem 1.7: the exact sequence of the ray class group of modulus `m` | locators right |
| 0.31 Mertens product input | [58] Lemma 4.9 pp.713–714, Lemma 4.11 pp.715–716 | skorobogatovsofos 2150 (p.712), 2322 (p.715) | Lemma 4.9: `Σ S_P(x)θ_P(x)` with a product over primes `ℓ ≤ log x`; Lemma 4.11: `S_P(x) > β₀ (log log x)^{n−d}` | content as cited; page slip R11 |
| 2.6 Sufficient conductor-discriminant estimate | [64] Thm 3.2 and proof of Cor. 3.3, pp.383–384 | tsimerman 186–236 (printed = PDF + 378) | averaged Colmez; proof of Cor. 3.3 bounds `log f_ρ` and `L′/L(1,ρ)` | supports; the README proves `log f_ρ ≤ C_g(1 + log D_E)` by the conductor-discriminant formula instead of the source's one-line `f_ρ ≤ |Disc(E)|` |
| 2.22 Logarithmic functional equation | [73] (2-3)–(2-7), pp.1140–1141 | thornerzaman 295–321 (p.1141, header 281) | completed Hecke function `Λ(s,χ) = [s(s−1)]^{δ(χ)} D^{s/2} γ_χ(s) L(s,χ)`, gamma factor with `a(χ)+b(χ) = n_K`, functional equation `Λ(s,χ) = w(χ) Λ(1−s, χ̄)`, trivial zeros (2-7) | supports the odd gamma factors used |
| 2.38 Ray-class zero-density | [66] Theorem 4.2, p.20 | low 1006–1016 (page 20 header 979) | `c = c([k:ℚ]) > 0`; for `Q, T > 1`, `1/2 ≤ σ < 1`, `ε > 0`: `Σ_{Nm 𝔮 ≤ Q} Σ*_χ N_χ(σ,T) ≪_{[k:ℚ],ε} (Disc(k) Q T)^{c(1−σ)+ε}`, primitive ray class characters of conductor `𝔮` | matches the README's statement word for word in content |
| 2.47 Eisenstein Weyl sums | [60] (5.12) p.963, (6.7) proof of Prop. 2, p.969 | dit 582–596 (p.963), 853 (p.969) (printed = PDF + 948) | (5.12) the three-branch `Weyl(u,ψ)` with `ω_D` (`ω₃ = 3`, `ω₄ = 2`); (6.7) `Weyl(s,ψ) ≪_ε |s|^C |L(s,χ_{d′})L(s,χ_d)| D^{1/4+ε}` | supports, including the `|s|^C` and `D^{1/4+ε}` |
| 3.1 Explicit divisor subpower bound | [79] Tao, proof of (3) large-prime step, proof of (4) | taodivisorbound 56–92 | large primes `p ≥ e^{1/ε}` contribute `≤ 1`; small primes by Taylor `1 + aε log p ≤ p^{aε}`, finitely many factors | supports; the README's `D^B n^ε` with `D = max(1, (ε log 2)⁻¹)` recomputed: `a + 1 ≤ D(1 + aε log p)` since `Dε log 2 ≥ 1` |
| 3.21 Dickman function | [86] p.411, p.414 (1.5), Lemma 2.5 p.426 | hildebrandtenenbaum 138–150 (p.414), 470–485 (p.426) (printed = PDF + 409) | (1.5) the delay equation; Lemma 2.5: (2.11) `uρ(u) = ∫_{u−1}^u ρ`, (2.12) positivity by a first-zero contradiction, (2.13) decrease, (2.14) bound | supports every API bullet of §3.21 |
| 3.30 Shifted coprime Möbius sum | [58] Lemma 3.11, p.699 | skorobogatovsofos 1320–1327 (p.699) | for `T ≥ 1`, `q ≤ T^{1/2}`: `Σ_{t≤T/q,(t,q)=1} μ(t) log(qt)/t = −q/φ(q) + O_A((log T)^{−A})` | matches |
| 3.35 Rankin smooth-number bound | [86] p.411, p.414 (1.3) | hildebrandtenenbaum 139–143 | Rankin's method: `Ψ(x,y) ≤ x^σ ∏_{p≤y} (1 − p^{−σ})^{−1}` for `σ > 0`, `x > 1`, `y > 2` | matches; the README's `x ≥ 1, y ≥ 2` endpoints are trivial |

**Adversarial pass.** Rows for statements unchanged since 89a4c37 are carried from the r2/r3 tables with their values (the statements are byte-identical); the new and changed statements have new rows.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.34c, independence (fact 1), README parameters `R = X`, `S = ⌊X/C⌋`, `N = X^{2/3}`, `J = N` | `n = N² = X^{4/3}` | `nJ = X²`; `2RS + J(R+S) = 2X²/C + X^{5/3}(1 + 1/C)`; `X² > 2X²/C + X^{5/3}(1+1/C)` for `C ≥ 3` and `X ≥ 3^{C}` large; Schwartz–Zippel: a nonzero `F` of total degree `k` vanishes at `≤ kN ≤ Jk` grid points since `(x,y) ↦ (x+y√d, x−y√d)` is invertible linear | ✓ (Green's (3.2) with `n = N²`) |
| §0.34c, archimedean bound (fact 2) | entries `≤ R^J (2N√q)^{r+s}` | `Σ_{r<R,s<S} 2(r+s) log(2N√q) = (R²S + RS²)(1 + o(1)) log(2N√q)`; `log(2N√q) = (2/3 + 1/(2C)) log X + log 2`; `RS·2J log R = 2X^{8/3} (log X)/C = o(X³)`; `RS log(2N²J) = O(X² log X)` | `log det G ≤ R²S (1+1/C)(2/3 + 1/(2C)) log X + O(X³)` ✓ |
| §0.34c, `p`-adic bound (fact 3) | `p` odd, `χ(p) = −1`; `h = min(⌊r/p⌋, S−1−s)` | `(√d)^p = d^{(p−1)/2}√d ≡ (d/p)√d = −√d mod p`; replacing row `(r,s)` by `z^{r−ph}(z^p − z′)^h z′^s` adds multiples of rows `(r−pi, s+i)`, `1 ≤ i ≤ h`, all inside `[0,R)×[0,S)` by the choice of `h`; entries in `p^h ℤ[√d]`, trace pairing gives `p^{h+h′} ∣ G̃_{(r,s),(r′,s′)}` | `v_p(det G) ≥ 2 Σ h_{r,s}` ✓ |
| §0.34c, comparison | `Σ_{s<S} min(k, S−1−s) ≥ Sk − k²`; `⌊r/p⌋ ≥ r/p − 1` | `2 Σ_p log p Σ_r (S⌊r/p⌋ − ⌊r/p⌋²) ≥ R²S Σ_p (log p)/p − 2RS θ(X) − (2R³/3) Σ_p log p/p²`; `θ(X) ≤ (log 4)X`, `Σ_p log p/p² < ∞`: both errors `O(X³) = O(C·R²S)` | `Σ_{p≤X,χ(p)=−1} log p/p ≤ (1+1/C)(2/3+1/(2C)) log X + O(C)` ✓ |
| §0.34c Check, `C = 12`, `C = 24` | — | `(13/12)(2/3 + 1/24) = (13/12)(17/24) = 221/288 = 0.767 > 3/4`; `(25/24)(2/3 + 1/48) = (25/24)(33/48) = 825/1152 = 0.716 < 3/4` | ✓ as the README states; `C₀` is at least 15 |
| §0.34c, `d > 0` versus `d < 0` | `K = ℚ(√2)`, `K = ℚ(√−1)` | `⟨α,α⟩ = tr(α ᾱ)`: for `d < 0` it is `2|α|²`, for `d > 0` (bar = identity) it is `α² + α′² > 0`; both are Gram matrices of real vectors through the embeddings | positive definite in both signs ✓ |
| §0.34c, sign of the prime 2 and primes dividing `q` | `q = 8`, `χ₈`, `χ₈′` | `χ(2) = 0`, excluded by the filter `χ(p) = −1`; the prime 2 contributes `≤ (log 2)/2` | ✓ |
| §0.34b, Landau deduction | `s = 1 + 1/log X`, `X ≥ 3` | `s ≤ 1 + 1/log 3 < 2`; `1/(s−1) − 1/(s−β) = (1−β)/((s−1)(s−β)) ≤ (1−β)(log X)²` since `s − β ≥ s − 1`; `p^{−s} ≥ p^{−1} e^{−1}` for `p ≤ X`; `Σ_n Λ(n)(1+χ(n)) n^{−s} ≥ (2/e) Σ_{p≤X, χ(p)=1} log p/p`; right side `(e/2)(C log q + O(1) + (1−β)(log X)²) ≤ A(log q + (1−β)(log X)²)` for `q ≥ 3` | ✓ matches [109] Lemma 2 |
| §0.34, combination | `X = q^C`, `δ = (1−β) log q` | Mertens: `Σ_{p≤X} log p/p ≥ C log q − B`; split primes `≤ A(1 + C²δ) log q`; inert `≤ (3C/4) log q + K_C`; `p ∣ q`: `≤ log q`; so `(C/4 − 1 − A − AC²δ) log q ≤ B + K_C`; if `δ < 1/(16AC)` then `AC²δ < C/16` and `C/4 − C/16 − 1 − A ≥ C/16` when `C ≥ 8(1+A)`; hence `log q ≤ 16(B+K_C)/C` | ✓ the README's threshold |
| §0.34, small conductors | `q ≤ q₀ := exp(16(B+K_C)/C)`, `β ≤ 1/2`; `β > 1/2` | `β ≤ 1/2`: `δ ≥ (log 3)/2`; `β > 1/2`: §0.12 at `ε = 1/2` gives `1 − β ≥ c|D|^{−1} ≥ c/q`, so `δ ≥ c (log q)/q ≥ c (log q₀)/q₀ > 0` effectively | ✓ `c_LS = min` of three effective constants |
| `landau_siegel_exclusion`, Lean form | `q = 3`, `χ = χ₋₃`; `q = 4`, `χ₄`; imprimitive `χ` mod 6 | `3 ≤ q`, `IsPrimitive`, `IsQuadratic`, `χ ≠ 1`: conductor 3 and 4 characters admitted; the level-6 character induced from `χ₋₃` is excluded by `IsPrimitive`, as the README's imprimitive remark intends; `(1−β)·log q ≥ c` with `log q > 0` | matches [109] Thm 1 ✓ |
| `quadratic_character_kronecker` | `q = 3,4,5,8,12` | `D = χ(−1)q`: `−3, −4, 5, ±8, 12`; `d = −3, −1, 5, ±2, 3`; `|d| ≤ q`, `d ≠ 1`, squarefree (`−1` is a unit, squarefree); `q = 5`, `p = 3`: `(5/3) = (2/3) = −1 = χ₅(3)` ✓; `q = 12`, `p = 5`: `(3/5) = −1`, `χ₁₂(5) = χ₄(5)·χ₋₃(5) = 1·(−1) = −1` ✓; `p = 2` excluded, `p ∣ q` excluded | ✓; no primitive real character at `q ≡ 2 mod 4` |
| `inert_prime_sum_le`, quantifier order | `C₀ = 0` chosen, `C = 0` | `Nat.primesLE 1 = ∅`, sum `0 ≤ 0 + K`: harmless; `K` chosen after `C` and before `q`, so `K_C` is uniform in `q` as the README requires | ✓ not vacuous: the content is finiteness of `sup_q` |
| `split_prime_sum_le_of_real_zero`, `X < q` | `q = 10⁶`, `X = 3`, `β = 1/2` | left `≤ (log 2)/2 + (log 3)/3 = 0.713`; right `≥ A log q = 13.8A` | ✓ trivially true, no junk |
| §0.9, `L(1,χ) ≥ c/log q` | `q = 3`: `L(1,χ₋₃) = π/(3√3) = 0.6046`; `q = 4`: `π/4 = 0.7854` | `c ≤ 0.6046·log 3 = 0.664` and `c ≤ 0.7854·log 4 = 1.089` admissible; the README's Check `c ≤ (π/(3√3)) log 3` is the binding one of the two | ✓ |
| §0.9, Siegel from the log bound | `c_ε = ecε` | `max_q (log q)/q^ε` at `log q = 1/ε` equals `1/(eε)`, so `c/log q ≥ ecε q^{−ε}` | ✓ |
| §0.9, route | `σ₁ = 1 + 1/log q`, `σ′ = 1 + 2/log q`, zero `ρ = β + iγ` with `1 − β ≥ c₂/log q` | ratio `Re(1/(σ−ρ))/Re(1/(σ′−ρ)) = (a/a′)(a′² + γ²)/(a² + γ²)`, `a = σ−β`, `a′ = σ′−β`, decreasing in `γ²`, so `≤ a′/a ≤ 1 + (2/log q)/(c₂/log q) = 1 + 2/c₂` | the README's factor is right ✓ |
| §0.9, lower bound at `σ₁` | `q = 3` | `L(σ₁,χ) ≥ ζ(2σ₁)/ζ(σ₁) ≥ (σ₁−1)/σ₁ = 1/(log q + 1) ≥ 1/(2 log q)`; `|L′/L| = O(log q)` on `[1, σ₁]` integrates to a bounded factor over length `1/log q` | ✓ |
| §0.6, exception-free Landau–Page | `T = 2`, `q ≤ 2`; general `q ≤ T` | `q ∈ {1,2}`: only `ζ`, no real zero in `(0,1)`; `log(q(|t|+2)) ≤ log(T(T+2)) ≤ 3 log T` for `T ≥ 2` (`2T² ≤ T³`); a real zero of a real `χ` of conductor `q ≥ 3` has `1−β ≥ c_LS/log q ≥ c_LS/log T` | ✓ with `c ≤ c_LS` |
| §0.1, emptiness | `0 < c ≤ c_LS`, `N > 1` | a `c`-exceptional `β` has `(1−β) log N < c ≤ c_LS`, against §0.34 (`N ≥ 3` since no primitive character has conductor 2) | ✓; §0.24 vacuous |
| §0.18, exceptional term absorbed | `X^β/β` with `1−β ≥ c_LS/log N` | `X^β/β ≤ 2 X exp(−c_LS log X/log N) ≤ 2X exp(−c log X/(√log X + log N))` for `c ≤ c_LS` | ✓ |
| §0.32, effective Siegel–Walfisz | `N ≤ q ≤ (log x)^B` | `log N ≤ B log log x ≤ √log x` once `(log log x)/√log x ≤ 1/B`; error `≤ x exp(−(c/2)√log x)(B log log x)⁴ = o(x (log x)^{−A})` | ✓ |
| §1.2, effective `C_A` | `c₀ ≤ c_LS` | all zeros left of `1 − c₀/log(q(T+2))` by the uniform region plus `.siegel_gap` | ✓ |
| §2.13, effective real-quadratic bound | `D = 5`: `h⁺ = 1`, `ε₅ = (1+√5)/2` | `h⁺ log ε⁺ = √D L(1,χ_D)`; `L(1,χ₅) = (2/√5) log((1+√5)/2) = 0.430 ≥ c/log 5` for `c ≤ 0.69` | ✓ |
| `prime_tail_bound` | `y = 2` | `Σ_{p≥2} log p/p² = 0.493 ≤ C/2` with `C = 1`; partial summation with `θ(t) ≤ (log 4)t` gives `C = 2 log 4 = 2.77` | ✓ |
| `uniform_regularized_zeta` | `η = 1` | `−ζ′/ζ(2) = Σ Λ(n)/n² = 0.5696`, `1/η = 1`, difference `0.43` | ✓ bounded; `η → 0`: `1/η + O(1)` |
| `uniform_logDeriv_prime_sum` | principal `χ` mod 1, `σ = 2` | `−ζ′/ζ(2) − Σ_p log p/p² = 0.5696 − 0.4931 = 0.0765 ≤ Σ_{n≥2} log n/(n(n−1)) = 1.26` | ✓ character-free constant |
| `prime_mellin_identity`, `mellin_mass`, `mellin_log_moment` | `η = 1` | `∫₁^∞ t^{−2} dt = 1`; `∫₁^∞ (log t) t^{−2} dt = 1 = 1/η`; general `η`: `η/η = 1`, `η/η² = 1/η` | ✓ (padding, R07) |
| `mellin_loglog_bound` | `u = log t`, density `η e^{−ηu}` | mean of `u` is `1/η`; Jensen for the concave `log`: `E log(log 3 + u) ≤ log(log 3 + 1/η)` | ✓ |
| `selberg_zero_density`, `siegel_walfisz`, `half_interval_explicit_formula`, `davenport_moebius`, `dirichlet_polynomial_mean_square`, `DirichletGRH`, Weil formula, `dedekindZeta_residue_le`, `bounded_degree_brauer_siegel`, `pretentiousDist`, `HalaszCoefficientClass`, `shiu_bound`, Halász theorems, `smoothCount`, `landau_ramanujan`, `restricted_sathe_selberg`, Beurling, `divisorError`/`BBRFiniteInput`, Atkinson, moments, §§0.4/0.16/0.25/0.29, §3.22, §2.7 | as r2/r3 | values as in those tables (e.g. `σ = 3/4`, `Q = 1`: `T^{3/5}(log T)^A ≤ C_ε T^{(3+ε)/4}`; `cutoff(T,T/2)/T = 0.0322`; `δ = √x − M ∈ [0,1)`; `E = ℚ(i)`: `1−T`, `1−T²`, `(1−T)²`); statements byte-identical at this head | ✓ carried |

**Lean form.** Single `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data (gate `sorry-data=0`), one module docstring naming the non-statable headlines (lines 19–30). Signatures: the worker's `scratch/signatures.md` has the elaborated type of all 65 declarations; the 15 new ones carry every binder in their own statements (`∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)`, `3 ≤ q`, `χ.IsPrimitive`, `MulChar.IsQuadratic χ`, `χ ≠ 1`, `0 < β`, `β < 1`), so no section variable can be lost; I compared each with its README sentence (the table above). Library names used by the new statements exist at the worktree pin: `Nat.primesLE` (`Mathlib/NumberTheory/PrimeCounting.lean` 133, primes `≤ n`), `jacobiSym`, `MulChar.IsQuadratic`, `DirichletCharacter.IsPrimitive`, `logDeriv`, `riemannZeta`. Names the README's Needs lines cite, all present at the pin: `Chebyshev.theta_le_log4_mul_x` (Chebyshev.lean 191), `ArithmeticFunction.vonMangoldt.continuousOn_LFunctionResidueClassAux` (PrimesInAP.lean), `DirichletCharacter.continuousOn_neg_logDeriv_LFunctionTrivChar₁` (DirichletContinuation.lean 376), `DirichletCharacter.LSeries_twist_vonMangoldt_eq` (Dirichlet.lean 412), `DirichletCharacter.LFunction_apply_one_ne_zero` and `LFunction_ne_zero_of_one_le_re` (Nonvanishing.lean 404), `jacobiSym.quadratic_reciprocity` (JacobiSymbol.lean 423), `ZMod.χ₈′` (ZModChar.lean 157), `Matrix.posSemidef_gram` (GramMatrix.lean 83), `Matrix.det_gram_ne_zero_iff_linearIndependent` (GramMatrix.lean 126), `Polynomial.resultant_eq_zero_iff` (Resultant/Basic.lean 912), `MvPolynomial.schwartz_zippel_totalDegree` (SchwartzZippel.lean 192), `Matrix.det_le` (AbsoluteValue.lean 43). The README's claim that Mathlib has no Hadamard determinant inequality at the pin holds: a grep of `Mathlib/LinearAlgebra/Matrix` and `Mathlib/Analysis/Matrix` for a `det ≤ ∏` bound finds only `Matrix.det_le` (entrywise, loses the factor the README names) and the unrelated `IsHadamard` matrices. Tau Ceti at the pin has `fundamentalDiscriminantChar` (`NumberTheory/Multiquadratic/Cyclotomic/QuadraticCharacter.lean`) and `kroneckerChar` (`NumberTheory/LegendreSymbol/KroneckerSymbol.lean` 376) but no theorem that a primitive quadratic character is one of them, so §0.34a is not a duplicate of the library (its second owner is R03).

**One-tactic probe.** A copy of lines 1–185 with every `sorry` replaced by `first | (simp; done) | (norm_num; done) | rfl | infer_instance | (positivity; done)` and the examples by `first | (simp; done) | … | (simp [weightedPrimeSum]; done)`: 15 of the 17 fail with "not a positivity goal" or "unsolved goals"; the example at line 120 closes by `simp`. A second probe: `mellin_mono` closes by one `exact mul_le_mul_of_nonneg_left (setIntegral_mono_on hf hg measurableSet_Ioi (fun t ht => mul_le_mul_of_nonneg_right (hfg t ht) (Real.rpow_nonneg _ _))) hη.le`; `mellin_mass` after `rw [integral_Ioi_rpow_of_lt …]` and `field_simp` leaves `−(η·1^{−η}/(−η)) = 1`, a `simp` away; `mellin_loglog_coarse` does not close by `nlinarith`. These are R06/R07.

**Headline coverage.** Headlines named at README line 5: §0.34 with §§0.34a–c (`landau_siegel_exclusion`, `quadratic_character_kronecker`, `split_prime_sum_le_of_real_zero`, `inert_prime_sum_le`), §0.9 (`quadratic_LFunction_one_lower_bound`), finite-order Hadamard, Siegel–Walfisz, and the Layer 1–3 headlines of r2/r3: all stated. Siegel's theorem is no longer imported from ImaginaryQuadraticClassNumber: §0.9 states the stronger effective bound and does not restate `quadratic_LFunction_siegel`. The docstring names the non-statable ones (Hecke/Artin comparisons, CM endpoints, ray-character density, Chebotarev, Weyl bounds). The "interfaces" of §§0.11a–c are not headlines (R07).

**Supplier order and ownership.** Dependency check as quoted at the top. Every `*Needs:*` line of the changed sections resolves: §0.34 → §§0.11a–b, 0.30, 0.12, 0.34a–c, ZerosOfLFunctions 6.4; §0.34b → §0.11b, §0.30, ZerosOfLFunctions 6.4 (4d); §0.34c → §0.34a; §0.9 → §§0.34, 0.30, 0.30a, 0.11b; §0.31b → §§0.31a, 0.34; §0.12 → §0.31a (and not §0.34, so no cycle through the small conductors); §0.32 → §§0.30, 0.18, 0.34; §0.6 → §§0.30, 0.34; §0.1 → §0.30, §0.34. Target-level cycles: none among these (the only backward edge is §0.11a → §3.17, R09). Ownership of §0.34 against the open pull requests, by `roadmaps grep`: every other open roadmap that mentions the exclusion (ErdosProgressionPowers #1336, SieveMethodsAndPrimePatterns #1495, EffectiveClassNumbers #1406, ArithmeticStatisticsPartV #1175, ArithmeticStatisticsPartVII #1178, AnalyticNumberTheoryPartII #1167, the ZerosOfLFunctions revision #1913) cites AnalyticNumberTheoryPartI §0.34 as its owner; all of them are later in the merge order (ErdosProgressionPowers line 188, EffectiveClassNumbers 239, SieveMethodsAndPrimePatterns 260) except the ZerosOfLFunctions revision (R10). The classification of §0.34a is the only object with a second owner (R03). Overlaps: the one dropped id is R02; no other open pull request changes this roadmap.

**Repaired findings and unchanged passages.** r3's one finding is repaired (above). The previous rounds' sample targets (0.13, 0.21, 2.4, 2.5, 2.17, 2.30, 2.41, 2.51, 3.4, 3.17, 3.19, 3.20, 3.26) lie outside the changed lines and were not re-opened this round.

## Not verifiable

- Rosser–Schoenfeld, Illinois J. Math. 6 (1962), Theorem 6 p.70 (§0.20): the cached Project Euclid pages are access-block pages; the form `|Σ_{p≤x} log p/p − log x − E| < 1/(2 log x)` for `x > 319` is the standard one and the README's subtraction uses only it.
- Koukoulopoulos, *The Distribution of Prime Numbers* (AMS): Theorem 3.4(c) (§0.31), Lemma 11.2 (§§0.31a–b), (12.11)–(12.12): book, cited by locator.
- Davenport, *Multiplicative Number Theory*, Chapter 5 (§0.34a, [112]): Springer book, cited by locator; the classification is textbook and the README's Checks (`q = 3, 4, 8, 12`) were computed above.
- Friedlander–Iwaniec, Expo. Math. 36 (2018) (§0.9, [113]): Elsevier, paywalled; recorded as `uncertified` in the manifest by the fetch (cited for context only, no step depends on it).
- Montgomery, LNM 227 Theorem 12.1 and Invent. Math. 8 (1969) ([100], [108]): paywalled, as in r3; the form used is verified in Bombieri's Astérisque 18.
- Neukirch VII §10 (§2.7, [98]): book; unchanged since r3.
- The OpenAI release's Lean comparator runs and the follow-up papers (Banks, Kerr, Guo, van Dijk, Frei–Kai) listed on the community page: read as data only, not relied on; the review verifies the argument the README itself writes out.

## Source issues

- none
