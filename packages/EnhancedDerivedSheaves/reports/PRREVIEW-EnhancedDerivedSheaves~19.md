# Review of EnhancedDerivedSheaves (pull request #1630 at 8200f10)

**Verdict:** needs changes

This is an incremental re-review of the 48 README lines that changed since `ae7b6e6`. `Suggested.lean` did not change: `git diff --stat ae7b6e6 HEAD` lists only `README.md`. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` and `Suggested.lean:N` refer to the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`. A line `#PR file:N` gives the line in that pull request's file at its head.

The folder-side repairs of this round are correct. R01 and R02 below are the two description-level items carried from r18, and they are unchanged. R03 is a small wording slip in one of the new Checks.

## R01 (P2) — Two open pull requests both claim to own `MonoidalCategory.IsInvertible`

Carried from r18 R02 (r17 R01).

**Location:** `README:3062`: "Section 0.3 is the single owner of invertible objects of a monoidal category, `MonoidalCategory.IsInvertible`". The definition is at `README:591` and `Suggested.lean:178`.

**Claim:** §0.3 is the only owner of the predicate, and EtaleCohomologyFoundations consumes it.

**Witness:** EtaleCohomologyFoundations at #1891 (`bdbf9b3`, unchanged), `README:1830`–`1831`, still reads "(the predicate MonoidalCategory.IsInvertible, built here)". `roadmaps grep 'MonoidalCategory.IsInvertible'` finds it only in #1630 and #1891.

**Repair:** keep §0.3 as the owner, and add this sentence to this pull request's description: "#1891 merges after this pull request; before it merges, `README:1830`–`1831` there replaces 'built here' by 'EnhancedDerivedSheaves §0.3'." The folder needs no change.

## R02 (P3) — The description misstates what changes and gives no order against #1330

Carried from r18 R03 (r17 R02 and earlier).

**Location:** the description: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."

**Claim:** only the README changes, and no order against other pull requests is needed.

**Witness:** `git diff --stat origin/main...HEAD` reports `Suggested.lean | 585 +++-----` next to `README.md | 1421`. `overlaps.md` lists #1330 (`856fe7a`, draft). It changes both files of this folder and conflicts with this head.

**Repair:** in the description, replace the quoted sentence with: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it, and every name it drops that another roadmap cites is mapped to its pinned Tau Ceti declaration in Scope and ownership." Then state the order against #1330. For example: "This pull request supersedes #1330, which is closed rather than merged."

## R03 (P3) — The new E1.8 Check compares equivalences with different source categories

**Location:** `README:950`: "applying the shift `⟦1⟧` of `D(k)` before `F` gives another equivalence of the type of `Coherent.DQCoh.affineEquiv`. … So it admits no natural isomorphism with termwise `M ↦ M~`, and it is not `a_k`."

**Claim:** the shifted equivalence is a competitor of `a_k`.

**Witness:** `README:943` sets "`D(R)` under the instance of Section 0.1", and F has source `HasDerivedCategory.standard`. The shifted equivalence has the type of `affineEquiv`, with source the standard derived category, while `a_k` has source the Section 0.1 category. So "it is not `a_k`" compares different types.

**Repair:** at `README:950`, replace "applying the shift `⟦1⟧` of `D(k)` before `F` gives another equivalence" by "`F′`, the shift `⟦1⟧` of the derived category of `HasDerivedCategory.standard (ModuleCat k)` followed by `F`, is another equivalence". Then replace "So it admits … and it is not `a_k`." by "So `F′` admits no natural isomorphism with termwise `M ↦ M~` and cannot replace `F` in `a_k`."

**Test on the instance:** the probe term `(shiftEquiv (DerivedCategory (ModuleCat.{u} R)) (1 : ℤ)).trans F` has type `DerivedCategory (ModuleCat.{u} R) ≌ DQCoh (Spec R)`, the same as F. With R = k it sends `k[0]` to `O_X[1]`. Its `H⁻¹` is `O_X ≠ 0`, while `H⁻¹((k[0])~) = 0`. The repaired sentence compares F′ with F, which have the same type. The DMA.1 Check at `README:1021`–`1025` already has the right shape: its `a′` "has the same type as `a_k`".

## Previous findings

- R01 — repaired: `README:943` defines `a_R` as the instance comparison followed by "an equivalence `F` … that comes with a natural isomorphism" to termwise tilde followed by `DerivedCategory.Q`. `README:998`–`1000` uses it, "not an arbitrary equivalence of that type". The repair introduced R03.
- R02 — not repaired: #1891 `README:1830`–`1831` still reads "(the predicate MonoidalCategory.IsInvertible, built here)", and the description is unchanged. Carried as R01.
- R03 — not repaired: the description still says "README only; no Lean change, so no importer is affected" and does not mention #1330. Carried as R02.
- R04 — repaired: `README:175` lists `TauCeti.iterateFrobeniusEquiv_symm_mem_frobeniusRootIdeal` ("every `p^n`-th root of f lies in `J_f`"). `README:837` adds "each of which lies in `J_f`" with that name. It agrees with the table row at `README:46`.

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `8200f10`, and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty, and `changes.md` lists no file outside the folder.
- I reran `gate … --base origin/main`. It exited 0, printed every counter as 0 and ended with `OK`. The worker's gate also reports `build=0 OK`.
- The dependency check (`gate --depcheck … --movable`, exit 0) printed:

```text
depcheck: 236 roadmaps, 2289 edges, 0 problem(s)
```

**Elaboration.**
- `lake env lean Suggested.lean` exits 0 with exactly 10 warnings, all "declaration uses `sorry`", at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279. These are the same lines as in r17 and r18.
- No Lean statement changed, so r18's `#check @` signature comparison stands. The 6 leads in `signatures.md` are the false positives r18 resolved: the binders `[Category A] [Abelian A] [IsGrothendieckAbelian A]` and `[Category C] [MonoidalCategory C]` are present.
- No padding probe was run.

**Lean probe of the new E1.8 text (scratch file, elaborated with `lake env lean`, 0 errors).**
- It copies SchemeAndStackFoundations' `Coherent.instHasDerivedCategoryModules` and `Coherent.DQCoh` from main (`Suggested.lean:1521`–`1531`).
- `(AlgebraicGeometry.tilde.functor R).mapHomologicalComplex (ComplexShape.up ℤ)` elaborates. The additive instance it needs is at `Mathlib/AlgebraicGeometry/Modules/Tilde.lean:379`.
- The uniqueness claim "any two such `F` are naturally isomorphic" is proved in the probe, for any `[HasDerivedCategory (ModuleCat R)]`. The two given isomorphisms become `Localization.Lifting` instances, `Localization.liftNatIso … (Iso.refl _)` gives `F₁ ⋙ ι ≅ F₂ ⋙ ι`, and `((ObjectProperty.fullyFaithfulι _).whiskeringRight _).preimageIso` gives `F₁ ≅ F₂`.
- The shifted equivalence has the type of F; see R03.
- This formulation needs no exactness instance on `tilde.functor`. It is statable at the pins, whereas `Functor.mapDerivedCategory` would need such an instance.

**Library declarations opened at the pins.**
- Mathlib:
  - `AlgebraicGeometry.tilde.functor` (`AlgebraicGeometry/Modules/Tilde.lean:233`).
  - `AlgebraicGeometry.tildeSelf : tilde (ModuleCat.of R R) ≅ SheafOfModules.unit _` (same file, `:411`).
  - `CategoryTheory.Functor.mapHomologicalComplex` (`Algebra/Homology/Additive.lean:103`), with `singleMapHomologicalComplex` (`:262`) for `R[0] ↦ R~[0]`.
  - `CategoryTheory.Localization.liftNatIso` (`CategoryTheory/Localization/Predicate.lean:357`).
  - `DerivedCategory.Q` (`Algebra/Homology/DerivedCategory/Basic.lean:95`).
- The Section 0.1 instance comparison, which the changed text cites:
  - `Localization.uniq` (`Predicate.lean:438`, with D₁ and D₂ in arbitrary universes) and `compUniqFunctor` (`:447`).
  - `Functor.commShiftOfLocalization` (`CategoryTheory/Shift/Localization.lean:181`).
  - `DerivedCategory.mem_distTriang_iff` (`Basic.lean:198`) and `HasDerivedCategory.standard` (`Basic.lean:81`).
  - `MorphismProperty.hasLocalizationOfLocallySmall` (`CategoryTheory/Localization/LocallySmall.lean:37`) and `CochainComplex.IsKInjective.Qh_map_bijective` (`Algebra/Homology/DerivedCategory/KInjective.lean:42`).
- Tau Ceti: `TauCeti.iterateFrobeniusEquiv_symm_mem_frobeniusRootIdeal` (`RingTheory/Perfect/FrobeniusRootIdeal.lean:83`). It is stated over a `CommSemiring` with `[ExpChar R p] [PerfectRing R p]`, which covers README's perfect `𝔽_p`-algebras. `frobeniusRootIdeal` (`:64`) takes R and p explicitly, as `README:837` writes it.

**Cross-roadmap citations resolved.**
- SchemeAndStackFoundations on main (`1bea835`):
  - `Coherent.DQCoh.affineEquiv` is `letI := HasDerivedCategory.standard (ModuleCat.{u} A); Nonempty (… ≌ DQCoh (Spec A))` (`Suggested.lean:1534`–`1536`).
  - `README:3975`–`3976` describes it as "`M ↦ M~` is an equivalence", and `README:4030`–`4031` says the Lean statement asserts only existence.
  - This matches `README:190` and `README:943` here, and it supplies the existence of the tilde-compatible F that E1.8's *Needs:* cites. So the prerequisite has an owner.
- DerivedModuleAlgebra §0.2 at #1701 (named as merging first in the description) is unchanged since r18. The `README:996`–`998` instance sentence matches r18's check.

**Seeded sample, where it falls in the changed passages.**
- §0.1 is cited by the changed E1.8 text. Theorem 19.12.6, tag 079P, is at StacksInjectives line 883 (any complex in a Grothendieck abelian category has a functorial K-injective resolution). The instance-comparison names are listed above.
- §§0.2–0.4 did not change and are cited by no changed passage. r16 and r17 verified them, and they were not re-read.
- New locator, Stacks Derived Categories of Schemes Lemma 36.3.5 (06Z0), p. 4: at StacksDerivedCategoriesOfSchemes line 145 (page marker line 133). For any ring A, the termwise tilde functor `D(A) → D_QCoh(O_X)` is an equivalence of triangulated categories. This supports "for every commutative ring R" as written.
- The unchanged BS17 locators of the same paragraph: the discussion after Lemma 3.18 identifies `Dqc(Spec A)` with `Dqc(A)` (BS17 lines 679–682, p. 15). Section 11 treats `Dqc(−)` as presheaves of spaces (lines 1854–1866, p. 40).

**Ownership and overlaps.**
- The change adds no object. It pins which equivalence of §2.18 is consumed and cites Mathlib.
- `roadmaps grep 'affineEquiv'` finds consumers (#858, #868) and no second owner of the tilde equivalence.
- No cited id is dropped (`overlaps.md`; the gate reports `dropped=0`).
- #1187 conflicts only through the pin bump, and #1330 is R02.

**Adversarial computations.** Rows V–AD are new and were computed at this head.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| V | `README:943`: `a_R` = comparison then F, with `Q ⋙ F ⋙ ι ≅ tilde_termwise ⋙ Q` | R = ℤ, `K = (ℤ/2)[0]`; R = 0 | `a_ℤ((ℤ/2)[0]) ≅ Q((ℤ/2)~[0])`, with `H⁰ = (ℤ/2)~` and other `Hⁿ = 0`; `Spec 0 = ∅`, every object of `D(0)` and of `DQCoh ∅` is zero, so any F qualifies and the conditions are vacuous but consistent | Pass |
| W | `README:943`: any two such F are isomorphic | probe, generic R | `F₁ ⋙ ι ≅ F₂ ⋙ ι` by `liftNatIso` on `Iso.refl`, then `F₁ ≅ F₂` by `preimageIso` | Pass (elaborated) |
| X | `README:943`: `a_R(R[0]) ≅ O_X[0]` | R = k a field; R = ℤ | `(k[0])~ = k~[0] = O_X[0]` by `tildeSelf` and `singleMapHomologicalComplex`; the same for ℤ | Pass |
| Y | `README:950` shift Check | k a field, `F′ = shift ⋙ F` | `F′(k[0]) = O_X[1]`, `H⁻¹ = O_X ≠ 0` (`Spec k ≠ ∅`); `(k[0])~` has `H⁻¹ = 0` | Mathematics passes; typing is R03 |
| Z | `README:1016`–`1017` unit Check | R = ℤ, `M = ℤ/2` | `ℤ[0] ⊗ᴸ ℤ/2 ≅ ℤ/2`; `O_X ⊗ᴸ (ℤ/2)~ ≅ (ℤ/2)~`, with `a_ℤ(ℤ[0]) ≅ O_X[0]` | Pass |
| AA | `README:1018`–`1020` Tor Check | R = ℤ, `K = L = 𝔽_p`, p = 2 and p = 3 | module side `Tor₀ = Tor₁ = 𝔽_p` in degrees 0 and −1; sheaf side `(𝔽_p)~` in degrees 0 and −1 (affine Tor sheaves are tilde of Tor); the same for p = 2 and 3 | Pass |
| AB | `README:1021`–`1025` `a′` Check | k a field | `a′(k ⊗ᴸ k) = a′(k) = O_X[1]` with `H⁻¹ = O_X`; `a′(k) ⊗ᴸ a′(k) = O_X[2]` with `H⁻¹ = 0` and `H⁻² = O_X`; so no isomorphism at `(k, k)` | Pass |
| AC | `README:139`–`144` and `:190` supplier contracts | pins and main | each Mathlib name exists at the line listed above; `tilde.functor` is additive (`:379`); §2.18's prose `M ↦ M~` (`README:3976`) and existence-only Lean statement (`Suggested.lean:1534`) | Pass |
| AD | R04 repair, `README:175` and `:837` | `f = t` in `𝔽_p[t^{1/p^∞}]` with n = 1; `f = 0` | `t^{1/p} ∈ J_t` and `t^{1/p} ∉ (t)`; `0^{1/pⁿ} = 0 ∈ J₀ = 0` | Pass |
| T | r18 R01, `README:996`–`1000` | R = k with `F∘[1]`; R = ℤ with tilde | now excluded by the natural isomorphism (`O_X[1]` against `O_X[0]` at `k[0]`); for tilde, both sides are `𝔽_p` in degrees −1 and 0 | Pass (repaired) |
| U | Ownership of `MonoidalCategory.IsInvertible` | `README:3062`; #1891 `README:1830`–`1831` | "single owner" against "built here" | R01 |

The statements the diff leaves untouched carry forward:
- From r18's table: rows J–S. These cover Kunz flatness, the regular pd bound, Serre's criterion, Tor of perfect rings, the Frobenius-root rows, countable products in replete categories, and the instance sentences at `README:459`, `:200`, `:574` and `:763`–`769`.
- From r17's table: rows A–G.
- From r16's table, through r17 and r18: rows 1–16 and 18–22.

All of them passed there.

**Remarks on untouched or external text (no change requested).**
- Two open revisions of SchemeAndStackFoundations change the Lean statement that `README:943` and `:190` describe:
  - #1276 (`125e33d`, `Suggested.lean:589`–`592`) restates `DQCoh.affineEquiv` as full faithfulness and essential image of `(tilde.functor A).mapDerivedCategory`.
  - #1656 (`1bfff38`, `Suggested.lean:692`) renames it `DQCoh.nonempty_affineEquiv`, for any `HasDerivedCategory` instance.
- Revisions are not dependencies, and the text is correct against main. Whichever of them merges, the sentence "§2.18's Lean statement … asserts only that some equivalence … exists" then needs a refresh.

## Not verifiable

- Nothing was blocked. Every text that the changed passages cite was read in the cache: StacksDerivedCategoriesOfSchemes (06Z0), StacksInjectives (079P), StacksMoreOnAlgebra (064K, 06Y4, 064L, 064M, read in r18 and unchanged) and BS17 (Lemma 3.18, §11).
- Ownership against open pull requests was checked with `roadmaps grep` over all 458 open heads, for `MonoidalCategory.IsInvertible`, `affineEquiv` and `tilde.functor`.

## Source issues

- none
