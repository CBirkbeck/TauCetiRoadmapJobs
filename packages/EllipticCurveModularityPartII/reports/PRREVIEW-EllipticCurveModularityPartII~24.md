# Review of EllipticCurveModularityPartII (pull request #1491 at 79a07e1)

**Verdict:** needs changes

This is an incremental re-review of the 9 changed lines since `9d8c599`. All of them are in the README; `Suggested.lean` is byte-identical to `9d8c599`.
- Review 23's R01 is repaired, and the repair introduces no new problem.
- One non-blocking finding remains: R01 (P3), carried from review 23's R02. It concerns only the pull-request description. The folder needs no change.

## R01 (P3) — The description still does not say what happens to EllipticModularityEffectiveComparisons

This is carried from review 23's R02, first raised in review 11.
- The description is unchanged at this head: `grep -c EffectiveComparisons` on it returns 0.
- The latest repair reply (on `79a07e1`, its H02) answers the finding as "the pull-request description, which this job does not edit". It does not mark it `not actionable in this package`, so the finding is not settled and is carried.
- Its reason is correct about the folder, which needs no change.

**Location.** The pull-request description, including its depends-on and merge-order blocks, never names EllipticModularityEffectiveComparisons.

**Claim.** EllipticModularityEffectiveComparisons plans the same objects as this roadmap. This roadmap is earlier in the merge order (`ORDER.txt` line 275, against line 285), so it is the owner. The other roadmap must cite it or close. Only the description must state that settlement.

**Witness.** EllipticModularityEffectiveComparisons is still at `c90f56d`.
- Its README line 1707 says this roadmap "plans the same results under its own layer numbering".
- Its `Suggested.lean` declares `martin_sharp_bound` (:88), `integral_ideal_sturm` (:108), `torsionRepresentation` (:169) and `lemos_uniform_surjectivity` (:298).

**Repair.** In the description, add one sentence. It says that EllipticModularityEffectiveComparisons is closed before either pull request merges, or is cut down to a consumer of this roadmap.

Review 23's list of sections for that consumer covered only the ErdosProgressionPowers contract items and was too narrow. A consumer cites this roadmap for everything it restates:

| EllipticModularityEffectiveComparisons | This roadmap |
|---|---|
| Layer 0 (Martin) | §§1.1–1.4 |
| Layer 1 (removed-prime bounds) | §§2.1–2.2 |
| Layer 2 (Kraus thresholds) | §§1.5–1.7 |
| Layer 3 (realization, ideal Sturm, deletion-level adapter) | Layers 3–4, including §4.8 |
| Layer 4 (cyclic isogenies, uniform irreducibility) | §§5.0a–5.5 |
| Layer 5 (surjectivity, including its §5.25 j-tables at 11, 17, 37) | Layer 6, including §6.0b |

Tested at `c90f56d`: its layer headings (README lines 134–1685) pair with these layers. The pairing is by layer, not section by section. No change to this folder is needed.

## Previous findings

- R01 — repaired: README line 239 now reads "Every theorem below that compares F♯ with ℓ or with a majorant does so at a positive level: … §1.8; … N(E[ℓ]) … §§3.2–3.3 and, through H♯, §4.7; … M₀ … §3.4 and, through H♯, §5.6."
- R02 — not repaired: the description is unchanged (0 hits for EffectiveComparisons). The repair reply's H02 answers it without the not-actionable marker. It is carried as R01.

## Verified sound

### Gate, dependency check and elaboration

**Gate.** Rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate (`scratch/gate.md`) also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** (`--movable`):

```text
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exits 0 in 12 s. Its only messages are 17 `declaration uses sorry` warnings. The file has no `variable`, `include` or `set_option`.

### The changed passages, line by line

**§1.5 API bullet (line 239).** Every use of a threshold after Layer 1 was listed with `grep -n -E 'F♯|G♯|H♯|sharp[FGH]'`: 27 lines. Each comparison of F♯ with ℓ or with a majorant falls at a level the bullet names:
- **§1.8, line 289:** F♯(N) ≤ F_K(N) for N>0.
- **§3.2, line 397, and §3.3, line 405:** F♯(N) with N the prime-to-ℓ conductor of E[ℓ].
- **§3.4, line 421:** F♯(M₀).
- **§4.7, lines 534 and 538:** H♯(N), and through it F♯(N), at the same N as §3.3.
- **§5.6, lines 681 and 685:** H♯(M₀), and through it F♯(M₀).

The other hits are:
- Layer intros (lines 384, 446) and Examples (lines 431–434, 504, 567, 691–694);
- §4.4 (lines 496–500), which uses G♯ only, at N(E[ℓ]);
- the new §2.2 bullet.

In `Suggested.lean`, `sharpF` and `sharpH` are applied only at `deletionLevel E ell` (lines 209, 294).

**"The identities of §1.7 hold at every N, N=0 included."** At N=0 every max-identity of §1.7 holds: sharpH(0) = max(0,0) = 0, 0 ≤ 0 twice, and 0<ℓ ↔ (0<ℓ ∧ 0<ℓ). The positivity bullet 4 ≤ H♯(N) is stated for N>0 only and is not an identity, so it is not claimed at N=0.

**§2.2 API bullet (line 350): M ≥ 1, hence M₀ ≥ 1.** A scratch copy of `Suggested.lean` proves this in Lean. `example (E : WeierstrassCurve ℚ) [E.IsElliptic] (ell : ℕ) : 0 < deletionLevel E ell` elaborates with no error. The proof uses:
- M ≠ 0 from `Ideal.absNorm_eq_zero_iff.not.2 (WeierstrassCurve.algorithmicConductor_ne_bot ℤ E)`;
- `Finset.prod_dvd_prod_of_subset` with `Nat.prod_primeFactors_dvd`, so the deleted product divides M;
- `Finset.prod_pos` and `Nat.div_pos` to finish.

This is exactly the README's route. The same scratch file closes `sharpF 0 = 0 ∧ sharpH 0 = 0` by `simp [sharpF, sharpH, sharpG]`, so the bullet's junk values are the actual Lean values.

**Supplier contracts (lines 35 and 41) and the Layer 2 Dependencies line (line 380).** The two new declarations exist at the pins with the stated hypotheses:

| Library | Declaration | File and line | Elaborated hypotheses |
|---|---|---|---|
| Mathlib `1b1ccf4` | `Ideal.absNorm_eq_zero_iff` | `RingTheory/Ideal/Norm/AbsNorm.lean:398` | `[CommRing S] [IsDedekindDomain S] [Ring.HasFiniteQuotients S]`, `absNorm I = 0 ↔ I = ⊥`. This matches "a Dedekind domain with finite quotients, such as ℤ". |
| Tau Ceti `2fd255d` | `WeierstrassCurve.algorithmicConductor_ne_bot` | `AlgebraicGeometry/EllipticCurve/TateAlgorithm/Reduction/Conductor.lean:115` | A Dedekind `O` whose localisations at height-one primes have perfect residue fields; the conclusion is `algorithmicConductor O W ≠ ⊥`. Over ℤ the instance resolves, since residue fields are finite. |

The pin has no standalone lemma stating that `absNorm (algorithmicConductor ℤ E)` is positive. `one_lt_absNorm_algorithmicConductor_iff` (Conductor.lean:251) derives it inline at line 255 from the same two declarations. So citing the pair is minimal.

### Sources: the seeded sample where it meets the change

Of the seeded targets, only §1.5 lies in the changed text.
- **§1.5 locator.** Kraus, §3.1, equation (7), p. 1143 is Kraus1997 lines 239–244.
- **What it supports.** F(n) is defined for integers n ≥ 1, with the square root of μ(n)/6 plus one raised to 2g₀⁺(n). Theorem 3 (lines 249–258, p. 1144) applies it at the conductor of the residual representation.
- **Verdict.** This supports the statement as written: F♯ is defined at positive levels, the value at 0 is a convention, and §§3.2–3.3 apply it at N(E[ℓ]).
- **Untouched sampled targets.** The other 14 (1.4, 1.6, 3.4, 4.2, 4.3, 6.3, 6.5, 6.8, 6.10, 6.11, 6.13, 6.14, 6.15, 6.16) are untouched. Their locators stand as verified in reviews 22 and 23.

### Adversarial table

The new rows were computed at this head. The carried rows cite review 23 (and review 22 through it), whose computations stand for text this diff leaves untouched.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §1.5 level list (changed) | 11a1 at ℓ=11; 11a1 at ℓ=5; 14a1 at ℓ=3; §1.8 at N=1 | ℓ=11: M₀=11, F♯(11)=3+2√2≈5.828; N(E[11])=1, F♯(1)=1. ℓ=5: M₀=1, F♯(1)=(√(1/6)+1)⁰=1, not the junk 0. 14a1, ℓ=3: M₀=1. N=1: F♯=F_K=1 | every listed level ≥ 1; the list is complete for F♯ (27 grep hits classified) |
| §1.5 "identities of §1.7 at N=0" (changed) | N=0 | sharpH(0)=max(0,0)=0; sharpF(0)=0≤0; sharpG(0)=0≤0; 0<ℓ ↔ 0<ℓ∧0<ℓ. Lean: `sharpF 0 = 0 ∧ sharpH 0 = 0` by `simp` | true |
| §2.2 M ≥ 1 ⇒ M₀ ≥ 1 (changed) | 11a1 at ℓ=5 and ℓ=1; 14a1 at ℓ=3; 14a1 at ℓ=0; Lean, for all E and ℓ | 11a1, ℓ=5: M=11, deleted product 11, M₀=1. ℓ=1: M₀=1. 14a1, ℓ=3: M=14, product 2·7=14, M₀=1. ℓ=0: nothing deleted, M₀=14. Lean: `0 < deletionLevel E ell` proved | minimum value is 1; 0 is never reached |
| `Ideal.absNorm_eq_zero_iff` contract (changed) | ℤ | elaborated type as in the table above; the instance is found for ℤ in the probe | matches the sentence |
| `algorithmicConductor_ne_bot` contract (changed) | ℤ, E/ℚ | `algorithmicConductor ℤ E ≠ ⊥`; the perfect-residue-field instance resolves | matches the sentence |
| `sharpF`, `sharpG`, `sharpH` (1.5–1.7) | review 23: N=0, 1, 4, 11, 13, 15, 35, 47 | 0, 1, 1, 5.828, 1, 9, 3148.6, 46149 (F♯); min G♯ over N≤3000 = 4 | carried |
| `deletion_level_realization` (3.4) | review 23: 11a1 at ℓ=11 and 5; 26b1 at ℓ=7; 141a1 at ℓ=7 | as recorded there | carried |
| `deletion_level_full_two_realization` (5.6) | review 23: 15a1; 11a1 at ℓ=23; M₀=11; 15124 pairs with ℓ∣M₀ | as recorded there | carried |
| `dimension_comparison`, `martin_bound` (1.3–1.4) | review 22: N≤1200 and N≤3000 | 0 mismatches; equality set {35} ∪ {primes ≡ 11 mod 12} | carried |
| `localTerms` (1.1), `norm_bound` (2.1), `deletionLevel`, `removed_prime_bound` (2.2) | review 22 | as recorded there | carried |
| `rationality_of_small_prime_coefficients` (3.1), `integral_sturm_congruence` (4.2), 4.5 matrix selection | review 22 | as recorded there | carried |
| 5.0a–5.0b, `full_two_irreducible`, `rational_two_irreducible`, 6.0b–6.18 | review 22 | as recorded there | carried |

### Headline theorems and padding

`Suggested.lean` is unchanged since `9d8c599`. Review 23's headline list, its docstring check and its one-tactic probe stand: all 17 theorems failed to close, so nothing is padding. Review 23's `#check @…` comparison of all 32 declarations also stands. This round re-ran `#check` on `sharpF`, `sharpH` and `deletionLevel`, with the same types (`ℕ → ℝ`, `ℕ → ℝ`, and `(E : WeierstrassCurve ℚ) → [E.IsElliptic] → ℕ → ℕ`).

### Ownership, overlaps and gaps

- **Ownership.** The diff adds no target, definition or supplier citation of another roadmap, so the ownership check reduces to R01.
- **Overlaps.** `scratch/overlaps.md` and `scratch/citations.md` list no dropped id, no revision-only id and no conflicting head.
- **Gaps.** `gap:mixed-modular-jacobians` is untouched.

## Not verifiable

- **Kenku1982**, pp. 199–201, is recorded as uncertified (paywalled) and cited by its locator. The diff does not touch it.

## Source issues

- none
