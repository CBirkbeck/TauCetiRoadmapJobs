# Review of QuadraticFormInvariants (pull request #1215 at b9e8822)

**Verdict:** needs changes

This is an incremental re-review. Since `95ba181` the folder `TauCetiRoadmap/QuadraticFormInvariants/` has changed by 0 lines: `git diff --stat 95ba181 HEAD` lists only `TauCetiRoadmap/ClassFieldTheory/README.md` and `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`. None of the eight findings of the review of `95ba181` is repaired, so all eight are restated below, with witnesses re-run at this head. All are P3. R01 is still the gate's only failing check.

The ClassFieldTheory change is checked under "Verified sound": every citation this README makes into ClassFieldTheory still resolves at its head, and the change introduces no new finding here.

## R01 (P3) — An edit outside the folders this pull request owns fails the gate

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 62 insertions and 50 deletions against main. The worker's gate at `b9e8822` fails only on `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`.

**Claim.** The pull request's own folders are `ClassFieldTheory`, `GlobalQuadraticForms` and this one. Its title ("ClassFieldTheory: correct hypotheses, conductors and lifting") and its description never mention `LocalGaloisGroups`, so the gate counts this file as an edit outside the pull request.

**Witness.** `git diff --stat 95ba181 HEAD -- Completed/LocalGaloisGroups` is empty: the file is exactly as the previous review found it (its R01). My own gate run lists the same file.

**Repair.** Do one of the following:
- name the migration of `Completed/LocalGaloisGroups/Suggested.lean` to Tau Ceti names in the pull-request description;
- revert the file to main.

## R02 (P3) — #1797 carries the same rewrite of this roadmap, and no merge order is stated

**Location.** The pull-request description. It names neither #1797 nor #1187. Both are still open, and `overlaps.md` reports that each conflicts with this pull request in this folder.

**Claim.** If both pull requests merge, the same rewrite is applied twice, and whichever merges second conflicts. The order has to be stated, and the second pull request should not restate what the first already changes.

**Witness.**
- At #1797's new head `ea37f0f`, `QuadraticFormInvariants/Suggested.lean` is byte-identical to this head's.
- Its README differs in 26 lines, at this head's 296–305, 1464, 1584, 1693 and 1743. There #1797 cites ClassFieldTheory "Layers 3 and 14" for the local symbol, but ClassFieldTheory's Layer 3 is Tate's theorem (its README line 845).
- #1187 (`66ed0d4`) bumps Tau Ceti and also rewrites this `Suggested.lean`.

**Repair.**
- State the order in the description. The smaller diff comes from merging #1797 first and rebasing. This pull request's change to the folder is then only those five ClassFieldTheory hunks, and they are the right ones: they cite Layer 5 for the local symbol, where #1797 cites Layer 3.
- Alternatively, drop this folder from #1797.
- Say whether #1187 merges before or after this pull request. If before, the 15 declarations must re-elaborate at its Tau Ceti pin.

## R03 (P3) — `hilbertSymbol_unramified` takes its conclusion as a hypothesis

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:134–138`:

> `(hΔ : ∀ b : Kˣ, (∃ x y : K, (b : K) = x ^ 2 - Δ * y ^ 2) ↔ Even (…).toAdd) (b : Kˣ) : hilbertSymbol Δ b = if Even (…).toAdd then 1 else -1`

The same claim is at `README.md:1359–1362`.

**Claim.** By `TauCeti.hilbertSymbol_def`, the symbol is `+1` exactly when `b = x² − Δy²` is solvable. So `hΔ` is the conclusion read through the definition, and the unramified class, whose existence is the content of the theorem, appears nowhere.

**Witness.** In a scratch copy, the proof `by simp only [hilbertSymbol, TauCeti.hilbertSymbol_def, hΔ b]` closes the theorem without `TauCeti.hilbertSymbol_unramified`. The copy produced no error on this declaration.

**Repair.** Keep the name, which GlobalQuadraticForms cites, and state the existence:

```lean
theorem hilbertSymbol_unramified [Invertible (2 : K)] :
    ∃ Δ : Kˣ, ¬ IsSquare Δ ∧ (TauCeti.normalizedValuation K Δ).toAdd = 0 ∧
      ∀ b : Kˣ, hilbertSymbol Δ b =
        if Even (TauCeti.normalizedValuation K b).toAdd then 1 else -1 := by
  obtain ⟨Δ, hsq, hv, -, hΔ⟩ := TauCeti.exists_unramified_class (K := K) (Invertible.ne_zero 2)
  exact ⟨Δ, hsq, hv, TauCeti.hilbertSymbol_unramified hΔ⟩
```

I re-tested this at this head's pins, with `TauCeti.hilbertSymbol` in place of the reducible alias, and it elaborates. Reword README 1359–1362 and the docstring to match: there is a nonsquare unit `Δ` of valuation zero, and for it `(Δ, b)_K = (−1)^(v_K(b))`.

## R04 (P3) — A local instance restates Tau Ceti's global instance

**Location.** `Suggested.lean:48–50`:

> `noncomputable local instance qfiNativeBrauerCommGroup (F : Type*) [Field F] : CommGroup (BrauerGroup F) := TauCeti.BrauerGroup.instCommGroup`

**Claim.** `TauCeti.BrauerGroup.instCommGroup` is already a global `instance` at the pin (`TauCeti/Algebra/BrauerGroup/Group.lean:174`), and this file imports it. So the declaration duplicates the library, and it is the only declaration of the file that the README never names.

**Witness.** The same scratch copy has lines 48–50 deleted. It elaborates every declaration, including `hasseInvariant_eq_localHasse`, the only one that uses the group law. Its only errors come from three appended `#check`s of names in modules that the file does not import.

**Repair.** Delete lines 48–50.

## R05 (P3) — The Clifford example over `ℝ` does not test the first correction exponent

**Location.** `README.md:1218–1220`:

> "The Clifford invariant of `⟨1,…,1⟩` over `ℝ` for `n = 1, …, 8` is `1, 1, [ℍ], [ℍ], [ℍ], [ℍ], 1, 1` … this checks both correction exponents of Lam V.3.20."

**Claim.** For `⟨1,…,1⟩` the discriminant is `[1]`, so the factor `[(−1, d)]^((n−1)(n−2)/2)` is `1` whatever its exponent. The example tests only the second exponent.

**Witness.** The values are `[(−1,−1)]^C(n+1,4)`, with `C(n+1,4) = 0, 0, 1, 5, 15, 35, 70, 126`. Replacing `(n−1)(n−2)/2` by `0` changes none of them.

**Repair.**
- Say that the list checks the second exponent.
- Add `⟨−1,−1,−1⟩` over `ℝ`. Its even Clifford algebra is `C₀ ≅ ℍ`, so `c = [ℍ]`. With `s = [ℍ]³` and `d = [−1]`, the formula gives `s · [(−1,−1)]¹ · [(−1,−1)]¹ = [ℍ]`; without the first factor it gives `1`.

## R06 (P3) — Three passages disagree with what they cite

1. **The local identification in 7C is narrower than the pin.**
   - Location: `README.md:2092–2095`, "Over a nonarchimedean local field the cohomological local symbol … vanishes exactly when `(a) ∪ (b)` does (`TauCeti.localSymbol_eq_zero_iff_cup`)".
   - Witness: at the pin, `#check @TauCeti.localSymbol_eq_zero_iff_cup` has only the binders `[Field K] [Invertible 2]`, and so does `hilbertSymbol_eq_cohomological`. 6C item 13 (line 1566) already says "over every field in which `2` is invertible".
   - Repair: write "Over every field in which `2` is invertible".
2. **The `I²` additivity is stated more narrowly than the theorems it cites.**
   - Location: `README.md:1168–1169`, "when the Witt classes of both summands lie in `TauCeti.fundamentalIdeal K ^ 2`".
   - Witness: both cited theorems assume this of `x` only, for every `y` (`RegularFormClass/Clifford.lean:657`, `Witt/Clifford.lean:93`). Over `ℝ`, take `⟨1⁴⟩ ∈ I²` and `⟨1³⟩ ∉ I²`: then `c(⟨1⁷⟩) = 1 = [ℍ]·[ℍ]`.
   - Repair: write "when the Witt class of one summand lies in `I²`", and keep the ⚠ that follows it.
3. **The supplier contract omits a ProfiniteCohomology layer that the layers consume.**
   - Location: `README.md:307` lists "Layers 1–4, 8–10, 12 and 13".
   - Witness: 7B item 2 needs "Layers 0, 2, 3 and 4" (line 1977), and 7C's dependencies list "Layers 0 to 4" (line 2128).
   - Repair: add Layer 0 (discrete modules and continuous sections) to the contract.

## R07 (P3) — GlobalQuadraticForms still cites three names this pull request deletes from this roadmap

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md`, which is unchanged since `95ba181`:
- line 123 cites `signedDiscr`;
- lines 126 and 294 cite `localHasse_congr`;
- line 618 cites `discr_mk`.

All three are cited as this roadmap's names.

**Claim.** This head declares none of the three, and this README gives no line mapping each old name to its new one. Those citations break when this pull request merges.

**Witness.** The replacements exist at the pin, and I checked each with `#check @`:
- `TauCeti.RegularFormClass.signedDiscr`;
- `TauCeti.RegularFormClass.localHasse_congr`;
- `TauCeti.RegularFormClass.discr_mk`.

**Repair.** Do one of the following:
- make GlobalQuadraticForms, which is in this same pull request, cite the three Tau Ceti names;
- add one line per moved name to this README's scope list (lines 26–34), for example "`localHasse_congr` → `TauCeti.RegularFormClass.localHasse_congr`".

## R08 (P3) — No `## Downstream consumers` section

**Location.** The README's top-level headings run from Scope, Conventions, the supplier contracts and How to read the build, through Layers 0–9 (lines 353–2227), to References (2604).

**Claim.** The required shape ends with `## Downstream consumers`. Here the consumers appear only in the alias list of the scope section (lines 26–34).

**Witness.** These roadmaps cite this one:
- GlobalQuadraticForms, IntegralLattices, OrthogonalSpinGroups and ClassicalArithmeticCompletion;
- SpinRepresentations, Layer 1;
- QuadraticFormInvariantsPartII, Layers 1, 4 and 7B;
- GeometryOfNumbersAndQuadraticArithmeticPartII, Layers 4, 6 and 9.

ClassFieldTheory's own Downstream consumers (its README line 1916) names this roadmap.

**Repair.** Add the section before References, with one bullet per consumer and the layers it uses, by roadmap name. Move the alias list into it.

## Previous findings

- R01 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean` is still 62+/50− against main and unchanged since `95ba181`. The description does not name it, and the gate reports `outside-folder=1`. Restated as R01.
- R02 — not repaired: the description names neither #1797 (now `ea37f0f`, with an identical `Suggested.lean`) nor #1187. Restated as R02.
- R03 — not repaired: `Suggested.lean:134–138` still takes `hΔ`, the norm-equation criterion that is the conclusion read through the definition; the `simp only` probe still closes it. Restated as R03.
- R04 — not repaired: `Suggested.lean:48–50` still declares `qfiNativeBrauerCommGroup := TauCeti.BrauerGroup.instCommGroup`, and the file elaborates without it. Restated as R04.
- R05 — not repaired: `README.md:1218–1220` still says the `⟨1,…,1⟩` list "checks both correction exponents of Lam V.3.20". Restated as R05.
- R06 — not repaired: line 2092 still says "Over a nonarchimedean local field", lines 1168–1169 still say "both summands", and line 307 still lists "Layers 1–4, 8–10, 12 and 13". Restated as R06.
- R07 — not repaired: GlobalQuadraticForms lines 123, 126, 294 and 618 still cite `signedDiscr`, `localHasse_congr` and `discr_mk` as this roadmap's names. Restated as R07.
- R08 — not repaired: there is still no `## Downstream consumers` heading. Restated as R08.

## Verified sound

**Gate.**
- The worker's gate at `b9e8822` reports 0 on every check except `outside-folder=1` (R01), and its targeted build passes (`build=0`).
- My own run gives the same counts, except `outside-folder=5`. The four extra entries are this pull request's own ClassFieldTheory and GlobalQuadraticForms files.

**Depcheck.** `depcheck: 239 roadmaps, 2365 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 in 17 s with no messages at all.
- The 15 declarations are byte-identical to `95ba181`. The three "dropped `[Invertible (2 : K)]`" leads in `signatures.md` are false positives: the types of `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each contain an anonymous `[Invertible 2]`.

**The ClassFieldTheory change.** This roadmap's only cross-roadmap dependency that changed is ClassFieldTheory (855 README lines and 75 Lean lines since `95ba181`). I diffed its Layers 5 and 14 between the two heads.
- The changes in those layers are:
  - the headings, now `## Layer 5` at line 942 and `## Layer 14` at line 1869;
  - the Milne locators added to `tateDualityPairing_perfect` and to the Euler characteristic;
  - the new `𝔽₂((t))` Check;
  - `### Examples` and `### Dependencies` in place of the exit criteria.
- Nothing this roadmap consumes changed. I then re-resolved each citation into ClassFieldTheory at its head:

| This README | ClassFieldTheory at `b9e8822` | Resolved |
|---|---|---|
| 59–66: the dependency runs `ClassFieldTheory → QuadraticFormInvariants` | 197–207: "no dependency on `QuadraticFormInvariants`", the same direction | yes |
| 294–303: Layer 5 gives `μ_n`, Kummer class, Kummer-cup pairing, local symbol, Tate duality | Layer 5, 954–990: `muNRep` (956), `kummerMap` (957), `invMap` (964), `h2MuEquivZMod_mixed` (969), `kummerCupPairing` and `localSymbol` (970–977), `tateDualityPairing` (978–990) | yes |
| 294: Layer 14 gives Hilbert reciprocity | 1877–1892: `finiteHilbertInvariantAt`, `hilbertProductFormula` | yes |
| 1469: Layer 5 for the local cyclic cohomology behind `index_normGroup_of_isCyclic` | 1472–1476: Layer 10 draws "from Layer 5 … the cyclic norm index `index_normGroup_of_isCyclic`"; Layer 5 lists `Brauer/` (948) | yes |
| 1674–1676: ClassFieldTheory's whole development is in universe `0` (its Conventions) | Conventions 265–266: "stated at universe `0` (`G : Type`, `K : Type`)" | yes |
| 1583–1584, 1692–1694, 1743, 2100, 2129: "Layer 5" and "Layers 5 and 14" | the same layer numbers at this head (Layer 3 is Tate's theorem, 845) | yes |

All ten Tau Ceti names in these passages elaborate under `#check @` at the pin:
- `TauCeti.ClassFieldTheory.muNRep`, `kummerClass`, `kummerCupPairing` and `localSymbol`;
- `invMap`, which has `K : Type`;
- `h2MuEquivZMod`, which has `F : Type`;
- `finiteHilbertInvariantAt` and `hilbertProductFormula`;
- `TauCeti.index_normGroup_of_isCyclic`, which has `K L : Type`;
- `TauCeti.ClassFieldTheory.brauerGroupEquivBr`, defined at `NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Basic.lean:55` and located there by search, since the scratch file did not import it.

**Library declarations re-opened at the pin (Tau Ceti as pinned by `lake-manifest.json`).**
- `TauCeti.exists_unramified_class` and `TauCeti.hilbertSymbol_unramified`, used for R03.
- `TauCeti.BrauerGroup.instCommGroup : {K : Type u_1} → [Field K] → CommGroup (BrauerGroup K)`, used for R04.
- `TauCeti.localSymbol_eq_zero_iff_cup` (`MuTwo/LocalSymbol.lean:157`) and `TauCeti.hilbertSymbol_eq_cohomological`, used for R06.1.
- `cliffordInvariant_add_of_signedDiscr_eq_zero` (`RegularFormClass/Clifford.lean:657`) and `cliffordInvariant_add_of_mem_fundamentalIdeal_sq` (`Witt/Clifford.lean:93`), used for R06.2; each has a hypothesis on `x` only.
- `TauCeti.RegularFormClass.signedDiscr`, `localHasse_congr` and `discr_mk`, used for R07.

**Citation leads.** The citations tool reported two Lean names found nowhere. Both are on main:
- `LocalFieldsRamification.map_norm_unitFiltration_zero` is at `Completed/LocalFieldsRamification/Suggested.lean:857`;
- `ProfiniteCohomology.f2Pairing` is at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:5332`, and README 317–320 names it as a prototype.

**Overlaps.**
- `overlaps.md` reports no dropped ids and no ids that only an open revision defines.
- It reports #1797 and #1187 as conflicting; I checked #1797's copy against this head (R02).
- The ownership audit of the review of `95ba181` stands, since the folder is unchanged. That covers QuadraticFormInvariantsPartII, GeometryOfNumbersAndQuadraticArithmeticPartII, OrthogonalSpinGroups and SpinRepresentations.

**Seeded sample.** The folder did not change, so the sample was checked only where it meets the ClassFieldTheory change.
- "Milestone 2" and "Compatibility with the cup product" were checked against ClassFieldTheory's Layer 5 and Conventions (the table above and below).
- The other sampled targets carry forward from the review of `95ba181`, which checked their Tau Ceti declarations at the pin and the Kahn, Serre and Kozlowski locators at the lines it gives.

**Remarks on untouched text** (not findings, no change asked):
- README 1693 attributes `TauCeti.ClassFieldTheory.brauerGroupEquivBr` to ClassFieldTheory's Layer 5. That layer does not name the declaration, but it does list the `Brauer/` directory that holds it.
- ClassFieldTheory's README lines 197–200 say this roadmap proves agreement with `infiniteHilbertInvariantAt`. This README never names it: 6C item 14 goes through `hilbertProductFormula`. That text is ClassFieldTheory's, and it is unchanged since `95ba181`.

**Adversarial table.** The first block holds the rows for the statements and passages re-checked at this head, against the changed ClassFieldTheory or by re-run probes. The second block carries forward the rows of the review of `95ba181` (marked r16); those statements are unchanged.

| Statement | Instance | Values on each side | Result | Change |
|---|---|---|---|---|
| 6E Milestone 2 (1661–1677) | `ℚ₂`, `(−1,−1)` | `(−1,−1)_{ℚ₂} = −1`; `invMap [ℍ_{ℚ₂}] = 1/2`; `h2MuEquivZMod ((−1)∪(−1)) = 1`; `hilbertSign 1 = −1` | consistent | none |
| 6E universes (1674–1677) | `#check @` | `invMap : (K : Type) → …`, `h2MuEquivZMod : (F : Type) → …`; ClassFieldTheory Conventions 265: universe `0` | as stated | none |
| Cup compatibility (1683–1688) | `ℚ₃, (−1,−1)`; `ℚ₂, (−1,−1)` | `ℚ₃`: `−1 = x²+y²` is solvable, so the symbol is `+1` and the cup is `0`. `ℚ₂`: the symbol is `−1` and the cup is `≠ 0`. | agree | none |
| 6C index (1461–1468) | `ℚ₂(i)/ℚ₂`; `#check @` | Norms are sums of two squares, which gives the classes `{1,2,5,10}`, 4 of the 8 in `ℚ₂ˣ/(ℚ₂ˣ)²`, so the index is `2`. `index_normGroup_of_isCyclic : ∀ (K L : Type) …` | match | none |
| 6C item 14 and ClassFieldTheory Layer 14 | `ℚ`, `(−1,−1)` and `(2,5)` | `(−1,−1)`: `−1` at 2 and at ∞, the same as ClassFieldTheory's Layer 14 example. `(2,5)`: `(2,5)₂ = −1`, `(2,5)₅ = (2/5) = −1`. | product `1` | none |
| 7C identification (2092) | `#check @` | binders `[Field K] [Invertible 2]` only | narrower than the pin | R06 |
| `hilbertSymbol_unramified` (`:134`) | unfolding probe | `simp only [hilbertSymbol, hilbertSymbol_def, hΔ b]` closes it; the repaired existence statement elaborates | hypothesis is the conclusion | R03 |
| `qfiNativeBrauerCommGroup` (`:49`) | deletion probe | the file elaborates without it | redundant | R04 |
| Four-fold criterion (`Suggested.lean:226`), r16 | `a = 1`; `ℝ, a=b=−1`; `ℚ₂, (2,5)` | `a = 1`: all five hold. `ℝ`: all five fail (`ℍ` is division, `⟨1,1,1⟩` is anisotropic). `ℚ₂`: `(2,5) = −1`, and all five fail. | consistent | none |
| 6D classification (`:239`), r16 | `ℚ₂`: `⟨1,1⟩` against `⟨2,2⟩` and `⟨−1,−1⟩`; rank 0; `ℝ` | Same `(2,[1],+1)`, isometric. `s = +1` against `−1`, not isometric. Rank 0: both sides true. `ℝ` is excluded by the binder. | consistent | none |
| Cup-norm (`:254`), r16 | `ℝ, a=b=−1`; `𝔽_q`; `a = 1` | `ℝ`: the cup is `≠ 0`, and `−1 ≠ x²+y²`. `𝔽_q`: `H² = 0`, and every unit is a norm. `a = 1`: `(1) = 0`. | agree | none |
| Evens value (`:265`), r16 | `ℚ₂(i), a = 1+2i`; `ℂ/ℝ` | `ℚ₂(i)`: `t = 2`, `N = 5`, so the right side is `(2)∪(5) ≠ 0`. `ℂ/ℝ`: `0 = (t)∪(N a)`, since `N a > 0`. | consistent | none |
| Relative `w₂` (`:282`), r16 | `ℚ₂(i), a = 1+2i` | left `(2)∪(5)`; right `0 + (2)∪(5) + (−1)∪(5)`, where `(−1,5)₂ = +1` | equal | none |
| `hilbertSymbol_comm` (`:125`), r16 | `ℚ, (−1,3)` | both `−1` | equal | none |
| `hilbertSymbol_mul` (`:144`), r16 | `ℚ₂, (−1,21)` | `(−1,21) = (−1,5) = +1` and `(−1,3)(−1,7) = (−1)(−1)` | consistent | none |
| `exists_hilbertSymbol_eq_neg_one` (`:150`), r16 | `ℚ₂, a = −1`; `a = 1` | `b = 3` gives `−1`; `a = 1` is excluded by `¬ IsSquare` | consistent | none |
| `exists_of_realization` (`:158`), r16 | `(2,[1],−1)` over `ℚ₂` and `ℚ₃`; `(2,[−1],−1)` | realized by `⟨−1,−1⟩` and by `⟨3,3⟩`; `(2,[−1],−1)` is barred by `h₂` | consistent | none |
| `hasseInvariant_eq_localHasse` (`:168`), r16 | `ℚ₂`, `![−1,−1]` | `ε[(−1,−1)] = −1 = localHasse` | agree | none |
| `hilbertSymbol_productFormula` (`:195`), r16 | `ℚ`, `(−1,−1)`, `(2,5)` | product `1` in both cases | true | none |
| `hilbertSymbol_eq_cohomological` (`:206`), r16 | `ℚ₂, (−1,−1)`; `ℚ` | `ℚ₂`: `tr` sends the cup to `1`, whose sign is `−1`. `ℚ`: there is no `tr : H² ≃+ ZMod 2`, so the statement is vacuous. | true | none |
| `discr` Checks (804–815), r16 | rank 0; `⟨1,−1⟩`; `⟨1⟩` and `⟨4⟩` | `[1]`; `[−1]` (signed `[1]`); `[1]` on both | match | none |
| `localHasse` Checks (1511–1523), r16 | `ℚ₂ ![−1,2]`; `![−1,−1]` | `(−1,2)₂ = +1`; `−1, −1, +1` at 2, ∞, 3 | match | none |
| Central simplicity (1071–1079), r16 | `ℍ[K,a,0,b]` | `c·discr = 4ab ≠ 0` | match | none |
| Hasse scaling (1120–1121), r16 | `n = 2`; `n = 0` | `(λa,λb) = (λ,−1)(λ,ab)(a,b)`; at `n = 0` both sides are `1` | match | none |
| Dimension ≤ 3 (1131), r16 | `ℝ`, ranks 3 and 4 | Rank 3: four distinct `(d,s)`. Rank 4: `⟨1⁴⟩` and `⟨(−1)⁴⟩` share `([1],1)`. | the bound is needed | none |
| Clifford, Lam V.3.20 (1156), r16 | `⟨±1⟩ⁿ` over `ℝ`, `n ≤ 8` | parities `0,0,1,1,1,1,0,0` and `0,1,1,1,1,0,0,0` | formula true, example weak | R05 |
| `I²` additivity (1168), r16 | `ℝ`: `⟨1⟩⊥⟨1,1⟩`; `⟨1⁴⟩⊥⟨1³⟩` | `[ℍ] ≠ 1·1`; `1 = [ℍ][ℍ]` | narrower than the pin | R06 |
| Odd-residue formula (1538), r16 | `ℚ₃ (3,3)`; `ℚ₅ (5,5)` | `−1 = (−1/3)`; `+1 = (−1/5)` | match | none |
| 6A square-class counts (1275), r16 | `ℚ₂`, `ℚ₃`, `ℚ₂(√2)` | `8`, `4`, `16` | match | none |
| 6B case 3 (1416–1418), r16 | `ℚ₂, a = −1, d = 1` | `1 = 1²` and `5 = 1²+2²`; `3` is not a sum of two squares | match | none |
| 6D isotropy (1610–1613), r16 | `⟨1,1,1⟩` over `ℚ₂` and `ℚ₃` | anisotropic over `ℚ₂`; isotropic over `ℚ₃` (`−2 ≡ 1`) | match | none |
| `SD₁₆` false value (2569–2572), r16 | `ℚ₂, d = −1, t = 2` | `1 + 1 = 0`, while the true value is `≠ 0` | match | none |
| `Pin⁺` model (2385–2448), r16 | the matrices | `e₁² = e₂² = t² = 1`; `(e₁t)⁴ = −1` | match | none |

**Gaps.** None declared.

## Not verifiable

- The sources the review of `95ba181` could not read are unchanged, and no new locator was added:
  - Lam (2005), Gille–Szamuely (2017), Grove (2002) and O'Meara (1955) are not in `sources.toml`, and their publisher texts are paywalled;
  - Serre's *A Course in Arithmetic* and *Local Fields*, O'Meara (1963), Scharlau and Milnor are settled as uncertified.
- The statements that rest on them were checked against the pinned Tau Ceti declarations and by computation (the table).

## Source issues

- none
