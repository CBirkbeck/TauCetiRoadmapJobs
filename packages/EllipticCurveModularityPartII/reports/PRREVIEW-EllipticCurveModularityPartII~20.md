# Review of EllipticCurveModularityPartII (pull request #1491 at 86f110e)

**Verdict:** needs changes

This is an incremental re-review of the 2 changed lines since `ac022ff`. The change is one README line, §2.2's opening paragraph (line 346).
- `Suggested.lean` is byte-identical to `ac022ff`: `git diff --stat ac022ff..HEAD` on it is empty.
- The gate passes, and the dependency check reports no problem.
- The file elaborates with `sorry` as its only warning.
- The new sentence is correct: SerreWeightAndLevelOptimisation §6.1 defines M₀ only for a prime ℓ ≥ 3, and so does Bennett–Siksek's equation (3).
- The repair introduced no new defect.

The only finding is review 19's R01, which concerns the pull-request description, not the folder. It is carried below (P3, non-blocking).

## R01 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

This is carried from review 19's R01, which carried review 18's R03 (first raised in review 11).
- `grep -c EffectiveComparisons` on the description still returns 0.
- No repair report marks the finding as not actionable. The FIX-RT and GATE~1–12 reports were searched: GATE~12 mentions that roadmap only for its §5.3a duplicate of §6.0f, and gives no ruling.

**Location.** The pull-request description never names EllipticModularityEffectiveComparisons.

**Claim.** Two open roadmaps plan the same results. This roadmap is earlier in the merge order (`ORDER.txt` line 275, against line 285), so it is the owner. The description should say how the duplicate is resolved.

**Witness.** EllipticModularityEffectiveComparisons is unchanged at head `ba802e5`.
- Its README line 1707 says this roadmap "plans the same results under its own layer numbering" and maps EC.0–EC.6 to its own §§0.16, 1.6, 2.1–2.3, 3.17, 4.21–4.22, 5.28 and 4.0.
- Its `Suggested.lean` re-declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153) and `torsionRepresentation` (:169).
- It also restates the isogeny-degree, irreducibility, Cartan, j-table and Lemos theorems (:186–298).

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed before either pull request merges, or cut down to a consumer of this roadmap. As a consumer it would cite §§1.4, 1.5–1.8, 2.0, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18. Ownership stays here. No change to the folder.

**Settled, not re-raised.** `kato-labelled-pushforward` and `kato-labelled-reciprocity` are not in `design/plan.json`. GATE~11 H01 marked this not actionable in the package, and the reason still holds.

## Previous findings

- R01 — not repaired: the description still never names EllipticModularityEffectiveComparisons (head `ba802e5`, README line 1707, `Suggested.lean` :53–:298). Carried as R01.

## Verified sound

### Gate, dependency check and elaboration

**Gate**, rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate (`scratch/gate.md`) also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff --stat ac022ff..HEAD` shows a single file: the README, with 1 insertion and 1 deletion.

**Dependency check** (`--movable`):

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exits 0 with exactly 15 messages. All 15 are `declaration uses sorry`, at lines 99, 104, 139, 162, 175, 186, 213, 219, 225, 239, 246, 257, 276, 284 and 293.
- A scratch copy with `#check @name` for all 27 declarations elaborates. Each of the 27 elaborated types occurs verbatim, up to whitespace, in `scratch/signatures.md`.
- The two declarations behind the changed line:
  - `deletionLevel : (E : WeierstrassCurve ℚ) → [E.IsElliptic] → ℕ → ℕ`.
  - `removed_prime_bound` keeps `[Fact (Nat.Prime ell)]`, `3 ≤ ell`, irreducibility of `torsionRepresentation E ell`, `p ≠ ell`, and the two `factorization p` hypotheses.
- Nothing changed in the Lean, so no binder is lost and review 18's one-tactic probe and import check still hold.

### The changed passage (§2.2, line 346)

The new text is "For a prime ℓ≥3 it is the M₀ of §6.1 there, which defines M₀ only for such ℓ; at any other ℓ the same formula is the definition and claims nothing beyond the facts below."

- **"defines M₀ only for such ℓ".** SerreWeightAndLevelOptimisation is at head `0825d40`. Its §6.1 heading is README line 1367, and its definition at line 1369 is stated "for an elliptic curve E/Q … and prime ℓ≥3", with q=ℓ included. The primary source agrees: Bennett–Siksek §2 introduces M₀ for a rational prime ℓ ≥ 3 (BS2020 lines 164–175, printed p. 358).
- **"at any other ℓ the same formula is the definition".** The Lean body (`Suggested.lean:153–156`) has no ℓ restriction. Its docstring makes no claim about §6.1. The four API bullets are stated "for every ℓ" and hold at ℓ = 0, 1, 2, 4 and 9 (table below).
- **The consumer of the identification.** `removed_prime_bound` (`Suggested.lean:162`, README line 360) assumes `[Fact ell.Prime]` and `3 ≤ ell`. That is exactly the range in which the deletion level is identified with §6.1's M₀. The *Needs:* line (362) and the supplier contract (line 110, "For prime ℓ≥3") use the same range, so nothing that cites §2.2 now relies on the identification outside it.
- **The README Checks at ℓ = 2.** The 14a1 Check at ℓ = 2 (line 356, M₀ = 7) uses the formula outside §6.1's range. The new sentence now says explicitly that such a value is defined by the formula, not imported from §6.1.
- **Other citers.**
  - Line 1113 (EC.1 "carries `deletionLevel` with the bound") makes no claim about ℓ outside the bound's range.
  - ErdosProgressionPowers (head `3e1048c`) restates `deletionLevel` at its README line 1124 and `Suggested.lean:79` on the same carriers. Its line 1127 identifies it with a residual conductor only for ell ≥ 5, under extra hypotheses, so the change does not contradict it.

### Sources: the seeded sample in the changed passage

None of the 15 seeded targets (1.3, 1.6, 2.1, 3.2, 4.5, 4.7a, 5.0b, 5.1, 5.4, 6.0f, 6.1, 6.5, 6.11, 6.13, 6.15) falls in the changed line, which is in §2.2. They are in untouched text that reviews 14–18 verified. The README flags no locator as unverified or uncertified (grep: 0 hits). The one locator in the changed line was re-read:

| Target | Source and locator | Lines in the cache | Supports the statement as written |
|---|---|---|---|
| 2.2 definition of M₀ | BS §2, equation (3), p. 358 | BS2020 163–175. Extraction page 4 begins at line 133 with printed page 358. | yes: E/ℚ with minimal discriminant Δ and conductor M, and a rational prime ℓ ≥ 3. The product runs over all primes q ∥ M with ℓ ∣ ord_q(Δ), and q = ℓ is not excluded. So the source, like SerreWeightAndLevelOptimisation §6.1, defines M₀ only for prime ℓ ≥ 3, as the new sentence says. |

### Adversarial table

The rows below were computed by a short script at this head, from the Weierstrass b-invariant formulas (Δ and c₄) and the formula of `Suggested.lean:153–156`. They cover the changed statement and the theorem that consumes it.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| "for a prime ℓ≥3 it is the M₀ of §6.1" | SerreWeightAndLevelOptimisation §6.1's Checks (its lines 1385–1391): M=33 with (v₃,v₁₁)=(6,2) at ℓ=3; M=141 with (v₃,v₄₇)=(7,1) at ℓ=3 and ℓ=7; M=45 with (v₃,v₅)=(7,7) at ℓ=7 | §6.1 gives 11, 141, 47, 9; the body of `deletionLevel` gives 11, 141, 47, 9 | agree |
| same, on an actual curve | 141a1 `[0,1,1,−12,2]` | Δ = 102789 = 3⁷·47 and c₄ = 592, with gcd(592,141) = 1, so both primes are multiplicative and M = 141. At ℓ=3 the result is 141 (3∤7, 3∤1); at ℓ=7 it is 47 | agree with §6.1 line 1393 (M₀ = 141 at ℓ = 3) |
| same, the README's Checks | 11a1, 14a1, 27a1, 37b1 at ℓ = 3 and 5 | Δ = −11⁵, −2⁶·7³, −3⁹ and 37³. At ℓ=3 the values are 11, 1, 27, 1; at ℓ=5 they are 1, 14, 27, 37 | agree with §2.2 Checks 1–4 (lines 355–358) |
| "§6.1 defines M₀ only for such ℓ" | ℓ = 0, 1, 2, 4, 9 | SerreWeightAndLevelOptimisation line 1369 and BS2020 line 165 both restrict to a prime ℓ ≥ 3, so neither assigns a value at these ℓ | true; the sentence no longer identifies `deletionLevel` with §6.1 at ℓ = 4, which review 19 remarked on |
| "at any other ℓ the same formula is the definition and claims nothing beyond the facts below" | ℓ = 0, 1, 2, 4, 9 on 11a1, 14a1, 27a1, 141a1, 37b1 | ℓ=0: 11, 14, 27, 141, 37 (`0 ∣ n` only for n = 0, and ord_q(Δ) ≥ 1 at bad q). ℓ=1: 1, 1, 27, 1, 1. ℓ=2: 11, 7, 27, 141, 37. ℓ=4: 11, 14, 27, 141, 37. ℓ=9: 11, 14, 27, 141, 37 (27a1: 9 ∣ 9 but ord₃(M) = 3) | agree with API bullet 4 (ℓ=0 gives M, ℓ=1 gives the additive part) and with bullet 1 (each value divides M, and each quotient M/M₀ ∈ {1, 2, 3, 11, 14, 37, 141} is squarefree and multiplicative) |
| `removed_prime_bound` stays inside the identified range | 141a1, ℓ=7, p=3: 3 ∥ 141, 7 ∣ v₃(Δ) = 7, and 3 ≠ 7 | M₀ = 47, and (√3+1)^((47+1)/6) = (√3+1)⁸ = 3103.92 ≥ 7. At ℓ=3 no admissible p exists: p=3 is excluded by p ≠ ℓ, and 3 ∤ v₄₇(Δ) = 1 | consistent with BS Lemma 2.2; the hypotheses `Fact ell.Prime` and `3 ≤ ell` match the new sentence's range |

The rows for every other statement are carried forward unchanged, because their statements and Lean are unchanged:
- review 19: the rendering against ErdosProgressionPowers' rendering, junk ℓ on 14a1, and the EC.6 attribution;
- review 18: §§1.1–1.7, 2.0, 2.1, 2.2's negative controls, 4.1, 4.4, 5.4–5.5, 6.0b, 6.0f, 6.1, 6.5, 6.10–6.14, and the Frobenius convention of the Conventions;
- reviews 14–17.

### Library declarations and citations resolved

- `WeierstrassCurve.algorithmicConductor` and `WeierstrassCurve.minimalDiscriminantIdeal`, both named in the changed line, are as tabulated in review 18: Tau Ceti `TateAlgorithm/Reduction/Conductor.lean:103` and `MinimalModel/DiscriminantIdeal.lean:170`. The pin is unchanged, and the `#check` file above resolves them.
- Citations re-resolved at the heads of their pull requests:
  - SerreWeightAndLevelOptimisation §6.1 at `0825d40`, lines 1367–1397;
  - ErdosProgressionPowers §1.7 at `3e1048c`, lines 1124–1131;
  - EllipticModularityEffectiveComparisons at `ba802e5`.
- `scratch/overlaps.md` lists no pull request that changes this roadmap and no dropped id. `roadmaps resolve` found no unresolved citation.
- The declared gap `mixed-modular-jacobians` (supplier ModularCurvesPartII) is unchanged.

### Remarks on untouched text (no change requested)

- **"§6.1 there"** follows the parenthetical citation of BS directly. Bennett–Siksek also has a §6, a character-sum section containing Proposition 6.1 (BS2020 lines 489–499), so "there" can be misread as BS.
  - The phrase is word-for-word from the previous head, and review 19 read it as SerreWeightAndLevelOptimisation §6.1.
  - The paragraph's first sentence names that roadmap's §6.1, and the new clause is true under either reading.
  - Writing "the M₀ of SerreWeightAndLevelOptimisation §6.1" would remove the ambiguity.

### Ownership against open work

- `deletionLevel`: owned here as the rendering consumed with §2.2. ErdosProgressionPowers restates it, and line 1113 says so.
- EllipticModularityEffectiveComparisons duplicates Layers 1, 2, 5 and 6 (R01).
- Ownership against open pull requests whose files the brief does not give was not checked.

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §§5.0b and 5.2: uncertified (paywalled) and cited by its locator. Neither section changed at this head.

## Source issues

- **Misprint** in BS2020 at §2, equation (3), p. 358: the source says ord_q(x) is the largest power of q dividing x; it should be the exponent of that largest power, as ℓ ∣ ord_q(Δ) requires; affects nothing.
