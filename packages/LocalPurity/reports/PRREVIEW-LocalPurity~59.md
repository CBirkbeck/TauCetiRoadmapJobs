# Review of LocalPurity (pull request #1807 at afdd14a)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since `d18ec2a`. It has no findings.

The five commits since `d18ec2a` touch only five other folders this pull request owns: PadicFunctionalAnalysis, RigidAnalyticGeometry, TopologicalKTheory, BordismFormalGroups and ClassifyingSpaces. None of them cites or mentions LocalPurity, and LocalPurity cites none of them. `TauCetiRoadmap/LocalPurity/README.md` and `TauCetiRoadmap/LocalPurity/Suggested.lean` are byte-identical to `d18ec2a`.

## Previous findings

The previous report (r58, at `d18ec2a`) had no findings, so none is carried. Its one remark was about the SchemeAndStackFoundations §0.9 wording in another folder, and that remark is repeated below.

## Verified sound

**What changed.**
- `git diff --stat d18ec2a..HEAD -- TauCetiRoadmap/LocalPurity` is empty.
- `git diff --stat d18ec2a..HEAD` lists 9 files, 524 insertions and 230 deletions, all in the five sibling folders named above.
- `git diff d18ec2a..HEAD | grep LocalPurity` finds nothing. A grep of the five changed folders' files finds no mention of LocalPurity.
- `lake-manifest.json`, `lean-toolchain` and the lakefile are unchanged, so the pins are those the earlier rounds checked.
- The brief's command for changes outside the 14 folders lists nothing.

**Gate.**
- The worker's gate passes at this head, build included.
- My bare rerun reports 0 on every check except `outside-folder=26`. That figure is the 13 sibling folders this pull request owns, two files each, out of 28 changed files in all; the other two are this folder's own.

**Dependency check.**
- Output: `depcheck: 236 roadmaps, 2136 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- LocalPurity and its one roadmap supplier, SchemeAndStackFoundations, are both on main, so this revision consumes only main and the pins.

**Elaboration.**
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` exits 0. Its only output is 4 `sorry` warnings, at lines 34, 45, 58 and 69.
- I elaborated `#check @` for all 4 declarations in one scratch copy. The types are character-for-character those of r58 and of the worker's `signatures.md`:
  - `[IsRegularLocalRing A]` with `2 ≤ ringKrullDim A`, concluding `TauCeti.IsLocalRing.PurityHolds A`;
  - `[Module.Finite A B] [Module.IsTorsionFree A B]`, with every localization of `B` at a prime an integrally closed domain, and `Ideal.under A q ≠ maximalIdeal A → Algebra.IsEtaleAt A q`, concluding `Algebra.Etale A B`;
  - `[IsNoetherian X]` with `PurityHolds` at every `x ∉ U`;
  - `[IsLocallyNoetherian X]` with regular stalks of dimension `≥ 2` at every `x ∉ U`.
- No section binder is lost, and the README statements at lines 698 and 762 match.
- The one-tactic probe of r56/r57 stands on the unchanged file: `simp`, `rfl`, `infer_instance` and `exact?` close none of the four.
- The four declarations are the README's end theorems (lines 37-39), so no statable headline is absent and nothing is padding.

**Citations resolved at this head and on main (`5fc1aa8`).**
- `roadmaps resolve` lists no cross-roadmap citation and no Lean name found nowhere. The worker's two leads, README lines 37-38, are this file's own declarations, and both elaborate above.
- Every SchemeAndStackFoundations section and name in the supplier contract (`README.md:274-293`) resolves, in that folder's README. Headings, at this head and then on main:
  - §0.9: lines 957 and 1026;
  - §0.14: lines 1143 and 1240;
  - §2.6: lines 3344 and 3554;
  - §2.7: lines 3383 and 3613;
  - §4.7: lines 5161 and 5622;
  - §4.8: lines 5201 and 5668.
- Statements, at this head and then on main:
  - `finite_presentation_limits`: lines 968 and 1037;
  - *henselian_pair_characterisations*: lines 1145 and 1242;
  - *henselian_finiteEtale_equivalence*: lines 1155 and 1257;
  - `serre_affineness_criterion`: lines 3363 and 3584;
  - `supports_localization_triangle`: lines 3390 and 3621;
  - `localCohomology_module_comparison`: lines 3399 and 3630;
  - *localCohomology_flat_baseChange*: lines 3407 and 3639;
  - `depth_localCohomology_vanishing`: lines 3412 and 3645;
  - `CoherentFormalModule`: lines 5210 and 5677.
- All 46 backticked `TauCeti.*` names in the README occur as declarations under the pinned `TauCeti/`. Among them are `TauCeti.FiniteEtaleScheme.pullback`, `TauCeti.IsLocalRing.PurityHolds`, `TauCeti.isRegularRing_of_isRegularLocalRing`, `TauCeti.IsRegularLocalRing.quotient_span_singleton`, `TauCeti.IsRegularRing.isIntegrallyClosed` and `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`.

**Overlaps.**
- The overlap report lists no dropped id, no id that only an open revision defines, and no LocalPurity id this pull request drops.
- #1808 and #1854 also change this folder. I compared their copies at their heads with this head:
  - Both carry older text, for example the shorter Summary sentence at README lines 16-24 and, in #1854, the §§0.14, 2.7, 4.7–4.8, 0.9 supplier bullet without §2.6.
  - The description's merge-order block fixes the order "`LocalPurity`: **this pull request** → #1808 → #1854", with each later one rebased onto the earlier, so the conflict has a stated resolution.
- Ownership against the closest open roadmaps is unchanged from r58, since nothing in this folder moved: PurityForFlatCohomology #1840, PurityOfBranchLocus #1808 and #1854, and SchemeAndStackFoundations #1656 and #1808.

**Seeded sample.**
- Targets 1.1-1.4, 2.1 and 2.2 are untouched. Their locators were verified against the text in r56-r58: SGA 2 X 3.1-3.4; 0BM7, 0BL6, 0BM8, 0BLK, 0BM9; 05EL, 05ER, 05EU; 0EII, 0EKP; 0BLS, 0BLM; 0BMA; 0BQ5, 0EY3, 0EY7.
- I re-read two of them in the cache this round:
  - 0BMA, stacks-pione lines 2503-2507: a regular local ring of dimension `≥ 2`, clauses (1) and (2) as the README paraphrases them, with the torsion-freeness correction stated in Convention 5;
  - 0EY7, stacks-pione lines 2604-2607: an open immersion of Noetherian schemes with purity at every point outside `U`, and essential surjectivity.
- Both match the Lean signatures above.
- The README flags no locator as unverified.
- r58's two stacks-limits misprints (in 0EY3 and in the proof of 01ZQ) are already in its Source issues and are not repeated.

**Adversarial table.** No statement changed, so every row is carried, with the values computed in the round cited. Notation: `𝒪 = k[x,y]_(x,y)`, `S = 𝔸²_k`, and the stages `W` are the affine neighbourhoods of `0`.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.9 contract, finite clause, 01ZO (r58) | `f_0 : D(x−1) ↪ 𝔸²` | `x−1 ∉ (x,y)`, so `𝒪[1/(x−1)] = 𝒪` and `f = id` is finite. `f_0` is not finite (its image is not closed). `f_W = id` for `W = D(x−1)` | limit ⇒ some stage | none |
| §0.9 contract, étale clause, 07RP (r58) | `B_0 = k[x,y,z]/(z²−1−x)`, `char k ≠ 2` | `Ω_{B_0} = k[x,y]/(1+x) ≠ 0`, so `f_0` is not étale. Over `𝒪` it gives `Ω = 0` and `B` free of rank 2, so `f` is étale. `f_W` is étale for `W = D(1+x)` | matches | none |
| §0.9 contract, closed-immersion clause, 01ZP (r58) | `V(y) ⊔ Spec k → 𝔸²`, with the point sent to `(1,0)` | `f_0` is not injective. `k ⊗ 𝒪 = 0`, so `f` is a closed immersion, and so is `f_W` for `W = D(x−1)` | matches | none |
| §0.9 contract, proper clause, 081F (r58) | `ℙ¹_{𝔸²} ∖ {p}`, with `p` over `(1,0)` | The fibre over `(1,0)` is `𝔸¹_k`, so `f_0` is not proper. `ℙ¹_𝒪` and `ℙ¹_W` are proper | matches | none |
| §2.2 *spread_from_localScheme* (r57, r58) | `U = 𝔸² ∖ {0}`; `Y` with its closed point doubled | `U′ = S`. `Δ_Y` is not closed, so no `Y_W` is separated. Each property is local on the base (0EY3) | true | none |
| Layer 1 Example 3 (r57) | `k = 𝔽_3`, `ℚ`; `k = 𝔽_2` | `char ≠ 2`: `Ω_{B/A} = k⟦y⟧`, supported on `{(z), (z,y)}`, of which only `(z)` lies over `U`. `char 2`: `Ω ⊗ κ(q) ≠ 0` at every `q` | true as written | none |
| §2.1 `d = 2` step (r57) | Lean probe | `IsEtaleAt A q ⊢ IsUnramifiedAt A q` by `inferInstance` | true | none |
| §1.1 `PurityHolds` (r56) | a field; `ℤ_(3)`; `k⟦x,y⟧` | Field: `U = ∅`. `ℤ_(3)[√3]`: discriminant `12 ∈ 3ℤ_(3)`. `k⟦x,y⟧`: `Γ(U) = A` | Checks hold | none |
| §1.2 *restrictPuncturedSpec_essSurj* and exclusions (r56) | dimensions 0, 1, 2; `A×A/𝔪`; `A[z]/(z²−x)` | Dimension 1: `Γ(V) = ℚ(√3)` is not finite. `x·(0,1) = 0`, so `A×A/𝔪` is not torsion free. `A[z]/(z²−x)` has `e = 2` at `(z)` | holds | none |
| §1.3 formal glueing, 0EII, 0EKP (r56) | `S = 0`; `ℤ_(p) → ℤ_p`; `α₂₁ = −1`; `k⟦x,y,z⟧` with `g = z` | `H⁰ = ℤ_(p)`; `H⁰ = 0` without the cocycle condition; `depth R/zⁿ = 2` | the hypotheses are needed | none |
| §1.4 0BLS, 0BLM (r56) | `k⟦x,y,z⟧`, `f = z` | `H¹_𝔪 = H²_𝔪 = 0` | true | none |
| §2.1 headlines (1), (2) (r56; signatures re-elaborated here) | `d = 1, 2, 3`; `k[x²,xy,y²]_0`; `A×A/𝔪` | `d = 1`: discriminant 12, excluded by `hd`. Non-regular cone: closed fibre of length `3 ≠ 2`. `A×A/𝔪` fails `Module.IsTorsionFree` | consistent | none |
| §2.2 0EY7 and codimension-two headlines (r56; signatures re-elaborated here) | `Spec ℤ_(3)`; `𝔸² ∖ 0`; `𝔸³ ∖ L`; `𝔸² ∖ V(x)` | Purity fails at the closed point of `ℤ_(3)`. Dimensions 2 and 3 extend. `V(x)` has local dimension 1 at its generic point, so the hypothesis fails there | true | none |

**Remark on another folder (no change asked here).** SchemeAndStackFoundations §0.9 still says the properties "are inherited from a finite stage": at this head at line 972, and on main at line 1041. LocalPurity's own contract states the limit-to-stage direction correctly. The supplier's wording belongs to that folder's review.

## Not verifiable

- none

## Source issues

- none
