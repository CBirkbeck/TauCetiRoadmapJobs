# Review of LocalPurity (pull request #1807 at 8d98b44)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since `afdd14a`. It has no findings.

The four commits since `afdd14a` touch only four other folders this pull request owns: BordismFormalGroups, ClassifyingSpaces, RigidAnalyticGeometry and TopologicalKTheory. None of them cites or mentions LocalPurity, and LocalPurity cites none of them. `TauCetiRoadmap/LocalPurity/README.md` and `TauCetiRoadmap/LocalPurity/Suggested.lean` are byte-identical to `afdd14a`.

## Previous findings

The previous report (r59, at `afdd14a`) had no findings, so there is nothing to carry. Its one remark, about the SchemeAndStackFoundations §0.9 wording in another folder, is repeated below as a remark.

## Verified sound

**What changed.**
- `git diff --stat afdd14a..HEAD -- TauCetiRoadmap/LocalPurity` is empty.
- `git diff --stat afdd14a..HEAD` lists 5 files, with 285 insertions and 144 deletions:
  - BordismFormalGroups, ClassifyingSpaces and TopologicalKTheory: `README.md` only;
  - RigidAnalyticGeometry: `README.md` and `Suggested.lean`.
- `git diff afdd14a..HEAD | grep -i localpurity` finds nothing.
- `lake-manifest.json`, `lean-toolchain` and the lakefile are unchanged since `afdd14a`, so the pins are the ones earlier rounds checked.
- `git diff --name-only origin/main...HEAD` lists 28 files, two in each of the 14 folders the brief names as this pull request's own. The brief's command for changes outside those folders lists nothing.

**Supplier on main.**
- Main moved from `5fc1aa8`, which r59 read, to `c69ba93`.
- `git diff --stat 5fc1aa8..` on main touches only `SchemeAndStackFoundations/PROGRESS.md` and `STATUS.md`. That folder's `README.md`, which this roadmap's contract cites, is unchanged.

**Gate.**
- The worker's gate passes at this head, build included.
- My bare rerun reports 0 on every check except `outside-folder=26`. That figure is the 13 sibling folders this pull request owns, two files each; the brief names all of them as the pull request's own.

**Dependency check** (the brief's `--depcheck` command, rerun):
- Output: `depcheck: 236 roadmaps, 2136 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- LocalPurity and its one roadmap supplier, SchemeAndStackFoundations, are both on main.

**Elaboration.**
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` exits 0. Its only output is 4 `sorry` warnings, at lines 34, 45, 58 and 69.
- I elaborated `#check @` for all 4 declarations in one scratch copy. The types match the worker's `signatures.md` character for character:
  - `[IsRegularLocalRing A]`, `2 ≤ ringKrullDim A` ⊢ `TauCeti.IsLocalRing.PurityHolds A`;
  - `[Module.Finite A B] [Module.IsTorsionFree A B]`, normal-domain localizations, and `Ideal.under A q ≠ maximalIdeal A → Algebra.IsEtaleAt A q` ⊢ `Algebra.Etale A B`;
  - `[IsNoetherian X]`, `PurityHolds` at every `x ∉ U` ⊢ `(TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj`;
  - `[IsLocallyNoetherian X]`, regular stalks of dimension `≥ 2` at every `x ∉ U` ⊢ the same.
- No section binder is lost. The README §§2.1–2.2 statements and the Downstream-consumers names (lines 861-876) agree with these types.

**One-tactic probe, this round.**
- In a scratch copy I replaced each `sorry` by `first | rfl | infer_instance | simp | (simp_all) | exact?`.
- None of the four closes. `exact?` fails at lines 36, 61 and 74, and line 51 is left with unsolved goals.
- The four are the README's end theorems (lines 36-38), so no statable headline is absent and none is padding.

**Citations resolved at this head and on main (`c69ba93`).**
- `roadmaps resolve` on the README, rerun against main `c69ba93` and the 439 open heads, lists no cross-roadmap citation and no Lean name that is found nowhere. The worker's two leads, README lines 37-38, are this file's own declarations, and both elaborate above.
- Every SchemeAndStackFoundations section and name in the supplier contract (README lines 274-293) resolves in that folder's README. Headings, at this head and then on main:
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
  - `CoherentFormalModule`: lines 5336 and 5728.
- All 46 backticked `TauCeti.*` names in the README have a declaration under the pinned `TauCeti/`. I matched each by its last component against the declaration keywords in a scratch script.
- Two of them I opened in `TauCeti/AlgebraicGeometry/FiniteEtale/`:
  - `PuncturedSpectrum.lean:63`: `PurityHolds` is `(restrictPunctured R).EssSurj`;
  - `Fiber.lean:51`: `pullback` sends `FiniteEtaleScheme S` to `FiniteEtaleScheme T`.

**Overlaps.**
- The overlap report lists no dropped id, no id that only an open revision defines, and no LocalPurity id this pull request drops.
- #1808 and #1854 also change this folder. The description's merge-order block orders them "`LocalPurity`: **this pull request** → #1808 → #1854", with each later one rebased onto the earlier, so the conflict has a stated resolution.
- Ownership against the closest open roadmaps is unchanged from r59, since nothing in this folder moved: PurityForFlatCohomology #1840, PurityOfBranchLocus #1808 and #1854, and SchemeAndStackFoundations #1656 and #1808.

**Seeded sample.** Targets 1.1-1.4, 2.1 and 2.2 are untouched, and their locators were verified against the text in r56-r59. This round I re-read these in the cache:
- SGA 2, Exposé X, at sga2 lines 3377-3391 (printed p. 94):
  - Définition 3.1: a pure pair;
  - Définition 3.2: a pure Noetherian local ring;
  - Proposition 3.3: a pair is pure exactly when every local ring along `Z` is pure;
  - Théorème 3.4 (i): a regular Noetherian local ring of dimension `≥ 2` is pure.

  This matches §1.1 and the docstrings of Suggested.lean lines 31 and 66.
- 0BLS and 0BLM, at stacks-pione lines 2449-2462, in Situation 0BLF (line 2245):
  - 0BLS has two hypotheses: `H¹_𝔪`, `H²_𝔪` are killed by a power of `f`, and `V_0` extends over `X_0`;
  - 0BLM replaces the first by `depth A ≥ 3`;
  - the route goes through the complete case, the henselian pair `(A, fA)` and 09ZL.

  This is §1.4 as written.
- 05EL, 05ER and 05EU at stacks-more-algebra lines 11453, 11528 and 11624, numbered 91.10, 91.16 and 91.20 in the chapter file, so 15.91.x in the book.
- 0EII and 0EKP at stacks-algebraization lines 1923 and 2094, numbered 12.7 and 15.1, so 52.x.

The locators in the README's Stacks alignment table (lines 841-843) agree. The README flags no locator as unverified.

**Adversarial table.** No statement changed, so every row is carried from r59, which carried the values computed in the round cited. One row was recomputed this round and is marked. Notation: `𝒪 = k[x,y]_(x,y)`, `S = 𝔸²_k`, and the stages `W` are the affine neighbourhoods of `0`.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.9 contract, finite clause, 01ZO (r58) | `f_0 : D(x−1) ↪ 𝔸²` | `x−1 ∉ (x,y)`, so `𝒪[1/(x−1)] = 𝒪` and `f = id` is finite. `f_0` is not finite (its image is not closed). `f_W = id` for `W = D(x−1)` | limit ⇒ some stage | none |
| §0.9 contract, étale clause, 07RP (r58) | `B_0 = k[x,y,z]/(z²−1−x)`, `char k ≠ 2` | `Ω_{B_0} = k[x,y]/(1+x) ≠ 0`, so `f_0` is not étale. Over `𝒪` it gives `Ω = 0` and `B` free of rank 2, so `f` is étale. `f_W` is étale for `W = D(1+x)` | matches | none |
| §0.9 contract, closed-immersion clause, 01ZP (r58) | `V(y) ⊔ Spec k → 𝔸²`, with the point sent to `(1,0)` | `f_0` is not injective. `k ⊗ 𝒪 = 0`, so `f` is a closed immersion, and so is `f_W` for `W = D(x−1)` | matches | none |
| §0.9 contract, proper clause, 081F (r58) | `ℙ¹_{𝔸²} ∖ {p}`, with `p` over `(1,0)` | The fibre over `(1,0)` is `𝔸¹_k`, so `f_0` is not proper. `ℙ¹_𝒪` and `ℙ¹_W` are proper | matches | none |
| §2.2 *spread_from_localScheme* (r57, r58) | `U = 𝔸² ∖ {0}`; `Y` with its closed point doubled | `U′ = S`. `Δ_Y` is not closed, so no `Y_W` is separated. Each property is local on the base (0EY3) | true | none |
| Layer 1 Example 3 (r57) | `k = 𝔽_3`, `ℚ`; `k = 𝔽_2` | `char ≠ 2`: `Ω_{B/A} = k⟦y⟧`, supported on `{(z), (z,y)}`, of which only `(z)` lies over `U`. `char 2`: `Ω ⊗ κ(q) ≠ 0` at every `q` | true as written | none |
| §2.1 `d = 2` step (r57) | Lean probe | `IsEtaleAt A q ⊢ IsUnramifiedAt A q` by `inferInstance` | true | none |
| §1.1 `PurityHolds` (r56; second Check recomputed here) | a field; `ℤ_(3)`; `k⟦x,y⟧` | Field: `U = ∅`. `ℤ_(3)[√3]`: the trace form of `1, √3` is `diag(2, 6)`, discriminant `12 ∈ 3ℤ_(3)`, so it is not étale. `k⟦x,y⟧`: `Γ(U) = A` | Checks hold | none |
| §1.2 *restrictPuncturedSpec_essSurj* and exclusions (r56) | dimensions 0, 1, 2; `A×A/𝔪`; `A[z]/(z²−x)` | Dimension 1: `Γ(V) = ℚ(√3)` is not finite. `x·(0,1) = 0`, so `A×A/𝔪` is not torsion free. `A[z]/(z²−x)` has `e = 2` at `(z)` | holds | none |
| §1.3 formal glueing, 0EII, 0EKP (r56) | `S = 0`; `ℤ_(p) → ℤ_p`; `α₂₁ = −1`; `k⟦x,y,z⟧` with `g = z` | `H⁰ = ℤ_(p)`; `H⁰ = 0` without the cocycle condition; `depth R/zⁿ = 2` | the hypotheses are needed | none |
| §1.4 0BLS, 0BLM (r56; text re-read here) | `k⟦x,y,z⟧`, `f = z` | `H¹_𝔪 = H²_𝔪 = 0` | true | none |
| §2.1 headlines (1), (2) (r56; signatures re-elaborated here) | `d = 1, 2, 3`; `k[x²,xy,y²]_0`; `A×A/𝔪` | `d = 1`: discriminant 12, excluded by `hd`. Non-regular cone: closed fibre of length `3 ≠ 2`. `A×A/𝔪` fails `Module.IsTorsionFree` | consistent | none |
| §2.2 0EY7 and codimension-two headlines (r56; signatures re-elaborated here) | `Spec ℤ_(3)`; `𝔸² ∖ 0`; `𝔸³ ∖ L`; `𝔸² ∖ V(x)` | Purity fails at the closed point of `ℤ_(3)`. Dimensions 2 and 3 extend. `V(x)` has local dimension 1 at its generic point, so the hypothesis fails there | true | none |

**Remark on another folder (no change asked here).** SchemeAndStackFoundations §0.9 still says the properties "are inherited from a finite stage": at this head at line 972, and on main at line 1041. LocalPurity's own contract (README lines 278-280) states the limit-to-stage direction correctly. The supplier's wording belongs to that folder's review.

## Not verifiable

- none

## Source issues

- none
