# Review of LocalPurity (pull request #1807 at fba76a5)

**Verdict:** needs changes

This is an incremental re-review of the 50 lines that changed since `450496e`. One P3 finding stands, and it is not blocking. The repair of the previous R02 lists the right properties in the §0.9 contract but states their direction backwards. Everything else the diff touches checks out, and so does the pull request description: the separatedness step of §2.2, the corrected Layer 1 example, the dimension-two step of §2.1, the provenance paragraph and the deleted contract names. The gate passes on this folder. Its only failing count, `outside-folder=26`, is the 13 sibling folders this pull request owns, two files each.

## R01 (P3) — The repaired §0.9 contract says the properties go from a finite stage to the limit

**Location.** `TauCetiRoadmap/LocalPurity/README.md:277-279`: "the properties proper, finite, étale and closed immersion of a morphism between them are inherited from a finite stage, Lemmas 32.13.1 (081F), 32.8.3 (01ZO), 32.8.10 (07RP) and 32.8.5 (01ZP)".

**Claim.** A morphism over the limit takes these properties from a finite stage: if some `f_i` is finite, proper, étale or a closed immersion, then so is `f`.

**Witness.**
- 01ZO (stacks-limits lines 836-839) says the converse. If `f` is finite and `f_0` is locally of finite type, then some `f_i` is finite. The same holds for 081F (line 1512), 07RP (line 910) and 01ZP (line 861).
- The direction the README states is only stability under base change. It says nothing about `Y_W → W`.
- §2.2 (`README.md:755-756`) uses the other direction: "make `Y_W → W` proper, finite or étale when `Y` is, after shrinking `W`".

**Repair.** Replace "are inherited from a finite stage" by "hold at some finite stage whenever they hold for the morphism over the limit".

Tested on 01ZO's instance as §2.2 uses it. `Y → Spec 𝒪_{S,s}` is finite, `Spec 𝒪_{S,s} = lim W` over the affine neighbourhoods `W` of `s`, and `Y_W` is of finite presentation over `W`. The repaired clause gives `Y_W → W` finite for `W` small enough, which is the step §2.2 takes. Applied to the diagonal, the closed-immersion clause gives 01ZQ.

The supplier uses the same phrase (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:972`, and line 863 on main). That folder's own review has to settle it there. This contract says what LocalPurity assumes, so it should state the direction LocalPurity uses.

## Previous findings

- R01 — repaired: the description now says LocalPurity "now takes these facts from Tau Ceti directly (`TauCeti.isRegularRing_of_isRegularLocalRing`, …)". It also has a LocalPurity paragraph: a `From Tau Ceti` contract replaces Layer 0, and §1.3 owns 05EL/05ER/05EU and 0EII/0EKP.
- R02 — partly repaired: the contract now lists 01ZM, 081F, 01ZO, 07RP and 01ZP. *spread_from_localScheme* derives separatedness from the diagonal (01ZQ), and both unused names are gone. But "are inherited from a finite stage" reverses the direction (R01 above).
- R03 — repaired: Example 3 now reads "For `char k ≠ 2`, … étale at every prime not containing `z` … ramified at the prime `(z)` over the curve `x = 0`". It adds that in characteristic 2, "`B` is étale at no prime; it is excluded as well".

## Verified sound

**Gate, build and dependency check.**
- The worker's gate passes at this head, build included.
- My rerun reports 0 on every check except `outside-folder=26`.
- `git diff --name-only origin/main...HEAD` lists 26 files outside `LocalPurity/`. They are 13 owned folders × 2 files. The brief's diff command, which excludes all 14 folders, lists nothing.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives exactly 4 `sorry` warnings, at lines 34, 45, 58 and 69.
- Dependency check output: `depcheck: 234 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

**Lean form, signatures and padding.**
- `Suggested.lean` is byte-identical to `450496e` (`git diff 450496e..HEAD` is empty for it).
- I elaborated `#check @` for all 4 declarations again in one scratch file. The types are those in the previous report: same binders, `2 ≤ ringKrullDim A`, `Module.IsTorsionFree A B`, `[IsNoetherian X]` and `[IsLocallyNoetherian X]`. No section binder is lost. Nothing changed.
- The previous one-tactic probe stands for the unchanged file: `simp`, `rfl`, `infer_instance` and `exact?` close none of the four. The four are the README's end theorems (line 37), and no statable headline is absent.

**Changed passages, checked one by one.**
- §0.9 contract (`README.md:274-279`).
  - Locators: 01ZM = Lemma 32.10.1 (stacks-limits 1094), 081F = 32.13.1 (1512), 01ZO = 32.8.3 (836), 07RP = 32.8.10 (910) and 01ZP = 32.8.5 (861).
  - The four properties are a subset of the list at SchemeAndStackFoundations §0.9 (head, lines 968-975; main, 859-864). The hypotheses "cofiltered, affine transition maps, qcqs" match Situation 8.1 (stacks-limits 823-827) and 01ZM (1094-1097).
  - Direction: R01.
- *spread_from_localScheme* route (`README.md:752-760`).
  - 01ZQ = Lemma 32.8.6 (stacks-limits 870-875), whose proof applies 01ZP to the diagonal, as the README says.
  - `Y_W` and `Y_W ×_W Y_W` are of finite presentation over the affine `W`, hence quasi-compact and quasi-separated, so Situation 8.1 holds. The base change of `Δ_{Y_W/W}` to `Spec 𝒪_{S,s}` is `Δ_{Y}`.
  - "Local on the base" matches the proof of 0EY3 (stacks-limits 2638-2642). 0EY3 (1) lists separated, proper, finite and étale (2629-2631), as the target does.
  - 01ZQ has no other owner: `roadmaps grep 01ZQ` finds only this README and #1808's copy of it.
- §2.1, dimension-two step (`README.md:712-715`).
  - `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` (`TauCeti/RingTheory/RegularLocalRing/Purity.lean:75-79`) takes `Ideal.under A q ≠ maximalIdeal A → Algebra.IsUnramifiedAt A q` and normality at maximal ideals.
  - A Lean probe confirms that `Algebra.IsEtaleAt A q` gives `Algebra.IsUnramifiedAt A q` by `inferInstance`. Both are `abbrev`s of `FormallyEtale`/`FormallyUnramified` of `Localization.AtPrime q` (`Mathlib/RingTheory/Etale/Locus.lean:35`, `Mathlib/RingTheory/Unramified/Locus.lean:47`).
  - Normality at every prime implies normality at the maximal ideals. So the hypotheses of (2) give Tau Ceti's, as the README says.
- Mathlib contract (`README.md:157-158`, `180-181`).
  - `IsRegularRing` is at `Mathlib/RingTheory/RegularLocalRing/Defs.lean:93`.
  - `IsRegularLocalRing.of_isRegularRing_of_isLocalRing` and `Algebra.HasGoingDown` now occur nowhere in the README.
  - `Algebra.IsUnramifiedAt` is now used at lines 714 and 729.
- Provenance (`README.md:880-883`).
  - `TauCeti/AlgebraicGeometry/PuncturedSpectrum.lean:36-37` and `TauCeti/AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean:36-37` record the port at `9a20b3f`.
  - The GitHub compare `9a20b3f...d28f90d` reports "ahead" by 18 commits and behind by 0 (2026-10-18 vs 2026-11-04), so "later commit" is right.
  - The four files in the table are among the 57 entries of `library/Pcf/Stacks/Purity/` at `d28f90d`.
- Pull request description: every sentence about LocalPurity matches the head.
  - It no longer consumes PurityOfBranchLocus, which now appears only as a consumer (line 861).
  - On main it cites PurityOfBranchLocus §0.3 for 0AFS (main README lines 33 and 287).
  - Suggested.lean states both clauses of 0BMA, 0EY7 and the codimension-two extension.
  - The merge-order block says "`LocalPurity`: **this pull request** → #1808 → #1854", which agrees with the overlap report.

**Seeded sample.**
- The sample targets 1.1-1.4 are untouched; the previous review verified their locators (SGA 2 X 3.1-3.2; 0BM7; 0BL6; 0BM9; 0BLK; 0BM8; 05EL-05EU; 0EII; 0EKP; 0BLS; 0BLM).
- 2.1 changed without a new locator.
- In 2.2 I re-read 0BQ5 (stacks-limits 2571-2626) and 0EY3 (2627-2645) against the new text. Both agree.
- The README flags no locator as unverified.

**Overlaps and citations.**
- The overlap report lists no dropped id and no id that only an open revision defines. #1808 and #1854 are ordered after this pull request in the generated block.
- The citation resolver's two leads are `Suggested.lean`'s own declarations, and both elaborate.
- The diff adds no cross-roadmap citation. The §0.9 citation resolves on main and at this head.

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.9 contract, property clauses (changed) | 01ZO with `f = (Y → Spec 𝒪_{S,s})` finite | source: `f` finite ⇒ `∃ i, f_i` finite (limit → stage). README: "inherited from a finite stage" (stage → limit), which is base change and holds for every `i` | direction reversed | R01 |
| §0.9 contract, list and hypotheses (changed) | §0.9 at head and on main | {proper, finite, étale, closed immersion} ⊂ {flat, smooth, étale, proper, finite, closed immersion, open immersion, isomorphism}; qcqs `S_i`, affine transitions = Situation 8.1 | consistent | none |
| *spread_from_localScheme*, separated clause (changed) | `S = 𝔸²_k`, `s = 0`, `U = S ∖ {0}`; `Y` = `Spec 𝒪_{S,s}` with the closed point doubled | `U ∪ W = S` for every `W ∋ 0`, so `U′ = S`. `Δ_{Y_W}` goes between finitely presented `W`-schemes and base-changes to `Δ_Y`. Doubled point: `Δ_Y` is not closed, so no `Y_W` is separated (separatedness is stable under base change) | route right; negative control consistent | none |
| *spread_from_localScheme*, gluing the property (changed) | `{U, W}` covering `U ∪ W` | `P|_U` holds by hypothesis, `P|_W` by §0.9; separated, proper, finite and étale are each local on the base | matches 0EY3 proof | none |
| Layer 1 Example 3, `char k ≠ 2` (changed) | `k = 𝔽_3`, `ℚ` | `B = A[z]/(z²−x) ≅ k⟦z,y⟧`. `q ∌ z`: `x = z²` and `2z` are units, so standard étale. `(z)` lies over `(x)` with `e = 2`. `Ω_{B/A} = B/(2z) = k⟦y⟧`, supported on `{(z), (z,y)}`; only `(z)` lies over `U` | true as written | none |
| Layer 1 Example 3, `char k = 2` (changed) | `k = 𝔽_2` | `Ω_{B/A} = B·dz ≅ B`, and `Ω ⊗ κ(q) = κ(q) ≠ 0` at every `q`; the generic fibre `k((x,y))(√x)` is purely inseparable of degree 2. `B` is normal and torsion free but étale nowhere | excluded, as stated | none |
| §2.1, `d = 2` step (changed) | Lean probe | `IsEtaleAt A q ⊢ IsUnramifiedAt A q` by `inferInstance`: elaborates. Tau Ceti asks `under ≠ 𝔪 → IsUnramifiedAt` and normality at maximal ideals; (2) gives `under ≠ 𝔪 → IsEtaleAt` and normality at every prime | hypotheses implied | none |
| Provenance (changed) | pin and GitHub | `9a20b3f` at both modules' lines 36-37; compare: ahead 18, behind 0; 4 of 4 table files present at `d28f90d` | true | none |
| §1.1 `PurityHolds`, restriction (untouched; r56) | a field `k`; `ℤ_(3)`; `k⟦x,y⟧` | field: `U = ∅`, purity holds, not faithful (`dim = 0`). `ℤ_(3)[√3]`: disc 12 ∈ 3ℤ_(3). `k⟦x,y⟧`: `Γ(U) = A`, `U` not affine | Checks hold | none |
| §1.2 *restrictPuncturedSpec_essSurj* (untouched; r56) | dim 0, 1, 2 | dim 0: `Spec 0 ↦ ∅`. dim 1: `Γ(V) = ℚ(√3)` is not finite. dim 2: `A×A ↦ U⊔U` | holds; quasi-inverse needs dim ≥ 2 | none |
| §1.2 exclusions (untouched; r56) | `A×A/𝔪`; `A[z]/(z²−x)` | `x·(0,1) = 0`, so not torsion free; `e = 2` at `(z)` | both excluded | none |
| §1.3 *FormalGlueData*, *formalGlueing_equiv* (untouched; r56) | `S = 0`; `ℤ_(p) → ℤ_p`; `α₂₁ = −1`; `k[x] → k`; `M = k[x]/(x−1)` | `H⁰ = ℤ_(p)`; `H⁰ = 0` without the cocycle; `H⁰(Can k[x]) ≠ k[x]`; `M⊗S = 0` | hypotheses needed | none |
| §1.3 0EII, 0EKP, 0BLI (untouched; r56) | `k⟦x,y,z⟧, g = z`; `k⟦x,y⟧, g = x`; `k[x]` vs `k⟦x⟧`; `dim A/fA = 0` | depth `R/zⁿ = 2`; `y⁻¹ ∈ lim`; `1/(1−x) ∉ k[x]`; closure `∅` | consistent (0BLI slip recorded in r56) | none |
| §1.4 0BLS, 0BLM (untouched; r56) | `k⟦x,y,z⟧, f = z`; complete normal, dim 3, depth 2 | `H¹_𝔪 = H²_𝔪 = 0`; `H²_𝔪` of finite length, killed by `fⁿ` | true | none |
| §2.1 headlines (1), (2) (statements untouched; r56) | `d = 1, 2, 3`; `k[x²,xy,y²]_0`; `B = 0`, `A×A`, `A×A/𝔪` | `d = 1`: disc 12, excluded by `hd`. `d = 3`: `A/z` regular of dim 2, depth 3. Non-regular: closed fibre of length 3 ≠ 2. `A×A/𝔪` fails the torsion-free binder | consistent | none |
| §2.2 0EY7 and codimension-two headlines (untouched; r56) | `Spec ℤ_(3)`; `𝔸²∖0`; `𝔸³∖L`; `𝔸²∖V(x)` | purity fails at the closed point of `ℤ_(3)`; dims 2 and 3 extend; `V(x)` has generic dim 1, so the hypothesis fails | true | none |
| Convention 5 (untouched; r56) | `k⟦x,y⟧`, `A×A/𝔪` | finite, normal, étale off `𝔪`, `¬Flat` | correction right | none |

**Library declarations opened at the pins for this round.**
- Tau Ceti: `RegularLocalRing/Purity.lean:75`, `AlgebraicGeometry/PuncturedSpectrum.lean:36` and `FiniteEtale/PuncturedSpectrum.lean:36`.
- Mathlib: `Etale/Locus.lean:35`, `Unramified/Locus.lean:47`, `RegularLocalRing/Defs.lean:52,93,115` and `KrullDimension/Regular.lean` (`ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_jacobson`, elaborated).

**Remarks on untouched text and other folders (no change asked).**
- SchemeAndStackFoundations §0.9 (line 972 at this head, 863 on main) uses the same reversed "inherited from a finite stage" wording. That is for its own review.

## Not verifiable

- #1808 and #1854: I did not compare their LocalPurity edits at the git level. Their order after this pull request is stated in the generated merge-order block. #1808 carries an older copy of the 01ZQ sentence (its line 629), which it will have to rebase.

## Source issues

- **Misprint** in stacks-limits at Lemma 32.20.4 (0EY3), p. 54: the source takes the open `U′` with `U ⊂ U′ ⊂ X`; it should be `U ⊂ U′ ⊂ S`, the ambient scheme of Lemma 32.20.3; affects nothing.
- **Misprint** in stacks-limits at the proof of Lemma 32.8.6 (01ZQ), p. 20: the parenthetical remark that begins "This is permissible" is never closed; it should end with a closing parenthesis before the end-of-proof mark; affects nothing.
