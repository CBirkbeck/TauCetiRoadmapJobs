# Review of QuadraticFormInvariants (pull request #1411 at c87c808)

**Verdict:** needs changes

This is a full review. It found five findings, all P3; none is P1 or P2.
- R01–R03 are in this folder: a supplier misdescription, a source cited with no reference plus two stale locators, and a proof helper the README never names.
- R04–R05 are about the pull request as a whole: they carry forward the previous review's R08 and R09.

The worker's gate passes, and `Suggested.lean` elaborates with no output. The dependency check is clean. Every computed Check and worked example holds.

## Previous findings (review of 37bd865)

| Previous | Status at c87c808 | Evidence |
|---|---|---|
| R01 (P2), `tr` missing from the comparison | repaired | README 1626–1638 and 2196–2206 state `tr : H²(G_K, μ₂) ≃+ ZMod 2`. They say it exists over a local field and `ℝ` and not over `𝔽₃`. The alias is gone from `Suggested.lean`, and table row 2773 maps it. This matches `TauCeti.hilbertSymbol_eq_cohomological`, which takes `ζ`, `hζ` and `tr` (`FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:191`). |
| R02, nine unconsumed re-exports | repaired | `Suggested.lean` now has 252 lines and keeps only the eight names that GlobalQuadraticForms and OrthogonalSpinGroups use in Lean (docstring 41–47, README 24–34). The old → new table is at README 2763–2775. |
| R03, `signedDiscr` and `localHasse_congr` dropped with no mapping | repaired | Table rows 2766 and 2771 map them; both `#check` at the pin. |
| R04, IntegralLattices as an importer | repaired | README 2735–2738. IntegralLattices' `Suggested.lean` at this head imports no module of this roadmap, and its README (lines 506–507) cites Tau Ceti names. |
| R05, two Checks that do not discriminate | repaired | The Check at 1245–1249 now says it tests only the second exponent, and the new `⟨1,1,−1⟩` Check (1250–1253) tests the first. The inert `discr` Check is deleted. |
| R06 (a–d), four misdescribed names | repaired | (a) README 1526–1531; (b) README 1188–1198; (c) README 271; (d) README 968. |
| R07, six milestones with no locator | repaired | The EKM, Milne and Serre locators I read all hold, except one page number (R02(b)). |
| R08, no order against #1797 and #1187 | not repaired | R04 below. |
| R09, edit outside the reviewed folders | not repaired | R05 below. |
| R10, Grove, O'Meara 1955 and Delzant | repaired | Grove and O'Meara 1955 are no longer cited, and Delzant is now in References (2809–2811). A new uncited work, Fröhlich, appeared in Layer 8 (R02(a)). |

## R01 (P3) — Two of the three LocalFieldsRamification "prototypes" are proved Tau Ceti aliases

Location: `TauCetiRoadmap/QuadraticFormInvariants/README.md` lines 293–296: "Its `LocalFieldsRamification.square_eq_range_powMonoidHom`, `LocalFieldsRamification.card_squareClasses_dyadic` and `LocalFieldsRamification.mem_normGroup_iff_dvd_normalizedValuation` are that roadmap's prototypes".

Claim: all three are unproved prototypes.

Witness: on main, `Completed/LocalFieldsRamification/Suggested.lean` proves two of them from Tau Ceti:
- `square_eq_range_powMonoidHom` (lines 720–722) is `TauCeti.square_eq_range_powMonoidHom`;
- `mem_normGroup_iff_dvd_normalizedValuation` (lines 870–875) is proved from `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`.

Only `card_squareClasses_dyadic` (lines 708–712) is `sorry`.

Repair: move the two proved names into the previous sentence's list, which reads "are Tau Ceti's declarations under that roadmap's names". Keep `LocalFieldsRamification.card_squareClasses_dyadic` as the one prototype. Nothing else changes, because 6A already states its results against `TauCeti.square_eq_range_powMonoidHom` (line 1302) and `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (line 1329).

## R02 (P3) — Fröhlich is cited with no reference or locator; one EKM page and the manifest lag the new citations

(a) Fröhlich has no reference or locator.
- Location: README lines 2308–2309: "Fröhlich and Serre state their trace-form results with `w₂` against the Witt invariant, with correction terms of `(2) ∪ (d)` type". Line 2318 also names Fröhlich.
- Claim: two sources state their trace-form results this way.
- Witness: neither source has a locator. References (2777–2827) has no Fröhlich entry, and `packages/QuadraticFormInvariants/sources.toml` has no key for it. The Serre half is checkable: `serre1984cmh` lines 53–56 (§1.2, p. 652) call `w₂` the Witt invariant, and line 147 (Théorème 1, p. 655) gives `w₂(Q_E) = e*s_n + (2)(d_E)`.
- Repair: replace the sentence with: "Serre calls `w₂` itself the Witt invariant (Serre, Comment. Math. Helv. 59 (1984), §1.2, p. 652). His formula for `w₂` of the trace form of an étale algebra `E` (Théorème 1, p. 655) carries the correction term `(2) ∪ (d_E)`; read for `c(q)`, it acquires the two terms of the identity below." At line 2318, write "maps Serre's and Kahn's statements onto it". Alternatively, keep Fröhlich and add A. Fröhlich, *Orthogonal representations of Galois groups, Stiefel–Whitney classes and Hasse–Witt invariants*, J. Reine Angew. Math. 360 (1985) 84–123 to References and to the manifest, with a locator at the claim. Tau Ceti's module documentation (`FieldTheory/QuadraticForm/StiefelWhitney/Clifford.lean` lines 29–38 and 57–58) gives that reference.

(b) One EKM page is off by one.
- Location: README lines 1229–1230: "`C(q) ⊗_K L ≅ C(q_L)` by the universal property of the Clifford algebra (EKM §11, p. 58)".
- Witness: the statement `C(ϕ_K) = C(ϕ)_K` is at `ekm2008` line 3076, printed p. 57. Page 58 has the universal property (line 3128).
- Repair: write "EKM §11, pp. 57–58".

(c) The manifest does not record the new citations.
- Location: the manifest records `ekm2008` with locator "II §7", cited for "Layers 0–4". It records `serre1984cmh` as cited for "Layer 9".
- Witness: the README now cites:
  - EKM Lemma 14.2, Theorem 14.3, §11, Corollary 12.5, §98.C, §98.E and Example 98.2 in Layers 5, 6C and 6E, and §10 and Example 13.5 under Excluded;
  - Serre §1.1 (p. 652) in 6E, 7B item 6 and 7C.
- Repair: add these locators and layers to the two entries.

## R03 (P3) — A private helper in `Suggested.lean` is named nowhere in the README

Location: `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` lines 109–118, `private theorem localHasse_eq_prod_prod_Ioi`, used once at line 196. README lines 24–31 say that, besides the six examples, the file declares "only the eight names" consumers use.

Claim: the README and the Lean file agree.

Witness: the README never mentions `localHasse_eq_prod_prod_Ioi`. The helper restates the definition of `localHasse` in the `∏ i, ∏ j ∈ Ioi i` shape of `TauCeti.RegularFormClass.localHasse_mk`.

Repair: delete the helper, and replace `rw [localHasse_eq_prod_prod_Ioi]` and `exact this` at the end of `hasseInvariant_eq_localHasse` with:

```lean
  rw [localHasse, Finset.prod_filter, Fintype.prod_prod_type]
  refine this.trans (Finset.prod_congr rfl fun i _ => ?_)
  rw [← Finset.prod_filter]
  congr 1
  ext j
  simp
```

Tested: a scratch copy with this change elaborates under `lake env lean` with no diagnostics. `#check @hasseInvariant_eq_localHasse` gives the same type as before.

## R04 (P3) — No order is stated against #1797 and #1187, whose heads conflict with this one in this folder

Not repaired since the previous review (its R08). No repair report marks it as not actionable.

Location: the "Merge order" paragraph of the pull request description. It names only #1410, #1474, #617 and #1215.

Witness: the overlap check at this head reports conflicts with two more pull requests:
- #1411 and #1797 conflict in `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`. #1797's head has its own 295-line `Suggested.lean`.
- #1187 and #1411 conflict in `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`. #1187 carries main's 3846-line file, re-pinned.

Repair: say in that paragraph which of #1411 and #1797 merges first, and that the other is then rebased onto it without restating its changes. Do the same for #1187: rebasing it onto this head replaces its copy of this folder's `Suggested.lean`.

## R05 (P3) — `Completed/LocalGaloisGroups/Suggested.lean` is edited outside the folders reviewed as this pull request's own

Not repaired since the previous review (its R09).

Location: `Completed/LocalGaloisGroups/Suggested.lean` lines 326 and 485.

Witness: outside the three reviewed folders, `git diff --stat origin/main...HEAD` lists only this file, with 2 changed lines. The description now names that folder as one of the pull request's own, but the review brief does not. ClassFieldTheory's revision forces the edit:
- on main, `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` are `Nonempty` theorems (main's `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` lines 1131 and 1138);
- at this head they are `abbrev`s (lines 322 and 333).

Repair: choose one of two.
- In ClassFieldTheory, keep the two theorem names at main's `Nonempty` types and give the data-valued equivalences new names. The completed roadmap then needs no edit.
- Have `Completed/LocalGaloisGroups` registered and reviewed as a folder of this pull request.

## Verified sound

**Gate and build.**
- The worker's gate at c87c808 passes every check, including `build=0` for the targeted build of this module and `GlobalQuadraticForms.Suggested`.
- My re-run with `--base origin/main` gives `outside-folder=4`. It lists only `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/IntegralLattices/{README.md,Suggested.lean}`, which this pull request owns. Every other listed check is 0. That run stops before the build, so I elaborated the file directly.
- `lake env lean` on `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output in 37 s.
- The file has no `sorry`, no `set_option` and no sorry'd data. It imports `Mathlib` and 12 `TauCeti.*` modules, each present at the pin.

**Dependency check.**
- Output: `depcheck: 236 roadmaps, 2273 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- The roadmap is on main, and every supplier it names is on main: ClassFieldTheory, ProfiniteCohomology, LocalFieldsRamification (Completed) and RepresentationTheory/SemisimpleAlgebras.

**Signatures.** I put a `#check @` for each of the 8 declarations in one scratch file and elaborated it:
- the declarations are `discr`, `hilbertSymbol`, `localHasse`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse`, plus the exported `formClass`;
- the types equal those in `signatures.md`, and none lost a section binder;
- each matches its README statement and generality. For example, `hilbertSymbol_mul` carries `[IsNonarchimedeanLocalField K] [Invertible (2 : K)]`, as README 1557–1558 says, and `hilbertSymbol_neg_self` holds over every field, as README 1550–1551 says.

**Library names.**
- I extracted 713 backticked dotted names from the README. Every non-roadmap short name is declared in the pinned Mathlib or Tau Ceti. Two leads resolved:
  - `Algebra.GrothendieckAddGroup` comes from `@[to_additive]` at `Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean:36`;
  - `TauCeti.hyperbolicClass` is a `public def` at `LinearAlgebra/QuadraticForm/Hyperbolic.lean:214`.
- A scratch file `#check`ed 51 declarations of the changed passages in full. 50 resolve. The 51st, `RegularFormClass.quaternionSubgroupSignEquiv_apply_hasseInvariant`, is in a module that file did not import; `Suggested.lean` imports that module, uses it, and elaborates. Among the 50, with paths under `TauCeti/`:
  - `index_normGroup_of_isCyclic` (`NumberTheory/ClassFieldTheory/Brauer/LocalH2Bound.lean:70`, `K L : Type`);
  - `quadraticNormSubgroup_index_eq_two_of_not_isSquare` (`.../QuadraticForm/Bimultiplicativity.lean:82`, any universe);
  - `localSymbol_eq_zero_iff_cup` (`MuTwo/LocalSymbol.lean:157`);
  - `cliffordInvariant_add_of_signedDiscr_eq_zero` (`RegularFormClass/Clifford.lean:657`) and `WittRing.cliffordInvariant_add_of_mem_fundamentalIdeal_sq` (`Witt/Clifford.lean:93`), each needing only one summand in `I²`;
  - `QuaternionAlgebra.instIsSimpleRing` and `instIsCentral` (`Algebra/Quaternion/CentralSimple.lean:69, 151`);
  - the three Milestone 2 declarations (`NumberTheory/LocalField/Quaternion/Invariant.lean:67, 79, 92`), all at `K : Type`;
  - `hilbertSign_sum` (`Data/ZMod/IntUnitsPower.lean:90`);
  - `ClassFieldTheory.hilbertProductFormula` (`.../Hilbert/Reciprocity.lean:65`, `K : Type`);
  - `BrauerGroup.baseChange_quaternionClass` (`Algebra/Quaternion/BaseChange.lean:201`);
  - `RegularFormClass.discr_mk` and `signedDiscr` (`RegularFormClass/Discriminant.lean:129, 260`);
  - `RegularFormClass.localHasse_congr` (`.../QuadraticForm/Hasse.lean:108`);
  - `RegularFormClass.exists_of_realization` (`Realization.lean:113`, `d` additive);
  - `exists_unramified_class` and `hilbertSymbol_unramified` (`UnramifiedClass.lean:206, 263`).
- All 172 `TauCeti/…` paths in the README exist at the pin, with brace groups expanded, and so do the 28 path cells of the supplier table.

**Cross-roadmap citations resolved.**
- Consumers on main:
  - GlobalQuadraticForms' `Suggested.lean` lines 63–66, 261, 367, 460, 468, 488 and 498–499 use seven names, all declared at this head. The gate built it against this head.
  - OrthogonalSpinGroups' lines 84–86 use three, all declared.
  - Every name GlobalQuadraticForms' README cites from this namespace (lines 121–129, 616) is either declared or a row of the old → new table.
  - No open pull request's Lean file uses a deleted name (a `roadmaps grep` over the open heads).
- ClassFieldTheory at this head:
  - Layer 5 is at README line 931 and Layer 14 at line 2344.
  - Its Conventions (237–238) put the whole development at universe 0, which supports README 1774–1776.
  - Every contract name is declared in its `Suggested.lean`: `H` 238, `muNRep` 265, `kummerClass_eq_kummerCocycleClass` 301, the Layer 14 names 737–754.
- ProfiniteCohomology on main:
  - Layers 0–4 and 8–13 are at lines 583–2163, and Layer 10 includes all-degree corestriction.
  - The six names the README calls prototypes are `sorry` at lines 431, 3868, 5145, 5332, 5537 and 5846; the names it calls Tau Ceti's are aliases (for example `galoisSubgroup` 5820).
- LocalFieldsRamification Layers 0–2 are at lines 72, 281 and 576; SemisimpleAlgebras Layers 4–6 at 249, 274 and 293. `map_norm_unitFiltration_zero` (Completed `Suggested.lean` 857) is proved from `TauCeti.map_normUnits_unitFiltration`, as README 292 says.
- QuadraticFormInvariantsPartII (#1834) owns exactly this roadmap's three exclusions.

**Overlap and ownership.**
- The overlap check reports no dropped id, and no id that only an open revision defines.
- The open revisions of this folder (#617, #1215, #1797, #1187) are revisions, not second owners.
- No declaration in `Suggested.lean` has the fully qualified name of a declaration in another roadmap I could read.
- GlobalQuadraticForms on main states that this roadmap "owns all field-generic and nonarchimedean local form theory", which agrees with Scope.

**Headlines.** The README's six headline theorems are:
- the four-fold criterion (Layer 2);
- Hilbert's product formula (6C);
- the local classification (6D);
- the cup-norm theorem (7C);
- the Evens value (Layer 9);
- the relative `w₂` formula (Layer 9).

All six are stated in `Suggested.lean`, and the docstring rightly says none is unstatable. Each closes by one `exact` of the named Tau Ceti theorem. That is because the roadmap is native at the pin, and these are the acceptance test, not padding. The other declarations are the consumers' aliases, plus the helper of R03.

**Sources read.**
- EKM:
  - Lemma 14.2 (`ekm2008` 3434–3435, p. 63) requires only the first form's discriminant trivial, both even-dimensional, as README 1188 says;
  - Theorem 14.3 (3444–3456, pp. 63–64);
  - Corollary 12.5 (3309–3311, p. 61);
  - Example 98.2 (20341–20344, p. 388) and §98.C base change (20370–20372, p. 388);
  - §98.E (20422–20425, p. 389);
  - §10 on p. 55 (2986).
- Milne:
  - III Theorem 2.1 (`milne-cft` 4685, p. 103) and Remark 2.8 (4811, p. 106);
  - Theorem 4.4(d) (5119, p. 113), whose Step 2 (5041–5042) allows characteristic `p` prime to `n`;
  - Remark 4.7 (5173–5177, p. 115).
- Serre, Comment. Math. Helv. 59: §1.1 (`serre1984cmh` 43–46, p. 652), the quaternion class as a cup and the vanishing criterion; §1.2 (53–56); Théorème 1 (146–147, p. 655); Théorème 1′ (560–562).
- Kahn: Lemme II.2.1 (`kahn1984` 763–765, p. 241) and its proof (776–788), which is exactly README 2488–2491 and the step-6 computation.

**Adversarial table.** 28 rows. Values are computed on both sides; "s" is the Hasse invariant and "d" the discriminant.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Four-fold criterion (L2; `Suggested.lean` 69) | ℚ₂ (5,5), (2,5); ℚ₃ (−1,−1); `a = 1` | (5,5): `25 − 20 = 5`, and `⟨1,−5,−5⟩` vanishes at (5,1,2), so all five hold. (2,5): Serre exponent `ε(1)ε(5)+ω(5) = 0+1`, so −1 and all five fail. ℚ₃: `1+1 ≡ −1 mod 3` lifts, so it splits and `⟨1,1,1⟩` is isotropic. `a = 1`: `b = ((b+1)/2)² − ((b−1)/2)²` | holds | none |
| 2 | Product formula (6C14; 142) | ℚ: (−1,−1), (2,3) | (−1,−1): −1 at 2 and ∞, so the product is +1. (2,3): `(2,3)₂` exponent `0+ω(3) = 1` gives −1; `(2,3)₃ = (2/3) = −1`; ∞ gives +1; product +1 | holds | none |
| 3 | Local classification (6D; 156) | ℚ₃ `⟨1,1⟩` vs `⟨3,3⟩`; ℝ `⟨1⁴⟩` vs `⟨−1⁴⟩`; rank 0 | ℚ₃: both d `[1]`; s = +1 vs `(3,−1)₃ = (−1/3) = −1`, so not isometric. Indeed `⟨3,3⟩` misses 1, because norms from unramified ℚ₃(i) have even valuation. ℝ: same triple (4, [1], +1), signatures ±4, so the local hypothesis is needed. Rank 0: both sides true | holds | none |
| 4 | Cup-norm (7C; 207) | ℝ (−1,−1); ℚ₂ (5,5), (2,5); 𝔽₃ | ℝ: `x²+y² = −1` unsolvable and cup ≠ 0. ℚ₂: as row 1. 𝔽₃: `H²(Ẑ, μ₂) = 0`, so the cup is 0, and every binary form over 𝔽₃ is universal (`−1 = 1²+1²`) | holds both ways | none |
| 5 | Evens value (L9; 222) | ℚ₂(i): `a = 1+2i`, `i`, `3`; ℚ₂(√5): `a = 2` | `1+2i`: Tr 2, N 5, so `(2)∪(5)+(2)∪(−1) = (2)∪(5) ≠ 0`. `i`: Tr 0, so `(2)∪(−1) = 0`. `3`: `(6)∪(9) = 0`, and `N(res y) = (3)∪(3)+(−1)∪(3) = 0`. ℚ₂(√5), 2: `(4)∪(−20)+(2)∪(5) = (2)∪(5) = (2)∪(2)+(5)∪(2)` | holds; agrees with `galoisEvens2_galoisRes1` | none |
| 6 | Relative `w₂` (L9; 239) | ℚ₂(i) `a = 1+2i`; `a = 1`; Tr `a` = 0 | `1+2i`: LHS `w₂⟨2, −2/5⟩ = (2)∪(−2)+(2)∪(5) = (2)∪(5)`; RHS `(2)∪(−1)+(2)∪(5)+(−1)∪(5) = (2)∪(5)`. `a = 1`: both `(2)∪(d)`. Tr 0: LHS `w₂⟨1,−1⟩ = 0`; RHS `(2)∪(d)+(2)∪(d)+(d)∪(N a) = 0` | holds | none |
| 7 | `hasseInvariant_eq_localHasse` (6E; 181) | ℚ₂ `![−1,−1]`; wrong model: trivial ε | `[ℍ(−1,−1)] ≠ 1` maps to `−1 = (−1,−1)₂`. A constant ε is not injective on `Q(K)`, which has two elements (`natCard_quaternionSubgroup`) | holds, discriminates | none |
| 8 | Central simplicity (L5) | `ℍ[ℚ,−1,−1]`; `ℍ[K,4,b]` | Division: the sum of four squares is anisotropic over ℚ. `ℍ[K,4,b] ≅ ℍ[K,1,b] ≅ M₂(K)` (`rescaleIEquiv`, `oneEquivMatrix`). EKM 98.E gives `(L/F,b)` central simple of dimension 4 | holds; locator correct | none |
| 9 | Quaternion symbol in `Br(K)` (L5) | `⟨2,−1⟩` vs `⟨1,−2⟩` over ℚ | `⟨2,−1⟩` represents 1 (`2−1`), with the same determinant −2, so the forms are isometric and `[(2,−1)] = [(1,−2)] = 1`. A bilinear pairing nonzero at `([2],[−1])` breaks `quaternionClass_congr` | holds | none |
| 10 | Hasse formulas (L5) | `⟨a⟩⊥⟨b⟩`; `λ•⟨a,b⟩`; `λ•⟨a,b,c⟩` | `(a,b) = 1·1·(a,b)`. n=2: `(λa,λb) = (λ,−1)(λ,ab)(a,b)`. n=3: `s·(λ,−1)³·(λ,(abc)²) = s·(λ,−1)³·(λ,d)²` | holds | none |
| 11 | Dim ≤ 3 classification (L5) | ℝ, ranks 3 and 4 | Rank 3: `⟨1,1,1⟩` ([1],1), `⟨1,1,−1⟩` ([−1],1), `⟨1,−1,−1⟩` ([1],[ℍ]), `⟨−1,−1,−1⟩` ([−1],[ℍ]). Rank 4: `⟨±1⁴⟩` both ([1],1) and not isometric | holds; bound sharp | none |
| 12 | Clifford formula (L5) | `n⟨1⟩`/ℝ, n = 1..8; `⟨1,1,−1⟩`; `I²` with m = 1..6 | `C(n+1,4)` = 0,0,1,5,15,35,70,126, matching ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ. `⟨1,1,−1⟩`: `C₀` has anticommuting generators `e₁e₂` (square −1) and `e₁e₃` (square +1), so it is M₂ℝ and `c = 1 = 1·[ℍ]·[ℍ]`. Parities of `m(m−1)/2` (0,1,1,0,0,1) equal those of `C(2m+1,4)` | holds; both exponents exercised | none |
| 13 | `I²` additivity (L5) | `⟨1,−1⟩⊥⟨a⟩`; `⟨1,−1⟩⊥⟨a,b⟩`; `⟨−1⟩⊥⟨−1⟩`/ℝ | `c⟨1,−1,a⟩ = (−1,a)(−1,−a)(−1,−1) = 1 = c⟨1,−1⟩c⟨a⟩`. `c⟨1,−1,a,b⟩ = (−1,ab)(a,b)(−1,−ab)(−1,−1) = (a,b)`. `c⟨−1,−1⟩ = [ℍ] ≠ 1·1` | holds; the warning is correct | none |
| 14 | Base change (L5) | `⟨−1,−1⟩` along ℝ → ℂ | `[ℍ] ↦ [ℍ⊗ℂ] = [M₂ℂ] = 1 = (−1,−1)_ℂ`. EKM 98.C p. 388; `C(ϕ_K) = C(ϕ)_K` is on p. 57 | holds | R02(b) |
| 15 | The symbol (6C) | ℚ₂ (−1,−1) against the `x²+ay²` reading; ℚ (−1,3), (−1,7), (−1,21) | −1 against +1 (`−1 = 0²−1²`). On ℚ: −1, −1, −1, whereas bimultiplicativity would force `(−1)(−1)` | holds, discriminates | none |
| 16 | Classical construction, index (6C) | ℚ₂(i)/ℚ₂ | The norm classes are `[1]`, `[2]=1+1`, `[5]=1+4`, `[10]=1+9`: 4 of 8, so the index is 2; −1 and 3 are not norms. Universes as stated (`K L : Type` against any universe) | holds; Milne correct | none |
| 17 | 6C item 13 with `tr` | ℝ; 𝔽₃; ℚ | ℝ: `H²(C₂, ℤ/2) = ℤ/2`, and `(−1)∪(−1) ≠ 0` gives the sign of 1, `−1 = (−1,−1)_ℝ`. 𝔽₃: cd Ẑ = 1, so `H² = 0` and no `tr` exists. ℚ: `Br(ℚ)[2]` is infinite, so no `tr` exists | holds as restated | none (previous R01) |
| 18 | Milestone 1 (6E) | ℚ₂ | `natCard_quaternionSubgroup = 2`; `Q(ℚ₂) = {1, [ℍ(−1,−1)]}`; `ε[ℍ] = −1 = (−1,−1)₂` | holds | none |
| 19 | Milestone 2 (6E) | ℚ₂ and ℚ₃ at (−1,−1) | `inv = 1/2 ↔ −1` over ℚ₂; `inv = 0 ↔ +1` over ℚ₃. The three declarations take `K : Type`, matching ClassFieldTheory's universe 0 | holds | none |
| 20 | Cup compatibility (6E) | ℚ₂ (2,5), (5,5) | `(2)∪(5) ≠ 0 ↔ −1`; `(5)∪(5) = 0 ↔ +1`; Serre §1.1 says the same | holds | none |
| 21 | `discr` Checks (L3) | rank 0; `⟨1,−1⟩`, `⟨1,1⟩`; `⟨1⟩`, `⟨4⟩` | `[1]`. `[−1]`, `[1]`, while the signed version gives `[1]`, `[−1]`. `[1]`, `[1]` | three Checks, all discriminating | none |
| 22 | `localHasse` Checks (6C7) | ℚ₂ `![−1]`, `![−1,2]` | `![−1]`: +1, against −1 for `i ≤ j`. `![−1,2]`: `s = +1`; O'Meara's symbol is `−1 = s·(−2,−1)₂` | holds | none |
| 23 | Defect (6B) | ℚ₂: 5/4, 20, −5; ℚ₂(√2) with d = 1 | `δ(5/4) = 0` (ξ = 1/2); `𝔡(20) = 16ℤ₂`; `𝔡(−5) = 2ℤ₂`. Over ℚ₂(√2), e = 2: `U(4)(𝒪ˣ)²` has index 8/2 = 4 in `𝒪ˣ`, against index 2 for the unit norms | holds | none |
| 24 | Discriminant at odd defect (6B) | ℚ₂, a = −1 and 3 | d = 1, e = 1, so `𝓂² = 4ℤ₂`; the discriminants of ℤ₂[i] and ℤ₂[√3] are −4 and 12 | holds | none |
| 25 | Clifford against `w₂` (L8) | `⟨1,1,1⟩`/ℝ | `w₂ = 0`, d = 1 and `A₃ = B₃ = 1`, so `ι(c) = (−1)∪(−1) ≠ 0`, the class of `ℍ = C₀⟨1,1,1⟩` | holds | none |
| 26 | `hilbertSign` Checks (6C14) | ℚ, a=b=1 and a=b=−1 | a=b=1: every invariant is 0, so the reversed sign gives −1 at ∞. a=b=−1: invariants 1 at 2 and ∞, so the product is `(−1)(−1) = +1` | holds | none |
| 27 | The Fröhlich sentence (L8) | Serre §1.2 and Théorème 1 | Serre names `w₂` the Witt invariant; `w₂(Q_E) = e*s_n + (2)(d_E)`. Fröhlich has no reference and no key | Serre half holds | R02(a) |
| 28 | The LocalFieldsRamification "prototypes" | main's `Suggested.lean` 708–722, 857–875 | `card_squareClasses_dyadic := sorry`; `square_eq_range_powMonoidHom` and `mem_normGroup_iff_dvd_normalizedValuation` are Tau Ceti terms | 1 of 3 is a prototype | R01 |

## Not verifiable

The manifest records these works as uncertified, and none has a legal open copy, so I did not read them:
- Lam: III.2.7, III.2.11, V.3.4, V.3.16–3.21 and pp. 119–120. These carry the sampled locators for the quaternion symbol, the Hasse invariant, the dimension-≤3 classification and the Clifford invariant.
- Gille–Szamuely 1.1.9, 1.5.2, 4.4 and 4.7.
- Serre, *A Course in Arithmetic*, III and IV.
- Serre, *Local Fields*, X and XIV §2.
- O'Meara 63:11–13, 63:17–23 and 71:18.
- Scharlau Ch. 2 §5.
- Milnor §4.
- Delzant.

I checked the mathematics these locators carry by computation instead (rows 1–3 and 7–26).

## Source issues

- none
