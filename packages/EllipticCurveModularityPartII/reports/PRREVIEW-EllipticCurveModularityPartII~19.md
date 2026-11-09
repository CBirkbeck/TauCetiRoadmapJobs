# Review of EllipticCurveModularityPartII (pull request #1491 at ac022ff)

**Verdict:** needs changes

Incremental re-review of the 4 changed lines since `cd7c37d`. Both are README lines: §2.2's opening paragraph (line 346) and the Downstream consumers paragraph (line 1113). `Suggested.lean` is byte-identical to `cd7c37d`. The gate passes, the dependency check reports no problem, and the file elaborates with `sorry` as its only warning. Review 18's R01 and R02 are repaired. Its R03 concerns the pull-request description, not the folder, and it is carried below as R01 (P3, non-blocking). The repairs introduced no new defect.

## R01 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

Carried from review 18's R03 (first raised in review 11). The description has not changed on this point: `grep -c EffectiveComparisons` on it returns 0. No repair report marks this finding as not actionable.

**Location.** The pull-request description never names EllipticModularityEffectiveComparisons.

**Claim.** Two open roadmaps plan the same results. This roadmap is earlier in the merge order (`ORDER.txt` line 275, against line 285), so it is the owner. The description should say how the duplicate is resolved.

**Witness.** EllipticModularityEffectiveComparisons is at head `ba802e5` (it was `c001b88` at the previous review).
- Its README line 1707 says this roadmap "plans the same results under its own layer numbering" and lists its own counterparts for EC.0–EC.6.
- Its `Suggested.lean` still re-declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153) and `torsionRepresentation` (:169).
- It also states the same isogeny-degree, uniform-irreducibility, Cartan, j-table and Lemos theorems (:186–298).

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed before either pull request merges, or cut down to a consumer of this roadmap. As a consumer it would cite §§1.4, 1.5–1.8, 2.0, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18. §2.0 is added to the list because the torsion carriers now live there. Ownership stays here. No change to the folder.

**Settled, not re-raised.** `kato-labelled-pushforward` and `kato-labelled-reciprocity` are not in `design/plan.json`. GATE~11 H01 marked this not actionable in the package, and the reason still holds.

## Previous findings

- R01 — repaired: line 1113 now reads "§2.0's `GeometricTorsion` and `torsionRepresentation` and §5.1's `FullRationalTwo` (EC.6)". This agrees with §2.0 (line 308) and with §5.1's mapping sentence (line 613).
- R02 — repaired. Line 346 now reads "Define `deletionLevel E ℓ` as this roadmap's rendering of that M₀ … consumed together with it". Line 1113 adds "EC.1 carries `deletionLevel` with the bound … ErdosProgressionPowers §1.7 restates it on the same carriers".
- R03 — not repaired: the description still never names EllipticModularityEffectiveComparisons (now head `ba802e5`). Carried as R01.

## Verified sound

### Gate, dependency check and elaboration

**Gate**, rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff --stat cd7c37d..HEAD` shows a single file: the README, with 2 insertions and 2 deletions.

**Dependency check** (`--movable`):

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0. It gives exactly 15 `declaration uses sorry` warnings (lines 99, 104, 139, 162, 175, 186, 213, 219, 225, 239, 246, 257, 276, 284, 293) and nothing else.
- A scratch file with `#check @name` for all 27 declarations elaborates, and each type agrees with `scratch/signatures.md`.
- `deletionLevel : (E : WeierstrassCurve ℚ) → [E.IsElliptic] → ℕ → ℕ`.
- `removed_prime_bound` keeps `[Fact ell.Prime]`, `3 ≤ ell`, irreducibility, `p ≠ ell`, and the two `factorization p` hypotheses.
- Nothing changed in the Lean, so review 18's one-tactic probe and its import check still hold.

### The changed passages

**§2.2, line 346.**
- "SerreWeightAndLevelOptimisation §6.1 owns the reduced level M₀ … as a number": SerreWeightAndLevelOptimisation, at the head of its pull request, README line 1370. §6.1 defines M₀ arithmetically, for prime ℓ ≥ 3, as M divided by the q with `v_q(M)=1` and `ℓ∣v_q(Δ)`, with `q=ℓ` included. It gives no Lean name (line 1378 uses `Nat.primeFactors` and `padicValNat`). So "as a number" is accurate, and the rendering on `WeierstrassCurve` is not owned there.
- "consumed together with it": `removed_prime_bound` (Suggested.lean:162) is the only theorem stated on `deletionLevel` (:153).

**Downstream consumers, line 1113.**
- The labels EC.0–EC.5 match ErdosProgressionPowers' contract table at head `3e1048c`, README lines 655–661: §1.4, §2.2, §§1.5–1.8, §4.7, §§5.4–5.5 and §6.18.
- EC.6 (line 662) still cites §5.1 for all three carriers. This roadmap's §5.1 sentence at line 613 maps `GeometricTorsion`, `torsionModule` and `torsionRepresentation` to §2.0, so that citation stays valid.
- "ErdosProgressionPowers §1.7 restates it on the same carriers": its README line 1124 and `Suggested.lean:79–82` define `deletionLevel` on `algorithmicConductor ℤ E` and `minimalDiscriminantIdeal ℤ E`. They use `padicValNat` where this file uses `factorization`, and the two agree at every prime.
- "as its §1.12 restates the full-two-torsion predicate": its README line 1200 and `Suggested.lean:88–89` (`HasFullRationalTwoTorsion`, labelled "restated here only because this file cannot import another roadmap's module").
- The two files declare `deletionLevel` in different namespaces (`TauCetiRoadmap.EllipticCurveModularityPartII` and `TauCetiRoadmap.ErdosProgressionPowers`), so the fully qualified names do not collide.

### Sources: the seeded sample in the changed passages

Of the seeded targets, only "2.2 The removed-prime exponent bound" falls in a changed passage.

| Target | Source and locator | Lines in the cache | Supports the statement as written |
|---|---|---|---|
| 2.2 definition of M₀ | BS §2, equation (3), p. 358 | BS2020 163–175 (page 4 of the extraction = printed p. 358) | yes: E/ℚ with minimal discriminant Δ and conductor M, rational prime ℓ ≥ 3; the product runs over all primes q ∥ M with ℓ ∣ ord_q(Δ), and q = ℓ is not excluded |
| 2.2 `removed_prime_bound` | BS §2, Lemmas 2.1–2.2 and proof, p. 359 | BS2020 184–207 | yes: E[ℓ] irreducible (Theorem 3, line 184); p ≠ ℓ, p ∥ M, ℓ ∣ ord_p(Δ) ⇒ ℓ ≤ (√p+1)^((M₀+1)/6); the proof uses Lemma 2.1(ii), the bound [K:ℚ] ≤ g₀⁺(M₀) and Martin's Theorem 2, (4) |

The other seeded targets (1.2, 1.3, 1.5, 1.6, 3.3, 4.7, 4.8, 5.2, 6.0a, 6.0f, 6.0g, 6.4, 6.7, 6.11) are in untouched text. Review 18 verified 1.3, 4.7, 6.0f and 6.11 (its sample table), and reviews 14–17 verified the rest. The README flags no locator as unverified (grep: 0 hits).

### Adversarial table

The rows below were computed by a short script on the Weierstrass b-invariant formulas, at this head. They cover the changed statements, which are the §2.2 definition prose and the EC.1/EC.6 attribution.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `deletionLevel` = SerreWeightAndLevelOptimisation §6.1's M₀ (prime ℓ ≥ 3) | its Checks: M=33, (v₃,v₁₁)=(6,2), ℓ=3; M=141, (v₃,v₄₇)=(7,1), ℓ=3 and 7; M=45, (v₃,v₅)=(7,7), ℓ=7 | §6.1 values 11, 141, 47, 9; the body of Suggested.lean:153–156 gives 11, 141, 47, 9 | agree |
| same, on an actual curve | 141a1 `[0,1,1,−12,2]` | b₂=4, b₄=−24, b₆=9, b₈=−135, Δ=102789=3⁷·47, c₄=592 coprime to 141, so M=141; ℓ=3 → 141 (3∤7, 3∤1); ℓ=7 → 47 | agree with §6.1 line 1394 (M₀=141 ≠ N(E[3])=47), so M₀ is not the prime-to-ℓ conductor, as §2.2's layer introduction says |
| same, previous Checks recomputed | 11a1, 14a1, 27a1, 37b1 | Δ = −11⁵, −2⁶·7³, −3⁹, 37³; ℓ=5: 1, 14, 27, 37; ℓ=3: 11, 1, 27, 1; ℓ=2: 11, 7, 27, 37 | agree with §2.2 Checks 1–3 |
| junk ℓ ("for a natural number ℓ") | ℓ = 0, 1, 4 on 14a1 | ℓ=0: `0 ∣ n` only for n=0 and ord_q(Δ) ≥ 1 → 14; ℓ=1 → 1 (additive part); ℓ=4: 4∤6, 4∤3 → 14 | agree with API bullet 4; the ℓ=4 value is defined but §6.1 has no M₀ there (remark below) |
| this rendering = ErdosProgressionPowers' rendering | `M.factorization q` against `padicValNat q M` for q ∈ `M.primeFactors` | equal for every prime q (`Nat.factorization_def`); the D side is equal too, including the junk D=0, where both give 0 | the "same carriers" claim of line 1113 holds |
| `removed_prime_bound` with its hypotheses satisfied | 141a1, ℓ=7, p=3 (3 ∥ 141, 7 ∣ v₃(Δ)=7, 3 ≠ 7) | M₀=47; (√3+1)^(48/6) = 2.732⁸ = 3103.9 ≥ 7 | consistent with BS Lemma 2.2 |
| EC.6 attribution | `GeometricTorsion`, `torsionRepresentation`, `FullRationalTwo` | defined at §2.0 (README 308–326; Suggested.lean 112, 121) and §5.1 (README 615; Suggested.lean 230) | agree with line 1113 |

The rows for every other statement are those of review 18 (its adversarial table: §§1.1–1.7, 2.0, 2.1, 2.2's negative controls, 4.1, 4.4, 5.4–5.5, 6.0b, 6.0f, 6.1, 6.5, 6.10–6.14, Conventions Frobenius) and of reviews 14–17. Their statements and Lean are unchanged.

### Library declarations and citations resolved

- `WeierstrassCurve.algorithmicConductor` and `WeierstrassCurve.minimalDiscriminantIdeal`, both named in the changed line, are as tabulated in review 18 (Tau Ceti `TateAlgorithm/Reduction/Conductor.lean:103`, `MinimalModel/DiscriminantIdeal.lean:170`). The pin is unchanged, and the elaboration above resolves them.
- SerreWeightAndLevelOptimisation §6.1: resolved at the head of its pull request, line 1368.
- ErdosProgressionPowers §§1.7 and 1.12 and EC.0–EC.6: resolved at head `3e1048c`, lines 1118, 1194 and 649–662.
- EllipticModularityEffectiveComparisons: resolved at head `ba802e5`.
- `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped id. `roadmaps resolve` found no unresolved citation.
- The declared gap `mixed-modular-jacobians` appears in `design/plan.json` (supplier ModularCurvesPartII) and in README line 134, unchanged.

### Remarks on untouched text (no change requested)

- §2.2 line 346: "For ℓ≥3 it is the M₀ of §6.1 there". SerreWeightAndLevelOptimisation §6.1 defines M₀ only for prime ℓ ≥ 3, so at ℓ = 4 (14a1 → 14) there is no M₀ there to compare with. The sentence predates this change.
- On the ErdosProgressionPowers side, its §1.7 still gives `deletionLevel` its own API and Checks and does not cite §2.2. Its EC.1 row does not name `deletionLevel`. The merge order lists it at line 53, before this roadmap at line 275, although it consumes EC.0–EC.6. These are for that pull request to settle; this roadmap's dependency check is clean.

### Ownership against open work

- `deletionLevel`: owned here as the rendering consumed with §2.2. ErdosProgressionPowers restates it, and line 1113 now says so.
- EllipticModularityEffectiveComparisons duplicates Layers 1, 2, 5 and 6 (R01).
- Ownership against open pull requests whose files the brief does not give was not checked.

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §§5.0b and 5.2: uncertified (paywalled) and cited by its locator. Neither section changed at this head.

## Source issues

- **Misprint** in BS2020 at §2, equation (3), p. 358: the source says ord_q(x) is the largest power of q dividing x; it should be the exponent of that largest power, as ℓ ∣ ord_q(Δ) requires; affects nothing.
- **Gap** in BS2020 at proof of Lemma 2.2, p. 359: the source passes from ℓ dividing the norm of p+1∓c_p to ℓ bounded by it without noting that the norm is nonzero; it should note p+1∓c_p ≠ 0 since |c_p| ≤ 2√p < p+1; affects the proof.
