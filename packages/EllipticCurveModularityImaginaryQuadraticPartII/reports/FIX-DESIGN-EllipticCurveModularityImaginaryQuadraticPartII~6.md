# Repair of the EllipticCurveModularityImaginaryQuadraticPartII design, round 6

One review this round (`REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~5`), one finding
(P3). No `design/review.json` was present in the package; the verdict ("needs changes", one P3 finding)
is the one stated in the review report.

## F01 (P3) — applied differently

**Verified.** ArithmeticGaloisRepresentations at its open head, §7.7 "Finite-group cohomology and
descent" (README line 5097), paragraph "`SL₂` with adjoint coefficients" (line 5131): for `F` finite
of odd characteristic with `#F ≠ 5`, `H⁰(SL₂(F), ad⁰) = H¹(SL₂(F), ad⁰) = 0`. So the supplier already
states §3.1's vanishing for those fields, and §3.1 did not say so.

**Changed.** §3.1 (README and `plan.json` 3.1 `statement`): one clause added, roughly "for finite `k` of odd
characteristic with `#k ≠ 5` this is also ArithmeticGaloisRepresentations §7.7, stated there with
`H¹ = 0`, which is why it excludes `𝔽₅`. The statement here covers every field with `2 ∈ k^×`,
including `𝔽₅` and every infinite field of characteristic other than two."

**Why "differently".**
1. The suggested wording said the target covers "`𝔽₅`, its extensions" as cases §7.7 leaves out. But
   a finite extension `𝔽_{5^r}` with `r ≥ 2` has `#F = 5^r ≠ 5`, so §7.7 already covers it. What §7.7
   really leaves out is `𝔽₅` itself and every infinite field (characteristic zero, `𝔽̄₅`, and so on).
   The new clause says exactly that.
2. I did not add §7.7 to the *Needs:* line of §3.1 or to the `plan.json` 3.1 `prerequisites`, although
   the review asked for it. The route of 3.1 is the two commutators `UX − XU = [[c, −2a],[0, −c]]` and
   `UᵀX − XUᵀ = [[−b, 0],[2a, b]]`, and it never uses §7.7. Listing §7.7 there would make 3.1 wait for
   the Darmon–Diamond–Taylor computation of §7.7. A citation is not a need.

**Repairing the pattern** (the vanishing of invariants and the other §7.7 facts were used without a
citation):
- **Scope and ownership**, Layer 3 bullet: one clause saying how the kept variant differs from §7.7.
- **Supplier contract row** for ArithmeticGaloisRepresentations §7.7: now lists the vanishing for
  `#F ≠ 5`, odd characteristic, and the coefficient change `(M ⊗ k')^G = M^G ⊗ k'` (AGR line 5103).
  §3.2 Check 1, §4.1 Check 3 and the new citations rely on these.
- **§4.1 route**: `M^(SL₂) = (ad⁰)^(SL₂(𝔽₅)) ⊗ k = 0` now cites §3.1 at `𝔽₅` plus the coefficient
  change of §7.7. *Needs:* gains §3.1 and AGR §7.7. Check 3 cites §7.7 for `H¹(SL₂(𝔽₇), ad⁰) = 0`.
- **§4.3 route**: "the global invariants vanish" now gets the same citation. *Needs:* gains §3.1 and
  AGR §7.7.
- **Layer 4 Dependencies**: AGR §§4.3, 7.7.
- **`plan.json`**: 4.1 and 4.3 `prerequisites` gain `target:3.1` and
  `roadmap:ArithmeticGaloisRepresentations §7.7`. Test `exceptional_F7` cites §7.7. The AGR supplier
  `what` names the three §7.7 facts used.
- **Already correct, unchanged**: §3.2 (Needs and Check 1 already cite §7.7) and the Layer 3
  Dependencies (already name §7.7).

## Adversarial pass on the changed statements

Values computed by enumeration (`scratch/calc/h0.py`, pure Python: all `X = [[a,b],[c,−a]]` over
`𝔽_p` fixed by every element of `SL₂(𝔽_p)`, by `U` alone, and by `U` and `Uᵀ`).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 invariants vanish for `2 ∈ k^×` | `p = 3, 5, 7` (`#SL₂ = 24, 120, 336`) | `#H⁰ = 1, 1, 1`; fixed by `U` alone: `3, 5, 7` elements (the line `k e`); fixed by `U, Uᵀ`: `1, 1, 1` | holds; `U` and `Uᵀ` suffice | — |
| 3.1 hypothesis `2 ∈ k^×` | `p = 2` (`#SL₂ = 6`) | `H⁰ = {0, 1}`, 2 elements; fixed by `U` alone: 4 | needed, as Check 3 says | — |
| 3.1 commutators | `X = [[a,b],[c,−a]]` | `UX = [[a+c, b−a],[c, −a]]`, `XU = [[a, a+b],[c, c−a]]`, difference `[[c, −2a],[0, −c]]`; `UᵀX − XUᵀ = [[−b, 0],[2a, b]]` | both zero ⇒ `c = 0`, `2a = 0`, `b = 0` | — |
| New clause: split of coverage | finite `k`: `𝔽₃, 𝔽₅, 𝔽₇, 𝔽₉, 𝔽₂₅`; infinite: `ℚ`, `𝔽̄₅` | §7.7 hypothesis `#F ≠ 5`, odd characteristic: `𝔽₃, 𝔽₇, 𝔽₉, 𝔽₂₅` covered; `𝔽₅` not covered (`#F = 5`); `ℚ`, `𝔽̄₅` not finite, so not covered | §7.7 ∪ (𝔽₅ ∪ infinite fields with `char ≠ 2`) = all fields with `2 ∈ k^×` | the review's "its extensions" was corrected |
| §7.7 excludes `𝔽₅` because of `H¹` | `𝔽₅`, `𝔽₇` | `H⁰(SL₂(𝔽₅), ad⁰) = 0` (above), but §7.7 gives `dim H¹(SL₂(𝔽₅), ad⁰) = 1` (the review computed `Z¹, B¹, H¹ = 4, 3, 1`); `𝔽₇`: `3, 3, 0` | the exclusion is forced by `H¹`, not by `H⁰`, as the new clause says | — |
| §4.1 `M^(SL₂) = 0` | `k = 𝔽₂₅ ⊇ 𝔽₅`, group `SL₂(𝔽₅)` | `M^G = (ad⁰_{𝔽₅})^{SL₂(𝔽₅)} ⊗ k` by the §7.7 coefficient change (`M` 3-dimensional); the first factor has 1 element, so `M^G = 0`. 3.1 at `k` alone would give invariants of `SL₂(k)`, not of `SL₂(𝔽₅)` | the citation (3.1 at `𝔽₅` plus coefficient change) is the right one | citation added |
| §4.3 global invariants | `ρ̄(G_F)` conjugate in `GL₂(k̄)` to `SL₂(𝔽₅)` | `M^G ⊗ k̄ = (M ⊗ k̄)^G ≅ (ad⁰_{𝔽₅})^{SL₂(𝔽₅)} ⊗ k̄ = 0`, so `M^G = 0` | holds | citation added |
| §4.1 Check 3 | `SL₂(𝔽₇)`, `#F = 7 ≠ 5`, odd | §7.7: `H¹ = 0`; review's count `Z¹ = B¹ = 3` | holds | citation added |
| Supplier row, coefficient change | `k = 𝔽₅ ⊆ k' = 𝔽₂₅`, `M = ad⁰` | AGR §7.7 line 5103 states `(M')^G = M^G ⊗ k'` for fields `k ⊆ k'` and `M` finite-dimensional, any group | matches the row | row extended |

No Check or worked example uses an object whose definition changed: only citations and one
clarifying clause were added. The other 3.1 Checks (the action of `U`, of `diag(2, 3)`, characteristic
two, `(Ad U − 1)³ = 0`) were recomputed and are unchanged.

## Checks run

**Dependency check** (command as given in the brief), after all edits:

```
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2126 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The only new supplier edge is ArithmeticGaloisRepresentations §7.7, which the
roadmap already cited, and that roadmap is earlier in the merge order.

**Citation resolver** (`roadmaps resolve` on the edited README): it lists three leads, `LeHung26, §4.4`,
`OpenAI26, §9.4` and `CaptainSude26, §4`. All three are false positives: each is a manifest source id
followed by a section locator, not a roadmap citation. No Lean name was found missing. Earlier the tool
flagged `ResidualImage.adZeroRep`; that lead no longer appears. It is declared in ArithmeticGaloisRepresentations'
`Suggested.lean` at its head (line 385, `def adZeroRep {G : Type} [Group G] (r : G →* GL n k)`).

**Citations re-resolved this round** at the head of ArithmeticGaloisRepresentations:
- §4.3 "Sylow subgroups and `PSL₂`" (line 3206)
- §6.3 "The Tate curve and local Euler factors" (line 4203)
- §7.2 "Adjoint, trace pairing and Schur's lemma" (line 4557, *ContinuousRep.adZero* line 4570)
- §7.7 (line 5097)
- §7.9 "Adequate subgroups" (line 5242, `ResidualImage.adZeroRep` line 5248)

All the section numbers the README uses are unchanged. The line numbers moved against the review's
copy; the content did not.

**Overlaps** (`scratch/overlaps.md`): no open pull request changes this roadmap, no id it cites is
dropped, and no id is defined only by an open revision.

**`Suggested.lean` / elaboration.** The design stage plans no Lean file, and this round changed no Lean
name. So no `#check` comparison applied and none was run. The README still claims no Lean name of its
own.

**`sources.toml`**: unchanged. All sources used this round are in the manifest, and no
`needs-references.toml` was written.

**Gate failures listed in the brief**: none listed; nothing to repair.

## For the maintainer

- No name that other roadmaps cite changed. No section, layer or target was renumbered.
- §3.1 stays the owner of the vanishing for `𝔽₅` and for every infinite field with `2` invertible. For
  finite fields other than `𝔽₅` it overlaps ArithmeticGaloisRepresentations §7.7. It now says so in one
  clause, in its own text and in Scope and ownership.
- If a later round asks again for §7.7 in the *Needs:* line of §3.1, the reason it is absent is
  stated above: the route does not use §7.7.
- No suspicious instructions were found in the review text or the fetched roadmap text.
