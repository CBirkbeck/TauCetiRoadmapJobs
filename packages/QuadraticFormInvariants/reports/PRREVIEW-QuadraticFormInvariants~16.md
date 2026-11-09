# Review of QuadraticFormInvariants (pull request #1215 at 95ba181)

**Verdict:** needs changes

This is a full review: the folder changed by 9898 lines since `1abcd32`. The rewrite repairs 14 of the previous review's 16 findings; the status of each is listed after the new findings. All eight findings below are P3. One of them (R01) is the gate's only failing check, so the folder cannot be accepted until it is fixed.

## R01 (P3) — An edit outside the folders this pull request owns fails the gate

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` (62 insertions and 50 deletions against main). The worker's gate at this head fails only on `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`.

**Claim.** The pull request's own folders are `ClassFieldTheory`, `GlobalQuadraticForms` and this one. Its description names only the class-field-theory corrections, so this file is an edit outside them, and the gate fails.

**Witness.** `git diff --stat 1abcd32 HEAD -- Completed/LocalGaloisGroups` is empty. This is the previous review's R16, unchanged; that review elaborated the file and found the edit itself correct.

**Repair.** Do one of the following:
- name the migration of `Completed/LocalGaloisGroups/Suggested.lean` to Tau Ceti names in the pull-request description, so that the gate counts the file as this pull request's own;
- revert the file to main.

## R02 (P3) — #1797 carries the same rewrite of this roadmap, and no merge order is stated

**Location.** The pull-request description. It names neither #1797 nor #1187, and both are open and conflict with this pull request in this folder.

**Claim.** Merging both pull requests applies the same rewrite twice, and whichever merges second conflicts. The order has to be stated, and the second pull request should not restate what the first already changes.

**Witness.** At #1797's head `9864ff4`, `QuadraticFormInvariants/Suggested.lean` is identical to this head's. Its README differs only at this head's lines 296–305, 1464, 1584, 1693 and 1743 (the ClassFieldTheory citations). #1187 (`66ed0d4`) bumps Tau Ceti and rewrites this `Suggested.lean`.

**Repair.**
- State the order in the description. The smaller diff comes from merging #1797 first and rebasing. This pull request's change to the folder is then only those five ClassFieldTheory hunks, which it needs because it also changes `ClassFieldTheory`.
- Alternatively, drop this folder from #1797.
- Say whether #1187 merges before or after. If it merges before, the 15 declarations must re-elaborate at its pin.

## R03 (P3) — `hilbertSymbol_unramified` takes its conclusion as a hypothesis

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:134–138`:

> `(hΔ : ∀ b : Kˣ, (∃ x y : K, (b : K) = x ^ 2 - Δ * y ^ 2) ↔ Even (…).toAdd) (b : Kˣ) : hilbertSymbol Δ b = if Even (…).toAdd then 1 else -1`

`README.md:1359–1362` calls this "Evaluation against the unramified class".

**Claim.** By `TauCeti.hilbertSymbol_def` the symbol is `+1` exactly when `b = x² − Δy²` is solvable. So `hΔ` is the conclusion read through the definition, and the unramified class, whose existence is the content, appears nowhere. The Lean form rules exclude a hypothesis that contains the conclusion.

**Witness.** On a scratch copy, `by simp only [hilbertSymbol, TauCeti.hilbertSymbol_def, hΔ b]` closes it without `TauCeti.hilbertSymbol_unramified`; `lake env lean` exits 0.

**Repair.** Keep the name, which GlobalQuadraticForms cites, and state the existence:

```lean
theorem hilbertSymbol_unramified [Invertible (2 : K)] :
    ∃ Δ : Kˣ, ¬ IsSquare Δ ∧ (TauCeti.normalizedValuation K Δ).toAdd = 0 ∧
      ∀ b : Kˣ, hilbertSymbol Δ b =
        if Even (TauCeti.normalizedValuation K b).toAdd then 1 else -1 := by
  obtain ⟨Δ, hsq, hv, -, hΔ⟩ := TauCeti.exists_unramified_class (K := K) (Invertible.ne_zero 2)
  exact ⟨Δ, hsq, hv, TauCeti.hilbertSymbol_unramified hΔ⟩
```

Tested at the pin, with `TauCeti.hilbertSymbol` in place of the reducible alias:
- it elaborates;
- the unfolding probe `simp only [TauCeti.hilbertSymbol_def]` now leaves an unsolved existential goal.

Reword README 1359–1362 and the docstring to match: there is a nonsquare unit `Δ` of valuation zero, and for it `(Δ, b)_K = (−1)^(v_K(b))`.

## R04 (P3) — A local instance restates Tau Ceti's global instance

**Location.** `Suggested.lean:48–50`:

> `noncomputable local instance qfiNativeBrauerCommGroup (F : Type*) [Field F] : CommGroup (BrauerGroup F) := TauCeti.BrauerGroup.instCommGroup`

**Claim.** `TauCeti.BrauerGroup.instCommGroup` is already a global `instance` (`TauCeti/Algebra/BrauerGroup/Group.lean:174`), and this file imports it. So the declaration restates the library. It is also the only declaration of the file that the README never names.

**Witness.** A scratch copy with lines 48–50 deleted elaborates with exit 0 and no messages. That includes `hasseInvariant_eq_localHasse`, the only statement that uses a group law on `BrauerGroup K`.

**Repair.** Delete lines 48–50.

## R05 (P3) — The Clifford example over `ℝ` does not test the first correction exponent

**Location.** `README.md:1218–1220`:

> "The Clifford invariant of `⟨1,…,1⟩` over `ℝ` for `n = 1, …, 8` is `1, 1, [ℍ], [ℍ], [ℍ], [ℍ], 1, 1` … this checks both correction exponents of Lam V.3.20."

**Claim.** For `⟨1,…,1⟩` the discriminant is `[1]`, so the factor `[(−1, d)]^((n−1)(n−2)/2)` is `1` whatever its exponent. The example tests only the second exponent.

**Witness.** The eight values are `[(−1,−1)]^C(n+1,4)`, with `C(n+1,4) = 0, 0, 1, 5, 15, 35, 70, 126`. Replacing `(n−1)(n−2)/2` by `0` changes none of them.

**Repair.**
- Say that the list checks the second exponent.
- Add `⟨−1,−1,−1⟩` over `ℝ`. Here `C₀ ≅ ℍ`, so `c = [ℍ]`. The formula gives `s · [(−1,−1)]^1 · [(−1,−1)]^1 = [ℍ]` with `s = [ℍ]^3` and `d = [−1]`; without the first factor it gives `1`.
- Optionally give the full list for `⟨−1⟩ⁿ`, `n = 1, …, 8`: `1, [ℍ], [ℍ], [ℍ], [ℍ], 1, 1, 1`. This matches the algebras `ℝ, ℍ, ℍ, M₂(ℍ), M₂(ℍ), M₈(ℝ), M₈(ℝ), M₁₆(ℝ)`.

## R06 (P3) — Three passages disagree with what they cite

1. **The local identification in 7C is narrower than the pin.**
   - Location: `README.md:2092–2095`: "Over a nonarchimedean local field the cohomological local symbol … vanishes exactly when `(a) ∪ (b)` does (`TauCeti.localSymbol_eq_zero_iff_cup`)".
   - Witness: at the pin, `TauCeti.localSymbol_eq_zero_iff_cup` and `TauCeti.hilbertSymbol_eq_cohomological` assume only `[Field K] [Invertible (2 : K)]` (`FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:157, 191`). 6C item 13 (line 1566) and `Suggested.lean:203` say the same.
   - Repair: write "Over every field in which `2` is invertible".
2. **The `I²` additivity is stated more narrowly than the theorems it cites.**
   - Location: `README.md:1168–1172`: "when the Witt classes of both summands lie in `TauCeti.fundamentalIdeal K ^ 2`".
   - Witness: both cited theorems assume this of one summand only (`RegularFormClass/Clifford.lean:657`, `Witt/Clifford.lean:93`). Over `ℝ`, take `x = ⟨1,1,1,1⟩` in `I²` and `y = ⟨1,1,1⟩` not in it: `c(⟨1⟩⁷) = 1 = [ℍ]·[ℍ]`.
   - Repair: write "when the Witt class of one summand lies in `I²`". Keep the ⚠ that follows: with neither summand in `I²`, `⟨1⟩ ⊥ ⟨1,1⟩` over `ℝ` gives `[ℍ] ≠ 1·1`.
3. **The supplier contract omits a ProfiniteCohomology layer that the layers consume.**
   - Location: `README.md:307` consumes ProfiniteCohomology "Layers 1–4, 8–10, 12 and 13".
   - Witness: 7B item 2 needs "Layers 0, 2, 3 and 4" (line 1977), and 7C's dependencies list "Layers 0 to 4" (line 2128).
   - Repair: add Layer 0 (discrete modules and continuous sections, `ProfiniteCohomology/README.md:583`) to the contract.

## R07 (P3) — GlobalQuadraticForms still cites three names this pull request deletes from this roadmap

**Location.** In `TauCetiRoadmap/GlobalQuadraticForms/README.md`, the Quadratic Form Invariants supplier rows cite:
- `signedDiscr` at line 123;
- `localHasse_congr` at lines 126 and 293–294;
- `discr_mk` at line 618.

**Claim.** On main this roadmap declared all three (`Suggested.lean:467, 475, 1309` there). This head declares none of them, and this README gives no old-to-new line, so those citations break when this pull request merges.

**Witness.** Tau Ceti has the replacements:
- `TauCeti.RegularFormClass.discr_mk` (`RegularFormClass/Discriminant.lean:129`);
- `TauCeti.RegularFormClass.signedDiscr` (`:260`);
- `TauCeti.RegularFormClass.localHasse_congr` (`NumberTheory/LocalField/QuadraticForm/Hasse.lean:108`).

**Repair.** Do one of the following:
- make GlobalQuadraticForms, which is in this same pull request, cite the three Tau Ceti names;
- add one line per moved name to this README's scope list (24–34), for example "`localHasse_congr` → `TauCeti.RegularFormClass.localHasse_congr`".

## R08 (P3) — No `## Downstream consumers` section

**Location.** The README's top-level headings run from Scope, Conventions, the supplier contracts and How to read the build, through Layers 0–9, to References.

**Claim.** The required shape ends with `## Downstream consumers`. Here the consumers appear only as the list of aliases in the scope section (24–34).

**Witness.** These roadmaps cite this one:
- GlobalQuadraticForms, IntegralLattices, OrthogonalSpinGroups and ClassicalArithmeticCompletion;
- SpinRepresentations, Layer 1 (#1207);
- QuadraticFormInvariantsPartII, Layers 1, 4 and 7B (#1834);
- GeometryOfNumbersAndQuadraticArithmeticPartII, Layers 4, 6 and 9 (#1691).

**Repair.** Add the section before References, with one bullet per consumer giving the layers it uses (roadmap names, no pull-request numbers), and move the alias list into it.

## Previous findings (review of `1abcd32`)

- **R01** (`squareClass_finite` lost its binders) — repaired. The instance is gone. The 15 declarations at this head are listed in `signatures.md`, and finiteness is README 6A's `TauCeti.card_squareClass`, with local hypotheses (line 1276).
- **R02** (completion audit false at the pin) — repaired. There is no "Completion audit" or stage text left. The `ULift` square is cited at 7B item 5 (lines 2013–2019, `TauCeti.brauerCohomologyEquiv_uliftEquiv`).
- **R03** (`sorry` data) — repaired. The gate reports `sorry-data=0`, and the file contains no `sorry`.
- **R04** (bridges restated narrowly) — repaired.
  - Three of the five bridges are deleted.
  - `hilbertSymbol_eq_cohomological` (`Suggested.lean:206`) and `hilbertSymbol_productFormula` (`:195`) are now aliases at Tau Ceti's generality.
  - README 59–66 reads "In Tau Ceti both the comparison … and the sign form of reciprocity … are proved".
  - One residue of the narrower generality remains in 7C (R06, item 1).
- **R05** (API catalogue) — repaired. The file has 15 declarations, and the module docstring lists the five headlines with their Tau Ceti theorems.
- **R06** (no order with #1797, #1187) — not repaired; now R02. The description still names neither.
- **R07** (imports of roadmap modules) — repaired. The gate reports `imports=0`, and the file imports only Mathlib and 16 `TauCeti.*` modules.
- **R08** (`sorry` examples) — repaired. The gate reports `sorry-examples=0`.
- **R09** (Pfister names) — repaired. README 997–998 cites `TauCeti.oneFoldPfister_smul_equivalent_iff` and `twoFoldPfister_smul_equivalent_iff` (`Witt/Round.lean:44, 61`).
- **R10** (unqualified supplier names) — repaired. The gate reports `readme-ids-missing=0`; for example, line 2010 reads `TauCeti.brauerCohomologyEquiv_baseChange` and line 2282 reads `TauCeti.Algebra.discr_one_elem_eq_of_sq_algebraMap`.
- **R11** (universes) — repaired. Line 1464 reads "stated for `K L : Type`", and lines 1674–1677 put Milestone 2 at `K : Type`. Both are confirmed by `#check @` below.
- **R12** (conductor summary) — repaired. 6C item 11 (1548–1554) no longer states the `U(K, 2e−d)` claim, and 6B case 3 (1402) carries "`d` odd, `0 < d < 2e`".
- **R13** (house style in 6C) — repaired. Lines 1461–1470 put every name in backticks, and `TauCeti#` occurs nowhere.
- **R14** (TeX scanner) — repaired. The gate reports `tex=0`.
- **R15** (`NativeCompletion.md`) — repaired. The file is deleted at `95ba181`, and no link to it remains.
- **R16** (outside-folder edit) — not repaired; now R01.

## Verified sound

**Gate.**
- The worker's gate at this head reports 0 on every check except `outside-folder=1` (R01). Its targeted build of this module and GlobalQuadraticForms passes.
- My own run gives the same counts, except that it reports `outside-folder=5`; the four extra entries are this pull request's own ClassFieldTheory and GlobalQuadraticForms files.

**Depcheck.** The output is `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 10 s with no message at all. The five headline examples and all the aliases are proved from Tau Ceti; nothing is admitted.

**Binders.** I compared the 15 elaborated types in `signatures.md` with the README.
- The three "dropped `[Invertible (2 : K)]`" leads are false positives. The types of `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each contain `[Invertible 2]` and the local-field binders.
- Each type has the README's generality: 6C item 5, 6D, 6E and 6C items 13 and 14.

**Library names.**
- All 665 qualified Mathlib and Tau Ceti names in the README exist as declarations at the pins (Tau Ceti `2fd255d`). The 143 names in the sampled sections are in the files the README gives.
- I elaborated `#check @` for 67 of them (one more was only located). Among them:

| Declaration | Location at the pin | What I checked |
|---|---|---|
| `TauCeti.QuaternionAlgebra.isSimpleRing_of_j_sq_mul_discr_ne_zero` | `Algebra/Quaternion/CentralSimple.lean:81` | assumes `c * discr a b ≠ 0` |
| `TauCeti.QuaternionAlgebra.completeSquareEquiv` | `SymbolEquiv.lean:104` | `ℍ[a,b,c] ≃ ℍ[discr a b, 0, c]`, with `discr a b = b² + 4a` (Mathlib `QuadraticAlgebra/Discriminant.lean:52`) |
| `TauCeti.RegularFormClass.hasseInvariant_mk_rankOne_mul` | `Hasse/Basic.lean:253` | exponents `rank.choose 2` and `rank − 1` |
| `TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul` | `Clifford.lean:570` | exponents `(rank−1).choose 2` and `(rank+1).choose 4` |
| `TauCeti.RegularFormClass.eq_iff_discr_eq_and_hasseInvariant_eq` | `LowRank.lean:126` | assumes rank at most 3 |
| `TauCeti.fundamentalIdeal_pow_eq_addClosure` | `Witt/Pfister/Basic.lean:355` | assumes `0 < n` |
| `TauCeti.index_normGroup_of_isCyclic` | `Brauer/LocalH2Bound.lean:70` | `K L : Type` |
| `TauCeti.BrauerGroup.quaternionSubgroup_eq_twoTorsion` and its two siblings | `LocalField/Quaternion/Invariant.lean:67, 79, 92` | `K : Type` |
| `TauCeti.galoisEvens2_kummerClass_of_trace_eq_zero`, `…_one_add`, `…_sqrt` | `Evens/Kummer/Value.lean:182, 329, 204` | as README 2367–2375 states them |
| `TauCeti.hilbertSymbol_unramified`, `TauCeti.exists_unramified_class` | `UnramifiedClass.lean` | used for R03 |

**Cross-roadmap citations.**
- ClassFieldTheory at this head:
  - Layer 5 is at `README.md:836` and Layer 14 at `:1565`. They name `muNRep`, `kummerClass`, `kummerCupPairing`, `localSymbol`, `invMap`, `h2MuEquivZMod`, `finiteHilbertInvariantAt` and `hilbertProductFormula`.
  - The universe-0 convention is at `:249–250`.
  - `index_normGroup_of_isCyclic` is attributed to Layer 5 at `:1200–1202`.
- ProfiniteCohomology (main, unchanged here):
  - Layer 0 is at `:583`, Layer 1 at `:630`, Layer 4 at `:861` and Layer 8 at `:1265`.
  - Layer 9 is at `:1363`, Layer 10 (corestriction) at `:1549`, Layer 12 at `:2091` and Layer 13 (the `D₁₆` pullback) at `:2163`.
  - Its prototypes `f2Pairing` and `cup` are at `Suggested.lean:5332` and `:3868`. The citations tool's lead on `f2Pairing` is that prototype, as README 317–320 says.
- LocalFieldsRamification Layers 0–2 are at `:72, :281, :576`. `map_norm_unitFiltration_zero` is at `Suggested.lean:857`, proved from `TauCeti.map_normUnits_unitFiltration`; that is the citations tool's other lead.
- SemisimpleAlgebras Layers 4–6 are at `:249, :274, :293`.

**Overlaps and ownership.**
- `overlaps.md` reports no dropped ids and no revision-only ids. Every qualified `QuadraticFormInvariants.*` name cited on main or at an open head is one this head keeps (`roadmaps grep`).
- QuadraticFormInvariantsPartII (#1834) owns exactly this roadmap's exclusions, and cites Layers 1, 4 and 7B, which exist here.
- GeometryOfNumbersAndQuadraticArithmeticPartII (#1691) cites Layers 4, 6 and 9. It declares `gap:quadratic-extension-witt-exactness` against this roadmap; that is its own supplier contract, not a defect here.
- OrthogonalSpinGroups and SpinRepresentations consume Layer 1's Cartan–Dieudonné, which stays here.
- `Completed/OrthogonalSpinGroups/Suggested.lean:84–86` `#check`s only names that are kept.

**Sources checked at their locators.** The roadmap gives no page numbers for these; the pages below are the printed ones.
- `kahn1984` line 763–765, Lemme II.2.1 on p. 241: `N((a)) = (Tr a, −d·N a) + (2,d)` if `Tr a ≠ 0`, and `(2,d)` otherwise. This is exactly README 2367–2369 and `Suggested.lean:262–276`.
- `kahn1984` line 55, Théorème 2 on p. 224: `w(T(q)) = N(w(q))·w(T(1))^r`. Its degree-1 and degree-2 parts with `r = 1` are README 2510–2516.
- `kahn1984` lines 1044–1058, Prop. II.3.5 on p. 248: the rank-one case, reduced to Lemme II.2.1, which is the route of README 2526–2538.
- `kahn1984` line 343, Prop. I.2.4 a): `N₂(x+y) = N₂x + N₂y + p_*(xy) + p_*(x)p_*(y)`. At index two this is `cor(x ∪ σ·y)`, which is README 1828 and 2327.
- `serre1984cmh` lines 560–562, Théorème 1′ in §4.1 on p. 668: `w₂(Q_{E,a}) = e_a^* s'_n + (2)(d_E)`, with the remark that `d_E` and not `d(Q)` enters, as README 2461–2462 says. The second proof is at lines 582–600.
- `kozlowski1984` line 34, Thm 1.1 on p. 309: transfer commutes with the total Stiefel–Whitney class for 2-coverings.
- `ekm2008` line 2379, §7.A on p. 43: nondegenerate quadratic forms.

**Adversarial table** (headlines, aliases, sampled targets, and every target a finding touches)

| Statement | Instance | Values on each side | Result | Change |
|---|---|---|---|---|
| Four-fold criterion (`Suggested.lean:226`) | `a = 1`; `ℝ, a=b=−1`; `ℚ₂, (2,5)` | `a = 1`: `b = ((b+1)/2)² − ((b−1)/2)²`, so all five hold. `ℝ`: `ℍ` is division, `−1 ≠ x²+y²`, and `⟨1,1,1⟩` is anisotropic, so all five fail. `ℚ₂`: `ε(1)ε(5) + ω(5) = 1`, so `(2,5) = −1` and all five fail. | consistent | none |
| 6D classification (`:239`) | `ℚ₂`: `⟨1,1⟩` against `⟨2,2⟩` and against `⟨−1,−1⟩`; `V = W = 0`; `ℝ` | `⟨2,2⟩`: same `(2,[1],+1)`, isometric by `(x+y)²+(x−y)² = 2x²+2y²`. `⟨−1,−1⟩`: `s = +1` against `(−1,−1)₂ = −1`, not isometric. Rank 0: both sides true. `ℝ`: `⟨1⁴⟩` and `⟨(−1)⁴⟩` share `(4,[1],+1)` and are excluded by the local-field binder. | consistent | none |
| Cup-norm (`:254`) | `ℝ, a=b=−1`; `𝔽_q`, `q` odd; `a = 1` | `ℝ`: cup `≠ 0` (`MuTwo/Real.lean:64`) and `−1 ≠ x²+y²`. `𝔽_q`: `H² = 0`, and every unit is a norm or `a` is a square. `a = 1`: `(1) = 0` and `b = x²−y²`. | both sides agree | none |
| Evens value (`:265`) | `ℚ₂(i), a = 1+2i`; `ℂ/ℝ` | `ℚ₂(i)`: `t = 2`, `N = 5`, so the right side is `(2)∪(5) + (2)∪(−1) = (2)∪(5) ≠ 0`. `ℂ/ℝ`: the left side is `0` (every element is a square); the right side is `(t)∪(N a) = 0`, since `N a > 0`. | consistent; Kahn p. 241 | none |
| Relative `w₂` (`:282`) | `ℚ₂(i), a = 1+2i` | Left: `w₂⟨2, −2/5⟩ = (2)∪(−10) = (2)∪(5)`. Right: `0 + (2)∪(5) + (−1)∪(5)`, and the last term is `0` since `(−1,5)₂ = +1`. | equal | none |
| `hilbertSymbol_comm` (`:125`) | `ℚ, (−1,3)` | `3 ≠ x²+y²`; `−1 = x²−3y²` has no solution mod 3 | `−1 = −1` | none |
| `hilbertSymbol_mul` (`:144`) | `ℚ₂, (−1,3·7)`; `ℚ` | `(−1,21) = (−1,5) = +1` and `(−1,3)(−1,7) = (−1)(−1)`. Over `ℚ` all three are `−1`, but `ℚ` is excluded by the binders. | consistent | none |
| `exists_hilbertSymbol_eq_neg_one` (`:150`) | `ℚ₂, a = −1`; `a = 1` | `b = 3` gives `−1`. `a = 1` has no partner, and `¬ IsSquare` excludes it. | consistent | none |
| `exists_of_realization` (`:158`) | `(2,[1],−1)` over `ℚ₂` and `ℚ₃`; `(2,[−1],−1)` | Realized by `⟨−1,−1⟩` over `ℚ₂`, and by `⟨3,3⟩` over `ℚ₃` with `(3,3)₃ = (−1/3) = −1`. `(2,[−1],−1)` is barred by `h₂`. | consistent | none |
| `hasseInvariant_eq_localHasse` (`:168`) | `ℚ₂`, `![1,1]` and `![−1,−1]` | `ε(1) = +1`; `ε[(−1,−1)] = −1 = localHasse ![−1,−1]` | injective, agrees | none |
| `hilbertSymbol_productFormula` (`:195`) | `ℚ`, `(−1,−1)` and `(2,5)` | `(−1,−1)`: `(−1)·(−1)` at 2 and ∞. `(2,5)`: `(2,5)₂ = −1`, `(2,5)₅ = (2/5) = −1`, `+1` elsewhere. | product `1` | none |
| `hilbertSymbol_eq_cohomological` (`:206`) | `ℚ₂, (−1,−1)`; `ℚ` | `ℚ₂`: `tr` sends the nonzero cup to `1`, whose sign is `−1`. `ℚ`: no `tr : H² ≃+ ZMod 2` exists. | true, vacuous off `H² ≅ ℤ/2` | none |
| `hilbertSymbol_unramified` (`:134`) | unfolding probe | `simp only [hilbertSymbol, hilbertSymbol_def, hΔ b]` closes it | hypothesis is the conclusion | R03 |
| `qfiNativeBrauerCommGroup` (`:49`) | deletion probe | the file elaborates with exit 0 | redundant | R04 |
| `discr` Checks (804–815) | rank 0; `⟨1,−1⟩`; `⟨1⟩` and `⟨4⟩` | `[1]`; `[−1]`, while the signed value is `[1]`; `[1]` on both | match | none |
| `localHasse` Checks (1511–1523) | `ℚ₂ ![−1,2]`; O'Meara's symbol; `![−1,−1]` | `(−1,2)₂ = +1`, since `ω(−1) = 0`. O'Meara's symbol is `(−1)(+1)(+1) = −1 = s·(−2,−1)₂`. `![−1,−1]` gives `−1, −1, +1` at 2, ∞, 3. | match | none |
| Central simplicity (1071–1079) | `ℍ[K,a,0,b]` | `c·discr = b·4a ≠ 0`; `(2i−b)² = 4a + b²` | match the pin | none |
| Binary-invariance warning (1102–1104) | `⟨2,−1⟩` and `⟨1,−2⟩` | `2·1² − 1·1² = 1`, and both have `d = [−2]`, so they are isometric and force `[(2,−1)] = 1` | warning correct | none |
| Hasse scaling (1120–1121) | `n = 2`; `n = 0` | `n = 2`: `(λa,λb) = (λ,−1)(λ,ab)(a,b)`, which is the formula. `n = 0`: the Lean exponent `rank − 1` is `0` and both sides are `1`. | match | none |
| Dimension ≤ 3 (1131) | `ℝ`, ranks 3 and 4 | Rank 3: signatures 3, 1, −1, −3 give `([1],1), ([−1],1), ([1],[ℍ]), ([−1],[ℍ])`, all distinct. Rank 4: `⟨1⁴⟩` and `⟨(−1)⁴⟩` share `([1],1)`. | the bound is needed | none |
| Clifford, Lam V.3.20 (1156) | `⟨1⟩ⁿ` and `⟨−1⟩ⁿ` over `ℝ`, `n ≤ 8` | `⟨1⟩ⁿ`: `C(n+1,4)` parities `0,0,1,1,1,1,0,0`. `⟨−1⟩ⁿ`: exponent parities `0,1,1,1,1,0,0,0`, matching `ℝ, ℍ, ℍ, M₂ℍ, M₂ℍ, M₈ℝ, M₈ℝ, M₁₆ℝ`. | formula true, example weak | R05 |
| `I²` additivity (1168) | `ℝ`: `⟨1⟩⊥⟨1,1⟩`; `⟨1⁴⟩⊥⟨1³⟩` | First: `[ℍ] ≠ 1·1`, with neither summand in `I²`. Second: `1 = [ℍ][ℍ]`, with one summand in `I²`. | narrower than the pin | R06 |
| 7C local identification (2092) | `#check @` | binders `[Field K] [Invertible 2]` only | narrower than the pin | R06 |
| Odd-residue formula (1538) | `ℚ₃ (3,3)`; `ℚ₅ (5,5)` | `(−1)^1 = −1 = (−1/3)`; `(−1)^2 = +1 = (−1/5)` | match | none |
| `ℚ₂` Gram matrix (1557–1559) | basis `−1, 2, 5` | `(−1,−1) = (2,5) = −1`; `(−1,2)`, `(−1,5)`, `(2,2)` and `(5,5)` are `+1`; `det ≡ 1 mod 2` | match | none |
| 6A square-class counts (1275) | `ℚ₂`, `ℚ₃`, `ℚ₂(√2)` | `4·2 = 8`; `4`; `4·2² = 16 = 2^(2+2)` | match | none |
| 6B unit defects (1343, 1420) | `ℚ₂`: `5, −1, 5/4, −5` | `5 − ξ² ≡ 4 mod 8`, so `4ℤ₂`; `−1 − 1 = −2`, so `2ℤ₂`; `δ = 2 − 2 = 0`; `−5 ≡ 3 mod 8`, so `2ℤ₂ ≠ 8ℤ₂` | match | none |
| 6B case 3 (1416–1418) | `ℚ₂, a = −1, d = 1` | `1 = 1²` and `5 = 1²+2²`, so `U(2)` lies in the norms; `3` is not a sum of two squares | match | none |
| 6B index-4 warning (1413–1414) | `ℚ₂(√2), d = 1` | Units modulo squares have order 8. `U(4)` contributes a subgroup of order 2, because `U(5)` lies in the squares and `U(4)` does not. That is index 4, not 2. | match | none |
| 6D isotropy (1610–1613) | `⟨1,1,1⟩` over `ℚ₂` and `ℚ₃`; `⟨1⁴⟩` over `ℚ₂` | `ℚ₂`: `s = 1 ≠ (−1,−1)₂`, anisotropic. `ℚ₃`: `−2 ≡ 1` is a square mod 3, isotropic. `⟨1⁴⟩`: `d = 1`, `s = 1 ≠ −1`, anisotropic. | match the pin | none |
| Ramified-base control (1714–1718) | `ℚ₂(π)` with `π² = 2`, `a = 5` | `(π+½)² − 5/4 = 1 + π`. Both families reduce to `1` mod 2, while `1 + π` reduces to `1 + ε`. | match | none |
| `SD₁₆` false value (2569–2572) | `ℚ₂, d = −1, t = 2` | `(2)∪(5) + (−1)∪(−1) = 1 + 1 = 0` in `ℤ/2`, while the true value is `≠ 0` | match | none |
| `Pin⁺` model (2385–2448) | the matrices | `e₁² = e₂² = 1`; `t² = 1`; `(e₁t)⁴ = (e₁e₂)² = −1`; `−e₁(y₀e₁+y₁e₂)e₁ = −y₀e₁ + y₁e₂` | match | none |
| Layer 4 warning at `n = 0` (966–968) | `W(ℚ)`: `⟨2⟩` against `k⟨1⟩` | The signature forces `k = 1`, and `⟨2⟩ ≠ ⟨1⟩`. | match | none |
| 6E universes (1674–1677) | `#check @` | Milestone 2 is stated for `K : Type`; Milestone 1 and the cup compatibility for `Type u_1` | as stated | none |

**Gaps.** None declared.

## Not verifiable

- Lam (2005, AMS GSM 67), Gille–Szamuely (2017, CUP), Grove (2002, AMS GSM 39) and O'Meara's 1955 paper.
  - They are not in the roadmap's `sources.toml`, which has 11 entries, and they are publisher texts behind paywalls. This review edits no manifest, so I did not request them.
  - Affected locators include Lam V.3.4, V.3.16–3.21, III.2.7 and III.2.11, and Gille–Szamuely 1.1.9, 1.5.2, 4.4 and 4.7, from the sampled targets "The quaternion symbol in `Br(K)`", "The Hasse invariant", "Classification in dimension at most three", "The Clifford invariant" and "The `I²` homomorphism".
  - I checked those statements instead against the pinned Tau Ceti declarations and by computation (the table).
- Serre's *A Course in Arithmetic*, Serre's *Local Fields*, O'Meara (1963), Scharlau and Milnor are settled as uncertified. Their formulas were checked by computation.
- The sampled targets "Quaternion algebras are central simple", "Base change and the remaining API", "The symbol", "The classical construction", "Milestone 1", "Milestone 2" and "Compatibility with the cup product" carry Tau Ceti declarations and no source locator. I checked them at the pin.

## Source issues

- none
