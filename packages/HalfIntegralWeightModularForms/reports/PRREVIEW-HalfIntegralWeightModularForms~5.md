# Review of HalfIntegralWeightModularForms (pull request #1721 at a1c52cf)

**Verdict:** needs changes

This is an incremental re-review of the **32 changed lines since 1a78fdd**: README 115–116, 349–369 and 1437–1443. Suggested.lean is unchanged. The gate passes. Both findings are P3, and both come from the same fact. The new "From Tau Ceti main" bullet and the changed §5.3 sentence cite Tau Ceti declarations that exist at main's Tau Ceti pin `2fd255d`. They do not exist at this branch's pin `358314d`, which is the pin Suggested.lean was built against.

## R01 (P3) — The new Tau Ceti contract uses main's pin; Suggested.lean and the Kronecker adapter use this branch's pin

**Location.** `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:349`–350 and 1440–1442: “From Tau Ceti main, cited by module path and not declared here” … “(`TauCeti.kroneckerSym` on Tau Ceti main) at a positive second argument, written with this closed formula only so that the headline elaborates at the pins”.

**Claim.** The supplier contract consumes `TauCeti.kroneckerSym` and 13 other Tau Ceti declarations. §5.3 keeps `HalfIntegralForm.kroneckerSymNat` because `TauCeti.kroneckerSym` is not available at the pins.

**Witness.** This branch pins Tau Ceti `358314d`. None of the 14 names exists there (no `ThetaSeries/`, `JacobiTheta/` or `KroneckerSymbol.lean`). Main's manifest pins `2fd255d` (a891cd19, which is not in this branch's base c9940702). All 14 exist there, e.g. `KroneckerSymbol.lean:84`.

This branch does not change `lake-manifest.json`, so after the merge the pin is `2fd255d`. At that pin two things go wrong:

- The clause "only so that the headline elaborates at the pins" becomes false.
- `kroneckerSymNat` duplicates a pinned declaration.

Before the merge, the bullet's contracts cannot be checked at the pin the build uses. The two changed passages are consistent with each other only while the branch stays behind main.

**Repair.** Rebase onto main and re-run the gate at `2fd255d`. Then:

1. Write the bullet as an ordinary pinned "From Tau Ceti" contract. Drop "Tau Ceti main" and "has landed" (README 115–116, 349, 1441).
2. State `HalfIntegralForm.kohnenLift` with `(TauCeti.kroneckerSym D d : ℂ)`, importing `TauCeti.NumberTheory.LegendreSymbol.KroneckerSymbol`. Delete `kroneckerSymNat` from Suggested.lean.
3. Replace the §5.3 sentence 1437–1443 by: "Its Kronecker symbol is `TauCeti.kroneckerSym`, which for `d ≥ 1` is `χ₈(D)^{v₂(d)} (D/d')` with `d'` the odd part of `d`." Keep the Checks at 1425–1427.

Tested on the instance that refutes the current text:

- `TauCeti.kroneckerSym_of_ne_zero` (`KroneckerSymbol.lean:96`) gives, at `b = d ≥ 1`, sign factor `1` times `χ₈ D ^ v₂(d) · jacobiSym D (ordCompl[2] d)`. This is the adapter's formula, since `factorization d 2 = padicValNat 2 d`.
- 3000 comparisons agree: 15 discriminants `1, 5, 8, 12, 13, 21, 24, 28, −3, −4, −7, −8, −15, −20, −23` against `d = 1…200`.
- At `D = 5`, `d = 1, 2, 3, 4, 6, 8`, both give `1, −1, −1, 1, 1, −1`. At `(−4, 2)` both give `0`; at `(8, 3)` both give `−1`.
- They differ only at `d = 0` (`(5/0) = 0` against the adapter's `1`). `n.divisors` with `0 < n` never reaches `d = 0`.

If the branch is to stay on `358314d`, delete the bullet at 349–369 and the parenthesis at 1441 instead, because nothing they name exists at that pin.

## R02 (P3) — The map of landed names is incomplete, and its closing sentence leaves out the landed vector-valued law

**Location.** `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:349`–350 and 367–368: “the landed part of the theta-series roadmap that this roadmap consumes, under its Tau Ceti names” … “None of these is an odd-rank modularity theorem or a vector-valued inversion law”.

**Claim.** The bullet lists the Tau Ceti counterparts of what this roadmap consumes from ThetaSeries.

**Witness.** At `2fd255d`, these consumed items have also landed:

| Consumed here | Landed as |
|---|---|
| `IsEven`, `IsIntegral` | `ZLattice.IsEven`, `ZLattice.IsIntegral` |
| `level`, `det` | `ZLattice.level`, `ZLattice.det` |
| `gaussSum` | `ZLattice.gaussSum` |
| `thetaSeries_scale`, `thetaSeries_int` | `ZLattice.thetaSeries_smul`, `ZLattice.thetaSeries_span_one` |
| §2.3's `hasSum_thetaCoset` | `ZLattice.IsEven.hasSum_thetaCoset_qParam` |

In addition, `ZLattice.IsIntegral.thetaCoset_S_smul` is a vector-valued inversion law.

**Repair.** Add these to the map, with their files:

- `ZLattice.IsEven` and `ZLattice.IsIntegral` (`TauCeti/Algebra/Module/ZLattice/Integral.lean`)
- `ZLattice.level` (`…/ZLattice/Level.lean`)
- `ZLattice.det` (`…/ZLattice/Determinant.lean`)
- `ZLattice.gaussSum` (`…/ZLattice/GaussSum.lean`)
- `ZLattice.thetaSeries_smul` (`…/ThetaSeries/Functoriality.lean`)
- `ZLattice.thetaSeries_span_one` (`…/ThetaSeries/RankOne.lean`, which also has `ZLattice.thetaSeries_sqrt_two_smul_span_one`, θ as `Θ_{√2ℤ}`)
- `ZLattice.IsEven.hasSum_thetaCoset_qParam` (`…/ThetaSeries/QExpansion.lean`)

Then replace the closing sentence by: "In even rank, the vector-valued inversion law `ZLattice.IsIntegral.thetaCoset_S_smul` (`…/ThetaSeries/Inversion.lean`) and the `Γ₀(N)` law up to a Gauss sum, `ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul` (`…/ThetaSeries/CosetSplitting.lean`), have landed. Nothing in odd rank has, and Layer 2 owns the odd-rank theorem."

Tested:

- Both landed theorems assume `finrank ℝ E = 2 * k` (`Inversion.lean:160`, `CosetSplitting.lean:140`), so neither covers rank `2k + 1`. The ownership claim of Layer 2 stands.
- Each new counterpart was compared with the ThetaSeries roadmap's declaration on main:
  - `IsEven` has an identical body.
  - `level`: `N‖x‖² = 2m` is equivalent to `N‖x‖²/2 = m`.
  - `det` is `covolume²` on both sides.
  - `gaussSum` is the same sum over `L/cL`.
  - `thetaSeries_smul` (for `c ≠ 0`) contains `thetaSeries_scale` (for `c > 0`).
  - `thetaSeries_span_one` is `thetaSeries_int`.
- `thetaSeries_orthSum` correctly stays unmapped: only the carrier `ZLattice.orthSum` (`OrthSum.lean:83`) has landed, with no theta product.

## Previous findings

- none — the report at 1a78fdd (r4) raised no findings of its own. The R01–R04 it lists belong to the report before it and are recorded there as repaired. The passages they concern (`Suggested.lean:266`, README 124–127, 565–568, 1692–1701, 1932–1933) are untouched by this diff.

## Verified sound

**Scope, gate, elaboration.**

- The diff since 1a78fdd touches only `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md` (27+/5−).
- The pull request's diff outside the folder is empty, and the worktree is clean.
- The gate rerun with the configured order reported only `depcheck: NOT IN ORDER: HalfIntegralWeightModularForms`. A roadmap that the order does not yet list is not a finding.
- The gate rerun with the supplied candidate order and the targeted build:

```text
gate HalfIntegralWeightModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

- The dependency check (`--movable`, candidate order, content main) found no UPWARD, CYCLE or moved line:

```text
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

- `lake env lean` on Suggested.lean at this branch's pin gave **17 warnings, all `declaration uses sorry`**, and no errors.
- Suggested.lean is unchanged. r4's `#check @name` pass (42 declarations, no lost binder) and its one-tactic probe (17 admissions; none closed by `rfl`, `simp` or `infer_instance`) therefore stand. The supplied signatures file again reports 0 lost binders.

**Library declarations opened: 34 at Tau Ceti `2fd255d`, plus the absence check at `358314d`.**

At `358314d`, `TauCeti/NumberTheory/ModularForms/` has no `ThetaSeries/` or `JacobiTheta/` and `LegendreSymbol/` has no `KroneckerSymbol.lean`. A grep of `TauCeti/` finds none of the 14 cited names. The only near-matches are the unrelated `TauCeti.IntegralLattice.representationNumber` and `IntegralLattice.DiscriminantGroup`.

At `2fd255d`, every name in the new bullet exists as cited:

| File | Declarations (line) |
|---|---|
| `ThetaSeries/Basic.lean` | `ZLattice.thetaSeries` (102), `thetaCoset` (108), `thetaCoset_add_mem` (132) |
| `ThetaSeries/DiscriminantGroup.lean` | `thetaCosetClass` (56) |
| `ThetaSeries/QExpansion.lean` | `IsEven.hasSum_thetaSeries_qParam` (143), `IsEven.qExpansion_thetaSeries_coeff` (152) |
| `ThetaSeries/Translation.lean` | translation laws (71–238) |
| `ThetaSeries/Cusp.lean` | `isBoundedAtImInfty_thetaSeries` (84), `tendsto_thetaSeries_atImInfty` (120) |
| `ZLattice/Shell.lean` | `representationNumber` (97), `cosetRepresentationNumber` (108) |
| `ZLattice/Determinant.lean` | `DiscriminantGroup` (90) |
| `KroneckerSymbol.lean` | `TauCeti.kroneckerSym` (84), `TauCeti.kroneckerChar` (376; explicit coefficient ring `R`, the roadmap's at `R = ℂ`) |
| `JacobiTheta/OneVariable.lean` | `TauCeti.jacobiTheta_I_mul` (75), `TauCeti.tendsto_jacobiTheta_comap_im_atTop` (129) |
| `JacobiTheta/GaussSum.lean` | `TauCeti.sum_range_cexp_two_pi_I_sq_div` (227) |

R02's declarations, also opened at `2fd255d`:

- `ThetaSeries/Inversion.lean`: `IsIntegral.thetaCoset_S_smul` (159)
- `ThetaSeries/CosetSplitting.lean`: `IsEven.thetaSeries_slash_eq_gaussSum_smul` (140)
- `ZLattice/GaussSum.lean`: `gaussSum` (176), `IsEven.gaussSum_eq_jacobiSym` (562)
- `ZLattice/Integral.lean`: `IsEven` (75), `IsIntegral` (124)
- `ZLattice/Level.lean`: `level` (113)
- `ZLattice/Determinant.lean`: `det` (158)
- `ZLattice/Dual.lean`: `dual` (78)
- `ZLattice/OrthSum.lean`: `orthSum` (83)
- `ThetaSeries/Functoriality.lean`: `thetaSeries_smul` (74)
- `ThetaSeries/RankOne.lean`: `thetaSeries_span_one` (37), `thetaSeries_sqrt_two_smul_span_one` (45)
- `ThetaSeries/QExpansion.lean`: `IsEven.hasSum_thetaCoset_qParam` (207)

**Cross-roadmap citations resolved: 14.** I compared the bullet's 11 "is its" identifications with the ThetaSeries roadmap's Suggested.lean on main (`TauCetiRoadmap/ThetaSeries/Suggested.lean`): `discGroup` 233, `repNum` 325, `cosetRepNum` 335, `kroneckerSym` 563, `kroneckerChar` 597, `thetaSeries` 641, `thetaCoset` 645, `thetaCoset_add_mem` 655, `thetaCosetClass` 663, `hasSum_thetaSeries` 688, `qExpansion_thetaSeries_coeff` 692. For R02 I also read `thetaSeries_scale` 708, `thetaSeries_orthSum` 712 and `thetaSeries_int` 728.

Each identification holds:

- The bodies of `thetaSeries`, `thetaCoset`, `repNum` and `cosetRepNum` are identical.
- `DiscriminantGroup` uses `submoduleOf`, which is `comap` along the subtype, the roadmap's quotient.
- The landed q-expansion needs only a finite-dimensional normed space and a discrete `L`, so it contains the roadmap's version.

The ModularForms roadmap on main (`TauCetiRoadmap/ModularForms/README.md:269`–271) cites the same `TauCeti.kroneckerSym` file.

**Ownership.** `roadmaps grep` for `ZLattice.thetaSeries` finds three other roadmaps that cite the landed name as consumers: GeometryOfNumbersAndQuadraticArithmetic README 1234, SiegelModularForms README 314, ThetaInvariantsOfEuclideanLattices README 75. A case-insensitive search for odd-rank ownership finds no other owner of odd-rank theta modularity. The changed passages add no owned object. Open pull requests without supplied files were seen only through the tool's index.

**Seeded sample.**

- §5.3 is the only one of the 15 seeded targets that intersects the diff. Its changed sentence is a library convention, checked against the pinned definitions above. It adds no source locator, and no source was fetched.
- §0.1's θ facts and §§2.2–2.3's theta-series names are cited by the new bullet. Their statements are unchanged: README 321 already records `jacobiTheta τ = θ(τ/2)`, and the new `jacobiTheta` citations are consistent with it (table below).
- The other targets keep r4's results.
- The README's `uncertified` locators (1453, 1455, 1512, 1558) are settled and untouched.

**Remark (untouched text, no finding).** The Suggested.lean docstring says odd-rank lattice modularity "lacks ThetaSeries' real-lattice theta-form bridge". That holds at `358314d`. At `2fd255d`, `ZLattice.thetaSeries`, `ZLattice.IsEven`, `ZLattice.level`, `ZLattice.det` and `TauCeti.kroneckerSym` all exist.

**Adversarial pass: 12 fresh rows for the changed statements.**

| Statement | Instances and computed values | Result | Change |
|---|---|---|---|
| Pin of the 14 cited names | `358314d`: 0 of 14 present; `2fd255d`: 14 of 14 present, at the lines above | The contract is not checkable at the build's pin | R01 |
| `ZLattice.thetaSeries` is ThetaSeries' `thetaSeries` | Both bodies are `∑' v, cexp(π I ‖v‖² τ)`. `L = √2ℤ`, `τ = 0.17+0.61i`: `Θ_L = 1.0208598886+0.0379439392i = jacobiTheta(2τ) = θ(τ)` | Same object, exponent `π` not `2π` | none |
| `IsEven.hasSum_thetaSeries_qParam`, `…qExpansion_thetaSeries_coeff` against the roadmap's `hasSum_thetaSeries` | `A₁`: `r_L(2m)`, `m = 0…9`, `= 1,2,0,0,2,0,0,0,0,2`, the coefficients of `θ = 1+2q+2q⁴+2q⁹`; both need `IsEven`; landed hypotheses weaker | Identification sound | none |
| `representationNumber`, `cosetRepresentationNumber`, `DiscriminantGroup` | Same `ncard` of shells. `A₁`: `L^∨ = ℤ/√2`, discriminant group of order `2 = det`, norm-2 shell of size 2 | Sound | none |
| `TauCeti.kroneckerSym` against `kroneckerSymNat`, `d ≥ 1` | 3000 pairs agree; `(5,d)`, `d = 1,2,3,4,6,8`: `1,−1,−1,1,1,−1`; `(−4,2) = 0`, `(8,3) = −1`; Legendre-at-2 model gives `(5/2) = 1`, rejected | Agree; junk only at `d = 0` | R01 |
| `TauCeti.kroneckerChar` at `R = ℂ` | `D = −4`: value at `−1` is `kroneckerSym(−4,3) = −1 = sign D`; `D = 5`: `kroneckerSym(5,4) = 1` | Sound | none |
| `TauCeti.jacobiTheta_I_mul` | `y = 0.25, 0.3, 1, 4`: both sides `2.000013949369`, `1.825845264934`, `1.086434811213`, `1.000006974685`. Wrong model, law read on README θ: `θ(4i) ≈ 1` against `θ(i/4)/2 = 0.7097` | Holds for `jacobiTheta`; θ needs `τ = 2z`, as README 321 says | none |
| `TauCeti.tendsto_jacobiTheta_comap_im_atTop` | `jacobiTheta(iy)`, `y = 2, 5, 10`: `1.003734885488`, `1.000000301403`, `1.000000000000` | Limit 1 at `i∞` | none |
| `TauCeti.sum_range_cexp_two_pi_I_sq_div` | `N = 1…8`: sums `1, 0, i√3, 2+2i, √5, 0, i√7, 2√2(1+i)` equal `(1+i)/2·(1+(−i)^N)√N`; `N = 0`: both `0` | Sound | none |
| "None of these is … a vector-valued inversion law" | True of the 14 listed; `IsIntegral.thetaCoset_S_smul` (`Inversion.lean:159`) is one, with `finrank = 2k` | Misleading by omission | R02 |
| Completeness of the map | 8 consumed items landed but unlisted (R02 table); `thetaSeries_orthSum` not landed | Incomplete | R02 |
| README 115–116 pointer | It points to *Exact supplier contracts*, where the bullet is at 349 under *From Tau Ceti* (332) | Resolves | wording in R01 |

**Adversarial pass: 85 rows carried forward from r4** for the statements this diff leaves untouched. These are r4's computed values, not rerun here. r4's three `kroneckerSymNat` rows are replaced by the fresh Kronecker row above. R-numbers inside these rows refer to the findings of the report before r4.

| Statement | Instances and computed values | Result | Evidence |
|---|---|---|---|
| §0.5 unary coefficient Check, README 565–568 | `m=1,2,3,5`: Pairing the terms indexed by `m,−m` gives `2mχ₋₄(m)=2,0,−6,10`, equal to the repaired coefficients | R02 repaired; even squares are zero | r4 |
| §0.5 growth comparison | `m=1,3,9`, `n=m²`: `abs(a(n))/n^(3/4)=2,2/√3,2/3`, equal to `2/√m`; limit 0 | Compatibility with the estimate, not evidence of sharpness | r4 |
| Ownership of §0.5 bound, README 124–127 | Weight 3/2, `n=9`; weight 1/2, `n=1`: General exponents are `3/4` and `1/4`; unary `abs(a(9))=6` versus `9^(3/4)=3√3`, requiring only `C≥2/√3` at that index. The supplied estimate excludes weight 3/2 and nonsquarefree 9 | R04 repaired; the two scopes are distinct | r4 |
| §1.3 character-general divisor sum, Suggested.lean 266–278 | `k=1,N=192,t=3,f=h_{χ₋₄,3},χ=(12/·)`; `n=1…5`: Divisor sums `2,0,−6,0,12` equal the new README Check. At 5 the terms are `10+2=12`; dropping χ yields `10−2=8` | R01 repaired; χ materially affects the lift | r4 |
| §1.3 input character law | Same input; `γ=[[77,2],[192,5]]`: `det γ=77·5−2·192=1` and `χ(5)=(12/5)=−1`; normalized transformation multiplier is −1, while the trivial-character law requires +1 | Nonzero unary input separates the two statements | r4 |
| §1.3 character descent Check, README 729–730 | `N=16,χ(−1)=1,χ(3)=i`: `χ(1)=1,χ(9)=i²=−1` while `1≡9 mod 8`; their squares are both 1 | χ need not descend; χ² does | r4 |
| §1.3 descent mechanism, README 739–740 | `N=4,8,12,16,192`: Kernels on units are `{1,3},{1,5},{1,7},{1,9},{1,97}`; squaring gives `{1}` each time. Generally `(1+N/2)²−1=N+N²/4` is divisible by N | Every χ² is trivial on the kernel; reduction is surjective because N and N/2 have the same prime divisors | r4 |
| §1.3 genuinely nontrivial output character | Odd primitive ψ modulo 5 with `ψ(2)=i`; `f=h_{ψ,1},N=100,t=1,k=1,χ=ψχ₋₄`: Lift coefficients at `n=1,2,3,5,7` are `2,4i,−8i,0,16i` from `2ψ(n)n Σ_{d∣n,(d,100)=1}1/d`. For `[[17,1],[50,3]]`, determinant 1 and `χ(3)²=i²=−1` | Confirms the squared character cannot simply be replaced by 1 | r4 |
| §1.3 trivial specialization and even divisors | Principal character modulo 4, `d=1,2,3`; δ at `k=6,t=1`: Character values `1,0,1` agree with the coprimality indicator; even contribution is 0. `A(2)=a(4)=−56` and `A(3)=9+3⁵=252`, retaining the previous ordinary lift | New signature includes the old theorem without changing the bad-prime convention | r4 |
| §1.3 degenerate cases and natural indices | `f=0;k=1;t=0;N=0;n=0;n=6,d=2`: Zero input gives coefficients 0 and target `F=0`. `k−1=0`. `Squarefree 0` is false; `NeZero 0` impossible; `n=0` excluded. `t·6²/2²=9t` exactly | No division-by-zero or truncated-subtraction defect; weight 2 target may be noncuspidal | r4 |
| §1.3 parity and modularity of output | `γ=−I`; χ odd; `T=[[1,1],[0,1]]`: Input law becomes `f=−f`, hence `f=0`; output multiplier is `χ(−1)²(−1)^(2k)=1`. T lies in both Γ₁ groups and has denominator 1, giving period 1 | No missing evenness assumption: odd χ has only zero input; Fourier period matches the pinned q-expansion | r4 |
| §6.4 corrected Theorem 5 and equation (1) locators | `m=1,k=10` and `k=9`: At k=10, `w=18`, root number `(−1)^9=−1`, cuspidal dimensions `1=1`; at k=9, `w=16`, root number +1, negative-sign space and odd-index-one Jacobi space both 0 | Correct statement unchanged; source locator repaired | r4 |
| §6.4 equation (2) oldspace locator and reference entry | `k=10,m=2,F=E₆Δ`: `B_{2,1}F=F+512F(2z)` has coefficients `1,−528+512=−16`. The larger span of `F,F(2z)` has determinant `1·1−0·(−528)=1` and dimension 2, versus the prescribed old line of dimension 1 | Correct equation (2), p.138; no change to the smaller-oldspace normalization | r4 |
| §0.5 invariant norm | Weight 3/2, `γ=[[1,0],[4,1]], z=i`: `abs(cz+d)=√17`; factor from `abs(f(γz))` is `17^{3/4}`, from `Im(γz)^{3/4}` is `17^{−3/4}`; product 1 | Direct Hecke route works | r4 |
| §0.5 decay at cusps | Positive Fourier exponent `α`, zero form: `y^{(2k+1)/4} exp(−2πα y/w) → 0`; zero form gives 0 everywhere | Use §0.3's cusp Fourier expansion; finite index gives finitely many cusp regions | r4 |
| §0.5 coefficient estimate | Integrate at height `1/n`, `n≥1`: `exp(2πn/n) C(1/n)^{−(2k+1)/4}=C exp(2π)n^{(2k+1)/4}`; exponent `(2k+1)/4=k/2+1/4` | Repairs previous R04; no use of dividing a coefficient bound by theta | r4 |
| §0.5 Petersson convergence after the repair | Two cusp terms `exp(−ay), exp(−by)`, `a,b>0`: Integrand in a cusp is bounded by `exp(−(a+b)y)y^{k−3/2}`; its tail integral is finite | Uses exponential cusp decay from §0.3, not boundedness alone | r4 |
| New theta negative control | `z=iy, y=1,16,256`: `abs(θ(iy))y^{1/4}≈1.0037348855,2,4`, versus a finite uniform bound | Correct exclusion of noncuspidal theta | r4 |
| New reciprocal-theta Check | Degrees 0–8 and 16: Reciprocal coefficients `1,−2,4,−8,14,−24,40,−64,100`; degree 16 is `2062`; multiplying by theta gives `1,0,…,0` | Correct. Polynomially bounded coefficients would give only polynomial radial growth, contradicting the reciprocal's exponential cusp growth at `q=−1` | r4 |
| §1.3 divisor-sum growth | Write `s=k/2+1/4`, positive `t,n,d` with `d∣n`: Each term is at most `C t^s n^{2s}d^{k−1−2s}=C t^s n^{k+1/2}d^{−3/2}`; `d^{−3/2}≤1` | The displayed `τ(n)` bound follows for every divisor, including bad primes with zero character value | r4 |
| Ligozat locator repair, eta order formula | Theta eta quotient: `N=4,(r₁,r₂,r₄)=(−2,5,−2)`; `c=1,2,4`: Cusp orders from the formula are `0,1/4,0`, matching theta's nonvanishing constant terms at 0 and ∞ and order 1/4 at 1/2 | Proposition 3.2.8, printed p.34, is the correct locator | r4 |
| `Int.IsFundamentalDiscr` and sign | `D=1,5,8,12,−3,−4,−7,−8`; controls `0,4,9`: First eight satisfy the squarefree/residue criterion; controls fail. At `k=6`, `D=5` gives sign 5 and `D=−3` sign −3; at `k=9` the latter gives 3 | Pinned predicate includes 1 and even fundamental discriminants; sign is retained | r4 |
| New `kohnenLift`, `D=1` | `δ,k=6,n=1…6`: `1,−24,252,−1472,4830,−6048` on both the divisor-sum and `Δ` sides | Sound; differs from the ordinary lift at 2 | r4 |
| Added `D=5` Check | `c(5)=120,c(20)=960,c(45)=59400`: `A(1)=120`; `A(2)=960−3840=−2880=120(−24)`; `A(3)=59400−29160=30240=120·252` | All three new values agree | r4 |
| New Kohnen lift at even discriminants | `δ,k=6,D=8,12,n=1,2,3`: For 8: `−240,5760,−60480=(−240)(1,−24,252)`; for 12: `1440,−34560,362880=1440(1,−24,252)` | Zeros of the even-denominator character are necessary | r4 |
| New Kohnen lift at negative discriminants | `g=θ⁷F³−16θ³F⁴,k=9,D=−3,−4,n=1,2,3`: `c(3)=1,c(4)=−2`; lifts `1,−528,−4284` and `−2,1056,8568`, respectively `ΔE₆` and `−2ΔE₆` | Checks `D.natAbs`, the sign condition and the two-adic symbol together | r4 |
| Kohnen lift linearity and low-weight boundary | `g=0`; replace `δ` by `iδ`; `k=1`: Zero coefficients on both sides; every coefficient acquires `i` on both sides; level-four weight-3/2 cusp space has dimension 0 and zero lift | No nonzero-input or eigenform hypothesis is needed for existence | r4 |
| §6.3 even bound retained | `(k,m)=(2,6),(4,1)`: Sums `7−8=−1` and `2−1=1`; only the latter has `k>m` | Negative lower bound is not an asserted dimension | r4 |
| §6.3 added odd bound | `(k,m)=(11,2),(3,1),(1,2),(5,3),(7,4)`: Modular-dimension sum minus polar count: `2−1=1,0−0=0,0−1=−1,2−2=0,4−3=1` | Source matches; equality applies exactly when `k>m` in these tests | r4 |
| §6.3 odd endpoints and weak-form kernel | `r=0,m`, odd `k`; `m=2,r=1`: Reflection and residue equivalence give `c=−c`, hence `c=0`, at endpoints; `ceil(1/8)=1` polar condition at the interior residue | Correct odd summation range; remaining dimension is weak dimension minus the actual rank | r4 |
| Added odd Jacobi example | `Δφ_{−1,2}`, `m=2,k=11`: Leading `qζ` and `−qζ^{−1}` have discriminant `8−1=7>0`; weak discriminants at index 2 are at least −4 and multiplication by `Δ` adds at least 8 | Nonzero and holomorphic, consistent with dimension 1 and the stated lower bound 4 for discriminants | r4 |
| 0.1 `j = θ(γz)/θ(z) = ε_d^{−1}(c/d)(cz+d)^{1/2}` | `z = 0.13+0.71i`, nine matrices of `Γ₀(4)` incl. `[[3,1],[8,3]]`, `[[−1,0],[8,−1]]`, `[[7,4],[12,7]]`, `[[3,2],[64,43]]`, `−I`, `T`: ratio and formula agree to `3·10⁻¹⁴` | sound | r4 |
| 0.1 `j(−I) = 1`, `ν_θ(−I) = −i`, `ν_θ([[3,1],[8,3]]) = i` | `1/(−1)^{1/2} = −i`; `ε₃^{−1}(8/3) = (−i)(−1) = i` | sound | r4 |
| 0.1 `W₄`-law `θ(−1/(4z)) = (−2iz)^{1/2}θ(z)` | `z = i`: `1.4194954880837662` both sides; `z = 0.3+0.8i`: `1.28393−0.21624i` both | sound | r4 |
| 0.2 carrier, zero and theta | law `0 = 0`; `θ`: identical products; cusp bound of `e(−z)` fails (`e^{2πy}`) | sound | r4 |
| 0.3 `coeff` as a line integral | `∫₀¹ e(−n(x+i)) Σa(m)e(m(x+i)) dx = a(n)` (`e^{−2πn}e^{2πn}`); `coeff_add`, `coeff_smul` proved in the file | sound | r4 |
| 0.3 product twists | `f` weight `k+1/2`, `g` weight `l`: `(cz+d)^l = χ₋₄(d)^l j^{2l}`; two half-integral: `j^{2(k+l+1)} = χ₋₄^{k+l+1}(cz+d)^{k+l+1}` | sound | r4 |
| 0.4 `m_θ` into `modFormCharSpace (k+1)(χχ₋₄^{k+1})` | `χ(d)j^{2k+2} = χ(d)χ₋₄(d)^{k+1}(cz+d)^{k+1}` | sound | r4 |
| 0.4 odd character | `−I`: `f = χ(−1)f` forces `f = 0` | sound | r4 |
| 0.6 `F`, `W₄F` | `(E₂ − 3E₂(2z) + 2E₂(4z))/(−24) = q + 4q³ + 6q⁵ + 8q⁷`; `(E₂ − 6E₂(2z) + 8E₂(4z))/48 = 1/16 − q/2 + 3q²/2 − 2q³ + 3q⁴/2 − 3q⁵`; `−3+9−6 = 0` nonholomorphic parts cancel; `W₄F` derived from `E₂(−1/τ) = τ²E₂(τ) + 6τ/(πi)` | sound | r4 |
| 0.6 cusp `1/2` | `θ(Az)(2z+1)^{−1/2}` vs `2η(4z)²/η(2z)` at `z = i`: `0.415760602596027` both; at `0.2+0.5i`: `0.86563+0.28231i` both; order `1/4`; `(2k+1)/4 mod 1 ∈ {1/4, 3/4}` | sound | r4 |
| 0.6 dimensions | `⌊k/2⌋+1`: `1,1,2,2,3,…`; `⌊(k+1)/2⌋+1` (even `k+1`) and `(k+2)/2` (odd) give `dim M_1(4,χ₋₄) = 1`, `M_2(4) = 2`, `M_3(4,χ₋₄) = 2`, `M_4(4) = 3`; evaluation map `θ^{2k+1} ↦ (1,1)`, `θ^{2k−3}F ↦ (0,1/16)` needs `k ≥ 2` | sound | r4 |
| 1.1 weight-`1/2` eigenvalue | `θ`, `p = 3`: `b(0) = 1 + 1/3 = 4/3`, `b(1) = 2 + 2/3 = 8/3 = (4/3)·2` | sound | r4 |
| 1.2 Euler quotient | `θ, p=3`: `(1−X/3)/(1−4X/3+X²/3) = 1/(1−X)`; `δ, p=3`: `X`-coefficient `252−243 = 9 = a(9)` | sound | r4 |
| 1.3 ordinary lift | `δ`: `A₁(n) = 1,−56,252,−704,4830,−14112,−16744` `=` `Δ(z)−32Δ(2z)`; sign test `9+243 = 252` vs `9−243 = −234` | sound | r4 |
| 1.3 `k = 0` obstruction | `A₁(1), A₁(2), A₁(5) = 2, 2, 12/5` with `(d,4) = 1` | sound | r4 |
| 2.1 characters | `A₁`: `(4/d) = 1`; `A₃`: `(8/3) = −1`; `diag(2,2,6)`: level `12` (`N·A⁻¹` even needs `N/6` even), `(48/5) = (3/5) = −1`; `v₂(det)` even forces a type-I constituent at `j ≥ 2`: with all type-I at `j = 1`, `v₂(det) ≡ rank L₁ ≡ 1` | sound | r4 |
| 2.2 `Θ_{A₃}`, `Θ_{D₅}` laws | coefficients `1,12,6,24,12,24,8,48` and `1,40,90,240,200,560` by enumeration; law `Θ(γz) = (8/d) j³Θ(z)`, `(8/d) j⁵Θ(z)` at `z = (−d+i)/c` for `[[1,0],[8,1]]`, `[[−1,0],[8,−1]]`, `[[3,1],[8,3]]`, `[[5,3],[8,5]]`, `[[−3,−1],[16,5]]`: relative error `≤ 10⁻⁹`; the even-rank sign `(−8/d)` fails at `[[−1,0],[8,−1]]` and `[[3,1],[8,3]]` (relative error `2`) | sound | r4 |
| 2.2 `diag(2,2,6)` | law with `(3/d)` at `[[5,2],[12,5]]`, `[[7,4],[12,7]]`, `[[−5,−3],[12,7]]`: error `≤ 5·10⁻¹⁴`; trivial character fails (error `2`) | sound | r4 |
| 2.2 `Θ_{E₇}` | `θ⁷ + 112θ³F`: `14+112 = 126`, `84+672 = 756`, `280+1792 = 2072` | sound | r4 |
| 2.2 sum characters | `(2detL/d)(2detM/d)(−1/d)^{k+l+1} = ((−1)^{k+l+1}detL·detM/d)` | sound | r4 |
| 2.3 coset of `√2ℤ` | `2q^{1/4}+2q^{9/4}+…`, `e(1/4) = i` under `T`, `1` under `T⁴` | sound | r4 |
| 2.4 odd lattice | `Θ_{√2L}(z/2) = Σe(‖v‖²z/2) = Θ_L(z)` | sound | r4 |
| 3.1 phase | `(−I,−I,√2)`: `e^{2πi√2}`, modulus `1`, infinite order; `r = 1/2`: `−1`; `r = 1`: `1`; `σ_r` from `J(γδ) = J(γ,δz)J(δ,z)` | sound | r4 |
| 3.2 `η(z)η(11z)` | at `T`: `e(1/24)e(11/24) = −1` | sound | r4 |
| 3.3 Dedekind sums | `s(1,3) = 1/18`, `s(3,7) = −1/14`, `s(3,7)+s(7,3) = −1/63 = 59/252 − 1/4` | sound | r4 |
| 3.3 Apostol and both closed forms (Lean's exact expressions) | 13 matrices with `c > 0` (odd and even `c`, negative `d`, `S`, `[[1,0],[2,1]]`, `[[−2,−1],[7,3]]`, `[[1,−1],[6,−5]]`, …) at `z = 0.27+0.63i`: all three expressions agree with `η(γz)` to `4·10⁻¹⁴`; `[[1,0],[2,1]]` gives `e(−1/12)` | sound | r4 |
| 3.4 eta quotient character `(2s/·)` | `θ`: `(4/d) = 1`; `η(24z)`: `(48/d) = (3/d) = (12/d)`; `η(8z)³`: `1`; `η(z)²/η(2z) = 2θ(4z)−θ(z)`: `(1/d)`; `η(3z)²/η(6z) = 2θ(12z)−θ(3z)`: `(3/d)` — all agree with Serre–Stark's `ψχ_t` | sound | r4 |
| 3.4 identities | `θ(i) = 1.003734885487739 = η(2i)⁵/(η(i)²η(4i)²) = η(i+1/2)²/η(2i+1)`; `η((i+1)/2)²/η(i+1) = 1.086434811213307` | sound | r4 |
| 4.1 `h_{ψ,t}` series form | `ν = n/r`: `r·(n/r)·e(tn²z)` | sound | r4 |
| 4.1 Fricke identity | `θ_{ψ,t}(−1/(4r²t²z)) = g(ψ)(−2itz)^{1/2}θ_{ψ̄,t}(z)` for `ψ = χ₁₂` (`\|g\| = √12`), the even cubic character mod `7` (`\|g\| = √7`, complex values), `ψ = 1`, `t = 1,2,3`, `z = 0.11+0.37i`: both forms agree to `2·10⁻¹⁵` | sound | r4 |
| 4.1 identities | `θ_{χ₁₂,1}(z) = 2η(24z)`, `h_{χ₋₄,1}(z) = 2η(8z)³` at `z = 0.05+0.21i`: `0.50839+0.16519i`, `0.50843+0.16517i` both sides | sound | r4 |
| 4.2 index sets | `N = 4`: one index; `N = 16`: `(1,1),(1,2),(1,4)` (no primitive even character of conductor `2`), `dim = 3`; `N = 196`: the cubic `ψ` is the only index with `χ = ψ` | sound | r4 |
| 4.3 totally even | `χ₁₂`: `(a,b,u) = (4,3,7)`, `χ₁₂(7) = −1`; conductor `1`: `ψ(u) = 1`; smallest non-totally-even even conductor `12` | sound | r4 |
| 4.4 | `A₁(2) = 2` (restricted), `3` (unrestricted) | sound | r4 |
| 4.5 `T(9)h_{χ₋₄,1}` | coefficients `2,−6,10,−14`; `b(1),b(4),b(9) = −8,0,24 = −4·(2,0,−6)`; `χ(p)(−tm²/p) = ψ(p)` | sound | r4 |
| 4.6 Shimura decomposition | level `4`, weight `3/2`: `0 = 0+0`; `δ`: eigenvalues `252, 4830` are `τ(3), τ(5)` | sound | r4 |
| 4.7 fields | `δ`: coefficients and eigenvalues in `ℚ`; cubic `ψ`: `2, 2ζ₃` | sound | r4 |
| 5.1 `H_{5/2}` | `θ⁵ − 20θF = 1 −10q −70q⁴ −48q⁵ −120q⁸ −250q⁹` (`r₅ = 1,10,40,80,90,112,…,200,250`; `θF = q+2q²+4q³+8q⁴+8q⁵`); `H(2,N) = −1/12,−7/12,−2/5,−1,−25/12` | sound | r4 |
| 5.1 `θ^{2k+1} ∉ M⁺` | `q²`-coefficient `2(2k+1)(2k)`, `2 ≢ 0,1` | sound | r4 |
| 5.2 `W₄U₄` | `U₄θ⁵ = θ⁵ + 80θF`, `U₄(θF) = 8θF`, `W₄(θF) = θ·W₄F = θ⁵/16 − θF`; matrix `[[6,1/2],[−80,−8]]`, eigenvalues `−4, 2`, eigenvector `(1,−20)`; `α_k = (2/(2k+1))2^k = (−1)^{⌊(k+1)/2⌋}2^k` for `k = 2..8`; `k = 1`: `Aθ³ = θ³`, `pr⁺θ³ = 0` | sound | r4 |
| 5.3 `T⁺(4)δ`, `T(9)δ` | `−24, 1344, −2880` at `n = 1,4,5`; `T(9)δ = 252, −14112, 30240 = 252·(1,−56,120)` | sound | r4 |
| 5.3 `Sh_t = Sh_D⁺ − (D/2)2^{k−1}Sh_D⁺(2z)` | even `d = 2d'`: `(D/d)d^{k−1}c(\|D\|n²/d²) = (D/2)2^{k−1}(D/d')d'^{k−1}c(\|D\|(n/2)²/d'²)` | sound | r4 |
| 5.3 dimensions | `dim M⁺_{k+1/2}(4) = dim M_{2k}`: `0,1,1,1,1,2,1,2,2,2`; `M_{13/2}(4)` has dimension `4`, plus part `2` | sound | r4 |
| 5.5 Kohnen–Zagier | kohnen-zagier lines 100–114: `c(\|D\|)²/⟨g,g⟩ = ((k−1)!/π^k)\|D\|^{k−1/2}L(f,D,k)/⟨f,f⟩`, `⟨g,g⟩ = (1/6)∫`, `\|c\|²` for any normalization; `\|c(5)\|² = 14400` for `δ` and `iδ` | sound | r4 |
| 5.7 cycle normalization | `∫₀^{i∞}f(z)z^{k−1}dz = i^kΓ(k)(2π)^{−k}L(f,k)`; `(−1)^{k/2}i^k = 1`; one class of discriminant `1` (`XY`) | sound | r4 |
| 6.1 `E_{4,1}` | `M⁺_{7/2}` generator `θ⁷ − 14θ³F = 1+56q³+126q⁴+576q⁷+756q⁸+1512q¹¹+2072q¹²`; `c(1,r) = 1,56,126,56,1`, `c(2,r) = 126,576,756,576,126`; `c(n,r)` of `E_{4,1}²` depends on `(8n−r², r mod 4)` | sound | r4 |
| 6.2 theta S-law kernel | `m = 3, μ = 1, τ = 0.2+1.1i, z = 0.3+0.1i`: `θ_{m,μ}(−1/τ,z/τ) = (τ/2mi)^{1/2}e(mz²/τ)Σ_ν e(−μν/2m)θ_{m,ν}` (error `6·10⁻¹⁶`); with `e(+μν/2m)` error `3.0` | sound (so the `h`-law has `e(+μν/2m)`) | r4 |
| 6.2 `h`-law on `E_{4,1}² ∈ J_{8,2}` | `h_μ(−1/τ) = e(1/8)τ^{15/2}/2·Σ_ν e(μν/4)h_ν(τ)` at `τ = 0.3+0.9i`, `μ = 0..3`: relative error `≤ 5·10⁻¹⁶`; `h_μ(τ+1)/h_μ(τ) = e(−μ²/8)` (`1, e(−1/8), −1, e(−1/8)`) | sound | r4 |
| 6.4 oldforms | `E₆Δ = q − 528q²`; `B_{2,1}F = F + 2⁹F(2z)`: `1, −16`; `S^−(m) = ⊕_{ld²∣m} S^{new,−}(m/ld²)\|B_{l,d}` is skoruppa-zagier (2), p.138; root number of level one weight `w`: `(−1)^{w/2} = (−1)^{k−1}` | sound | r4 |
| 7.1 record | `dimnew = dim − dimtheta` (lmfdb-code line 103); `newpart` fields `dim_image, half_forms, mf_label, nf_label` (lines 116–121); `thetas` a list of character labels (127–131) | sound | r4 |
| 7.2 search | filters `weight, level, character` only (lmfdb-code lines 56–60) | sound | r4 |
| 7.3 coverage | all 16 rows point at existing milestones; `cmf.shimura_correspondence` says “cusp forms for `k ≥ 5`” (line 102) and uses `(−1/m)` (line 98), as §1.3 records | sound | r4 |
| §5.6 local squareclasses and homogeneous identity | At level 4, `t,t′=1,17` and control 5; also `t=t′=1`: `17 mod 8=1`, `5 mod 8=5`, so only the first pair has matching odd 2-adic squareclass. At `t=t′=1` both terms equal `a(1)²L(F,k)`. Replacing g by ig multiplies both sides by −1 | Checks local admissibility and scaling only; the unequal-index L-value identity remains uncertified here | r4 |
| §7.2 intrinsic prefix | `N=4,k=6,χ=1` and `k=0`: `2·6+1=13` gives `(4,13,1)`; `2·0+1=1` gives `(4,1,1)`, agreeing with the README | Database weight is twice the mathematical weight, not the integral parameter k | r4 |

## Not verifiable

- **Suggested.lean at main's pin.** It was not elaborated at `2fd255d` (Mathlib `1b1ccf4`, Lean v4.36.0-rc2). The Lean commands available to this review run against this branch's pin `358314d`. Whether the file builds after the rebase that R01 asks for is not checked here.
- **"Tau Ceti main".** It is read as the Tau Ceti commit that the content repository's main pins (`2fd255d`). Later Tau Ceti commits were not inspected.
- **Source access.** Inherited from r4 for untouched material:
  - Shimura 1973, Serre–Stark, Kohnen 1980/1982/1985, Waldspurger 1981, and the Cohen, Apostol, Knopp and Koblitz locators were not certified in full.
  - The Eichler–Zagier citation is to the 1983 preprint.
  - The changed passages carry no source locator, so no source was fetched this round.
- **Scope of the checks.** Finite coefficient checks and elaboration do not prove the admitted theorems.

## Source issues

- none
