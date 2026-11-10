# Review of EllipticCurveModularityPartII (pull request #1491 at 9d8c599)

**Verdict:** needs changes

This is an incremental re-review of the 129 changed lines since `504db2f`. Review 22's R01 is repaired. Two non-blocking findings remain:
- R01 (P3) is a new one-clause inaccuracy in a changed API bullet.
- R02 (P3) is carried: the description still says nothing about EllipticModularityEffectiveComparisons.

## R01 (P3) — §1.5 says every level at which F♯ is applied is a deletion level, but §§1.8 and 3.2–3.3 apply it at other levels

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 239 (§1.5, a changed API bullet): “sharpF(0)=0 is a junk-level convention, and every level at which a theorem below applies it is a positive deletion level.”

**Claim.** F♯ is applied at levels that are not the deletion level M₀:
- §1.8 (line 289) applies it at every N>0;
- §§3.2–3.3 (lines 396, 404), and §4.7 through H♯, apply it at the residual conductor N(E[ℓ]).

The README itself says that N(E[ℓ]) can be a proper divisor of M₀ at Serre weight 2. Only the positivity of the level is true and needed.

**Witness.** README line 426 (§3.4): “When the weight is 2 and N(E[ℓ]) is a proper divisor of M₀, … §3.3 realizes E[ℓ] at the smaller level N(E[ℓ])”. So §3.3 applies F♯ at a level other than M₀.

**Repair.** Replace the clause after the semicolon with:

> every level at which a theorem below applies it is positive: the deletion level M₀ in §§3.4 and 5.6, the residual conductor N(E[ℓ]) in §§3.2–3.3, 4.4 and 4.7, and an arbitrary N>0 in §1.8.

**Tested.**
- **M₀ ≥ 1.** Tau Ceti `WeierstrassCurve.algorithmicConductor_ne_bot` (`TateAlgorithm/Reduction/Conductor.lean:115`) and Mathlib `Ideal.absNorm_eq_zero_iff` (`RingTheory/Ideal/Norm/AbsNorm.lean:398`) give M ≥ 1. M₀ is M divided by distinct primes that each divide M exactly once, so M₀ ≥ 1.
- **N(E[ℓ]) ≥ 1.** It is a conductor, so it is positive.
- **Sentence and Lean agree.** With this wording the sentence is true at every use. It also matches the Lean file, where `sharpF` and `sharpH` are applied only to `deletionLevel E ell`.

## R02 (P3) — The description still does not say what happens to EllipticModularityEffectiveComparisons

This finding is carried from review 22's R02, which was first raised in review 11.
- `grep -c EffectiveComparisons` on the description at this head returns 0.
- No repair report marks the finding as not actionable: GATE~12, FIX-RT~1 and FIX-RT~2 contain no such entry for it.

**Location.** The pull-request description, including its depends-on and merge-order blocks, never names EllipticModularityEffectiveComparisons.

**Claim.**
- EllipticModularityEffectiveComparisons plans the same objects as this roadmap.
- This roadmap is earlier in the merge order (`ORDER.txt` line 275, against line 285), so it is the owner, and the other roadmap must cite it.
- Nothing in this folder changes. Only the description must state the settlement.

**Witness.** EllipticModularityEffectiveComparisons is still at `c90f56d`.
- README line 1707: “plans the same results under its own layer numbering”.
- `Suggested.lean` declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153) and `torsionRepresentation` (:169).
- Its §§2.1–2.3 define the thresholds that this head now declares as `sharpF`, `sharpG` and `sharpH`.

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed before either pull request merges, or cut down to a consumer of this roadmap. As a consumer it would cite:
- §§1.4, 1.5–1.8, 2.0 and 2.2;
- §§3.4, 4.7 and 5.6;
- §§5.1, 5.4–5.5, 6.0f and 6.18.

No change to the folder is needed.

## Previous findings

- R01 — repaired: §3.4 states `deletion_level_realization` (ℓ≥3, E[ℓ] irreducible, ℓ>F♯(M₀)) and §5.6 states `deletion_level_full_two_realization` (full rational two-torsion, ℓ>H♯(M₀)). `sharpF`, `sharpG` and `sharpH` are real-bodied. The docstring now excludes only the N(E[ℓ])/Serre-weight forms.
- R02 — not repaired: the description is unchanged (grep for EffectiveComparisons: 0 hits). It is carried as R02.

Three of the repair's choices differ from the requested repair, and each is sound:
- **The full-two form moved to Layer 5.** It drops both ℓ≥3 and irreducibility, deriving them from H♯≥4 (§1.7) and §5.4. That is a strengthening, with no cycle: §5.6 uses §5.4, and §5.4 does not use §5.6.
- **EC.3 still points at §4.7.** A sentence names §5.6 as the deletion-level form. This is accurate, because the consumer's contract row (ErdosProgressionPowers README line 659) cites §4.7.
- **§4.8 keeps an ℓ=5,7 hypothesis.** It now applies only to identifying Kraus's level with M₀, which genuinely needs it. The realization theorems no longer use it.

## Verified sound

### Gate, dependency check, elaboration and signatures

**Gate.** Rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate (`scratch/gate.md`) also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** (`--movable`):

```text
depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exits 0. Its only messages are 17 `declaration uses sorry` warnings, at lines 101, 106, 159, 182, 195, 206, 221, 248, 254, 260, 274, 281, 292, 307, 326, 334 and 343. The file has no `variable` or `include` block.

**Signatures.** A scratch copy with `#check @…` for all 32 declarations elaborates with no error, and each elaborated type matches its README statement:
- `sharpF`, `sharpG` and `sharpH` all have type `ℕ → ℝ`.
- `deletion_level_realization` keeps `[Fact (Nat.Prime ell)]`, `3 ≤ ell`, irreducibility and `sharpF (deletionLevel E ell) < ↑ell`. Its conclusion uses the existential `C.IsElliptic` as the instance in `torsionRepresentation C ell`.
- `deletion_level_full_two_realization` keeps `FullRationalTwo E` and `sharpH (deletionLevel E ell) < ↑ell`, and concludes `FullRationalTwo C`.

Nothing was changed.

### The changed passages

**§3.4 route**, checked step by step:
- **Inputs from deletion-level-lowering.** It supplies the level-M₀ newform and the congruences; this is SerreWeightAndLevelOptimisation §§6.2–6.3, which state the theorem for ℓ≥3 at lines 1400 and 1418.
- **g⁺(M₀)≥1 gives F♯(M₀)>μ(M₀)/6.** With g⁺(M₀)≥1, F♯(M₀) ≥ μ(M₀)/6+2√(μ(M₀)/6)+1. So every prime q≤μ(M₀)/6 is less than ℓ.
- **The three cases.**
  - q∣M₀: c_q ∈ {0,±1}.
  - q∤M: the bound is 4√q ≤ (√q+1)², which is (√q−1)² ≥ 0.
  - q deleted: c_q ∓ (q+1) ≠ 0, because 2√q < q+1, and its conjugates are bounded by (√q+1)².
- **Conclusion.** §2.1 with d ≤ g⁺(M₀) then gives ℓ ≤ F♯(M₀), a contradiction. This matches Kraus1997 lines 307–373, with (5)–(6) replaced by BS Lemma 2.1 (BS2020 lines 191–193).
- **The ℓ=3 remark.** g⁺(N)=0 for N≤10 and g⁺(11)=1, and μ(N)≥12 for 11≤N≤3000. The least F♯ over N≤3000 with g⁺≥1 is 5.828 > 3.

**§5.6 route** follows Kraus1997 lines 374–441 at level M₀:
- **Small witness.** §4.3 at the level of C₀ gives a witness q ≤ μ(lcm(M₀,4))/6, so (√q+1)² ≤ G♯(M₀) < ℓ and q≠ℓ.
- **Good case.** The traces are equal, since 4√q < (√q+1)² for q prime. Then #C₀(𝔽_q) = #E(𝔽_q) ≡ 0 mod 4.
- **Deleted case.** This is impossible by the ±(q+1) bound.
- **Repair.** §4.6 then repairs C₀.
- **Statement versus proof.** The route reads a_q(C₀) = c_q(f) from the proof of §3.4 rather than from its statement. It also follows from newform-quotient with newform-residual-representation, both listed in §5.6's *Needs*.

**§4.8 comparison.** NeronModelsAndSemistableAbelianVarieties §5.3h states N(E[ℓ]) = N_E^(ℓ)/∏q for ℓ≥5 with no irreducibility hypothesis. That is exactly “the prime-to-ℓ part of M₀ is N(E[ℓ])”.

**Downstream.** ErdosProgressionPowers §1.12 (its line 1194) states its comparison curve at conductor `deletionLevel … ell`, as the new sentence says.

**Other changed text.** §2.2, the Layer 3/4/5 introductions, “How to read the build” and both Dependencies lines are consistent with these targets. Every new backticked name is declared (`readme-ids-missing=0`).

### Sources: the seeded sample (15 of 15) and the new locators

The README flags no locator as unverified.

| Target | Locator | Lines in the cache | Supports the statement as written |
|---|---|---|---|
| 1.2 | Martin, Theorem 1 at k=2, Definitions 1A–1F, p. 2 | Martin2003 69–90 | Yes. c₂(2)=−1/4, c₃(2)=−1/3, δ(1)=1 |
| 1.3 | Martin, Theorem 1, p. 2 | Martin2003 69–71 | Yes |
| 1.7 | Kraus, §3.1, equation (9), p. 1144 | Kraus1997 279–283 | Yes. H = max(F, G), for every N |
| 3.3 | Kraus, §3.1, Theorem 3, p. 1144 | Kraus1997 249–258 | Yes. p≥5, irreducible, weight 2, p > F(N(ρ̄)), conductor N(ρ̄) |
| 4.2 | Kraus, Appendix II, Proposition 1, p. 1158 | Kraus1997 1060–1063 | Yes. k≥0, ideal J, bound μ(N)k/12 |
| 4.6 | Kraus, §3.3, final paragraph, p. 1146 | Kraus1997 435–441 | Yes. Degree ≤2 isogeny to a curve with full two-torsion; ℓ-torsion kept for ℓ odd |
| 6.0a | Lemos, §2, numerator table, p. 6 | Lemos2017 231–242 | Yes, for the five f_r (monic, degree r+1, nonzero constant term) |
| 6.0c | Darmon–Merel, Lemma 8.3, p. 23 | DarmonMerel2001 758 | Yes |
| 6.0e | Darmon–Merel, proof of Proposition 7.1, p. 20 | DarmonMerel2001 638–655 | Yes. Kolyvagin–Logachev gives finiteness from L(A_e,1)≠0 |
| 6.0h | Darmon–Merel, §8, pp. 22–23; Mazur, §1, pp. 135–138 | DarmonMerel2001 716–771; Mazur1978 as in review 22 | Yes |
| 6.8 | Darmon–Merel, Lemmas 8.2–8.3, pp. 22–23; Lemos, §3, p. 10 | DarmonMerel2001 725–771; Lemos2017 375–388 | Yes |
| 6.10 | Lemos, Theorem 2.3, p. 6 | Lemos2017 223–226 | Yes. End=ℤ, p>37, image not GL₂ implies nonsplit normalizer |
| 6.11 | Lemos, Proposition 2.1, p. 4; Theorem 2.3, p. 6 | Lemos2017 136–139, 181–184 | Yes. No non-CM hypothesis in Proposition 2.1 |
| 6.15 | Lemos, §2, pp. 6–7 | Lemos2017 231–260 | Yes. b=1 by monicity; t divides f_r(0) |
| 6.17 | Lemos, proof of Theorem 1.1 and j-lists, pp. 5–7 | Lemos2017 187–264 | Yes, for the finite j-lists. The trace route is the README's own |
| 3.4 (new) | BS, §2, Theorem 3 and the paragraph before Theorem 4, pp. 359–360; Kraus, §3.2, pp. 1144–1145 | BS2020 164–188, 208–213; Kraus1997 295–373 | Yes. BS works with ℓ≥3 from line 165; the paragraph before Theorem 4 begins on p. 359 at line 208 |
| 5.6 (new) | BS, §2, Theorem 4, p. 360; Kraus, §3.3, pp. 1145–1146 | BS2020 214–239; Kraus1997 374–441 | Yes. BS assumes irreducibility through “notation as in Theorem 3” and uses the majorant H, as §5.6 says |
| 4.8 (changed) | BS Theorems 3–4; Kraus Theorems 3–4 | BS2020 184–188, 235–239; Kraus1997 249–293 | Yes, for the two levels. The comparison itself comes from NeronModelsAndSemistableAbelianVarieties §5.3h |

### Adversarial table

The new rows were computed at this head by a scratch script: point counts over 𝔽_p, the group law over ℚ, μ, g⁺ by Martin's formula, and the thresholds. The carried rows cite review 22, whose computations stand for text this diff leaves untouched.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `sharpF` (1.5, new Lean body) | N=0, 1, 4, 11, 13, 15, 35, 47 | 0 (junk branch), 1, 1, 5.828=3+2√2, 1, 9, 3148.6=(1+√8)⁶, 46149=(1+2√2)⁸ | matches lines 245–247, 433, 690 |
| `sharpG` (1.6, new Lean body) | N=0, 1, 4, 11, 13, 15; every N≤3000 | 0, 4, 4, 19.928=13+4√3, 22.48, 34.798=25+4√6. Minimum over N≤3000 is 4 | matches lines 263–265, 690 |
| `sharpH` (1.7) and its new API bullet 4≤H♯ | N=0, 1, 4, 11, 15, 35 | 0, 4, 4, 19.928, 34.798, 3148.6. min H♯ ≥ min G♯ = 4, so H♯<ℓ forces ℓ≥5 | true |
| §1.5 junk clause | levels at which F♯ is applied | M₀≥1 (§§3.4, 5.6); N(E[ℓ]) (§§3.2–3.3); any N>0 (§1.8) | “positive” true, “deletion level” false: R01 |
| `deletionLevel` positivity (load-bearing, since sharpF 0 = 0) | every E | `algorithmicConductor_ne_bot` gives M≥1, and M₀ = M/∏(distinct q with q∥M) ≥ 1 | junk value never reached |
| `deletion_level_realization` Check 1 | 11a1 [0,−1,1,−10,−20], ℓ=11 | Δ=−11⁵, c₄=496, so M₀=11. a₂=−2 and (−4∣11)=−1, so E[11] is irreducible. F♯(11)=5.83<11, and C=E works | true |
| Check 2 | 11a1, ℓ=5 | M₀=1, F♯(1)=1<5. (5,5) has order 5, so E[5] is reducible | hypothesis excludes it |
| Check 3 | 26b1 [1,−1,1,−3,3], ℓ=7 | c₄=129, Δ=−2⁷·13 (coprime), M=26, M₀=13, g⁺(13)=0, F♯=1<7. (1,0) has order 7 | hypothesis excludes it |
| Check 4 | 141a1 [0,1,1,−12,2], ℓ=7 | c₄=592, Δ=3⁷·47, M₀=47. #E(𝔽₂)=5 gives a₂=−2, and (−4∣7)=−1, so E[7] is irreducible. F♯(47)=46149>7 with g⁺(47)=4 | threshold excludes it |
| §3.4 route constants | g⁺(N) for N≤10; min F♯ for g⁺≥1 | all 0, and g⁺(11)=1. 5.828 over N≤3000. F♯>μ/6 at every N≤3000 with g⁺≥1 | route sound |
| `deletion_level_full_two_realization` Check 1 | 15a1 [1,1,1,−10,−10] | Cubic 4x³+5x²−38x−39=(x+1)(x−3)(4x+13). c₄=481, Δ=3⁴·5⁴, M₀=15 for ℓ≥5. F♯=9, H♯=34.80. First prime above it is 37; C=E | true |
| Check 2 | 11a1, ℓ=23 | H♯(11)=19.93<23. (−4∣23)=−1. a₃=−1, so #C(𝔽₃)=5 is odd for every conductor-11 curve | FullRationalTwo E is needed |
| Check 3 | M₀=11 | Primes in (F♯, H♯]: 7, 11, 13, 17, 19. First prime above H♯ is 23, and 23<H_K=169 | true |
| §5.6 when ℓ∣M₀ | 76 primes 5≤ℓ<400, M₀=ℓm with m<200 | G♯(M₀) ≥ (√(ℓ+1)+1)² > ℓ, with 0 exceptions in 15124 pairs | hypothesis never holds when ℓ∣M₀; consistent with §5.6's last paragraph |
| §4.8 comparison | 11a1 at ℓ=5 and ℓ=11 | ℓ=5: M₀=1=N(E[5]). ℓ=11: M₀=11, whose prime-to-11 part 1 = N(E[11]) (§5.3h Check) | true |
| `dimension_comparison`, `martin_bound` (1.3–1.4) | review 22: every N≤1200 and N≤3000 | 0 mismatches; equality set {35} ∪ {primes ≡ 11 mod 12} | true (carried) |
| `localTerms` (1.1) | review 22 | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0) | carried |
| `norm_bound` (2.1) | review 22: ℚ(√2), x=3+√2, ℓ=7 | 7≤7≤19.49; fails for B=1.6 | carried |
| `deletionLevel`, `removed_prime_bound` (2.2) | review 22: 11a1, 14a1, 27a1, 141a1 | M₀ tables; bounds 1.628, 1.342, 1.539 (E[ℓ] reducible) | carried |
| `rationality_of_small_prime_coefficients` (3.1) | review 22: N=11, 23 | a₂ of level 23 lies in ℚ(√5)∖ℚ, so the hypothesis fails | carried |
| `integral_sturm_congruence` (4.2) | review 22: k=12, N=1, J=(2); k=0; J=(0), (1) | n≤1; only a₀ tested at k=0 | carried |
| 4.5 matrix selection | review 22 | 85 subgroups, 0 counterexamples | carried |
| Isogeny-degree theorems (5.0a–5.0b), `full_two_irreducible`, `rational_two_irreducible` | review 22: 49a1; 4ℓ and 2ℓ | 14, 12 listed; 20, 22, 28 not listed | carried |
| `rational_isogeny_j_tables` (6.0b), 6.12, 6.14 | review 22 | sets equal Lemos2017 lines 197–202 and 253–260 | carried |
| 6.0c–6.0h, 6.1, 6.4, 6.7 | review 22 | values as recorded there | carried |
| `nonsplit_of_not_surjective` (6.10) | review 22: p=41 | 2755200 = \|GL₂(𝔽₄₁)\| | carried |
| `lemos_integral_j` (6.11) | review 22: y²=x³−x at p=11; 11a1 | CM case included; j(11a1) is nonintegral | carried |
| 6.17 | review 22: j=576 | B_j=12 | carried |
| `lemos_surjectivity` (6.18) | review 22: y²=x³−x at p=43; n=1 | both hypotheses necessary | carried |

### Headline theorems and padding

**Stated in `Suggested.lean`:**
- Martin's formula and bound;
- the norm bound and the removed-prime bound;
- rationality from small prime coefficients and the ideal-congruence Sturm theorem;
- **the two deletion-level realizations (new);**
- the three isogeny-degree theorems and the j-tables in moduli form;
- both irreducibility theorems;
- the proper-image classification, j-integrality and Lemos's theorem.

**Named in the docstring as not statable:**
- Kraus's realizations at N(E[ℓ]) with Serre weight 2, and with them the §4.8 comparison, because the residual Artin conductor and the Serre weight are missing at the pins;
- the other headlines named in review 22.

**One-tactic probe.** A scratch copy replaced each `sorry` with `first | rfl | (simp; done) | infer_instance | (norm_num; done) | decide | (aesop; done)`. All 17 theorems failed, with 17 errors, one per theorem. So nothing is padding. `sharpF`, `sharpG` and `sharpH` are used only to state the two new headlines.

### Library declarations opened at the pins (this round)

| Library | Declaration | File and line |
|---|---|---|
| Tau Ceti | `WeierstrassCurve.algorithmicConductor` | `TateAlgorithm/Reduction/Conductor.lean:103` |
| Tau Ceti | `WeierstrassCurve.algorithmicConductor_ne_bot` | `TateAlgorithm/Reduction/Conductor.lean:115` |
| Mathlib | `Ideal.absNorm_eq_zero_iff` | `RingTheory/Ideal/Norm/AbsNorm.lean:398` |
| Mathlib | `CongruenceSubgroup.Gamma0` | `NumberTheory/ModularForms/CongruenceSubgroups.lean:80` |
| Mathlib | `Subgroup.index` | `GroupTheory/Index.lean:55` |

- `scratch/library-matches.md` shows no Loogle hit for `sharpF`, `sharpG` or `sharpH`, and no LeanSearch candidate states a Kraus threshold or a realization theorem.
- The library table of review 22 stands for the untouched declarations.

### Cross-roadmap citations resolved (this round)

- **SerreWeightAndLevelOptimisation** (via `roadmaps show`):
  - §6.1, line 1368;
  - §6.2, line 1400, which states a level-M₀ newform for ℓ≥3 and irreducible E[ℓ];
  - §6.3, line 1418;
  - §6.12, line 1671.
- **NeronModelsAndSemistableAbelianVarieties:** §5.3e, line 3628; §5.3h, line 3674, with no irreducibility hypothesis.
- **ErdosProgressionPowers** (`3e1048c`): §1.7 (line 1118), §1.12 (line 1194) and the EC.3 row (line 659), which cites §4.7.
- **EllipticModularityEffectiveComparisons:** still at `c90f56d`.
- **Tools.** `scratch/citations.md` and `scratch/overlaps.md` list nothing unresolved, no dropped id and no conflicting head.

### Ownership

- `roadmaps grep 'sharpF|sharpG|sharpH|deletion_level_realization|deletion_level_full_two'` finds no declaration outside this folder.
- **ErdosProgressionPowers.** Its `comparison_curve` is a specialization of §5.6. ErdosProgressionPowers is a consumer of EC.0–EC.6, so this roadmap owns the general statement.
- **EllipticModularityEffectiveComparisons.** Its duplication is R02.
- Ownership against open pull requests whose files the brief does not give was checked only through the `roadmaps grep` index.

### Declared gaps

- `gap:mixed-modular-jacobians` is untouched by the diff. Review 22's assessment stands: it is precise and minimal.

## Not verifiable

- **Kenku1982**, pp. 199–201, is recorded as uncertified (paywalled) and cited by its locator. The diff does not touch it.

## Source issues

- **Misprint** in BS2020 at §2, equation (3), p. 358: the source says ord_q(x) is the largest power of q dividing x; it should be the exponent of that power, as ℓ ∣ ord_q(Δ) requires; affects nothing.
- **Misprint** in Kraus1997 at Appendix II, Proposition 1, p. 1158: the source says χ has conductor N; it should be a character modulo N, since Proposition 2 applies it to trivial-character forms on Γ₀(M); affects nothing.
- **Gap** in BS2020 at §2, Theorem 4, p. 360: the source attributes realization at level M₀ to Kraus's Théorème 4; Kraus states it at N(ρ̄) with Serre weight 2, so Kraus's proof must be rerun at M₀; affects the proof.
