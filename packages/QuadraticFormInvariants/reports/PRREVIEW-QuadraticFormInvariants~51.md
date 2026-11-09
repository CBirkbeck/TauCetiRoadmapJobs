# Review of QuadraticFormInvariants (pull request #1215 at 8f8c72c)

**Verdict:** needs changes

This is an incremental re-review of the 74 lines changed since 3ef2860. The folder's own repairs (previous R01, R04, R05, R06) are correct and introduce nothing new. Three P3 findings remain. Two concern the pull request's description and one the source manifest; none is in the README or the Lean text.

## R01 (P3) — Four open pull requests change this folder, the heads conflict, and no merge order is stated

Previous R02, not repaired.

Location: the pull request's description, which is unchanged. Its title is "ClassFieldTheory: correct hypotheses, conductors and lifting", and it mentions neither QuadraticFormInvariants nor a merge order.

Claim: #617, #1411 and #1797 rewrite this folder's `README.md` and `Suggested.lean` differently. #1187 (the Tau Ceti bump to `ab00ba392`) edits this `Suggested.lean`. All four conflict with this head, and nothing says which lands first.

Witness: `export TauCeti (RegularFormClass formClass)` and `theorem hilbertSymbol_mul` are still in `Suggested.lean` at #617 (lines 73, 112), #1411 (lines 69, 157) and #1797 (lines 64, 145). This head drops both. The overlap index lists all four conflicts.

Repair: add one paragraph to the description. It should say:
- what this pull request does to QuadraticFormInvariants: Tau Ceti carriers, three aliases kept for OrthogonalSpinGroups, and old → new names;
- that it lands before #617, #1411 and #1797, which drop their QuadraticFormInvariants hunks or rebase onto this head;
- whether #1187 lands before or after this pull request, with the second one rebasing its edit of this `Suggested.lean`.

## R02 (P3) — An edit outside the pull request's named folders

Previous R03, not repaired.

Location: `Completed/LocalGaloisGroups/Suggested.lean`, 62 insertions and 50 deletions.

Claim: this pull request owns QuadraticFormInvariants, ClassFieldTheory and GlobalQuadraticForms. This file belongs to none of them, and the description does not mention it.

Witness: `git diff --stat origin/main...HEAD`, run without those three folders, lists exactly this file. On main it imports `TauCetiRoadmap.ClassFieldTheory.Suggested` and uses `ClassFieldTheory.artinMap` (lines 11, 247), so it is ClassFieldTheory's consumer repair for its renames.

Repair: say in the description that this file is ClassFieldTheory's consumer repair for the renamed declarations, so that LocalGaloisGroups is recorded as one of this pull request's folders. Alternatively, move the edit into a companion pull request that merges together with this one.

## R03 (P3) — Two cited works are still not in the manifest

Previous R07, partly repaired.

Location: README line 74, "Grove's chapters on characteristic 2 and EKM Ch. II …". References, the entries "O. T. O'Meara, *Quadratic forms over local fields* (1955), the paper antecedent of §63" and "L. C. Grove, *Classical Groups and Geometric Algebra*, GSM 39, AMS (2002)".

Claim: `packages/QuadraticFormInvariants/sources.toml` now records `lam2005`, `gilleszamuely2017` and `delzant1962` as `uncertified`, with DOIs and the README's locators. O'Meara 1955 and Grove are still cited but have no entry.

Witness: the manifest's ids are `kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985`, `ekm2008`, `lam2005`, `gilleszamuely2017` and `delzant1962`. Neither work appears.

Repair: neither work carries a locator for a statement, so the simpler repair is to delete both References entries and the words "Grove's chapters on characteristic 2 and". EKM §10 (p. 55) and §13 (p. 62) alone support the exclusion note. Otherwise, record both as `uncertified`:
- O'Meara, Amer. J. Math. 77 (1955) 87–116, locator "§63 antecedent";
- Grove, AMS GSM 39 (2002), locator "the characteristic-2 chapters".

## Previous findings

- R01 — repaired: `Suggested.lean` line 39 `universe u v w`, lines 95–96 `{V : Type v} {W : Type w}`; elaborates, and a scratch instance with `V : Type`, `W : Type 1` closes by the same Tau Ceti term.
- R02 — not repaired: the description is unchanged and still states no order against #617, #1411, #1797 and #1187 (now R01).
- R03 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean` is still changed (62+/50−), and the description does not name it (now R02).
- R04 — repaired: README line 303 now reads `OrthogonalGroup/Basic.lean`, which exists at the pinned Tau Ceti.
- R05 — repaired: README lines 47–49 read "hilbertSymbol_unramified → `TauCeti.hilbertSymbol_unramified`, with the unit `Δ` implicit; `TauCeti.exists_unramified_class`, under `(2 : K) ≠ 0`, produces a unit satisfying its hypothesis".
- R06 — repaired: (a) README lines 2704–2705 read "Layers 1, 4, 7A, 7B and 9". (b) The `export` is gone. README lines 24–26 and the `Suggested.lean` docstring name only the three imported names. `RegularFormClass` and `formClass` move to old → new lines 31–32.
- R07 — partly repaired: Lam, Gille–Szamuely and Delzant are in the manifest as `uncertified`; O'Meara 1955 and Grove are not (now R03).

## Verified sound

**Gate.**
- The worker's gate passes at 8f8c72c (`build=0`).
- My run of the gate gives 0 on every check except `outside-folder=4`. The four files are the ClassFieldTheory and GlobalQuadraticForms `README.md` and `Suggested.lean`, which belong to this pull request's own folders.
- The check does not cover `Completed/`, so R02 rests on the diff.

**Build.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no diagnostics. The five headlines are closed by Tau Ceti terms, so there is no `sorry` warning.

The signatures file's "Unknown identifier `of`" is a tool artefact: it read "theorem of Layer 7C" in the module docstring (line 19) as a declaration. The file has three declarations and five examples, unchanged except for 6D's universes.

**Dependency check.** `depcheck: 236 roadmaps, 2271 edges, 0 problem(s)`: no UPWARD or CYCLE line.

**Changed passages checked.**

Scratch `#check @` against the pins, each type matching the README sentence that cites it:
- `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` has `{V : Type u_2} {W : Type u_3}`, so the repaired 6D example now has the generality of its supplier.
- `TauCeti.formClass` needs `[Invertible 2]` and `[FiniteDimensional K V]` and returns `TauCeti.RegularFormClass K`.
- `TauCeti.RegularFormClass : (K : Type u_1) → [Field K] → Type u_1`.
- `TauCeti.hilbertSymbol_unramified` takes `{Δ : Kˣ}` and the norm criterion. Main's old `hilbertSymbol_unramified (u : Kˣ) (hu …) (b)` (main `Suggested.lean` line 1216) has the same hypothesis with `u` explicit.
- `TauCeti.exists_unramified_class (h2 : (2 : K) ≠ 0)` gives `Δ` nonsquare, of valuation 0, with `v(Δ−1) ≤ v(4)` and the norm criterion (`UnramifiedClass.lean` lines 206 and 263).
- `TauCeti.sw1Class_formClass_congr` and `TauCeti.sw2Class_formClass_congr` (independent universes), and `TauCeti.sw1Class_mk` and `TauCeti.sw2Class_mk`.
- `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` (`{K L : Type u_1}`, the source of the same-universe binder of the Layer 9 example).
- `TauCeti.discr_formClass_scharlauTransfer_smul_sq`, at `TauCeti/LinearAlgebra/QuadraticForm/Transfer/Discriminant.lean` line 99: `discr (formClass _ ha) = discr (formClass _ h1) + squareClass (Algebra.normUnits K a)`. This is the README's line 2375 sentence verbatim.

Bare names: no unqualified `formClass` or `RegularFormClass` span is left in the README. All 10 mentions of `formClass` are `TauCeti.formClass`, and the remaining hits are `TauCeti.RegularFormClass.*` and file paths. No sentence still claims an export.

Consumers of the dropped export:
- On main, the names cited from this namespace are `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `hilbertSymbol_comm`, `hilbertSymbol_eq_cohomological`, `exists_hilbertSymbol_eq_neg_one`, `exists_of_realization`, `formClass` and `discr`. They come from `Completed/OrthogonalSpinGroups/Suggested.lean` lines 84–86 and `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` lines 63–66, 261, 367 and 460. The README's `RegularFormClass` comes from GlobalQuadraticForms README line 121.
- Each is kept or has an old → new line.
- This head's GlobalQuadraticForms no longer imports the module.
- `roadmaps grep` finds no open head that opens this namespace or cites `formClass` or `RegularFormClass` from it. Neither #1200's `GlobalQuadraticForms/Suggested.lean` nor this head's sibling folders import it.

Part II: QuadraticFormInvariantsPartII at #1834 (head 9aebbec) imports Layers 1, 4, 7A, 7B and 9 (its README lines 67–70 and the contract at line 284). This matches README line 2705.

Siblings: ClassFieldTheory at this head still has Layer 5 (line 1023) and Layer 14 (line 2026), cited by this README. The ClassFieldTheory and GlobalQuadraticForms commits since 3ef2860 change no passage this roadmap cites.

**Seeded sample.** None of the 13 targets falls in a changed passage:
- the changed passages are scope lines 22–49, table line 303, Layer 8 "Invariance under isometry" (2236–2240), Layer 9 "The twisted trace form" (2375–2380) and "The relative Stiefel–Whitney formula" (2592–2597), and consumers (2704–2705);
- the r46 verifications of all 13 stand;
- for the Layer 9 rows below I re-read Kahn's Lemme II.2.1 at `kahn1984` lines 763–765: `(Tr a, −d·N a) + (2, d)` if `Tr a ≠ 0`, and `(2, d)` if `Tr a = 0`, as the headline states.
- The README flags no locator as unverified.

**Headlines and padding.** No headline or declaration was added or removed. The five headlines (Layers 2, 6D, 7C and two in 9) stand as in r46, each closed by one Tau Ceti term. `localHasse_eq_prod_prod_Ioi` is private and serves the proof of `hasseInvariant_eq_localHasse`.

**Duplication and ownership.** The change introduces no new object. Ownership is as r46 found it: the Hilbert symbol is at 6C, cited by ClassFieldTheory and IntegralLattices, and the Brauer group ≅ `H²` is at 7B, cited by SchemeAndStackFoundations.

### Adversarial table

Rows 1–8 compute the changed statements. Rows 9–27 carry forward the r46 rows for statements the diff leaves untouched, citing PRREVIEW-QuadraticFormInvariants~46.

| # | Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | Local classification, 6D (universes repaired) | `V : Type`, `W : Type 1` (scratch); `⟨1,1⟩` vs `⟨5,5⟩` and `⟨1,1⟩` vs `⟨−1,−1⟩/ℚ₂`; `⟨1⁴⟩` vs `⟨(−1)⁴⟩/ℝ` | Scratch instance elaborates, closed by the Tau Ceti term. `⟨5,5⟩`: `d=[1],[25]=[1]`; `s=(1,1)₂=+1`, `(5,5)₂=(−1)^{ε(5)²}=+1` [`ε(5)=0`]; `⟨1,1⟩` represents `5=1²+2²` → isometric ✓. `⟨−1,−1⟩`: `s=(−1)^{ε(−1)²}=−1≠+1`; `x²+y²=−1` has no solution (`7 mod 8`) → not isometric ✓. `ℝ`: `(4,[1],+1)` on both sides yet not isometric, so the nonarchimedean hypothesis is needed | holds | none |
| 2 | Relative `w₂`, L9 (names qualified) | `ℚ₂(i)`, `a=1+2i`; `ℚ₂(√5)`, `a=1+√5`; `a=√5` | `ℚ₂(i)`: `Tr_*⟨a⟩(u+vi)=2u²−8uv−2v²=2(u−2v)²−10v²` → `⟨2,−10⟩`, LHS `(2)∪(−10)=(2)∪(5)` [`(2,−1)₂=(2,2)₂=+1`, `(2,5)₂=−1`]. RHS `w₂⟨2,−2⟩=0`, `N^Ev=(2)∪(5)+(2)∪(−1)=(2)∪(5)`, `w₁∪cor=(−1)∪(5)=0` [`(−1,5)₂=+1`] → `(2)∪(5)` ✓. `ℚ₂(√5)`, `1+√5`: `Tr_*⟨a⟩=2((u+5v)²−20v²)` → `⟨2,−40⟩`, LHS `(2)∪(5)`. RHS `w₂⟨2,10⟩=(2)∪(5)`, `N^Ev=(2)∪(20)+(2)∪(5)=0`, cup term `(5)∪(−4)=0` → `(2)∪(5)` ✓. `a=√5`: LHS hyperbolic, `0`; RHS `(2)∪(5)+(2)∪(5)+(5)∪(−5)=0` ✓ | holds | none |
| 3 | Transfer discriminant `d(s_*⟨a⟩)=d(s_*⟨1⟩)+(N a)` (L9 line 2375) | `ℚ₂(i)`, `a=1+2i`; `ℚ₂(√5)`, `a=1+√5`; trace `⟨2,2d⟩` | `[−20]=[−5]` vs `[−4]+[5]=[−5]` ✓. `[−80]=[−5]` vs `[20]+[−4]=[5]+[−1]=[−5]` ✓. `det⟨2,2d⟩=4d`, so `d(Tr_*⟨1⟩)=(d)` ✓ | holds | none |
| 4 | Descended `w₁`, `w₂` on `TauCeti.formClass` (L8 line 2236) | `⟨2,−10⟩≅⟨2,−40⟩/ℚ₂`; `⟨1,−1⟩≅⟨2,−2⟩` | `40=10·4`: `w₁=(−20)=(−80)`; `w₂`: `(2)∪(−10)=(2)∪(−40)` since `(2)∪(4)=0`. `⟨1,−1⟩`: `w₂=(1)∪(−1)=0`; `⟨2,−2⟩`: `(2,−2)=+1` → `0`, matching `sw2Class_formClass_congr` | holds | none |
| 5 | Old → new: `hilbertSymbol_unramified`, `exists_unramified_class` | `ℚ₃`, `Δ=2`; `ℚ₂`, `Δ=5,−3`; `Δ=3` | `ℚ₃`: `(2,3)₃=−1` (`x²≡2y² (3)` forces `3∣x,y`), `(2,9)₃=+1`, `(2,2)₃=+1` = `(−1)^{v(b)}` ✓. `ℚ₂`, `Δ=5`: `(5,2)₂=(−1)^{ω(5)}=−1`, `(5,3)₂=(−1)^{ε(5)ε(3)}=+1` ✓, `|5−1|=|4|` ✓. `Δ=−3`: `(−3,2)₂=−1` ✓, `|−4|=|4|`. `Δ=3` (ramified): `|2|>|4|` excluded, and `(3,3)₂=(3,−1)₂=−1` at `v=0` fails the criterion ✓ | holds | none |
| 6 | Supplier-table path, Layer 1 | `OrthogonalGroup/Basic.lean`, `OrthogonalGroup.lean` | the directory holds `Action, Basic, Coordinate, HyperbolicPair, LowRank, OrthogonalBasis, Polar, Quaternion`; `Basic.lean` exists, `OrthogonalGroup.lean` does not | holds | none |
| 7 | Consumers: Part II layers; "three names" imported from main | #1834 README; main's Lean | Part II: `{1, 4, 7A, 7B, 9}` = README 2705. Main: OrthogonalSpinGroups imports exactly the three names; the other 8 names cited on main all have old → new lines | holds | none |
| 8 | `Suggested.lean` docstring after the dropped export | docstring lines 23–31; body lines 101–104, 198–202 | every `formClass` in the body is `TauCeti.formClass`; the docstring names the three declared names and says the carrier and the class are written with Tau Ceti names | holds | none |
| 9 | Four-fold TFAE, L2 (r46 row 1) | `a=1`; `(−1,−1)/ℝ`; `(2,5)`, `(5,5)/ℚ₂`; `a=c²` | `(1,b)`: all five true. `ℝ`: all false. `(5,5)`: `5=5²−5·2²`, true. `(2,5)`: `ω(5)=1`, false. `a=c²`: norm form vanishes at `(c,1,0,0)` | holds | none |
| 10 | Cup-norm, 7C (r46 row 3) | `a=c²`; `b=−a`; `ℝ`; `(2,5)`, `(5,5)/ℚ₂` | `(a)=0` and solvable; witness `(0,1)` and `(a)∪(−a)=0`; both sides false over `ℝ`; cup `≠0` ↔ `5≠x²−2y²` | holds | none |
| 11 | Evens value, L9 (r46 row 4) | `ℚ₂(i)`, `a=1+2i`; `a=1`; `a=√d` | `(2)∪(5)+(2)∪(−1)=(2)∪(5)≠0`; `a=1`: `(2)∪(−1)=0=N(0)`; `√d`: `(2)∪(d)` both | holds | none |
| 12 | `hasseInvariant_eq_localHasse` (r46 row 6) | `n=0,1`; `⟨a,b⟩`; `⟨−1,−1⟩/ℚ₂` | `n≤1`: both sides 1; `ε[ℍ]=−1=(−1,−1)₂`; `#Q(K)=2`, injective | holds | none |
| 13 | `localHasse` Checks (r46 row 7) | `![a,−a]`; `![−1]`, `![−1,2]/ℚ₂` | `(a,−a)=+1`; empty product `+1`; `s=+1`, O'Meara `(−1)(+1)(+1)=−1` | holds | none |
| 14 | Quaternions are central simple, L5 (r46 row 8) | `a` nonsquare or square; `b=0` | EKM 98.E needs `F(√a)` a field; square `a` is split | holds | none |
| 15 | Symbol API, binary congruence (r46 row 9) | `⟨2,−1⟩≅⟨1,−2⟩` | `[(2,−1)]=[(1,−2)]=1`; the bilinear `B` satisfies the axioms but fails congruence | holds | none |
| 16 | `s(λq)`, `s(q⊥r)`, L5 (r46 row 10) | termwise; `n=0` | `s·(λ,−1)^{C(n,2)}·(λ,d)^{n−1}`; ℕ junk exponent 0 vs true `1` | holds | none |
| 17 | Classification in dimension ≤ 3 (r46 row 11) | rank 2; `ℝ` | `ac∈N(K(√−ab))` ⇔ isometric; `ℝ`: `s=1` vs `[ℍ]` | holds | none |
| 18 | Lam V.3.20 (r46 row 12) | `⟨1ⁿ⟩/ℝ`, `n=1..8`; mixed signatures | `C(n+1,4) mod 2 = 0,0,1,1,1,1,0,0` vs `ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ` | holds | none |
| 19 | `c(q⊥r)` on `I²` (r46 row 13) | `⟨1⁴⟩⊥⟨1⟩` etc. | `[ℍ]=[ℍ]·1`; off `I²`, `[ℍ]≠1` | holds | none |
| 20 | 6B defects over `ℚ₂` (r46 row 14) | `1, 5, −1, −5, 5/4` | `0, 4ℤ₂, 2ℤ₂, 2ℤ₂`; `δ(5/4)=0` | holds | none |
| 21 | 6C Gram matrix on `{−1,2,5}` (r46 row 15) | `ε, ω` at `1,3,5,7` | `!![1,0,0;0,0,1;0,1,0]` | holds | none |
| 22 | 6D isotropy in ranks 3 and 4 (r46 row 16) | `⟨1,1,1⟩`, `⟨1⁴⟩/ℚ₂` | anisotropic: `s=+1≠(−1,−1)₂` | holds | none |
| 23 | Realization exceptions (r46 row 17) | `(1,[1],−1)`, `(2,[−1],−1)`, `(2,[1],−1)` | first two excluded; third realized by `⟨−1,−1⟩` | holds | none |
| 24 | Ramified-base control (r46 row 18) | `ℚ₂(√2)`, `a=5` | `(π+½)²−5(½)²=1+π`, `≢1 mod π²` | holds | none |
| 25 | 6B case 3 caveat (r46 row 19) | `ℚ₂(√2)` | `#𝒪ˣ/𝒪ˣ²=8`; unit norms have index 2 | holds | none |
| 26 | `Pin⁺` conventions (r46 row 20) | `t=(e₁−e₂)/√2` | `t²=I`; `(e₁t)⁴=−I` | holds | none |
| 27 | ULift square, 7B.5 (r46 row 21) | transports | pullback along `absoluteGaloisGroupCongr`, `unitsCoeffCongr` | holds | none |

## Not verifiable

- Lam (2005), Gille–Szamuely (2017), O'Meara (1963), Serre *A Course in Arithmetic* and Serre *Local Fields*: settled as uncertified in the manifest and cited by locator. No changed passage cites them.
- O'Meara (1955) and Grove (2002): not in the manifest (R03); no text read.

## Source issues

- none
