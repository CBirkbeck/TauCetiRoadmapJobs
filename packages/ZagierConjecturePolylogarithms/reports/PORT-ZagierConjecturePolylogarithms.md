# PORT-ZagierConjecturePolylogarithms

- **Branch:** `roadmap/zagier-conjecture-polylogarithms`, from `d68af47`.
- **Head commit:** `eaf907bd`, "ZagierConjecturePolylogarithms: roadmap (README, Suggested.lean, metadata)".
- **Files:** `TauCetiRoadmap/ZagierConjecturePolylogarithms/{README.md,Suggested.lean,metadata.toml}`; nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.ZagierConjecturePolylogarithms.Suggested` ends with:

```text
Build completed successfully (18239 jobs).
```

There are two warnings, both `declaration uses 'sorry'`:

- `Suggested.lean:133:8`, `zagier_four_exists`;
- `Suggested.lean:144:8`, `zagier_four_everyFamily`.

Lake also prints its advisory "imports `Mathlib` … consider adding `module`". Every roadmap file that uses the plain `import Mathlib` prints it, and the gate classifies it as advisory, not as a lint.

## Gate

```text
gate ZagierConjecturePolylogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable`), on the final README:

```text
depcheck: 257 roadmaps, 2441 edges, 0 problem(s)
```

It shows no UPWARD, CYCLE or `moved:` line.

Citation resolver (`roadmaps resolve`) on the final README: no cross-roadmap citation and no Lean name is found nowhere.

## Draft pull request body

This roadmap proves Zagier's conjecture in weight four for every number field, following Goncharov and Rudenko. For every number field `F` there are `r₂` explicit weight-four cycles whose zeta-normalized `L₄` determinant is a nonzero rational multiple of `ζ_F(4)`. Every family of explicit weight-four cycles gives a rational, possibly zero, multiple. It is Polylogarithms, Part II. Polylogarithms defines the explicit trilogarithm group, the inductive Bloch groups, the Zagier determinant and the explicit weight-four cycles, and leaves the weight-four theorem to this roadmap. On that base, with PolylogarithmFunctions, K3BlochGroups and BorelRegulators, this roadmap builds the weight-four theory the proof needs:

- the specialized presentations `L₃` and `L₄` of single and double symbols;
- the type-A cluster polylogarithm maps on Stasheff polytopes, which show that the weight-four cobracket is well defined;
- the weight-four Lie coalgebra with its extension `0 → B₄ → L₄ → Λ²B₂ → 0`;
- framed mixed Hodge–Tate structures with their canonical real period;
- motivic and Hodge correlators on punctured lines, and the realization of the combinatorial Lie coalgebra by them over number fields and in families over complex varieties;
- the Grassmannian configuration chain map, the combinatorial lift of the Grassmannian tetralogarithm to `L₄` and the polylogarithmic Chern cocycle;
- the map `κ: K₇(F)_ℚ → ker δ₄` and its comparison with Borel's regulator.

`Suggested.lean` states the two end theorems, `zagier_four_exists` and `zagier_four_everyFamily`, on native carriers. For fields with a complex place, the existence statement rests on three steps of the combinatorial lift (§5.7) that no cited source proves. The README states them as proof obligations of the roadmap; the every-family statement does not use them.

## Dependencies that are still pull requests

All are earlier than this roadmap in the merge order. Their line numbers in the merge order are given in brackets; this roadmap is on line 349.

- Polylogarithms (329)
- K3BlochGroups (149)
- BorelRegulators (325)
- MotivicEtaleKTheory (148)
- PeriodsAndSpecialValues (347)
- MotivesAndAlgebraicCycles (99)
- MixedHodgeModulesAndIrregularHodgeTheory (281)

On main: PolylogarithmFunctions, SchemeKTheoryOperations and HodgeStructures (under `Completed/`). FukayaTheory, also on main, is named only to separate its associahedra from the Stasheff complexes here; it is not a supplier.

No id this README cites is defined only by an open revision. No open pull request drops a cited id or changes this roadmap (the job's overlap ledger).

## What moved from the Lean file to the README

Nothing moved. The package's `Suggested.lean` already had the required form:

- one module docstring in the required shape, naming the five groups of headline results that are not statable and the carrier each lacks;
- the two headline theorems;
- the eight definitions with real bodies that the headlines need;
- `import Mathlib` only, with no `TauCeti.*` module used;
- no `set_option`, padding, `example` or sorry'd data.

One docstring was corrected (fix 3 below); no statement changed.

### Mechanical signature check

I appended `#check @…` for all ten declarations to the file, built the module once with the brief's `lake build` command, and then restored the file. All ten elaborated types are identical to those in the job's list of elaborated signatures:

- `[Field F]` is on `unitVector`, `trilogCyclic`, `TrilogRelationFunction` and `IsCycle4`;
- `[AddCommGroup V] [Module ℚ V]` is on `TrilogRelationFunction`;
- `[Field F] [NumberField F]` is on `periodMatrixFour`, `zagierDeterminantFour` and both theorems;
- `∀ j, IsCycle4 (c j)` is on `zagier_four_everyFamily`.

Each type agrees with README §6.4, and no binder was lost.

### Restated definitions against their suppliers

The suppliers' Lean files have the same bodies:

- `unitVector`, `trilogCyclic` and `TrilogRelationFunction` match Polylogarithms at its head.
- `polylog` and `singleValued` match PolylogarithmFunctions on main, including its endpoint branches.
- `zagierDeterminantFour` is Polylogarithms' `normalizedPeriod` at `n = 4`, with the complex places as rows: `π^(4(N − r₂)) = π^(4(r₁+r₂))`.

No declaration shares a fully qualified name with a roadmap I can read; all of ours are in the namespace `TauCetiRoadmap.ZagierConjecturePolylogarithms`.

## Supplier replacements and duplication removals

1. **Goncharov's form `ω_n` is Polylogarithms §5.4's `r_{n−1}`, rescaled.** I proved `ω_n(log|f₁|,…,log|fₙ|) = (−1)^{n−1}2^{1−n} r_{n−1}(f₁,…,fₙ)` for every `n` from the two definitions:
   - Write `∂log|f| = (a+b)/2` and `∂̄log|f| = (a−b)/2`, with `a = dlog|f|` and `b = i·d arg f`.
   - After alternation, a monomial in the last `n − 1` slots depends only on its number `k` of factors `a`. The total coefficient of `k` has generating function `2^{1−n}Σ_j(−1)^j(t+1)^j(t−1)^{n−1−j} = (−1)^{n−1}2^{1−n}Σ_{i odd}binom(n,i)t^{i−1}`.
   - So only even `k = 2j` survive, with coefficient `(−1)^{n−1}2^{1−n}/((2j+1)!(n−2j−1)!)`. These are `r_{n−1}`'s coefficients times that factor.
   - Direct expansion confirms the cases `n = 2, 3, 4`: `−1/2`, `1/4` and `−1/8`.

   Edits:
   - §3.7 states the identity with this argument. It takes alternation, multiplicative additivity, the differential (also [G08] Lemma 2.3) and convergence of the currents from Polylogarithms §5.4, and adds Polylogarithms §5.4 to its *Needs*.
   - The Polylogarithms bullets of "Scope and ownership" and of the supplier contracts record that this is imported.
   - §5.4's *Needs* now cites Polylogarithms §5.4.
   - Two Checks were added. In §3.7: `ω₂ = −r₁/2`, and `r₃ = −i log 2`, so `ω₄ = (i/8)log 2` on the four-unit test. In §5.4: Polylogarithms' `dη(t,u) = −2π log|u|(δ₀−δ_∞)` gives `dω₂ = πi·log|u|(δ₀−δ_∞)`, the residue constant `πi`.

   `ω_n` stays written as [G08]'s multilinear form in real functions, because the current computation of §5.4 applies it to real arguments other than `log|f|`.
2. **`blochWigner_fiveTerm`.** The supplier contract said "for distinct `x,y ∈ ℂ∖{0,1}`". PolylogarithmFunctions §5.7 and its `Suggested.lean` state it for all nonzero `x, y`; corrected.

### Duplication sweep

The sweep was done by object, with `roadmaps grep -i --readme-only`, over main and every open head. Results:

- **Owned by no other roadmap:** Hodge correlators, scissors congruence, Grassmannian polylogarithm or tetralogarithm, framed mixed or Hodge–Tate objects, cluster polylogarithms, special derivations, Grassmannian group or bicomplex, and polylogarithmic Chern cocycles.
- **Found only in Polylogarithms:** motivic correlators, the Bigrassmannian, decorated flags and Lie coalgebras. Polylogarithms is cited for its §3.4 (flags and the Bigrassmannian); everything else of these is owned here, as its scope paragraph says.
- **Stasheff and associahedra:** they occur elsewhere only as `A∞` identities (DGAInfinity and others), Milnor–Stasheff references and FukayaTheory's disc moduli, which the scope section already separates from the combinatorial Stasheff complexes here.
- **Configuration complexes:** found in K3BlochGroups, as point configurations for `K₃`, and in Polylogarithms §3.4; neither is the weight-four Bigrassmannian of §4.1.

The job's library near-match list (Loogle and LeanSearch): no pinned declaration states any target. I checked the following Mathlib names in pinned Mathlib `1b1ccf4`; each exists at the stated file:

- `Finsupp.linearCombination`, `Submodule.mkQ`, `TensorProduct.lift`;
- `ExteriorAlgebra.exteriorPower`, `exteriorPower.ιMulti`;
- `Matrix.det_isEmpty`, `Matrix.det_mul`;
- `FreeLieAlgebra`, `LieDerivation`, `groupHomology`;
- `CategoryTheory.ProjectiveResolution` and its `lift`;
- `NumberField.dedekindZeta`, `InfinitePlace.embedding`, `InfinitePlace.IsComplex`;
- `bernoulli_one`, whose value is `−1/2`.

In pinned Tau Ceti `2fd255d`, the following exist as described:

- `TauCeti.Hodge.MixedHodgeStructure` (`Geometry/Hodge/Mixed/Basic.lean:72`): weight filtration, Hodge filtration and purity of graded pieces, as described;
- `TauCeti.Hodge.MixedHodgeStructureCat` (`Mixed/Category.lean:56`) and its instance `abelian` (`Mixed/Abelian.lean:33`);
- `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F` (`Mixed/Strictness.lean:110`);
- `TauCeti.Hodge.tate` (`Tate/Basic.lean:93`), of weight `−2m`.

### Supplier citations resolved

Each was checked at the head or on main.

- **Polylogarithms (open)**
  - Sections: §§2.1, 2.2 (its "Rational primitive K-theory adapter"), 3.1–3.7, 4.1–4.7, 5.1, 5.2, 5.4, 5.5 and 5.9.
  - Declarations: blochWignerDesc, stableK_hurewiczPrimitive, trilogGroup, `IsCycle3`, `FiveTermFunction`, genericVectorConfig, stabilizedConfigurationComparison, zagierPeriod_calibration, explicitRawCycleFour, cycleObstruction and zagierExistence_totallyRealEven.
  - Formulas: `r₄`, `r₅` and `r₆ = 18M₃` as quoted.
- **K3BlochGroups (open):** §§3.2–3.5, 3.8 and 4.21. preBloch_rationalSpecialization needs `|k| ≥ 4`, as quoted.
- **BorelRegulators (open):** §§1.1 (Tate-divided coordinates, dividing by `(2πi)^(n−1)`), 2.2, 2.3, 5.3, 5.4 (`π^(dₙ−Nn)`), 6.0a and 6.2 (`r_Bo = −2r_Be`).
- **MotivicEtaleKTheory (open):** §§3.3, 3.4 and 7.1.
- **PeriodsAndSpecialValues (open):** PS.3.0, PS.9.3, PS.9.8, PS.9.9 and PS.9.10.
- **MotivesAndAlgebraicCycles (open):** §3.6, Layer 4 and §§6.1–6.3. It was read with `roadmaps show`, since it is not in the brief's path list.
- **MixedHodgeModulesAndIrregularHodgeTheory (open):** §§3.1–3.3, 4.6, 5.1 and 5.3.
- **On main:**
  - SchemeKTheoryOperations §6.7 contains van der Kallen's theorem. A ring with `R/Jac(R)` semisimple has `e = 1`, so the stabilization is bijective for `n ≥ 2m + 1`; that gives `n = 15` for `m = 7`.
  - PolylogarithmFunctions §§1.1, 4.2, 4.6, 4.7, 5.1, 5.2 and 5.7, with `blochWigner_fiveTerm`.
  - HodgeStructures Layer L2.

The five declared supplier contracts are kept in the house form ("What X must provide (gap:…)") that roadmaps on main use:

- trilog-specialization-closure, from Polylogarithms §3.1;
- decorated-flag-lengths, from Polylogarithms §3.4;
- mixed-tate-number-fields, mixed-tate-hodge-realization and punctured-line-path-torsors, from PeriodsAndSpecialValues.

None asks for what the supplier's head already states.

## Fixes from reading the README as an upstream reviewer

1. §3.7, the supplier contracts and Scope: Goncharov's `ω_n` is identified with Polylogarithms §5.4's `r_{n−1}` (above). This removes a second plan of the same forms and ties the residue constant `πi` of §5.4 to the supplier's own Check.
2. The `blochWigner_fiveTerm` hypotheses were stated more narrowly than the supplier states them (above).
3. In `Suggested.lean`, the `singleValued` docstring said `Lₙ(1) = ζ(n)` for every odd `n`. At `n = 1` the branch returns `(riemannZeta 1).re`, a junk value, and `L₁(1)` is undefined. The docstring now says "odd `n ≥ 3`" and names the `n = 1` branch as junk that no statement uses (only `n = 2, 3, 4` occur).

## Adversarial pass

These rows were computed in this job; the numerical ones come from my own Simpson quadrature of `Liₙ(z) = ((n−2)!)⁻¹∫₀^∞ u^{n−2}(−log(1 − z e^{−u})) du`, written for this job. Sections whose text is unchanged and whose values I did not recompute rely on the computed tables of the accepted review rounds. Those are §§2.3–2.5, 3.4–3.5, 3.10–3.13 (except the rows below), 4.1, 4.3–4.8, 5.3 and 5.5–5.10.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `ω_n = (−1)^{n−1}2^{1−n}r_{n−1}` (new) | `n = 1,…,4` by expansion; general `n` by generating function | `n=2`: `(1/2)[(t−1)−(t+1)] = −1` vs `−2^{-1}binom(2,1) = −1`; `n=4`: class totals `−4/8, −4/8` vs `−binom(4,1)/8 = −binom(4,3)/8 = −1/2`; odd `k`: `0` | holds for all `n` | §3.7 text, Checks |
| §3.7 four-unit value | units `2,y,z,w` at `y=z=w=1` on angular vectors | `r₃ = (1/6)log2·i³·6 = −i log 2`; `ω₄ = −r₃/8 = (i/8)log 2`, which matches the README's direct value | consistent | new Check |
| §5.4 residue constant | `ω₂(log|t|,log|u|)`, `u` constant | `ω₂ = −(i/2)η`; Polylogarithms `dη = −2π log|u|(δ₀−δ_∞)`; so `dω₂ = πi log|u|(δ₀−δ_∞)` | `πi`, as stated | new Check |
| §3.1 `d² = 0` on `D₃₁` (sign of `Λ²B₂`) | `ℚ(i)`, `x = −7/9 − 8i`, `y = −2 + 3i`, functional `D(w)(log|a|ord₃b − ord₃a log|b|)` | tensor terms `−0.5011330524`, `Λ²B₂` term `+0.5011330524`, sum `5.5·10⁻¹⁴`; opposite rule `−1.0022661048` | as stated | none |
| §5.1 diagonal equation, weight 4 | `z = 2+i`, `0.3+0.7i`, `−1.5+0.4i`, both coordinate directions, central differences | `∂ₓL₄*` vs RHS: `−0.0685634280/−0.0685634279`, `−0.0972228760/−0.0972228781`, `0.0479003658/0.0479003656`; `∂_y`: `0.1059643576/0.1059643574`, `0.0659723101/0.0659723079`, `0.1674121963/0.1674121966` | holds | none |
| §5.1 at `z = i` on `∂θ` | `Re Li₃(i) = −3ζ(3)/32`, `L₃*(i) = −9ζ(3)/256` | `dR(S₄) = (2/5)i(−15ζ(3)/512) = −3iζ(3)/256`; `R([z]₃⊗z) = (2/5)(5/6)L₃*·i`, the same value | holds | none |
| §5.1 weight 3 at `z = i` | `dL₃(∂θ) = −D(i)` | `dR(S₃) = D(i)/4 = 0.2289914`; `R([z]₂⊗z) = −(1/3)(3/4)(iD(i))(i) = D(i)/4` | holds | none |
| §5.1 `µ` on weight-4 forms | types of 1- and 2-forms | 1-forms: `binom(5,2) = binom(5,3) = 10`; 2-forms: `4, 6, 4`; `xA+y(A+M)… ⇒ (5/24, 1/24)`; angular `(2,1,1)`: `A = −1/2`, `M = 1/2`, `µ = −5/24` | as stated | none |
| §5.2 calibration needs the cycle hypothesis | `[2+i]` | `D(2+i) = 0.5116664`, `log²√5 = 0.6475726`, product `0.3313411`; `L₄*(2+i) = 0.1462942` vs `(5/16)L₄(2+i) = 0.1393913`; difference `0.0069029 = 0.3313411/48` | as stated | none |
| Conventions: `L₄` odd under inversion and conjugation | `z = 2+i` | `L₄(z) + L₄(1/z) = 1.6·10⁻¹³` | holds | none |
| §6.4 `zagierDeterminantFour`, `ℚ` | `r₂ = 0`, empty determinant | `π⁴/ζ(4) = 90.0` | `q = 90` | none |
| §6.4 `zagierDeterminantFour`, `ℚ(i)` with `[i]` | `|disc| = 4`, `L₄(i) = β(4)` | `L₄(i) = 0.98894455174`, `β(4)` series `0.98894455174`; `π⁴β(4)/2 = 48.16609493406502 = 45ζ(4)β(4)` | `q = 45` | none |
| `zagier_four_everyFamily` degenerate | zero column; `[i]+[−i]`; conjugate embedding | `0`; `β(4) − β(4) = 0`; row negated | `q = 0, 0, −q` | none |
| `singleValued 4 2` (sign of `B₁`) | lower boundary values, `L = log 2` | `π L³(−1/6 + 1/2 − 1/3) = 0`; quadrature at `2 − i0`: `−1.2·10⁻⁵`, at the singular endpoint | `0` | none |
| `singleValued 3 1`, `n = 1` branch | endpoint branch | `ζ(3)`; at `n = 1`, `(riemannZeta 1).re` is junk | docstring scope | docstring |
| `trilogCyclic`, `TrilogRelationFunction` with `b = L₃` | `(2,3,5)`, `(−2,1/2,3)`, `(3/10,−7/10,3/5)`, `(1,1,1)`; `A↔B` swapped; sign of `b(A/d)` flipped | `4.4·10⁻⁸`, `8.7·10⁻⁹`, `−5.0·10⁻⁸` (quadrature accuracy), `9·10⁻¹³`; swap `−0.5210414`; flip `5.9610646` | relation holds; the two wrong variants fail | none |
| `trilogCyclic` constant `b ≡ v` | sign count | `5 − 3 = 2` per block, `3·2v + v = 7v`; at `a=c=d=1` the block is `b(1) + b(−1)` | as stated | none |
| §3.2 / `IsCycle4` on `[2]`, `[1]` | `L₃ ⊗ ord₂` | `L₃(2) = 1.0517998` vs `7ζ(3)/8 = 1.0517998`; `u(1) = 0` | `[2]` is not a cycle, `[1]` is | none |
| §1.7 `L₃(3) = L₃(1/3)` | quadrature | `0.91427944` both | `≠ 0`, as stated | none |
| Three-term relation with `[1]` | `x = 2` | `L₃(2) + L₃(−1) + L₃(1/2) = 1.0518 − 0.9015 + 1.0518 = 1.2021 = ζ(3)` | endpoint retained | none |
| §1.1 normalizations | `Z(0,…,5)`; `s(∞,1,0,x)`; `s(∞,0,1,x)` | `−(−1)³/((−1)(−1)5) = 1/5`; `x`; `1−x` | as stated | none |
| §1.4 (33) at `x = −1` | `1 − x⁻¹ = 1 − x = 2` | `−2S₄(2) + S₄(−1)` | as stated | none |
| §1.5 inverse | `D₂₁(2,3)`; `D₂₁(1,3)` | `[1/2]+[2/3]+[3/2]+[2]−[4/3]−[1]`; `[2/3]+[3]−[1] = −[−2]` by the three-term relation at `3` | as stated | none |
| §1.6 degenerate cobracket | `δD₂₁(1,3)` | `[3]₂⊗(u(−2) − u(0)) = [3]₂⊗u(2)`; `δ(−[−2]₃) = −[−2]₂⊗u(2) = [3]₂⊗u(2)` by `[x]+[1−x] = 0` | consistent | none |
| §1.7 `δD₃₁(x,1)` against (33) | expansion with `u(1−1/x) = u(1−x) − u(x)` and the three-term relation | both sides `−S₃(1−x)u(x) + S₃(x)u(1−x) − S₃(1)u(1−1/x)` | equal | none |
| §2.1 cell counts | `K₂`, `K₃` | `5, 5`; `14 − 21 + 9 − 1 = 1` | as stated | none |
| §2.2 flip identity | `Δ₁₂=2`, `Δ₃₄=3`, `Δ₂₃=Δ₁₄=1` | `X = 6`, `(1+X)∧X = u(7)∧u(6) = δ[−6]₂` | as stated | none |
| §3.9 weight two | `Cor^H(0,1,i)` | `D(i)/(4π²) = 0.9159656/39.478 = 0.023202`; `c₂ = −2` from `Cor^H(0,1,y) = −(2πi)^{-2}L₂(y)` and `p = L₂/2` | as stated | none |
| §3.9 Witt ranks | free Lie algebra on 2 generators | `2, 1, 2, 3, 6` | as stated | none |
| Layer 3 Examples | `[3]₂`, `[5]₂`, `[2]₂` in `Λ²U(ℚ)` | `u(2)∧u(3)`, `2u(2)∧u(5)` independent; `u(−1)∧u(2) = 0` | as stated | none |
| §6.1 stable rank | SchemeKTheoryOperations §6.7, `e = 1`, `m = 7` | onto from `n = 14`, bijective from `n = 15` | rank 15 needed | none |
| §6.2 conversion | `R = i·p`, `(2πi)³ = −8π³i`; `[i]` over `ℚ(i)` | `−p/(8π³)`; `p = β(4)/8 = 0.12361807`, coordinate `−β(4)/(64π³) = −0.00049836` | as stated | none |
| §6.2 exponent | `d = r₂`, `N = r₁ + 2r₂` | `3r₂ + r₂ − 4N = −4(r₁+r₂)` | cancelled by `π^{4(r₁+r₂)}` | none |
| §6.4 examples | `ℚ(√5)`; `ℚ(√−3)` | `π^{4·2}/√5`; `π⁴/√3` | as stated | none |
| §5.10 rank-three vanishing | `U(3)` | primitive degrees `1, 3, 5`; degree 7 restricts to zero | as stated | none |
| Supplier `blochWigner_fiveTerm` | its stated hypotheses | supplier: `x ≠ 0`, `y ≠ 0`; README said distinct and `∉ {0,1}` | narrower than supplied | contract text |

The headlines and their context (rule 2): `[Field F] [NumberField F]` and the cycle hypothesis are in each elaborated type, as shown by the mechanical check above. Vacuity: `ζ_F(4) ≠ 0`, so the every-family statement constrains `Z₄/ζ_F(4) ∈ ℚ`; existence for `r₂ = 0` is the Siegel–Klingen rationality, and for `r₂ > 0` it needs a nonzero determinant.

## Ownership against open pull requests

I checked ownership by object at the heads of the open pull requests with `roadmaps grep`, which searches every open roadmap folder and main (the sweep above). This roadmap owns every object listed in its Scope; each has no other owner. Polylogarithms (open) names this roadmap as its Part II and as owner of the weight-four theorem, `L₄*`, `κ` and the transfer to inductive cycles.

## Unresolved

1. **§5.7, a scope question for the humans.** Three steps of the combinatorial lift `𝓛₄: G₄(F) → L₄(F)` are the vanishing in (a), the vanishing in (b) and the regularity (d). No cited source proves them; the source asserts the lift but reaches only its motivic image over number fields. `zagier_four_exists` for `r₂ > 0` rests on them through §§5.8, 6.1 and 6.2; `zagier_four_everyFamily` and the case `r₂ = 0` do not. The README says so in the Summary, in §5.7 and in the Lean docstrings.
2. **The main source is a preprint.** GR is cited as arXiv v5, which describes itself as accepted in Annals, with no journal reference recorded. The accepted reviews record several errors and gaps in it, which the README corrects in place: Lemma 7.9, the (99) factor, the (244) normalization, the §9.3 element and footnote 24, and (192).
3. **Polylogarithms' scope paragraph.** It lists "decorated flags" and "the presentation map to the inductive complex" among what this roadmap owns. This README imports decorated flags from Polylogarithms §3.4. It constructs no presentation map `B₄^comb → B₄^ind`: such a map needs every single-symbol relation of `L₄(F)` to hold in the inductive group, which is not known, and §6.5 uses the cycle obstruction on `ℚ[F]` instead. The correction belongs to Polylogarithms.
4. **Stabilization in Polylogarithms §3.4.** Polylogarithms §3.4 asks that its decorated-flag comparison be "compatible with stabilization". §4.4 here shows, with Checks, that no chain map of generic flag tuples realizes `GL_N ⊂ GL_{N+1}`, and so works at the single rank 15. Polylogarithms' own statement may be meant on homology; its author should say which.
5. **Licence.** G93 is read from the author's page, an OCR of a 1993 volume chapter (`licence_class = "author-page"`).

No text read in this job asked for any action outside the brief.


Pull request: #2454 (roadmap/zagier-conjecture-polylogarithms at eaf907b)
