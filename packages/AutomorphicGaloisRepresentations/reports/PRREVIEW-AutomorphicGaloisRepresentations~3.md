# Review of AutomorphicGaloisRepresentations (pull request #1007 at 4ac373d)

**Verdict:** needs changes

## R01 (P2) — §§0.2a–0.2f plan QuaternionicModularForms Layers 1–5 a second time

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:74–80`, “The analytic and overconvergent quaternionic forms built on them, with certified Hecke matrices, the compact controlling operator, Fredholm series, slope summands, families and theta classicality, are the targets of §§0.2a–0.2f.” The targets are §§0.2a–0.2f (lines 712–1203), and §0.3 (lines 1205–1336) now consumes them.

**Claim:** QuaternionicModularForms is an open new-roadmap pull request at head f7ed2fe, position 70 in the merge order (this roadmap is at 162). It owns exactly these objects and hands them to this roadmap's §0.3. That gives each object two owners. The text runs section by section in parallel. The `h_U(⌊2h/v_p(π)⌋+2)` bound of §0.2e is QuaternionicModularForms §4.2. Bol's identity, the twisted theta target, the `ℚ(√2)` unit Check and the Neumann-series criterion of §0.2f are its §§5.1–5.3. The weight data, Jacobs's character, the level/radius comparison and the averaging Checks of §§0.2a–0.2c are its §§1.1–1.4 and 2.2–2.3.

**Witness:** `TauCetiRoadmap/QuaternionicModularForms/README.md` at f7ed2fe, lines 36–48, owns analytic weights, level/radius comparison, property (Pr), certified matrices, compactness, Fredholm slopes, Bol's identity and classicality. Lines 1405–1406 say “AutomorphicGaloisRepresentations, §0.3 … use §§1.1–1.4, 2.1–2.3, 3.1–3.3, Layer 4 and Layer 5”.

**Repair:**
- Delete §§0.2a–0.2f. Restore a `### From QuaternionicModularForms` contract, as head d72821d had, citing these sections:
  - §§1.1–1.4: weights, slash action, algebraic weights and stages.
  - §§2.1–2.3: level forms, analytic and overconvergent forms, the level/radius comparison and property (Pr).
  - §§3.1–3.3: Hecke operators, certified matrices, compactness and links.
  - §§4.1–4.3: Fredholm series, coefficient bounds and families.
  - §§5.1–5.3: Bol's identity, theta maps, the determinant identity and classicality.
- In §0.3, replace each reference to §§0.2a–0.2f, §0.2c, §0.2d, §0.2e and §0.2f by the matching QuaternionicModularForms section, and set its *Needs:* line to those sections.
- Restore the supplier in the Scope (lines 74–80), the analytic-supplier paragraph (lines 564–577), the Layer 0 Dependencies (lines 1524–1526) and How to read the build (lines 637–640).
- In §0.3, keep only what is this roadmap's own: the gluing on the full and reduced charts, the comparison with Skinner's operator normalisation, and the totally real application and density.

Tested:
- All sixteen sections named above exist at f7ed2fe: lines 430, 470, 499, 567, 606, 662, 716, 1003, 1050, 1074, 1113, 1137, 1161, 1271, 1298 and 1330.
- QuaternionicModularForms precedes this roadmap in the merge order. The dependency check reported 0 problems at d72821d, which cited it.

## R02 (P2) — GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d are redirects to QuaternionicModularForms

**Location:** `README.md:74`, “GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d owns the algebraic coefficient modules, quaternionic level forms, classical quaternionic forms and their Hecke operators”. Also the contract block at lines 286–297, and the citations at lines 716, 720, 809, 931, 1002, 1201, 1249, 1336 and 1525.

**Claim:** The cited supplier does not make these statements, and it disclaims ownership of them. As a supplier citation, this is drift.

**Witness:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md` at its head 8d94672, lines 83–84: “The identifiers R17.3.8a–R17.3.8d name no target of this roadmap”. Lines 86–92 send them to QuaternionicModularForms §1.3, §2.1, §§2.2–2.3, §0.4 and §3.1. Lines 77–81 name QuaternionicModularForms as the owner.

**Repair:**
- Delete the `**R17.3.8a–R17.3.8d.**` block.
- In the Scope, cite QuaternionicModularForms as owner: §0.4 for local monoids and certificates, §1.3 for algebraic weights and determinant normalisation, §2.1 for level forms, §§2.2–2.3 for classical forms and stabilisers, and §3.1 for Hecke operators.
- In §0.3, replace “§R17.3.8a” at line 1249 by QuaternionicModularForms §1.3.
- In the *Needs:* line at 1336, replace “§§R17.3.8a–R17.3.8d” by QuaternionicModularForms §§0.4, 1.3, 2.1–2.3, 3.1. Keep GL2AutomorphicRepresentationsAndTransfer §§R17.3.9 and R16.6.3; both exist at its head, and R17.3.9 carries the inverse-coset identity.

Tested: QuaternionicModularForms §0.4 (line 382), §1.3 (499), §2.1 (606), §2.2 (662), §2.3 (716) and §3.1 (1003) exist at f7ed2fe.

## R03 (P3) — The four Layer-0 Lean theorems are not headline statements

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/Suggested.lean:50–93`: `norm_averageMap_le`, `lt_of_slope_sum_le`, `bol_identity` and `eq_zero_of_intertwining_of_norm_lt`. Also the docstring at lines 20–23, `README.md:637–640`, and the backticked names at README lines 902, 1034, 1110 and 1157.

**Claim:** Each statement is about one of the following, and none mentions this roadmap's objects (quaternionic forms, `U_P`, `H_κ`):
- an arbitrary ultrametric normed space;
- bare reals and naturals;
- power series over an arbitrary field;
- arbitrary bounded operators.

The headlines of §§0.2c–0.2f and §0.3 are the slope bound, property (Pr) and small-slope classicality on forms. They need the analytic weight action on forms, which is absent at the pins. The rule is to name such a headline in the docstring and state nothing in its place. Under R01 these are also QuaternionicModularForms targets. That roadmap's Suggested.lean deliberately states none of them.

**Witness:**
- `lt_of_slope_sum_le` binds only `hU : ℕ`, `v h : ℝ` and `n : ℕ` (`Suggested.lean:66–68`).
- `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean`, docstring: for small-slope classicality, the analytic weight action and the `U_v` on forms are missing.

**Repair:**
- Delete the four theorems, the `## Layer 0` section comment and the docstring paragraph “Four statements of Layer 0's …”.
- In `README.md:637–640`, say that Suggested.lean states only the §7.7 theorem.

Tested: a scratch copy without the four theorems elaborates with one `sorry` warning. Its `#check` output keeps `[NeZero N]`, `Squarefree N` and `f.χ = 1`.

## R04 (P3) — The stated pins are stale after the merge of main

**Location:** `README.md:192–193`, “The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`”. The same pair appears at `Suggested.lean:10–11`.

**Witness:** `lake-manifest.json` at this head pins mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and TauCeti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The toolchain is v4.36.0-rc2, introduced by merge commit 318894e.

**Repair:** Replace both pairs by `1b1ccf4b…` and `2fd255d9…`.

Tested:
- All 25 library names cited in the README and the Lean file resolve at these pins; they are listed under Verified sound.
- `Subgroup.exists_right_complement'_of_coprime` now states `(Nat.card N).Coprime N.index`. This still matches the README's prose.

## R05 (P3) — The gate's build check failed on module-system warnings

**Location:** `Suggested.lean:1–3`.

**Witness:** `gate.md` records `build=2`: two warnings that the file “imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`”. This follows the toolchain bump of R04. My rerun of the gate on this head reported OK with no build line, probably because the build was cached. The warning is therefore reported on a fresh build only.

**Repair:** Do what main's `TauCetiRoadmap/PDE/Suggested.lean` does (lines 1–8 and 56):
- Begin the file with `module`.
- Write `public import Mathlib` and `public import` for the two Tau Ceti modules.
- Wrap the declarations in `@[expose] public section … end`.

Tested: a scratch copy elaborates under `lake env lean` with only `sorry` warnings.

## R06 (P3) — A locator and a Check inside §§0.2a–0.2c are wrong

**Location:**
- `README.md:782`: “§8, p. 70, for weights as characters of `𝒪_v^×× 𝒪_v^×`”.
- `README.md:924–926`: “When `n_σ+2s_σ` is parallel that unit acts as the identity”.

**Witness:**
- BuzzardEigenvarieties lines 2330–2332 define a weight as such a character on printed p. 65, in §8. Page 70 (lines 2508–2519) is §9's classical forms.
- A scalar `u` acts by `n(u)ν₀(u)²=N(u)^w`. For `F=ℚ(√2)`, `ε=1+√2` (norm −1), `n=(1,1)` and `s=0`, the unit `ε` therefore acts by −1.

**Repair:**
- Change the locator to “§8, p. 65”.
- Change the Check to: “that unit acts by `N(ε)^w=±1` (times a finite-order character value), so the stabiliser still acts through a finite group; `ε=1+√2` with `w` odd acts by −1”.

This finding is moot if §§0.2a–0.2c are deleted under R01.

## Verified sound

### Previous review

The previous review (r2) had one finding: R01 (P3), “Give the ordinary-prime definition discriminating Checks”. **Repaired.** `README.md:3718–3722` adds three Checks:
- 3 belongs to `ordinaryGoodPrimes` because `a₃=−1∉(3)`.
- 19 is excluded because `a₁₉=0∈(19)`.
- 11 is excluded by `11∣N` despite `a₁₁=1`.

I recomputed all three against the Lean definition (`Suggested.lean:100–107`). No finding was marked “not actionable”, so nothing is re-raised.

### Gate, dependencies, Lean

- **Outside-folder diff:** `git diff --stat origin/main...HEAD` touches only the three files in the folder.
- **Dependency check:** the brief's command printed `depcheck: 240 roadmaps, 2455 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Gate:** the worker's gate failed only on build warnings (R05). Every scanner was 0. My rerun printed all checks 0 and `OK`.
- **Elaboration:** `lake env lean` on Suggested.lean gave five `sorry` warnings and nothing else.
- **Signatures:**
  - I compared the six elaborated signatures in `signatures.md` with the README. No binder was lost.
  - I re-ran `#check` for `ordinaryGoodPrimes` and `fixedSquarefreeForm_ordinary_density_one` on the R03 scratch copy; both are unchanged.
  - `eq_zero_of_intertwining_of_norm_lt`'s hypothesis `‖c‖<‖μ‖` with `c=τ(ϖ_v)^{r_τ}` is equivalent to `v_p(μ)<r_τ/e_v`, matching §0.2f.
- **One-tactic probe:** I tried `simp`, `rfl`, `infer_instance`, `simp_all`, `norm_num`, `aesop`, `positivity` and `decide` on all five theorems, 40 attempts. All failed with genuine tactic errors. R03 rests on the “no roadmap objects” criterion, not on one-tactic closure.

### Seeded source sample

All 15 targets were checked. Each source was fetched legally through the sources service, and line numbers below are those extractions.

| Target | Source, lines, locator | Result |
|---|---|---|
| 0.2c | BuzzardEigenvarieties 2726–2727: Prop. 11.1, p. 75; its hypothesis that `n` thickens to radius `r|π^{s+t}|`, with `U=U′×GL₂(O_p)`, is at 2719–2721. Lemma 12.1, p. 78 (2842). §10 starts at 2531. Loeffler 691–695: Assumption 3.1.3 and Prop. 3.1.4, p. 15. | Supported as stated. The §0.2a locator p. 70 is wrong (R06). |
| 0.2e | No external locator. The counting identity `∑_{j<n}⌊j/h⌋=hm(m−1)/2+ρm` was checked algebraically. CompactOperators §§1.2 and 1.4–1.7 exist on main. | Correct. |
| 0.2f | BuzzardFamilies 858–909: θ map at pp. 18–19, Bol's identity at 881–884 (p. 19), Proposition 4 at 893–909 (p. 19). Buzzard's identity with `F=z^{j+r}` gives exactly the README/Lean formula. | Correct. |
| 0.3 | BuzzardEigenvarieties §5 (from line 1091): Lemma 5.4 at 1294 (p. 37), Construction 5.7 at 1428 (p. 41) and Lemma 5.10 at 1473 (p. 42) lie within the cited pp. 33–42. Lemma 12.2 at 2880 (p. 78); Lemma 13.1 at 2920 (p. 79). Skinner2009 518–655: §2.4.2, pp. 253–255. | Correct. |
| 2.2 | DeligneSerre 482–504: Prop. 5.5, pp. 519–520; Remark 5.6, p. 520. The bound holds at every embedding (490–491). | Correct. |
| 3.3a | Carayol 770–807: §§5.4–5.6, pp. 428–429. It has the three spherical cases, the quadratic `α` and strong multiplicity one. | Correct. |
| 3.8 | Carayol 1779–1797: 12.1.3, p. 456. The cubic extension is Galois in the tetrahedral case and not in the octahedral case; the lemma needs equal determinants. | Correct. |
| 3.13 | ConradHecke 306–335: the second Lemma 1, pp. 9–10, which assumes `ψ(W_v)⊂L^×`; §3.13 proves that. Skinner2009 684–691: Remark, p. 256. | Correct. |
| 4.1 | Saito2009 592–604: Theorem 2 and its Remark, p. 13, with Theorem 0's hypotheses at 487–490. SaitoWM 82–90: Theorem 1, printed p. 429, read from the OCR text. | Correct. |
| 6.2 | DDT 3222–3232: “Mod ℓ representations”, p. 87. | Correct. |
| 6.3 | DDT 1581: Lemma 1.39, p. 42. 3932–3937: p. 107. 4032: p. 109. 4066: p. 110. | Correct. |
| 6.5 | DDT 3368: Theorem 3.15, p. 91. 3456: Lemma 3.24, p. 93. | Correct. |
| 6.6 | DDT 3484: Lemma 3.26, p. 94. 3496: Lemma 3.27, p. 94. 3528: Example 3.28, p. 95. | Correct. |
| 6.8 | DDT §4.1, pp. 109–110. Chenevier 254–452: §1.1 p. 7, §1.5 p. 9, §1.10 p. 12. Theorem 2.22 is at 1404, p. 34. | Correct. The Kisin DVI was not opened. |
| 7.4 | Dimitrov 1008, 1123 and 1169–1172: Props. 3.1 (p. 22), 3.5 (p. 24) and 3.8 (p. 25), with standing hypothesis `p>k₀`, `p∤6Δ` (1004). NewtonThorneHilbert 1904–1907: proof of Lemma 5.7, p. 41. | Correct. |

### Adversarial table

| Statement | Instances | Values on each side | Result / change |
|---|---|---|---|
| `norm_averageMap_le` | `C₂` by sign on `ℚ₂`; trivial `C₂` on `ℚ₃`; trivial `C₂` on `ℝ` | Sign: the average is 0, below `2‖x‖`. On `ℚ₃`: `‖x‖≤1·‖x‖`, equality. On `ℝ`: `‖x‖` is not `≤½‖x‖`, so the ultrametric hypothesis is necessary, and it is present. | True. Delete (R03). |
| `lt_of_slope_sum_le` | `(hU,v,h)=(2,1,1)`; `(1,1,3/2)`; `h=−1`; grid `hU≤6`, `n<400`, 46 values of `h` | `(2,1,1)`: the partial sums are 0,0,1,2,4,6,9, so the largest admissible `n` is 6, below the bound 8. `(1,1,3/2)`: largest `n=4` (6≤6), below 5. `h=−1`: only `n=0` is admissible, below `2hU`. Grid: 0 counterexamples. | True. Delete (R03). |
| `bol_identity` | `(1,0,1,1)`, `r=2`, `j=0`; `r=0`; characteristic 2; `c=0`; five tuples with `j,r≤3` | Both sides are `2/(z+1)³`. At `r=0` the identity is trivial. In characteristic 2, `descFactorial 2 2=2=0`, and the left side `2(ad−bc)²/L³` is also 0. Exact series comparison: 0 mismatches. | True. Delete (R03). |
| `eq_zero_of_intertwining_of_norm_lt` | `U=μ`, `U′=1`, `Θ=id`, `c=μ` on `ℚ_p` | All hypotheses hold except `‖c‖<‖μ‖` (the norms are equal), and `f=1` gives `Θf=1≠0`. So the strict inequality is necessary. `μ=0` is excluded because `‖c‖<0` is impossible. | True. Delete (R03). |
| `ordinaryGoodPrimes` | 11a1 at `p=3`, 19 and 11 | `−1∉(3)`, so 3 is in. `0∈(19)`, so 19 is out. `11∣11`, so 11 is out. | Matches the new Checks. |
| `fixedSquarefreeForm_ordinary_density_one` | 11a1; a degree-2 field at `p=5`; 32a | 11a1: for `p>4`, nonordinary means `a_p=0`. Degree 2 at `p=5`: if every `λ` is nonordinary then `25∣N(a₅)`, but `|N(a₅)|≤20`, so `a₅=0`. 32a has level 32, not squarefree, so it is excluded. | The “some `λ`” quantifier is correct. |
| §0.2c index | `p=3`, `t=1`, `s=1`; `t=0` | `[Γ₀(3):Γ₀(9)]=12/4=3=q^s`. At `t=0`, `[SL₂(ℤ):Γ₀(3)]=4≠3`, so `t≥1` is needed; it is assumed. | Correct; moves to QuaternionicModularForms §2.2 (R01). |
| §0.2c unit Check | `ℚ(√2)`, `ε=1+√2`, `n=(1,1)`, `s=0` | The action is `N(ε)^w=−1`, not 1. | Check false (R06). |
| §0.2c averaging Check | `C₂` acting by −1 on `ℤ₂` | `½∉ℤ₂`; the invariants are 0; modulo 2, everything is invariant. | Correct. |
| §0.2e identity and Checks | `n=7`, `h_U=2`; `∏(1−p^jT)`; `exp(3w)−1` | 9 by direct sum and 9 by the formula. The minimal valuation `n(n−1)/2` is attained uniquely. Coefficient valuations are `v₃=1,2,2,…`, so the Gauss norm is 1/3. | Correct. |
| §0.2f cutoff | `n=0` over ℚ with one class; `e_v=2` | The constants have eigenvalue `p`, slope 1=`r`, and `H=(1−pT)H′(pT)`. The cutoff becomes 1/2 when `e_v=2`. At `v_p(μ)=r`, `μ/p^r` is a unit and the Neumann series diverges. | Correct. |
| §0.3 Check | `U=1+J`, `J²=0≠J` | `K[U]≅K[x]/(x−1)²`, with reduction `K`. | Correct. |
| §2.2 | `2+√3` | Its powers are unbounded at `σ₁` and tend to 0 at `σ₂`. | Bounding every embedding is needed, as stated. |
| §3.3a | 11a1 at 3; `ξ₁/ξ₂=−1` | The polynomial is `X²+X+3`, determinant 3. The two determinants `−q` and `q` differ by the quadratic `α`. | Correct. |
| §3.8 | `A₄` vs `S₄`; cubic `χ` | `V₄` is normal of index 3 in `A₄`; `D₈` has index 3 in `S₄` and is not normal. `det(σ⊗χ)=det σ·χ²≠det σ`. | The determinant hypothesis is needed. |
| §3.13 | `ε₃` over ℚ; CM over `ℚ(i)` | `m=1`, degree −1; the inertia image `ℤ₃^×` is uncountable; the CM exponents are unequal. | Correct. |
| §4.1 | `w_S=2` | Saito's kernel and cokernel weights are 0 and 2. For `ρ=σ^∨⊗ε⁻¹` the weights are `1=w+1`, `0=w` and `2=w+2`. | Correct. |
| §6.2 | 11a1 at 5 | `(X−1)(X−2)≡X²+2X+2` modulo 5. | Correct. |
| §6.3 | Level 88; `N≤10` | The element `u(u²+2u+2)` is nonzero with zero square. `S₂(Γ₀(N))=0` for `N≤10`. | Correct. |
| §6.5 | 11a1 at 7 | The discriminant is `−4≡3`, a nonsquare modulo 7. | Correct. |
| §6.6 | 57B modulo 3 | `T_Σ/3T_Σ≅𝔽₃[ε]/ε²`, since `(3,0)²=3·(3,0)`. | Correct. |
| §6.8 | `diag(1+ε,1)`; `E₁₁`, `E₂₂` | The determinant is `1+ε`, not 1. The cross coefficient is 1 in every characteristic. | Correct. |
| §7.4 | `SL₂(𝔽₃)⊂GL₂(𝔽₉)` | Order 24 against 720. | The subfield formulation is needed, as stated. |
| Conventions | Twisted 11a1 at 3 | `(t,s)=(−3,9)` gives `X²+3X+27`. | Correct. |

### Library declarations at the current pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d)

Opened with file and line:
- `Representation.averageMap`: `Mathlib/RepresentationTheory/Invariants.lean:126`.
- `Representation.isProj_averageMap`: same file, line 141. Both require `Fintype G` and `Invertible (card G)`.
- `Matrix.charpolyRev`: `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:290`.
- `PowerSeries.derivative`: `Mathlib/RingTheory/PowerSeries/Derivative.lean:50`.
- `Nat.descFactorial`: `Mathlib/Data/Nat/Factorial/Basic.lean:332`.
- `IsUltrametricDist`: `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`.
- `NumberField.Set.HasNaturalDensity`: `TauCeti/NumberTheory/ArithmeticDirichletSeries/NaturalDensity.lean:96`.
- `TauCeti.CoefficientField`: `…/Newforms/Fields.lean:48`.
- `HeckeRing.GL2.EigenformAwayFromLevel` and `HeckeRing.GL2.Newform`: `…/Newforms/Newform.lean:84,104`.
- `TauCeti.det_tateModuleGaloisRepresentation`: `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52`.
- `TauCeti.LSeries.landau`: `TauCeti/NumberTheory/LSeries/Landau.lean:296`.

Resolved by `#check`: `Matrix.card_GL_field`, `Representation.IsSemisimpleRepresentation`, `Matrix.reverse_charpoly`, `Submodule.restrictScalars`, `Subgroup.exists_right_complement'_of_coprime`, `NumberField.Embeddings.finite_of_norm_le`, `Matrix.det_fin_two`, `DualNumber.eps`, `DirichletCharacter.LFunction_apply_one_ne_zero` (with `[NeZero N]` and `χ≠1`), `riemannZeta_residue_one`, `nonempty_sections_of_finite_inverse_system`, `ModularForm` and `CuspForm`. That makes 25 names in all.

### Cross-roadmap citations resolved

- **On main:**
  - RestrictedPowerSeries §§0.1, 1.1–1.3, 2.2–2.4.
  - PadicFunctionalAnalysis §§0.3, 0.4, 1.1, 2.2, 4.1–4.6, 5.2–5.5.
  - CompactOperators §§0.1–0.3, 1.2, 1.4–1.7, 3.1–3.5, 4.3, with `IsRowCompact` and `c0_completedBaseChange`.
  - NewtonPolygons Layer 2; AdicSpacesPartII R0.5; RigidAnalyticGeometry Layers 1 and 6.
- **At open heads:**
  - LocallyAnalyticDistributions §§4.2, 4.15, 4.16.
  - AdelicAlgebraicGroups §5.3 *definite-quaternion-stabilizers*.
  - HilbertModularVarietiesAndShimuraCurves §R18.5.16b.
  - GL2AutomorphicRepresentationsAndTransfer §§R16.1.8, R16.3.2, R16.4.4, R16.6.3, R17.1.2, R17.3.9, R17.4.3, R17.4.13, R17.4.17, R17.5.15. Its R17.3.8a–R17.3.8d are the subject of R02.
  - SerreWeightAndLevelOptimisation §§2.10, 2.13, 4.7, 4.8.
- **Ownership against open roadmaps:** I checked QuaternionicModularForms (R01, R02), PadicFamilies, AutomorphicGaloisRepresentationsPartII and SerreWeightAndLevelOptimisation.
  - PadicFamilies, later in the merge order, consumes §0.3 as its quaternionic instance.
  - Only QuaternionicModularForms and this roadmap state Bol's identity and theta classicality (`roadmaps grep`).
  - No fully qualified name in Suggested.lean collides with another roadmap.
- **Headlines:** all seven headline groups are named in the module docstring with their missing carriers. Only the §7.7 density theorem is statable, and it is stated.

## Not verifiable

- Jacobs's thesis, cited in §§0.2a and 0.2d: not fetched; it is not in the seeded sample.
- Kisin's DVI author copy, secondary for §6.8: not opened this round.

## Source issues

- **Misprint** in Skinner2009 at the Remark, printed p. 256: the source says `L(π⊗ψ₂⁻¹,s)` has a pole at `s=1`; it should be at `s=1/2` (equivalently `L(π⊗ψ₂⁻¹,s−1/2)` at `s=1`), matching its displayed identity; affects nothing.
- **Gap** in Skinner2009 at the Remark, printed p. 256: the source equates full L-functions and calls `L(ψ₁/ψ₂,1)` nonzero; the identity holds for partial Euler products, and equal exponents and characters give a pole; affects nothing.
