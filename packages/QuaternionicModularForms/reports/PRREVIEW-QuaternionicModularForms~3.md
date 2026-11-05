# Review of QuaternionicModularForms (pull request #934 at 67bcbf6)

**Verdict:** needs changes

Incremental re-review of the 121 lines changed since 84012cc. The gate passes on every check (build included), the acceptance file elaborates with no output, the dependency check reports no problem, and six of the seven previous findings are repaired. What remains is one unrepaired finding (the acceptance file's docstring still names a Tau Ceti declaration that does not exist at the pin, now with a file path that does not exist either) and two small defects the repairs introduced: a false existence qualifier in a new Check, and a wrong page in the new Williams locator.

## R01 (P3) — The acceptance file names a Tau Ceti declaration and a file that do not exist at the pin

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:15`: “(`MvPowerSeries.restrictedSubst`, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Subst.lean`; Mathlib's `PowerSeries.subst` likewise requires `PowerSeries.HasSubst`, a nilpotent constant coefficient)”.

**Claim:** the pinned Tau Ceti substitutes polynomials without constant term into the Tate algebra through `MvPowerSeries.restrictedSubst` in that file.

**Witness:** at the pinned Tau Ceti (`a91d3aa`, the checkout's `HEAD`) the string `restrictedSubst` occurs in no file, and `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/` contains only `Basic.lean` and `Iterate.lean`. The only substitution Tau Ceti uses is Mathlib's `PowerSeries.subst` (`TauCeti/RingTheory/PowerSeries/Log.lean:66`–`74`). Mathlib at the pin has `PowerSeries.subst` (`Mathlib/RingTheory/PowerSeries/Substitution.lean:157`), `PowerSeries.HasSubst` (`:39`) and `MvPowerSeries.HasSubst` with the nilpotent-constant-coefficient field (`Mathlib/RingTheory/MvPowerSeries/Substitution.lean:77`), so the Mathlib half of the sentence is right.

**Repair:** delete the Tau Ceti name and path, and say that substitution at the pins is Mathlib's `PowerSeries.subst`, whose side condition `PowerSeries.HasSubst` requires a nilpotent constant coefficient, so a Möbius transformation with constant term `b/d` cannot be substituted; the conclusion (no analytic weight action at the pins) stands. This repeats the previous review's R06, which this head did not repair: the author may have read a Tau Ceti newer than the pin, which is not what the acceptance file is tested against.

## R02 (P3) — The new level Check gives a false sufficient condition

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:836`–`838`: “`diag(u,1)` with `u∈Ô_Fˣ`, `u≢1 mod 𝔫` (such `u` exist when `#(𝒪_F/𝔫)>2`) lies in `U₁(𝔫)` and not in `Ω₁(𝔫)`, so Williams's level is strictly smaller than §0.2's”.

**Claim:** whenever `𝒪_F/𝔫` has more than two elements, `Ω₁(𝔫)` is strictly smaller than `U₁(𝔫)`.

**Witness:** `Ô_Fˣ→(𝒪_F/𝔫)ˣ` is surjective, so such `u` exist exactly when `(𝒪_F/𝔫)ˣ≠1`. For `F=ℚ(√−7)` (`−7≡1 mod 8`, so `2` splits) and `𝔫=2𝒪_F=𝔭𝔭̄`, `𝒪_F/𝔫≅𝔽₂×𝔽₂` has `4>2` elements and trivial unit group (computed on `ℤ[w]/2`, `w²=w−2`: the only unit is `1`). Then `det≡1` is automatic on `U₁(𝔫)`, and `Ω₁(𝔫)=U₁(𝔫)`. The same happens for every imaginary quadratic field in which `2` splits and `𝔫=2𝒪_F`.

**Repair:** replace the parenthesis by “(such `u` exist exactly when `(𝒪_F/𝔫)ˣ` is nontrivial, that is unless `𝔫` is a product of distinct primes of norm `2`)”, and add the instance `F=ℚ(√−7)`, `𝔫=2𝒪_F`, where `Ω₁(𝔫)=U₁(𝔫)` although `#(𝒪_F/𝔫)=4`, as the negative control.

## R03 (P3) — The Williams Fourier-expansion locator has the wrong page

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:790`: “his Fourier expansion (Williams, §1.2.1, p. 5, taken from Hida)”, and `README.md:1208`–`1209` in References: “§1.2.1, p. 5 (the Fourier expansion)”.

**Claim:** §1.2.1 of Williams is on printed page 5.

**Witness:** `williams` line 250 is the footer “5” of page 5, line 251 the page-6 marker, and line 254 the heading “1.2.1. Fourier Expansions” with the expansion “from [Hid94]” at line 256: printed page 6. Definitions 1.1–1.2 (pp. 4–5) and Theorem 1.3 (p. 5) are cited at the right pages.

**Repair:** write “§1.2.1, p. 6” in both places.

## Previous findings

- R01 — repaired: lines 788–791 add the moderate-growth condition to Williams's space (“imposed here as part of his definition”), with the Fourier expansion as the reason; the theorem is unchanged. The page of that locator is R03 above.
- R02 — repaired: lines 646–658 identify `𝒜_ℂ(U,1)` with functions on `Cl(UẐˣ)` by the central condition and the Casimir, give `M(U,ℂ)` as the sum over the finitely many `ω`, and carry the `U₁(13)` negative control (fibres of size at least `12/6=2`); recomputed below.
- R03 — repaired: purity is now a target of §2.6 (lines 776–782) proved from AutomorphicFormsOnReductiveGroups §5.5 `clozelPurity`, which exists at that roadmap's open head (its README line 835–837: common sum of the archimedean exponents of an algebraic cuspidal `GLₙ` representation); the pairing argument is recomputed below. The ALS.5b.8 citation is gone from the contract and the Dependencies.
- R04 — repaired: the contract (lines 166–171) states the supplier's hypotheses (`G^der` simply connected, `G^der(F_∞)` noncompact on each `F`-simple factor) and target `ν(G(F))\D(𝔸_{F,f})/ν(U)`, matching AdelicAlgebraicGroups §4.5 at its open head (its README lines 5070–5078), and the Check at lines 659–662 gives the definite counterexample (recomputed: `h=2`, mass `5/12=1/4+1/6`).
- R05 — repaired: `T_{v²}=[U diag(ϖ_v²,1) U]` is defined, the relation is `T_v²=T_{v²}+(q_v+1)S_v` with the coset count, the degree homomorphism is Tau Ceti's `LeftCosetModule.deg` (`TauCeti/NumberTheory/HeckeRing/Degree.lean`), and the §1.3 normalisation factor `ν_alg(ϖ_v)^{−2}` agrees with line 479 (`ν_alg(π_v)^e` on determinant valuation `e`).
- R06 — not repaired: `Suggested.lean:15` still names `MvPowerSeries.restrictedSubst`, now with a file path; neither exists at the pin (R01 above).
- R07 — repaired: `Ω₁(𝔫)` is defined at line 783 as the kernel of `det mod 𝔫` on `U₁(𝔫)` (correct: on `U₁(𝔫)`, `det≡a`), with index `#(𝒪_F/𝔫)ˣ`; the dictionary carries “(Buzzard, *Eigenvarieties*, §8, p. 70)”, verified at `buzzard-eigen` lines 2508–2511; the conjugate factor is `conj(Sym^k(ℂ²))` in words. The new Check's qualifier is R02 above.

## Verified sound

**Gate and build.** The worker's gate at this head passes every check (`set_option=0 … build=0 OK`). I elaborated `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` with `lake env lean` from the worktree: exit code 0, no output (the file declares nothing; `import Mathlib` only). Nothing outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty); the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. No `set_option`, no LaTeX delimiters, no pull-request numbers, no process words (grep for now/former/previous/removed/round/checkpoint: none), no copied passages, no algorithm, no instruction-like text in the diff.

**Dependency check**, run with `--movable` against the merge order and main:

```text
depcheck: 209 roadmaps, 1726 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The suppliers the diff touches are all earlier in the order: AdelicAlgebraicGroups (§4.5 read at its open head), AutomorphicFormsOnReductiveGroups (§5.5 read at its open head), ArithmeticLocallySymmetricSpaces (ALS.5b.8 no longer cited). No supplier gap is declared and none is needed. The resolver's one lead, `LocallySymmetric.AutomorphicForm` at README line 180, is ArithmeticLocallySymmetricSpaces' planned name for ALS.F.6 (its README lines 989 and 1026), as the previous review found; the line is unchanged.

**Citations resolved at this head** (all through `roadmaps show` at the open heads; Tau Ceti and Mathlib at the pins):

| Citation | Where it resolves |
| --- | --- |
| AutomorphicFormsOnReductiveGroups §5.5 `clozelPurity` | its README line 835 (heading “Cuspidal GLₙ purity and weight-zero components”) and 837: for cuspidal `GLₙ` representations algebraic in Clozel's convention, raw exponents `a_i, b_i` on `ℂˣ` have a common sum independent of `i` and of the place. The roadmap's half-integral `p_i, q_i` are those raw exponents for `n=2`; the contract's one-line summary (line 194–196) is a correct paraphrase. |
| AdelicAlgebraicGroups §4.5 class-set bijection | its README lines 5070–5078: `G^der` simply connected, `G^der(F_∞)` noncompact on each `F`-simple factor, `G(F)\G(𝔸_{F,f})/U ≃ ν(G(F))\D(𝔸_{F,f})/ν(U)`. The contract now states exactly this. |
| Tau Ceti Hecke-ring degree homomorphism | `TauCeti/NumberTheory/HeckeRing/Degree.lean`, `LeftCosetModule.deg : 𝕋 Δ H R →+* R` (its module docstring, lines 32–41). |
| Mathlib `PowerSeries.subst`, `PowerSeries.HasSubst`, `MvPowerSeries.HasSubst` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:157`, `:39`; `Mathlib/RingTheory/MvPowerSeries/Substitution.lean:77` (field `const_coeff s : IsNilpotent …`). |
| `MvPowerSeries.restrictedSubst`, `TateAlgebra/Subst.lean` | nowhere at the pin (R01). |
| Williams Definition 1.1, p. 4; Definition 1.2, pp. 4–5; Theorem 1.3, p. 5; §1.2.1 | `williams` lines 191–197 (`c∈𝔫Ô`, `a,d∈1+𝔫Ô`), 199–217 (five conditions, no growth condition), 237–242, 254–256 (page 6: R03). |
| Buzzard, *Eigenvarieties*, §8, p. 70 | `buzzard-eigen` lines 2508–2511: `k=n+2`, `w=v+n+1`. |

**Headline coverage.** Unchanged from the previous review: no headline is statable at the pins and the docstring names each with its missing carrier; the only change to the file is the sentence of R01. The empty acceptance file remains the correct form; no padding, no stand-in.

**Computed adversarial pass.** New rows are for the statements the diff changes; the rest carry forward from the review at 84012cc, whose values are repeated in short form.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §2.4 Check: `𝒜_ℂ(U,1)` on `Cl(UẐˣ)` | `W=ℂ`, `ω=1`: central condition on all of `𝔸_ℚˣ`; `ℍ¹`-finite `f`, `Ω∈J_ℂ` | `Ω` acts on the right `Sym^n`-isotypic part by the `𝔰𝔩₂` Casimir value, nonzero for `n>0` and `0` for `n=0` (the central direction is killed by `ω=1`), so `Ω^m f=0` forces `n=0`; `𝔸_{ℚ,f}ˣ=ℚ_{>0}Ẑˣ` with `ℚ_{>0}⊂Dˣ` gives `Dˣ\D_fˣ/UẐˣ` | Pass |
| §2.4 Check: `U₁(13)` negative control | Hamilton's algebra, `U=U₁(13)` at `13` | `U₁(13)ℤ₁₃ˣ=U₀(13)` (scalars realise every `d mod 13`); `Γ_x⊂O_xˣ` finite, reduction mod `13` injective (its kernel is pro-`13`, `ℚ(ζ₁₃)` has degree `12>2`), image in a Borel of `SL₂(𝔽₁₃)` with no element of order `13`, hence injects into the torus `𝔽₁₃ˣ`: cyclic of order dividing `12`, and `≠12` since `ℚ(ζ₁₂)` has degree `4`; orbits on the `12`-element set `(ℤ/13)ˣ` have size `≤6`, so each fibre has `≥2` elements | Pass |
| §2.4 Check: Eichler negative control for §4.5 | `D` ramified at `{11,∞}`, `U=Ôˣ` | `h=(p−1)/12+(1/4)(1−(−4/11))+(1/3)(1−(−3/11))=10/12+1/2+2/3=2`; mass `(11−1)/24=5/12=1/4+1/6`; `nrd(Ôˣ)=Ẑˣ`, `nrd(Dˣ)=ℚ_{>0}`, so `ℚ_{>0}\𝔸_{ℚ,f}ˣ/Ẑˣ` has `1` element against `#Cl(U)=2` | Pass; refutes the bijection without noncompactness |
| §4.5 contract hypotheses | `G=GL₂`: `SL₂(F_∞)` noncompact, `ν(GL₂(F))=Fˣ`; `G=GL_1(D)` definite: `D¹(F_∞)` compact | matches AdelicAlgebraicGroups §4.5 at its head | Pass |
| §2.6 purity: infinitesimal character | `V_λ^∨` with highest weights `(−b,−a)`, `(−b′,−a′)`; `ρ=(1/2,−1/2)` | `{−b+1/2,−a−1/2}`, `{−b′+1/2,−a′−1/2}` | Pass |
| §2.6 purity: pairings | `(a,b,a′,b′)∈{(1,0,0,0),(3,0,3,0),(5,2,3,0),(4,1,3,0)}` | pairing `−b+1/2` with `−b′+1/2` needs `a+a′−b−b′=−2`: false on every instance (and impossible for dominant weights); the other pairing holds exactly when `a−b=a′−b′`: `False, True, True, True` | Pass |
| §2.6 purity: route | irreducible `(𝔤,K_∞)`-modules with this regular integral infinitesimal character | the finite-dimensional `V_λ^∨` (excluded by genericity) and the irreducible principal series `Ind(χ₁,χ₂)` of the mixed pairing; the reducible `Ind` of the other pairing has `V_λ^∨` as a constituent and the same principal series as the other | Pass |
| §2.6 Check `λ_τ=(1,0)`, `λ_τ̄=(0,0)` | | `a+b′=1`, `b+a′=0`; `(k,0),(k,0)`: `k=k` | Pass |
| §2.6 `Ω₁(𝔫)` as a kernel | `γ∈U₁(𝔫)`: `c≡0`, `d≡1` | `det γ=ad−bc≡a`; `det≡1 ⟺ a≡1`; `det:U₁(𝔫)→(𝒪_F/𝔫)ˣ` onto via `diag(u,1)`; index `#(𝒪_F/𝔫)ˣ`; `𝔫=𝒪_F`: both `GL₂(Ô_F)` | Pass |
| §2.6 Check “such `u` exist when `#(𝒪_F/𝔫)>2`” | `F=ℚ(√−7)`, `𝔫=2𝒪_F` | `𝒪_F/𝔫≅𝔽₂×𝔽₂`, `4` elements, units `{1}`; `Ω₁(𝔫)=U₁(𝔫)` | R02 |
| §2.6 Williams's space with moderate growth | five conditions plus growth | cuspidal, `K_∞`-finite, `Z(𝔤)`-finite, moderate growth: the ALS.F.6 cusp forms of that type; without growth the eigenspace is infinite dimensional (previous review) | Pass |
| §3.1 local relation | `q∈{2,3,5}` | `(q+1)²=9,16,36`; `(q²+q)+(q+1)=9,16,36`; with Hecke's `T(q²)=T_{q²}+S`: `(q²+q+1)+q·1=9,16,36`, so the coefficient `q` belongs to the composite operator only | Pass |
| §3.1 normalisation of the relation | `e=2` for `T_v²`, `T_{v²}`, `S_v` | §1.3 line 479: algebraic twist `=ν_alg(π_v)^e·` normalised; each term rescales by `ν_alg(ϖ_v)^{−2}`, the relation is invariant | Pass |
| §3.1 eigenvalues on constants | | `T_v: q+1`, `T_{v²}: q²+q`, `S_v: 1`, `U_v: q`; `(q+1)²=(q²+q)+(q+1)` | Pass |
| §1.3 dictionary locator | `buzzard-eigen` 2511 | `k=n+2`, `w=v+n+1`, printed page 70 | Pass |
| Carried: §0.1 determinant vs `nrd`, definiteness | `diag(2,1)`; `ℍ[ℚ]`, `1+i`; `diag(1,−1)` | `nrd=2`, `det=4`; norms `2`, `−1` | Pass (84012cc) |
| Carried: §0.2 indices, last-row map, `c(η_p)`, global scalar | `q=3`, `t=1,2`; `p=5`; `nrd γ=2` | `4,8`; `12,72`; `c=1,2,1/3`; `c=1` | Pass (84012cc) |
| Carried: §0.3 fibre formula | Hurwitz, `U′=U∩U₁(3)` | `#U/U′=8`, `#Γ=24`, `#Cl(U′)=1`, mass `8/24=1/3` | Pass (84012cc) |
| Carried: §0.4 coset representatives, `x_α∈UηU`, `c` condition | `π=3`, `t=2` | lower-left `−3,−9,−9`; `z=−1↦∞` | Pass (84012cc) |
| Carried: §1.1 scalar action, Jacobs dictionary, `p=2` exponential | `2I`, `n=u³`; `κ_J=u^kε` | `8`, `32`; `n=u^{k−2}ε`; `exp` on `4ℤ₂` | Pass (84012cc) |
| Carried: §1.2 right action, row bound, generating series | `γ=diag(3,1)`, `δ=((1,0),(3,1))`, `z=1`; `w=3z` | `3/4=w_{γδ}(1)`, reversed `3/10`; `σρ^{m−1}≤σ^m`; `1,3z,9z²` | Pass (84012cc) |
| Carried: §1.3 `ν_alg` vs `ν_norm`, nonparallel unit, odd scalar | `diag(π,1)`; `ℚ(√2)`; `−I` | `π` vs `1`; `3−2√2` infinite order; invariants `0` | Pass (84012cc) |
| Carried: §2.1 norm; §2.2 dimension; §2.3 averaging | two classes; `[U₀(p^t):U₀(p^{t+s})]=p^s`; `C₂` on `ℤ₂` | `max(‖a‖,‖b‖)`; `p^s(k+1)`; `‖1/2‖=2` at `p=2` | Pass (84012cc) |
| Carried: §2.4 dual central character; §2.5 homogenisation, covariance, Hecke transport, realisation, dimension | `Sym²`; `λ=(n+v,v)`; `η=diag(p,1)`, `v=1` | `z²` vs `z^{−2}`; factor `p`; `n+1` | Pass (84012cc) |
| Carried: §2.6 `X^G`, `τ_k`, `U(2)`-types, Casimir, Williams twist, Hecke factor, cuspidal degrees | `8−5=3`; `e^{iθ}`; `(n,t)=(2k+2,0)`; `k=1,z=2`; `η=diag(ϖ_v,1)` | `3`; `1`; `k²/2+k`; `1/4`; `q_v^{k/4}`; `(q₀,ℓ₀)=(1,1)` | Pass (84012cc) |
| Carried: §3.1 composition order; §3.2 certificate; §3.3 contraction | `S₃`, `a=(01)`, `b=(12)`; one class; `diag(1,π,π²,…)` | `2` vs `1`; `#k_v` terms; `z₂ⁿ` fixed | Pass (84012cc) |
| Carried: §4.1–4.4 Fredholm series, polygon, cutoff, classical factor, Gauss norm, Mahler action, exponent grid, row exponents, character example | `f(z)↦f(πz)`; `h=2`; `p=2,3`, `diag(p,1)`; grid `p∈{2,3,5,7}`, `m,n<80` | `∏(1−π^jT)`; partial sums `0,0,0,1,2,4,6,9,12`; columns `[0,2,0,0,0]`, `[0,1,4,0,0]`, `[0,0,4,8,0]`; no counterexample | Pass (84012cc) |
| Carried: §5.1 Bol; §5.2 scalars; §5.3 factorisation and classicality | `(2,1,3,1)`, `r=1`, `j=0`, `z₀=1/2`; `U=((1,7),(0,3))` | `−4/25`; `p^r, ℓ^r, ℓ^{2r}`; `(1−T)(1−3T)`; `v_p(λ)<r` Neumann | Pass (84012cc) |

## Not verifiable

- **Gross, *Algebraic modular forms* (1999)** and **Harder (1987), §3**: paywalled, uncertified, unchanged since the previous review; neither is touched by the diff.
- **Published numbering of Williams (2017):** arXiv v2 was read; the page of R03 is the arXiv page.

## Source issues

- **Gap** in williams at Definition 1.2, printed p. 4: the source defines cusp forms by covariance, invariance, one Casimir equation and the cuspidal integral, with no growth condition; it should include moderate growth, which the Fourier expansion it takes from Hida presupposes; affects a stated result.
- **Error** in williams at Theorem 1.3, printed p. 5: the source says the level `Ω₁(𝔫)` decomposition has one component per ideal class; it should have one per class of `Kˣ\𝔸_{K,f}ˣ/(1+𝔫Ô_K)ˣ`, since `det Ω₁(𝔫)=1+𝔫Ô_K` by Definition 1.1; affects a stated result.
