<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6900518286 -->
Review (claude) of 195d636

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) “the degree inflation at five” is used twice in §6.1 and never defined

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:1059–1062`:
   “the three imaginary quadratic composita, the degree inflation at five), whose construction does not use
   clause (15), with three additions at `P`: … these places in the split set of the degree inflation”.

   **Claim.** The route names a step of the preparation of CrystallineLocalGlobalCompatibilityCM §9.11, and
   the second addition at `P` says what must split in it.

   **Witness.** The term occurs in no roadmap on main or at an open head, and in no source. §9.11 at its
   head has no such step: it lists the degree condition among the properties of `F₀` (CN23 lines
   4470–4475). The construction meant is CaptainSude26 lines 582–588.

   **Repair.** Define the step where it is first named and say what splits. Line 1059–1060: replace “the
   degree inflation at five)” by “and a composite with a totally real extension of `ℚ`, Galois and solvable,
   in which five splits completely, so that every five-adic local degree of the maximal totally real
   subfield is a small enough fraction of its degree for condition (ii) of §5.1)”. Line 1061–1062: replace
   “these places in the split set of the degree inflation” by “the rational primes below `P` among the
   primes required to split completely in that totally real extension”. Tested for `q = 11` below `P`:
   `ℚ(√31, √59, √71)` is totally real of degree eight; `31 ≡ 1`, `59 ≡ 4`, `71 ≡ 1 mod 5` and
   `31 ≡ 9`, `59 ≡ 4`, `71 ≡ 5 mod 11` are nonzero squares, so `5` and `11` split completely; every
   five-adic local degree is then at most one eighth of the real degree, omitting two places leaves at
   least three quarters, more than half, and the completions above `11` are unchanged. `plan.json` 6.1
   does not use the term and needs no change.

The three findings of round 11 are repaired. The mathematics of the fifteen sampled targets, the three
headline theorems and every passage the round-12 repair changed (§1.1, §6.1, the Layer 6 title) was
recomputed; no statement is false, vacuous or missing a hypothesis, every supplier citation resolves at
main or at the supplier's open head, and the dependency check shows no UPWARD or CYCLE line. There is no
P1 or P2 finding. One P3 finding follows, with its exact repair; because it asks for a change to the
text, the verdict is needs changes and not an acceptance. The declared gap
`acc-torsion-inertial-comparison` (supplier AutomorphicGaloisRepresentationsPartII AG2.5) is a stated
contract and not a finding. This is a design: there is no `Suggested.lean`, and this lane does not
elaborate.

## Verified sound

### Round-11 findings

- **F01 (§1.1 below the generality of its proof): repaired.** Lines 343–345: “(a) let `K` be a CM number
  field, `S` a set of positive integers and `L/K` a finite extension with `IsCyclotomicExtension S K L`;
  then `L` is a CM field. (b) Let `K ⊆ L` be CM number fields; then every intermediate field
  `K ⊆ K' ⊆ L` is a CM field.” The route now goes through MordellLawrenceVenkatesh §1.3, which exists
  at its open head (“1.3 CM or totally real fields via complex conjugations”) and states the criterion
  as cited; that roadmap is earlier in the merge order (line 163 against 197 for the parent). The two
  new Checks were recomputed (table below). The Scope bullet, the Mathlib contract, “From other
  roadmaps”, the Layer 1 Dependencies, `plan.json` 1.1 and the MilneCM locator (Remark 1.6, MilneCM line
  296, p. 10) agree.
- **F02 (§6.1, splitting of `P` in the imaginary quadratic composita): repaired.** Lines 1054–1055: “every
  place of `P ∪ P^c` of odd residue characteristic splits completely and every place of `P ∪ P^c` above
  two has ramification index dividing four”, with the odd primes below `P` added to the split
  conditions of `E_a`, `E_b`, `E_c`. The weakening above two is forced: under ACC23 lines 7165–7172 two
  cannot split in `E_b` (Hilbert symbols recomputed below). An index dividing four is prime to five, so
  protection persists by §3.3, third bullet.
- **F03 (“Steinberg-protected”): repaired.** Line 53–54: “the general lifting theorem at five with a
  protected place over CM fields”; line 1045: “## Layer 6: The lifting theorem at five with a protected
  place”; the same title in `plan.json`. The seven remaining uses of “Steinberg” (lines 159, 160, 268,
  700, 944, 1252, 1268) name the source's term, the lifts of LocalGaloisDeformationRings §2.5 or the
  Steinberg representation.

The repaired patterns were searched for in the rest of the design: a statement narrower than its proof
(none further), a route that does not deliver a claimed splitting (§7.4: the parent's
`solvable_preparation` with trivial prescribed completions and `Σ` away from `2, 3, 5`; holds), an
undefined compound term (R01).

### Adversarial table (values computed this round)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions: tame relation, `D = Ad(U)`, trace form | `q_v = 11`, `7`; `e, h, f` | `U⁵ = 1` so `U¹¹ = U`, `U⁷ = U² = [[1,2],[0,1]]`; `7⁻¹ ≡ 3 mod 5`; `UhU⁻¹ = [[1,−2],[0,−1]] = h − 2e`; `UfU⁻¹ = [[1,−1],[1,−1]] = f + h − e`; Gram determinant `−2` | hold |
| §1.1(a) | `K = ℚ(i)`, `S = {20}`; `S = {1,2}`; `K = ℚ(√−3)`, `S = {4}`; `K = ℚ(2^(1/3))`, `S = {3}` | `[ℚ(ζ₂₀):ℚ(i)] = 4`; `L = K`; `ℚ(√−3, i) = ℚ(ζ₁₂)`; `S₃` has trivial centre, two transpositions multiply to a 3-cycle moving `2^(1/3)` | true for CM `K`; false for the non-CM control |
| §1.1(b) | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; `ℚ(√5) ⊂ ℚ(ζ₂₀)` | seven quadratic subfields `d ∈ {−1, ±3, ±5, ±15}`, no `√2`, no `ℤ/4` quotient of `(ℤ/2)³`; roots of unity `μ₁₂`, `K(μ₁₂)` of degree 4, not 8; `ℚ(√5)` real and not containing `K` | true; `K' ⊇ K` needed |
| §1.2 (sampled) | `1 ⊕ 1` over `𝔽₃`, `ℚ ⊂ ℚ(ζ₃)`; AG2.7 definition | ratio `1 ≠ 2` at `q = 2`; split `q ≡ 1 mod 3` gives ratio `1 = q`; `F_w = K_v = ℚ_q`, `q_v = q_w = q`; AG2.7 asks `p ≠ ℓ`, complete splitting, every `v` | (a), (b) hold; converse fails |
| Layer 1 Examples, `K₆₀` | `{1, 29} ⊂ (ℤ/60)ˣ` | `29 ≡ −1 mod 15`, `1 mod 4`, `4 mod 5`, `2 mod 3` | `ζ₅ ∉ K₆₀`, `ζ₅ ∈ K₆₀(ζ₃)` |
| §2.3 (sampled) | `q_v = 4`: split multiplicative, good with `a = 4`; `K = ℚ(ζ₈)`, `z = i` | factors `(1 − T)⁻¹` against `((1 − T)(1 − 4T))⁻¹`; `T² − 4T + 4 = (T − 2)²`, `2/4^(1/2) = 1`; two complex places; `diag(i, −i)`, trace `0`, determinant `1` | holds; shift is `s − 1/2` |
| §2.4 (sampled) | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | `ℚ(i) ⊆ ℚ(ζ₈)`: isobaric sum; `ℚ(√−3) ⊄ ℚ(ζ₈)`, `KM = ℚ(ζ₂₄)`: induction; `ℚ(i) ⊄ ℚ(√−3)`: induction | both branches occur |
| §3.1 | `X = [[x,y],[z,−x]]`; `diag(2,3)`; characteristic 2 | `UX − XU = [[z,−2x],[0,−z]]`; `2·3⁻¹ = 2·2 = 4`, `3·2⁻¹ = 3·3 = 4`; trace of `1` is `2 = 0` | invariants vanish iff `2 ∈ k^×` |
| §3.2 (sampled) | `p = 3, 5, 7` | `Σ_{i<5} Dⁱ = 5 + 10(D−1) + 10(D−1)²`; `(D−1)e = 0`, `(D−1)h = −2e`, `(D−1)f = h − e`; `p = 7`: `7 + 21(D−1) + 35(D−1)² = 0`; `p = 3`: norm `(D−1)²`, `(D−1)²f = −2e ≠ 0`, kernel `ke ⊕ kh = (D−1)M` | `dim H¹(⟨U⟩) = 0, 1, 1`; `[SL₂(𝔽₅):⟨U⟩] = 24` |
| §3.3 | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` over `𝔽₅` | `M² = [[−1,1],[−1,0]]`, `M³ = 1`; `Φ² = 1`; `ΦMΦ⁻¹ = [[4,1],[4,0]] = M² = M¹¹` | not protected, as stated |
| §3.4 | `(1+εf)U`, `(1+εh)U`; `diag(11,1)`; `N = [[a,b],[−a²/b,−a]]` | traces `2 + ε`, `2`; determinant `1 − ε² = 1`; `tr N = det N = 0`; `q(q+1)²δ² = (1+q)²ψ(φ)`; `11·144 = 1584` | (i)⇔(ii)⇔(iii); three parameters |
| §3.5 (sampled) | `q_v ≡ 1`, `2 mod 5`; `p = 3`, `q = 4` | `M^(I_v) = ke`, `φ` scales `e` by `q_v`; `dim L_v = 3 − (3 − h⁰)`; `ξ(φτφ⁻¹) = ξ(τ) − (D−1)ξ(φ)`; `Σ_{i<q} Dⁱ = q + C(q,2)(D−1) + C(q,3)(D−1)²`, equal to `1` for `p ≥ 5`, `C(4,3) = 4 ≡ 1 mod 3`; `Z¹ = 3 + 1`, `B¹ = 2` | (a)–(d) hold; `p ≥ 5` needed in (d) |
| §4.1 | `SL₂(𝔽₅) × A`, `A` abelian | `H¹(A, M)^G = Hom(A, M^G) = 0`; `ρ̄(I_v)` of order 5 inside `SL₂(𝔽₅) × {1}` | holds; fails with no protected place |
| §4.2 (sampled) | `g = diag(2,3)`; `κ(σ₀) ∈ W` or not | `Ad g`: `e ↦ 4e`, `h ↦ h`, `f ↦ 4f`; `W = ke ⊕ kf`; `κ(γσ₀) = κ(γ) + κ(σ₀)`; `Sym²` irreducible for `2 ≤ p − 1 = 4`; a degree-one unramified place has `e = f = 1` in every quadratic subfield | one of `σ₀`, `γσ₀` detects; `h¹ − h⁰ = 2 − 1` at `Q` |
| §4.3 (sampled) | `(d,t,r) = (2,1,6)`, `(2,3,10)` | `g = 6 − 6 − 1 + 1 = 0`; `g = 10 − 6 − 1 + 3 = 6`; `1 + 9 + 4 = 14`, `14 + 6 = 20 = 10 + 12 − 2`; `1 + 11 + 10 = 22` | deficit `d = 2` |
| §5.1 (sampled) | five-adic degrees of `F⁺` | each a multiple of 4 and `≥ 8`; `a + a' < d/2` needs `d > 32`; `d = 36` needs all `8`, `8 ∤ 36`; `(8,8,24)`: `24 > 20`, `8 < 20`; five places of degree 8: `24 > 20` | least `d = 40` |
| §5.2 | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·(3 + 8) = 111 = 1 + 30 + 80` | holds |
| §5.3 (sampled) | sets of ACC23 §3.1; `w = v^c`, `q_w = 11` | `S_aux = (S∪Q) ∪ (S∪Q)^c`, `R_aux = R∪P∪Q`, `S_aux ∖ (R_aux^c ∖ R_aux) = S ∪ Q` since `P^c ∩ S = ∅` and `Q ∩ S^c = ∅`; index `12`, `12·5 = 60`; `diag(1+ε,1−ε)¹¹ = diag(1+11ε, 1−11ε) = diag(1+ε,1−ε)` | hypotheses of ACC23 Theorem 3.1.1 met; `Q ∩ S^c = ∅` needed |
| §5.4 (sampled) | `d = 40`, `t = 10`, `R = ∅` | `g = r − 120 − 1 + 10 = r − 111`; at `r = 111`: `dim R_∞ = 111 + 0 = 111 + 40 − 40`, `dim S_∞ = 151`; deficit `40 = l₀` | holds |
| §6.1, odd `q` (sampled) | `q = 11`, `p_b = 109`, `p_c = 2617` | `2617` has no prime factor `≤ 47`; `2617 = 6·436 + 1`; `109 ≡ 2617 ≡ 10 mod 11`; `−4·109 ≡ 4 mod 11`; `2617 = 24·109 + 1`, so `−2617 ≡ −1`, a square modulo `109 ≡ 1 mod 4`; `(109/2617) = (2617/109) = 1` | `11` splits in `E_b`, `E_c`; compatible with ACC23's choice |
| §6.1, `q = 2` | ACC23 conditions with `−d_b ∈ (ℚ₂^×)²` | `(−d_b, −d_c)_l = 1` at `2`, at `l ∣ d_b` (split in `E_c`), at `l ∣ d_c` (split in `E_b`), at `5` (unramified) and elsewhere; `−1` at `∞`; product `−1` | splitting impossible; `109·2617 ≡ 5·1 mod 8`, `−109 ≡ 3 mod 4`: `e = 2`; in general `e ∣ 4` |
| §6.1, persistence | `e = 1, 2, 4, 5` at a protected place | `U, U², U⁴ ≠ 1`, `U⁵ = 1` | protected iff `5 ∤ e` |
| Theorem 6.2 (sampled, headline) | `⟨SL₂(𝔽₅), μγ⟩`, `μ² = 2`, `γ = diag(1,2)` over `𝔽₂₅`; determinant of order 4 | `det(μγ) = 2·2 = 4`; `(μγ)² = 2·diag(1,4) = diag(2,3)`; order `240`, projective order `120`; projective kernels of index `120` and `2·60 = 120`, equal; order 4: `120 < 240`; scalars of determinant one are `±1` | `ζ₅ ∈ F` is a real hypothesis; image is `SL₂(𝔽₅)` when (4) fails |
| §7.1 | node `xy = s`, `w = −1` on both branches; `p = 101` | invariants `x², y², xy`: `z₁z₂ = s²`; thickness `2 + 1 = 3 = 1 + 1 + 1`; two rational curves meeting twice have genus 1, three times genus 2; `2(P₀ + rT') = c₀` has one solution modulo 3; order `606`, `[303]R_* = a/2` | type `I₃` |
| §7.3 | split Tate curve, `μ₅ ⊂ K_v` | Frobenius acts by `q_v ≡ 1` on `μ₅` and by `1` on the quotient; `v(q_A) = 3`: inertia `[[1,3],[0,1]]`; `15`: trivial | protected iff `5 ∤ v(Δ_min)` |
| §7.4 (sampled) | `Σ = ∅`; `w ∈ Σ` above 2 | reduces to the parent's `switch_five` (read: no hypothesis `ζ₅ ∉ F`, Tate places above 2 and 3); conflict at 2 excluded by `Σ` | holds |
| §7.5 (sampled) | `c(λ) = 2 − λ − λ⁻¹`, `λ` of order 3; clauses of Theorem 6.2 over `L` | `c = 3`, a unit modulo 5; two opposite transvections generate a group of order `120`; `det = ε̄₅ = 1` on `G_K`; `q` totally split forces `q ≡ 1 mod 5` and `v ≠ v^c` (conjugation acts freely on the `[K:ℚ]` places); `5 ∤ 3m_v` | hypotheses of 6.2 met |
| Theorem 2.5 (headline) | `ℚ(i)`, `K₆₀`, `ℚ(ζ₅)` | `ζ₅ ∈ K`: no, no, yes; `cm_modularity` of the parent needs `ζ₅ ∉ L` for `L = K` only | holds |
| Theorem 8.1 (sampled, headline) | `ℚ(ζ₅)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)`, `K₆₀`, `ℚ(i,√5)` | `ζ₅ ∈ K`: yes, yes, yes, no, no; the fixer of `K₆₀(ζ₅)` in `{1, 29}` is `{1}` | branches exhaustive |

### Sources: the seeded sample

No locator is flagged unverified. The eight manifest texts are in the sources cache; nothing was fetched
and nothing is missing. CaptainSude26 (lines 1–720) and the cited passages of the others were read in
full this round.

| Target | Checked at | Result |
|---|---|---|
| 1.2 | LeHung26 lines 308–321 (p. 8) | supported: genericity over `K` for `A_t[5]`, over `F` for the chain |
| 2.3 | OpenAI26 line 1192 (§9.4, pp. 27–28); CN23 line 4545 (Lemma 6.1.3, p. 88); LeHung26 lines 361–363 | supported |
| 2.4 | OpenAI26 §9.4; LeHung26 lines 364–366; CaptainSude26 lines 676–683 | supported |
| 3.2 | CaptainSude26 lines 231–241 | supported |
| 3.5 | CaptainSude26 lines 187–226 | supported for `ρ̄(φ) = 1`, `μ₅ ⊂ F_v`; the general (a)–(b) are this roadmap's computation, recomputed above |
| 4.2 | CaptainSude26 lines 242–263; AKT23 line 3979 (Lemma A.5, p. 86) | supported |
| 4.3 | CaptainSude26 lines 416–444 | supported: `g = r − 3d − 1 + t` at line 439 |
| 5.1 | CaptainSude26 lines 264–289; CN23 lines 4226–4260 (pp. 81–82) | supported: clauses (5)–(15) read |
| 5.3 | CaptainSude26 lines 291–408; CN23 lines 4334, 4382; ACC23 lines 2309–2355 (pp. 57–58) | supported |
| 5.4 | CaptainSude26 lines 410–498; CN23 line 4261 | supported: dimensions at lines 480–481 |
| 6.1 | CN23 lines 4433–4490 (pp. 85–87); CaptainSude26 lines 543–603; ACC23 lines 7163–7187 (p. 178) | supported for `q ≥ 7`; the case above two is this roadmap's, recomputed above |
| 6.2 | CN23 lines 3849–3872 (pp. 73–74); CaptainSude26 lines 264–289, 410–415 | supported |
| 7.4 | CaptainSude26 lines 538–603; CN23 line 4574; CHT08 line 5723 (p. 116) | supported |
| 7.5 | CaptainSude26 lines 120–125, 136–148, 604–609 | supported |
| 8.1 | CaptainSude26 lines 26–33, 671–683; LeHung26 lines 125–128 | supported |

Also read: MilneCM lines 273–300 (p. 10) for §1.1; LeHung26 lines 86–88, 342–358 for §§2.1, 2.2, 2.5;
CN23 lines 1235–1239 (Definition 2.1.27). The page markers agree with every printed page the README
gives.

### Library, suppliers, order

- Pins `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti), as in `lake-manifest.json`. Opened at the pins:
  `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`),
  `NumberField.IsCMField.of_isAbelianGalois` (:542),
  `IsCyclotomicExtension.Rat.isCMField` (:564, hypothesis `∃ n ∈ S, 2 < n`, which the README's “CM or
  `ℚ`” respects), `NumberField.isTotallyComplex_of_algebra`
  (`…/InfinitePlace/TotallyRealComplex.lean:229`), `IsCyclotomicExtension`
  (`Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`), `Matrix.SpecialLinearGroup.toGL`
  (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369`), `Matrix.SL2.commutator_eq_top`
  (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`; `a ≠ 0`, `a² ≠ 1`),
  `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`…/GroupCohomology/FiniteCyclic.lean:114`: the homology
  of `A --(ρ(g) − 1)--> A --N--> A`, that is `ker N / im(ρ(g) − 1)`), `groupCohomology.map`
  (`…/GroupCohomology/Functoriality.lean:141`), `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`
  (`…/EulerCharacteristic/Theorem.lean:98`), `tateDualityPairing_perfect_mixed`
  (`…/Duality/Perfect.lean:280`). All exist.
- Cross-roadmap citations, resolved now: 24 supplier, sibling and consumer roadmaps were read at main
  (EllipticCurves, ClassFieldTheory, SchemeAndStackFoundations, Chebotarev under `Completed/`) or at
  their open heads. All 25 cited sections of the parent exist (16 as `###` headings, 9 as bold paragraph
  titles such as “**5.3 The independently modular elliptic starting point.**”), as do its cited
  target names; the cited sections of CrystallineLocalGlobalCompatibilityCM (§§9.5–9.9 as bold
  titles); and every cited section of the other suppliers. Statements read against their use: the
  parent's `seed_modular` (no condition at five), `hilbert_local_selection` (finitely many nonempty
  opens), `switch_five` (“ζ5∉F is not a hypothesis”), `auxiliary_local_types`,
  `modular_elliptic_all_coefficients` (CM base), `potentiallySemistableCM`, `cm_modularity` (any CM `L`
  with `ζ₅ ∉ L`), §7.1 (`c(λ) = 2 − λ − λ⁻¹`, traces `20`, `−16`), §7.4 (arbitrary number field, finite
  set of places containing those above `3p`, pairs `(3,p), (3,5), (p,3)`, non-CM) and its boundary
  section with `ℚ(ζ₁₅ + ζ₁₅⁻¹, i)`; CrystallineLocalGlobalCompatibilityCM §9.1 and §9.11;
  PotentialAutomorphyInfrastructure §2.1 and §2.3(1)–(2) (CM or totally real, soluble Galois);
  AutomorphicGaloisRepresentationsPartII AG2.7 (`IsDecomposedGenericPrime`,
  `decomposedGenericPrime_local`, `IsDecomposedGeneric`); ArithmeticGaloisRepresentations §4.3
  (perfectness through `Matrix.SL2.commutator_eq_top`), §7.7 (Sylow injectivity, coefficient change,
  `H⁰ = H¹ = 0` for `#F ≠ 5`, `H¹(SL₂(𝔽₅), ad⁰)` one-dimensional), §7.9 `ResidualImage.adZeroRep`;
  GlobalGaloisDeformations §5.6 (detecting and padding classes, exactly `q ≥ dim H` primes of degree
  one); LocalGaloisDeformationRings §§2.3, 2.21; MordellLawrenceVenkatesh §1.3. No roadmap of the
  never-cite list is cited. ModularityAndLanglandsExtensions and BianchiModularForms, later in the
  order, are named only under *Outside this roadmap* and *Downstream consumers*.
- The citation resolver's four leads: three are source keys (`LeHung26, §4.4`, `OpenAI26, §9.4`,
  `CaptainSude26, §4`); the fourth, `ResidualImage.adZeroRep`, is a declaration of
  ArithmeticGaloisRepresentations §7.9, attributed to it. None is a defect.
- Gap `acc-torsion-inertial-comparison`: same slug in `plan.json` (`gaps`, supplier
  AutomorphicGaloisRepresentationsPartII, section AG2.5, needed by 5.3) and in the README (Supplier
  obligations, §5.3, Layer 5 Dependencies). The `needs` sentence asks for one statement; its hypotheses
  and conclusion in the README agree with ACC23 lines 2309–2355. AG2.5 at its head has no occurrence of
  the theorem; PotentialAutomorphyInfrastructure (its supplier table) cites AG2.5 for it. Precise,
  minimal, declared.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2258 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is
defined only by a revision, no second copy on main. The board index lists AnalyticNumberTheory and
LawrenceVenkateshMethod, both unrelated. Searches of main and every open head, by object: every
elliptic curve over every CM field (no other owner); a protected place or a width-three degeneration
(none; one unrelated match); intermediate fields or composita of CM fields (MordellLawrenceVenkatesh
§§1.3–1.4, cited: §1.4 has every subfield of a totally real or CM field of that kind, and §1.1(b) here
adds only that a field containing a CM field is not totally real, which the Scope bullet says); descent
of decomposed genericity along an extension (PotentialAutomorphyInfrastructure §2.1 is restriction to a
disjoint extension, the opposite direction); ACC Theorem 3.1.1 (cited by
PotentialAutomorphyInfrastructure as AG2.5, stated nowhere: the gap); detection of the class of
`H¹(SL₂(𝔽₅), ad⁰)` on a Sylow subgroup (no owner; the dimension is ArithmeticGaloisRepresentations
§7.7, cited). EllipticCurveModularityTotallyReal owns `realCyclotomic_isCMField` for a totally real base
and names this roadmap as the CM counterpart in its *Downstream consumers*; its Scope imports from the
same parent and shares no object with this one.

Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (the lists on main and by results are empty); nothing shared.

### Shape, headlines and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers
each ending in Examples and Dependencies, Downstream consumers, References. Three definitions (3.3, 5.1,
5.2) with 3, 4, 4 API bullets and 4, 4, 3 Checks; 24 theorems and one example target, each theorem with
hypotheses, a locator and a *Needs* line; `plan.json` parses, with 28 targets, 96 tests, 21 suppliers
and one gap, and agrees with the README on the sampled targets. Headlines: Theorems 2.5, 6.2, 8.1; none
is statable at the pins (neither library has automorphic representations of `GL₂(𝔸_K)`, their Galois
representations, or potentially semistable local representations with labelled weights), and the *Lean*
paragraph says so for each. The README attributes no backticked Lean name to this roadmap. No LaTeX
delimiters, pull-request numbers, machine paths, target tables, `set_option`, algorithms or process
words. The layers are named by their mathematics; Layers 1–2 are independent of 3–7, and the order of
Layers 3 → 8 is forced by the *Needs* lines (4.1 needs 3.2 and 3.5; 5.4 needs 4.2 and 4.3; 6.2 needs
5.4; 7.5 needs 6.2; 8.1 needs 7.5).

### Copyright and arrangement

Wording: 21 passages were put beside their sources at the locators (the fifteen sampled targets, §§1.1,
3.4, 7.1, 7.2, the Summary and the supplier obligations), and the README without its References was
scanned for common letter runs of 28 or more against the eight texts. The longest runs are the title of
the parent's source, clause (4) of the lifting theorem (CN23 line 3857, six words), a hypothesis of
ACC23 §3.1 (seven words) and the first clause of the headline (OpenAI26, seven words): statements of
about a dozen words that can be written one way. Arrangement: CaptainSude26 has Sections 2–6. The
roadmap puts the assembly of its Section 6 first (Layer 2, with LeHung26), splits its Section 3 across
Layers 3 and 4, moves the presentation out of the proof of its Theorem 4.2 into Layer 4, states a
preparation and a general lifting theorem (Layer 6) that the manuscript has only inside the proof of its
Proposition 5.2, and adds Layer 1; there is no one-to-one run, and the order of Layers 3–8 is forced by
the *Needs* lines above. Reuse: no table, figure or data taken over (the lifting table is the parent's
§8.3, cited).

Source independence: 21 passages compared with 6 sources (and a letter-run scan against 8), none shared beyond statements of a dozen words; largest share CaptainSude26, 24 of 54 locators in the layers; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and a
  design has no Lean file.
- The global patching argument of CaptainSude26 (lines 315–408, 445–498) beyond its hypotheses, counts
  and local computations: no refereed source states it, and it was not re-proved here.
- The geometric inputs of the parent (cover family, monodromy, local opens), on which LeHung26
  Theorem 1.1 is conditional (line 86): read as supplier statements only.
- OpenAI26 pp. 26–28: the headings and statements of Proposition 9.3, Lemma 9.4 and §9.4 were located
  (lines 1131, 1163, 1192); their proofs were not re-read this round.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since that definition (CN23 line 1239) excludes only the ratio `q`; affects nothing.
- **Misprint** in CN23 at the proof of Theorem 5.2, printed p. 86 (line 4460): the source says the set contains the `q`-adic places of `K`; it should say of `F`; affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft, conditional on the parent's geometric inputs, line 86); the parent rests on OpenAI26. No refereed source states these theorems.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`). OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page. LeHung26 is recorded as `open-repository` on a host named Hexagon, with CC BY 4.0 in its `version_note`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "195d6368af7c2be433b0023c30ce1b6eadd5a3ae", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~12", "model": "fable", "worker": "chris-x30"} -->
