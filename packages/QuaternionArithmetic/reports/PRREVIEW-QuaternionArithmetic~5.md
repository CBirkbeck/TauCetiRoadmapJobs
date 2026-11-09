# Review of QuaternionArithmetic (pull request #1722 at 5b4cda9)

**Verdict:** needs changes

This is a full review: 464 lines changed since 797c405. All seven findings of the previous review are repaired (see *Previous findings*). Two new blocking findings remain:

- HilbertModularVarietiesAndShimuraCurves, a supplier that comes earlier in the merge order, declares itself the owner of the Eichler-order, class-set, refinement-fibre and Brandt-matrix statements that Layers 1, 3 and 7 also state here.
- The Shimura-curve area and elliptic-point theorems can be stated at the pins, but `Suggested.lean` omits them, and its docstring gives a reason that does not hold.

Six P3 notes follow.

## R01 (P2) — Two owners: HilbertModularVarietiesAndShimuraCurves §§R18.5.16a–R18.5.16c state Eichler orders, levels, ideal classes, refinement fibres and Brandt matrices owned here

**Location:**
- `TauCetiRoadmap/QuaternionArithmetic/README.md:43–44`: "the local structure of maximal orders, Eichler orders and their level".
- §1.8 (lines 712–717), §1.9 (737–743), §3.4 (1114–1124), §3.9 (1208–1216), §§7.1–7.3 (1622–1663).
- The HMV contract at lines 252–258 cites only R18.1, R18.3.1 and R18.5.17a.

**Claim:** HilbertModularVarietiesAndShimuraCurves (#1005, merge-order line 160; this roadmap is line 285) claims these objects in its Scope (README line 9 at its head):
- Eichler orders, "with their local form over every discrete valuation ring and, over every number field, their completed levels and right ideal classes";
- the neighbour ideals and their Brandt matrices at places prime to the level (§§R18.5.16a, R18.5.16c);
- the refinement fibres of double-coset maps (§R18.5.16b).

It also says "QuaternionArithmetic consumes this roadmap … and is not one of its suppliers". This README states the same objects as its own targets:

| Here | HilbertModularVarietiesAndShimuraCurves |
| --- | --- |
| 1.8: over a DVR, Eichler ⇔ conjugate to `O₀(𝔭^e)` for a unique `e` ⇔ contains a conjugate of `R × R`; the two maximal orders | R18.5.16a item 1 |
| 1.9: local–global form; level coprime to `disc B`; `discrd O = disc B·𝔐`; `[GL₂(R_𝔭):O₀(𝔭^e)^×] = N𝔭^{e−1}(N𝔭+1)` | R18.5.16a items 2–4 |
| 3.4 at Eichler `O`: `Cls O` ↔ locally principal right ideals, through CAC 7.72 and 7.78 | R18.5.16a item 6 |
| 3.9: the fibre `Γ_g\U/U′` of `Cls O′ → Cls O` | R18.5.16b |
| 7.1–7.3 at `𝔫 = 𝔭 ∤ 𝔑`, `O` Eichler: definition, independence of representatives, column sums `q+1`, commutativity, weighted self-adjointness | R18.5.16c items 1–4 |

This is one object with two owners. Earlier rounds did not see it: the overlaps tool lists HMV only as "closest in vocabulary".

**Witness:** HMV README (#1005) line 9 (Scope), line 2359 (§R18.5.16a), line 2395 (§R18.5.16b), line 2425 (§R18.5.16c), and line 4434: "QuaternionArithmetic uses … §R18.5.17a, which is built on the Eichler orders, right ideal classes and Brandt matrices of §§R18.5.16a and R18.5.16c". `grep R18.5.16` over this README finds nothing.

**Repair:** HMV comes first and declares itself the owner, so consume it.

- **HMV contract (lines 252–258).** Add R18.5.16a (local form over a DVR, local–global form and level, completed-level indices, right ideal classes, definite weights), R18.5.16b (refinement fibres) and R18.5.16c (neighbour ideals and `B(v)` at split `v ∤ 𝔑`). Move these objects from *Owned here* to *Not owned here*.
- **§1.8.** Cite item 1. Keep superorders (23.4.10), the hereditary criterion (23.3.18) and the normalizer (23.4.14).
- **§1.9.** Cite items 2–4. Keep the genus statement (23.4.19) and local norm-maximality (28.5.16).
- **§3.4.** Cite item 6 for Eichler `O`, keeping the statement for every order.
- **§3.9.** Cite R18.5.16b. Keep the reading at `U = Ô^×` and the Checks.
- **§§7.1–7.3.** Cite R18.5.16c for `𝔫 = 𝔭 ∤ 𝔑` and Eichler `O`, recording `B(v) = T(𝔭)ᵗ`: HMV counts by rows, this roadmap by columns. Keep composite `𝔫`, `𝔭 | 𝔑`, non-Eichler `O`, the multiplicativity (41.3.6), `𝕋(O)` and its semisimplicity.
- **Bookkeeping.** Update the `*Needs:*` lines and the Layer 1, 3 and 7 Dependencies.

Tested at `D = 11`: here `T(2) = [[1,3],[2,0]]`, so `B(2) = [[1,2],[3,0]]`. Its rows sum to `3`, and HMV's item 4 holds with weights `(2,3)`: `w₂B₁₂ = 3·2 = 6 = w₁B₂₁ = 2·3`.

## R02 (P2) — The area and elliptic-point theorems for `X_0(D;N)` are statable at the pins and absent from `Suggested.lean`

**Location:**
- `Suggested.lean:24–26`: "The Shimura genus and CM-point theorems require the arithmetic subgroup attached to an order and real splitting (§8.1)".
- README Summary, lines 10–12: "a Shimura curve whose area, elliptic points and genus are read off the same embedding numbers".
- §§8.2 and 8.3.

**Claim:** The Summary and *Owned here* (line 66) make the area and the elliptic points of `X_0(D;N)` headline results. The only carrier they need is `Γ¹(O)`. That is a short definition on native carriers, as ArithmeticFuchsianGroups' `normOneImage` already shows: a `Subgroup.closure`, at its `Suggested.lean` line 67, on the same pins. The elliptic counts need only `MulAction.orbitRel.Quotient` and `MulAction.stabilizer` with Tau Ceti's `instMulActionPSL2`. Only the genus formula (8.4) is not statable: no genus of a compact Riemann surface exists at the pin, only `PermutationTriple.genus` (Combinatorics/PermutationTriple/EulerCharacteristic.lean:204).

**Witness:** A scratch copy of this file with the declarations below appended, plus `import TauCeti.Analysis.Complex.UpperHalfPlane.PSL.Action`, elaborates under `lake env lean` with exit 0, 21 `sorry` warnings and no error.

**Repair:** In a section with `variable {a b : ℚˣ}`, add the following (tested as written) with docstrings, mention the new names in §§8.2–8.3, and have the docstring name only the genus formulas (and the CM-point bijection, if kept out) as not statable:

```lean
def normOneImage (ι : ℍ[ℚ,(a : ℚ),(b : ℚ)] →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℝ) (O : QuatOrder a b ℤ) :
    Subgroup PSL(2, ℝ) :=
  Subgroup.closure {γ | ∃ x ∈ normOne O, ∃ g : SL(2, ℝ),
    (g : Matrix (Fin 2) (Fin 2) ℝ) = ι (x : ℍ[ℚ,(a : ℚ),(b : ℚ)]) ∧
      QuotientGroup.mk' (Subgroup.center SL(2, ℝ)) g = γ}
theorem covolume_normOneImage_eq (O : QuatOrder a b ℤ) (hO : IsEichler O) (hD : 1 < discNat a b)
    (ι : ℍ[ℚ,(a : ℚ),(b : ℚ)] →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℝ) :
    MeasureTheory.covolume (normOneImage ι O) UpperHalfPlane =
      ENNReal.ofReal (Real.pi / 3 * ((Nat.totient (discNat a b) : ℝ) * psi (level O))) := sorry
def ellipticCount (Γ : Subgroup PSL(2, ℝ)) (q : ℕ) : ℕ :=
  Nat.card {x : MulAction.orbitRel.Quotient Γ UpperHalfPlane //
    ∃ z : UpperHalfPlane, Quotient.mk (MulAction.orbitRel Γ UpperHalfPlane) z = x ∧
      Nat.card (MulAction.stabilizer Γ z) = q}
theorem ellipticCount_two (O : QuatOrder a b ℤ) (hO : IsEichler O) (hD : 1 < discNat a b)
    (ι : ℍ[ℚ,(a : ℚ),(b : ℚ)] →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℝ) :
    (ellipticCount (normOneImage ι O) 2 : ℤ) = kroneckerProduct (-4) 2 (discNat a b) (level O) := sorry
```

Add `ellipticCount_three` with `(-3) 3`.

Values for the three theorems:

| Curve | area | `ν₂` | `ν₃` |
| --- | --- | --- | --- |
| `X_0(6;1)` | `2π/3` | 2 | 2 |
| `X_0(6;5)` | `4π` | 4 | 0 |
| `X_0(15;4)` | — | 0 | 0 |

A real splitting `ι` exists only when `B` is indefinite, so no definiteness hypothesis is needed.

## R03 (P3) — Tau Ceti's order carriers: line 299 cites a name absent at this head's pin, and at main's pin `QuatOrder`, `IsMax` and `leftOrderSubalgebra` restate it

**Location:**
- `README.md:299`: "Its orders are Tau Ceti's `TauCeti.IntegralOrder.IsOrder k O` on `𝓞_k`-subalgebras".
- `Suggested.lean:101–150` (`QuatOrder`, `instPartialOrderQuatOrder`, `leftOrderSubalgebra`).

**Claim:** This head pins Tau Ceti `358314d4a`. Its merge base is 330 commits behind main, which pins `2fd255d99` (bumped in #1800).
- At `358314d4a` no `TauCeti.IntegralOrder` exists, so line 299 names a declaration that is not at the pin.
- At main's pin, `TauCeti/RingTheory/IntegralOrder/` defines three things:
  - `IsOrder` (Basic.lean:75): an `R`-subalgebra that is an `R`-lattice. This is exactly `QuatOrder`'s `isLattice` field.
  - `IsMaximalOrder := Maximal (IsOrder F)` (Maximal.lean:67). This is `IsMax` in `instPartialOrderQuatOrder`.
  - `Submodule.leftOrder` (LeftOrder.lean:61), `{x | ∀ m ∈ M, x * m ∈ M}`. This is `leftOrderSubalgebra` verbatim.

CAC 7.4 on main lists `IntegralOrder.IsOrder` as its API, and HMV R18.5.16a states its orders with these names (R01). After the rebase that merging requires, the file restates pinned declarations.

**Witness:** `grep -rn IntegralOrder` over the head's Tau Ceti tree is empty. Main's Tau Ceti tree has `Basic.lean:75` `def IsOrder (Λ : Subalgebra R E) : Prop := (Subalgebra.toSubmodule Λ).IsLattice F`.

**Repair:** Rebase onto main.
- State the headlines on `TauCeti.IntegralOrder.IsOrder`, `IsMaximalOrder` and `Submodule.leftOrder`: for example a bundle `{O : Subalgebra R B // TauCeti.IntegralOrder.IsOrder F O}`, `IsMaximalOrder` in place of `IsMax`, and `Submodule.leftOrder` in place of `leftOrderSubalgebra`.
- Keep `rightOrderSubalgebra`, which has no counterpart at `2fd255d99`.
- List the three names, with their files, under *From Tau Ceti*.

Not tested: elaborating at main's pin is not a command this review may run.

## R04 (P3) — ArithmeticFuchsianGroups cites this roadmap's pre-renumbering §§1.7 and 1.12

**Location:** ArithmeticFuchsianGroups README line 1407 at #2026: "for its §§1.2, 1.7, 1.12, 3.5, 3.6 and 8.2". This README §1.6 (line 664) and §1.11 (line 779).

**Claim:** Following the previous review's R06, Layer 1 was renumbered from 1.7–1.14 to 1.6–1.13. The local structure is now 1.6 and the tree adapter 1.11. #2026's §1.7 now lands on the maximality criterion, and its §1.12 on products of lattices. Lines 301–302 here list the consuming sections as 0.3, 1.2, 1.6, 1.11, 3.5, 3.6, 4.6, 8.1 and 8.2. No old → new numbering is given anywhere. No other open head cites a renumbered id: `roadmaps grep QuaternionArithmetic` shows only Layer 2, 2.2, 2.5 and whole-layer citations elsewhere.

**Witness:** #2026 line 1407 against this README's headings at lines 664 (1.6), 689 (1.7), 779 (1.11) and 814 (1.12).

**Repair:** Give the moved ids, one line each (1.7→1.6, 1.8→1.7, 1.9→1.8, 1.10→1.9, 1.11→1.10, 1.12→1.11, 1.13→1.12, 1.14→1.13), as the project rules allow, and ask #2026 to cite §§0.3, 1.2, 1.6, 1.11, 3.5, 3.6, 4.6, 8.1, 8.2 before either merges.

## R05 (P3) — §2.6 restates Definition 24.3.2: the Gorenstein hypothesis is idle, and there is no locator and no Check

**Location:** `README.md:1015–1018`: "a Gorenstein order over a complete DVR is maximal, or residually split …, or residually inert, or residually ramified (`(O|𝔭) = 0`), and record which are Bass and which are hereditary."

**Claim:** Every local order has exactly one symbol in `{∗, 1, −1, 0}` (Voight 24.3.1–24.3.2), so the disjunction holds for every order, Gorenstein or not. It is a restatement of the definition. "Record which are Bass and which are hereditary" is not a stated theorem. The source results that classify local orders by their symbol are not stated:
- 24.3.5: symbol `∗` iff `O ≅ M₂(R)` when `k` is finite;
- 24.3.6: Eichler iff maximal or residually split;
- 24.5.4: residually inert ⇒ Bass;
- 24.5.5: non-Bass ⇒ symbol `0`.

**Witness:** `voight line 16750` (Definition 24.3.2, p. 388), `voight line 16808` (24.3.5, p. 389), `voight line 17070` (24.5.4, p. 394), `voight line 17079` (24.5.5, p. 395).

**Repair:** Replace the paragraph with these facts, each with its locator: the four symbols; `∗` ⇔ `O ≅ M₂(R)` for finite `k`; `1` ⇔ Eichler non-maximal, `O ≅ O₀(𝔭^e)` with `e ≥ 1` (24.3.6, 1.8); `−1` ⇒ Bass (24.5.4); non-Bass ⇒ `0` (24.5.5); hereditary ⇔ `discrd` squarefree (23.3.18). Drop "Gorenstein". Add three Checks (tested):
- `M₂(ℤ₂)`: symbol `∗`, hereditary.
- `O₀(4)`: symbol `1`, Bass, not hereditary.
- At `2`, both the Lipschitz order and `ℤ₂ + 2O` (`O` the division order) have symbol `0`. The first is Bass. The second is not Gorenstein: `(ℤ₂+2O)/2O ≅ 𝔽₂`. So symbol `0` does not decide Bass.

## R06 (P3) — Locators and dangling references

- **§1.1, line 553: "([V, 16.3])".** §16.3 is "Reduced norms". `O_L(Ī) = \overline{O_R(I)}` is Lemma 16.6.7 (`voight line 11476`, p. 261), and `O_L(αI) = αO_L(I)α⁻¹` is Exercise 10.14(b) (`voight lines 7204–7205`). Repair: [V, 16.6.7] and [V, Exercise 10.14].
- **§0.1, line 394: "([V, 15.2.10], p. 235)".** Example 15.2.10 is on printed p. 236 (`voight lines 10508–10511`). Repair: p. 236.
- **§1.2, lines 577–581: no locator.** `γ ∈ O^×` iff `nrd γ ∈ R^×` is Voight Exercise 10.15 (`voight lines 7206–7208`, p. 158). Repair: cite it.
- **§8.2, line 1826: "FuchsianOrbifolds Layer 1 covolume scaling"; line 275: "covolume scaling for finite-index subgroups".** FuchsianOrbifolds Layer 1 is "elliptic points and coarse quotient charts" (its README line 215). Covolume is its Layer 2 item 1, and the scaling is Tau Ceti `MeasureTheory.covolume_eq_card_mul_covolume` (MeasureTheory/Group/FundamentalDomain.lean:322 at the pin), which the 8.2 prose already names. Repair: cite those two in both places.
- **Line 356: "Listed under *Consumed, not redefined* with module paths".** This README has no such heading. Repair: "Listed under *From Tau Ceti at the pin* above".

## R07 (P3) — Claims about LMFDB coverage and stored values that nothing supports (10.3, 9.1)

**10.3, line 2336: "The curves of 9.9 and the orders of 2.7, 5.6, 7.6 exercise every column of the first thirteen rows."** None of 9.9, 2.7, 5.6 or 7.6 gives a value for these rows of 10.2:
- row 8: generators of `H`;
- row 9: `nu4`, `nu6`;
- row 10: `torsion`;
- row 11: `autmuO_norms`, `is_split`, `galEnd`;
- row 12: `cm_discriminants`.

Repair: narrow the sentence to the rows the worked objects exercise. Also add to 9.9 the values for `X^*(6;1)`: `(ν₂, ν₃, ν₄, ν₆) = (1, 0, 1, 1)`, signature `(0; 2, 4, 6)`, area `π/6 = (2π/3)/4`. Tested in 9.6's formula: `1 + 1·(1/4)·(2/12) − ½(½ + ¾ + ⅚) = 1 + 1/24 − 25/24 = 0`.

**9.1, lines 1985–1986: "its stored `nrdmu` is the reduced norm of the primitive element of `ℚ^×μ ∩ O`, so `6.2` has `mu² = −12` and `nrdmu = 3`".** The cited knowl `shimcurve.nrdmu` (`lmfdb_shimcurve_nrdmu lines 90–92`) describes the polarization degree as the squarefree part of the *integer* `nrd(μ)/discrd(O)`. For `6.2` with `μ² = −12` that integer is `12/6 = 2`. The README's `3` would give `1/2`, which is not an integer. No cited source shows a stored value `3`. Repair: delete the `nrdmu` clause and keep `μ² = −δ·DM` and the degree, which agrees with the knowl, or cite the column definition.

## R08 (P3) — Padding: `instIsLatticeRightIdeal` is used by no statement

**Location:** `Suggested.lean:311–313`, an instance whose body is `I.isInvertible.1`, and `README.md:324–325`, which names it.

**Claim:** The instance is a one-line restatement of a structure field, and no headline needs it.

**Witness:** A scratch copy of the file without lines 311–313 elaborates with the same 18 `sorry` warnings and no error.

**Repair:** Delete it from `Suggested.lean` and from the sentence at README lines 324–326.

## Previous findings

Each finding of the previous review, checked at this head:

- **R01 (two owners with ArithmeticFuchsianGroups): repaired.**
  - Lines 87–94: "Arithmetic Fuchsian groups over a totally real field are ArithmeticFuchsianGroups … (§1.1); … (§1.2); the finiteness of maximal-order types (§1.4). Layers 0, 1, 3, 4 and 8 consume these".
  - New contract at lines 280–302; `*Needs:*` lines of 0.3, 1.2, 1.6, 1.11, 3.5, 3.6, 4.6, 8.1, 8.2 updated.
  - TeichmullerGeometry is no longer cited, and the Tamagawa route of 8.2 is gone.
  - Every AFG claim used here is checked under *Cross-roadmap citations*.
- **R02 (QuaternionicModularForms): repaired.** No occurrence remains. Lines 247–251 cite GL₂ transfer R17.3.8d, line 1711 reads "GL₂ transfer R17.3.8d uses the inverse convention", and the gate shows `dropped=0`. The pull-request description no longer lists #934.
- **R03 (λ values): repaired.** Line 983 reads "λ in the 1, −1, 0 cases is 3/2, 1/2, 3/4", and line 984 reads "4/3, 2/3, 8/9".
- **R04 (names): repaired.** Line 102 reads "RG2.2.4, “sl2-tree”". Lines 254–255 name "the central quotient of the class set `Cl(U)`" and "the definite class-set graph … and its integral Brandt matrices". `DefiniteClassSet` appears nowhere.
- **R05 (locators): repaired.** Line 1534 cites "[V, 30.7.5]". Line 1496 cites "[V, 30.4.7, (30.7.2)] … [V, 30.3.14] … the local statement … is [V, 30.5.5]". Line 203 gives "lines 106, 93, 114" and line 226 gives "(line 79)".
- **R06 (shape): repaired.**
  - `## Downstream consumers` added at line 2367.
  - The GlobalNumberFields link at line 177 is `../../Completed/GlobalNumberFields/README.md`.
  - No Sage sentence remains, and the Checks at lines 565–571 and 757 name no Lean declaration.
  - §5.3 has four Checks (lines 1419–1427), and §§1.6–1.13 are numbered without a gap.
- **R07 (`sources.toml`): repaired.** The board package now holds `sources.toml` with keys for `voight`, `rotger`, `dembele_voight`, `pizer1976`, `eichler1955`, eleven LMFDB knowls, and three uncertified works (`vigneras1980`, `pizer1980`, `ogg1983`). Four of its `certified` entries are not the works; see *Not verifiable*.

## Verified sound

**Gate, build and dependencies.**
- The worker's gate at 5b4cda9 is all zero and OK, including `build=0`, `outside-folder=0` and `stray-files=0`.
- My rerun of the full gate gives only `depcheck: NOT IN ORDER: QuaternionArithmetic`. The full gate reads the project's merge order, which does not list this roadmap yet, so this is not a defect.
- The brief's dependency check with the candidate order and `--movable` prints `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. In the candidate order ArithmeticFuchsianGroups is line 284, this roadmap 285, and HMV 160.
- `lake env lean TauCetiRoadmap/QuaternionArithmetic/Suggested.lean` exits 0 in 23 s with exactly 18 `declaration uses sorry` warnings.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Pins: Mathlib `f6090c709`, Tau Ceti `358314d4a` (main: `2fd255d99`; see R03).

**Signatures.**
- I elaborated `#check @name` for 52 declarations in one scratch file: all 18 theorems and every definition they use. I compared each with its README statement.
  - The general-`R` theorems carry `CharZero`, `IsDedekindDomain R` and `IsFractionRing R F`: `existsUnique_gorenstein_saturation` and `IsEichler.isBass` through `include charZeroF`, and `finite_classSet` through `[CharZero F] [NumberField F]` on `𝓞 F`.
  - Every rational theorem carries its definiteness or indefiniteness, Eichler or maximality hypothesis as in the README.
- The 25 "dropped binder" leads of the worker's signature listing are definitions whose types do not mention those classes. No change is needed.
- `module` on line 1 is the form used by 41 roadmaps on main.

**Padding probe.** I replaced every `sorry` by `first | rfl | simp | decide | infer_instance`. All 18 fail (18 errors), so none closes in one tactic.

**Seeded sample** (Voight author edition v0.9.28, `voight` in the cache; printed pages from the running heads):

| Target | Locators opened | Result |
| --- | --- | --- |
| 0.1 | Ex. 15.2.10, `line 10511`, p. 236 | Gram `diag(2,2a,2b,−2ab)`, det `−16a²b²`, for `a,b ∈ R`, char ≠ 2: matches; page R06 |
| 1.1 | Ex. 10.2.4 (`6954`, p. 152); Cor. 10.3.3, 10.3.6, Lemma 10.3.7 (`7021–7038`, p. 154); 16.6.7 (`11476`) | matches except the §16.3 locator (R06) |
| 1.2 | none given; Ex. 10.15 (`7206`) | statements true; locator R06 |
| 1.11 | 23.5.2 (`16259`, p. 376), 23.5.5 (`16284`, p. 377), 23.5.15–16 (`16349–16362`, p. 379) | bijection, distance `e` ↔ level `𝔭^e`, path ↔ superorders: matches |
| 2.2 | Def. 24.2.1, 24.2.2, Prop. 24.2.3(iv), Lemma 24.2.5 (`16513–16532`, p. 383), Thm 24.2.10 (`16579`, p. 384) | matches, including "⊆ always" |
| 2.6 | none given; 24.3.1–24.3.6, 24.5.2–24.5.5 | R05 |
| 3.3 | Lemma 17.4.6 (`11988`), Lemma 17.4.7 (`11998`), p. 274 | matches |
| 3.7 | Def. 28.9.8 (`20774`), Ex. 28.9.10 (`20778`), p. 485 | definition matches; the README's odd-order hypothesis is the correct one (*Source issues*) |
| 5.2 | Thm 25.1.1 (`17355`), Thm 25.3.18 (`17730`), Main Thm 25.3.19 with (25.3.20) (`17756–17776`), p. 411 | `w_J = #O_L(J)^×/2`, `ψ = ∏(p^e+p^{e−1})`, λ by symbol: match the Conventions |
| 5.5 | Thm 25.4.1 (`17783`, p. 411), Thm 25.4.3 (`17795`, p. 412), (25.4.5) (`17834`) | match; (25.4.5) is the mass bound `φ(N)/12 ≤ 1` |
| 6.5 | Ex. 30.7.7 (`23801`, p. 548), Thm 39.4.20 (`30965`, p. 726) | `ε` products with `9 ∤ M`, `4 ∤ M` and Kronecker symbols: match; 30.7.7 is stated for indefinite `B`, the definite sum is 30.7.3 (cited in 6.4) |
| 6.7 | Thm 30.1.5 (`22961`, p. 531) | values recomputed below |
| 7.4 | Main Thm 41.5.2 (`32386`, p. 759), Ex. 41.5.8, (41.5.9)–(41.5.10) (`32435–32450`, p. 761), Thm 41.1.13 (`32006`, p. 751) | matches, `w_S = [S^×:R^×]`, mass term for `𝔫 = c²R`; the 41.1.13 erratum of the previous reports stands |
| 8.8 | HMV R18.1.3 (#1005, line 1630) | complex points `G_B(ℚ)\(H^±×G_B(A_f)/U)`, proper for division `B`; one component since `nrd(Ô^×) = ℤ̂^×`: matches |
| 10.3 | README 9.9, 10.2 | R07 |

I also opened §13.2–13.3 (`voight lines 8710–8870`, pp. 196–200). They are stated for a complete DVR with arbitrary residue field, so 1.6's generality ("residue field need not be finite") is supported.

**Library declarations opened at the pins.**
- Mathlib: `MeasureTheory.covolume` (MeasureTheory/Group/FundamentalDomain.lean:679), `riemannZeta_two` (NumberTheory/LSeries/HurwitzZetaValues.lean:226), and `NumberField.dedekindZeta` (NumberTheory/NumberField/DedekindZeta.lean:49). No identification of `dedekindZeta ℚ` with `riemannZeta` exists, so 8.2's "proved here" is right.
- Tau Ceti `358314d4a`:
  - `MeasureTheory.covolume_eq_card_mul_covolume` (MeasureTheory/Group/FundamentalDomain.lean:322), with hypotheses `Δ ≤ Γ`, `Γ` countable and a fundamental domain;
  - `oneEquivMatrix (b : Rˣ) : ℍ[R,1,b] ≃ₐ …` (Algebra/Quaternion/Split.lean:121);
  - the module `Analysis/Complex/UpperHalfPlane/PSL/Action.lean`;
  - only `PermutationTriple.genus` (EulerCharacteristic.lean:204), no other genus;
  - no `IntegralOrder`.
- Tau Ceti `2fd255d99` (main): `IntegralOrder/Basic.lean:75`, `Maximal.lean:67`, `LeftOrder.lean:61` (R03).
- The 37 Tau Ceti contract names verified by the r3 report are unchanged in the README and at the pin.

**Cross-roadmap citations resolved this round.** Line numbers are README lines at the heads.

| Roadmap | Sections resolved |
| --- | --- |
| ArithmeticFuchsianGroups #2026 | §1.1 (386–506; `Suggested.lean` 50 `RealSplitting`, 67 `normOneImage`, 84 `isCofinite_normOneImage`, 92 `cocompact_normOneImage_iff_anisotropic`); §1.2 (508–625; `finiteRamification` 101, `covolume_normOneImage` 110; positive normalizer, `ν`, tree adapter, edge stabilizers); §1.4 maximal-order types (836–841); consumers (1403–1408) |
| HMV #1005 | R18.1.3 (1630), R18.3.1 (2797), R18.5.16a–c (2359, 2395, 2425), R18.5.17a (2467), Scope (9), consumers (4434) |
| GL2AutomorphicRepresentationsAndTransfer #931 | R17.1.5 (1507), R17.3 (1701), R17.3.1, R17.3.3, R17.3.8a–d (1784–2084), R17.3.9 (2186) |
| AdelicAlgebraicGroups #792 | AA.3.4 *class-number-finite* (3161) with `Reduction.finite_classes` (3168); AA.4.2 (4265); §4.4 nested-level map (4805) and finite-index bound (4829); AA.4.6 (5172); AA.5.3 (5601, 5626) |
| AbelianSchemesAndArithmeticModuli #849 | A0.1 (588), A3.2 (1441), A3.9 (1683) |
| AutomorphicFormsOnReductiveGroups #1037 | §7.4 (1218) |
| AutomorphicGaloisRepresentations #1007 | §§0.2c–0.2e (610) |
| FiniteGroupInvariants #1708 | 7.1 (1174) |
| AbelianVarietiesOverFiniteFields #1720 | 8.4 (1585) |
| GrossZagierAndArithmeticHeights #1487 | §0a.3 (208) |
| ClassicalArithmeticCompletion (main) | 7.4, 7.20, 7.21, 7.44, 7.56, 7.60, 7.72, 7.77, 7.78, 7.98 (headings 14393–16744; 7.44, 7.60 and 7.78 read in full against the contract wording) |
| FuchsianOrbifolds (main) | Layers 0–5 (193–343; 4.5 Euler characteristic and area, 5.3 Riemann–Hurwitz) |
| ThetaSeries (main) | Layer 7, Hecke–Schoeneberg (854) |
| ReductiveGroupsPartII (main) | RG2.2.4 *sl2-tree* (3647) |

The resolver's nine leads are knowl identifiers or names checked here: `IsEichler.isBass` is declared in `Suggested.lean`, and `Reduction.finite_classes` is AA's.

**Ownership.**
- The five closest roadmaps in the worker's overlaps listing were compared.
  - HMV #1005 is R01.
  - ArithmeticFuchsianGroups #2026 is consumed (R04 is its stale citation).
  - HilbertModularForms #1724 defers quaternion orders and Brandt matrices to another roadmap and owns nothing stated here.
  - AbelianVarietiesOverFiniteFields #1720 and BianchiModularForms #1719 state no quaternion-order targets.
- No `Suggested.lean` name here equals a fully qualified name in a readable roadmap.
- Pull requests without files were searched only through `roadmaps grep`.

**Adversarial table.** All values were recomputed this round. Class numbers come from reduced forms, and `ν_q`, genera, masses and fixed points from a script.

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| 0.1 Gram (sample) | (3,−1), (−1,−1), (1,1) | (2,6,−2,6) det −144 = −16·9; (2,−2,−2,−2) −16; (2,2,2,−2) −16 | holds; R06 page |
| 0.2–0.4, `discNat` | Hamilton, (3,−1), (1,7), (−1,−13), (−2,−37) | D = 2, 6, 1 (bound 14), 2 (`(−1|13) = 1`), 37 (`(−2,−37)_2 = (−1)(−1) = 1`) | holds |
| 0.7 symbols | (−1,−3), (−2,−5), (−1,−7), (−1,−11), (−2,5), (−3,5), (5,5) | D = 3, 5, 7, 11, 10, 15, 1 (`(2,5)_2 = −1`, `(−3|5) = −1`) | holds |
| 1.1 (sample) | Ex. 10.2.4 at (−1,−1); `I = 0`; `O_L(O)` | `ik = aj = −j ∈ O`; `O_L(0) = B`, not an order; `O_L(O) = O` | holds; R06 |
| 1.2 (sample) | Hurwitz; `1+i+j ∈ O₆`; scalar 2 | 24 units of norm 1, quotient 1; `nrd = 1 − 3 + 1 = −1`, inverse `−1+i+j`, quotient 2; `nrd 2 = 4 ∉ ℤ^×` | holds; R06 |
| 1.3–1.5 discriminants | L, 2L, L ⊂ H | trace det −16, −4096; cubic 4, 32; `δ = 4`, `64 = 2·32`; `64² = 4096` | holds |
| `isMax_iff_discrdNat_eq` (headline) | L, H, O₆, ℤ+2O₆ | 4 vs D = 2 (not max); 2 = 2; 6 = 6; 48 vs 6 | holds |
| 1.6 local | `ℍ_ℝ[[t]]`; ℚ₂ division order | trace det −16 a unit, `e = 1`; `P² = 2O`, `e = 2` | holds |
| 1.8–1.9 (R01) | `O₀(2^e)`, e = 0, 1, 2; middle vertex of a length-`e` path | discrd 1, 2, 4; ψ = 1, 3, 6; `(q+1)q^{d−1}·q^{e−d} = (q+1)q^{e−1}` | holds; R01 |
| `relindex_normOne_eq_psi` (headline) | Γ₀(2), Γ₀(4) in SL₂(ℤ); Hurwitz level 7 | 3 = ψ(2), 6 = ψ(4); definite: 24/6 = 4 ≠ 8, excluded by `hind` | holds |
| 1.11 (sample) | R² vs R⊕ϖ²R; R⊕ϖR vs ϖR⊕R | O₀(𝔭²); `[[R,𝔭⁻¹],[𝔭,R]] ∩ [[R,𝔭],[𝔭⁻¹,R]] = [[R,𝔭],[𝔭,R]]`, `diag(1,ϖ)`-conjugate to O₀(𝔭²) | holds |
| 2.2 (sample) | M₂(ℤ), L, ℤ+2O₆ | `nrd(codiff)·discrd` = 1·1, ¼·4 = 1, 2 | holds |
| `existsUnique_gorenstein_saturation` (headline) | O₆; ℤ+2O₆; R = F | (⊤, O₆); ((2), O₆) with `𝔣 = discrd·nrd(O^♯) = 2`; (⊤, ℍ) | holds |
| 2.4 symbol, λ | q = 2, 3 | counts 6, 4, 12, 8 and 48, 36, 72, 54; λ 3/2, 1/2, 3/4 and 4/3, 2/3, 8/9; `[H₂^×:L₂^×] = 2·(¾)/(½) = 3 = 12·2/8` | holds |
| `IsEichler.isBass` (headline) | O₀(4); L; ℤ+2O₆ | superorders of O₀(4) Eichler, hence Gorenstein; L Bass but not Eichler (converse not claimed); ℤ+2O₆ not Gorenstein | holds |
| 2.6 (sample) | M₂(ℤ₂), O₀(4), L₂, ℤ₂+2O₂ | symbols ∗, 1, 0, 0; L₂ Bass; `(ℤ₂+2O₂)/2O₂ ≅ 𝔽₂`, not Gorenstein | disjunction holds for every order: R05 |
| 3.1–3.2 | 2O₀(2); M₂(ℤ) and 2M₂(ℤ) over O₀(2) | index 16 = 4²; `O_R = M₂(ℤ) ≠ O₀(2)`; index 8 ≠ 4² | holds |
| 3.3 (sample) | Hurwitz, D = 11, 37 | (h, t) = (1, 1), (2, 2), (3, 2); Deuring t(11) = 1 + ¼ + ¾, t(37) = 3/2 + ½ | holds |
| `finite_classSet` (headline) | Hurwitz; D = 37 | 1 class (norm-1 representative, bound `(8/π²)·2 ≈ 1.62`); 3 classes | holds |
| 3.7 AL (sample) | O₆; M₂(ℤ); O₀(4); L with `h = (1+i+j+k)/2` | 4; 1; {1, 4}; `h² = h − 1`, `h³ = −1`, `Lh` of order 3 | holds |
| `card_atkinLehnerGroup` (headline) | O₆, M₂(ℤ), O₀(4), O₀(6) ⊂ M₂(ℚ) | 4 = 2², 1, 2, 4 | holds |
| 3.9 fibres (R01) | Hurwitz ⊃ level 7; GL₂(ℤ) on ℙ¹(𝔽₂) | A₄ on 8 points: order-3 elements split mod 7, orbits 4 + 4, fibre 2, `Cls = 2`; one orbit of 3 | holds; R01 |
| 4.3, 4.4 (headlines) | O₆; M₂(ℤ) | h = t = 1; units `1+i+j`, `diag(−1,1)` of norm −1 | holds |
| 4.6 | O₆; M₂(ℤ) | 4 = 2^{ω(6)}, im ν = {1, 2, 3, 6}; 1; `−1 ∈ O¹` so `ℚ^×O¹ = ℚ_{>0}O¹` | holds |
| 5.1–5.2 / `eichler_mass_formula` (sample, headline) | D = 2, 3, 11, 37; (2,3), (2,7) | Σ 2/#O^× = 1/12, 1/6, ½ + ⅓ = 5/6, 3; ⅓ = 1·4/12, ⅔ = 1·8/12 | holds |
| 5.3 Checks | ℚ; `N𝔭 = 4`; ℚ(√5) | `2(π²/6)/(2π)² = 1/12`; ψ(𝔭²) = 20, φ(𝔭) = 3; `ζ_F(2) = ζ(2)L(2,χ₅) = 2π⁴/(75√5)`, mass `4π⁴·5√5/(75√5·16π⁴) = 1/60 = 1/#A₅` | holds |
| 5.4 | L₂ ⊂ H₂; O₀(p) | `2·¾·2 = 3`; `p(1+1/p) = p+1` | holds |
| 5.5 / `classNumber_eq_one_iff` (sample, headline) | D = 2, 3, 5, 7, 13 vs 11, 17, 19, 23, 37 | 1, 1, 1, 1, 1 vs 2, 2, 2, 3, 3 | holds |
| 6.1 | O₆ with ℤ[i], ℤ[2i] | `m(O^×) = 2`, `m(O¹) = 2·[{±1}:{1}] = 4`; 0 | holds |
| 6.3 | ℤ₃[i] e = 1; ℤ₂[i] e = 1, 2; ℤ₃[ω] e = 1, 2 | 0; 1 + 0, 0 + 0; 1 + 0, 0 | holds; matches the Kronecker products |
| 6.5 `embeddingNumber_gaussian/eisenstein` (sample, headline) | (D,M) = (6,1), (15,4), (6,5), (1,1) | (2,2), (0,2), (4,0), (1,1) | holds |
| 6.6 / 6.7 `classNumber_eq_mass_add` (sample, headline) | D = 2, 11, 37; (2,3), (2,5), (2,7) | 1/12 + ¼ + ⅔ = 1; 5/6 + ½ + ⅔ = 2; 3; ⅓ + 0 + ⅔ = 1; ½ + 0 + ½ = 1; ⅔ + 0 + 4/3 = 2 | holds |
| 6.8 `typeNumber_prime` (headline) | p = 5, 11, 13, 17, 23, 37 | t = ½ + 2/4 = 1; 2; 1; 2; 3/2 + ¾ + ¾ = 3; 2 | holds |
| 7.1–7.3 (R01) | D = 11 T(2), T(3), T(5); D = 37 T(2) | column sums 3, 4, 6; `w_iT_ij = w_jT_ji`: 2·3 = 3·2; `T(2)T(3) = T(3)T(2) = [[8,6],[4,6]]`, sums 12 | holds; R01 |
| 7.4 (sample) | Hurwitz n = 3, 9; D = 11 n = 2, 3, 5; D = 37 n = 2 | 4; 13 (shorthand 10); 1, 3, 7 = the traces of T(2), T(3), T(5); 1 | holds |
| 7.7 theta | Hurwitz `r(2n)` | 24/24 = 1, 96/24 = 4, constant 1/24 (`D₄`: 1 + 24q + 24q² + 96q³) | holds |
| 8.2 area (R02) | (6,1), (6,5), (6,101); definite level 7 | `8π(π²/6)/(4π²)·2 = 2π/3`; 4π; 204/12 = 17; 4 ≠ 8 | holds; R02 |
| 8.3–8.4 (R02) | D = 6–39 at N = 1; D = 6 at N = 5, 7, 11, 13, 25, 101; (15,4) | the README table exactly (e.g. D = 22: ν₂ = 2, ν₃ = 4, g = 0; D = 33: 4, 2, 1); g = 1, 1, 3, 1, 5, 17; 5 | holds |
| 8.6 fixed points | (6,1), m = 2, 3, 6; (6,101), seven m | 2, 2, 2; 4, 0, 4, 0, 12, 0, 12 (h(−808) = 6, h(−2424) = 12); 32 = 8·0 + 32 | holds |
| 8.8 (sample) | `U = Ô^×`, O Eichler | `ℚ_{>0}\𝔸_f^×/ℤ̂^× = 1`; `B^×_{>0} ∩ Ô^× = O¹` | holds |
| 9.1 (R07) | `μ = i+3j`; 2μ; D = 21, δ = 21; D = 6, δ = 1 | μ² = −6, pairings 0, 6, −6, 0; 24/6 = 4 a square; 4·1/4 = 1 orbit; 2·2/4 = 1 orbit | holds; R07 |
| `exists_principal_polarization` (headline) | O₆; M₂(ℤ) | `i+3j ∈ O₆`, square −6; `[[0,−1],[1,0]]² = −I` | holds |
| 9.2 `card_autPmMu(_general)` (headline) | O₆ deg 1, 2, 6; `μ = i+4j`; M₂(ℤ), `μ = [[1,−6],[4,−1]]` | 4, 12, 8; `μ² = −13`, pairings 0, 6, −8, −1, no element of ℚ(√−13) of norm 2, 3, 6 in N(O₆), card ∈ {1, 2}; `μ² = −23I`, `(8b−11c)² + 23c² = 16` unsolvable, card 1 | holds |
| 9.4 | `2+i`, `μ = i+3j` | `(2−i)(i+3j)(2+i) = i + 21j − 12k ≠ ±μ`; `K` cyclic, since anticommuting units would square to 1 | holds |
| 9.6 genus | X(6;1); X^*(6;1) | `1 + 4·¼·(2/12) − ½(1 + 4/3) = 0`; `1 + 1/24 − 25/24 = 0` | holds; R07 adds the second |
| 9.7 torsion | O₀(2)/2O₀(2); M₂(𝔽₂) | fixed module `span(E₁₂, 2E₂₁)`, order 4; 0 | holds |
| 10.1 / 10.3 (sample) | X(6;1), X^*(6;1), X(6,5;1), X(6,11;1) | 6.1.1.4.0, 6.1.1.1.0, 6.30.1.1.4.1, 6.66.1.1.2.3; rows 8–12 have no values | R07 |
| Worked degree-one classes | D = 6, 10, 14, 15, 21, 22, 26, 33, 34, 35, 38, 39 | h(−4D) = 2, 2, 4, 2, 4, 2, 6, 4, 4, 6, 6, 4; c = 1, 1, 2, 2, 2, 1, 3, 2, 2, 4, 3, 4 | holds |

## Not verifiable

- **LMFDB knowls `shimcurve.label` and `shimcurve.eichler`.** The cached texts are a browser-check page (`lmfdb_shimcurve_label lines 5–9`), yet `sources.toml` records both as `certified`. The label format `D.d.δ.N.i.g` was checked only against the README's own Conventions and the 10.1 Checks. The other nine knowls are readable: `nrdmu` is used in R07, and `polarized_order`, `aut_pm_mu_o` and `enhanced_group` agree with the Conventions.
- **`eichler1955`** is cached as the EuDML landing page (metadata, not the paper) but recorded `certified`.
- **`pizer1976`** is an image-only scan, unreadable here. It is listed in `needs-references.toml`.
- **`vigneras1980`, `pizer1980`, `ogg1983`, `shimizu1965` and `alsina_bayer2004`** are settled as uncertified. No sampled locator needs them.
- **Elaboration of `Suggested.lean` at main's Tau Ceti pin `2fd255d99`** was not run, because it is not a command this review may run (R03).

## Source issues

- **Misprint** in voight at Example 28.9.10, printed p. 485: the source says AL(O) is all of ∏ℤ/2 when the squares of Cl_{G(O)}R form the trivial group; it should be when Cl_{G(O)}R equals its subgroup of squares (odd order), e.g. ℤ[√−5] at level (2, 1+√−5) gives trivial AL; affects nothing.
- The two items of the earlier reports (Voight Theorem 41.1.13 and 41.2.5) stand and are not repeated.
