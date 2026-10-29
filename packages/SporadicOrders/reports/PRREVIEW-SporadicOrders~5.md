# Review of SporadicOrders (pull request #599 at 101ccf8)

**Verdict:** accepted

🤖 Independent AI review, incremental: 73 changed README lines since `dee3069`; `Suggested.lean` is byte-identical to the head reviewed three rounds ago. The one blocking finding of the previous review is repaired: every Tau Ceti and Mathlib declaration the supplier contract, 2.1, 2.2 and the Layer 2 Dependencies now name exists at the pinned revisions, with the statement the README ascribes to it, and no stale name remains anywhere in the folder. One P3 note (a routine Mathlib lemma the 2.2 proof route uses but its *Needs* line omits). The gate passes, the dependency check reports no problem, the twenty headline theorems elaborate with exactly twenty `sorry` warnings, and no file outside the folder is changed.

## R01 (P3) — The 2.2 route passes closure through the hom without naming the lemma that does it

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:455–460` (“its range is the closure of the `τᵢ` by `PresentedGroup.toGroup.of` and `PresentedGroup.closure_range_of`, hence the carrier … *Needs:* 2.1, Mathlib `PresentedGroup.toGroup`, `PresentedGroup.toGroup.of`, `PresentedGroup.closure_range_of`, Tau Ceti `TauCeti.GroupPresentation.mem_relatorSet_iff`”).

**Claim:** the two named Mathlib lemmas give that the range of `toGroup h` is `Subgroup.closure {τ₁, …, τₘ}`.

**Witness:** `closure_range_of` (pin, `Mathlib/GroupTheory/PresentedGroup.lean:90`) says the generators generate the presented group, and `toGroup.of` (`:139`) gives the images of the generators; the step from these to the range is `MonoidHom.range_eq_map` (`Mathlib/Algebra/Group/Subgroup/Ker.lean:82`, `f.range = (⊤).map f`) followed by `MonoidHom.map_closure` (`Mathlib/Algebra/Group/Subgroup/Map.lean:582`, `(closure s).map f = closure (f '' s)`). Neither is named, and the *Needs* line is meant to list the route's inputs item by item.

**Repair:** in the route sentence write “its range is the image of `⊤`, which by `PresentedGroup.closure_range_of`, `MonoidHom.map_closure` and `PresentedGroup.toGroup.of` is the closure of the `τᵢ`”, and add `MonoidHom.range_eq_map` and `MonoidHom.map_closure` to the *Needs* line and to the Layer 2 Dependencies. Not blocking: both lemmas are at the pin and the mathematics of the route is correct.

## Previous findings

- R01 — repaired: `README.md:106–139` now cites `PresentedGroup.toGroup.unique`, `FreeGroup.lift`, `TauCeti.GroupPresentation.mem_relatorSet_iff`, `TauCeti.Relator.toFreeGroup` and its five computation rules; all exist at the pins (table below), `homEquiv`, `Relator.eval`, `lift_toFreeGroup`, `commInvInv`, `eval_commInvInv` occur nowhere in the folder.

## Verified sound

Head `101ccf822ca3af13ea8894dba5481875aa78ded1`, main at `c994070`; pins Mathlib `5e0c4e5239cb0a2d86d68a884bf52cfd963fce22`, Tau Ceti `a780c7ad6beb23f60a17351a492d177878020ad5` (`lake-manifest.json`; the checked-out Tau Ceti package is at that commit), both unchanged since the first review. The diff since `dee3069` touches only `README.md` (42 insertions, 31 deletions); `git diff --stat 824bdaa HEAD -- Suggested.lean` is empty; the diff against `origin/main` outside the roadmap folder is empty. The PR description is data; it asks nothing of the reviewer.

**Gate, build, signatures, padding.** I ran the gate on this head: every check passes (`set_option=0 … outside-folder=0 source-material=0 OK`). I elaborated `Suggested.lean` with `lake env lean` (the imported Tau Ceti object file `Sporadic/Presentation.olean` is present): exit 0 in 5.7 s, exactly twenty `declaration uses sorry` warnings at lines 251–278 (the ten `card_<Name>`) and 284–329 (the ten `exists_surjective_<Name>`), nothing else. I put `#check @name` for all thirty declarations on a copy of the file in my scratch directory, elaborated it (exit 0) and compared: the ten carriers are `Subgroup (Equiv.Perm (Fin n))` with `n = 11, 12, 22, 23, 24, 266, 100, 100, 275, 276`, the ten orders are `Nat.card ↥<Name> = N` with the ten values of the README's Layer 1 table, and the ten surjections are `∃ f : SporadicName.<Name>.Group →* <Name>, Function.Surjective ⇑f`; no section `variable` exists, so no binder can have been lost. The one-tactic padding probe of the second review stands (the file is byte-identical): nothing closes. The dependency check printed

```text
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

with no `UPWARD`, `CYCLE` or `moved:` line. No gaps are declared and none is needed.

**Headlines.** Unchanged: ten `card_<Name>` (1.2) and ten `exists_surjective_<Name>` (2.2), all stated at the pins; the docstring says Layer 0 is general theory stated in the README, which it is (0.1–0.3).

**The changed passages.** The diff rewrites the Mathlib and Tau Ceti supplier bullets (`README.md:106–139`), the relator bullet and *Needs* line of 2.1 (`:423–436`), the route and *Needs* line of 2.2 (`:453–460`), and the Layer 2 Dependencies (`:487–491`). Every name they cite was opened at the pin:

| File at the pin | Declaration, what was checked |
| --- | --- |
| `TauCeti/GroupTheory/SpecificGroups/CFSG/Index.lean:1459, 1478` | `inductive SporadicName`; `card_sporadicName : Fintype.card SporadicName = 26` (“the twenty-six sporadic names”) |
| `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Presentation.lean:131` | `abbrev SporadicName.Group s := s.presentation.Group` |
| `TauCeti/GroupTheory/Presentation/GroupPresentation.lean:180, 188, 207` | `relatorSet`; `mem_relatorSet_iff : r ∈ P.relatorSet ↔ ∃ t ∈ P.transcribed, t.toFreeGroup = r`; `abbrev Group P := PresentedGroup P.relatorSet` |
| `TauCeti/GroupTheory/Presentation/Relator.lean:75–85, 207, 216, 221, 227, 233, 239` | constructors `gen inv mul pow comm`; `toFreeGroup`; `toFreeGroup_gen` (`= FreeGroup.of x`), `_inv` (`= ⁻¹`), `_mul` (`= *`), `_pow` (`= ^ n`), `_comm` (`= ⁅·,·⁆`) |
| `Mathlib/GroupTheory/PresentedGroup.lean:90, 135, 139, 142` | `closure_range_of`; `toGroup (h : ∀ r ∈ rels, FreeGroup.lift f r = 1)`; `toGroup.of`; `toGroup.unique (g) (hg : ∀ x, g (of x) = f x) : g x = toGroup h x` |
| `Mathlib/GroupTheory/FreeGroup/Basic.lean:678` | `FreeGroup.lift : (α → β) ≃ (FreeGroup α →* β)` |
| `Mathlib/Algebra/Group/Commutator.lean:28–29` | `⁅g₁, g₂⁆ = g₁ * g₂ * g₁⁻¹ * g₂⁻¹` |
| `Mathlib/Algebra/Group/Subgroup/Ker.lean:82`, `Map.lean:582` | `MonoidHom.range_eq_map`, `MonoidHom.map_closure` (R01) |

The citation “CFSGStatement S0–S1” resolves on main (`TauCetiRoadmap/CFSGStatement/README.md:676`, *S0: auditable presentation data and source selection*; `:721`, *S1: the twenty-six sporadic presentations*). The resolver's one lead, `Hex.PermGroup.Kernel.card_closure` at `README.md:521`, is in the unchanged References and was resolved against the Hex repository at the cited commit in the second review; not re-fetched here.

**Adversarial table, changed statements (computed here).** Products are Mathlib's `(σ * τ) x = σ (τ x)`; permutations written as images of `0, 1, 2`.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Supplier contract: hom condition `∀ t ∈ P.transcribed, FreeGroup.lift τ t.toFreeGroup = 1` is the hypothesis of `toGroup` | one generator, one transcribed relator `pow (gen 0) 2`; `τ = c[0,1]` on `Fin 2`; `τ = c[0,1,2]` on `Fin 3` | `relatorSet = {(of 0)^2}` by `mem_relatorSet_iff`; `c[0,1]² = 1`, hom exists; `c[0,1,2]² = c[0,2,1] ≠ 1`, no hom. Zero relators: every `τ` lifts (free group). Zero generators: `Fin 0 → G`, the unique hom is trivial | equivalence exact in both directions |
| `toGroup.unique` as the README reads it (“every hom with those values on the generators is it”) | the pinned statement | hypothesis `∀ x, g (of x) = f x`, conclusion `g x = toGroup h x` for all `x`; direction and quantifiers as in the README | exact |
| “`FreeGroup.lift τ t.toFreeGroup` is the structural evaluation of `t` at `τ`” | the five rules plus `lift` a hom | `gen x ↦ τ x` (`FreeGroup.lift.of`), `inv ↦ ⁻¹`, `mul ↦ *`, `pow n ↦ ^ n`, `comm ↦ ⁅·,·⁆` (`map_commutatorElement`); on `t = pow (gen 0) 2`: `τ²` | exact |
| Commutator convention: `comm (inv r) (inv s)` has value `r⁻¹ s⁻¹ r s` and Mathlib's `⁅r, s⁆` is `r s r⁻¹ s⁻¹` | `S₃`, `r = c[0,1,2]`, `s = c[0,1]` (non-involutions) | `⁅r, s⁆ = (2,0,1) = c[0,2,1]`; `r⁻¹ s⁻¹ r s = (1,2,0) = c[0,1,2]`; `⁅r⁻¹, s⁻¹⁆ = (1,2,0)`, equal to the literature value, different from `⁅r, s⁆` | the sentence is correct and discriminating; on involutions (`r = c[0,1]`, `s = c[1,2]`) all three coincide at `(2,0,1)`, so the witness must avoid them |
| 2.1 statement at this head | `τ` arbitrary, not necessarily standard generators; `τᵢ = 1` | relators hold at `τ = 1` (every word evaluates to `1`), closure `⊥ ≠` carrier; generation condition excludes it (the unchanged third Check) | generality as stated; no vacuity |
| 2.2 route at this head | `f = toGroup h` | `f.range = (⊤).map f` (`range_eq_map`) `= (closure (range of)).map f` (`closure_range_of`) `= closure (f '' range of)` (`map_closure`) `= closure (range τ)` (`toGroup.of`) `=` carrier (2.1); corestriction to its range is surjective | correct; two lemma names missing (R01) |
| Layer 2 Dependencies | the eight names listed | all at the pins (table above) | exact |

**Adversarial table, untouched statements (carried forward).** Tables A–E of `PRREVIEW-SporadicOrders~2` (the ten orders recomputed by a verified Schreier–Sims: 7920; 95040; 443520; 10200960; 244823040; 175560; 604800; 44352000; 898128000; 495766656000; the twenty-five per-carrier Checks; the 0.1 degenerate cases and the M24 convention witnesses `b 0 = 3` versus `5`, `(a*b) 0 = 0`, `(b*a) 0 = 5`; the relator supports for M23, M24, J1, HS, McL under the four sign choices and the exhaustive solutions for M11, M12, M22, J2; nontriviality and the positivity hypothesis) and the 0.2 and 0.3 rows of `PRREVIEW-SporadicOrders~3` (the sifting step on `A₃ ≤ S₃`, the six Checks of 0.3, the infinite case `ℤ`, the coset reading of `Rᵢ`, the abstract and finite forms of 0.2) apply verbatim: those passages and the twenty theorems are unchanged at this head. I confirmed that the evaluation semantics those tables used for the relators (free-group value under `FreeGroup.lift τ`, commutators as `comm (inv r) (inv s)`) is exactly what the rewritten contract now states, so the repair changes no mathematics.

**Sources sampled.** 0.1, 0.2, 0.3, 1.1, 1.2: untouched by the diff; their verification in the previous reports (twenty ATLAS files point by point, ten group pages, the `M24G1-P1` page, the pinned presentations, the brute-force recomputation of 0.2 and 0.3) stands. 2.1 and 2.2: the changed lines cite only pinned declarations, all resolved above; the M24 Checks of 2.1 are unchanged.

**Duplication and ownership.** The changed lines construct nothing: they cite pinned declarations and consume CFSGStatement S0–S1 as Tau Ceti carries it. The ownership results of the previous reviews (the orbit description against CertifiedPermutationComputation §2.2; CFSGBasicProperties P0 as consumer) are unchanged; ownership against the other open pull requests was not re-checked this round beyond those two.

## Not verifiable

- **Seress, *Permutation Group Algorithms*, §4.1 (0.3) and Dixon–Mortimer, Theorem 1.4A (0.1).** Paywalled (Cambridge University Press, Springer); no legal copy found by the sources service in the previous rounds; cited by locator; untouched passages.
- **`exists_surjective_Co3`, the AtlasRep file names, the J₂.2 remark.** Unchanged passages; as in the previous reviews.
- **`Hex.PermGroup.Kernel.card_closure` (References).** Unchanged; resolved at the cited commit in the second review, not re-fetched here.

## Source issues

- none
