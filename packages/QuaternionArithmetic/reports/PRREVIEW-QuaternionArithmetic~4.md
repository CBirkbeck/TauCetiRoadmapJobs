# Review of QuaternionArithmetic (pull request #1722 at 797c405)

**Verdict:** needs changes

Incremental re-review of the 130 lines changed since 75c9080 (the new §1.14 Hurwitz order, the Hurwitz facts in §§3.8 and 5.6, the replacement of the quaternionic-modular-forms class-set citations by AdelicAlgebraicGroups AA.5.3, the R17.1.5 names). The changed mathematics is correct and every new citation resolves at the cited head. The verdict is needs changes for three reasons: the gate fails (`dropped=3`: the roadmap still cites QuaternionicModularForms, which is on the project's never-cite list), a pull request opened after the previous review (ArithmeticFuchsianGroups, #2026, immediately before this roadmap in the merge order) now claims ownership of several objects this roadmap also owns, and none of the five P3 notes of the previous report was taken up.

## R01 (P2) — Two owners: ArithmeticFuchsianGroups §§1.1, 1.2, 1.4 state objects Layers 0, 1, 3, 4 and 8 own here

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:86–87`, “the general arithmetic Fuchsian lattice theorem is TeichmullerGeometry §9.1. The local order-to-tree adapter and rational exact covolume belong to §§1.12 and 8.2 here”; §0.3 (line 414), §1.7 (626), §1.12 (735), §3.5 (1072), §4.6 (1255), §8.1 (1703, “TeichmullerGeometry §9.1 with k = ℚ”), §8.2 (1727, “prove the rational maximal-order covolume area(Γ¹(O(1))\ℍ) = (π/3)φ(D)”).

**Claim:** ArithmeticFuchsianGroups (open pull request #2026, opened 2026-11-09, merge order line 284; this roadmap is line 286, TeichmullerGeometry 285) lists under *Owned here* (its README lines 31–41): the local structure of maximal orders and the existence of a maximal order containing a given order, the norm-one group `O¹`, its projective image `Γ(O)` and its lattice and cocompactness theorems (§1.1, `isCofinite_normOneImage`, `cocompact_normOneImage_iff_anisotropic`); the finite ramification set `finiteRamification a b` with its finiteness and parity, the covolume formula for maximal orders over every totally real field with the local volumes and the Haar-to-area normalization, the positive normalizer `N_B⁺(O)` with `N_B⁺(O)/Γ(O) ≃ im ν` an elementary abelian 2-group, the order-to-tree adapter at split finite places with the local normalizer indices, and the indices `[N_B⁺(O):Γ(O)]`, `[Γ(O):Γ(O′)]` (§1.2, `covolume_normOneImage`); the finiteness of maximal-order type classes (§1.4). Its Downstream consumers paragraph (line 1403) says this roadmap “takes from here … for its §§1.2, 1.7, 1.12, 3.5, 3.6 and 8.2”. This README cites ArithmeticFuchsianGroups nowhere and states each of these objects as its own target: §0.3 (finite ramification set and parity), §1.7 (unique maximal order at a division place, conjugacy to `M₂(R)` at a split place), §1.12 (the tree adapter, claimed “here” in Scope), §3.5 (type finiteness), §4.6 (positive normalizer), §8.1 (`Γ¹(O)`; its lattice theorem is cited from TeichmullerGeometry §9.1, which at its open head, line 861, now reads “Arithmetic lattices of `PSL₂(ℝ)` are ArithmeticFuchsianGroups §1.1’s”), §8.2 (the maximal-order area `(π/3)φ(D)` by the Tamagawa route, which is ArithmeticFuchsianGroups §1.2’s formula at `k = ℚ`, `∏(p−1) = φ(D)`). The previous review could not see this: the pull request did not exist on 2026-11-03.

**Witness:** ArithmeticFuchsianGroups README lines 31–41, 436–441, 480–495, 508–625, 1403–1408 at #2026; TeichmullerGeometry README line 861 at #1169; this README lines 86–87, 414, 626, 735, 1703–1706, 1727–1733.

**Repair:** ArithmeticFuchsianGroups is the earlier roadmap and declares itself the supplier, so consume it. Add a `From TauCetiRoadmap.ArithmeticFuchsianGroups` contract and cite: §1.1 in §8.1 for discreteness, finite covolume and cocompactness of `Γ¹(O)` (in place of TeichmullerGeometry §9.1, which now consumes it) and in §1.7 for the maximal-order local structure, keeping here `e(B/F)`, `discrd(O) = 𝔭` and the trace-discriminant criterion; §1.2 in §0.3 (prove the comparison `IsRamifiedAt B v ↔ v ∈ finiteRamification a b` and consume finiteness and parity, keeping the Hilbert-symbol description and the invariant reading), in §1.12 (keep only distance `e` ↔ level `𝔭^e`), in §4.6 (keep the Eichler case over `ℚ` and the identification of the quotient with `AL(O)`), and in §8.2 (keep the Eichler index `ψ(N)`, the scaling `area(X₀(D;N)) = (π/3)φ(D)ψ(N)` and the reading `∏_{p∣D}(p−1) = φ(D)`; drop the Tamagawa route for the maximal order); §1.4 in §3.5 (maximal-order types consumed, the statement for every order kept and said to extend it). Rewrite Scope lines 86–87 accordingly, add ArithmeticFuchsianGroups to the consumed-roadmaps list (line 160–171) and to the `*Needs:*` lines and layer Dependencies of §§0.3, 1.7, 1.12, 3.5, 4.6, 8.1, 8.2. If the author holds that this roadmap is the owner, the Scope must say why and the other pull request must cite here, which the merge order (284 before 286) does not allow without moving it: that is a decision for the two authors, not a silent double statement.

## R02 (P3) — The gate fails: QuaternionicModularForms is on the project's never-cite list

**Location:** `README.md:168`, “[quaternionic modular forms](../QuaternionicModularForms/README.md) (§3.1)”; `:1647` and `:1696`, “QuaternionicModularForms §3.1”; the prose citations at `:90–91` (“quaternionic modular forms Layers 1–5”), `:234–236` (“**From quaternionic modular forms:** §3.1 the Hecke operators `T_η`”), `:1631` (“quaternionic modular forms §3.1 uses the inverse convention”).

**Claim:** The worker's gate and my rerun both report `dropped=3 … FAIL` on lines 168, 1647 and 1696 (rule: no name of the project's dropped-names list, which contains QuaternionicModularForms; the brief lists it under “Never cite these roadmaps as suppliers”). The gate blocks acceptance whatever else is found. The object cited, the Hecke operators `T_ηφ = Σ_t φ|x_t` on quaternionic forms with the opposite-ring law, is owned by GL2AutomorphicRepresentationsAndTransfer §R17.3.8d “Hecke operators on quaternionic forms” (its README line 2085 at #931), from the same AutomorphicFormsOnReductiveGroups §7.4 convention as QuaternionicModularForms §3.1, so the statement “this is its `T(η⁻¹)`” stays true after repointing. HilbertModularVarietiesAndShimuraCurves R18.5.17a already cites §R17.3.8d for these operators (its line 2485).

**Witness:** `scratch/gate.md` and my rerun: `dropped=3 … FAIL`; `dropped-names.txt` line 6; GL2AutomorphicRepresentationsAndTransfer README lines 2085–2100 at #931.

**Repair:** Replace “QuaternionicModularForms §3.1” by “GL2AutomorphicRepresentationsAndTransfer §R17.3.8d” at lines 168, 234–236, 1631, 1647 and 1696 (the GL₂ transfer roadmap is already a supplier; merge the contract bullet into its bullet). At lines 90–91 defer weights, coefficient modules and Hecke operators to GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d and HilbertModularVarietiesAndShimuraCurves R18.3, and either name an owner in the merge order for slopes and families or delete that clause. The pull-request description's depends-on list still names #934 QuaternionicModularForms; drop it there too.

## R03 (P3) — The λ values in the §2.4 Checks swap the symbols −1 and 0

Carried from the previous report (its R01), not repaired. **Location:** `README.md:927`, “λ in the 1, −1, 0 cases is 3/2, 3/4, 1/2”, and `:928`, “4/3, 8/9, 2/3”. **Claim and witness:** Conventions and Voight 25.3.19 (`voight line 17773`) give λ = 1 + 1/q, 1 − 1/q, 1 − 1/q² for symbols 1, −1, 0; the Lipschitz order at 2 (symbol 0) has [H₂ˣ:L₂ˣ] = 4λ = 3, so λ = 3/4. **Repair:** write “3/2, 1/2, 3/4” and “4/3, 2/3, 8/9”.

## R04 (P3) — Supplier section and declaration names that do not resolve as written

Carried from the previous report (its R02), not repaired. **Location:** `README.md:89`, “RG2.2.2, “sl2-tree””; `:239–240`, “R18.3.1 (`DefiniteClassSet`, …); R18.5.17a (`DefiniteClassSetGraph` …)”; `:1067`, “R18.3.1's `DefiniteClassSet`”. **Claim and witness:** *sl2-tree* is ReductiveGroupsPartII RG2.2.4 on main (the contracts and §1.12 already say so). At #1005, R18.3.1 (line 2794) names its object `C_U = D×\D_f×/(U A_F,f×)` and R18.5.17a (line 2464) a weighted dart graph with NeronModelsAndSemistableAbelianVarieties' `HeckeFamily`; `grep -i DefiniteClassSet` over its README and Suggested.lean is empty. **Repair:** RG2.2.4 at line 89; cite R18.3.1 as “the central quotient `C_U` of the class set” and R18.5.17a as “the definite class-set graph and its Brandt matrices” without backticked names.

## R05 (P3) — Two Voight locators and two Tau Ceti line numbers

Carried from the previous report (its R03), not repaired. **Location:** `README.md:1454`, “(`[V, 30.7.4]`)”; `:1416`, “Prove `m(S,O;Γ) < ∞` (`[V, 30.5.5]`)”; `:189`, “lines 104, 93, 114”; `:212`, “(line 78)”. **Claim and witness:** the squarefree-level formula is Example 30.7.5 (`voight line 23763`); 30.7.4 is `m(S,O;N(O)) = h(S)` for class number one; Corollary 30.5.5 (`voight line 23410`) is local (R a DVR), the global finiteness is 30.4.7 with (30.7.2) and 30.3.14; at the pin `map_star_of_algEquiv` is at `Algebra/Quaternion/AlgEquiv.lean:106` and `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` at `Invariant.lean:79`. **Repair:** [V, 30.7.5]; [V, 30.4.7, (30.7.2), 30.3.14] for global finiteness, 30.5.5 for the local statement; 106 and 79.

## R06 (P3) — README shape and ordering hygiene

Carried from the previous report (its R04), not repaired. **Location:** no `## Downstream consumers` section; `:1399`, GrossZagierAndArithmeticHeights §0a.3 cited as a comparison inside §6.1 although that roadmap is later in the merge order; `:162`, dead link `../GlobalNumberFields/README.md` (the roadmap is `Completed/GlobalNumberFields` on main); `:2283`, “Every number below is checked by computation (Sage: …)”, and Sage at `:1558`, `:1573`, `:1660`; Checks naming Lean counterparts at `:533` (“`leftOrderSubalgebra I` of `Suggested.lean`”) and `:713` (“The total Lean definition gives ψ(0) = 1”); §5.3 (line 1335) defines φ(𝔇), ψ(𝔐) with no Checks; Layer 1 numbering jumps from 1.5 (597) to 1.7 (626). **Repair:** as in the previous report: add `## Downstream consumers` (GrossZagierAndArithmeticHeights §0a.3 as the instance `B = M₂(ℚ)`, `O = R₀(N)`, `Γ = Γ₀(N)`; FiniteGroupInvariants 7.1; AbelianVarietiesOverFiniteFields 8.4; CanonicalModelsAndGonality) and drop the comparison sentence from §6.1; link `../../Completed/GlobalNumberFields/README.md`; delete the Sage sentences; rephrase the two Checks in prose; give §5.3 three Checks (F = ℚ reduces to 5.2; a prime of norm 4 gives ψ(𝔭²) = 20; a split 𝔭𝔭̄ of norm 9 gives φ = 4 against 8); renumber 1.7–1.14 as 1.6–1.13 or restore a 1.6.

## R07 (P3) — No `sources.toml`

Carried from the previous report (its R05), not repaired. **Location:** `TauCetiRoadmap/QuaternionArithmetic/` holds README.md, Suggested.lean and metadata.toml only; the board package holds `reports/` only. **Claim:** the eleven LMFDB knowls and the paywalled or landing-page references (Vignéras, Eichler 1955, Pizer 1980, Shimizu, Alsina–Bayer, Ogg) have no recorded `uncertified`/`waived` status, so every review re-attempts them. **Repair:** add `sources.toml` (schema `tauceti-roadmap-sources/v1`) with one key per work: `voight` (author edition v0.9.28, theorem locators), `rotger`, `dembele_voight` (arXiv 1010.5727v2), `pizer1976`, the paywalled works as `uncertified` with their DOIs, the knowls as `uncertified` with their identifiers.

## Previous findings

- R01 — not repaired: line 927 still reads “λ in the 1, −1, 0 cases is 3/2, 3/4, 1/2” and line 928 “4/3, 8/9, 2/3” (now R03).
- R02 — not repaired: line 89 “RG2.2.2, “sl2-tree””; lines 239–240 and 1067 still name `DefiniteClassSet` and `DefiniteClassSetGraph` (now R04).
- R03 — not repaired: line 1454 “[V, 30.7.4]”, line 1416 “[V, 30.5.5]”, line 189 “lines 104, 93, 114”, line 212 “(line 78)” (now R05).
- R04 — not repaired: no `## Downstream consumers`; §0a.3 at line 1399; dead GlobalNumberFields link at 162; Sage at 1558, 1573, 1660, 2283; Lean names in Checks at 533 and 713; §5.3 without Checks; 1.5 → 1.7 (now R06).
- R05 — not repaired: no `sources.toml` in the folder or the board package (now R07).

## Verified sound

**The changed passages.** The diff (90 insertions, 40 deletions, README only; `Suggested.lean` is byte-identical to 75c9080) does three things, each checked:

1. *§1.14 The Hurwitz order* (new), with the Scope, 1.8, 3.8, 5.6, Worked-examples and build-order sentences that cite it. Every statement is Voight's Chapter 11 as cited, read in the author edition (`voight` = sources cache `ad6bd0f7…`, printed page = PDF page − 18 here): Lemma 11.1.2 (`voight line 7252`, p. 160) is the unique order properly containing `ℤ⟨i,j⟩`, maximal, index 2, with the route by `trd(α)`, `trd(αi)`, `trd(αj)`, `trd(αk) ∈ ℤ` and the mod-4 argument exactly as the README has it; Lemma 11.2.1 (`line 7281`, p. 161) is `O^× ≃ SL₂(𝔽₃)` by reduction mod 3 with the two displayed matrices (`lines 7296–7302`), injectivity “by inspection” (the README supplies the `2 − trd γ` argument); (11.2.3) (`line 7317`) is the sequence `1 → {±1} → O^× → A₄ → 1`; 11.3.1 (`line 7385`, p. 163) gives `nrd(γ − μ) ≤ 1` with the `≤ 1/2` refinement referred to Exercise 11.8 (the README proves the 1/2 bound itself; its argument is correct, see the table); Lemma 11.3.2 (`line 7396`), Proposition 11.3.4 (`line 7406`), Proposition 11.3.7 (`line 7427`, `O′ = α⁻¹Oα`) and Example 11.3.8 (`line 7434`, p. 164) match the three bullets and the reject Check, including 11.3.8's route “nrd α = 4, hence `2O = αℤ⟨i,j⟩ = 2ℤ⟨i,j⟩`”. The Check “γ = (1+i)/2 has distance 1/2” uses “distance” for the reduced norm, as 11.3.1 does (`line 7389`); the Euclidean distance is 1/√2. A remark, no change asked.
2. *AdelicAlgebraicGroups AA.5.3 in place of QuaternionicModularForms §0.3* (contracts lines 248–258, §3.4 lines 1065–1069, §3.5 lines 1076–1081, Layer 3 Dependencies line 1195, build order lines 2390–2391). At #792, §5.3 “Definite quaternion groups” (README line 5600) has *quaternion-class-sets* (line 5602: `Cl(U)` finite for every compact open `U`, over any number field, representatives, surjective refinement maps, no division or definiteness hypothesis), *definite-quaternion-stabilizers* (line 5627: `F` totally real, `D` totally definite, `U` compact, `Γ_x/Z_x` finite with `Z_x = F^× ∩ U`, `Γ_x` finite for `F = ℚ`) and the volume comparison under level change over `ℚ` (line 5660). The README's descriptions match these statements and hypotheses; `U = Ô^×` is compact open, so both apply in §§3.4–3.5, and §3.5 restricts the finiteness of `O^×` to `ℚ` as AA does (AA's own Check `ℍ ⊗ ℚ(√2)` has infinite `Γ_x`). AA states the Hurwitz facts (one class, 24 units, mass 1/12) only in Checks citing Voight (lines 5618, 5650, 5676), not as targets, so “proved here, not consumed” is a correct ownership statement.
3. *R17.1.5 names* (contracts lines 226–231). At #931 the predicate is prose (README line 1508–1520: “Citations of the names RamifiedExactlyAt and ramifiedExactlyAt_iff_nonsplit refer to this predicate”), and `existsQuaternionRamification_iff` (Suggested.lean line 158) and `nonempty_quaternionAlgEquiv_of_localSplitting` (line 174) are declared with the stated content (even sets of finite and real places; isomorphism from agreeing local splitting). The README's rewording and the two names are exact.

**Gate, pins, build.** The worker's gate at 797c405: `dropped=3 … FAIL`, every other counter 0 including `build=0`, `outside-folder=0`, `stray-files=0`. My rerun agrees on `dropped=3` (same three lines) and adds `depcheck: NOT IN ORDER` because the full gate reads the project's merge order, where this roadmap is not yet listed: not a defect. The brief's dependency check with the candidate order, run with `--movable`:

```text
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `lake env lean TauCetiRoadmap/QuaternionArithmetic/Suggested.lean` exits 0 in 6.7 s with exactly 18 `declaration uses sorry` warnings and nothing else. Pins of the head's `lake-manifest.json`: Mathlib `f6090c709`, Tau Ceti `358314d4a`, as in the previous round (main's are `1b1ccf4b0`/`2fd255d99`; nothing in the diff touches a library name). `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean. The 66 elaborated signatures in `scratch/signatures.md` are those of the unchanged file; the previous report's binder comparison stands (the 25 “dropped binder” leads are definitions whose types do not mention the classes).

**Ownership.** `roadmaps grep -i 'hurwitz order'` over the 468 open heads and main: this roadmap 27 hits, AdelicAlgebraicGroups 6 and ArithmeticFuchsianGroups 4 (all Checks), one Check each in six others; no open roadmap states the Hurwitz order's units, class number or Euclidean property as a target, so §1.14 has one owner. The closest roadmaps of `scratch/overlaps.md` were compared: HilbertModularForms #1724, AbelianVarietiesOverFiniteFields #1720, BianchiModularForms #1719 and HilbertModularVarietiesAndShimuraCurves #1005 are consumers or neighbours as in the previous report; ArithmeticFuchsianGroups #2026 is R01. Pull requests without files were not searched.

**Cross-roadmap citations resolved this round.** AdelicAlgebraicGroups §5.3 at #792 (lines 5600–5704) and §3.4 `Reduction.finite_classes` (the scanner lead at README 249 is this supplier target name); GL2AutomorphicRepresentationsAndTransfer R17.1.5 (README 1508) and R17.3.8d (2085) at #931; HilbertModularVarietiesAndShimuraCurves R18.3.1 (2794) and R18.5.17a (2464) at #1005; TeichmullerGeometry §9.1 (861) at #1169; ArithmeticFuchsianGroups §§1.1, 1.2, 1.4 at #2026. The scanner lead `IsEichler.isBass` (README 936) is declared in `Suggested.lean`; the seven `shimcurve.*` leads are knowl identifiers.

**Seeded sample.** Of the fifteen seeded targets, 3.8 lies in the changed passages and was checked above with 1.14 (Voight 11.3.4, 11.3.7). The others (0.2, 1.1, 1.10, 1.12, 2.2, 2.5, 4.5, 6.7, 7.2, 7.3, 8.1, 8.4, 8.5, 8.6) are untouched; the previous report's locator checks of 1.10, 2.2, 7.2, 7.3, 8.4 (genus table) and 8.6 stand and were not redone.

**Adversarial table.** New rows carry computed values; rows for untouched statements are carried from the previous report (r3) with their values.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| 1.14 order, index, maximality | (½,½,0,0); (½,½,½,½); (1,0,0,0) | nrd = ½ ∉ ℤ, excluded; nrd = 1, in `O_H`; `2t, 2x, 2y, 2z ∈ ℤ` from trd(α) = 2t, trd(αi) = −2x, trd(αj) = −2y, trd(αk) = −2z; `(a²+b²+c²+d²) ≡ 0 mod 4` iff all even or all odd; [O_H:L] = 2, discrd 4/2 = 2 = D | Retain. |
| 1.14 units | all-integral and all-half solutions of `t²+x²+y²+z² = 1` | 8 + 16 = 24; traces −2 (−1), −1 (eight half-units with t = −½), 0 (±i, ±j, ±k), 1, 2; only ±1 square to 1 in a division algebra, so −1 is the only element of order 2 | Retain. |
| 1.14 reduction mod 3 | the two matrices | `[[0,−1],[1,0]]² = −I`; `[[1,1],[1,−1]]² = 2I = −I mod 3`; `ij + ji = [[−1,1],[1,1]] + [[1,−1],[−1,−1]] = 0`; det = nrd = 1 so image in SL₂(𝔽₃); `γ − 1 ∈ 3O_H ⇒ 9 ∣ nrd(γ−1) = 2 − trd γ ∈ {0,…,4} ⇒ trd γ = 2 ⇒ (γ−1)² = 0 ⇒ γ = 1`; 24 = #SL₂(𝔽₃) | Retain. |
| 1.14 Euclidean bound | γ = (1+i)/2; general γ with coordinates in [−½, ½] | nrd to 0, 1, i, 1+i, (1+i±j±k)/2 all = ¼ + ¼ = ½, bound attained; `Σ(x² + (½−|x|)²) ≤ 4·¼ = 1` so the smaller of the two is ≤ ½; division: `nrd ρ = nrd β · nrd(β⁻¹α − μ) ≤ nrd β/2 < nrd β` | Retain. |
| 1.14 reject Check (Lipschitz) | `I = 2O_H` as right `L`-ideal | `[L:2O_H] = 16/2 = 8`, `[L:βL] = nrd(β)²`: 8 is not a square, so not principal; Voight's route: `2 = αβ`, nrd α = 4, nrd β = 1, β ∈ Lˣ, `αL = 2L ≠ 2O_H` | Retain (the Check follows 11.3.8). |
| 3.8 Hurwitz class and type number | invertible right ideal `I`; `n` clearing denominators | `nI ⊆ O_H`, `nI = βO_H`, `I = (β/n)O_H`, `[I] = [O_H]`; `Typ` is the image of `Cls`, so one type; cross-check 6.7: `1/12 + 1/4 + 2/3 = 1` | Retain. |
| 3.4–3.5 comparison with AA.5.3 | `U = Ô^×`; `U = {1}`; `F = ℚ(√2)` | `Ô^×` compact open, so `Cl(U)` finite and `Cls O ≃ Cl(Ô^×)`; `U = {1}` compact not open, excluded (AA's Check: infinite); stabilizer at `x = 1` is `B^× ∩ Ô^× = O^×`, finite over `ℚ`, infinite for `ℍ ⊗ ℚ(√2)` (unit `1+√2`), and §3.5 states finiteness over `ℚ` only | Retain. |
| 5.6 D = 2 by two routes | Hurwitz | mass = Σ 1/w = 2/24 = 1/12 = φ(2)/12 | Retain. |
| Contracts R17.1.5 | the two names | declared at #931 Suggested.lean 158, 174; predicate prose at README 1519 | Retain. |
| 0.1 Gram matrix | (3,−1), (−1,−1), (1,1) | r3: det −144, −16, −16; nrd(i)nrd(j) = −3 = nrd(ij) | Carried (r3). |
| 0.4–0.5 D and definiteness | (−1,−1), (3,−1), (1,7), (−1,−13) | r3: D = 2, 6, 1, 2; (−1|13) = 1 | Carried (r3). |
| 1.2 units | Hurwitz; O₆; scalar 2 | r3: 24 units of norm 1; nrd(1+i+j) = −1; 1/2 ∉ O | Carried (r3). |
| 1.3–1.5 discriminants | L, 2L, M₂(ℤ), L ⊂ H | r3: trace dets −16, −4096, −1; reduced (4), (64), (1) | Carried (r3). |
| 1.4 trace dual | L, 2L, M₂(ℤ) | r3: L^♯ = ½L; (2L)^♯ = ¼L; M₂(ℤ) self-dual | Carried (r3). |
| 1.8 maximality (headline) | H, L, O₆, ℤ+2O₆ | r3: discrd 2, 4, 6, 48 vs D = 2, 2, 6, 6 | Carried (r3). |
| 1.9–1.10 Eichler, level | O₀(2ᵉ), e = 0,1,2 | r3: discrd (1),(2),(4); ψ = 1, 3, 6 | Carried (r3). |
| 1.11 bases and index | H/L; ℤ+2O₆ | r3: indices 2, 8; 4 = 2·2, 48 = 8·6 | Carried (r3). |
| 1.12 tree adapter | ℤ₂², ℤ₂⊕2ℤ₂, ℤ₂⊕4ℤ₂ | r3: distances 0,1,2; levels 1,2,4; 3 neighbours | Carried (r3); ownership R01. |
| 2.2 Gorenstein | M₂(ℤ), L, ℤ+2O₆ | r3: nrd(codiff)·discrd = (1), (1), (2) | Carried (r3). |
| 2.3 saturation (headline) | O₆, ℤ+2O₆, L | r3: (Gor, 𝔣) = (O₆,(1)), (O₆,(2)), (L,(1)) | Carried (r3). |
| 2.4 symbol, counts, λ | q = 2, 3 | r3: counts 6,4,12,8 and 48,36,72,54; λ = 3/2, 1/2, 3/4 | Carried (r3); R03. |
| 2.5 Bass | L, O₀(4), ℤ+2O₆ | r3: L ⊂ H only; conductor 2 fails | Carried (r3). |
| 2.7 worked orders | O₆ at 2, 3, 5 | r3: 𝔽₄, 𝔽₉, M₂(𝔽₅); 12, 72, 480 | Carried (r3). |
| 3.1–3.2 class set | 2O₀(2); D = 11, 37 | r3: index 16; (h,t) = (2,2), (3,2) | Carried (r3). |
| 3.5 finiteness (headline) | Hurwitz | r3: representative of norm 1 ≤ (8/π²)·2 | Carried (r3). |
| 3.6 Pic | M₂(ℤ[√−5]); O₀(4) | r3: Pic of order 2; w² = 4I | Carried (r3). |
| 3.7 Atkin–Lehner | O₆; O₀(4); Lipschitz | r3: 4 elements; Hall divisors; Lh of order 3 | Carried (r3). |
| 3.9 fibres | H ⊃ level 7 | r3: 8 cosets, orbits 4+4, fibre 2 | Carried (r3). |
| 3.10 norm counts | Hurwitz norms 3,5,15,9,2,4 | r3: 4, 6, 24, 13, 1, 1 | Carried (r3). |
| 4.3–4.6 (headlines) | O₆; M₂(ℤ) | r3: h = t = 1; norm −1 unit; AL order 4, 1; positive quotient 4, 1 | Carried (r3); ownership R01. |
| 5.1–5.2 mass (headline) | D = 2, 3, 11, 37; (2,3), (2,7) | r3: 1/12, 1/6, 5/6, 3; 1/3; 2/3 | Carried (r3). |
| 5.4 level change | L₂ ⊂ H₂; O₀(p) | r3: 2·(3/4)·2 = 3; p+1 | Carried (r3). |
| 5.5 class number one (headline) | D = 2,3,5,7,13 vs 11,37,17,23 | r3: 1,1,1,1,1; 2,3,2,3 | Carried (r3). |
| 6.1–6.3 embeddings | O₆, ℤ[i], ℤ[2i]; p = 3 | r3: counts 2, 4, 0; 0, 2; 1, 0 | Carried (r3). |
| 6.5–6.6 (headlines) | (6,1), (2,3), (15,4); D = 2, 11, 37, 17, 23 | r3: (2,2), (0,2), 0; 1, 2, 3, 2, 3 | Carried (r3). |
| 6.8 Deuring (headline) | p = 5…37 | r3: 1, 1, 2, 1, 2, 3, 2 | Carried (r3). |
| 7.1–7.4 Brandt, trace formula | D = 11; Hurwitz n = 3, 9 | r3: T(2)T(3) = T(6), column sums 12; traces 4, 13 | Carried (r3). |
| 7.7 theta | Hurwitz; D = 11 | r3: 24/24 = 1, 96/24 = 4 | Carried (r3). |
| 8.1–8.2 area | D = 6, 6·5, 6·101 | r3: 2π/3, 4π, area/4π = 17 | Carried (r3); ownership R01. |
| 8.3–8.6 genus, fixed points | twelve D, seven (D,N); m ∣ t | r3: (ν₂,ν₃,g) table; m = 2,3,6 give 2,2,2 | Carried (r3). |
| 9.1–9.8 polarizations, Aut_{±μ}, torsion | μ = i+3j, i+4j, 2+i; (6,101) | r3: μ² = −6, −13; nrd(2+i) = 1; g = 17, quotient genus 1 | Carried (r3). |
| Worked class counts | D = 6…39 | r3: h(−24) = 2 … h(−156) = 4 | Carried (r3). |

## Not verifiable

- The eleven LMFDB knowls of §10.2 and the References: the sources service refuses the host (no licence class), as in the previous rounds; the stored polarizations and column schema remain uncertified. Nothing in the changed passages depends on them.
- Vignéras (DOI 10.1007/BFb0091027) and Pizer 1980 (DOI 10.1016/0021-8693(80)90151-9): paywalled; Eichler 1955, Shimizu 1965, Alsina–Bayer: landing pages only; Ogg 1983: no open copy. No sampled or changed locator needs them; the Hurwitz passages were checked in Voight.

## Source issues

- none

The two items of the previous report (Voight Theorem 41.1.13, 41.2.5) stand and are not repeated here.
