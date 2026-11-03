# Review of HalfIntegralWeightModularForms (pull request #1721 at 2cfe32c)

**Verdict:** needs changes

## R01 (P2) — The character-twisted lift is still statable at the pins

**Location:** `TauCetiRoadmap/HalfIntegralWeightModularForms/Suggested.lean:17`–20, and `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:724`–729. The new docstring excludes the “character-twisted Shimura–Niwa–Cipra theorem” because the nebentypus eigenspaces and diamond operators are missing.

**Claim:** only the trivial-character version can appear in the acceptance test. The two existence theorems requested previously are now present, but this new explanation still excludes a statable part of the headline.

**Witness:** A scratch signature with `DirichletCharacter ℂ N`, the existing `cuspSpace k (Gamma1 N)`, and the explicit nebentypus transformation law elaborates with no errors. No diamond operator or Hecke action occurs in it.

**Repair:** state the character-general existence theorem using that law, or its simple submodule predicate, and remove the new claim of unstatability. This does not require implementing diamond operators. The following signature elaborated against the unchanged file and pinned imports (18 `sorry` warnings including the file's original 17):

```lean
theorem characterShimura {N : ℕ} [NeZero N] (hN : 4 ∣ N) {k : ℕ} (hk : 1 ≤ k)
    (χ : DirichletCharacter ℂ N) (f : HalfIntegralForm.cuspSpace k (Gamma1 N))
    (hχ : ∀ γ ∈ Gamma0 N, ∀ z : ℍ,
      (f : HalfIntegralForm k (Gamma1 N)) (γ • z) * theta z ^ (2*k+1) =
        χ (γ 1 1) * theta (γ • z) ^ (2*k+1) * (f : HalfIntegralForm k (Gamma1 N)) z)
    (t : ℕ) (ht : Squarefree t) :
    ∃ F : ModularForm ((Gamma1 (N/2)).map (Matrix.SpecialLinearGroup.mapGL ℝ)) (2*k : ℤ),
      (∀ n : ℕ, 0 < n → (UpperHalfPlane.qExpansion 1 F).coeff n =
        ∑ d ∈ n.divisors, χ d * (jacobiSym ((-1)^k*t) d : ℂ) * (d : ℂ)^(k-1) *
          HalfIntegralForm.coeff (f : HalfIntegralForm k (Gamma1 N)) (t*n^2/d^2)) ∧
      (∀ γ ∈ Gamma0 (N/2), ∀ z : ℍ,
        F (γ • z) = χ (γ 1 1)^2 * denomZ γ z^(2*k) * F z) := sorry
```

This uses the existing namespace and its notation. The character on the output is expressed by its values on `Γ₀(N/2)`; the square descends to that level. Since `4 ∣ N`, even divisors contribute zero through `χ`, so the Jacobi symbol suffices in this ordinary lift.

**Test of the repair:** take `k=1, N=192, t=3, f=h_{χ₋₄,3}` and `χ=(12/·)`, inflated to level 192. Its lifted coefficients at 1 through 5 are `2,0,−6,0,12`. Omitting `χ` gives `8` instead of `12` at 5. The matrix `[[77,2],[192,5]]` has determinant 1 and `χ(5)=−1`, so this nonzero input does not satisfy the trivial-character hypothesis. Niwa's theorem includes the character (niwa lines 51–76, printed pp.148–149); Cipra retains it at the low weights (cipra lines 1287–1317, pp.90–91).

## R02 (P3) — Correct the unary-theta coefficient Check

**Location:** `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:561`–563: “The exponent is sharp for weight `3/2`”, followed by the coefficient `±2m = 2 n^{1/2}` at `n=m²`.

**Claim:** these coefficients apply at every square and establish sharpness of the `O(n^{3/4})` bound.

**Witness:** At `m=2`, the coefficient is `2mχ₋₄(m)=0`, not `±4`. At positive odd `m`, its absolute value divided by `(m²)^{3/4}` is `2/√m → 0`.

**Repair:** write `a(m²)=2mχ₋₄(m)` for positive `m`: zero for even `m`, absolute value `2m` for odd `m`. Say this is compatible with the bound; delete the sharpness claim. The corrected values at `m=1,2,3,5` are `2,0,−6,10`.

## R03 (P3) — The Skoruppa–Zagier theorem number remains wrong

**Location:** `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:1686`–1687: “Skoruppa–Zagier, §3, Theorem 3, pp.137–138”. This is the unrepaired half of previous R02.

**Claim:** this locator is the stated Jacobi/modular-form isomorphism.

**Witness:** skoruppa-zagier lines 874–886 identify it as Theorem 5, printed p.137. The operators and decomposition are lines 901–909, equation (2), printed p.138.

**Repair:** cite Theorem 5, p.137, for the isomorphism and equation (2), p.138, for the oldform decomposition. The `m=1, k=10` specialization has weight 18 and dimension 1 on each cuspidal side, unchanged by this locator correction.

## R04 (P3) — Update the ownership sentence for the newly added bound

**Location:** `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:124`: “Nothing here … states a coefficient bound”, versus the new bound at lines 528–533 and its API bullet at 547.

**Claim:** all coefficient bounds are outside this roadmap, although §0.5 now owns the elementary all-index estimate.

**Witness:** §0.5 includes weight `3/2` and every positive index; GeometryOfNumbersAndQuadraticArithmetic §4.3's `halfIntegralCoefficientBound` assumes weight at least `5/2` and squarefree indices. They are different statements.

**Repair:** distinguish the elementary Hecke bound owned by §0.5 from the supplied Iwaniec–Duke estimate. At weight `3/2`, index 9, the former bounds the coefficient `−6`; the latter's hypotheses exclude both that weight and that index. No supplier change is needed.

## Previous findings

- R01 — repaired: `Suggested.lean:264` now states the requested trivial-character Shimura–Niwa–Cipra theorem, and line 433 states the full fundamental-discriminant Kohnen lift. The new exclusion of the character-general theorem is this report's R01.
- R02 — partly repaired: `README.md:990` and 1927 now cite Ligozat Proposition 3.2.8; line 1686 still cites Skoruppa–Zagier Theorem 3 instead of Theorem 5 (this report's R03).
- R03 — repaired: `README.md:1634`–1645 adds the odd-weight bound, the shared equality range, and the weak-form rank route; lines 1664–1667 supply the `(11,2)` and index-one Checks.
- R04 — repaired: `README.md:528`–533 proves the direct invariant-norm argument; §1.3 now uses it and gives the divisor-sum growth estimate. The new Check and old ownership wording need the corrections in R02 and R04 above.

## Verified sound

This is an incremental re-review of **127 changed lines since 3d0ebaf**, not a new full review. All four previous findings, both changed files, the affected supplier contracts, and the new signatures were inspected. The worktree remains unchanged. No changes outside `TauCetiRoadmap/HalfIntegralWeightModularForms/` appear in the pull-request diff.

**Gate and elaboration.** The worker's gate passed. An independent rerun with the supplied candidate order and `--build` also passed:

```text
gate HalfIntegralWeightModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The separate required dependency check returned:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Running the general gate with its default order first produced `depcheck: NOT IN ORDER: HalfIntegralWeightModularForms (insert it after its last supplier)`. This was an order-file mismatch, explicitly excluded as a finding by the brief; the candidate-order rerun above resolves it without editing any order file.

Direct `lake env lean` elaboration passed, with exactly 17 `sorry` warnings and no other warnings. The separate targeted build passed too. A scratch copy with `#check @name` for all **42 named declarations** elaborated successfully. Comparing the types with the README found no lost binder: the new ordinary lift retains positive level, `4 ∣ N`, `1 ≤ k`, the cusp-space membership and squarefreeness; the new Kohnen lift retains `k`, `1 ≤ k`, `IsFundamentalDiscr`, the sign condition and both plus/cusp conditions. Natural subtraction `k-1` occurs only under `1 ≤ k`; positive divisors ensure every coefficient index uses a nonzero divisor. The dimension and Serre–Stark signatures remain as previously checked.

Replacing each of the **17 admissions** on a scratch copy with the closing alternatives `rfl`, `simp`, and `infer_instance` leaves 17 failed theorem proofs, with no parser errors. The definitions and object searches at the pins provide no single existing lemma that proves either new lift. No new padding was found. This tests elaboration and obvious padding, not theorem truth; the calculations below test the changed mathematics.

**Headlines.** The README's end results are finite dimensionality and Cohen's dimensions (§0), the Shimura lift, Euler product and decomposition (§§1,4), odd-rank lattice modularity (§2), Dedekind reciprocity and eta formulas (§3), unary-theta modularity and Serre–Stark (§4), Kohnen's correspondence and higher-level plus/newform theory, Kohnen–Zagier, Waldspurger and Shintani (§5), and the Jacobi comparison, dimensions and Skoruppa–Zagier correspondence (§6). The unchanged module docstring accounts for the absent Hecke, lattice, pairing and Jacobi carriers. This round adds the two requested lift existence statements; the new character exclusion is R01. The elementary coefficient bound is an API result, not another required deep acceptance theorem.

**Changed-statement adversarial table.** Exact finite series arithmetic used `δ=θ⁹F−18θ⁵F²+32θF³`, `F=Σ_{n odd}σ₁(n)qⁿ`, through degree 300; integral-weight comparisons used `Δ=q∏(1−qⁿ)²⁴`. The odd-weight comparison below uses `g=θ⁷F³−16θ³F⁴`. Numerical bounds are identified as such. Rows include the added definitions, hypotheses, formulas, proof steps and changed Checks; the unchanged calculations follow in a separate table.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| §0.5 invariant norm | Weight 3/2, `γ=[[1,0],[4,1]], z=i` | `abs(cz+d)=√17`; factor from `abs(f(γz))` is `17^{3/4}`, from `Im(γz)^{3/4}` is `17^{−3/4}`; product 1 | Direct Hecke route works |
| §0.5 decay at cusps | Positive Fourier exponent `α`, zero form | `y^{(2k+1)/4} exp(−2πα y/w) → 0`; zero form gives 0 everywhere | Use §0.3's cusp Fourier expansion; finite index gives finitely many cusp regions |
| §0.5 coefficient estimate | Integrate at height `1/n`, `n≥1` | `exp(2πn/n) C(1/n)^{−(2k+1)/4}=C exp(2π)n^{(2k+1)/4}`; exponent `(2k+1)/4=k/2+1/4` | Repairs previous R04; no use of dividing a coefficient bound by theta |
| §0.5 Petersson convergence after the repair | Two cusp terms `exp(−ay), exp(−by)`, `a,b>0` | Integrand in a cusp is bounded by `exp(−(a+b)y)y^{k−3/2}`; its tail integral is finite | Uses exponential cusp decay from §0.3, not boundedness alone |
| New theta negative control | `z=iy, y=1,16,256` | `abs(θ(iy))y^{1/4}≈1.0037348855,2,4`, versus a finite uniform bound | Correct exclusion of noncuspidal theta |
| New unary Check | `m=1,2,3,5` | Actual coefficients `2,0,−6,10`; claimed absolute values `2,4,6,10` | R02: even squares need zero |
| New sharpness claim | Positive odd `m=1,3,9` | Ratio to `n^{3/4}` is `2,2/√3,2/3`, tending to 0 rather than saturating that exponent | R02: keep compatibility, delete sharpness |
| New reciprocal-theta Check | Degrees 0–8 and 16 | Reciprocal coefficients `1,−2,4,−8,14,−24,40,−64,100`; degree 16 is `2062`; multiplying by theta gives `1,0,…,0` | Correct. Polynomially bounded coefficients would give only polynomial radial growth, contradicting the reciprocal's exponential cusp growth at `q=−1` |
| §1.3 divisor-sum growth | Write `s=k/2+1/4`, positive `t,n,d` with `d∣n` | Each term is at most `C t^s n^{2s}d^{k−1−2s}=C t^s n^{k+1/2}d^{−3/2}`; `d^{−3/2}≤1` | The displayed `τ(n)` bound follows for every divisor, including bad primes with zero character value |
| New `shimuraNiwaCipra` | `δ, N=4,k=6,t=1,n=1…6` | Lift `1,−56,252,−704,4830,−14112`; `Δ−32Δ(2z)` has the same six coefficients | Sound trivial-character statement; no accidental replacement by the plus lift |
| Ordinary lift edge cases | Zero input; `k=1`; `t=0,N=0,n=0` | Zero input gives every positive coefficient 0; `k−1=0`; `Squarefree 0` is false and `NeZero 0` impossible; `n=0` is excluded | Weight 2 permits a noncuspidal target and a modularity-determined constant term |
| Newly excluded character-general headline | `h_{χ₋₄,3}, N=192,k=1,t=3,χ=(12/·)` | Correct coefficients `2,0,−6,0,12`; suppressing `χ` changes coefficient 5 to 8; `χ(5)=−1` | R01: the general statement is meaningful and elaborates on the native carriers |
| Ligozat locator repair, eta order formula | Theta eta quotient: `N=4,(r₁,r₂,r₄)=(−2,5,−2)`; `c=1,2,4` | Cusp orders from the formula are `0,1/4,0`, matching theta's nonvanishing constant terms at 0 and ∞ and order 1/4 at 1/2 | Proposition 3.2.8, printed p.34, is the correct locator |
| `Int.IsFundamentalDiscr` and sign | `D=1,5,8,12,−3,−4,−7,−8`; controls `0,4,9` | First eight satisfy the squarefree/residue criterion; controls fail. At `k=6`, `D=5` gives sign 5 and `D=−3` sign −3; at `k=9` the latter gives 3 | Pinned predicate includes 1 and even fundamental discriminants; sign is retained |
| New `kroneckerSymNat`, positive denominators | `D=5,d=1,2,3,4,6,8` | Formula gives `1,−1,−1,1,1,−1`, exactly the Kronecker values | Detects the wrong Legendre-at-two convention |
| New symbol, negative and even discriminants | `D=−7,−3,−4,8`, `d=2`; `D=−4,d=1,3` | At 2: `1,−1,0,0`; at 1 and 3 for −4: `1,−1`. In particular `0^0=1` at odd denominator is intended | Correct signed and ramified cases |
| New symbol, trivial and junk arguments | `D=1,d≥1`; arbitrary `D,d=0` | For `D=1`, both symbols equal 1. At `d=0`, `padicValNat 2 0=0` and `jacobiSym D 0=1`, so the adapter gives 1; the full Kronecker value at `(5,0)` is 0 | The README promises agreement only for `d≥1`; `n>0,d∣n` prevents the junk value entering the lift |
| New `kohnenLift`, `D=1` | `δ,k=6,n=1…6` | `1,−24,252,−1472,4830,−6048` on both the divisor-sum and `Δ` sides | Sound; differs from the ordinary lift at 2 |
| Added `D=5` Check | `c(5)=120,c(20)=960,c(45)=59400` | `A(1)=120`; `A(2)=960−3840=−2880=120(−24)`; `A(3)=59400−29160=30240=120·252` | All three new values agree |
| New Kohnen lift at even discriminants | `δ,k=6,D=8,12,n=1,2,3` | For 8: `−240,5760,−60480=(−240)(1,−24,252)`; for 12: `1440,−34560,362880=1440(1,−24,252)` | Zeros of the even-denominator character are necessary |
| New Kohnen lift at negative discriminants | `g=θ⁷F³−16θ³F⁴,k=9,D=−3,−4,n=1,2,3` | `c(3)=1,c(4)=−2`; lifts `1,−528,−4284` and `−2,1056,8568`, respectively `ΔE₆` and `−2ΔE₆` | Checks `D.natAbs`, the sign condition and the two-adic symbol together |
| Kohnen lift linearity and low-weight boundary | `g=0`; replace `δ` by `iδ`; `k=1` | Zero coefficients on both sides; every coefficient acquires `i` on both sides; level-four weight-3/2 cusp space has dimension 0 and zero lift | No nonzero-input or eigenform hypothesis is needed for existence |
| §6.3 even bound retained | `(k,m)=(2,6),(4,1)` | Sums `7−8=−1` and `2−1=1`; only the latter has `k>m` | Negative lower bound is not an asserted dimension |
| §6.3 added odd bound | `(k,m)=(11,2),(3,1),(1,2),(5,3),(7,4)` | Modular-dimension sum minus polar count: `2−1=1,0−0=0,0−1=−1,2−2=0,4−3=1` | Source matches; equality applies exactly when `k>m` in these tests |
| §6.3 odd endpoints and weak-form kernel | `r=0,m`, odd `k`; `m=2,r=1` | Reflection and residue equivalence give `c=−c`, hence `c=0`, at endpoints; `ceil(1/8)=1` polar condition at the interior residue | Correct odd summation range; remaining dimension is weak dimension minus the actual rank |
| Added odd Jacobi example | `Δφ_{−1,2}`, `m=2,k=11` | Leading `qζ` and `−qζ^{−1}` have discriminant `8−1=7>0`; weak discriminants at index 2 are at least −4 and multiplication by `Δ` adds at least 8 | Nonzero and holomorphic, consistent with dimension 1 and the stated lower bound 4 for discriminants |
| Skoruppa–Zagier locator under re-review | `m=1,k=10` and `B_{2,1}(E₆Δ)` | Cuspidal dimensions `1=1`; coefficients after `B_{2,1}`: `1,−528+512=−16` | Mathematical normalization unchanged; theorem number corrected by R03 |

**Unchanged statements carried forward.** The following 52 rows retain the computed witnesses from the previous report at `3d0ebaf` (its *Verified sound → Adversarial table*). They are explicitly inherited evidence, not claims that their full source audit or numerical experiments were repeated in this incremental review.

| Statement | Instances and computed values | Result | Change / evidence |
|---|---|---|---|
| 0.1 `j = θ(γz)/θ(z) = ε_d^{−1}(c/d)(cz+d)^{1/2}` | `z = 0.13+0.71i`, nine matrices of `Γ₀(4)` incl. `[[3,1],[8,3]]`, `[[−1,0],[8,−1]]`, `[[7,4],[12,7]]`, `[[3,2],[64,43]]`, `−I`, `T`: ratio and formula agree to `3·10⁻¹⁴` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.1 `j(−I) = 1`, `ν_θ(−I) = −i`, `ν_θ([[3,1],[8,3]]) = i` | `1/(−1)^{1/2} = −i`; `ε₃^{−1}(8/3) = (−i)(−1) = i` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.1 `W₄`-law `θ(−1/(4z)) = (−2iz)^{1/2}θ(z)` | `z = i`: `1.4194954880837662` both sides; `z = 0.3+0.8i`: `1.28393−0.21624i` both | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.2 carrier, zero and theta | law `0 = 0`; `θ`: identical products; cusp bound of `e(−z)` fails (`e^{2πy}`) | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.3 `coeff` as a line integral | `∫₀¹ e(−n(x+i)) Σa(m)e(m(x+i)) dx = a(n)` (`e^{−2πn}e^{2πn}`); `coeff_add`, `coeff_smul` proved in the file | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.3 product twists | `f` weight `k+1/2`, `g` weight `l`: `(cz+d)^l = χ₋₄(d)^l j^{2l}`; two half-integral: `j^{2(k+l+1)} = χ₋₄^{k+l+1}(cz+d)^{k+l+1}` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.4 `m_θ` into `modFormCharSpace (k+1)(χχ₋₄^{k+1})` | `χ(d)j^{2k+2} = χ(d)χ₋₄(d)^{k+1}(cz+d)^{k+1}` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.4 odd character | `−I`: `f = χ(−1)f` forces `f = 0` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.6 `F`, `W₄F` | `(E₂ − 3E₂(2z) + 2E₂(4z))/(−24) = q + 4q³ + 6q⁵ + 8q⁷`; `(E₂ − 6E₂(2z) + 8E₂(4z))/48 = 1/16 − q/2 + 3q²/2 − 2q³ + 3q⁴/2 − 3q⁵`; `−3+9−6 = 0` nonholomorphic parts cancel; `W₄F` derived from `E₂(−1/τ) = τ²E₂(τ) + 6τ/(πi)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.6 cusp `1/2` | `θ(Az)(2z+1)^{−1/2}` vs `2η(4z)²/η(2z)` at `z = i`: `0.415760602596027` both; at `0.2+0.5i`: `0.86563+0.28231i` both; order `1/4`; `(2k+1)/4 mod 1 ∈ {1/4, 3/4}` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 0.6 dimensions | `⌊k/2⌋+1`: `1,1,2,2,3,…`; `⌊(k+1)/2⌋+1` (even `k+1`) and `(k+2)/2` (odd) give `dim M_1(4,χ₋₄) = 1`, `M_2(4) = 2`, `M_3(4,χ₋₄) = 2`, `M_4(4) = 3`; evaluation map `θ^{2k+1} ↦ (1,1)`, `θ^{2k−3}F ↦ (0,1/16)` needs `k ≥ 2` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 1.1 weight-`1/2` eigenvalue | `θ`, `p = 3`: `b(0) = 1 + 1/3 = 4/3`, `b(1) = 2 + 2/3 = 8/3 = (4/3)·2` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 1.2 Euler quotient | `θ, p=3`: `(1−X/3)/(1−4X/3+X²/3) = 1/(1−X)`; `δ, p=3`: `X`-coefficient `252−243 = 9 = a(9)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 1.3 ordinary lift | `δ`: `A₁(n) = 1,−56,252,−704,4830,−14112,−16744` `=` `Δ(z)−32Δ(2z)`; sign test `9+243 = 252` vs `9−243 = −234` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 1.3 `k = 0` obstruction | `A₁(1), A₁(2), A₁(5) = 2, 2, 12/5` with `(d,4) = 1` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 2.1 characters | `A₁`: `(4/d) = 1`; `A₃`: `(8/3) = −1`; `diag(2,2,6)`: level `12` (`N·A⁻¹` even needs `N/6` even), `(48/5) = (3/5) = −1`; `v₂(det)` even forces a type-I constituent at `j ≥ 2`: with all type-I at `j = 1`, `v₂(det) ≡ rank L₁ ≡ 1` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 2.2 `Θ_{A₃}`, `Θ_{D₅}` laws | coefficients `1,12,6,24,12,24,8,48` and `1,40,90,240,200,560` by enumeration; law `Θ(γz) = (8/d) j³Θ(z)`, `(8/d) j⁵Θ(z)` at `z = (−d+i)/c` for `[[1,0],[8,1]]`, `[[−1,0],[8,−1]]`, `[[3,1],[8,3]]`, `[[5,3],[8,5]]`, `[[−3,−1],[16,5]]`: relative error `≤ 10⁻⁹`; the even-rank sign `(−8/d)` fails at `[[−1,0],[8,−1]]` and `[[3,1],[8,3]]` (relative error `2`) | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 2.2 `diag(2,2,6)` | law with `(3/d)` at `[[5,2],[12,5]]`, `[[7,4],[12,7]]`, `[[−5,−3],[12,7]]`: error `≤ 5·10⁻¹⁴`; trivial character fails (error `2`) | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 2.2 `Θ_{E₇}` | `θ⁷ + 112θ³F`: `14+112 = 126`, `84+672 = 756`, `280+1792 = 2072` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 2.2 sum characters | `(2detL/d)(2detM/d)(−1/d)^{k+l+1} = ((−1)^{k+l+1}detL·detM/d)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 2.3 coset of `√2ℤ` | `2q^{1/4}+2q^{9/4}+…`, `e(1/4) = i` under `T`, `1` under `T⁴` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 2.4 odd lattice | `Θ_{√2L}(z/2) = Σe(‖v‖²z/2) = Θ_L(z)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 3.1 phase | `(−I,−I,√2)`: `e^{2πi√2}`, modulus `1`, infinite order; `r = 1/2`: `−1`; `r = 1`: `1`; `σ_r` from `J(γδ) = J(γ,δz)J(δ,z)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 3.2 `η(z)η(11z)` | at `T`: `e(1/24)e(11/24) = −1` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 3.3 Dedekind sums | `s(1,3) = 1/18`, `s(3,7) = −1/14`, `s(3,7)+s(7,3) = −1/63 = 59/252 − 1/4` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 3.3 Apostol and both closed forms (Lean's exact expressions) | 13 matrices with `c > 0` (odd and even `c`, negative `d`, `S`, `[[1,0],[2,1]]`, `[[−2,−1],[7,3]]`, `[[1,−1],[6,−5]]`, …) at `z = 0.27+0.63i`: all three expressions agree with `η(γz)` to `4·10⁻¹⁴`; `[[1,0],[2,1]]` gives `e(−1/12)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 3.4 eta quotient character `(2s/·)` | `θ`: `(4/d) = 1`; `η(24z)`: `(48/d) = (3/d) = (12/d)`; `η(8z)³`: `1`; `η(z)²/η(2z) = 2θ(4z)−θ(z)`: `(1/d)`; `η(3z)²/η(6z) = 2θ(12z)−θ(3z)`: `(3/d)` — all agree with Serre–Stark's `ψχ_t` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 3.4 identities | `θ(i) = 1.003734885487739 = η(2i)⁵/(η(i)²η(4i)²) = η(i+1/2)²/η(2i+1)`; `η((i+1)/2)²/η(i+1) = 1.086434811213307` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.1 `h_{ψ,t}` series form | `ν = n/r`: `r·(n/r)·e(tn²z)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.1 Fricke identity | `θ_{ψ,t}(−1/(4r²t²z)) = g(ψ)(−2itz)^{1/2}θ_{ψ̄,t}(z)` for `ψ = χ₁₂` (`\|g\| = √12`), the even cubic character mod `7` (`\|g\| = √7`, complex values), `ψ = 1`, `t = 1,2,3`, `z = 0.11+0.37i`: both forms agree to `2·10⁻¹⁵` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.1 identities | `θ_{χ₁₂,1}(z) = 2η(24z)`, `h_{χ₋₄,1}(z) = 2η(8z)³` at `z = 0.05+0.21i`: `0.50839+0.16519i`, `0.50843+0.16517i` both sides | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.2 index sets | `N = 4`: one index; `N = 16`: `(1,1),(1,2),(1,4)` (no primitive even character of conductor `2`), `dim = 3`; `N = 196`: the cubic `ψ` is the only index with `χ = ψ` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.3 totally even | `χ₁₂`: `(a,b,u) = (4,3,7)`, `χ₁₂(7) = −1`; conductor `1`: `ψ(u) = 1`; smallest non-totally-even even conductor `12` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.4 | `A₁(2) = 2` (restricted), `3` (unrestricted) | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.5 `T(9)h_{χ₋₄,1}` | coefficients `2,−6,10,−14`; `b(1),b(4),b(9) = −8,0,24 = −4·(2,0,−6)`; `χ(p)(−tm²/p) = ψ(p)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.6 Shimura decomposition | level `4`, weight `3/2`: `0 = 0+0`; `δ`: eigenvalues `252, 4830` are `τ(3), τ(5)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 4.7 fields | `δ`: coefficients and eigenvalues in `ℚ`; cubic `ψ`: `2, 2ζ₃` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 5.1 `H_{5/2}` | `θ⁵ − 20θF = 1 −10q −70q⁴ −48q⁵ −120q⁸ −250q⁹` (`r₅ = 1,10,40,80,90,112,…,200,250`; `θF = q+2q²+4q³+8q⁴+8q⁵`); `H(2,N) = −1/12,−7/12,−2/5,−1,−25/12` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 5.1 `θ^{2k+1} ∉ M⁺` | `q²`-coefficient `2(2k+1)(2k)`, `2 ≢ 0,1` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 5.2 `W₄U₄` | `U₄θ⁵ = θ⁵ + 80θF`, `U₄(θF) = 8θF`, `W₄(θF) = θ·W₄F = θ⁵/16 − θF`; matrix `[[6,1/2],[−80,−8]]`, eigenvalues `−4, 2`, eigenvector `(1,−20)`; `α_k = (2/(2k+1))2^k = (−1)^{⌊(k+1)/2⌋}2^k` for `k = 2..8`; `k = 1`: `Aθ³ = θ³`, `pr⁺θ³ = 0` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 5.3 `T⁺(4)δ`, `T(9)δ` | `−24, 1344, −2880` at `n = 1,4,5`; `T(9)δ = 252, −14112, 30240 = 252·(1,−56,120)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 5.3 `Sh_t = Sh_D⁺ − (D/2)2^{k−1}Sh_D⁺(2z)` | even `d = 2d'`: `(D/d)d^{k−1}c(\|D\|n²/d²) = (D/2)2^{k−1}(D/d')d'^{k−1}c(\|D\|(n/2)²/d'²)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 5.3 dimensions | `dim M⁺_{k+1/2}(4) = dim M_{2k}`: `0,1,1,1,1,2,1,2,2,2`; `M_{13/2}(4)` has dimension `4`, plus part `2` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 5.5 Kohnen–Zagier | kohnen-zagier lines 100–114: `c(\|D\|)²/⟨g,g⟩ = ((k−1)!/π^k)\|D\|^{k−1/2}L(f,D,k)/⟨f,f⟩`, `⟨g,g⟩ = (1/6)∫`, `\|c\|²` for any normalization; `\|c(5)\|² = 14400` for `δ` and `iδ` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 5.7 cycle normalization | `∫₀^{i∞}f(z)z^{k−1}dz = i^kΓ(k)(2π)^{−k}L(f,k)`; `(−1)^{k/2}i^k = 1`; one class of discriminant `1` (`XY`) | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 6.1 `E_{4,1}` | `M⁺_{7/2}` generator `θ⁷ − 14θ³F = 1+56q³+126q⁴+576q⁷+756q⁸+1512q¹¹+2072q¹²`; `c(1,r) = 1,56,126,56,1`, `c(2,r) = 126,576,756,576,126`; `c(n,r)` of `E_{4,1}²` depends on `(8n−r², r mod 4)` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 6.2 theta S-law kernel | `m = 3, μ = 1, τ = 0.2+1.1i, z = 0.3+0.1i`: `θ_{m,μ}(−1/τ,z/τ) = (τ/2mi)^{1/2}e(mz²/τ)Σ_ν e(−μν/2m)θ_{m,ν}` (error `6·10⁻¹⁶`); with `e(+μν/2m)` error `3.0` | sound (so the `h`-law has `e(+μν/2m)`) | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 6.2 `h`-law on `E_{4,1}² ∈ J_{8,2}` | `h_μ(−1/τ) = e(1/8)τ^{15/2}/2·Σ_ν e(μν/4)h_ν(τ)` at `τ = 0.3+0.9i`, `μ = 0..3`: relative error `≤ 5·10⁻¹⁶`; `h_μ(τ+1)/h_μ(τ) = e(−μ²/8)` (`1, e(−1/8), −1, e(−1/8)`) | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 6.4 oldforms | `E₆Δ = q − 528q²`; `B_{2,1}F = F + 2⁹F(2z)`: `1, −16`; `S^−(m) = ⊕_{ld²∣m} S^{new,−}(m/ld²)\|B_{l,d}` is skoruppa-zagier (2), p.138; root number of level one weight `w`: `(−1)^{w/2} = (−1)^{k−1}` | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 7.1 record | `dimnew = dim − dimtheta` (lmfdb-code line 103); `newpart` fields `dim_image, half_forms, mf_label, nf_label` (lines 116–121); `thetas` a list of character labels (127–131) | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 7.2 search | filters `weight, level, character` only (lmfdb-code lines 56–60) | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |
| 7.3 coverage | all 16 rows point at existing milestones; `cmf.shimura_correspondence` says “cusp forms for `k ≥ 5`” (line 102) and uses `(−1/m)` (line 98), as §1.3 records | sound | Carried unchanged; previous report at 3d0ebaf, adversarial table |

**Source verification of the changed sample.** Six legal source texts were fetched through the sources service; the numbered passages were read, with image inspection where OCR obscured formulas. No manifest was edited.

| Changed or repaired target | Verified text, locator and scope |
|---|---|
| §1.3, new ordinary-lift signature | niwa lines 51–76, theorem on printed p.148 and cuspidality on p.149: original odd weight numerator at least 7, character retained, integral level halved. cipra lines 1232–1236 and 1287–1317, Theorems 2.16–2.17 and remark, pp.88–91: holomorphy at positive integral lift weight, the coefficient prescription, constant term and level argument. Legal copies: [Niwa](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0027763000016445), [Cipra](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0027763000020468). |
| §3.4, corrected Ligozat locator | ligozat lines 1003–1013, Proposition 3.2.8, printed p.34. The page image confirms that OCR's occasional “5.2.8” is a recognition error. The proposition supplies the cusp-order expression; the half-weight interpretation is the unchanged target's argument. [Legal Numdam text](https://www.numdam.org/item/10.24033/msmf.178.pdf). |
| §5.3, full-discriminant plus lift | kohnen-zagier lines 316–324, equation (4), p.182: fundamental discriminant, sign condition, cuspidal plus input, level-one cusp output. The primitive Kronecker character includes even denominators; the eigenform normalization is an additional consequence, not an input to existence. [Author's copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01389166/fulltext.pdf). |
| §6.3, both parity bounds and weak-form argument | eichler-zagier lines 3321–3361, Theorem 9.2, its corollary and exact sequence (9), printed pp.101–102. The page images verify the odd range 1 through m−1, weights k+2j−1, and equality for k>m. These are the cited **1983 preprint** locators, not the 1985 book's. [Institutional preprint](https://archive.mpim-bonn.mpg.de/id/eprint/1437/1/preprint_1983_8.pdf). |
| §6.4, outstanding locator | skoruppa-zagier lines 874–909, Theorem 5, p.137, and equation (2), p.138; confirms R03 and the unchanged oldform normalization. [Author's copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01394347/fulltext.pdf). |

The seeded targets outside the changed passages—§§0.1, 0.4, 2.1, 3.2, 4.2, 4.5, 4.7, 5.4, 5.5 and 6.2—retain the previous review's mathematics/source results and its stated access limitations. No new certification of their unopened sources is claimed. The new §0.5 argument and its consumers in §§1.3 and 5.3 were checked explicitly above.

**Pinned declarations opened for this round.** Pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following concrete declarations support the changed definitions and signature probes:

- `Mathlib/NumberTheory/FundamentalDiscriminant.lean:41`, `Int.IsFundamentalDiscr`; line 52, `IsFundamentalDiscr.ne_zero`; line 60, `isFundamentalDiscr_iff_squarefree`. The predicate includes discriminant 1, excludes 0, and retains the even-discriminant alternative.
- `Mathlib/NumberTheory/LegendreSymbol/ZModChar.lean:118`, `ZMod.χ₈`: values 0 on even classes, 1 on 1 and 7, −1 on 3 and 5. Its displayed integer formula is at line 142.
- `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean:86`, `jacobiSym`; lines 105 and 110, `jacobiSym.zero_right` and `one_right`. The unrestricted natural denominator definition does **not** give the Kronecker value at even denominators or at 0.
- `Mathlib/NumberTheory/Padics/PadicVal/Defs.lean:64`–71, the zero/one specializations and `padicValNat.eq_zero_iff`; the new adapter uses the positive-denominator case and explicitly limits its comparison with the supplier symbol.
- `Mathlib/NumberTheory/ModularForms/Basic.lean:72` and 80, `ModularForm` and `CuspForm`: holomorphy and bounds/vanishing at **all** group cusps, in addition to slash invariance. These are not just arbitrary holomorphic functions or Fourier sequences.
- `Mathlib/NumberTheory/ModularForms/QExpansion.lean:171`, `UpperHalfPlane.qExpansion`: a power-series constructor with an explicit period parameter; its definition alone supplies neither modularity nor period one. The theorem domains here contain the translation matrix and use period 1.
- `Mathlib/Analysis/Complex/UpperHalfPlane/FunctionsBoundedAtInfty.lean:45` and 49, `IsBoundedAtImInfty` and `IsZeroAtImInfty`: filter boundedness and convergence. Exponential cusp decay additionally uses the README's Fourier expansion, as noted above.
- `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279`, 315 and 344, `cuspFormCharSpace`, `modFormCharSpace` and `mem_modFormCharSpace_iff_nebentypus`: the integral-weight model for the equivalence between an eigenspace and its transformation law. The character lift probe uses the transformation law directly and adds no imported half-integral diamond action.

The new declarations have distinct fully qualified names. Searches by the Kronecker-character data, half-integral form carrier and lift objects in the pinned libraries found no existing half-integral lift or general Kronecker symbol to import. The other pinned-library checks from the previous report are inherited, not presented as fresh searches here.

**Ownership and supplier direction.** Every `*Needs:*` line was read; no new upward edge or cycle appeared. The seven supplier families named by the README were resolved again against main or their available open text:

- `TauCetiRoadmap/ModularForms/README.md`: Layers 0, 2, 3, 4, 5, 7, 8G and 10, with headings at lines 259, 383, 481, 532, 638, 708, 935 and 1024, supply the integral-weight targets and comparisons. The direct norm proof adds no second integral-weight theory.
- `TauCetiRoadmap/ThetaSeries/README.md`: §2H (around line 563) owns `kroneckerSym` and `kroneckerChar`, including their values at 2, −1 and 0; Layers 2, 3, 6 and 7 own the lattice/theta inputs. The new two-factor formula is a simple positive-denominator acceptance-test adapter, with an explicit agreement target, not a proposed second general symbol library. In particular the restriction d≥1 matters at d=0.
- `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`: §4.3's half-integral cusp carrier, theta multiplier, coefficient estimate and product specialization remain the cited inputs. Its Iwaniec estimate is squarefree and starts at weight 5/2; the elementary all-index norm estimate newly added here is different. R04 corrects only the conflicting ownership prose.
- `TauCetiRoadmap/AutomorphicBundles/README.md:3874` and 3928, §§11.3–11.4: shifted automorphy factors and the `SlashAction` adapter exist with the claimed laws.
- `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:1747`, 1769, 1805, 1835, 1941 and 2379: §§6.17, 6.18, 6.20, 7.1, 7.10 and 7.49 give the cited Jacobi carrier/decomposition, unitary theta factor, projection normalization and adelic comparison. The half-integral holomorphic lift remains this roadmap's extension, not a re-planning of those spectral spaces.
- `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:816`, 968 and 1359, §§5.2, 6.1 and 9.1: eta multiplier, unary characteristics, theta coordinates. The signs and normalizations agree with the unchanged contracts.
- `TauCetiRoadmap/IntegralLattices/README.md`: the finite quadratic-module and local-lattice sections 1G, 1H and Layer 3 remain identifiable; its scope excludes half-integral modularity. It supplies lattice arithmetic, not either new lift.

The independent `roadmaps grep` audit searched the lift, Kronecker-symbol and coefficient-decay objects across main and the open-roadmap index; board package files were also searched for the new definitions/signatures. `SiegelModularForms` at its provided open head explicitly consumes §§6.1–6.4 (README lines 88–93), and `MaassForms` defers the holomorphic plus space/lift (README line 153). The candidate order places the suppliers before this roadmap. No competing new owner was found for the changed targets; generic Kronecker ownership stays with ThetaSeries. Open packages whose head files were not supplied were not independently checked beyond the available index/search results.

## Not verifiable

- The changed mathematical locators above were all accessible through legal copies. The Eichler–Zagier formulas were also read from page images because their OCR drops displayed terms. There is no outstanding source request from this round.
- Carried from the previous report, without reopening settled unavailable texts: Shimura 1973 (JSTOR landing page), Serre–Stark (Springer LNM), Kohnen 1980/1982/1985 (publisher access limitations), Waldspurger 1981 (no legal full text located there), and Cohen, Apostol, Knopp and Koblitz (unopened/paywalled locators). Their unchanged statements retain that report's uncertified-source qualification.
- The 1985 Eichler–Zagier book was not read; the README now cites the 1983 preprint, which was read. The unchanged Gross–Kohnen–Zagier II citation and LMFDB data pages retain the previous report's limited inspection. Source errors recorded by that earlier review were outside this incremental source recheck.
- Series coefficients and numerical checks are witnesses against common mistakes, not formal proofs of the admitted theorems. The remaining uncertainty about unchanged source text was not treated as an instruction to park this review.

## Source issues

- none
