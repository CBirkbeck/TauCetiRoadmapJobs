# Review of QuadraticFormInvariants (pull request #617 at 9601e63)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuadraticFormInvariants/` at `9601e63`. The folder has not changed since `e2fb851`. All seven findings are P3, and none is mathematical: every statement I recomputed holds, and every Lean name the README cites resolves at the pins. The gate still fails on files outside this folder (R01), so the folder cannot be accepted yet.

## R01 (P3) — The gate fails on files outside this folder

**Location.** The worker's gate at this head reports `outside-folder=4`:
- `Completed/LocalFieldsRamification/{COMPLETION.md,README.md,Suggested.lean}`;
- `Completed/LocalGaloisGroups/README.md`.

**Claim.** The brief names only `ClassFieldTheory/` and `IntegralLattices/` as this pull request's own folders, so the gate counts these four files as outside the folder. While the gate fails, the folder cannot be accepted.

**Witness.**
- My own gate run gives `outside-folder=8`: the four above, plus the four files under `ClassFieldTheory/` and `IntegralLattices/`. Every other check is 0.
- `roadmaps list` lists #617 as "LocalFieldsRamification, LocalGaloisGroups, ClassFieldTheory, IntegralLattices, QuadraticFormInvariants", titled "fix(LocalFieldsRamification)".

**Repair.** Nothing changes in this folder. Either:
- record `Completed/LocalFieldsRamification/` and `Completed/LocalGaloisGroups/` as this pull request's own folders where the board reads them (they are its titled subject); or
- move the QuadraticFormInvariants, ClassFieldTheory and IntegralLattices commits to their own pull request.

Either way the gate's `outside-folder` count for this folder becomes 0.

## R02 (P3) — "Owns no open target" contradicts the README's own Layer 6 example

**Location.**
- README 20–24: "Every layer is implemented in Tau Ceti … This roadmap therefore owns no open target."
- README 1790: "This example is this roadmap's own target, an acceptance check with no native counterpart".

**Claim.** The Scope section says the roadmap owns no open target. 6E's Examples say it owns one, the ramified-base control. Both cannot be true, and a maintainer who reads Scope alone could archive the roadmap with that target left behind.

**Witness.**
- Over `ℚ₂(π)`, `π² = 2`: `(π + 1/2)² − 5/4 = 1 + π`.
- Units of `u²(1 − 5t²)` and `−5u²(1 − 5t²)` are `≡ 1 mod 2`; `1 + π ≡ 1 + ε`.
- No Tau Ceti declaration states it: `DyadicSqrt/Two.lean` and `Herbrand.lean` hold only field and ramification data.

**Repair.**
- README 23–24 becomes: "Its one open target is the ramified-base control in Layer 6's Examples, which has no Tau Ceti counterpart; every other milestone is Tau Ceti's."
- README 21 becomes: "Every milestone of every layer except that example is implemented in Tau Ceti".

Tested: after this change the two passages agree, and the grep of the pinned Tau Ceti for the example still finds nothing.

## R03 (P3) — No merge order is stated against the four other open pull requests that rewrite this folder

**Location.** The pull-request description. Its only ordering line is "Revisions … which merge first: #1410".

**Claim.** Four other open pull requests change this folder, and their heads conflict with this one. One must be rebased on another before either merges, and the description says nothing about which. #1215 also deletes nine declarations that this head keeps: `discr`, `wittRing`, `toWittRing`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one` and `exists_of_realization`.

**Witness.** Each head diffed against this one with `roadmaps show QuadraticFormInvariants --pr N`:
- #1215 (`71f4111`): 305 Lean and 249 README lines differ;
- #1797 (`388ed01`): 328 and 254;
- #1411 (`303ce50`) and #1187 (`66ed0d4`): each carries main's long file (3876 and 3847 lines).

**Repair.** Add one paragraph to the description that:
- says which of #617, #1215 and #1797 lands first, and that the others rebase onto it and drop the hunks in this folder that it already contains;
- says that #1411 and #1187 drop their edits to this folder's `Suggested.lean`, which this head replaces.

If #1215 lands after #617, its deletions of `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` must land together with its own rewrite of GlobalQuadraticForms. Main's GlobalQuadraticForms `Suggested.lean` uses those three names at lines 63–66 and 498–499.

## R04 (P3) — Five declarations in `Suggested.lean` restate Tau Ceti and are used by no Lean file

**Location.** `Suggested.lean`:
- 87–93: `wittRing`, `toWittRing`;
- 119–121: `hilbertSymbol_comm`;
- 167–175: `hilbertSymbol_eq_cohomological`;
- 182–188: `exists_of_realization`.

**Claim.** Each is one Tau Ceti term under a new name, and none is needed to state a headline. Another roadmap's prose cites them, but no Lean file uses them. README 40–52 already treats four other names cited only in prose (`signedDiscr`, `localHasse_congr`, `discr_mk`, `hilbertSign`) with old → new lines rather than copies, so the two kinds of name are handled differently.

**Witness.**
- `roadmaps grep --lean-only` finds no Lean use of the five, on main or at any open head.
- They are cited only in prose: in docstrings of main's GlobalQuadraticForms (217, 289, 309) and in #1411's IntegralLattices README (474–475).
- A scratch copy without them elaborates with exit 0 and no messages.

**Repair.**
- Delete the five from `Suggested.lean`, together with the Layer 4 section comment this leaves empty.
- Add five old → new lines to README 43–52:
  - `wittRing` → `TauCeti.WittRing`;
  - `toWittRing` → `TauCeti.WittRing.mk`;
  - `hilbertSymbol_comm` → `TauCeti.hilbertSymbol_comm`;
  - `exists_of_realization` → `TauCeti.RegularFormClass.exists_of_realization`;
  - `hilbertSymbol_eq_cohomological` → `TauCeti.hilbertSymbol_eq_cohomological`.
- Restate README 29–35, 83, 966–968, 974, 977 and 1749 with those Tau Ceti names.

Keep `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one`, which main's GlobalQuadraticForms uses, and `hilbertSymbol_productFormula`, which #1411's IntegralLattices `Suggested.lean` uses at 401 and 753.

## R05 (P3) — Two layers' Dependencies omit Layer 1, and the supplier table names a missing file

**Location.**
- Layer 3 Dependencies, README 937: "Layers 0 and 2."
- Layer 5 Dependencies, README 1275: "Layers 0, 2, 3 and 4".
- Supplier table, Layer 1 row, README 288: `OrthogonalGroup.lean`.

**Claim.** Every layer must list the dependencies of its own `*Needs:*` lines, and those lines use Layer 1 in both layers. The table names a file that does not exist at the pin.

**Witness.**
- README 861 (Layer 3) needs "Layer 1's hyperbolic class".
- README 1179 (Layer 5) needs "Layer 1's Witt cancellation".
- `…/QuadraticForm/OrthogonalGroup.lean` is absent at pin `2fd255d`; `OrthogonalGroup/Basic.lean` exists, and README 608 cites it.

**Repair.**
- README 937: "Layers 0 to 2."
- README 1275: "Layers 0 to 4".
- README 288: `OrthogonalGroup/Basic.lean`.

Tested: with these changes all 174 `TauCeti/…` paths in the README and every path in the table exist at the pin.

## R06 (P3) — The consumer attributions miss ClassicalArithmeticCompletion and part of Part II's uses

**Location.**
- README 31: "`hilbertSymbol` and `localHasse` (`GlobalQuadraticForms`, `OrthogonalSpinGroups`)".
- README 36 and 1643–1644: `hilbertSymbol_productFormula` (`GlobalQuadraticForms`, `IntegralLattices`).
- `Suggested.lean` 36–37.
- README 2702–2703: Part II uses "Layers 1, 4 and 7B".

**Claim.** These attributions decide when an alias can be dropped, and they leave out a roadmap on main that cites two of the aliases.

**Witness.**
- Main's ClassicalArithmeticCompletion README 227 cites `hilbertSymbol` and `hilbertSymbol_productFormula` (6C items 1, 9, 10 and 14), and line 601 cites the product formula again.
- #1834's Part II README 67–70 imports Layers 1, 4, 7A, 7B and 9.

**Repair.**
- Add `ClassicalArithmeticCompletion` to README 31, README 36, README 1644 and `Suggested.lean` 36–37.
- README 2702–2703 becomes "Layers 1, 4, 7A, 7B and 9".

Tested: on main, no other roadmap cites a name from this namespace. Among open heads, #1411's IntegralLattices README (474–475) also cites `exists_of_realization` and `hilbertSymbol_eq_cohomological`; both go to old → new lines under R04.

## R07 (P3) — Six cited works are not recorded, and two have no reference entry or locator

**Location.**
- References at README 2709 (Lam 2005), 2726 (O'Meara 1955), 2743 (Gille–Szamuely) and 2754 (Grove).
- Delzant, cited at README 212 and 2217.
- Fröhlich, cited at README 2263 and 2273.

**Claim.** Every cited work must be in `sources.toml`. Lam and Gille–Szamuely carry most of the locators of Layers 2, 5 and 7: 729, 1134, 1947, 2142, and Lam V.3.16–3.21. Delzant and Fröhlich have no References entry at all.

**Witness.**
- `packages/QuadraticFormInvariants/sources.toml` has eleven keys, none for these six works.
- Kahn's bibliography gives Delzant: C. R. Acad. Sci. Paris 255 (1962) 1366–1368 (`kahn1984` lines 1342–1343).

**Repair.**
- Record Lam, Gille–Szamuely, Grove and O'Meara (1955) in `sources.toml` with DOIs. They are paywalled, so they are recorded as `uncertified` with their locators.
- Add Delzant (1962) with that locator to References and to `sources.toml`.
- Either cite Fröhlich's paper with a locator or drop the name from README 2263 and 2273.

## Verified sound

**Gate and build.**
- The worker's gate fails only on `outside-folder=4`; `build=0`.
- My own gate run gives 0 on every check except `outside-folder=8` (R01).
- Dependency check: `depcheck: 240 roadmaps, 2328 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The suppliers (ClassFieldTheory, ProfiniteCohomology, LocalFieldsRamification, RepresentationTheory/SemisimpleAlgebras) are all on main.
- `lake env lean` on `Suggested.lean` exits 0 with no diagnostics. It has no `sorry`, no `set_option`, no sorry'd data, and its imports are `import Mathlib` plus 16 `TauCeti.*` modules.

**Signatures.**
- I compared the elaborated type of each of the 14 named declarations with its README statement. No section binder is lost, and none changed.
- `hasseInvariant_eq_localHasse` uses an existential. It is not weak: an injective hom from the two-element `Q(K)` to `ℤˣ` is unique.

**Cited names.**
- I `#check`ed 695 dotted names from the README at pins Mathlib `1b1ccf4` and TauCeti `2fd255d`, without `open TauCeti`. 44 modules had to be built first with `lake build`.
- 694 resolve exactly as written. `Ideal.Quotient` is Mathlib's namespace, not a constant.
- The prototypes the README attributes to ProfiniteCohomology (`cup`, `f2Pairing`, `galoisF2Iso`, …) are in main's `ProfiniteCohomology/Suggested.lean`: `f2Pairing` at 5332, `cup` at 3868. The `roadmaps resolve` lead on `f2Pairing` was a false positive.
- All 174 `TauCeti/…` file paths in the README exist at the pin.

**Pinned statements I opened and checked against the README.**
- The four-fold criterion `nonempty_algEquiv_matrix_tfae`.
- `cup_kummerClass_eq_zero_iff`, `galoisEvens2_kummerClass` and `_of_trace_eq_zero`, `galoisEvens_add`, `galoisRes_galoisEvens` and `galoisEvens_galoisRes`.
- `sw1Class_formClass_traceTransfer_smul_sq` and `discr_formClass_scharlauTransfer_smul_sq`.
- `brauer2EquivH2_cliffordInvariant`, which uses `(rank−1).choose 2` and `(rank+1).choose 4`. This matches README 2265–2268.
- `cliffordInvariant_eq_hasseInvariant_mul`, `hasseInvariant_add`, `hasseInvariant_mk_rankOne_mul`, `eq_iff_discr_eq_and_hasseInvariant_eq` (rank ≤ 3), and the quaternion central-simplicity theorems with `completeSquareEquiv`.
- `index_normGroup_of_isCyclic`, stated for `K L : Type` with ValuativeExtension, Galois and cyclic hypotheses (README 1532–1537).
- The 6A/6B objects: `dyadicLevel`, `card_squareClass` = `4·q^e`, `exists_unramified_class` with `Δ ≡ 1 mod 4`, and the local square theorem with its sharpness.
- The 6E milestones: Milestone 1 is universe-polymorphic. Milestone 2's three theorems are stated for `K : Type`, as README 1745–1749 says.

**Cross-roadmap citations resolved.**
- **ClassFieldTheory at this head:** Layer 5 at README 459, Layer 14 at 888, *Consumers, and the names they import* at 92, universe `0` at 163.
- **LocalFieldsRamification at this head:** the items *Finite extensions*, *Valuations and `e`, `f`*, *Units*, *Power classes* and *Unramified extensions* at README 156–185, and *Names imported by other roadmaps* at 591. All 12 Tau Ceti names listed at QFI README 309–313 occur there.
- **ProfiniteCohomology on main:** Layers 0–4, 8, 9, 10 (corestriction in every degree), 12 and 13 (Evens norm, `D₁₆`).
- **SemisimpleAlgebras on main:** Layers 4–6 at README 249, 274 and 293.
- **ClassicalArithmeticCompletion's citations of 6C items 1, 9, 10 and 14:** the numbering is unchanged at this head.

**Consumers.**
- Main's GlobalQuadraticForms `Suggested.lean` uses `hilbertSymbol`, `localHasse`, `formClass`, `discr`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one`. All are declared here, and the gate builds that module.
- OrthogonalSpinGroups `#check`s three names (84–86). All are declared.
- No other open head declares a name in `TauCetiRoadmap.QuadraticFormInvariants`.
- Ownership: GlobalQuadraticForms (#1200), Part II (#1834) and QuadraticFormsOverABase (#1930) all defer these invariants to this roadmap, and none owns them a second time.

**Proved examples and aliases.** I accepted the proved `example`s and the aliases that consumers use, for these reasons:
- Every headline is proved at the pin, so stating it with `sorry` would be false. Completed/Multiquadratic has the same shape.
- Seven theorems close with one Tau Ceti term. The three that consumers use in Lean stay. Of the others, R04 asks to delete four; `hilbertSymbol_productFormula` stays because an open head uses it in Lean.

**Sources, read at their locators.**
- `kahn1984`:
  - lines 763–765, Lemme II.2.1, p. 241: the value `(Tr a, −dNa) + (2,d)`, and `(2,d)` at trace zero, matching README 2443–2445;
  - line 55, Théorème 2, p. 224;
  - lines 1044–1058, Prop. II.3.5: the rank-one quadratic case. Its degree-2 part is README 2590.
- `serre1984cmh` lines 560–562: Théorème 1′, p. 668, with `(2)(d_E)` and not `d(Q)`, as README 2537–2538 says. The paper's pages are 651–676 (line 5).
- `kozlowski1984` line 34: Thm 1.1, Proc. AMS 91 (1984), p. 309.
- `ekm2008` line 2393: Definition 7.17, in Ch. II §7 (line 2177).
- The Checks of the four kept definitions number four (`discr`), three (`wittRing`), three (`hilbertSymbol`) and four (`localHasse`). Every one is recomputed in the table below.

**Note for the ClassFieldTheory review.** That README's line 94 still says QuadraticFormInvariants imports its `Suggested.lean`. This folder's `Suggested.lean` imports no roadmap module (lines 1–17).

### Adversarial table

Notation: `(x,y)` is a Hilbert symbol; `ε` and `ω` are Serre's sign functions.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| Four-fold criterion (L2) | ℚ₂, (2,5) | ε(1)ε(5)+ω(5)=1, so −1; 5 is not x²−2y² (units give ±1 mod 8) / all five false | holds | — |
| Four-fold criterion | ℚ₂, (5,5); a=1 | 5 = 25−20 / all true; b = ((b+1)/2)²−((b−1)/2)² | holds | — |
| Local classification (6D) | ℚ₂: ⟨1⁴⟩ vs ⟨−1⁴⟩ | (4,[1],1) / (4,[1],(−1,−1)⁶=1); both anisotropic, so isometric | holds | — |
| Classification needs a local field | ℝ, same pair | equal triples / signatures 4 and −4 | hypothesis needed, and present | — |
| Cup-norm (7C) | ℝ (−1,−1); ℚ₂ (2,5) | cup ≠ 0 / −1 ≠ x²+y²; 5 ≠ x²−2y² | holds | — |
| Evens value (L9) | ℚ₂(i), a=1+2i | Tr 2, N 5: (2)∪(5)+(2)∪(−1) = (2)∪(5) ≠ 0 / Kahn II.2.1 gives the same | holds | — |
| Evens value at trace 0 | a=i | (2)∪(−1) = 0 / Kahn: (2,d) | holds | — |
| Wrong candidate (L9 ⚠) | ℚ₂, d=−1, t=2 | (2)∪(5)+(−1)∪(−1) = 0 / true value (2)∪(5) ≠ 0 | ⚠ correct | — |
| Relative SW, degree 2 | ℚ₂(i), a=1+2i | w₂⟨2,−10⟩ = (2)∪(5) / 0+(2)∪(5)+(−1)∪(5) = (2)∪(5) | holds | — |
| Relative SW at trace 0 | a=i | w₂⟨1,−1⟩ = 0 / (2)∪(−1)+(2)∪(−1)+0 = 0 | holds | — |
| Hasse scaling (V.3.16) | ℝ, λ=−1, ⟨1,1,1⟩ | s⟨−1,−1,−1⟩ = [ℍ] / 1·[ℍ]³·[(−1,1)]² = [ℍ] | holds | — |
| Hasse scaling, rank 0 | n=0 | 1 / (λ,1)^(−1) = 1 (or exponent 0 under ℕ-subtraction) | junk harmless | — |
| Orthogonal sum (p. 119) | ⟨a⟩⊥⟨b⟩ | [(a,b)] / 1·1·[(a,b)] | holds | — |
| O'Meara translation | ℚ₂, ![−1,2] | ∏_{i≤j} = −1 / s·(−2,−1) = 1·(−1) | holds | — |
| Dimension ≤ 3 (V.3.21) | ℚ: ⟨1,1⟩, ⟨2,2⟩ | d [1]/[1], s 1/(2,−1)=1 / isometric (both represent 2) | holds | — |
| Dimension 4 fails | ℝ: ⟨1⁴⟩ vs ⟨−1⁴⟩ | equal d and s / not isometric | bound needed | — |
| Clifford (V.3.20) | ℝ ⟨1ⁿ⟩, n=1..8 | C(n+1,4) = 0,0,1,5,15,35,70,126 / ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ | holds | — |
| Clifford, first factor | ℝ ⟨−1,−1,−1⟩ | C₀ ≅ ℍ / [ℍ]·[ℍ]·[ℍ] = [ℍ]; dropping it gives 1 | pins the factor | — |
| I² additivity | ℝ ⟨1⁴⟩⊥⟨1³⟩; ⟨1,1⟩⊥⟨1⟩ | 1 = [ℍ]²; [ℍ] ≠ 1·1 | hypothesis needed | — |
| Quaternions central simple | ℍ[K,a,0,b]; ℍ[K,0,0,b] | c₃(c₂²+4c₁) = 4ab ≠ 0 / i² = 0, not simple | holds | — |
| Binary congruence of the symbol | ⟨2,−1⟩ ≅ ⟨1,−2⟩ | [(2,−1)] = 1 / [(1,−2)] = 1 | holds | — |
| Base change and API | ℍ_q; rank ≤ 1 | s = (1,−1) = 1, c = [M₂] = 1 / 1 | holds | — |
| The symbol, Checks (6C) | (1,b); 𝔽₂(t); ℚ₂, ℚ, ℚ₅; ℝ | ((b+1)/2)²−((b−1)/2)² = b; (t,1)=+1, (1,t)=−1; (−1,3) = −1, −1, +1; (−1,−1) = −1, (−1,2) = +1 | holds | — |
| Not multiplicative over ℚ | (−1,21) | −1 / (−1,3)(−1,7) = +1 | ⚠ correct | — |
| Classical construction | ℚ₂(i) | norms {1,2,5,10}, index 8/4 = 2 / 2; det[[x,ay],[y,x]] = x²−ay² | holds | — |
| Milestone 1 (6E) | ℚ₂ ![−1,−1]; ![−1,2] | ε[(−1,−1)] = −1 / localHasse −1; +1 / +1 | holds | — |
| Milestone 2 | ℚ₂ (2,5); (5,5) | invMap 1/2 ↔ −1; 0 ↔ +1 | holds | — |
| Cup compatibility | (2)∪(5); (5)∪(5) | −1 / (2,5) = −1; +1 / (5,−1) = +1 | holds | — |
| localHasse Checks | rank 0/1; ![−1] at ℚ₂ | +1 / with i ≤ j it would be (−1,−1) = −1 | pins i<j | — |
| `discr` Checks | rank 0; ⟨1,−1⟩; ⟨1⟩ vs ⟨4⟩ | [1]; [−1] (d± = [1]); [1] = [1] | plain d | — |
| `wittRing` Checks | ℂ, ℝ, 𝔽₃, 𝔽₅ | ⟨1,1⟩ ↦ 0; W ≅ ℤ; ⟨1⟩ of order 4; (ℤ/2)² | holds | — |
| Realization exceptions | (1,[1],−1), (2,[−1],−1), (2,[1],−1) at ℚ₂ | excluded; excluded since (a,−a) = 1; ⟨−1,−1⟩ realizes it | holds | — |
| Product formula | ℚ, (−1,−1) | ∏ᶠ finite = −1 (at 2, support finite) / real −1; product 1 | holds | — |
| Cohomological comparison | ℚ₂ vs ℚ | tr unique since \|H²\| = 2 / over ℚ no tr exists (vacuous there) | holds | — |
| Unramified class (6B) | ℚ₂, Δ=5; −1 | (5,2) = −1, (5,−1) = (5,5) = +1; (−1,−1) = −1 | holds | — |
| Square-class count | ℚ₂; odd p; ℚ₂(√5) | 4·2 = 8; 4; 4·4 = 16 = 2^(2+2) | holds | — |
| Defects over ℚ₂ | 1, 5, −1, −5 | 0, 4ℤ₂, 2ℤ₂, 2ℤ₂ ≠ 8ℤ₂ | holds | — |
| Discriminant at odd defect | ℚ₂(i), d=1, e=1 | 𝓂^(2−1+1) = (4) / disc ℤ₂[i] = −4 | holds | — |
| Index of U(2e−d+1)(𝒪ˣ)² | ℚ₂(√2), d=1 | 8/2 = 4 / norms have index 2 | ⚠ correct | — |
| R02 control | ℚ₂(√2), a=5 | (π+½)²−5/4 = 1+π / families ≡ 1 mod 2, 1+π ≢ 1 | true, owned here | R02 |
| R05 Layer 3 needs | d±(ℍ) | (−1)¹·(−1) = 1 / uses Layer 1's `hyperbolicClass` | dependency missing | R05 |

## Not verifiable

- **Lam (2005)**, AMS GSM 67. Locators I.2.3–I.7, II.1, II.3, III.2.2, III.2.7, III.2.11, III.4.2, V.3.4, V.3.16–3.21, pp. 119–120, VII §1. It is paywalled and absent from the manifest. I checked the mathematics of each sampled statement by computation (table) and against the pinned Tau Ceti theorem, but not the theorem numbers.
- **Gille–Szamuely (2017)**, CUP: 1.1.9, 1.5.2, 4.4, 4.7. Paywalled and absent from the manifest.
- **Uncertified in the manifest, cited by locator only:**
  - Serre, *A Course in Arithmetic*: III.1.1–1.2, III Thms 1–2, IV.1.3 Thm 2, IV.2.1 Thm 5, IV Thm 6, Prop 6, Thm 7;
  - Serre, *Local Fields*: X, XIV §2;
  - O'Meara (1963) §63;
  - Milnor (1970) §4;
  - Scharlau Ch. 2 §5.
- **Not in the manifest:** Grove (2002), O'Meara (1955), Delzant (1962) and Fröhlich. I did not look for legal copies, because this review edits no manifest.

## Source issues

- none
