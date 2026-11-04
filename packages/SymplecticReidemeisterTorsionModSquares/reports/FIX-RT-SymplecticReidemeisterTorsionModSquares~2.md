# FIX-RT-SymplecticReidemeisterTorsionModSquares~2

Two reviews were merged. Pass a F02 and pass b F01 are the same finding, and so are pass a F03 and pass b F02. Each pair is settled once below, and the duplicate heading points to it. Only `packages/SymplecticReidemeisterTorsionModSquares/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Review A (RT r2a), finding F01.

Verified. Sp₀ is trivial, so H₃(BSp₀;ℤ)/2=0, while H¹(𝔽₃,μ₂) has two elements. The supplier's own statement also excludes rank zero: KTheoryFiniteLocalFields §1.9 says "Let q be odd and r ≥ 1", and its Lang checks say "rank zero has no degree-three class and is excluded".

Changes:
- §3.6 API bullet: "For every odd finite field it is the … isomorphism" → "For every odd finite field and every symplectic rank r≥1 …; at r=0 its source is zero and it is the zero map."
- §3.6: added the rank-zero 𝔽₃ negative-control Check.
- Same pattern in §5.2's Check: the lift is now made "at any rank r≥1; rank zero lifts only the trivial class".
- Other occurrences already carried r≥1 and were left as they are: §5.1, §6.x, §7.2, §7.3 and Conventions line 91.

## F02 (P3) — applied

Review A (RT r2a), finding F02.

Same finding as review B F01. Verified: AlgebraicTopology Stage 6 on main has items 0–5 only, and "6.4.1" occurs nowhere in it.

Changes, following pass a's finer split:
- §2.2 Needs: "Stages 6.1–6.4.1" → "Stage 6.1". This target uses only cochains.
- §4.7 Needs: same change, "Stages 6.1–6.4.1" → "Stage 6.1". This target uses only cochains.
- §2.3 Needs: "Stages 6.1–6.4.1" → "Stages 6.1–6.4", since this target transports Poincaré duality.

Pass b's uniform "6.1–6.4" is also a correct reading. The narrower one is used because it lists exactly what each statement needs.

## F03 (P2) — applied

Review A (RT r2a), finding F03.

Same finding as review B F02. Verified: AlgebraicTopology Stage 5 item 2 (main, lines 868–869) gives the Wang sequence with endomorphism `id - f_*` only, with no intertwiner. Stage 6.1 (line 1037) gives the local-coefficient Mayer–Vietoris sequence of a binary open cover. The witness holds: for f=id with intertwiner −I, T=−1 and 1−T=2I, while id−f_* is 0.

Changes:
- Supplier contract for Stage 5: now "constant-coefficient Wang cone … id − f_*". It says that §4.6 derives the twisted triangle from Stage 6.1's Mayer–Vietoris sequence, and records the witness.
- Scope line: "Wang/transfer" → "the constant-coefficient Wang sequence, finite-cover transfer".
- §4.6: new paragraph making the two-cylinder local-coefficient Wang comparison part of the target, naturally in the intertwiner. The route now uses that triangle.
- §4.6: added the f=id, −I Check (h=0, θ=det 2I₄=16, a square; the untwisted model would give h=4).
- §4.6 Needs: Stage 5 → Stage 6.1. Layer 4 Dependencies: Stage 5 dropped.
- §7.6 route: now cites §4.6's local-coefficient triangle. §7.6 already Needs §4.6.
- §7.2 keeps Stage 5 for transfer, which is correct.

## F04 (P3) — applied

Review A (RT r2a), finding F04.

Verified: both Checks only restated their definitions.

§4.7 Check replaced by the explicit instance over ℚ: a₁=a₂=b₂=I₂, b₁=diag(2,1/2), φ(b₁)=e₁.
- Recomputed: ρ(R)=I₂ and φ(R)=e₁+b₁(−b₁⁻¹e₁)=0. b₁−1=diag(1,−1/2) is invertible, so the hypothesis holds.
- The correct value is φ(b₁⁻¹)=−e₁/2.
- Without the minus sign the value is e₁/2, and the relator gives 2e₁≠0.
- Without the inverse the value is −e₁, and the relator gives e₁−2e₁=−e₁≠0.

§1.4 Check "any complex of K² terms" replaced by a computed one:
- K² in degree −1 has χ=−2; its shift to degree 0 has χ=+2.
- An odd shift therefore keeps parity but changes the sign of χ, which tests the shift and Euler-characteristic bullets.

## F01 (P3) — applied

Review B (RT r2b), finding F01.

See review A F02 (same three lines, same repair).

## F02 (P2) — applied

Review B (RT r2b), finding F02.

See review A F03. Pass b's route wording was adopted in substance: two cylinders meeting in two copies of Σ, with the intertwiner identifying the second restriction with T.

## Adversarial pass on changed text

| Statement | Instances | Values | Result |
|---|---|---|---|
| §3.6 isomorphism, r≥1 | r=0 over 𝔽₃; r=1 over 𝔽₃ and 𝔽₅ | r=0: 0 → C₂, not onto. r=1: H₃(Sp₂(𝔽₃);ℤ)/2 = C₂ → [−1]; over 𝔽₅ → [2] | Restricted to r≥1; Check added |
| §5.2 lift Check | 𝔽₃, r=0 and r=1 | r=0: image {1}. r=1: image {1,[−1]} | Restricted |
| §4.6 local Wang triangle | f=id with M=I; f=id with M=−I; Gaussian system | M=I: 1−T=0, h=4. M=−I: 1−T=2I, h=0, θ=16, a square. Gaussian: x⁴+1, det(1−T)=2 | Consistent with §4.6 and §7.6 Checks |
| §7.6 χ½ via triangle | T=1, dim H¹=4 | H⁰(M_f)=0, H¹=4, χ½=−4=−h | Consistent |
| §4.7 inverse Check | as above | −e₁/2 vs e₁/2 vs −e₁; relator values 0, 2e₁, −e₁ | Discriminating |
| §1.4 shift Check | K²[−1]; K²[0] | χ=−2; +2 | Discriminating |

## Checks run

- Elaboration: `lake env lean packages/SymplecticReidemeisterTorsionModSquares/Suggested.lean`
  - Exit 0. Only warning: `40:8: declaration uses 'sorry'`.
  - The file is unchanged this round.
- `#check @TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares.zassenhaus_primary_formula` in a scratch copy:
  - The elaborated type carries every binder: `Field K`, `Invertible 2`, `AddCommGroup V`, `Module K V`, `FiniteDimensional K V`, `Q`, `hQ`, `A`, `b`, `hU`.
  - It agrees with §4.1. No change.
- Dependency check:

```text
depcheck: 56 roadmaps, 643 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.

## Notes for the maintainer

- No Lean name changed, and no supplier gap was added. No later roadmap is cited.
- The new local-coefficient Wang comparison is owned here (§4.6). AlgebraicTopology on main states only the constant-coefficient sequence. It is consumed only inside this roadmap.
- An unrelated slip, outside this round's findings, was left untouched: the §7.3 route writes "sylow-witt-lift" where the gap slug is `gap:witt-sylow-lift`.
- No suspicious instructions were found in the reviews.
