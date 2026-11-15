<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6901429712 -->
Review (claude) of 6e7d565

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.1: the degree argument follows the source's three sentences clause by clause

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:1067–1071`:
   "so each of its five-adic local degrees is at most one eighth of that degree; no later extension raises
   this ratio, a local degree growing by at most the global degree; and omitting any two five-adic places
   leaves at least three quarters". The `plan.json` statement of 6.1 has the same three clauses.

   **Claim.** The passage is the roadmap's own wording of the degree step.

   **Witness.** CaptainSude26 lines 584–587 are three consecutive sentences with the same three clauses in
   the same order: the one-eighth bound, the ratio not increasing with the same reason, the omission of
   two places. Longest shared run: six consecutive words (README line 1069, source line 586). The
   manifest records that this source has no licence and is cited by locator only.

   **Repair.** Replace, in README lines 1067–1071, from "The five-adic completions of the maximal totally
   real subfield are then unchanged" through "(its residue fields come from the prescribed completions)."
   by:

   > Write `M₀` for the maximal totally real subfield reached before this step and `M = M₀E`. Five splits
   > completely in `E`, so `M_w = (M₀)_u` for `w | u | 5`, while `[M:ℚ] = 8[M₀:ℚ]`; hence
   > `[M_w:ℚ₅] ≤ [M:ℚ]/8` at every five-adic `w`. For a finite extension `M'/M` and `w' | w`,
   > `[M'_{w'}:M_w] ≤ [M':M]`, so `[M'_{w'}:ℚ₅]/[M':ℚ] ≤ [M_w:ℚ₅]/[M:ℚ] ≤ 1/8`; this applies to the maximal
   > totally real subfield `F'⁺ ⊇ M` of `F'`. Thus `F'⁺` has at least eight five-adic places, and for any
   > two of them the sum in condition (ii) of §5.1 is at least `(1 − 2/8)[F'⁺:ℚ] > [F'⁺:ℚ]/2`. The residue
   > fields in (ii) come from the prescribed completions.

   In `plan.json` 6.1, replace "each 5-adic local degree of the totally real subfield is then at most 1/8
   of its degree, no later extension raises the ratio, and omitting two 5-adic places leaves at least 3/4,
   giving (ii) of 5.1" by "then `[M_w:ℚ₅] ≤ [M:ℚ]/8` for `M = M₀E` and every 5-adic `w`, the same bound
   holds in every finite extension of `M` because `[M'_{w'}:M_w] ≤ [M':M]`, and the sum in (ii) of 5.1 is at
   least `(3/4)[F'⁺:ℚ]`".

   Tested on the instance of the §6.1 Check: `M₀ = ℚ(√5)`, `E = ℚ(√31, √59, √71)`, `[M:ℚ] = 16`, eight
   five-adic places of local degree `2 = 16/8`; the sum without two of them is `16 − 4 = 12 = (3/4)·16 > 8`.
   The letter `M₀` is free in §6.1 (the module `M = ad⁰ρ̄` occurs in Layers 3–4 only; if the fix worker
   prefers, any other free letter serves).

2. **F02** (P3) `plan.json`: target 6.2 keeps the name of the term removed in round 11

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/plan.json:1027`:
   `"name": "steinberg_protected_lifting"`.

   **Claim.** Round 11 replaced "Steinberg-protected" everywhere by "protected".

   **Witness.** The README has no such compound (its seven uses of "Steinberg" name the source's term, the
   lifts of LocalGaloisDeformationRings §2.5 or the Steinberg representation); the Layer 6 title in both
   files is "The lifting theorem at five with a protected place". The target name alone keeps the compound.

   **Repair.** Rename the target `protected_lifting_at_five`. No other file uses the name (searched in the
   README, `plan.json` and the reports' statements of targets).

3. **F03** (P3) §3.1: the locator points at the line that fixes the basis, not at the statements

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:599`:
   "(CaptainSude26, Lemma 3.1, line 187.)", closing a paragraph that proves the vanishing of invariants and
   uses the trace form.

   **Claim.** The source supports §3.1 at that line.

   **Witness.** CaptainSude26 line 187 only names `e`, `f`, `h`. The action of `Ad(U)` is at lines 191–192,
   the trace form (invariant, symmetric, nondegenerate) at line 224, the vanishing `M^G = 0` at line 234.

   **Repair.** Write "(CaptainSude26, Lemma 3.1, lines 187–192, for the basis and `Ad(U)`; proof of
   Lemma 3.2, line 224, for the trace form; proof of Lemma 3.3, line 234, for the vanishing of invariants
   over `𝔽₅`.)", and the same in the `locator` of `plan.json` 3.1. The statement for every field with
   `2 ∈ k^×` stays the roadmap's own computation, as the paragraph already says.

4. **F04** (P3) §6.1: the letter `E` is a field there and an elliptic curve in the Conventions

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:1063`: "a
   totally real Galois extension `E/ℚ` of degree eight", against line 107: "`E/K` is an elliptic curve
   `y² = h(x)`".

   **Claim.** The Conventions record every letter with two meanings (`U`, `w`, `p`, `t`, `χ`, `ψ`, `λ`, `O`,
   `K`, `h`, `D`).

   **Witness.** `E` as a number field entered in the last repair (lines 1063–1074, 1120–1130) and the
   Conventions do not record it; `E_a`, `E_b`, `E_c` are fields in the same section.

   **Repair.** Add to the Conventions bullet on `K`: "In §6.1, which names no elliptic curve, `E` is a
   totally real field and `E_a`, `E_b`, `E_c` are imaginary quadratic fields, as in ACC23."

The round-12 finding is repaired and its mathematics is right: every value in the new §6.1 passage and
its new Check was recomputed and holds. No statement of the design is false, vacuous or missing a
hypothesis; every supplier citation resolves at main or at the supplier's open head; the dependency
check shows no UPWARD or CYCLE line. One blocking finding remains, and it is about wording, not
mathematics: the three sentences the last repair added to §6.1 follow three consecutive sentences of
CaptainSude26, a manuscript with no licence, clause by clause. The replacement text is given below
(R01). Three P3 notes follow (R02–R04). The declared gap `acc-torsion-inertial-comparison` is a stated
contract and no finding. This is a design: there is no `Suggested.lean`, and this lane does not
elaborate.

## Verified sound

### The round-12 finding

- **F01 ("the degree inflation at five" undefined): repaired.** README lines 1062–1066: "The degree
  condition comes from a composite with a totally real Galois extension `E/ℚ` of degree eight with
  solvable group, linearly disjoint from the Galois closure of the fields already used, in which five and
  the rational primes below the test places split completely". The term no longer occurs in the README
  or in `plan.json`. The supplier named for the cyclic choice exists and says what is used:
  PotentialAutomorphyInfrastructure §2.5 at its open head states, for a number field `F`, a finite Galois
  avoidance field `A` and a finite set `S` of places, a cyclic extension of every degree `N ≥ 1`, disjoint
  from `A`, in which every place of `S` splits completely; over `ℚ` with the real place in `S` this is
  totally real. The order (the field `E` before the three imaginary quadratic composita) is what makes
  the primes ramified in `E` fall under ACC23 lines 7168–7170. The repair's wording is R01; its letter is
  R04.

The repaired pattern (an undefined compound term) was searched for in the rest of the design: R02 is
its one remaining trace. The pattern of R01 (prose written from the source's sentences) was searched for
in the other passages that cite CaptainSude26 for a proof step (§§3.4, 3.5, 4.1, 4.2, 4.3, 5.3, 7.1, 7.2):
none follows the source sentence by sentence (comparison below).

### Adversarial table (values computed this round)

Rows for §§2.1, 2.2 and 7.2 are new: round 12 had none for them. The others were recomputed on the
sampled targets, the headlines and the changed text.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.1, degree step (changed text) | `F⁺ = ℚ(√5)`, `E = ℚ(√31,√59,√71)` | `31 ≡ 1`, `59 ≡ 4`, `71 ≡ 1 mod 5`: squares, five splits; squarefree parts of the seven quadratic subfields are `31, 59, 71, 1829, 2201, 4189, 129859`, none `5`; `[F⁺E:ℚ] = 16`, eight places of degree `2`; `16 − 4 = 12 > 8` | holds |
| §6.1, ratio under extension | `M'/M`, `w' ∣ w ∣ 5` | `[M'_{w'}:ℚ₅] = [M'_{w'}:M_w][M_w:ℚ₅] ≤ [M':M][M_w:ℚ₅]`; ratio `≤ 1/8` forces `≥ 8` places, so a second place exists; `1 − 2/8 = 3/4 > 1/2` | holds |
| §6.1, non-example | `ℚ(√5, √2)` | `2` is not a square mod `5` (squares `1, 4`): `e = 2`, `f = 2`, one place of degree `4 = [ℚ(√5,√2):ℚ]` | (ii) fails, as stated |
| §6.1, `q = 11` split in `E` | `31, 59, 71 mod 11` | `9, 4, 5`; squares mod `11` are `{1, 3, 4, 5, 9}` | splits |
| §6.1, two in `E` | `31, 59, 71 mod 4` | `3, 3, 3`: discriminants `4·31` etc., two ramifies; a prime `≡ 1 mod 8` would split two | Check's caveat correct |
| §6.1, cyclic `E` of degree 8 with two split | Grunwald–Wang special case | trivial local conditions are always realisable: a degree-8 subfield of `ℚ(ζ_ℓ)`, `ℓ ≡ 1 mod 16`, with the primes of `S` eighth-power residues mod `ℓ`, is real and split at `S` | no obstruction; §2.5 applies |
| §6.1, primes ramified in `E` | ACC23 lines 7167–7172 | an `l ∉ {2, 5}` ramified in `E₀E_aE_c` splits in `E_b`; `E` lies in the role of `E₀`; five is split in `E`; two splits in `E_a` | §5.1(i) reached |
| §6.1, two never splits in `E_b` | Hilbert symbol `(−d_b, −d_c)_l` with `−d_b ∈ (ℚ₂^×)²` | `1` at `2`; `1` at odd `l ∣ d_b` (`−d_c` a square, `l` split in `E_c`); `1` at odd `l ∣ d_c`; `1` at `5` and elsewhere (units); `−1` at `∞`; product `−1 ≠ 1` | holds; `F'_w = F_v(√−d_b, √−d_c)`, degree `∣ 4` |
| §1.1(a) | `K = ℚ(i)`, `S = {20}`; `S = ∅` or `{1,2}`; `K = ℚ(2^(1/3))`, `S = {3}` | `[ℚ(ζ₂₀):ℚ(i)] = 4`; `L = K`; `S₃`: two transpositions multiply to a 3-cycle moving `2^(1/3)` | true for CM `K`; control fails |
| §1.1(b) | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; `ℚ(√5) ⊂ ℚ(ζ₂₀)` | quadratic subfields `d ∈ {−1, ±3, ±5, ±15}`; no `√2`; `(ℤ/2)³` has no `ℤ/4` quotient; `ℚ(√5)` real, not containing `K` | true; `K' ⊇ K` needed |
| §2.1 (new row) | `K₆₀`; `K` imaginary quadratic; `A_t` CM | `ζ₅ ∉ K₆₀`, `ζ₅ ∈ K₆₀(ζ₃)`; `G_{F(ζ₅)} ⊆ G_{K(ζ₅)}`; a prime split in `F` has `F_w = K_v = ℚ_q`; parent `cm_modularity` asks `ζ₅ ∉ L` for `L = K` only; PotentialAutomorphyInfrastructure §2.3(1) asks `r_ι(π)∣G_E` irreducible | (a)–(c) hold; no claim on `ζ₅ ∉ F` |
| §2.2 (new row) | rows `(η → χ, p)`, `(χ → ψ, 3)`, `(ψ → 1, p)`; `h(t)` a square | `ψ ≡ 1 mod p`, `η ≡ 1 mod 3`; residual inputs the pairs `(3,p)`, `(p,3)` and §7.4(2) of the parent; `χ_(h(t))² = 1` keeps the central character trivial; `h(t)` square gives `π_E = π_B` | holds; no lift at five |
| §2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | `ℚ(i) ⊆ ℚ(ζ₈)`: sum; `ℚ(√−3) ⊄ ℚ(ζ₈)`: induction from `ℚ(ζ₂₄)`; `ℚ(i) ⊄ ℚ(√−3)`: induction; the nontrivial element of `Gal(KM/K)` restricts to conjugation of `M` and exchanges the two infinity types | both branches occur; induced one cuspidal |
| §3.1 | `X = [[x,y],[z,−x]]`; `diag(2,3)`; characteristic 2 | `UX − XU = [[z,−2x],[0,−z]]`, `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; `2·3⁻¹ = 2·2 = 4`, `3·2⁻¹ = 3·3 = 4`; `tr 1 = 2 = 0` | invariants vanish iff `2 ∈ k^×` |
| §3.3 | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` over `𝔽₅`; `e = 1, 2, 4, 5` | `M² = [[−1,1],[−1,0]]`, `M³ = 1`; `Φ² = [[16,5],[0,1]] = 1`; `ΦM = [[1,0],[1,−1]]`, `ΦMΦ = [[4,1],[4,0]] = M² = M¹¹`; conjugating `U` by `[[a,b],[0,d]]` gives `[[1,a/d],[0,1]]`, so `a/d = q_v`; `U^e ≠ 1` iff `5 ∤ e` | definition separates; three API bullets hold |
| §4.1 | `Gal(LC_N/F) = SL₂(𝔽₅) × A`, `A` abelian; inertia of order 2 | `H¹(A, M)^G = Hom(A, M^G) = 0`; `ρ̄(I_v) × {1}` of order 5; a class killed by 5 restricts to zero on a group of order 2 | holds; fails with no protected place |
| §4.2 | `g = diag(2,3)`; `κ(σ₀) ∈ W` or not | `Ad g`: `e ↦ 4e`, `h ↦ h`, `f ↦ 4f`; `W = ke ⊕ kf`; `κ(γσ₀) = κ(γ) + κ(σ₀)` as `γ` acts trivially; `Sym²` irreducible since `2 ≤ 4` | one of `σ₀`, `γσ₀` detects |
| §4.3 | `(d,t,r) = (2,1,6)`, `(2,3,10)` | `g = 6 − 6 − 1 + 1 = 0`; `g = 10 − 6 − 1 + 3 = 6`; `1 + 9 + 4 = 14`, `14 + 6 = 20 = 10 + 12 − 2`; `1 + 11 + 10 = 22` | deficit `d = 2` |
| §5.1 | five-adic degrees of `F⁺` | multiples of 4, at least 8; `a + a' < d/2` needs `d > 32`; `d = 36`: all degrees 8, `8 ∤ 36`; `d = 40`: `(8,8,24)` gives `24 > 20` and `8 < 20`; `(8,8,8,16)` gives `16 + 8 = 24 ≥ 20`; five of degree 8 give `24 > 20` | least `d = 40`, five places |
| §5.2 | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·(3 + 8) = 111 = 1 + 30 + 80` | holds |
| §5.4 | same | `g = 111 − 120 − 1 + 10 = 0`; `dim R_∞ = 111 = 111 + 40 − 40`; `dim S_∞ = 151` | deficit `40 = l₀` |
| Theorem 6.2 (headline) | image with `ζ₅ ∈ F` and (4) false | scalars of determinant one are `±1`; a subgroup of `SL₂(𝔽₅)` of order 60 would have even order, contain the unique involution `−1`, and so have order 120 | image is `SL₂(𝔽₅)`; §6.1 applies |
| §7.2 (new row) | `v(s) = 1, 5, 7`; `q = 5`; `v' ≠ v` | `v(q_A) = 3v(s) = 3, 15, 21`; `5 ∣ 15` only; `K₁ ↪ K_v` since `q` splits completely in `K₁ ⊇ K`; `d = 3` is prime to `q ≥ 7`; toric rank of `E³` at good reduction is `0` | (a), (b) hold |
| §7.4 | `Σ = ∅`; `w ∈ Σ` above 2 | reduces to the parent's `switch_five` (read at its head: no hypothesis `ζ₅ ∉ F`, Tate places above 2 and 3); conflict at 2 excluded by `Σ` | holds |
| §7.5 | `c(λ) = 2 − λ − λ⁻¹`, `λ` of order 3 | `λ + λ⁻¹ = −1`, `c = 3`, a unit mod 5; opposite transvections generate order `120`; `q` totally split forces `q ≡ 1 mod 5`, `v ≠ v^c`; `5 ∤ 3m_v`; (4) fails since `ζ₅ ∈ L` | hypotheses of 6.2 met |
| Theorem 2.5 (headline) | `ℚ(i)`, `K₆₀`, `ℚ(ζ₅)` | `ζ₅ ∈ K`: no, no, yes | holds |
| Theorem 8.1 (headline) | `ℚ(ζ₅)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)`, `K₆₀`, `ℚ(i,√5)` | `ζ₅ ∈ K`: yes, yes, yes, no, no (`(ℤ/2)²` has no cyclic quotient of order 4) | branches exhaustive |

For the text no repair touched and no row above covers (Conventions, §§1.2, 2.3, 3.2, 3.4, 3.5, 5.3, 7.1,
7.3), round 12's rows carry computed values and were relied on.

### Sources: the seeded sample

No locator is flagged unverified. The eight manifest texts are in the sources cache; nothing was fetched,
nothing is missing, and no entry was added to the manifest. CaptainSude26 was read in full (lines
20–720); the cited passages of the others were read at their lines.

| Target | Checked at | Result |
|---|---|---|
| 1.1 | MilneCM lines 273–300 (page marker at line 265: p. 10); LeHung26 line 357 (p. 9) | supported: Corollary 1.5 at line 292, Remark 1.6 at line 296 |
| 2.1 | LeHung26 lines 336, 342–355; CN23 line 4513 (p. 87) | supported |
| 2.4 | OpenAI26 lines 1192–1215 (pp. 27–28); LeHung26 lines 364–366; CaptainSude26 lines 676–683 | supported; OpenAI26 has `M = K` only, the other two `M ⊆ K` |
| 3.1 | CaptainSude26 lines 187–192, 224, 234 | supported, at the lines of R03 |
| 3.3 | CaptainSude26 lines 177–183, 533–536 | supported for `μ₅ ⊂ F_v`, `ρ̄(φ) = 1`; the general definition is the roadmap's, tested above |
| 4.1 | CaptainSude26 lines 227–241 | supported |
| 4.2 | CaptainSude26 lines 242–263; AKT23 line 3979 (p. 86) | supported |
| 4.3 | CaptainSude26 lines 416–444 | supported: `g = r − 3d − 1 + t` at line 439 |
| 5.1 | CaptainSude26 lines 264–289; CN23 lines 4226–4260 (pp. 81–82) | supported: clauses (5)–(15) read |
| 5.2 | CaptainSude26 lines 285–289; CN23 line 4361 | supported |
| 5.4 | CaptainSude26 lines 410–498; CN23 line 4261 | supported: dimensions at lines 480–481 |
| 6.1 | CN23 lines 4433–4509 (pp. 85–87); CaptainSude26 lines 543–603; ACC23 lines 7163–7187 (p. 178) | supported; wording at lines 584–587 is R01 |
| 7.4 | CaptainSude26 lines 538–603; CN23 line 4574 (pp. 88–89); CHT08 line 5723 (p. 116) | supported |
| 7.5 | CaptainSude26 lines 120–125, 136–148, 604–609 | supported |
| 8.1 | CaptainSude26 lines 26–33, 671–683; LeHung26 lines 125–128 | supported |

Also read: LeHung26 lines 86–88, 272–299, 308–321; CN23 lines 3849–3872 (Theorem 5.2, pp. 73–74), 4334,
4382, 4404, 4545, 4562; ACC23 lines 2309–2355 (pp. 57–58), 6357 (§6.4.1), 7066. Every printed page the
README and the manifest give agrees with the page markers.

### Library, suppliers, order

- Pins `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti), read from `lake-manifest.json`. Opened at the
  pins: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`),
  `NumberField.IsCMField.of_isAbelianGalois` (:542), `IsCyclotomicExtension.Rat.isCMField` (:564,
  hypothesis `∃ n ∈ S, 2 < n`), `NumberField.isTotallyComplex_of_algebra`
  (`…/InfinitePlace/TotallyRealComplex.lean:229`), `IsCyclotomicExtension`
  (`Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`), `Matrix.SpecialLinearGroup.toGL`
  (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369`), `Matrix.SL2.commutator_eq_top`
  (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`, `a ≠ 0`, `a² ≠ 1`),
  `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`…/GroupCohomology/FiniteCyclic.lean:114`),
  `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`…/EulerCharacteristic/Theorem.lean:98`),
  `TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed` (`…/Duality/Perfect.lean`). All exist.
  Neither library has `adZeroRep`, decomposed genericity or automorphic representations of `GL₂(𝔸_K)`.
- Cross-roadmap citations, resolved now against 21 suppliers and 3 consumers or siblings, each at main
  (EllipticCurves, ClassFieldTheory, SchemeAndStackFoundations, Chebotarev) or at its open head. All 41
  names cited from the parent exist there (`cyclicCover m`, `characterSystem θ` and
  `complexInfinityParameter z` with their arguments), as do its cited sections (§§5.3, 7.4, 8.3, 8.5 and
  others as bold paragraph titles) and its section *Downstream consumers and boundaries*. All 82 cited
  sections and layers of the other suppliers exist under the cited numbers. Statements read against their use:
  the parent's `switch_five`, `auxiliary_local_types`, `cm_modularity` (any CM `L` with `ζ₅ ∉ L`) and §7.4
  (arbitrary number field, pairs `(3,p), (3,5), (p,3)`, non-CM); PotentialAutomorphyInfrastructure §§2.1,
  2.3(1)–(2), 2.5; CrystallineLocalGlobalCompatibilityCM §§8.7, 9.3 (`g = q − 3[F⁺:ℚ] − 1 + |S|`), 9.11
  (the degree condition among the properties of `F₀`); MordellLawrenceVenkatesh §1.3;
  AutomorphicGaloisRepresentationsPartII AG2.7 (`IsDecomposedGenericPrime`,
  `decomposedGenericPrime_local`, `IsDecomposedGeneric`); ArithmeticGaloisRepresentations §§6.3, 7.2, 7.7
  (Sylow injectivity, coefficient change, `H⁰ = H¹ = 0` for `#F ≠ 5`, `H¹(SL₂(𝔽₅), ad⁰)` one-dimensional),
  7.9 (`ResidualImage.adZeroRep`); GL2ModularityLifting §1.7; GlobalGaloisDeformations §5.6;
  LocalGaloisDeformationRings §2.21. No roadmap of the never-cite list is cited.
  ModularityAndLanglandsExtensions and BianchiModularForms are named only under *Outside this roadmap*
  and *Downstream consumers*.
- The citation resolver's four leads: three are source keys followed by a section (`LeHung26, §4.4`,
  `OpenAI26, §9.4`, `CaptainSude26, §4`); the fourth, `ResidualImage.adZeroRep`, is a declaration of
  ArithmeticGaloisRepresentations §7.9, attributed to it. None is a defect.
- Gap `acc-torsion-inertial-comparison`: same slug in `plan.json` (`gaps`, supplier
  AutomorphicGaloisRepresentationsPartII, section AG2.5, needed by 5.3) and in the README (Supplier
  obligations, §5.3, Layer 5 Dependencies). Its hypotheses and conclusion agree with ACC23 lines
  2309–2355. AG2.5 at its head does not state the theorem; PotentialAutomorphyInfrastructure's supplier
  table cites AG2.5 for it. Precise, minimal, declared.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2260 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined
only by a revision. Main has no folder of this name, so there is no second copy. The board index lists
AnalyticNumberTheory and LawrenceVenkateshMethod, both unrelated. Searches of main and every open head,
by object: a protected place (none); every elliptic curve over every CM field (none); a width-three
degeneration (two unrelated matches); intermediate fields of CM fields (MordellLawrenceVenkatesh
§§1.3–1.4, cited); ACC Theorem 3.1.1 (cited by PotentialAutomorphyInfrastructure as AG2.5, stated
nowhere: the gap); descent of decomposed genericity along an extension (PotentialAutomorphyInfrastructure
§2.1 is restriction to a disjoint extension, the opposite direction). EllipticCurveModularityTotallyReal
owns `realCyclotomic_isCMField` for a totally real base and names this roadmap as the CM counterpart;
PotentialAutomorphyInfrastructurePartII (polarized case, definite unitary groups) and
OrdinaryAutomorphicFormsAndModularityLiftingPartII (dyadic ordinary theory) own nothing stated here.

Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (the lists on main and by results are empty); nothing shared.

### Shape, headlines and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers
each ending in Examples and Dependencies, Downstream consumers, References. Three definitions (3.3, 5.1,
5.2) with 3, 4, 4 API bullets and 4, 4, 3 Checks; 24 theorems and one example target, each theorem with
hypotheses, a locator and a *Needs* line. `plan.json` parses: 28 targets, 97 tests, 21 suppliers, one
gap; no target has a prerequisite later than itself. Headlines: Theorems 2.5, 6.2, 8.1; none is statable
at the pins, and the *Lean* paragraph says which carriers each lacks. The README attributes no backticked
Lean name to this roadmap. No LaTeX delimiters, pull-request numbers, machine paths, target tables,
`set_option`, algorithms or process words (the matches of a word search are "Lemma" in source locators).
The layers are named by their mathematics; Layers 1–2 are independent of 3–7, and the order of Layers
3 → 8 is forced by the *Needs* lines (4.1 needs 3.2 and 3.5; 5.4 needs 4.2 and 4.3; 6.2 needs 5.4; 7.5
needs 6.2; 8.1 needs 7.5).

### Copyright and arrangement

Wording: 22 passages were put beside their sources at the locators: the fifteen sampled targets, and
§§2.2, 3.4, 4.2 (route), 7.1, 7.2, the Summary and the supplier obligations. One follows its source
clause by clause (R01). In the others the shared runs are statements of about a dozen words that can be
written one way (clause (4) of the lifting theorem, CN23 line 3857; a hypothesis of ACC23 §3.1; the node
description of §7.1, whose statement the README splits into four parts in another order and to which it
adds its own proof of (b)). Arrangement: CaptainSude26 has Sections 2–6. Its Section 2 is the parent's
and is imported; its Section 6 with LeHung26 §4 becomes Layer 2, placed first; its Section 3 is split
across Layers 3 and 4; the presentation inside the proof of its Theorem 4.2 becomes §4.3; the preparation
inside the proof of its Proposition 5.2 and a lifting theorem for an arbitrary representation become
Layer 6, which no section of the source matches; Layer 1 is added. There is no one-to-one run, and the
order of Layers 3–8 is forced by the *Needs* lines above. Reuse: no table, figure or data taken over (the
lifting table is the parent's §8.3, cited).

Source independence: 22 passages compared with 7 sources, one shared clause by clause (R01, CaptainSude26 lines 584–587); largest share CaptainSude26, 24 of 60 locators in the layers; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and a
  design has no Lean file.
- The global patching argument of CaptainSude26 (lines 300–408, 445–498) beyond its hypotheses, counts
  and local computations: no refereed source states it, and it was not re-proved here.
- The geometric inputs of the parent (cover family, monodromy, local opens), on which LeHung26
  Theorem 1.1 is conditional (line 86): read as supplier statements only.
- OpenAI26 Proposition 9.3 and Lemma 9.4 (lines 1131, 1163): statements located, proofs not re-read.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since CN23 and LeHung26 (line 282) exclude only the ratio `q`; affects nothing.
- **Misprint** in CN23 at the proof of Theorem 5.2, printed p. 86 (line 4460): the source says the set contains the `q`-adic places of `K`; it should say of `F`; affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft, conditional on the parent's geometric inputs, line 86); the parent rests on OpenAI26. No refereed source states these theorems.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`); R01 concerns three sentences written from it. OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page. LeHung26 is recorded as `open-repository` on a host named Hexagon, with CC BY 4.0 in its `version_note`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6e7d565268dd16a5fea94c31f2e83634cd2e984a", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~13", "model": "fable", "worker": "chris-x81"} -->
