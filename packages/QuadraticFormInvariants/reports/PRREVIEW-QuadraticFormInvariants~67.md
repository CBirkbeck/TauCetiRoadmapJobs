# Review of QuadraticFormInvariants (pull request #1215 at 6aa9b5b)

**Verdict:** accepted

This is an incremental re-review. It covers the 56 changed lines since `693a416` (22 insertions, 34 deletions, all inside `TauCetiRoadmap/QuadraticFormInvariants/`). Both findings of the previous review are repaired. The repairs introduce no new problem, and this report has no findings.

## Previous findings

- R01 — repaired: `Suggested.lean` no longer has a `section Layer6D`. Its sections are now `Layer6C` (lines 41–61) and `Layer6E` (lines 63–103), and `grep example` finds nothing. The docstring at lines 11–12, "cited here and not restated", is now true.
- R02 — repaired: README 1789–1794 cite "ClassFieldTheory Layer 5 for `Br K`, the local invariant … and the local symbol; Tau Ceti's normalized invariant `TauCeti.ClassFieldTheory.h2MuEquivZMod` (`…/Brauer/RootsOfUnity.lean`) … for every nonarchimedean local field `K : Type` in which `2` is invertible".

## Verified sound

### Repair of R01 (the Layer 6D `example` removed)

- **Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output: no `sorry` warning and no other warning.
  - The file has one `import Mathlib` and four `TauCeti.*` imports, all unchanged.
  - It has no `set_option`, no `lemma` and no `example`.
  - There are four declarations: `hilbertSymbol`, `localHasse`, the `private` helper `localHasse_eq_prod_prod_Ioi`, and `hasseInvariant_eq_localHasse`.
  - The undeclared universe names `v` and `w` that the example used are gone. Only `universe u` remains.
- **The 6D headline is still reachable.** A scratch copy of the file with `#check @` lines appended elaborates under the same four imports.
  - `#check @QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` prints the statement the deleted example made: `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [Invertible 2]`, finite-dimensional `V` and `W`, `Q`, `hQ`, `{R}`, `hR`, and `Equivalent Q R ↔ finrank = finrank ∧ discr = discr ∧ localHasse = localHasse`.
  - The docstring's citation (line 18) therefore resolves with the file's own imports. The theorem lives in `TauCeti/NumberTheory/LocalField/QuadraticForm/Classification.lean`, which is reached through `…/QuadraticForm/Brauer.lean`, so no import became unused.
- **Signatures.** The same probe printed:
  - `hilbertSymbol : {K : Type u_1} → [Field K] → Kˣ → Kˣ → ℤˣ`;
  - `localHasse : {K} → [Field K] → {n : ℕ} → (Fin n → Kˣ) → ℤˣ`;
  - `hasseInvariant_eq_localHasse` with all five instance binders `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [Invertible 2]`.

  Each matches its README statement (6C item 1 at line 1555 and item 7 at line 1574, 6E Milestone 1 at lines 1728–1741). No binder was lost, and none of them changed in this diff.
- **README agreement.** The following passages are now true as written:
  - lines 23–25: `Suggested.lean` "names the declaration that proves each and does not restate it";
  - lines 403–405: "without restating them";
  - line 1675: the 6D classification cites the same pinned theorem on forms.
- **Lean consumers.**
  - At this head, the only Lean file outside the folder that imports this module is `Completed/OrthogonalSpinGroups/Suggested.lean`. Its lines 84–86 `#check` exactly the three kept names.
  - `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` at this head no longer imports the module. On main it does, and it uses only `hilbertSymbol`, `localHasse` and names this pull request's GlobalQuadraticForms revision replaces.
  - The deleted `example` had no name, so nothing can cite it.

### Repair of R02 (`h2MuEquivZMod` attributed to Tau Ceti)

- **What ClassFieldTheory names, at this head.** `TauCetiRoadmap/ClassFieldTheory/README.md`:
  - Layer 5, lines 1081–1082: "`H²(F, μ_n) ≃ ZMod n` for every `n ≠ 0` in mixed characteristic (`h2MuEquivZMod_mixed`)".
  - The table of names used elsewhere, line 290: `h2FpEquivZMod_of_mu` → `h2EquivZModOfMuNRepIso`, which "assumes `IsUnit (n : F)` and an isomorphism `muNRep n F ≅ T`".
  - The scope paragraph, line 161, uses the same two names.
  - The bare `h2MuEquivZMod` occurs nowhere in that README or in its `Suggested.lean` at this head.

  The new sentence at README 343–347, "names … only as the characteristic-zero existence statement … (its Layer 5) and as the transport … (its table of names used elsewhere)", is exact. For a nonarchimedean local field, characteristic zero and mixed characteristic coincide.
- **Pinned Tau Ceti, `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean`.**
  - Line 68: `variable (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]`.
  - Line 89: `def h2MuEquivZMod (hn : IsUnit (n : F)) : continuousCohomology 2 (muNRep n F) ≃+ ZMod n`, built from `(invMap F).toAddMonoidHom.comp (h2MuToBr n F)`.
  - Line 103: `toRatAddCircle_h2MuEquivZMod`, which states `ZMod.toRatAddCircle n (h2MuEquivZMod F hn x) = invMap F (h2MuToBr n F x)`. This is "reads `invMap` through … `h2MuToBr`".
  - Line 145: `h2MuEquivZMod_mixed [CharZero F] … : Nonempty (…)`.
  - Line 156: `h2EquivZModOfMuNRepIso … := (…mapIso e…).symm.trans (h2MuEquivZMod F hn)`. This is "from which that transport is defined".
  - `h2MuToBr` itself is at `Brauer/Torsion.lean:67`. The README names it without a file, which is correct.
- **6E Milestone 2's hypotheses.** `TauCeti/NumberTheory/LocalField/Quaternion/Invariant.lean`:
  - Lines 60–63 take `K : Type` with `[IsNonarchimedeanLocalField K]` and `[Invertible (2 : K)]`.
  - Line 95 passes `isUnit_of_invertible (2 : K)` to `h2MuEquivZMod`.

  So "for every nonarchimedean local field `K : Type` in which `2` is invertible" (README 1793–1794) is the pinned generality.
- **File list of the ClassFieldTheory contract.** `RootsOfUnity.lean` was correctly dropped from the list. Each remaining name is in a listed file:
  - `muNRep` and `kummerClass` are in `MuNRep.lean`;
  - `kummerCupPairing` and `localSymbol` are in `Local/Symbol.lean`;
  - `invMap` is in `Brauer/Invariant.lean`;
  - `finiteHilbertInvariantAt` and `hilbertProductFormula` are in `Global/Hilbert/{Invariant,Reciprocity}.lean`.
- **The rest of the README.** No other passage attributes `h2MuEquivZMod` to a roadmap:
  - Line 1644 (6C item 13) names it only as the witness `tr`.
  - The 6C *Needs:* (lines 1662–1666) cite ClassFieldTheory Layers 5 and 14 only for the local symbol and reciprocity.
  - Line 1771 says it "is stated in universe `0`", which matches `F : Type`.
- **Layer 6 Dependencies (lines 1837–1846).** They add `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean`, which exists at the pin, and keep ClassFieldTheory Layers 5 and 14.
- **Remark, no change needed.** The contract (line 350) says 6C item 13 "uses" `h2MuEquivZMod`. The Dependencies line lists the file only for 6E. Item 13's theorem `hilbertSymbol_eq_cohomological` takes `tr` as an argument and names `h2MuEquivZMod` only as an instance, so the Dependencies line is the accurate one and both texts are true.

### Gate, build, dependency check, overlaps

- **The worker's gate** (`gate.md`): every check is 0, `build=0`, `OK`.
- **My rerun** of the gate reports `outside-folder=4`. All four hits are `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/GlobalQuadraticForms/{README.md,Suggested.lean}`, which the brief names as this pull request's own folders, so they are not findings. Every other check is 0.
- **Changes outside the three folders.**
  - `git diff --stat origin/main...HEAD` outside the three folders lists only `Completed/LocalGaloisGroups/Suggested.lean`. It is unchanged since `693a416`, and the description names it and says why it changes.
  - `git diff --stat 693a416..HEAD` touches only this folder's two files.
- **Dependency check output:** `depcheck: 234 roadmaps, 2271 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Overlaps.** `overlaps.md` lists no ids this README cites that an open pull request drops, no ids only an open revision defines, and no ids this pull request drops that others cite.
  - The open pull requests that change this folder (#1411, #617, #1187) are ordered after this one in the description's merge-order block.
  - `roadmaps grep` finds no roadmap on main or open that cites `h2MuEquivZMod` against this roadmap.
  - QuadraticFormInvariantsPartII (open head) neither cites `h2MuEquivZMod` nor any Layer 6D Lean declaration of this namespace.
- **Ownership.** The diff adds no object. `h2MuEquivZMod` is now credited to its actual owner, the pinned Tau Ceti.
- **Policy.** The new text has no process words, no pull-request numbers and no LaTeX. Every backticked name in it is a pinned Tau Ceti declaration, so the gate's `readme-ids-missing=0` holds.

### Headline theorems

The README (lines 11–15, 22–25) and the docstring (lines 14–23) list five headlines. The pinned Tau Ceti proves all five, and the docstring cites each one, unrestated:

- `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae` (Layer 2);
- `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` (6D, elaborated above);
- `TauCeti.cup_kummerClass_eq_zero_iff` (7C);
- `TauCeti.galoisEvens2_kummerClass` and `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` (Layer 9).

None is absent or forced through a stand-in. No `sorry` remains, so the padding probe has nothing to close. The three kept declarations are the names a roadmap on main imports, as in the previous review.

### Adversarial pass (values on each side)

The rows for statements the diff changes or re-anchors come first, with values computed for this review.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Contract: CFT names only `h2MuEquivZMod_mixed` and the transport; the normalized map is Tau Ceti's (README 343–355) | `ℚ_2`, `n = 2`; `𝔽₃((t))`, `n = 2`; `𝔽₂((t))`, `n = 2`; any `F`, `n = 1` | `ℚ_2`: `CharZero` holds, so both `_mixed` and `h2MuEquivZMod` apply. `𝔽₃((t))`: `CharZero` fails, so `_mixed` is silent. `(2 : 𝔽₃((t))) = −1` is a unit, so `h2MuEquivZMod` is defined. `𝔽₂((t))`: `2 = 0`, so neither applies, matching this roadmap's `[Invertible 2]`. `n = 1`: `ZMod 1 = 0` and `H²(F, μ₁) = 0`, a trivial equivalence | holds |
| `h2MuEquivZMod` normalization ("reads `invMap` through `h2MuToBr`") | `ℚ_2`, class `y` with `h2MuToBr y = [(−1,−1)]`; wrong model `−invMap` | `invMap[ℍ_{ℚ_2}] = 1/2`, so `toRatAddCircle 2 (h2MuEquivZMod y) = 1/2` and `h2MuEquivZMod y = 1`. Under `−invMap` the value is `−1/2 = 1/2`, so at `n = 2` the sign is insensitive to the Frobenius convention. For `n = 3` it would send `1/3 ↦ 2`, which `toRatAddCircle_h2MuEquivZMod` excludes | holds |
| 6E Milestone 2 with its new *Needs:* (README 1746–1794) | `ℚ_2 (−1,−1)`; `ℚ_3 (−1,−1)`; `𝔽₃((t)) (t,−1)` | `ℚ_2`: `invMap = 1/2`, `h2MuEquivZMod = 1`, `(−1,−1)_2 = −1`. `ℚ_3`: `[(−1,−1)] = 0`, so `h2MuEquivZMod = 0 ≠ 1` and `(−1,−1)_3 = +1`. `𝔽₃((t))`: the tame symbol gives `(t,−1) = (−1 \| 𝔽₃) = −1`, since `−1` is a nonsquare mod `3`, so `invMap = 1/2` and `h2MuEquivZMod = 1`. That is the case the old `_mixed` attribution could not supply, and Tau Ceti's `[Invertible (2 : K)]` covers it | holds |
| Universe remark against the new citation (README 1766–1774) | `h2MuEquivZMod` at the pin | `F : Type` (RootsOfUnity line 68), as "stated in universe `0`". `hilbertSymbol_eq_cohomological` is universe-polymorphic and takes `tr` | holds |
| 6D headline after the deletion (docstring line 18; README 1672–1679) | `ℚ_2`: `⟨1,1⟩` vs `⟨−1,−1⟩`; `ℝ`: `⟨1⁴⟩` vs `⟨(−1)⁴⟩`; rank 0 | `ℚ_2`: `(2,[1],+1)` vs `(2,[1],−1)`, not isometric, since `(−1,−1)_2 = −1` means `−1 ≠ x²+y²`. `ℝ`: both are `(4,[1],+1)` but not isometric, so `[IsNonarchimedeanLocalField K]` is needed, and the elaborated `#check` carries it. Rank 0: both sides true | holds |
| `Suggested.lean` docstring "cited here and not restated" | declaration count | 0 `example`s; 3 public declarations plus 1 `private` helper, as at lines 27–31 | holds |

The following rows are carried forward from the previous review (r66 at `693a416`). The diff leaves their statements untouched, and the values are as computed there.

| Statement | Instances | Values (r66) | Result |
|---|---|---|---|
| Four-fold criterion (L2) | `ℚ_2 (2,5)`, `(5,5)`; `a = 1` | `(2,5)_2 = −1`, so all five conditions fail. `5 = 25 − 20`, so all hold. `b = ((b+1)/2)² − ((b−1)/2)²` | holds |
| Cup-norm (7C) | `ℚ_2 (2,5)`, `ℝ (−1,−1)`, `a = 1` | `(2)∪(5) ≠ 0`, matching `5 ≠ x²−2y²`. `(−1)∪(−1) ≠ 0`. `(1) = 0` | holds |
| Evens value (L9) | `ℚ_2`, `d = −1`, `a = 1+2i`; `a = c`; `a = √d` | `Tr = 2`, `N = 5`, value `(2)∪(5) ≠ 0`. `a = c` gives `(c)∪(−d)`. `Tr = 0` gives `(2)∪(d)` | holds |
| Relative SW, degree 2 (L9) | `a = 1`; `Tr a ≠ 0`; `Tr a = 0` | Both sides equal `w₂(Tr⟨1⟩)`, then `(Tr a)∪(−dNa)` on both, then `0 = 2·(2)∪(d)` | holds |
| `hasseInvariant_eq_localHasse` | ranks 0, 1; `![−1,−1]` over `ℚ_2` and `ℚ_3` | Empty product `1`. `−1 = (−1,−1)_2`. `+1 = +1`. The trivial `ε` fails injectivity | holds |
| `localHasse` vs O'Meara `∏_{i≤j}` | `ℚ_2`: `![−1,2]`, `![−1]` | `s = +1` vs O'Meara's `−1`; `s = 1` vs `−1` | wrong model excluded |
| Quaternion algebras central simple | `ℍ[K,a,b,c]`, `c = 0` | `(2i−b)² = b²+4a`. At `c = 0`, `span{j,k}` is a proper ideal | holds |
| Symbol in `Br(K)` | `⟨2,−1⟩ ≅ ⟨1,−2⟩` | `[(2,−1)] = 1 = (2,−1)_2` | holds |
| Hasse invariant formulas | `s(λq)`; `⟨a⟩⊥⟨b⟩`; rank 0 | `(λ,−1)^{C(n,2)}(λ,d)^{n−1}s`. `(a,b)`. Rank `0` gives `d = [1]` | holds |
| Classification, dim ≤ 3 | `ℝ`, dims 3 and 4 | Dim 3: four distinct `(d,s)`. Dim 4: `⟨±1⁴⟩` collide | holds |
| Clifford invariant | `ℝ ⟨1ⁿ⟩`, `n = 1..8` | `C(n+1,4) mod 2` gives `1,1,ℍ,ℍ,ℍ,ℍ,1,1` | holds |
| `I²` homomorphism | `ℝ`: `⟨1⁴⟩⊥⟨1³⟩`, `⟨1,1⟩⊥⟨1⟩` | `1 = ℍ·ℍ`. `ℍ ≠ 1·1`, so the hypothesis is needed | holds |
| Base change and remaining API | rank ≤ 1; `ℍ_q` | `s = 1`, `c = 1`. `s(ℍ_q) = 1` and `c = 1` | holds |
| The symbol (6C) | `(a,−a)`; `(a,a)`; `ℚ`, `a = −1` | `+1`. `(a,a) = (a,−1)`. `3·7 = 21` is not a sum of two squares | holds |
| Classical construction | `ℚ_2(i)`; `ℚ_3(i)` | 4 of 8 classes are norms. Even valuations give index 2 | holds |
| Milestone 1 | `Q(ℚ_2)` | `{1,[ℍ]}`, `ε[ℍ] = −1`, `#Q = 2` | holds |
| 6C item 13 | `ℝ`, `𝔽_q`, number field | `H² = ℤ/2`, `0`, infinite | holds |
| Compatibility with the cup product | `ℝ`; `ℚ_2 (2,5)` | `ι[ℍ] = (−1)∪(−1) ≠ 0`; `(2)∪(5) ≠ 0` | holds |
| Wrong Evens candidate | `ℚ_2`, `d = −1`, `t = 2` | It gives `0`; the value is `(2)∪(5) ≠ 0` | excluded |
| 6B defects | `ℚ_2`: `1, 5, −1, −5, 5/4` | `δ = ⊤, 2, 1, 1, 0`; `𝔡(−5) = 2ℤ_2` | holds |
| 6C Gram matrix | basis `{−1,2,5}` | rows `(1,0,0),(0,0,1),(0,1,0)` | holds |
| 6D realization | `⟨−1,−1⟩` over `ℚ_2` | `(2,[1],−1)` | holds |
| Ramified-base control | `ℚ_2(π)`, `a = 5` | `(π+1/2)² − 5/4 = 1+π` | holds |
| Clifford vs `w₂`, `n = 3` | `ℝ ⟨−1,−1,−1⟩` | three copies of `(−1)∪(−1)` sum to `ι[ℍ]` | holds |

### Seeded sample

- **"Milestone 2"** is the only sampled target the diff touches, through its *Needs:*. The citation is checked above against the pin. Its locator, Serre *Local Fields* XIV §2, is unchanged and settled `uncertified`.
- **The other sampled targets** ("Quaternion algebras are central simple", "The quaternion symbol in `Br(K)`", "The Hasse invariant", "Classification in dimension at most three", "The Clifford invariant", "The `I²` homomorphism", "Base change and the remaining API", "The symbol", "The classical construction", "Milestone 1", "Compatibility with the cup product", "The value of the Evens norm on a Kummer class") are untouched. Their locators were verified in r66 against `ekm2008`, `kahn1984` and `serre1984cmh`, and the diff changes none of them.

## Not verifiable

- The changed passages cite no new source locator, only pinned declarations, all opened above.
- The settled `uncertified` texts were again not requested: Lam 2005, Serre *CiA*, Serre *Local Fields* (which includes Milestone 2's XIV §2), O'Meara 1963, Gille–Szamuely, Scharlau, Delzant 1962 and Milnor 1970. The mathematical content resting on them is recomputed in the table.

## Source issues

- none
