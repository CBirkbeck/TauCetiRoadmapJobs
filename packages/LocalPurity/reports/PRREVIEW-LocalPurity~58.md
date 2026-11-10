# Review of LocalPurity (pull request #1807 at d18ec2a)

**Verdict:** accepted

This is an incremental re-review of the 14 changed lines since `fba76a5`, and it has no findings. The change is the repair of the previous R01 in the SchemeAndStackFoundations §0.9 contract (`TauCetiRoadmap/LocalPurity/README.md:274-281`). It now states the direction that Stacks Limits proves and that §2.2 uses: a property holds at some finite stage whenever it holds over the limit. `Suggested.lean` is byte-identical to `fba76a5`.

## Previous findings

- R01 — repaired: "for a morphism between schemes of finite presentation over some `S_i`, each of the properties proper, finite, étale and closed immersion holds for its base change to some `S_j` over `S_i` whenever it holds for its base change to the limit".

## Verified sound

**Gate, build and dependency check.**
- The worker's gate passes at this head, build included.
- My bare rerun reports 0 on every check except `outside-folder=26`.
  - Those 26 files are the 13 sibling folders this pull request owns, two files each: AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology, PadicFunctionalAnalysis, PurityOfBranchLocus, ReductiveGroups, RigidAnalyticGeometry, SchemeAndStackFoundations and TopologicalKTheory.
  - The brief's diff command, which excludes all 14 folders, lists nothing.
- `git diff fba76a5..HEAD` touches only `TauCetiRoadmap/LocalPurity/README.md` (8 insertions, 6 deletions).
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` exits 0. Its only output is 4 `sorry` warnings, at lines 34, 45, 58 and 69.
- Dependency check output: `depcheck: 229 roadmaps, 2125 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

**Lean form and signatures.**
- I elaborated `#check @` for all 4 declarations again, in one scratch copy. The types are exactly those of the previous report:
  - `2 ≤ ringKrullDim A` together with `[IsRegularLocalRing A]`;
  - `[Module.Finite A B] [Module.IsTorsionFree A B]`, normality at every prime, and `Ideal.under A q ≠ maximalIdeal A → Algebra.IsEtaleAt A q`;
  - `[IsNoetherian X]` with `PurityHolds` at every `x ∉ U`;
  - `[IsLocallyNoetherian X]` with regular stalks of dimension `≥ 2` off `U`.
- No section binder is lost.
- The file is unchanged, so the earlier one-tactic probe stands (r56, r57): `simp`, `rfl`, `infer_instance` and `exact?` close none of the four. The four are the README's end theorems (lines 37-38). No statable headline is absent, and nothing is padding.

**The changed passage, checked against the source.** I read Situation 8.1 at stacks-limits lines 823-827: a directed inverse system with affine transition maps, with `S_0`, `X_0` and `Y_0` quasi-compact and quasi-separated.
- Each clause's locator and direction:
  - 01ZO is Lemma 32.8.3 (lines 836-839): `f` finite and `f_0` locally of finite type give some `f_i` finite.
  - 01ZP is Lemma 32.8.5 (lines 861-864): the same for closed immersions.
  - 07RP is Lemma 32.8.10 (lines 910-916): `f` étale and `f_0` locally of finite presentation give some `f_i` étale.
  - 081F is Lemma 32.13.1 (lines 1512-1517): the same for proper, with `f_0` locally of finite type.
  - All four go from the limit to a stage, as the repaired sentence now says. The order "proper, finite, étale, closed immersion" pairs with 081F, 01ZO, 07RP, 01ZP in that order.
- The hypotheses the new wording supplies are enough:
  - A scheme of finite presentation over a quasi-compact quasi-separated `S_i` is itself quasi-compact and quasi-separated.
  - A morphism between schemes locally of finite presentation over `S_i` is locally of finite presentation, which covers hypothesis (2) of every lemma.
  - "Some `S_j` over `S_i`" is the source's `i ≥ 0`.
- The 01ZM clause (Lemma 32.10.1, lines 1094-1109: (1) objects descend, (2) morphisms descend, (3) equality descends) is unchanged in substance. "Over the limit" now makes its scope explicit.
- How §2.2 uses the contract (`README.md:755-761`), against the new wording:
  - The finite stages are the affine neighbourhoods `W` of `s`. Their limit is `Spec 𝒪_{S,s}` and the transition maps are affine.
  - `Y_W → W` and the diagonal `Y_W → Y_W ×_W Y_W` are morphisms between schemes of finite presentation over `W`. Their base changes to the limit are `Y → Spec 𝒪_{S,s}` and `Δ_Y`.
  - So the repaired clauses give exactly the steps §2.2 takes. 0BQ5 (line 2571) and 0EY3 (line 2627) are still the right locators.
- The citation resolves. SchemeAndStackFoundations §0.9 `finite_presentation_limits` is on main (heading line 1026, statement lines 1037-1043) and at this head (heading line 957, statement lines 968-973). LocalPurity and SchemeAndStackFoundations are both on main, so the edge stays on main.
- Library check, by object:
  - The pinned Mathlib `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` has only the uniqueness part of morphism descent: `Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType` (line 624), and line 677, which is tagged `@[stacks 01ZC]`.
  - It has no descent of schemes and no descent of finite, étale, proper or closed-immersion properties.
  - Neither Mathlib nor Tau Ceti at the pins carries the tags 01ZM, 01ZO, 01ZP, 07RP, 081F or 01ZQ (grep over `Mathlib/AlgebraicGeometry` and `TauCeti/`).
  - So the supplier contract is the right place for these facts.

**Seeded sample.** Targets 1.1-1.4 and 2.1 are untouched. Their locators were verified in r56/r57: SGA 2 X 3.1-3.2; 0BM7, 0BL6, 0BM9, 0BLK, 0BM8; 05EL-05EU; 0EII, 0EKP; 0BLS, 0BLM. Target 2.2 is the only sample target that depends on the changed passage, and I re-checked it above. The README flags no locator as unverified.

**Overlaps and citations.**
- The overlap report lists no dropped id and no id that only an open revision defines.
- #1808 and #1854 also change this folder, and their order after this pull request is stated in the description's merge-order block: "`LocalPurity`: **this pull request** → #1808 → #1854".
- The citation resolver's two leads (README 37-38) are this file's own declarations in `TauCetiRoadmap.LocalPurity`, and both elaborate.
- The diff adds no new cross-roadmap citation.
- Every sentence of the pull request description about LocalPurity (lines 29, 37, 66) still matches the head. The repair touches none of them.

**Adversarial table.** The new rows are for the changed contract. Rows for untouched statements are carried from r57, which carried some of them from r56. Notation: `𝒪 = k[x,y]_(x,y)`, `S = 𝔸²_k`, and the stages `W` are the affine neighbourhoods of `0`.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.9 contract, finite clause (changed; 01ZO) | `f_0 : D(x−1) ↪ 𝔸²` | `x−1 ∉ (x,y)`, so `𝒪[1/(x−1)] = 𝒪`: `f = id`, which is finite. `f_0` is not finite (the image `D(x−1)` is not closed). `f_W = id` for `W = D(x−1)`, finite | limit ⇒ some stage, not every stage: matches the new wording | none |
| §0.9 contract, étale clause (changed; 07RP) | `B_0 = k[x,y,z]/(z²−1−x)`, `char k ≠ 2` | `Ω_{B_0} = B_0/(2z) = k[x,y]/(1+x) ≠ 0`, so `f_0` is not étale. Over `𝒪`, `1+x` is a unit, so `z` is a unit and `Ω = 0`, and `B` is free of rank 2: étale. `f_W` is étale for `W = D(1+x)` | matches | none |
| §0.9 contract, closed-immersion clause (changed; 01ZP) | `X_0 = V(y) ⊔ Spec k → 𝔸²`, with the point sent to `(1,0)` | `f_0` is not injective (`(1,0)` is hit twice). `k ⊗_{k[x,y]} 𝒪 = 0`, so `f : Spec 𝒪/(y) → Spec 𝒪` is a closed immersion. `f_W` is one for `W = D(x−1)` | matches | none |
| §0.9 contract, proper clause (changed; 081F) | `Y_0 = ℙ¹_{𝔸²} ∖ {p}`, `p` over `(1,0)` | `Y_0` is open in a Noetherian scheme, so it is of finite presentation. The fibre over `(1,0)` is `𝔸¹_k`, so `f_0` is not proper. `Y = ℙ¹_𝒪` is proper, and so is `Y_W = ℙ¹_W` for `W = D(x−1)` | matches | none |
| §0.9 contract, hypotheses (changed) | Situation 8.1 | `S_i` qcqs, `X_i, Y_i` of finite presentation over `S_i` ⇒ qcqs; `f_i` locally of finite presentation ⇒ hypothesis (2) of each of the four lemmas; directed index set = cofiltered | consistent | none |
| §2.2 use of the clauses (untouched text, changed dependency) | `Y_W → W`, `Δ : Y_W → Y_W ×_W Y_W` | both are morphisms between schemes of finite presentation over `W`; their base changes are `Y → Spec 𝒪_{S,s}` and `Δ_Y`; 01ZQ = 01ZP applied to `Δ` (lines 870-875) | the new wording covers the step | none |
| *spread_from_localScheme*, separated and gluing clauses (r57) | `S = 𝔸²_k`, `U = S ∖ {0}`; `Y` with the closed point doubled; `{U, W}` | `U′ = S`; `Δ_Y` is not closed, so no `Y_W` is separated; each property is local on the base (0EY3) | true | none |
| Layer 1 Example 3 (r57) | `k = 𝔽_3`, `ℚ`; `k = 𝔽_2` | `char ≠ 2`: `Ω_{B/A} = k⟦y⟧`, supported on `{(z), (z,y)}`, and only `(z)` lies over `U`. `char 2`: `Ω ⊗ κ(q) ≠ 0` at every `q` | true as written | none |
| §2.1 `d = 2` step (r57) | Lean probe | `IsEtaleAt A q ⊢ IsUnramifiedAt A q` by `inferInstance`; (2)'s hypotheses imply Tau Ceti's | true | none |
| Provenance (r57) | pin and GitHub | `9a20b3f` at both modules' lines 36-37; compare 9a20b3f...d28f90d: ahead 18, behind 0 | true | none |
| §1.1 `PurityHolds` (r56) | a field; `ℤ_(3)`; `k⟦x,y⟧` | field: `U = ∅`. `ℤ_(3)[√3]`: discriminant 12 ∈ 3ℤ_(3). `k⟦x,y⟧`: `Γ(U) = A` | Checks hold | none |
| §1.2 *restrictPuncturedSpec_essSurj* and exclusions (r56) | dim 0, 1, 2; `A×A/𝔪`; `A[z]/(z²−x)` | dim 1: `Γ(V) = ℚ(√3)` is not finite. `x·(0,1) = 0`, so `A×A/𝔪` is not torsion free; `e = 2` at `(z)` | holds | none |
| §1.3 formal glueing, 0EII, 0EKP (r56) | `S = 0`; `ℤ_(p) → ℤ_p`; `α₂₁ = −1`; `k⟦x,y,z⟧, g = z` | `H⁰ = ℤ_(p)`; `H⁰ = 0` without the cocycle; depth of `R/zⁿ` = 2 | hypotheses needed | none |
| §1.4 0BLS, 0BLM (r56) | `k⟦x,y,z⟧, f = z` | `H¹_𝔪 = H²_𝔪 = 0` | true | none |
| §2.1 headlines (1), (2) (r56) | `d = 1, 2, 3`; `k[x²,xy,y²]_0`; `A×A/𝔪` | `d = 1`: discriminant 12, excluded by `hd`. Non-regular: closed fibre of length 3 ≠ 2. `A×A/𝔪` fails the torsion-free binder | consistent | none |
| §2.2 0EY7 and codimension-two headlines (r56) | `Spec ℤ_(3)`; `𝔸²∖0`; `𝔸³∖L`; `𝔸²∖V(x)` | purity fails at the closed point of `ℤ_(3)`; dims 2 and 3 extend; `V(x)` has local dimension 1 at its generic point, so the hypothesis fails | true | none |

**Remark on another folder (no change asked here).** SchemeAndStackFoundations §0.9 still reads "are inherited from a finite stage", at this head line 972, on main line 1041, at #1808's head line 1007 and at #1854's head line 863. Its own `spreading_out_models` route (lines 978-979 at this head) uses the limit-to-stage direction. LocalPurity now states that direction itself; the supplier's wording is for that folder's review.

## Not verifiable

- I did not compare #1808's and #1854's edits to this folder at the git level. Their order after this pull request is stated in the description's merge-order block, and their LocalPurity copies do not carry the old §0.9 phrase (`roadmaps grep` finds it only in SchemeAndStackFoundations).

## Source issues

- **Misprint** in stacks-limits at Lemma 32.20.4 (0EY3), p. 54: the source takes the open `U′` with `U ⊂ U′ ⊂ X`; it should be `U ⊂ U′ ⊂ S`, the ambient scheme of Lemma 32.20.3; affects nothing.
- **Misprint** in stacks-limits at the proof of Lemma 32.8.6 (01ZQ), p. 20: a parenthetical remark on why the diagonal is admissible opens but is never closed; it should end with a closing parenthesis before the end-of-proof mark; affects nothing.
