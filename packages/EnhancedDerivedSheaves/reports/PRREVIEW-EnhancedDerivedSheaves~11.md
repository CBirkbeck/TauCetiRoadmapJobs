# Review of EnhancedDerivedSheaves (pull request #1630 at cfbfa9c)

**Verdict:** needs changes

This is an incremental re-review of the 51 lines that changed since `9600471`, the head r10 read. The pins are unchanged: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. Here `README:N` and `Suggested.lean:N` mean the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`. Mathlib and Tau Ceti paths are relative to the library roots at the pins.

This head repairs r10 R01 and R02, and its other changes are correct. The only open finding is the pull-request description, carried from r10 R03.

## R01 (P3) — The description states no order with #1330 and still calls the change README-only

Location: the pull-request description (`scratch/pull-request.md`, data). It says: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)". Its revision line names only #1701.

Claim: the description tells the human approver how this change relates to main and to the other open pull requests.

Witness:
- `git diff --stat origin/main...HEAD` changes 535 lines of `Suggested.lean`.
- `roadmaps list` shows #1330 still open at `856fe7a`. `roadmaps overlaps EnhancedDerivedSheaves` reports that #1330 changes this folder's `README.md` and `Suggested.lean` and conflicts with this head.

Carried from r10 R03 (r9 R03, r8 R02, r7 R08). The r9 repair report answered it ("H03 — answered": the description should say that #1330 is superseded). It did not mark it `not actionable in this package`, and the description has not changed since.

Repair, in the description only:
- Add one sentence saying that this head supersedes #1330, which is to be closed or rebased on it.
- Replace "README only; no Lean change, so no importer is affected" with a sentence saying that `Suggested.lean` is rewritten (module form, the Tau Ceti import, the headline set) and that no roadmap imports it.

## Previous findings

- R01 — repaired: the Grothendieck abelian category is now `A` and the site is `C`. See `Suggested.lean:84` "`variable (A : Type u') [Category.{v} A] [Abelian A] [IsGrothendieckAbelian.{w} A]`", `Suggested.lean:99`–`100` "(`C : Type u` with `SmallCategory C`, `J : GrothendieckTopology C`, `O : Sheaf J RingCat.{u}`)", and `README:447` and `:462` "for `A : Type u'` with `Category.{v} A`, `Abelian A` …".
- R02 — repaired: `README:93` "`CategoryTheory.IsGrothendieckAbelian.of_equivalence` (which carries a Grothendieck abelian structure across an equivalence of abelian categories)".
- R03 — not repaired: the description still reads "README only; no Lean change, so no importer is affected", and its revision line names only #1701. Carried as R01.

## Verified sound

**How R01 was repaired.** r10 proposed renaming the site to `D` in the Lean docstring. The repair renamed the abelian category to `A` in both files instead, which removes the clash equally well:
- `C` now names only the site, in `README:462` ("(C,R)", "`C : Type u` with `SmallCategory C`", "`Category.{u} C` with `EssentiallySmall.{u} C`") and in `Suggested.lean:99`–`100`.
- `A` is also Stacks' own letter at 079P (`8042e600` line 883).
- No leftover refers to `C` as the abelian category: `grep` for "`HasKInjectiveResolutions C`", "`IsGrothendieckAbelian.{w} C`" and "`DerivedCategory C`" finds only `README:150`–`151`. Those lines are the From Tau Ceti contract, which quotes Tau Ceti's own signatures for an abelian `C`.
- `universe z` was dropped, and the file still builds, so `z` was unused.

**Gate, build, dependency check.** The worker's gate (`scratch/gate.md`) reports every counter zero, including `build=0`. My rerun on this head (`gate … --base origin/main`, exit 0) prints:

```text
gate EnhancedDerivedSheaves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check (`gate --depcheck … --movable`, exit 0) prints the line below. There is no UPWARD, CYCLE or `moved:` line.

```text
depcheck: 235 roadmaps, 2435 edges, 0 problem(s)
```

The other checks:
- HEAD is `cfbfa9cbfe08470d2c6ecd8c9c013127e0dc5f04` and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- The changes file lists no file changed outside the folder.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 with exactly 11 warnings, all `declaration uses sorry`, at lines 91, 111, 138, 174, 186, 197, 209, 247, 277, 290 and 298. The renamed docstring adds one line, which moves every later line down by one from r10.

A scratch copy with `#check @` of the four changed declarations gives the types below. Each is r10's type with `C` renamed to `A`, and it agrees with `README:447` and `:462`:
- `IsGrothendieckAbelian.hasKInjectiveResolutions` and `…instHasKInjectiveResolutions` have type `∀ (A : Type u_1) [Category.{u_2,u_1} A] [Abelian A] [IsGrothendieckAbelian.{u_3,u_2,u_1} A], TauCeti.HasKInjectiveResolutions A`.
- `…locallySmall_localization_quasiIso` has type `… LocallySmall.{u_3, max u_1 u_2, max u_1 u_2} (HomologicalComplex.quasiIso A (ComplexShape.up ℤ)).Localization`.
- `…hasDerivedCategory` has type `(A : Type u_1) → … → HasDerivedCategory A`.

`scratch/signatures.md` lists 23 entries:
- Four of them (`there;`, `;`, `` `IsGrothendieckAbelian.hasDerivedCategory`, ``, `for`) are words of the module docstring parsed as declarations.
- Its six "looks dropped" leads are false: the binders `[Category A] [Abelian A] [IsGrothendieckAbelian A]` and `[Category C] [MonoidalCategory C]` are in the elaborated types under renamed universes.

`TauCeti.HasKInjectiveResolutions` is a `Prop` class (Tau Ceti `Algebra/Homology/DerivedCategory/KInjective.lean:92`). So the global instance cannot form a data diamond with Tau Ceti's `ModuleCat` instance.

**One-tactic probes on the renamed statements.** All 6 fail, so these statements are not padding:
- For `hasKInjectiveResolutions`:
  - `infer_instance` fails to synthesize.
  - `simp` makes no progress.
  - `⟨fun K => by simp⟩` leaves `∃ I, (∃ x, QuasiIso x) ∧ I.IsKInjective`.
- For `locallySmall_localization_quasiIso`:
  - `infer_instance` fails to synthesize.
  - `simp` makes no progress.
  - `exact?` finds only `locallySmall_max`, which fails on the universe constraint `max (max u' v) ?u =?= w`. So the statement is trivial only when `w ≥ max u' v`, and the headline is the case below that.

**Pinned declarations opened (7), the names the diff adds to the contracts:**
- Mathlib `CategoryTheory.IsGrothendieckAbelian.of_equivalence` (`CategoryTheory/Abelian/GrothendieckCategory/Basic.lean:81`). It needs `[Abelian C] [Abelian D] [IsGrothendieckAbelian.{w} C] (α : C ≌ D)` and gives `IsGrothendieckAbelian.{w} D`. The gloss at `README:93` is right.
- `AdicCompletion.flat_of_isNoetherian` (`RingTheory/AdicCompletion/AsTensorProduct.lean:378`). It is an instance under `[IsNoetherianRing R]` (`:315`), for every ideal `I`: `Module.Flat R (AdicCompletion I R)`. The gloss at `README:94` is right. Its consumer is `README:857`.
- `AlgebraicGeometry.Scheme.AffineEtale.Spec : S.AffineEtale ⥤ S.Etale` (`AlgebraicGeometry/Sites/AffineEtale.lean:59`). It is faithful (`:63`), full (`:67`) and cover-dense (`:71`), so "its inclusion" (`README:107`–`108`) is fair. Its consumers are `README:480` and `:492`.
- `CategoryTheory.MonoidalClosed.enrichedOrdinaryCategorySelf` (`CategoryTheory/Monoidal/Closed/Enrichment.lean:61`). It is a `scoped instance` under `[MonoidalCategory C] [MonoidalClosed C]`. `CategoryTheory/Sites/Monoidal.lean:41` opens `MonoidalClosed`, so the enriched Hom hypotheses of `W.monoidal` (`:126`–`:128`) refer to this self-enrichment, as `README:480` says.
- `CategoryTheory.Functor.Final` (`C ⥤ D → Prop`). Its consumers are `README:243`, `:245`, `:252` and `:256`.
- `MvPowerSeries`. Its consumer is `README:857`.
- The Mathlib instance at `CategoryTheory/Abelian/GrothendieckAxioms/SheafOfModules.lean:23`–`24`, with binders `{C : Type u} [SmallCategory C] {J : GrothendieckTopology C} (R : Sheaf J RingCat.{u})`. These are exactly the binders of the new parenthetical in `README:462` and in `Suggested.lean:99`–`100`.

All six names resolve by `#check` at the pins with no `open`.

**Sources (the seeded targets the diff touches: 0.1 and 0.2).** The diff renames variables in their text and changes no locator. I reread the locators in the cache:
- Stacks, Injectives, Theorem 12.6 (tag 079P) is at `8042e600` line 883, p. 19. For a Grothendieck abelian category it gives a functorial quasi-isomorphism into a K-injective complex with injective terms, termwise injective. This is the statement of `README:447`, `:462` and `Suggested.lean:86`–`93`.
- Stacks, Cohomology on Sites, Lemma 17.11 (tag 06YS) is at `f1af633f` line 1342, p. 31, as cited.
- Stacks, Cohomology on Sites, §19 (tag 07A5) is at `f1af633f` line 1606, pp. 36–37, as cited.
- The seeded targets 0.3 and 0.4 are untouched. r8 verified them, and that verification is carried.
- The misprint that r10 recorded under *Source issues* (`f1af633f` line 1617) is the only source slip in these passages, and it is not repeated here.

**Ownership, overlaps, citations.**
- The diff adds no cross-roadmap citation and no declaration, so it needs no new ownership search.
- `scratch/overlaps.md` lists no dropped id and no id that only a revision defines.
- #1187's copy of this `Suggested.lean` (`roadmaps show … --pr 1187`) equals main's except for the header line, so #1187 needs no stated order. #1330 is R01.
- The 19 "found nowhere" names of `scratch/citations.md` are the same as at r10, which resolved them: 8 declarations of this `Suggested.lean` and 11 supplier targets.

**Headline theorems.** The diff does not change the headline set. The statable headlines stated in `Suggested.lean` are the 11 that r10 lists, and the unstatable families are named in the module docstring (`:41`–`:68`).

**Remarks on untouched text, no change asked:**
- `README:441` ("a nonzero sheaf A") and `:465` ("for every acyclic complex A") bind their own `A`, and each binding is explicit, so the new name of the abelian category creates no ambiguity.
- In `README:462` the ring sheaf is called R in "(C,R)" and `O` in the Mathlib parenthetical.

**Adversarial computations.** These rows are carried for the statements the diff leaves untouched:
- r8's 40 rows, from "0.1 local smallness" to "E2:towers.2 (native)" (r8, *Adversarial computations*).
- r9's 11 rows (r9, *Adversarial computations*).
- r10's rows 1–12 (r10, *Adversarial computations*).

Rows 13 and 14 of r10 are replaced by rows 2 and 7 below. Every row below is for a changed statement.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `Suggested.lean:91` `hasKInjectiveResolutions` | `#check @`; 3 one-tactic probes | type as in r10 with `C ↦ A`; probes: synth failure, no progress, open goal `∃ I, (∃ x, QuasiIso x) ∧ I.IsKInjective` | Pass, not padding |
| 2 | `Suggested.lean:96`–`101`, the instance docstring | `C : Type u`, `SmallCategory C`, `J`, `O : Sheaf J RingCat.{u}` | `inferInstance : TauCeti.HasKInjectiveResolutions (SheafOfModules.{u} O)` succeeds; the binders match `SheafOfModules.lean:23`–`24` | Pass (r10 R01 repaired) |
| 3 | `Suggested.lean:111` `locallySmall_localization_quasiIso` | `#check @`; 3 probes | `LocallySmall.{u_3, max u_1 u_2, …}`; `infer_instance` fails; `exact? ↦ locallySmall_max` needs `w = max (max u' v) _` | Pass, nontrivial for `w < max u' v` |
| 4 | `Suggested.lean:119` `hasDerivedCategory` | `A : Type u'`, `Category.{v} A`, `IsGrothendieckAbelian.{w} A`, `K L : DerivedCategory A` | `(K ⟶ L) : Type w` elaborates for independent `u'`, `v`, `w` | Pass |
| 5 | `README:454`, `A = ModuleCat.{u} R` | `u' = u+1`, `v = u`, `w = u` | with the instance, `(K ⟶ L) : Type u` elaborates; standard gives `Type (max u' v) = Type (u+1)`, as the Check says | Pass |
| 6 | `README:447`, étale coefficients | `X : Scheme.{u}`, `Λ : Type u`, `DerivedCategory (Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ))` | `(K ⟶ L) : Type u` elaborates | Pass |
| 7 | `README:93` `of_equivalence` gloss | `#check` | `IsGrothendieckAbelian.{w} C → (C ≌ D) → IsGrothendieckAbelian.{w} D`, with both sides abelian; `w` is kept while the Hom universes may change | Pass (r10 R02 repaired) |
| 8 | `README:94` `flat_of_isNoetherian` gloss | `I = ⊤`; `I = 0`; general `I` | `AdicCompletion ⊤ R = 0`, flat; `AdicCompletion 0 R ≅ R`, flat; Mathlib's instance covers every `I` once R is Noetherian | Pass |
| 9 | `README:107`–`108` `AffineEtale.Spec` "inclusion" | `#check`; the instances at `:63`, `:67`, `:71` | `S.AffineEtale ⥤ S.Etale`, full, faithful, cover-dense, as `README:480` uses it | Pass |
| 10 | `README:112`–`113` self-enrichment | `#check`; `Sites/Monoidal.lean:41` | `[MonoidalCategory C] [MonoidalClosed C] → EnrichedOrdinaryCategory C C`, scoped; `W.monoidal` opens `MonoidalClosed` | Pass |
| 11 | `README:91`, `:94`, the names `Functor.Final` and `MvPowerSeries` | `#check`; `grep` | `C ⥤ D → Prop`; `Type → Type → Type`; consumed at `:243`–`:256` and `:857` | Pass |
| 12 | `README:462` notation | `grep` of every `C`/`A` in the changed paragraphs | `A` is always the abelian category and `C` always the site; the bullet at `:465` rebinds `A` explicitly | Pass |

## Not verifiable

- none. The three Stacks locators of Sections 0.1–0.2 were read in the cache (`8042e600` line 883, `f1af633f` lines 1342 and 1606).

## Source issues

- none
