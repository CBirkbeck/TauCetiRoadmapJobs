# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at be1d8b4)

**Verdict:** needs changes

A full review of `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/` at `be1d8b4`. The previous review read the same head; nothing changed in or outside the folder since. Its one finding, the Tau Ceti pin, is unchanged and is carried as R01. The full pass adds one blocking finding (R02: the arbitrary-genus mass formula is statable at the pins but is not stated) and three P3 findings.

## Previous findings

- **R01 (P2), the Tau Ceti pin: not repaired.** `lake-manifest.json` still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. Raised again below as R01. The README and the manifest are both unchanged.

## R01 (P2) — The branch pins a Tau Ceti that lacks the cited root-system and rank-24 files

**Location.** `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` lines 30, 34–46, 569 and 587. For example, line 34: "`RootPairing.card_weylGroup_of_hasCartanType_A` in `TauCeti/LinearAlgebra/RootSystem/Weyl/TypeA/Basic.lean`", and line 30: the `Rank24/` files.

**Claim.** The README treats these declarations as present in the pinned Tau Ceti.

**Witness.** The branch manifest pins `a91d3aa`; main pins `2fd255d`. Of the 25 cited `TauCeti/…lean` paths, 15 are absent at `a91d3aa`, among them `GroupTheory/Coxeter/Restriction.lean`, the five `IntegralLattice/Rank24/` files, `RootSystem/HighestRoot.lean` and `Weyl/BaseChange.lean`. All 25 are present at `2fd255d`.

Three cited declarations whose files do exist at `a91d3aa` are still missing there:

- `rationalRootSystem_def`;
- `weylCoxeterSystem`;
- `IntegralLattice.Isometry.map_span_vectorsOfNorm`, which is at `RepresentationNumber.lean:179` only at `2fd255d`.

**Repair.** Merge `origin/main` into the branch. `git merge-tree --write-tree HEAD origin/main` is clean again this round. The manifest then pins `2fd255d`/`1b1ccf4`; re-run the targeted build. The README needs no edit for this finding.

## R02 (P2) — The arbitrary-genus mass formula is statable at the pins but is not stated

**Location.** `Suggested.lean` lines 19–20: "the arbitrary-genus mass formula of 1.3 and the orthogonal quotient comparison of 1.1–1.2: there is no adelic orthogonal quotient with its Tamagawa measure, and no local density". The same formula appears in README line 248: `m_full(gen L) = 2 R_n (det B)^((n+1)/2) product_p beta_p(L)^(-1)`.

**Claim.** The headline is not statable because no local density exists at the pins.

**Witness.**

- *It is a headline.* The README's Scope (line 7) makes this roadmap the owner of "the rational arbitrary-genus mass formula". IntegralLattices on main assigns to it "the Smith–Minkowski–Siegel mass formula" (README line 120) and labels 7F/7H (lines 85–86).
- *It is statable.* The measure form (the first display of §1.3) needs the Tamagawa measure. The numerical form (the second display, line 248) needs only a genus predicate, a genus mass and the stabilized count α_p. Each of these is a short definition with a real body on native carriers.
- *A sibling already defines them.* IntegralLattices' `Suggested.lean` on main defines `GramSameGenus` (line 255) and `localDensityCount` (line 700) in exactly this way.
- *Tested.* The statement below, appended to a scratch copy of this `Suggested.lean`, elaborates under `lake env lean` at the branch pins with the single warning "declaration uses `sorry`".
- *The normalization is right.* At n = 3, brute-force counting gives α₂(I₃) = 12 (r = 3 and 4) and α₃(I₃) = 16/9. The right-hand side then evaluates to 1/48 = 1/|O(ℤ³)|. At n = 8 it gives 1/696729600 for E₈.

**Repair.** Add the three definitions and the theorem below. Keep §§1.1–1.2, and the measure identity of §1.3, in the docstring's not-statable list, and delete "and no local density". In README §1.3, state the second display as `genusMass_eq`. Give `SameGenus`, `genusMass` and `localDensity` their API bullets and at least three Checks each; the ⟨1⟩, ⟨2⟩ and U densities of §2.2 (4, 8, 4) and the E₈ and I₃ masses serve.

```lean
/-- Two positive Gram matrices lie in one genus when they are congruent over every `ℤ_p`. -/
def SameGenus {n : ℕ} (G H : PositiveGram n) : Prop :=
  ∀ p : ℕ, (hp : p.Prime) → haveI := Fact.mk hp
    ∃ A : Matrix (Fin n) (Fin n) ℤ_[p], IsUnit A.det ∧
      A.transpose * G.1.map (Int.cast) * A = H.1.map (Int.cast)

/-- The full mass of the genus of `G`. -/
def genusMass {n : ℕ} (G : PositiveGram n) : ℚ :=
  ∑' c : {c : GramClass n // ∃ H : PositiveGram n, classOf H = c ∧ SameGenus G H},
    (classAutomorphismOrder c.1 : ℚ)⁻¹

/-- The bilinear local density `α_p(G)`, the limit of `p^(-r n(n-1)/2) #{X mod p^r : XᵀGX = G}`. -/
def localDensity {n : ℕ} (G : GramMatrix n) (p : ℕ) : ℝ :=
  Filter.limUnder Filter.atTop fun r : ℕ =>
    (Nat.card {X : Matrix (Fin n) (Fin n) (ZMod (p ^ r)) //
        X.transpose * G.map (Int.cast) * X = G.map (Int.cast)} : ℝ) /
      (p : ℝ) ^ (r * (n * (n - 1) / 2))

/-- Siegel's mass formula for a positive definite integral genus of rank at least three. -/
theorem genusMass_eq {n : ℕ} (hn : 3 ≤ n) (G : PositiveGram n) :
    (genusMass G : ℝ) = 2 * Real.pi ^ (-((n : ℝ) * (n + 1)) / 4) *
      (∏ j ∈ Finset.Icc 1 n, Real.Gamma ((j : ℝ) / 2)) *
      ((G.1.det : ℝ)) ^ (((n : ℝ) + 1) / 2) *
      ∏' p : Nat.Primes, (localDensity G.1 p / 2)⁻¹ := by
  sorry
```

## R03 (P3) — A misplaced supplier locator, and an unnamed Mathlib input in §3.1

**Location.**

- README line 11: "the adelic image is not open (AA.1.4)".
- Line 509, the §3.1 *Needs:* line: "§0.0; IntegralLattices §§2C/2G/3C/3E/5A/7A; Layer 2's arbitrary-genus formula".
- Line 551, Layer 3's Dependencies: "Mathlib's … zeta special values".

**Claim.** AdelicAlgebraicGroups AA.1.4 contains the squaring example, and §3.1's route names all of its inputs.

**Witness.**

- *The locator.* At the AdelicAlgebraicGroups head (#792), the Checks that the squaring image of `G_m` over ℚ is closed of infinite index and not open are lines 1270–1274. They lie in "### 1.3 Rational points and functoriality" (line 1235); §1.4, "Restriction of scalars" (line 1291), has no such statement.
- *The unnamed input.* §3.1 turns the `ζ^(S)(2i)` and `L(m, χ_triv) = ζ(m)` factors of §2.3 into Bernoulli numbers. That step is Mathlib's `riemannZeta_two_mul_nat`, at `NumberTheory/LSeries/HurwitzZetaValues.lean:206` at the pin, and no line names it.

**Repair.**

- Line 11: replace "(AA.1.4)" with "(AA.1.3)".
- Add "Mathlib `riemannZeta_two_mul_nat`" to the §3.1 *Needs:* line, and name it in place of "zeta special values" in Layer 3's Dependencies.

## R04 (P3) — House style: undefined abbreviations, glued numerals, capitals and ASCII mathematics in prose

**Location.** Each lapse type, with its README lines:

- **Undefined abbreviations.** "IL4B" (171, 209), "IL7E"/"IL7C" (224, 472), "IL B8" (266), "GNF9" (310), "IL B2/B3/B4" (367), "IL B3" (373), "IL B7" (384), "IL3I" (423, 437), "IL3/5A" (517), "IL7A" (521), "OG Spin/SO" (168), "A2" for A₂ (283, 389).
- **Glued numerals.** "or1 mod4" (280), "at1" (315, 337), "in1.4a" (328), "its0/1" (331), "Rank0 and rank1" (385), "content2" (391), "divisible by8"/"Apply1–2" (517), "factor2", "Rank8 must yield1/696729600" (521), "characteristic2" (624).
- **Capitals for emphasis.** "POLYNOMIAL" (282), "SAME-form" (304), "ENTIRE" (330), "ONE genus" (370), "FREE" (457).
- **ASCII mathematics in prose.** "vol(K_infinity) product_p …" (209), "n>=3", "s_n=2^(-floor(n/2))", "vol(K_p)=alpha_p" (224), "t/(exp(t)-1)=sum B_k t^k/k!", "lambda2=1" (521).

**Claim.** The README follows the house style: standard or defined vocabulary, and Unicode in prose with ASCII only in code spans.

**Witness.** None of "IL", "GNF" or "OG" is defined anywhere in the README. Line 18 itself writes "IntegralLattices §7C", and line 189 "IntegralLattices §§4A–4C".

**Repair.**

- Write the abbreviations out: "IntegralLattices §4B", "GlobalNumberFields §9", "OrthogonalSpinGroups", and A₂.
- Insert the missing spaces ("at 1", "divisible by 8", "content 2", …).
- Set the capitalized words in lower case.
- Put the ASCII formulas in code spans or write them in Unicode.

## R05 (P3) — Three Lean docstrings describe design choices instead of the mathematics

**Location.** `Suggested.lean`:

- line 88, "Descent is justified by conjugation under actual integral isometries." (`classAutomorphismOrder`);
- line 94, "Evenness and unimodularity use the native lattice predicates." (`evenUnimodularClasses`);
- line 103, "The Bernoulli convention is the native one with B₁=-1/2; rank zero is separate." (`bernoulliFullMass`).

**Claim.** Every declaration carries a docstring that states its mathematics.

**Witness.** No reader can recover from line 103 that `bernoulliFullMass m = |B_m/(2m)| ∏_{j=1}^{m−1} |B_{2j}/(4j)|`. Line 88 asserts representative-independence, which is a README target, not the definition.

**Repair.** Use, for example:

- "The order of the full integral isometry group of the lattice of a chosen representative of `c`";
- "The classes of positive definite even unimodular integral Gram matrices of rank `n`";
- "`|B_m/(2m)| · ∏_{j=1}^{m−1} |B_{2j}/(4j)|`, with Mathlib's `bernoulli` (`B₁ = −1/2`); it is `0` at `m = 0`".

## Verified sound

### Gate, dependency check, build and Lean form

- **Gate.** The worker's gate printed `OK` with every counter at 0, `build=0` included. A re-run of the gate on this head also printed `OK`. Nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!…'` is empty). The folder has only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check** with `--movable`:

  ```text
  depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or moved line. This roadmap is line 148 of the merge order. Its open suppliers are earlier: AdelicAlgebraicGroups 51, ArithmeticStatisticsPartV 52, GeometryOfNumbersAndQuadraticArithmetic 55 and EndoscopicTransferAndUnitaryTraceComparison 147. Every other supplier is on main. SporadicOrders (merge-order line 388) is on main, so it is cited from main.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins took 34 s. It printed exactly five warnings, `declaration uses 'sorry'`, at lines 109, 116, 120, 124 and 128.
- **Binder check.** I ran `#check @` on the eight definitions in one scratch file. `nativeLattice`, `GramEquivalent`, `fullAutomorphismOrder` and `classAutomorphismOrder` take only `{n}` and their explicit arguments, and the file has no `variable` block. All 17 elaborated types equal `signatures.md`. `evenUnimodularMass_eq` keeps `0 < n` and `8 ∣ n`, and the four class-count theorems are closed statements. No binder was lost.
- **Padding probe.** I made 15 one-tactic attempts on a scratch copy: `simp`, `norm_num`, `rfl` and `decide`, with the definitions unfolded, on each of the five theorems. All fail; `decide` gets stuck on `Classical.propDecidable`. No padding was found. Imports are `Mathlib` plus four `TauCeti.LinearAlgebra.IntegralLattice.*` modules, all present at `a91d3aa`. The file has no `set_option`, no sorry'd data and no `lemma`.
- **Headline inventory.**
  - Stated: the even-unimodular mass formula (`evenUnimodularMass_eq`), the rank-16 and rank-24 class numbers, and the rank-32 and rank-40 lower bounds.
  - Statable but absent: the arbitrary-genus formula (R02).
  - Named in the docstring as not statable, correctly: the Spin structure theorems (0.1; no Spin scheme for an arbitrary form, only the split `TypeB/TypeDSpinCarrier`), 0.1a, Cho's model (2.1–2.2), approximation and Eichler (0.3; no spinor-genus carrier), the binary same-form comparison (1.4), and the measure identities (1.1–1.3).
  - Not headlines: the Weyl orders and the rank-24 automorphism orders, which are intermediate targets.

### Library declarations opened

| Declaration | Pin, file:line | What it says, against the README |
| --- | --- | --- |
| `IntegralLattice.Isometry` | `a91d3aa`, `IntegralLattice/Isometry/Basic.lean:74` | Extends `L.form.IsometryEquiv M.form` with `map_carrier`; so `Nat.card (Isometry L L)` is the full O(L) (lines 85–86) |
| `IntegralLattice.ofGramMatrix` | `Basic.lean:261` | Carrier `span ℤ (range b)`, form `toBilin b G` (line 52) |
| `IntegralLattice.IsUnimodular`, `IsEven` | `Unimodular.lean:58`, `Even.lean:67` | carrier = dual carrier; `Even (integralNorm x)` |
| `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`, `groupScheme` | `ConstantForm/Basic.lean:445`, `:339` | Points are `M` with `M C Mᵀ = C`, as line 126 and the convention of line 16 say |
| `TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra` | `SpecialOrthogonal/Reductive.lean:149` | Standard form only, `[NeZero (2 : k)]`; there is no `ConstantForm` smoothness or reductivity at either pin (line 126's claim) |
| `TauCeti.CommHopfAlgCat.IsCentralIsogeny` | `Isogeny/Basic.lean:77` | Finite, faithfully flat, central kernel; so μ₂ → 1 (n = 1) qualifies (line 127) |
| `TauCeti.NumberField.Units.mult_abs_log_eq_index_mul_regulator` | `a91d3aa` `Units/Regulator.lean:68`; `2fd255d` `Units/Regulator/Basic.lean:88` | The README cites the latter path (R01) |
| `TauCeti.exists_mem_support_weylGroupToPerm_eq` | `a91d3aa` `Weyl/Orbit.lean:58`; `2fd255d` `Weyl/Orbit/Basic.lean:58` | Every root is Weyl-conjugate to a simple root |
| `RootPairing.card_weylGroup_of_hasCartanType_A`; `parabolic_wallIndices_eq_stabilizer`; `weylCoxeterSystem`; `rationalRootSystem_def`; `Isometry.map_span_vectorsOfNorm` | `2fd255d`: `Weyl/TypeA/Basic.lean:275`, `Weyl/ParabolicQuotient.lean:135`, `Coxeter/Presentation.lean:167`, `Rational.lean:88`, `PosDef/RepresentationNumber.lean:179` | Present at main's pin only (R01) |
| Mathlib `bernoulli_one`, `sum_bernoulli` | `NumberTheory/Bernoulli.lean:204`, `:223` | `B₁ = −1/2`; `∑_{k<n} C(n,k) B_k = if n = 1 then 1 else 0`, so n = 2 is line 535's `B₀ + 2B₁ = 0` |
| Mathlib `riemannZeta_two_mul_nat`, `Filter.limUnder` | `LSeries/HurwitzZetaValues.lean:206`; `Topology/Defs/Filter.lean:265` | The inputs of R03 and R02 |

The other 70 or so backticked library names of the README were located at `a91d3aa` or `2fd255d` by a declaration search. The ones missing at `a91d3aa` are exactly those of R01.

### Cross-roadmap citations resolved

| Citation | Where | Result |
| --- | --- | --- |
| IntegralLattices 0A–0E, 2C, 2G, 3C, 3E, 3I, 4A–4E, 5A, 6C–6G, 7A, 7C, 7E, 7G, 9B, B1–B8, N0, N1 | main README: 2608 (0A–0E native), 2868, 716, 808, 853, 929, 1507, 1537, 1581, 2788, 1660, 1798, 730, 2035, 2110, 2182, 2376, 2395, 2474, 2558, 2657, 1053–1369, 1429, 1468 | All present. The overlaps file's "only #1797 defines" lines are false positives: every label is on main |
| IntegralLattices assigns 4D, 4E (rank ≥ 3), 7B, 7D, 7F, 7H, 7I here | main README 82–88, 120 | Agrees with §§0.3, 1.1–1.3, 2.1–2.3, 3.1, 4.1 |
| OrthogonalSpinGroups Layers 0–3, §3A, §§2B/3B–3D | main `Completed/OrthogonalSpinGroups/README.md` 331–920, 775, 665, 785, 796, 845; `spinToSpecialOrthogonal` native (`CliffordAlgebra/Spin/SpecialOrthogonal.lean`) | Present; §3A assigns the scheme comparison here |
| ReductiveGroups Layers 0, 3, 5, 6, 7a, 8 | main 129, 234, 443, 466, 690, 1023 | Present |
| GlobalNumberFields §9, Layer 11 | main `Completed/…` 508, 571 | Present |
| TauberianBoundaryConvergence N2/N3; ImaginaryQuadraticClassNumber H1.4/H2.2 | main 51/80; 43/57 | Present |
| RootSystems §3.2, Layer 5 (§§5.1–5.3), §6.1 | main 727, 905, 907/944/993, 1037 | Present |
| Rank24LatticeConstructions Layers 3–6; CFSGBasicProperties P2-L; SporadicOrders O1; AlgebraicCodingTheory Layer 5; ReflectionInvariantTheory §§3–4 | main 223/251/293/312; 410, 528; 280; `Completed/…` 240; 40/68 | Present |
| AdelicAlgebraicGroups AA.1–4, AA.2.4, AA.4.2 | #792 head: §1.1–1.5 (980–1383), §2.4 1869 (normalization `|d_F|^{−d/2} ρ_G⁻¹ ∏ λ_v|ω|_v`, `dx`, `2 dx dy`, `vol(𝒪_v) = 1`), §4.2 4070 | Present; AA.1.4 is R03 |
| GeometryOfNumbersAndQuadraticArithmetic §2.4, §3.3, §3.3.7, `orthogonalTamagawa_two`, gauges, `finiteOrthogonalOrder` | #851 head: 580, 1037, 1124 (τ(SO) = 2, rank ≥ 3, number fields), 1141–1152 (`2^(−floor(n/2))` odd, `V₃ = 8π²`, rank-three gauge 4π²), 1211 | Present and consistent with §1.2 |
| ArithmeticStatisticsPartV “Siegel count of indefinite binary quadratic forms”; EndoscopicTransfer… §6.5 | #1175 line 575; #999 line 2167 | Present |

**Ownership against open pull requests.**

- LatticePackingsAndPerfectForms (#1723 head) consumes this roadmap's §4 and masses (lines 111–112, 121, 270–272) and "proves no automorphism order and no class number".
- RootSystemsPartII (#1731 head) has no Weyl-group order statement: 51840, 2903040 and `card_weylGroup` are all absent.
- `MassFormula` on main is Serre's local mass formula, an unrelated object.
- OrthogonalSpinGroups (#1181) and IntegralLattices (#1797) are revisions. The overlaps file finds no id of theirs that this README cites dropped, and no pull request that changes this roadmap.
- No object has two owners.

### Sources: the seeded sample

- **0.0, 0.2, 1.4, 4.3.** No external locator. The supplier and library citations are resolved above.
- **0.1, Milne §24i, pp. 535–537.**
  - The table of contents (line 298) lists "i The spin groups … 535".
  - The text spans lines 22081–22183 (PDF pp. 546–548, printed 535–537): char k ≠ 2 at line 22096; Spin a double cover and the simply connected cover at lines 22129–22136.
  - The README's definition by `g V g⁻¹ = V` and `g ḡ = 1` matches lines 22099–22113.
- **0.1a, Cho §4.1, p.16.**
  - Lines 753–760 give `O(V̄_i, q̄_i)_red`: disconnected in even positive dimension, `= SO` and connected in odd dimension.
  - The other Cho locators also hold: Definition 2.1(c) (line 117, p.3: the zero lattice is of parity type II); §2.3 (line 208, p.5); Remark 2.6 (line 240, p.6, with the I^e₁/I^e₂ assignment at lines 243–256); Remark 2.8 (line 264, p.6); Theorem 3.7 (line 744, p.15); Lemma 4.2 (line 883, p.18: α counts free I^e₁, β counts j with L_j of type I and L_{j+2} of type II); Remark 4.3 (line 889, p.18); Theorem 4.12 (line 1191, p.24); Lemma 5.1 (line 1223, p.24); Theorem 5.2 (line 1249, p.25: `β_L = f^N f^{−dim O} #G̃(κ)/[O:SO]`); Remark 5.3(i) (line 1253, p.25).
  - Cho's ⟨x,y⟩_q = ½(q(x+y) − q(x) − q(y)) (line 94) gives q(x) = B(x,x), as README line 437 says.
- **0.3.** AA.4.2 is at #792 line 4070. O'Meara is uncertified (Not verifiable).
- **1.1, Belolipetsky–Gan §2, pp. 2–3.** Lines 83–139 give the mass as Σ 1/#Γ_α and as ∫ µ_L over G(F)\G(𝔸) with G = SO.
- **1.2.** Belolipetsky–Gan §2, p.3 is lines 103–126 (µ_cpt versus µ_sp, γ_G). Conway–Sloane is not verifiable.
- **1.3, 2.3.** Conway–Sloane is not verifiable. Cho Theorem 5.2, p.25, is above. The displayed formula was checked numerically on E₈, I₃, A₂ and the −23 genus (table below).
- **3.1.**
  - Belolipetsky–Gan Theorem 3.1 is at line 163, p.4 (τ = 2, the γ_G and L(G) factors).
  - λ = 1 for even unimodular lattices is stated at line 451 (p.11) and in Corollary 5.3 (lines 288–290, p.7).
  - Recomputed from Theorem 3.1: the proper mass of E₈ is 2·4320·π¹⁶/((2π)¹⁶·45927000) = 1/348364800 = 2/696729600.
- **3.2.** `bernoulli`, `bernoulli_one` and `sum_bernoulli` were opened (table above).
- **4.1.**
  - Fomin–Reading Figure 2.8 is at lines 913–925, p.24 (header at line 898): Dₙ `2ⁿ⁻¹n!`, E₆ `2⁷3⁴5`, E₇ `2¹⁰3⁴5·7`, E₈ `2¹⁴3⁵5²7`.
  - Chenevier–Lannes Corollaire 3.6 is at line 1589. It is on PDF p.46, whose printed footer at line 1627 reads 41, in Chapter II (line 829).
- **4.2.**
  - Chenevier–Lannes Théorèmes 3.16–3.17 are at lines 1886–1893 (printed footer 48 at line 1897).
  - The Borcherds norm-zero table (lines 5–81) has 24 distinct entries: `/8315553613086720000` for Leech, and `a1.24 /244823040`, `a2.12 /190080`, `a3.8 /2688`, `a4.6 /240`, `a5.4d4 /48`, `d4.6 /2160`, `e6.4 /48`, `d6.4 /24`, `a6.4 /24`, `a8.3 /12`, `a7.2d5.2 /8`, `e8.3 /6`, `d8.3 /6`, `a12.2 /4`, `a9.2d6 /4`, `a24`, `d12.2`, `a17e7`, `d10e7.2`, `a15d9`, `a11d7e6 /2`, `d16e8`, `d24 /1`.

### Adversarial table (computed this round)

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `evenUnimodularMass_eq` | n = 8; n = 16; n = 0 (excluded); n = 4 (excluded) | 1/696729600 = (1/240)(1/24)(1/240)(1/504); M₁₆ = 691/277667181515243520000; at n = 0, mass 1 vs `bernoulliFullMass 0` = `|1/0|` = 0; at n = 4, mass 0 (empty class set) vs (1/24)² = 1/576 | True; both hypotheses needed | none |
| `rank16_classNumber` | the reference pair | 1/970864271032320000 + 1/685597979049984000 = 691/277667181515243520000 = M₁₆ exactly; one term alone is smaller | Exact | none |
| `rank24_classNumber` | 23 rows × the Borcherds factors, plus Leech | Σ 1/(|W|·factor) + 1/8315553613086720000 = 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ exactly | Exact | none |
| `rank32/40_classNumber_lower_bound` | 2M₃₂, 2M₄₀ | 80618465.871 ∈ (80618465, 80618466); 8.786·10⁵¹ ∈ (8, 9)·10⁵¹ | Both hold | none |
| §1.3 / R02 formula, odd rank | I₃: n = 3, D = 1 | 2R₃ = π⁻²; β₂ = 12/2 = 6 (count, r = 3, 4); β_p = 1 − p⁻²; RHS = π⁻²·(1/6)·(π²/8) = 1/48 = 1/|O(ℤ³)| | True | R02 |
| §1.3 formula, E₈ | n = 8, D = 1 | 2R₈ = 135/(8π¹⁶); ∏β_p⁻¹ = 2⁻⁸ζ(2)ζ(4)²ζ(6); product 1/696729600 (float 696729599.99999) | True | none |
| §1.3/§2.3 binary branch | A₂; [[4,1],[1,6]] | β₂ = β₃ = 6 (α = 12 by count); good product (3/2)L(1,χ₋₃) gives 1/12. β₂ = 2 (α₂ = 4 by count), β₂₃ = 46, L(1,χ₋₂₃) = 3π/√23 gives 3/4 = 1/4 + 1/2 | True | none |
| §1.2 scaling Check | tB, p^a ∥ t | α_p(tG) = p^{a n(n+1)/2} α_p(G); ⟨2⟩ vs ⟨1⟩ at 2: 8 = 2¹·4 | True | none |
| §1.2 gauge | V₃, s₃; V₄ | 4π·2π = 8π², ½·8π² = 4π²; 2π²·8π² = 16π⁴; same as GeometryOfNumbers line 1152 | True | none |
| §1.2 local reflection | U at 2, v = (1,1) | s_v = [[0,−1],[−1,0]], det −1, B(v,v) = 2 | True | none |
| §2.2 densities | ⟨1⟩, ⟨2⟩, U over ℤ₂ | Cho: N = 1, 2, 2; #G̃(𝔽₂) = 2, 2, 2; dim O = 0, 0, 1 gives 4, 8, 4. Brute-force counts: 4, 8, 4 | True | none |
| §2.2 filtration Checks | ⟨1⟩⊕⟨2⟩; [[1,1],[1,2]]; [[1,1],[1,0]]; U | A₁ = 2Re₁⊕Re₂, A₂ = 4Re₁⊕2Re₂; dim B₀/Z₀ = 1, 1, 0, 2; types I^e₁, I^e₂ agree with Cho Example 2.7 (γ unit, γ ∈ (2)) | True | none |
| §0.0 Checks | diag(1,2) with A = [[1,1],[0,1]] | AᵀGA = [[1,1],[1,3]]; full order 4 (±e₁, ±e₂), determinant-one 2 | True | none |
| §0.1 Checks | V = 0; ⟨a⟩; x²+y²; four squares; x²+y²+z² | normalizer {±1} vs native `spinGroup` {1} (no invertible vectors); μ₂: 2 geometric points; (3+4i)/5 has norm 1; C⁰ ≅ C(⟨−1,−1,−1⟩) ≅ H×H (z² = 1); spinor norm 1·2 = 2 ∉ ℚ×² | True | none |
| §0.1a Checks | xy, x²+xy+y² on 𝔽₂²; z²+xy; z² over k[ε] | orders 2, 6 (6, 10 at f = 4); 6 = 2(4−1); (1+ε)² = 1; r = 0 even formula gives 0 | True | none |
| §0.2 Check | C = diag(1,4), M = [[0,½],[2,0]] | M C Mᵀ = C; Mᵀ C M = diag(16, ¼); M⁻¹ = M, A = Mᵀ, AᵀCA = C | True | none |
| §0.3 hypotheses | definite rank 16: E₈², D₁₆⁺ | one genus and one spinor genus (unimodular), two proper classes, so `cls⁺ ≠ spn⁺`; indefiniteness is needed | True | none |
| §1.1 Check | k = [[3/5,−4/5],[4/5,3/5]] at 3 | det 1, 9/25 + 16/25 = 1, 5 ∈ ℤ₃×; [(1,1)] ≠ [(1,k)] (rational multiplier 1 at ∞) | True | none |
| §1.4a Checks | A₂; diag(1,1); [[4,1],[1,6]], 2B | (2,−2,2), g = 2, Δ = −3 both ways; (1,0,1), Δ = −4; (4,2,6), g = 2, (2,1,3), Δ = −23; 2B: g = 4, Δ = −23 | True | none |
| §1.4b/c Checks | D = −3, −4, 5, 12; f = 2 | 1 − χ(2)/2 = 3/2; χ(2) = 0; s = 4 gives h⁺ = h, R⁺ = 2R; s = 2 gives h⁺ = 2h, R⁺ = R; h(−12) = 1·2·(3/2)/3 = 1 (3 without the unit index); h/w_f = ½ both sides | True | none |
| §3.2 Checks | B₄, B₃₈, B₁ | −1/30; 2929993913841559/6; 1 + 2(−½) = 0 vs 2 for `bernoulli'` | True | none |
| §4.1 Weyl orders | Dₙ, E₆, E₇, E₈ | 2³·4! = 192 (not 384); 72·6! = 51840; 126·2⁵·6! = 2903040; 240·2903040 = 696729600 | True | none |
| §4.1 walls | θ_E₆ = (1,2,2,3,2,1), θ_E₇ = (2,2,3,4,3,2,1) | pairings 2c_i − Σ_{j~i} c_j: E₆ (0,1,0,0,0,0), so A₅; E₇ (1,0,0,0,0,0,0), so D₆; wrong walls give 138240, 6531840 | True | none |
| §4.2 Checks | 15 D/E rows; A₁²⁴ share; 24! variant; 384 for D₄; Aut(E₆) | 15 rows; 4107449023856640, 3.0675 %; 0.96933·M₂₄; 0.99885·M₂₄; 0.99999573·M₂₄ | Discriminating | none |
| §4.2 Leech | 2·|Co₁| | 2·4157776806543360000 = 8315553613086720000 | True | none |

## Not verifiable

- **Conway–Sloane, *Low-dimensional lattices IV*.** Equations (2), (3), (6) and §9(iv) are cited in §§1.2, 1.3, 2.3 and 3.1. The cached author scan is image-only, and this worker has no OCR. The formulas they locate were checked numerically instead (table above).
- **O'Meara 104:4–5.** Uncertified in the manifest, and settled.
- **Building at main's pins.** The commands this review may run use the branch pins `a91d3aa`/`6b7abb3`. The R01 declarations were read in the `2fd255d` sources, not elaborated.

## Source issues

- none
