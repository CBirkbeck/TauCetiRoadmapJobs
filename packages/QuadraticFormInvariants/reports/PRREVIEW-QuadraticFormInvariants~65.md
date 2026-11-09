# Review of QuadraticFormInvariants (pull request #1411 at d6e2855)

**Verdict:** needs changes

This is an incremental re-review of the 38 lines changed in this folder since `49a703c`. All 38 are in `## Exact supplier contracts`, README lines 289–335. The three rewritten supplier bullets are correct against main, this head and the pins, and they introduce nothing new. The remark the previous report made about untouched text (the `ramificationIndex K L = 1` adaptation) is now written into the README.

Two P3 findings remain. Both concern the pull request as a whole, not this folder's text: no merge order is stated against #1797 and #1187, and `Completed/LocalGaloisGroups` is still not recorded where this review and its build read the pull request's folders.

## R01 (P3) — No order is stated against #1797 and #1187, whose heads conflict with this one in this folder

Re-raised: H06. This is the id the previous report cites; no later repair report was available to this review. That answer says the description lies outside this roadmap's files. The description is still the pull request's own text, and this head already edits it (its *Dependencies* paragraph now names `Completed/LocalGaloisGroups`). So the merge-order paragraph can be edited the same way.

**Location.** The *Merge order* paragraph of the pull request description, unchanged since `49a703c`: "This PR → #1410 … and → #1474 … #617 and #1215 amend the same roadmap: whichever of the three merges first, the other two are rebased onto it".

**Claim.** Every open pull request whose head conflicts with this one in this folder has a stated rebasing order.

**Witness.** `git merge-tree --write-tree HEAD <head>` at this head gives:
- against #1797 at `85b5c37`: "CONFLICT (content)" in `TauCetiRoadmap/QuadraticFormInvariants/README.md` and in `…/Suggested.lean`;
- against #1187 at `66ed0d4`: "CONFLICT (content)" in `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`.

**Repair.** Add two sentences to that paragraph:
- Say which of #1411 and #1797 merges first. The other then rebases onto it and drops its own `QuadraticFormInvariants` hunks rather than restating them.
- Say whether #1187 (the Tau Ceti bump) lands before or after this pull request. Whichever is later rebases its edit of this folder's `Suggested.lean`. In particular, #1187's import of `TauCetiRoadmap.ProfiniteCohomology.Suggested` is replaced by this head's single `import Mathlib` and `TauCeti.*` imports.

## R02 (P3) — `Completed/LocalGaloisGroups/Suggested.lean` is changed, but this review's folder list and build still omit it

Re-raised: H07 (as in the previous report). The author's half of the repair is done, but the edit is still outside the folders this review was given as the pull request's own, and the targeted build does not build it.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`:
- line 326: `⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩`;
- line 485: `⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`.

**Claim.** The pull request changes only folders that are recorded and built as its own.

**Witness.**
- `git diff --stat origin/main...HEAD`, excluding the three named folders, lists `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--`.
- Repaired since `49a703c`: the description's *Dependencies* paragraph now says the pull request's folders are "ClassFieldTheory, IntegralLattices, QuadraticFormInvariants and Completed/LocalGaloisGroups", and `roadmaps list` shows #1411 with LocalGaloisGroups.
- Still missing: the review brief names only `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/IntegralLattices/` as the pull request's own folders. The targeted build is `lake build TauCetiRoadmap.QuadraticFormInvariants.Suggested TauCetiRoadmap.GlobalQuadraticForms.Suggested`, and it does not build `Completed.LocalGaloisGroups.Suggested`.

**Repair.** Make no change in this folder, and keep the two lines: they match ClassFieldTheory's `≃+`-valued `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` at this head (`TauCetiRoadmap/ClassFieldTheory/Suggested.lean` 322–341).
- Ask for `Completed/LocalGaloisGroups` to be added to the folder list from which the board writes this pull request's review briefs.
- Ask for `Completed.LocalGaloisGroups.Suggested` to be added to the push gate's targeted build at this head. Alternatively, have the ClassFieldTheory review of this head record that it built that module.

## Previous findings

- R01 — not repaired: the description's merge-order paragraph still names only "#1410 … #1474 … #617 and #1215". #1797 (`85b5c37`) and #1187 (`66ed0d4`) still conflict in this folder. Carried as R01.
- R02 — partly repaired: the description now lists "ClassFieldTheory, IntegralLattices, QuadraticFormInvariants and Completed/LocalGaloisGroups" as the pull request's folders. The brief and the targeted build still omit `Completed/LocalGaloisGroups`. Carried as R02.

## Verified sound

**Gate and build.**
- The worker's gate at `d6e2855` (`scratch/gate.md`) passes every check, including `build=0` for the targeted build.
- My run with `--base origin/main` gives `outside-folder=4` and every other count `0`. The four files are `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/IntegralLattices/{README.md,Suggested.lean}`, all in folders the brief names as the pull request's own. That gate does not list the `Completed/LocalGaloisGroups` file; the three-dot diff does (R02).
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output.
- `git diff 49a703c HEAD -- …/Suggested.lean` is empty. The file still has 6 `example`s, 7 named declarations, one `export` and the local instance, with no `sorry` and no `set_option`.

**Signatures.** The seven elaborated types in `scratch/signatures.md` are character for character the ones the previous report checked. None lost a section binder.

**Dependency check, verbatim.** `depcheck: 236 roadmaps, 2277 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Changed passages, checked in full.**

*LocalFieldsRamification bullet* (README 287–301), against main `3090489` `Completed/LocalFieldsRamification/Suggested.lean`:
- These nine are reducible aliases of Tau Ceti's declarations: `normalizedValuation` (120), `ramificationIndex` (392), `inertiaDegree` (398), `natCastValuation` (456), `absoluteRamificationIndex` (480), `unitFiltration` (500), `teichmuller` (552), `normGroup` (847) and `UnitFiltrationGraded` (1148).
- `square_eq_range_powMonoidHom` (720–722) is the term `TauCeti.square_eq_range_powMonoidHom`.
- `map_norm_unitFiltration_zero` (857–862) and `mem_normGroup_iff_dvd_normalizedValuation` (870–875) both take `(h : ramificationIndex K L = 1)`. Each builds the instance from `(TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h` before applying the Tau Ceti term, as the new text says. The first applies `TauCeti.map_normUnits_unitFiltration K L 0`, which is "at depth `0`".
- At the Tau Ceti pin `2fd255d`:
  - `IsUnramified` is a class (`NumberTheory/LocalField/Unramified/Basic.lean:115`).
  - `isUnramified_iff_ramificationIndex_eq_one` is at `:127`. The residue extension's separability is automatic there.
  - `map_normUnits_unitFiltration (i : ℕ)` is at `Norm/Unramified/Basic.lean:126`, and `mem_normGroup_iff_dvd_normalizedValuation` at `:158`. Both run under the variable block at 64–67, which ends `[FiniteDimensional K L] [IsUnramified K L]`.
  - A `#check @` probe confirms all four types.
- `card_squareClasses_dyadic` (708–712) is still `sorry`, which is "that roadmap's prototype". 6A cites the Tau Ceti forms (README 1310–1311, 1338) and `LocalFieldsRamification.map_norm_unitFiltration_zero` (1349).

*ClassFieldTheory bullet* (README 302–321), against this head's `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`:
- `H` is `continuousCohomology i A` (238–240). That is Mathlib's `continuousCohomology` at `RepresentationTheory/Homological/ContCohomology/Basic.lean:131`.
- `muNRep` (265) is the abbreviation `TauCeti.ClassFieldTheory.muNRep n F`.
- `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt` and `finiteHilbertSupport` (737–750) are Tau Ceti abbreviations. `hilbertProductFormula` (754–757) is the term `TauCeti.ClassFieldTheory.hilbertProductFormula a b`.
- `kummerClass` (294–296) is `if hn : IsUnit (n : F) then TauCeti.ClassFieldTheory.kummerClass F hn a else 0`, which is "Tau Ceti's Kummer class where `n` is invertible … and `0` otherwise".
- `kummerClass_eq_kummerCocycleClass` (301–307) takes `hn` and is proved by `dite_eq_left_of_eq_true` followed by `TauCeti.ClassFieldTheory.kummerClass_eq_muNRepH1Equiv_kummerCocycleClass F hn hα`, found at Tau Ceti `NumberTheory/ClassFieldTheory/MuNRep.lean:300` with `kummerClass` at `:283`.
- ClassFieldTheory's README at this head says the same (961–967), and its Layer 5 (931) and Layer 14 (2344) are where the link says.
- These claims hold at this head and not on main, where `muNRep` is a `def` on `TauCeti.ofDiscreteModule` (main 747). This pull request carries both folders, so they merge together.

*ProfiniteCohomology bullet* (README 322–337):
- Main's `ProfiniteCohomology/Suggested.lean` 199–200 defines `abbrev TopRep … := _root_.TopRep.{u} R G` with `G : Type u`.
- Mathlib's `structure TopRep` (`RepresentationTheory/Continuous/TopRep.lean:31`, `universe w u v` at 27) has `V : Type w`. My probe gives `TopRep : (k : Type u_2) → (G : Type u_3) → … → Type (max (max u_2 u_3) (u_1 + 1))`, so its first universe is the carrier's. An `example` returning `X.V : Type u` for `X : TopRep.{u} R G` elaborates. So "the carrier in the universe of the group" holds.
- Tau Ceti declares no `TopRep` at the pin (grep), so the old wording, which listed `TopRep` among "Tau Ceti's declarations", was wrong and the change corrects it.

**Citations.**
- `roadmaps resolve` on the README now reports none.
- The four leads in `scratch/citations.md` are all false positives:
  - `LocalFieldsRamification.map_norm_unitFiltration_zero` is main's line 857;
  - `ProfiniteCohomology.f2Pairing` is main's `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:5332`;
  - `QuadraticFormInvariants.wittRing` and `toWittRing` are in the former-name column of the old → new table (README 2779).
- `roadmaps grep` finds the newly cited `kummerClass_eq_muNRepH1Equiv_kummerCocycleClass` only in ClassFieldTheory's copies at #617, #1215 and this head, always as Tau Ceti's name.

**Overlaps.**
- In `scratch/overlaps.md`, no id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id that others cite.
- Of the four conflicting pull requests, #617 and #1215 have a stated order; #1797 and #1187 do not (R01).
- The IntegralLattices changes since `49a703c` touch no line that mentions this roadmap (`git diff 49a703c HEAD -- TauCetiRoadmap/IntegralLattices | grep QuadraticFormInvariants` is empty).

**Seeded sample.** None of the 13 targets lies in the changed lines 289–335. All sit below them, shifted by +8 and otherwise unchanged:
- *Quaternion algebras are central simple* 1097, *quaternion symbol in `Br(K)`* 1113, *Hasse invariant* 1139;
- *Classification in dimension at most three* 1160, *Clifford invariant* 1170, *`I²` homomorphism* 1193;
- *Base change* 1231, *The symbol* 1487, *classical construction* 1511;
- *Milestone 1* 1749, *Milestone 2* 1768, *cup compatibility* 1793, *Evens value* 2495.

The previous reports' checks of them carry forward. As a spot check, I re-read Kahn Lemme II.2.1 at `kahn1984` line 763 (file page 28). It gives `(Tr a, −d N a) + (2, d)` when `Tr a ≠ 0` and `(2, d)` when `Tr a = 0`, as README 2499–2501 state.

**Adversarial table.** Rows M1–M7 are computed this round for the changed statements. Rows N1–N8 and 1–28 are carried from the previous report (r59), whose statements this diff leaves untouched. Notation: `(·,·)₂` is the 2-adic Hilbert symbol, `ε(u) = (u−1)/2` and `ω(u) = (u²−1)/8` mod 2.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| M1 | `map_norm_unitFiltration_zero` = Tau Ceti's at `i = 0` under `e = 1` (README 294–299) | `ℚ₂(√5)/ℚ₂`; `ℚ₂(√2)/ℚ₂`; `L = K` | `ℚ₂(√5)`: `e = 1`, `(5,u)₂ = (−1)^{ε(5)ε(u)} = +1` for `u = 1,3,5,7`, so every unit is a norm and the image is all of `ℤ₂ˣ`. `ℚ₂(√2)`: `e = 2`, so the hypothesis fails; `(2,u)₂ = (−1)^{ω(u)}` is `+,−,−,+` at `1,3,5,7`, so the unit norms are `{1,7}`, of index 2. `L = K`: `N = id` | holds; `e = 1` is needed | none |
| M2 | `mem_normGroup_iff_dvd_normalizedValuation`, same adaptation | `ℚ₂(√5)`, `f = 2`: `x = 2, 4, 5, 10` | `v = 1, 2, 0, 1`, so `f ∣ v` gives F, T, T, F. Symbols: `(5,2)₂ = −1`; `4 = N(2)`; `(5,5)₂ = (5,−1)₂ = +1`; `(5,10)₂ = (−1)(+1) = −1` | holds both ways | none |
| M3 | `IsUnramified K L ↔ ramificationIndex K L = 1` (README 298–299) | `ℚ₂(√5)`; `ℚ₂(√2)`; inseparable residue extension | `e = 1` and `𝔽₄/𝔽₂` separable gives T ↔ T. `e = 2` gives F ↔ F. An inseparable residue extension with `e = 1` would break `⇐`, but it is excluded because residue fields are finite (`IsNonarchimedeanLocalField`) | holds | none |
| M4 | ClassFieldTheory's `kummerClass` = Tau Ceti's where `n` is invertible, else `0` (README 310–311) | `ℚ₃`, `n = 2`, `a = −1`; `𝔽₂((t))`, `n = 2`, `a = t`; `n = 0`; `n = 1` | `ℚ₃`: `2` is a unit and `−1` is not a square (`3 ≡ 3 mod 4`), so the class is `≠ 0`. `𝔽₂((t))`: `(2 : F) = 0`, so the value is `0`, a junk value, and no QFI statement reaches it. `n = 0`: not a unit, so `0`. `n = 1`: `H¹(G, μ₁) = 0` on both readings | holds; junk branch is guarded | none |
| M5 | `kummerClass_eq_kummerCocycleClass` = Tau Ceti's lemma read through `kummerClass` (README 307–310) | `ℚ₃`, `n = 2`, `a = −1`, `α = i` | Under `hn` the `dite` reduces to Tau Ceti's `kummerClass F hn a`. Both sides lie in `continuousCohomology 1 (muNRep n F)` (probe). The cocycle `g ↦ g(i)/i` is `−1` on the generator of `Gal(ℚ₃(i)/ℚ₃)`, so it is nonzero, as in M4 | holds | none |
| M6 | ClassFieldTheory's `H` is Mathlib's `continuousCohomology`; the others are Tau Ceti's (README 304–307) | head 238–240, 265, 737–757 | 1 Mathlib abbreviation; 4 Tau Ceti abbreviations; 1 theorem whose proof is a Tau Ceti term. On main, `muNRep` is a `def` (747), so the claim is about this head | holds at this head | none |
| M7 | ProfiniteCohomology's `TopRep` is Mathlib's, with the carrier in the group's universe (README 331–332) | `TopRep.{u} R G`, `R : Type v`, `G : Type u`; wrong models | `X.V : Type u` elaborates. If the first universe were the scalars', `TopRep.{u} R G` with `R : Type v` would fail to elaborate. Wrong model "Tau Ceti's `TopRep`": none at the pin | holds | none (the old wording was wrong) |
| N1 | `hasseInvariant_eq_localHasse` (r59) | ℚ₂: `![−1,−1]`, `n = 0`, `![2,5,5]` | `(−1,−1)₂ = −1 = ε[ℍ]`; empty product `1`; `(2,5)(2,5)(5,5) = +1` | holds | none |
| N2 | README 24–35 declaration count (r59) | grep | 6 examples, 7 named, 1 `export`, 1 local instance | holds | none |
| N3 | LFR prototype vs proved (r59) | main 708–875; `ℚ₂` | 3 proved by Tau Ceti terms, 1 `sorry`; `4·2¹ = 8` | holds | none |
| N4 | Base change of `C(q)` (r59) | `⟨−1,−1⟩`, ℝ → ℂ | `ℍ ⊗ ℂ = M₂(ℂ)` | holds | none |
| N5 | Serre Théorème 1 (r59) | `ℚ(√3)`, `ℚ(i)` | `w₂ = (2)(3) ≠ 0`; `0 = (2)(−1)` | holds | none |
| N6 | the two further terms in the Clifford invariant vs `w₂` (r59) | `ℚ³`; `n = 2` | `c = [ℍ_ℚ] ≠ 0 = C₀`; `c = w₂` | holds | none |
| N7 | EKM References (r59) | 9 locators | pp. 55, 62, 57–58, 63, 63–64, 388, 389, 388, 61 | holds | none |
| N8 | Serre References (r59) | §1.1, §1.2, Th. 1, Th. 1′ | pp. 652, 652, 655; lines 560–561 | holds | none |
| 1 | Four-fold criterion (r55, r59) | ℚ₂ (5,5), (2,5); ℚ₃ (−1,−1) | `⟨1,−5,−5⟩` vanishes at (5,1,2); `−1`; split | holds | none |
| 2 | Product formula (r55, r59) | ℚ: (−1,−1) | `(−1)₂(−1)₃(+1)_∞` and `(−1)(−1) = +1` | holds | none |
| 3 | Local classification (r55, r59) | ℚ₃ `⟨1,1⟩` vs `⟨3,3⟩`; ℝ `⟨±1⁴⟩` | s: `+1` vs `−1`; same triple over ℝ but not isometric | holds | none |
| 4 | Cup-norm (r55, r59) | ℝ (−1,−1); 𝔽₃ | unsolvable and cup ≠ 0; `H² = 0` | holds | none |
| 5 | Evens value (r55, r59) | ℚ₂(i): `1+2i`, `i`, `3` | `(2)∪(5)`; `0`; `0` | holds | none |
| 6 | Relative `w₂` (r55, r59) | `a = 1+2i`; `a = 1`; trace 0 | both sides equal | holds | none |
| 7 | `hasseInvariant_eq_localHasse` vs trivial ε (r55, r59) | ℚ₂ | a constant ε is not injective on the 2-element `Q(K)` | discriminates | none |
| 8 | Central simplicity (r55, r59) | `ℍ[ℚ,−1,−1]`; `ℍ[K,4,b]` | division; `≅ M₂(K)` | holds | none |
| 9 | Quaternion symbol in `Br` (r55, r59) | `⟨2,−1⟩` vs `⟨1,−2⟩` | isometric, so both classes are `1` | holds | none |
| 10 | Hasse scaling formulas (r55, r59) | `λ•⟨a,b⟩` | `(λ,−1)(λ,ab)(a,b)` | holds | none |
| 11 | Classification in dim ≤ 3 (r55, r59) | ℝ, ranks 3 and 4 | 4 classes in rank 3; `⟨±1⁴⟩` collide | bound sharp | none |
| 12 | Clifford formula (r55, r59) | `n⟨1⟩`/ℝ, `n = 1..8` | `C(n+1,4)` parity matches | holds | none |
| 13 | `I²` additivity (r55, r59) | `⟨1,−1⟩⊥⟨a⟩`; `⟨−1⟩⊥⟨−1⟩` | `1 = 1·1`; `[ℍ] ≠ 1` | holds | none |
| 14 | Base change, Brauer (r55, r59) | ℝ → ℂ | `[ℍ] ↦ 1` | holds | none |
| 15 | The symbol (r55, r59) | ℚ₂ (−1,−1) | `−1` vs `+1` for the wrong form | discriminates | none |
| 16 | Classical construction (r55, r59) | ℚ₂(i)/ℚ₂ | norm classes `[1],[2],[5],[10]`, index 2 | holds | none |
| 17 | 6C item 13 (r55, r59) | ℝ; 𝔽₃; ℚ | `−1`; `H² = 0`; infinite `Br(ℚ)[2]` | holds | none |
| 18 | Milestone 1 (r55, r59) | ℚ₂ | `#Q = 2`, `ε[ℍ] = −1` | holds | none |
| 19 | Milestone 2 (r55, r59) | ℚ₂, ℚ₃ at (−1,−1) | `1/2 ↔ −1`; `0 ↔ +1` | holds | none |
| 20 | Cup compatibility (r55, r59) | ℚ₂ (2,5), (5,5) | `≠ 0 ↔ −1`; `0 ↔ +1` | holds | none |
| 21 | `discr` Checks (r55, r59) | `⟨1,−1⟩`, `⟨1,1⟩` | `[−1]`, `[1]` | discriminating | none |
| 22 | `localHasse` Checks (r55, r59) | ℚ₂ `![−1,2]` | `+1` vs O'Meara's `−1` | holds | none |
| 23 | Defect (r55, r59) | ℚ₂: 5/4, 20, −5 | `0`, `16ℤ₂`, `2ℤ₂` | holds | none |
| 24 | Odd-defect discriminant (r55, r59) | ℚ₂: −1, 3 | `−4`, `12` | holds | none |
| 25 | Clifford vs `w₂` (r55, r59) | `⟨1,1,1⟩`/ℝ | `(−1)∪(−1) ≠ 0` | holds | none |
| 26 | `hilbertSign` Checks (r55, r59) | ℚ, `a = b = ±1` | product `+1` | holds | none |
| 27 | The Fröhlich sentence (r55, r59) | Serre §1.2 | the reference was dropped and the Serre locators were kept | repaired earlier | none |
| 28 | LFR prototypes (r55, r59) | main 708–875 | 1 of 4 is a prototype | repaired earlier | now M1 |

**Library declarations opened.** 14 in all:
- 6 in Tau Ceti `2fd255d`: `IsUnramified`, `isUnramified_iff_ramificationIndex_eq_one`, `map_normUnits_unitFiltration`, `mem_normGroup_iff_dvd_normalizedValuation`, `ClassFieldTheory.kummerClass` and `ClassFieldTheory.kummerClass_eq_muNRepH1Equiv_kummerCocycleClass`.
- 3 in Mathlib: `TopRep`, `continuousCohomology` and `TopRepEquivActionTop`.
- 5 roadmap aliases: main LFR 120–1148, head ClassFieldTheory 238–341 and 737–757, and main ProfiniteCohomology 199–200.

**Headline theorems and padding.** `Suggested.lean` is unchanged, so the previous reports' headline list and one-tactic probe carry forward.

## Not verifiable

- The two `Completed/LocalGaloisGroups/Suggested.lean` lines (R02) were checked by reading the types only. Elaborating that file needs object files for `TauCetiRoadmap.ProfiniteCohomology.Suggested`, `Completed.ProfiniteProPGroups.Suggested` and `Completed.LocalFieldsRamification.Suggested`, which are not built here, and building roadmap modules is outside this review's commands.
- These sources are uncertified, as the previous report recorded, and none of them is cited in the changed lines: Lam, Gille–Szamuely, Serre's *Course in Arithmetic* and *Local Fields*, O'Meara, Scharlau, Milnor and Delzant.
- Ownership against open pull requests was checked for the changed passages only, with `roadmaps grep` and `scratch/overlaps.md`.

## Source issues

- none
