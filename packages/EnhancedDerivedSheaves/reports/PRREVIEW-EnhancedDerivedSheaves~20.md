# Review of EnhancedDerivedSheaves (pull request #1630 at e3f468d)

**Verdict:** needs changes

This is an incremental re-review of the 10 README lines that changed since `8200f10`. Only two Checks changed: the E1.8 shift Check at `README:950` and the DMA.1 `a′` Check at `README:1021`–`1025`. `Suggested.lean` did not change: `git diff --stat 8200f10 HEAD` lists only `README.md`. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` and `Suggested.lean:N` refer to the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`. `#PR file:N` refers to that pull request's file at its head.

Both rewritten Checks are correct, and the repair of r19 R03 introduced no new problem. The two remaining findings are about the pull request's description, not the folder. Neither has changed since r19.

## R01 (P2) — Two open pull requests both claim to own `MonoidalCategory.IsInvertible`

Carried from r19 R01 (r18 R02, r17 R01). No repair report marks it `not actionable in this package`.

**Location:** `README:3062`: "Section 0.3 is the single owner of invertible objects of a monoidal category, `MonoidalCategory.IsInvertible`". The definition is at `README:591` and `Suggested.lean:178`.

**Claim:** §0.3 is the only owner of the predicate, and EtaleCohomologyFoundations consumes it.

**Witness:** EtaleCohomologyFoundations at #1891 (now at `9f37291`), `README:1877`–`1878`: "(the predicate MonoidalCategory.IsInvertible, built here)". Neither roadmap mentions the predicate on main (`3090489`). `roadmaps grep 'MonoidalCategory.IsInvertible'` finds it only in #1630 and #1891.

**Repair:** keep §0.3 as the owner. Add this sentence to this pull request's description: "#1891 merges after this pull request; before it merges, `README:1877`–`1878` there replaces 'built here' by 'EnhancedDerivedSheaves §0.3'." The folder needs no change.

## R02 (P3) — The description misstates what changes and gives no order against #1330

Carried from r19 R02 (r18 R03, r17 R02 and earlier). No repair report marks it `not actionable in this package`.

**Location:** the description: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."

**Claim:** only the README changes, and no order against other pull requests is needed.

**Witness:** `git diff --stat origin/main...HEAD` reports `Suggested.lean | 585 +++-----` next to `README.md | 1421`. `overlaps.md` lists #1330 (`856fe7a`, draft), which changes both files of this folder and conflicts with this head.

**Repair:** in the description, replace the quoted sentence with: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it, and every name it drops that another roadmap cites is mapped to its pinned Tau Ceti declaration in Scope and ownership." Then state the order against #1330, for example: "This pull request supersedes #1330, which is closed rather than merged."

## Previous findings

- R01 — not repaired: #1891 `README:1877`–`1878` at `9f37291` still reads "(the predicate MonoidalCategory.IsInvertible, built here)". The description does not mention #1891. Carried as R01.
- R02 — not repaired: the description still says "README only; no Lean change, so no importer is affected" and does not mention #1330. Carried as R02.
- R03 — repaired: `README:950` now reads "`F′`, the shift `⟦1⟧` of the derived category of `HasDerivedCategory.standard (ModuleCat k)` followed by `F`, is another equivalence … So `F′` admits no natural isomorphism with termwise `M ↦ M~` and cannot replace `F` in `a_k`." The added sentence about the Section 0.1 shift is correct (rows AE–AF). DMA.1 `README:1021`–`1024` now builds `a′` as the comparison followed by `F′` (rows AG–AH).

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `e3f468d`, and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty, and `changes.md` lists no file outside the folder.
- I reran `gate … --base origin/main`. It exited 0, every counter was 0 (`statement-hygiene=0`, `dropped=0`, `outside-folder=0`, `stray-files=0`), and it ended with `OK`. The worker's gate also reports `build=0 OK`.
- The dependency check (`gate --depcheck … --movable`, exit 0) printed:

```text
depcheck: 236 roadmaps, 2290 edges, 0 problem(s)
```

**Elaboration.**
- `lake env lean Suggested.lean` exits 0 with exactly 10 warnings, all "declaration uses `sorry`", at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279. These are the same lines as in r17–r19.
- No Lean statement changed, so the `#check @` signature comparison of r18 stands.
- `signatures.md` has the same 6 leads, and they are false positives. The elaborated types carry `[inst : Category A] [inst_1 : Abelian A] [IsGrothendieckAbelian A]` and `[Category C] [MonoidalCategory C]`. Its "elaboration errors" at lines 15–47 and 290–294 come from the tool parsing the module docstring, and `lake env lean` reports no error.
- No padding probe was run, since no declaration changed.

**Lean probe of the two changed Checks.** The probe is a scratch file elaborated with `lake env lean`. Its only error is the intended negative control.
- It copies SchemeAndStackFoundations' `Coherent.instHasDerivedCategoryModules`, `Coherent.DQCoh` and the type of `Coherent.DQCoh.affineEquiv` from main (`Suggested.lean:1521`–`1536`).
- `Fprime A F := (shiftEquiv (DerivedCategory (ModuleCat A)) (1 : ℤ)).trans F` elaborates under `HasDerivedCategory.standard` with the type of F. This confirms the E1.8 sentence.
- The probe takes a second instance `i : HasDerivedCategory.{w}`. It defines `comparison A i := Localization.uniq Q_i Q_std (quasiIso …)`, then `aR := (comparison A i).trans F` and `aPrime := (comparison A i).trans (Fprime A F)`. Both have type `@DerivedCategory (ModuleCat A) _ _ i ≌ DQCoh (Spec A)`, which confirms "has the same type as `a_k`" at `README:1023`.
- Negative control: with `i : HasDerivedCategory.{u}` (the universe of the Section 0.1 instance for `ModuleCat.{u}`), `shiftFunctor (D_i) 1 ⋙ F.functor` fails. The error is "Application type mismatch", `Functor.{u + 1, u + 1, …}` against the expected `Functor.{u, …}`. This confirms "the shift of `D(k)` under the instance of Section 0.1 lands in a different category, so `F` cannot follow it".

**Library declarations opened at the pins (Mathlib `1b1ccf4b`).**
- `HasDerivedCategory` (`Algebra/Homology/DerivedCategory/Basic.lean:74`) and `HasDerivedCategory.standard : HasDerivedCategory.{max u v} C` (`:81`).
- `DerivedCategory` (`:87`) and `DerivedCategory.Q` (`:95`).
- `CategoryTheory.shiftEquiv` (`CategoryTheory/Shift/Basic.lean:416`).
- `CategoryTheory.Localization.uniq` (`CategoryTheory/Localization/Predicate.lean:438`) and `liftNatIso` (`:357`).

**Cross-roadmap citations resolved.**
- SchemeAndStackFoundations on main (`3090489`): `Coherent.DQCoh.affineEquiv` is `letI := HasDerivedCategory.standard (ModuleCat.{u} A); Nonempty (DerivedCategory (ModuleCat.{u} A) ≌ DQCoh (Spec A))` (`Suggested.lean:1534`–`1536`). The changed Checks use exactly this type.
- DerivedModuleAlgebra §0.2 at #1701 (`8dcba8a`, named in the description as merging first): `README:795` is still "Derived tensor products on module derived categories". `hasLeftDerivedFunctor₂_tensor` (`Suggested.lean:138`–`145`) takes `[HasDerivedCategory.{w} (ModuleCat.{u} R)]`. This matches the DMA.1 sentence that the module tensor is stated for any instance.
- §0.1 instance: `README:465`–`478` defines `IsGrothendieckAbelian.hasDerivedCategory : HasDerivedCategory.{w} A`, with Hom types in `Type u` for `ModuleCat.{u} R`, and standard Hom types in `Type (u+1)` (Check at `README:474`). This is the universe mismatch the probe's negative control exhibits.

**Seeded sample.** §0.1 is cited by both changed Checks. §§0.2–0.4 are not, so they were spot-checked only.
- §0.1:
  - Stacks Injectives, Theorem 19.12.6, tag 079P, p. 19, is at StacksInjectives line 883. In a Grothendieck abelian category every complex has a functorial K-injective resolution that is termwise a monomorphism into injectives.
  - HA Definition 1.3.5.8 (HA line 4739, p. 125) defines `D(A)` as the dg nerve of the fibrant complexes. Proposition 1.3.5.9 (line 4743) says it is stable. Proposition 1.3.5.21 (line 4874, p. 129) gives presentability, the t-structure, and compatibility with filtered colimits.
  - These match `README:449`.
- §0.3: HA Proposition 4.1.7.4 is at line 18583, p. 486, and Example 4.1.7.6 at line 18605, p. 487.
- §0.4, derived limits and completion (StacksMoreOnAlgebra):

  | Tag | Lemma | Line |
  | --- | --- | --- |
  | 07KW | 15.88.1 | 10638 |
  | 07KY | 15.88.10 | 10814 |
  | 091D | 15.89.1 | 10946 |
  | 091V | 15.93.10 | 12163 |
  | 0920 | 15.93.18 | 12293 |
  | 0G1U | 15.93.20 | 12344 |
  | 0923 | 15.95.2 | 12520 |

  Each number and tag agrees with the README.
- §0.2's Cohomology on Sites locators were not re-read; see Not verifiable.

**Ownership and overlaps.**
- The change adds no object. It retypes two Checks.
- `roadmaps grep` over the 457 open heads finds `MonoidalCategory.IsInvertible` only in #1630 and #1891 (R01).
- No cited id is dropped (`overlaps.md`; the gate reports `dropped=0`).
- #1187 conflicts only through the pin bump. #1330 is R02.

**Adversarial computations.** Rows AE–AH were computed at this head, and row U was recomputed.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| AE | `README:950`: `F′ = ⟦1⟧_std ⋙ F` has no natural iso with termwise tilde | k = 𝔽₂ and k = ℚ; R = 0 and the shift `⟦0⟧` as controls | `F′(k[0]) ≅ F(Q(k[1])) ≅ Q(k~[1]) = O_X[1]`, with `H⁻¹ = O_X ≠ 0` since `Spec k` is a point and `O_X(Spec k) = k`; `(k[0])~ = O_X[0]`, with `H⁻¹ = 0` and `H⁰ = O_X`. For R = 0, `Spec 0 = ∅` and both sides are 0, so a field is the right test. `⟦0⟧` gives `F′ ≅ F`. | Pass |
| AF | `README:950`: F′ has F's type, and the Section 0.1 shift cannot precede F | Lean probe, generic `A : CommRingCat.{u}`, `i : HasDerivedCategory.{u}` | `Fprime A F : AffineEquivType A` elaborates; `shiftFunctor D_i 1 ⋙ F.functor` is rejected (`Functor.{u+1,u+1,…}` against `Functor.{u,…}`) | Pass |
| AG | `README:1021`–`1024`: `a′ = comparison ⋙ F′` admits no tensor comparison | k a field; shift `⟦n⟧` as a control | `a′(k) ≅ F(Q_std(k)⟦1⟧) ≅ O_X[1]`; `a′(k ⊗ᴸ_k k) = a′(k) = O_X[1]`, with `H⁻¹ = O_X`; `a′(k) ⊗ᴸ a′(k) = O_X[2]`, with `H⁻² = O_X` and `H⁻¹ = 0`. With `⟦n⟧` the two sides are `O_X[n]` and `O_X[2n]`, which differ exactly when n ≠ 0. | Pass |
| AH | `README:1023`: `a′` has the type of `a_k` | Lean probe | `aR A i F` and `aPrime A i F` both have type `@DerivedCategory (ModuleCat A) _ _ i ≌ DQCoh (Spec A)`; `aR A i F = (comparison A i).trans F` by `rfl` | Pass |
| U | Ownership of `MonoidalCategory.IsInvertible` | `README:3062`; #1891 `README:1877`–`1878` at `9f37291`; main `3090489` | "single owner" against "built here"; neither roadmap has the predicate on main | R01 |

The statements the diff leaves untouched carry forward:
- From r19's table: rows V, W, X, Z, AA, AC, AD and T, covering the definition of `a_R`, the uniqueness of F, `a_R(R[0]) ≅ O_X[0]`, the unit and Tor Checks of DMA.1, the supplier contracts, the Frobenius-root rows and the instance sentence at `README:996`–`1000`.
- r19 rows Y and AB were about the two Checks this diff rewrites, and rows AE–AH replace them.
- From r18's table: rows J–S.
- From r17's table: rows A–G.
- From r16's table: rows 1–16 and 18–22.

All of them passed there.

**Remarks on untouched or external text (no change requested).**
- Two open revisions of SchemeAndStackFoundations still change the Lean statement that `README:943` and `:190` describe:
  - #1276 (now `90139a9`, `Suggested.lean:589`–`592`) states full faithfulness and essential image of `(tilde.functor A).mapDerivedCategory`.
  - #1656 (`1bfff38`, `Suggested.lean:692`) renames it `DQCoh.nonempty_affineEquiv`, for any `HasDerivedCategory` instance.
- The text is correct against main. Whichever revision merges, the sentence "§2.18's Lean statement … asserts only that some equivalence … exists" then needs a refresh.

## Not verifiable

- Nothing that the changed passages cite was blocked. StacksInjectives (079P), StacksDerivedCategoriesOfSchemes (06Z0, read in r19), StacksMoreOnAlgebra and HA were read in the cache.
- §0.2's Stacks Cohomology on Sites locators (Lemma 21.17.11, §§21.18–21.19, §21.35) are not in the source cache. They fall outside the changed passages, earlier rounds verified them, and they were not re-read.
- Ownership against open pull requests was checked with `roadmaps grep` over all 457 open heads.

## Source issues

- none
