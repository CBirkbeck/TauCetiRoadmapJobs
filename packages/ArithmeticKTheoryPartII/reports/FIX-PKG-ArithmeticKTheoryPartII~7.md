# Repair report: ArithmeticKTheoryPartII, round 7

Review settled: REV-PKG-ArithmeticKTheoryPartII~6 (two findings, both P3). I checked both against the roadmap's own text and the cached FGV author copy, and applied both. Only `packages/ArithmeticKTheoryPartII/README.md` changed (4 lines). `Suggested.lean`, `metadata.toml`, `sources.toml` and the plan's `gaps` are unchanged.

## F01 (P3) — applied

Old (§8.6, third Check): "For d = 0 the empty partition has characteristic number 1 …" → new: for d = 0 the only partition is empty and s is the number of points of X(ℂ): 1 for Spec ℚ, 2 for Spec ℚ(i). Reading X(ℂ) as connected (s = 1) fails for Spec ℚ(i). The antecedent is false, so nothing is asserted. Both values are p-units, so the Bernoulli hypothesis cannot be dropped.

How I verified it:

- §8.6 assumes only that X/ℚ is smooth projective of dimension d (README line 1022). X = Spec ℚ(i) satisfies this: it is étale over ℚ, so it is smooth, and it is finite over ℚ, so it is projective. A = E ×_ℚ X, for any elliptic curve E/ℚ with its principal polarization, is a principally polarized abelian scheme over it.
- X(ℂ) = Hom(ℚ(i), ℂ) has two points, so the empty product 1 ∈ H⁰ integrates to 2.
- FGV states Theorem 8.1 for a complex variety defined over ℚ (FGV lines 2206–2219), which is the geometrically connected case. There the value is 1. The README's statement is wider, so the old Check was wrong for it.
- The repair goes beyond the review's suggested wording in one respect. Since 1 and 2 are units at every odd p, the instance X = Spec ℚ also shows that the conclusion fails without the Bernoulli antecedent. I added this as the Check's negative control.

Pattern search: I searched the README and `Suggested.lean` for "characteristic number", "empty partition", "d = 0", "connected" and X(ℂ). No other Check, example or worked example evaluates a characteristic number on a zero-dimensional or disconnected base. Layer 8's Examples cite only the partition 11 at p = 691, and that value is unchanged.

## F02 (P3) — applied

Old → new, appending each contract that a *Needs* line names to its layer's Dependencies:

- Layer 0: "SchemeKTheoryOperations §§6.1, 6.9–6.11" → "… §§6.1, 6.9–6.11 and its duality-transfer contract".
- Layer 7: "KTheoryFiniteLocalFields §§1.1–1.2" → "… and its sphere-unit contract".
- Layer 8: "GeneralizedCohomology G5.4–G5.6 and TopologicalKTheory T4–T5, T7" → "GeneralizedCohomology G5.4–G5.6 and its topological-symplectic-Hodge contract; TopologicalKTheory T4–T5, T7".

How I verified it:

- A script compared every *Needs* item of all 45 *Needs* lines with its layer's Dependencies block, checking supplier names and every "its … contract" or "’s … contract" phrase.
- Before the repair it found exactly the three omissions the review names, and nothing else. After the repair it finds none.
- Five contracts are named in *Needs* lines: full-cyclotomic-cover (Layer 0), duality-transfer (Layer 0), Bernoulli nonvanishing (Layer 3), sphere-unit (Layer 7) and topological-symplectic-Hodge (Layer 8). Two of the five were in their blocks before the repair; all five are now.
- Each of the three added contracts is a declared supplier gap under "Exact supplier contracts", with an identical entry in the plan's `gaps`:
  - `gap:duality-transfer` (SchemeKTheoryOperations §6.11);
  - `gap:sphere-unit-finite-field` (KTheoryFiniteLocalFields §§1.1–1.2);
  - `gap:topological-symplectic-hodge` (GeneralizedCohomology G5.4–G5.6).

  No gap was added or changed.

## Checks

- **Elaboration:** I ran `lake env lean packages/ArithmeticKTheoryPartII/Suggested.lean` from the content checkout. It exits 0, and its only messages are "declaration uses `sorry`" at 52:8 and 95:8. No `TauCeti.*` import is used, so nothing had to be built.
- **Signatures:** I put `#check @` for all four declarations (`exists_split_prime_with_signs`, `conjugateFractionalIdeal`, `IsSkewCMLine`, `exists_cm_lines_with_ideal_product`) in one scratch copy and elaborated it once.
  - Every binder is present: p, n, `Nat.Prime p`, `p ≠ 2`, `0 < n`, `Field`, `NumberField`, `IsCyclotomicExtension {p ^ n} ℚ K`, `IsCMField`, ε, Φ with its hypothesis `τ ∈ Φ ↔ τ ∘ conj ∉ Φ`, and `L ≠ 0`.
  - Each type agrees with the README statements in §§2.3–2.4 and with the worker's signature file.
  - Nothing changed, since the Lean file was not edited.
- **Supplier direction:**

```text
depcheck: 246 roadmaps, 2258 edges, 0 problem(s)
```

  Exit 0, with no UPWARD, CYCLE or moved line.
- **Citations:** `roadmaps resolve` on the README reports "Lean names found nowhere: None". No cross-roadmap citation is missing.
- **Overlaps and ownership:** I introduced no new construction, citation target or supplier. The three added Dependencies items repeat contracts that the *Needs* lines and supplier contracts already declared. So there is no new ownership question, and no open pull request drops an id cited here.
- **Gate failures:** none were listed for this round.
- **Sources:** I needed no new source and did not write `needs-references.toml`.

## Adversarial record

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §8.6 d = 0 Check (changed) | X = Spec ℚ; X = Spec ℚ(i) | #Hom(ℚ,ℂ) = 1, so s = 1; #Hom(ℚ(i),ℂ) = 2 (i ↦ ±i), so s = 2 | Old value 1 wrong for Spec ℚ(i) | Check rewritten |
| Hypotheses of §8.6 at Spec ℚ(i) | smoothness, projectivity, dimension, ppav | étale over ℚ (separable, char 0); finite, so projective; Krull dimension 0; A = E ×_ℚ X principally polarized | Genuine instance | None |
| Plausible wrong model: connected X(ℂ) | Spec ℚ(i) | connected reading gives 1; correct value 2 | Excluded by the Check | Added to the Check |
| Negative control: drop the Bernoulli antecedent | p = 3, 5, 691; X = Spec ℚ, Spec ℚ(i) | v_p(1) = 0 and v_p(2) = 0 at every odd p, so s ∉ pℤ_(p) | Antecedent is necessary | Added to the Check |
| §8.6 implication at d = 0, divisible degree | X = Spec of the cubic subfield of ℚ(ζ₇), p = 3 | s = 3 ∈ 3ℤ_(3) with a false antecedent | No conflict: the theorem is an implication | None |
| §8.6 theorem against the new Check | disconnected X | s is additive over the components of X(ℂ); the statement assumes no connectedness; FGV's variety setting (FGV lines 2206–2217) is the connected subcase | Consistent | None |
| §8.6 first Check, Layer 8 Examples (same object, recomputed) | n₁ = 11, p = 691 | B₁₂ = −691/2730; 11 < 691; numerator divisible by 691 | Agree | None |
| §8.6 second Check (same object, recomputed) | p = 3, part 3 | ch₃(L) = c₁(L)³/6, v₃(6) = 1, so not a 3-unit | Agree; outside n_j < p | None |
| Layer 0 Dependencies | §§0.1–0.5 *Needs* | contracts named: 2; in the block: 1 before, 2 after | Fixed | duality-transfer added |
| Layer 7 Dependencies | §§7.1–7.7 *Needs* | contracts named: 1; in the block: 0 before, 1 after | Fixed | sphere-unit added |
| Layer 8 Dependencies | §§8.1–8.6 *Needs* | contracts named: 1; in the block: 0 before, 1 after | Fixed | topological-symplectic-Hodge added |
| Layers 1–6 Dependencies | all *Needs* items | missing supplier or contract items: 0 (Layer 3's Bernoulli nonvanishing contract is present) | Complete | None |
| Gap correspondence | 3 added contracts | duality-transfer ↔ `gap:duality-transfer`; sphere-unit ↔ `gap:sphere-unit-finite-field`; topological-symplectic-Hodge ↔ `gap:topological-symplectic-hodge`; README and plan: 14 = 14 slugs | Declared | None |

## For the maintainer

- No name changed, and no id of this roadmap moved or was dropped. Other roadmaps are unaffected.
- No mathematical statement or Lean declaration changed. The only changes are one Check of §8.6 and three Dependencies lists.
- The review's "For the human reviewers" items (the FGV author-page licence, and `charney1987` being uncertified) were not acted on, as the brief directs.
- I found no suspicious instructions in the review text.
