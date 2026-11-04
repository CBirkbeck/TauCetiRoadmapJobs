# Review of HalfIntegralWeightModularForms (pull request #1721 at 1a78fdd)

**Verdict:** accepted

No findings. The four findings in the previous report are repaired. The gate passes, and the changed acceptance theorem retains its hypotheses and the character in both transformation laws and the divisor sum. This verdict means ready for a human's final approval; it is not an approval or merge.

🤖 Independent AI review. This is an incremental re-review of **85 changed lines since 2cfe32c**, confined to the changes and their dependencies. “R3” below means the supplied previous report, **PRREVIEW-HalfIntegralWeightModularForms_r3.md**, at head **2cfe32c2fd1967d1e14bd3ebbb9bb1cba75e2126**. Inherited evidence is identified explicitly.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/HalfIntegralWeightModularForms/Suggested.lean:266` now quantifies over `DirichletCharacter ℂ N`, imposes its transformation law on the input, and states both the twisted coefficient formula and the squared-character output law; README lines 735–743 agree.
- R02 — repaired: `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:565`–568 gives `a(m²)=2mχ₋₄(m)`, explicitly includes zero at even squares, computes `2,0,−6,10`, and withdraws the unsupported sharpness claim.
- R03 — repaired: `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:1692`, 1700–1701 and 1932–1933 cite equation (1), p.136, Theorem 5, p.137, and equation (2), p.138, for their respective assertions.
- R04 — repaired: `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:124`–127 assigns the elementary all-index bound to §0.5 and distinguishes the supplier's squarefree-index estimate in weight at least 5/2.

## Verified sound

**Scope, gate and elaboration.** Reviewed both changed files at the requested head. The pull-request diff outside `TauCetiRoadmap/HalfIntegralWeightModularForms/` is empty, and the worktree remains clean. No new shortcut, duplicate foundational construction, algorithm, admitted data, option override or supplier edge was introduced. Read the normative repository README and CONTRIBUTING guidance and consulted the main ModularForms and ThetaSeries roadmaps for shape.

The independently rerun gate, using the supplied candidate order and the targeted build, returned:

```text
gate HalfIntegralWeightModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The separate dependency command with `--movable` and the supplied content checkout returned:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Direct `lake env lean` elaboration of Suggested.lean passed with exactly **17 warnings, all for `sorry`**, and no errors. A scratch copy containing `#check @name` for all **42 named declarations** also elaborated. Compared the signatures with the README and R3: no binder was lost. The changed lift retains `NeZero N`, `4 ∣ N`, `1 ≤ k`, the actual cusp-space input, the character law, and `Squarefree t`. Its target is a native modular form with a further explicit transformation law, not an arbitrary sequence or free predicate.

A scratch copy replaced each of the **17 admissions** by alternatives trying `rfl`, closing `simp`, and `infer_instance`. All 17 proofs failed; there were no parser errors. Reading the pinned objects and the ownership search found no existing single-lemma proof of the changed lift. No new padding was found. These probes check syntax and obvious padding, not truth.

**Changed mathematics: 13 computed rows.** Integer divisor sums and character values were recomputed directly. For the level-16 character, every unit has the form `(−1)^a3^b` and its character is `i^b`. The table separates numerical or algebraic controls from source verification.

| Statement | Instances tried | Computed values on each side | Result / change |
|---|---|---|---|
| §0.5 unary coefficient Check, README 565–568 | `m=1,2,3,5` | Pairing the terms indexed by `m,−m` gives `2mχ₋₄(m)=2,0,−6,10`, equal to the repaired coefficients | R02 repaired; even squares are zero |
| §0.5 growth comparison | `m=1,3,9`, `n=m²` | `abs(a(n))/n^(3/4)=2,2/√3,2/3`, equal to `2/√m`; limit 0 | Compatibility with the estimate, not evidence of sharpness |
| Ownership of §0.5 bound, README 124–127 | Weight 3/2, `n=9`; weight 1/2, `n=1` | General exponents are `3/4` and `1/4`; unary `abs(a(9))=6` versus `9^(3/4)=3√3`, requiring only `C≥2/√3` at that index. The supplied estimate excludes weight 3/2 and nonsquarefree 9 | R04 repaired; the two scopes are distinct |
| §1.3 character-general divisor sum, Suggested.lean 266–278 | `k=1,N=192,t=3,f=h_{χ₋₄,3},χ=(12/·)`; `n=1…5` | Divisor sums `2,0,−6,0,12` equal the new README Check. At 5 the terms are `10+2=12`; dropping χ yields `10−2=8` | R01 repaired; χ materially affects the lift |
| §1.3 input character law | Same input; `γ=[[77,2],[192,5]]` | `det γ=77·5−2·192=1` and `χ(5)=(12/5)=−1`; normalized transformation multiplier is −1, while the trivial-character law requires +1 | Nonzero unary input separates the two statements |
| §1.3 character descent Check, README 729–730 | `N=16,χ(−1)=1,χ(3)=i` | `χ(1)=1,χ(9)=i²=−1` while `1≡9 mod 8`; their squares are both 1 | χ need not descend; χ² does |
| §1.3 descent mechanism, README 739–740 | `N=4,8,12,16,192` | Kernels on units are `{1,3},{1,5},{1,7},{1,9},{1,97}`; squaring gives `{1}` each time. Generally `(1+N/2)²−1=N+N²/4` is divisible by N | Every χ² is trivial on the kernel; reduction is surjective because N and N/2 have the same prime divisors |
| §1.3 genuinely nontrivial output character | Odd primitive ψ modulo 5 with `ψ(2)=i`; `f=h_{ψ,1},N=100,t=1,k=1,χ=ψχ₋₄` | Lift coefficients at `n=1,2,3,5,7` are `2,4i,−8i,0,16i` from `2ψ(n)n Σ_{d∣n,(d,100)=1}1/d`. For `[[17,1],[50,3]]`, determinant 1 and `χ(3)²=i²=−1` | Confirms the squared character cannot simply be replaced by 1 |
| §1.3 trivial specialization and even divisors | Principal character modulo 4, `d=1,2,3`; δ at `k=6,t=1` | Character values `1,0,1` agree with the coprimality indicator; even contribution is 0. `A(2)=a(4)=−56` and `A(3)=9+3⁵=252`, retaining the previous ordinary lift | New signature includes the old theorem without changing the bad-prime convention |
| §1.3 degenerate cases and natural indices | `f=0;k=1;t=0;N=0;n=0;n=6,d=2` | Zero input gives coefficients 0 and target `F=0`. `k−1=0`. `Squarefree 0` is false; `NeZero 0` impossible; `n=0` excluded. `t·6²/2²=9t` exactly | No division-by-zero or truncated-subtraction defect; weight 2 target may be noncuspidal |
| §1.3 parity and modularity of output | `γ=−I`; χ odd; `T=[[1,1],[0,1]]` | Input law becomes `f=−f`, hence `f=0`; output multiplier is `χ(−1)²(−1)^(2k)=1`. T lies in both Γ₁ groups and has denominator 1, giving period 1 | No missing evenness assumption: odd χ has only zero input; Fourier period matches the pinned q-expansion |
| §6.4 corrected Theorem 5 and equation (1) locators | `m=1,k=10` and `k=9` | At k=10, `w=18`, root number `(−1)^9=−1`, cuspidal dimensions `1=1`; at k=9, `w=16`, root number +1, negative-sign space and odd-index-one Jacobi space both 0 | Correct statement unchanged; source locator repaired |
| §6.4 equation (2) oldspace locator and reference entry | `k=10,m=2,F=E₆Δ` | `B_{2,1}F=F+512F(2z)` has coefficients `1,−528+512=−16`. The larger span of `F,F(2z)` has determinant `1·1−0·(−528)=1` and dimension 2, versus the prescribed old line of dimension 1 | Correct equation (2), p.138; no change to the smaller-oldspace normalization |

**Inherited adversarial evidence.** The following **73 rows** carry forward R3's calculations for statements untouched by this diff: 21 from its changed-statement table and 52 from its inherited table. They are not claims that those experiments or full source audits were rerun. Rows describing the four old defects or the changed general lift have been replaced by the fresh rows above.

| Statement | Instances tried | Computed values on the two sides | Result / evidence |
|---|---|---|---|
| §0.5 invariant norm | Weight 3/2, `γ=[[1,0],[4,1]], z=i` | `abs(cz+d)=√17`; factor from `abs(f(γz))` is `17^{3/4}`, from `Im(γz)^{3/4}` is `17^{−3/4}`; product 1 | Direct Hecke route works ; inherited from R3, changed-statement table |
| §0.5 decay at cusps | Positive Fourier exponent `α`, zero form | `y^{(2k+1)/4} exp(−2πα y/w) → 0`; zero form gives 0 everywhere | Use §0.3's cusp Fourier expansion; finite index gives finitely many cusp regions ; inherited from R3, changed-statement table |
| §0.5 coefficient estimate | Integrate at height `1/n`, `n≥1` | `exp(2πn/n) C(1/n)^{−(2k+1)/4}=C exp(2π)n^{(2k+1)/4}`; exponent `(2k+1)/4=k/2+1/4` | Repairs previous R04; no use of dividing a coefficient bound by theta ; inherited from R3, changed-statement table |
| §0.5 Petersson convergence after the repair | Two cusp terms `exp(−ay), exp(−by)`, `a,b>0` | Integrand in a cusp is bounded by `exp(−(a+b)y)y^{k−3/2}`; its tail integral is finite | Uses exponential cusp decay from §0.3, not boundedness alone ; inherited from R3, changed-statement table |
| New theta negative control | `z=iy, y=1,16,256` | `abs(θ(iy))y^{1/4}≈1.0037348855,2,4`, versus a finite uniform bound | Correct exclusion of noncuspidal theta ; inherited from R3, changed-statement table |
| New reciprocal-theta Check | Degrees 0–8 and 16 | Reciprocal coefficients `1,−2,4,−8,14,−24,40,−64,100`; degree 16 is `2062`; multiplying by theta gives `1,0,…,0` | Correct. Polynomially bounded coefficients would give only polynomial radial growth, contradicting the reciprocal's exponential cusp growth at `q=−1` ; inherited from R3, changed-statement table |
| §1.3 divisor-sum growth | Write `s=k/2+1/4`, positive `t,n,d` with `d∣n` | Each term is at most `C t^s n^{2s}d^{k−1−2s}=C t^s n^{k+1/2}d^{−3/2}`; `d^{−3/2}≤1` | The displayed `τ(n)` bound follows for every divisor, including bad primes with zero character value ; inherited from R3, changed-statement table |
| Ligozat locator repair, eta order formula | Theta eta quotient: `N=4,(r₁,r₂,r₄)=(−2,5,−2)`; `c=1,2,4` | Cusp orders from the formula are `0,1/4,0`, matching theta's nonvanishing constant terms at 0 and ∞ and order 1/4 at 1/2 | Proposition 3.2.8, printed p.34, is the correct locator ; inherited from R3, changed-statement table |
| `Int.IsFundamentalDiscr` and sign | `D=1,5,8,12,−3,−4,−7,−8`; controls `0,4,9` | First eight satisfy the squarefree/residue criterion; controls fail. At `k=6`, `D=5` gives sign 5 and `D=−3` sign −3; at `k=9` the latter gives 3 | Pinned predicate includes 1 and even fundamental discriminants; sign is retained ; inherited from R3, changed-statement table |
| New `kroneckerSymNat`, positive denominators | `D=5,d=1,2,3,4,6,8` | Formula gives `1,−1,−1,1,1,−1`, exactly the Kronecker values | Detects the wrong Legendre-at-two convention ; inherited from R3, changed-statement table |
| New symbol, negative and even discriminants | `D=−7,−3,−4,8`, `d=2`; `D=−4,d=1,3` | At 2: `1,−1,0,0`; at 1 and 3 for −4: `1,−1`. In particular `0^0=1` at odd denominator is intended | Correct signed and ramified cases ; inherited from R3, changed-statement table |
| New symbol, trivial and junk arguments | `D=1,d≥1`; arbitrary `D,d=0` | For `D=1`, both symbols equal 1. At `d=0`, `padicValNat 2 0=0` and `jacobiSym D 0=1`, so the adapter gives 1; the full Kronecker value at `(5,0)` is 0 | The README promises agreement only for `d≥1`; `n>0,d∣n` prevents the junk value entering the lift ; inherited from R3, changed-statement table |
| New `kohnenLift`, `D=1` | `δ,k=6,n=1…6` | `1,−24,252,−1472,4830,−6048` on both the divisor-sum and `Δ` sides | Sound; differs from the ordinary lift at 2 ; inherited from R3, changed-statement table |
| Added `D=5` Check | `c(5)=120,c(20)=960,c(45)=59400` | `A(1)=120`; `A(2)=960−3840=−2880=120(−24)`; `A(3)=59400−29160=30240=120·252` | All three new values agree ; inherited from R3, changed-statement table |
| New Kohnen lift at even discriminants | `δ,k=6,D=8,12,n=1,2,3` | For 8: `−240,5760,−60480=(−240)(1,−24,252)`; for 12: `1440,−34560,362880=1440(1,−24,252)` | Zeros of the even-denominator character are necessary ; inherited from R3, changed-statement table |
| New Kohnen lift at negative discriminants | `g=θ⁷F³−16θ³F⁴,k=9,D=−3,−4,n=1,2,3` | `c(3)=1,c(4)=−2`; lifts `1,−528,−4284` and `−2,1056,8568`, respectively `ΔE₆` and `−2ΔE₆` | Checks `D.natAbs`, the sign condition and the two-adic symbol together ; inherited from R3, changed-statement table |
| Kohnen lift linearity and low-weight boundary | `g=0`; replace `δ` by `iδ`; `k=1` | Zero coefficients on both sides; every coefficient acquires `i` on both sides; level-four weight-3/2 cusp space has dimension 0 and zero lift | No nonzero-input or eigenform hypothesis is needed for existence ; inherited from R3, changed-statement table |
| §6.3 even bound retained | `(k,m)=(2,6),(4,1)` | Sums `7−8=−1` and `2−1=1`; only the latter has `k>m` | Negative lower bound is not an asserted dimension ; inherited from R3, changed-statement table |
| §6.3 added odd bound | `(k,m)=(11,2),(3,1),(1,2),(5,3),(7,4)` | Modular-dimension sum minus polar count: `2−1=1,0−0=0,0−1=−1,2−2=0,4−3=1` | Source matches; equality applies exactly when `k>m` in these tests ; inherited from R3, changed-statement table |
| §6.3 odd endpoints and weak-form kernel | `r=0,m`, odd `k`; `m=2,r=1` | Reflection and residue equivalence give `c=−c`, hence `c=0`, at endpoints; `ceil(1/8)=1` polar condition at the interior residue | Correct odd summation range; remaining dimension is weak dimension minus the actual rank ; inherited from R3, changed-statement table |
| Added odd Jacobi example | `Δφ_{−1,2}`, `m=2,k=11` | Leading `qζ` and `−qζ^{−1}` have discriminant `8−1=7>0`; weak discriminants at index 2 are at least −4 and multiplication by `Δ` adds at least 8 | Nonzero and holomorphic, consistent with dimension 1 and the stated lower bound 4 for discriminants ; inherited from R3, changed-statement table |

| Statement | Instances and computed values | Result | Change / evidence |
|---|---|---|---|
| 0.1 `j = θ(γz)/θ(z) = ε_d^{−1}(c/d)(cz+d)^{1/2}` | `z = 0.13+0.71i`, nine matrices of `Γ₀(4)` incl. `[[3,1],[8,3]]`, `[[−1,0],[8,−1]]`, `[[7,4],[12,7]]`, `[[3,2],[64,43]]`, `−I`, `T`: ratio and formula agree to `3·10⁻¹⁴` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.1 `j(−I) = 1`, `ν_θ(−I) = −i`, `ν_θ([[3,1],[8,3]]) = i` | `1/(−1)^{1/2} = −i`; `ε₃^{−1}(8/3) = (−i)(−1) = i` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.1 `W₄`-law `θ(−1/(4z)) = (−2iz)^{1/2}θ(z)` | `z = i`: `1.4194954880837662` both sides; `z = 0.3+0.8i`: `1.28393−0.21624i` both | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.2 carrier, zero and theta | law `0 = 0`; `θ`: identical products; cusp bound of `e(−z)` fails (`e^{2πy}`) | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.3 `coeff` as a line integral | `∫₀¹ e(−n(x+i)) Σa(m)e(m(x+i)) dx = a(n)` (`e^{−2πn}e^{2πn}`); `coeff_add`, `coeff_smul` proved in the file | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.3 product twists | `f` weight `k+1/2`, `g` weight `l`: `(cz+d)^l = χ₋₄(d)^l j^{2l}`; two half-integral: `j^{2(k+l+1)} = χ₋₄^{k+l+1}(cz+d)^{k+l+1}` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.4 `m_θ` into `modFormCharSpace (k+1)(χχ₋₄^{k+1})` | `χ(d)j^{2k+2} = χ(d)χ₋₄(d)^{k+1}(cz+d)^{k+1}` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.4 odd character | `−I`: `f = χ(−1)f` forces `f = 0` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.6 `F`, `W₄F` | `(E₂ − 3E₂(2z) + 2E₂(4z))/(−24) = q + 4q³ + 6q⁵ + 8q⁷`; `(E₂ − 6E₂(2z) + 8E₂(4z))/48 = 1/16 − q/2 + 3q²/2 − 2q³ + 3q⁴/2 − 3q⁵`; `−3+9−6 = 0` nonholomorphic parts cancel; `W₄F` derived from `E₂(−1/τ) = τ²E₂(τ) + 6τ/(πi)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.6 cusp `1/2` | `θ(Az)(2z+1)^{−1/2}` vs `2η(4z)²/η(2z)` at `z = i`: `0.415760602596027` both; at `0.2+0.5i`: `0.86563+0.28231i` both; order `1/4`; `(2k+1)/4 mod 1 ∈ {1/4, 3/4}` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 0.6 dimensions | `⌊k/2⌋+1`: `1,1,2,2,3,…`; `⌊(k+1)/2⌋+1` (even `k+1`) and `(k+2)/2` (odd) give `dim M_1(4,χ₋₄) = 1`, `M_2(4) = 2`, `M_3(4,χ₋₄) = 2`, `M_4(4) = 3`; evaluation map `θ^{2k+1} ↦ (1,1)`, `θ^{2k−3}F ↦ (0,1/16)` needs `k ≥ 2` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 1.1 weight-`1/2` eigenvalue | `θ`, `p = 3`: `b(0) = 1 + 1/3 = 4/3`, `b(1) = 2 + 2/3 = 8/3 = (4/3)·2` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 1.2 Euler quotient | `θ, p=3`: `(1−X/3)/(1−4X/3+X²/3) = 1/(1−X)`; `δ, p=3`: `X`-coefficient `252−243 = 9 = a(9)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 1.3 ordinary lift | `δ`: `A₁(n) = 1,−56,252,−704,4830,−14112,−16744` `=` `Δ(z)−32Δ(2z)`; sign test `9+243 = 252` vs `9−243 = −234` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 1.3 `k = 0` obstruction | `A₁(1), A₁(2), A₁(5) = 2, 2, 12/5` with `(d,4) = 1` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 2.1 characters | `A₁`: `(4/d) = 1`; `A₃`: `(8/3) = −1`; `diag(2,2,6)`: level `12` (`N·A⁻¹` even needs `N/6` even), `(48/5) = (3/5) = −1`; `v₂(det)` even forces a type-I constituent at `j ≥ 2`: with all type-I at `j = 1`, `v₂(det) ≡ rank L₁ ≡ 1` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 2.2 `Θ_{A₃}`, `Θ_{D₅}` laws | coefficients `1,12,6,24,12,24,8,48` and `1,40,90,240,200,560` by enumeration; law `Θ(γz) = (8/d) j³Θ(z)`, `(8/d) j⁵Θ(z)` at `z = (−d+i)/c` for `[[1,0],[8,1]]`, `[[−1,0],[8,−1]]`, `[[3,1],[8,3]]`, `[[5,3],[8,5]]`, `[[−3,−1],[16,5]]`: relative error `≤ 10⁻⁹`; the even-rank sign `(−8/d)` fails at `[[−1,0],[8,−1]]` and `[[3,1],[8,3]]` (relative error `2`) | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 2.2 `diag(2,2,6)` | law with `(3/d)` at `[[5,2],[12,5]]`, `[[7,4],[12,7]]`, `[[−5,−3],[12,7]]`: error `≤ 5·10⁻¹⁴`; trivial character fails (error `2`) | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 2.2 `Θ_{E₇}` | `θ⁷ + 112θ³F`: `14+112 = 126`, `84+672 = 756`, `280+1792 = 2072` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 2.2 sum characters | `(2detL/d)(2detM/d)(−1/d)^{k+l+1} = ((−1)^{k+l+1}detL·detM/d)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 2.3 coset of `√2ℤ` | `2q^{1/4}+2q^{9/4}+…`, `e(1/4) = i` under `T`, `1` under `T⁴` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 2.4 odd lattice | `Θ_{√2L}(z/2) = Σe(‖v‖²z/2) = Θ_L(z)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 3.1 phase | `(−I,−I,√2)`: `e^{2πi√2}`, modulus `1`, infinite order; `r = 1/2`: `−1`; `r = 1`: `1`; `σ_r` from `J(γδ) = J(γ,δz)J(δ,z)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 3.2 `η(z)η(11z)` | at `T`: `e(1/24)e(11/24) = −1` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 3.3 Dedekind sums | `s(1,3) = 1/18`, `s(3,7) = −1/14`, `s(3,7)+s(7,3) = −1/63 = 59/252 − 1/4` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 3.3 Apostol and both closed forms (Lean's exact expressions) | 13 matrices with `c > 0` (odd and even `c`, negative `d`, `S`, `[[1,0],[2,1]]`, `[[−2,−1],[7,3]]`, `[[1,−1],[6,−5]]`, …) at `z = 0.27+0.63i`: all three expressions agree with `η(γz)` to `4·10⁻¹⁴`; `[[1,0],[2,1]]` gives `e(−1/12)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 3.4 eta quotient character `(2s/·)` | `θ`: `(4/d) = 1`; `η(24z)`: `(48/d) = (3/d) = (12/d)`; `η(8z)³`: `1`; `η(z)²/η(2z) = 2θ(4z)−θ(z)`: `(1/d)`; `η(3z)²/η(6z) = 2θ(12z)−θ(3z)`: `(3/d)` — all agree with Serre–Stark's `ψχ_t` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 3.4 identities | `θ(i) = 1.003734885487739 = η(2i)⁵/(η(i)²η(4i)²) = η(i+1/2)²/η(2i+1)`; `η((i+1)/2)²/η(i+1) = 1.086434811213307` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.1 `h_{ψ,t}` series form | `ν = n/r`: `r·(n/r)·e(tn²z)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.1 Fricke identity | `θ_{ψ,t}(−1/(4r²t²z)) = g(ψ)(−2itz)^{1/2}θ_{ψ̄,t}(z)` for `ψ = χ₁₂` (`\|g\| = √12`), the even cubic character mod `7` (`\|g\| = √7`, complex values), `ψ = 1`, `t = 1,2,3`, `z = 0.11+0.37i`: both forms agree to `2·10⁻¹⁵` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.1 identities | `θ_{χ₁₂,1}(z) = 2η(24z)`, `h_{χ₋₄,1}(z) = 2η(8z)³` at `z = 0.05+0.21i`: `0.50839+0.16519i`, `0.50843+0.16517i` both sides | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.2 index sets | `N = 4`: one index; `N = 16`: `(1,1),(1,2),(1,4)` (no primitive even character of conductor `2`), `dim = 3`; `N = 196`: the cubic `ψ` is the only index with `χ = ψ` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.3 totally even | `χ₁₂`: `(a,b,u) = (4,3,7)`, `χ₁₂(7) = −1`; conductor `1`: `ψ(u) = 1`; smallest non-totally-even even conductor `12` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.4 | `A₁(2) = 2` (restricted), `3` (unrestricted) | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.5 `T(9)h_{χ₋₄,1}` | coefficients `2,−6,10,−14`; `b(1),b(4),b(9) = −8,0,24 = −4·(2,0,−6)`; `χ(p)(−tm²/p) = ψ(p)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.6 Shimura decomposition | level `4`, weight `3/2`: `0 = 0+0`; `δ`: eigenvalues `252, 4830` are `τ(3), τ(5)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 4.7 fields | `δ`: coefficients and eigenvalues in `ℚ`; cubic `ψ`: `2, 2ζ₃` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 5.1 `H_{5/2}` | `θ⁵ − 20θF = 1 −10q −70q⁴ −48q⁵ −120q⁸ −250q⁹` (`r₅ = 1,10,40,80,90,112,…,200,250`; `θF = q+2q²+4q³+8q⁴+8q⁵`); `H(2,N) = −1/12,−7/12,−2/5,−1,−25/12` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 5.1 `θ^{2k+1} ∉ M⁺` | `q²`-coefficient `2(2k+1)(2k)`, `2 ≢ 0,1` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 5.2 `W₄U₄` | `U₄θ⁵ = θ⁵ + 80θF`, `U₄(θF) = 8θF`, `W₄(θF) = θ·W₄F = θ⁵/16 − θF`; matrix `[[6,1/2],[−80,−8]]`, eigenvalues `−4, 2`, eigenvector `(1,−20)`; `α_k = (2/(2k+1))2^k = (−1)^{⌊(k+1)/2⌋}2^k` for `k = 2..8`; `k = 1`: `Aθ³ = θ³`, `pr⁺θ³ = 0` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 5.3 `T⁺(4)δ`, `T(9)δ` | `−24, 1344, −2880` at `n = 1,4,5`; `T(9)δ = 252, −14112, 30240 = 252·(1,−56,120)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 5.3 `Sh_t = Sh_D⁺ − (D/2)2^{k−1}Sh_D⁺(2z)` | even `d = 2d'`: `(D/d)d^{k−1}c(\|D\|n²/d²) = (D/2)2^{k−1}(D/d')d'^{k−1}c(\|D\|(n/2)²/d'²)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 5.3 dimensions | `dim M⁺_{k+1/2}(4) = dim M_{2k}`: `0,1,1,1,1,2,1,2,2,2`; `M_{13/2}(4)` has dimension `4`, plus part `2` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 5.5 Kohnen–Zagier | kohnen-zagier lines 100–114: `c(\|D\|)²/⟨g,g⟩ = ((k−1)!/π^k)\|D\|^{k−1/2}L(f,D,k)/⟨f,f⟩`, `⟨g,g⟩ = (1/6)∫`, `\|c\|²` for any normalization; `\|c(5)\|² = 14400` for `δ` and `iδ` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 5.7 cycle normalization | `∫₀^{i∞}f(z)z^{k−1}dz = i^kΓ(k)(2π)^{−k}L(f,k)`; `(−1)^{k/2}i^k = 1`; one class of discriminant `1` (`XY`) | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 6.1 `E_{4,1}` | `M⁺_{7/2}` generator `θ⁷ − 14θ³F = 1+56q³+126q⁴+576q⁷+756q⁸+1512q¹¹+2072q¹²`; `c(1,r) = 1,56,126,56,1`, `c(2,r) = 126,576,756,576,126`; `c(n,r)` of `E_{4,1}²` depends on `(8n−r², r mod 4)` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 6.2 theta S-law kernel | `m = 3, μ = 1, τ = 0.2+1.1i, z = 0.3+0.1i`: `θ_{m,μ}(−1/τ,z/τ) = (τ/2mi)^{1/2}e(mz²/τ)Σ_ν e(−μν/2m)θ_{m,ν}` (error `6·10⁻¹⁶`); with `e(+μν/2m)` error `3.0` | sound (so the `h`-law has `e(+μν/2m)`) | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 6.2 `h`-law on `E_{4,1}² ∈ J_{8,2}` | `h_μ(−1/τ) = e(1/8)τ^{15/2}/2·Σ_ν e(μν/4)h_ν(τ)` at `τ = 0.3+0.9i`, `μ = 0..3`: relative error `≤ 5·10⁻¹⁶`; `h_μ(τ+1)/h_μ(τ) = e(−μ²/8)` (`1, e(−1/8), −1, e(−1/8)`) | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 6.4 oldforms | `E₆Δ = q − 528q²`; `B_{2,1}F = F + 2⁹F(2z)`: `1, −16`; `S^−(m) = ⊕_{ld²∣m} S^{new,−}(m/ld²)\|B_{l,d}` is skoruppa-zagier (2), p.138; root number of level one weight `w`: `(−1)^{w/2} = (−1)^{k−1}` | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 7.1 record | `dimnew = dim − dimtheta` (lmfdb-code line 103); `newpart` fields `dim_image, half_forms, mf_label, nf_label` (lines 116–121); `thetas` a list of character labels (127–131) | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 7.2 search | filters `weight, level, character` only (lmfdb-code lines 56–60) | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |
| 7.3 coverage | all 16 rows point at existing milestones; `cmf.shimura_correspondence` says “cusp forms for `k ≥ 5`” (line 102) and uses `(−1/m)` (line 98), as §1.3 records | sound | Inherited from R3, carried-forward table (original evidence at 3d0ebaf) |

The seeded sample's unchanged §5.6 deserves an explicit limit on this evidence: R3 did not include a separate computed Waldspurger row. The following elementary control supplements that record without certifying the unavailable primary theorem. The second row makes the inherited §7.2 field check numeric.

| Statement | Instances tried | Computed values on each side | Result / scope |
|---|---|---|---|
| §5.6 local squareclasses and homogeneous identity | At level 4, `t,t′=1,17` and control 5; also `t=t′=1` | `17 mod 8=1`, `5 mod 8=5`, so only the first pair has matching odd 2-adic squareclass. At `t=t′=1` both terms equal `a(1)²L(F,k)`. Replacing g by ig multiplies both sides by −1 | Checks local admissibility and scaling only; the unequal-index L-value identity remains uncertified here |
| §7.2 intrinsic prefix | `N=4,k=6,χ=1` and `k=0` | `2·6+1=13` gives `(4,13,1)`; `2·0+1=1` gives `(4,1,1)`, agreeing with the README | Database weight is twice the mathematical weight, not the integral parameter k |

**Sources and seeded sample.** Fetched **three legal texts** through the sources service, without editing a manifest, and read the numbered passages. No outstanding source request remains from this round.

| Changed target | Source evidence read |
|---|---|
| §1.3, general character and halved level | **niwa lines 51–76**, theorem on printed pp.148–149: original odd weight numerator at least 7, character retained and integral level halved; the squarefree-t extension is explicitly stated. [Publisher open archive](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0027763000016445). |
| §1.3, weights 3/2 and 5/2, constant term and general t | **cipra lines 1232–1236**, Theorem 2.16, p.88; **cipra lines 1287–1317**, equation (2.60), Theorem 2.17 and the following level argument, pp.90–91. The character-twisted Dirichlet series, modularity-determined constant and reduction to half the original level support the signature. [Publisher open archive](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0027763000020468). |
| §6.4 and reference entry | **skoruppa-zagier lines 844–859**, equation (1), p.136; **lines 874–886**, Theorem 5, p.137, including compatibility with cusp subspaces; **lines 901–918**, equation (2), p.138, its operators and trace comparison. [Author's copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01394347/fulltext.pdf). |

Of this round's 15 seeded targets, **§1.3** intersects the diff and was checked against the source again. The other **14**—§§0.3, 1.1, 1.2, 2.2, 2.4, 3.2, 3.3, 4.2, 4.7, 5.5, 5.6, 5.7, 7.2 and 7.3—retain R3's mathematical and source-access results, with the limited supplementary controls above. The changed §0.5 Check is a direct series calculation, not a new source claim; the changed §6.4 locator was independently read. The repaired statements remain compatible with §4.1's unary theta formula, §0.4's character law, §5.3's distinction between ordinary and plus lifts, and §7.3's coverage map.

**Pinned API and signature evidence.** Pins remain Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Opened the relevant definitions in **eight pinned files**:

- `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39`: `DirichletCharacter R N` is `MulChar (ZMod N) R`.
- `Mathlib/NumberTheory/MulChar/Basic.lean:72`, 129 and 258: multiplicativity, vanishing on nonunits, and value 1 for the principal character on units. Thus a principal character at a positive composite level is not the constant-one function on all integers.
- `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:79` and 131: `Gamma0` restricts the lower-left entry; `Gamma1` additionally has diagonal entries 1 modulo the level. Both contain T, and Γ₁(N) lies in Γ₀(4) when 4 divides N.
- `Mathlib/NumberTheory/ModularForms/Basic.lean:72` and 80: native `ModularForm` and `CuspForm` include holomorphy and bounds/vanishing at every group cusp, besides slash invariance. They do not merely record Fourier coefficients.
- `Mathlib/NumberTheory/ModularForms/QExpansion.lean:171`: `UpperHalfPlane.qExpansion` uses the explicit period and Taylor coefficients of the cusp function. Its definition alone does not supply periodicity; T supplies period 1 here.
- `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean:86`, 105 and 110: `jacobiSym` is a prime-factor product, with values 1 at denominators 0 and 1. The ordinary lift never uses denominator 0 and kills even divisors through χ; the unchanged plus lift retains its separate Kronecker adapter.
- `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:315` and 344: the integral-weight eigenspace and its nebentypus equivalence have the same character direction as the new explicit output law. This does not supply a half-integral Hecke action.
- `TauCeti/NumberTheory/ModularForms/SturmBound.lean:118`: finite-dimensionality requires determinant-one elements, finite relative index and discrete strict periods, as the README contract states. It is an integral-weight input, not a duplicate of this roadmap's finite-dimensionality target.

The worker's 20 citation leads split into **eight own Lean declarations**, present in Suggested.lean and its checked signatures, and **12 LMFDB names**, which are database fields or knowls rather than missing Lean declarations. A fresh roadmap-citation resolution found no unresolved cross-roadmap citation; its library-name scan reported that it did not see the pinned packages, so the library evidence above comes from direct reads at the pins, not that scan.

**Ownership and supplier order.** Reread the `*Needs:*` lines and resolved the seven supplier families through main or the available open-head lookup. No prerequisite moved up in the order, and no new ownership overlap was found. The affected supply contracts resolve as follows:

| Supplier file | Resolved sections and boundary |
|---|---|
| `TauCetiRoadmap/ModularForms/README.md` | Layers 0, 2, 3, 4, 5, 7, 8/8G and 10 supply integral-weight character spaces, Hecke theory, Petersson theory, newforms, coefficient fields and dimensions. The new input law specializes a different, half-integral carrier; the output is native integral weight. |
| `TauCetiRoadmap/ThetaSeries/README.md` | §2H gives the general Kronecker symbol; Layers 2, 3, 6 and 7 give lattice arithmetic, theta functions, Gauss sums and even-rank modularity. Its odd-rank exclusion leaves the unchanged odd-rank extension here. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` | §4.3, “Half-integral cusp forms and the ternary specialization” and “Half-integral coefficient estimate”, supply the multiplier, nonvanishing, trivial-character cusp space and the weight-at-least-5/2, squarefree-index estimate. The elementary all-index bound is correctly distinguished. |
| `TauCetiRoadmap/AutomorphicBundles/README.md` | §§11.3–11.4 give the shifted cocycle and inverse-factor SlashAction adapter; the changed character law agrees with that direction. |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md` | §§6.17–6.18, 6.20 give the Jacobi group, sections and theta decomposition; §§7.1, 7.10, 7.49 give the unitary normalization, plus operators and adelic comparison. Those spectral/generic objects do not replace the character-general holomorphic existence theorem. |
| `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` | §§5.2, 6.1, 9.1 give eta's multiplier, the odd unary characteristic and theta-component coordinates. The characteristic's n factor explains the repaired `2mχ₋₄(m)` Check. |
| `TauCetiRoadmap/IntegralLattices/README.md` | At the supplied open head, §§1G–1H and Layer 3 retain finite quadratic-module and dyadic Jordan inputs. Its theta-series boundary supplies lattice arithmetic, not a competing modularity theorem or lift. |

The required `roadmaps grep` searches by lift, coefficient-bound and Skoruppa–Zagier objects, the board-package search, and direct searches of both pinned libraries found no competing owner for the changed construction. `TauCetiRoadmap/SiegelModularForms/README.md:88`–93 and 389–398 at the supplied head explicitly consume §§6.1–6.4; `TauCetiRoadmap/MaassForms/README.md:149`–155 distinguishes holomorphic theory from the metaplectic Maass theory. A namespace/declaration search found the changed Lean name only in this roadmap. Open work without supplied head files was not independently inspected beyond the tool's available index; no claim of an exhaustive audit of inaccessible open work is made.

**Headlines and completeness.** The README's headlines remain finite-dimensionality and Cohen dimensions; Shimura–Niwa–Cipra, the Euler product, Hecke equivariance and decomposition; odd-rank lattice modularity; Dedekind reciprocity and eta transformations; unary modularity and Serre–Stark; Kohnen's lift and correspondence, higher-level plus/newform theory, Kohnen–Zagier, Waldspurger and Shintani; and Jacobi comparison, dimensions and Skoruppa–Zagier. The changed module docstring now correctly includes the nebentypus existence theorem among the stated headlines. It still names the absent Hecke/eigenspace, lattice bridge, Petersson/cycle-integral and holomorphic Jacobi carriers for the remaining headlines. The change introduces no definition needing a fresh API or three-Check block, and adds two discriminating Checks to the existing lift section. No missing statable headline was introduced by the repair.

## Not verifiable

- All three source texts needed for the changed locators were legally readable. The cached text extraction has OCR damage in some displayed formulas; the character, weight, level, theorem numbering and relevant arguments were readable. The local rendering utilities checked were unavailable; the coefficient and character formulas were also tested directly as recorded above.
- This incremental verdict inherits R3's source-access limitations for untouched material: Shimura 1973 (JSTOR landing page), Serre–Stark (Springer LNM), Kohnen 1980/1982/1985 (publisher access limitations), Waldspurger 1981 (no legal full text located in that review), and Cohen, Apostol, Knopp and Koblitz (unopened/paywalled locators). Their full statements have not been newly certified here. Settled uncertified locators were not reopened as source requests.
- The untouched Gross–Kohnen–Zagier II and LMFDB material retains R3's limited inspection. The cited Eichler–Zagier version remains the 1983 preprint; no claim is made to have read the 1985 book this round.
- Finite coefficient calculations and elaboration do not prove the admitted theorems. In particular, the supplemental Waldspurger row checks squareclasses and scaling, not the unequal-index central-value identity.

## Source issues

- none
