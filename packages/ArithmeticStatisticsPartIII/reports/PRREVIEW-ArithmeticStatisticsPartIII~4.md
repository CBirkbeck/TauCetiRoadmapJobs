# Review of ArithmeticStatisticsPartIII (pull request #1174 at d732072)

**Verdict:** needs changes

This is an incremental re-review of the 25 lines changed since 478eb42. There are three P3 findings and none at P1 or P2. R01 concerns the new QuadraticFormsOverABase contract. R02 and R03 are the gate's `statement-hygiene` hits: the gate fails on them at this head, so the folder cannot be accepted until they are repaired. Each repair below was applied to a scratch copy and tested there.

## R01 (P3) — The QuadraticFormsOverABase §1.2 contract drops "n odd"

**Location.** `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md:50`: “§1.2 supplies … its independence of the bilinear representative at which `univHalfDisc n` is evaluated, and `δ'(Q)=2^(n−1)·QuadraticForm.discr' Q` when 2 is invertible.”

**Claim.** As written, both facts are attributed to the supplier for every rank `n`. The same paragraph does restrict the §1.1 identity and `halfDisc_comp` to odd `n`.

**Witness.** The supplier states both facts for odd `n` only. See `TauCetiRoadmap/QuadraticFormsOverABase/README.md` §1.2 (lines 367–378 at its open head) and its `halfDisc_eq_of_toQuadraticMap (hn : Odd n)`. Both fail at `n=2` for `Q=x₀x₁` over ℚ. Both triangular representatives give `δ'=−1`. The symmetric representative gives `−3/4`, because Lean computes `(−1)/2=−1` on ℤ. Meanwhile `2·discr' Q = 2·(−1/4) = −1/2`.

**Repair.** Write “§1.2 supplies the half-discriminant `δ'(Q)` … over any commutative ring; for odd `n`, its independence of the bilinear representative …, and `δ'(Q)=2^(n−1)·QuadraticForm.discr' Q` when 2 is invertible.” With this wording the `n=2` instance falls outside the contract. At `n=3`, the only rank §2.8 uses, both facts hold:
- `u²+v²+w²`: `δ'=4=4·1`.
- `uv+w²`: `δ'=−1=4·(−1/4)`.
- `univHalfDisc 3` depends only on `Uᵢᵢ` and `Uᵢⱼ+Uⱼᵢ`.

No other line changes.

## R02 (P3) — Gate: `[Fintype F]` beside `[Field F]` in the smooth-point headline

**Location.** `TauCetiRoadmap/ArithmeticStatisticsPartIII/Suggested.lean:307–311`, theorem `degree_uniform_hypersurface_smooth_points`: “`∀ (F : Type) [Field F] [Fintype F]` … `(Fintype.card F : ℝ) ^ (n - 1)`”.

**Claim.** The gate's `statement-hygiene` rule requires `[Finite F]` beside `[Field F]`. This is one of the six hits that make the gate fail at d732072.

**Witness.** The gate output at this head: “line 307: P3 `[Fintype F]` beside `[Field F]` (theorem `degree_uniform_hypersurface_smooth_points`); repair: use `[Finite F]`”.

**Repair.** Replace `[Fintype F]` with `[Finite F]`, and replace each of the three occurrences of `Fintype.card F` with `Nat.card F`. The repair was tested on a scratch copy:
- The copy elaborates with the same 12 `sorry` warnings.
- In `#check @`, the only changes are that binder and the cardinal.
- The gate's scanners report `statement-hygiene=0` on it.

The README (line 2079) already counts `q=#F_q`, so it needs no change.

## R03 (P3) — Gate: `letI : Fact p.val.Prime` in five signatures, rebuilding a pinned Tau Ceti instance

**Location.** `TauCetiRoadmap/ArithmeticStatisticsPartIII/Suggested.lean`. Each of these has `(φ : (p : Nat.Primes) → letI : Fact p.val.Prime := ⟨p.property⟩ …)`:
- line 384, `AcceptableBinaryWeight`;
- line 404, `binaryWeight`;
- line 411, `binaryLocalMass`;
- line 418, `quartic_acceptable_sieve`;
- line 429, `cubic_acceptable_sieve`.

**Claim.** The gate rejects `letI` in a signature. These five are the remaining hits of the failing `statement-hygiene` check.

**Witness.** The gate output at these five lines. The pinned Tau Ceti already provides the instance that each `letI` rebuilds: `Nat.Primes.instFactPrime (p : Nat.Primes) : Fact (p : ℕ).Prime`, at `TauCeti/Data/Nat/Prime/Basic.lean:41`.

**Repair.**
1. Add `import TauCeti.Data.Nat.Prime.Basic` after `import Mathlib`.
2. Delete every `letI : Fact p.val.Prime := ⟨p.property⟩`. That covers the five `φ` binders and the copies in the bodies of `AcceptableBinaryWeight`, `binaryWeight`, `binaryLocalMass`, `hypersurfacePadicDensity` and `hypersurfaceClasses`.
3. Keep the `MeasurableSpace`/`BorelSpace` `letI` in the bodies of `padicMass` and `AcceptableBinaryWeight`.

This was tested on a scratch copy:
- It elaborates with exactly the 12 `sorry` warnings.
- All 44 `#check @` types are unchanged apart from R02's binder and cardinal.
- The gate's scanners report `statement-hygiene=0` and `imports=0`.

## Previous findings

- R01 — repaired: `README.md:1978` “([12], Theorem 23, §3.6, pp.16–17.)” and `:1986` “([12], Theorem 22, §3.6, p.16.)”. In `bs-four`, line 837 opens §3.6 on p.16, and Theorems 22 and 23 start at lines 851 and 860.

## Verified sound

**What changed.**
- `README.md:11` (scope): QuadraticFormsOverABase owns the half-discriminant.
- `README.md:48–50`: the new contract.
- `README.md:1186–1190`: `Counting.ternaryDet4` identified with `δ'` at `n=3`, and its three laws.
- `README.md:1201`: the variable-change law of the resolvent.
- `README.md:1978`, `:1986`: the §2.19 locators.
- `README.md:2272`: Layer 2 dependencies.
- `Suggested.lean:137–139`: the `ternaryDet4` docstring.

I reviewed each of these in full, together with what cites them.

**Gate, run at this head:**

```text
gate ArithmeticStatisticsPartIII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=6 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The six `statement-hygiene` hits are R02 and R03. The worker's targeted build reported `build=0`.

**Dependency check:**

```text
depcheck: 236 roadmaps, 2274 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The pull request touches only `README.md`, `Suggested.lean` and `metadata.toml` in the folder. The long outside-folder list in the change summary comes from the merge of main between 478eb42 and d732072.

**Elaboration.**
- `lake env lean` on `Suggested.lean` gives exactly 12 warnings, all `declaration uses sorry`, and nothing else.
- I elaborated `#check @` for all 44 declarations (32 definitions, 12 theorems).
- The pins moved with the merge from main: Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4`, toolchain `v4.36.0-rc2`. The file elaborates at these pins.
- The only Lean change is a docstring. `ternaryDet4` keeps the type `{R : Type*} → [CommRing R] → MvPolynomial (Fin 3) R → R`.
- The polynomial in its docstring matches its body at lines 140–145.
- No statement changed, so the previous one-tactic probes and padding verdict carry forward: 12 headlines, no padding.
- The citation resolver's 41 leads are all this roadmap's own `Counting.*` names. All are declared in `Suggested.lean`, and the gate reports `readme-ids-missing=0`.

**Supplier citations, resolved at QuadraticFormsOverABase's open head.** That roadmap is a new folder from another author; this pull request's live description lists it under "Depends on" and in its merge-order chain.

| Cited claim | Where it is at that head | Result |
|---|---|---|
| §1.1: `univHalfDisc n`, homogeneous of degree `n`; `2·univHalfDisc n=det(U+Uᵀ)` for odd `n` | README 343–366; `two_mul_univHalfDisc (hn : Odd n)` | agrees |
| §1.2: `δ'` over any commutative ring; independence of the representative; `2^(n−1)·discr'` | README 367–396; `halfDisc_eq_of_toQuadraticMap (hn : Odd n)` | agrees for odd `n` only (R01) |
| §1.3: `halfDisc_mapCoeffs` for every `n`; `halfDisc_comp` for odd `n` and every matrix; `δ'(aQ)=aⁿδ'(Q)` | README 397–415; Lean `halfDisc_mapCoeffs`, `halfDisc_comp (hn : Odd n) … (g : Matrix …)` | agrees |
| Upper-triangular coefficient matrix | its `coeffMatrix`: `Q(eᵢ)` on the diagonal, `polar` above it, `0` below (README 117–120) | matches `ternaryCoeff` for `i≤j` |
| Direction of supply | its Downstream consumers (README 966–969) name ArithmeticStatisticsPartIII §2.8 as citing 1.1–1.3; it cites nothing back | single direction |

ArithmeticStatisticsPartII §1.3, at its open head, also defines `4 Det` as `halfDisc` at `n=3` and derives its rule from `halfDisc_comp`. So `README.md:1172` (“that supplier's … covariance laws”) and the new `README.md:1186` attribution agree.

**Pinned declarations opened.**
- Mathlib `QuadraticForm.discr'` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1242`), under `[Invertible (2 : R)]` from line 1159.
- Mathlib `QuadraticForm.discr'_smul` (`:1247`), `QuadraticForm.discr'_comp` (`:1250`) and `QuadraticForm.discr_eq_discr'` (`:1283`).
- Tau Ceti `QuadraticForm.det_toMatrix_polarBilin` (`TauCeti/LinearAlgebra/QuadraticForm/Matrix.lean:39`).
- Tau Ceti `MvPolynomial.eval_linearSubst` (`TauCeti/RingTheory/MvPolynomial/LinearSubst.lean:166`) and `map_linearSubst` (`:87`). These turn `halfDisc_comp` on `Q.comp (toLin' g)` into the law for `linearSubst`, and they commute the substitution with forming the pencil over `ℤ[x,y]`.
- Tau Ceti `Nat.Primes.instFactPrime` (`TauCeti/Data/Nat/Prime/Basic.lean:41`).
- Spot checks after the pin move: `ModularGroup.volume_fd_lt_top` and `isFundamentalDomain_fdo` (`TauCeti/NumberTheory/Modular.lean:119`, `:244`), `riemannZeta_two` (`Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:226`) and `UpperHalfPlane.volume_eq_lintegral`.

**Ownership and duplication.**
- `roadmaps grep` finds `ternaryDet4` only in this folder.
- `univHalfDisc`/`halfDisc` are owned only by QuadraticFormsOverABase.
- No other roadmap declares `TauCetiRoadmap.ArithmeticStatisticsPartIII.Counting.ternaryDet4`.
- No open pull request changes this roadmap, drops an id it cites, or is the only definer of an id it cites.
- The closest roadmaps in vocabulary (ArithmeticStatistics Parts I, II, V, VI, VII) hand the half-discriminant to the same owner.

**Source sample.** The seeded sample falls in the changed text only at §2.19. I read `bs-four` (arXiv:1312.7333v1, the version reference [12] fixes) through the sources service:
- §3.6 opens at line 837 (p.16).
- Theorem 22 (line 851, p.16) states the acceptable-weight product formula with error `o(X^(5/6))`.
- Theorem 23 (line 860, p.16, proof ending at line 924 on p.17) states the tail bound `X^(5/6)/(M log M)+X^(19/24)` plus `εX^(5/6)`.

Both agree with `README.md:1972–1986`. The other 14 sampled sections are untouched and keep the source table of `packages/ArithmeticStatisticsPartIII/reports/PRREVIEW-ArithmeticStatisticsPartIII~3.md`.

**Adversarial table: changed statements, computed here.** Lean probes in scratch prove rows 2, 5, 6 and 8 symbolically:
- (1) `det(M+Mᵀ)=2·(4adf+bce−ae²−dc²−fb²)` for upper-triangular `M` over any commutative ring;
- (2) the folded `gᵀUg` multiplies that polynomial by `det(g)²` for a symbolic 3×3 `g`;
- (3) the scaling law.

| Statement | Instances and values on each side | Result |
|---|---|---|
| 1. `README.md:11` ownership | Supplier's consumer list names §2.8; depcheck 0 problems; no reverse citation | consistent |
| 2. `:50`, §1.1 | `n=1`: `det(2U₀₀)=2U₀₀`, half `U₀₀`. `n=3`: `2·H₃=det(U+Uᵀ)` (probe 1, over the torsion-free `ℤ[U]`). Scaling every `Uᵢⱼ` by `t` gives `t³` | holds |
| 3. `:50`, §1.2 | `n=3`: `u²+v²+w²`: `δ'=4`, `discr'=1`; `uv+w²`: `δ'=−1`, `discr'=−1/4`; `4·discr'=δ'` in both. `n=2`, `x₀x₁`: `δ'=−1` (triangular), `−3/4` (symmetric), `2·discr'=−1/2` | fails for even `n`: R01 |
| 4. `:50`, §1.3 | `diag(2,1,1)` on `u²+v²+w²`: `16=2²·4`. Singular `diag(0,1,1)`: `v²+w²` gives `0=0²·4`. `uv+w²` mod 2: `−1↦1` | holds |
| 5. `:1186`, `ternaryDet4 = H₃` at upper-triangular coefficients | Probe 1. The supplier's Voight check `4abc+uvw−au²−bv²−cw²` becomes this polynomial under `(a,b,c,u,v,w)↦(a,d,f,e,c,b)`. Values: `u²+v²+w²` gives `½det(2I)=4`; `uv+w²` gives `½·(−2)=−1` | holds |
| 6. `:1188`, degree three | Probe 3. `2(u²+v²+w²)` gives `32=2³·4`; a quadratic law would give 16 | holds |
| 7. `:1189`, base change | `uv+w²`: `−1` over ℤ, `1` in `𝔽₂`, `2` in `𝔽₃`, the images of `−1` | holds |
| 8. `:1190`, every 3×3 `δ` | Probe 2. `(u,v,w)↦(u+v,v,w)` on `u²+v²+w²` gives `u²+2uv+2v²+w²`, value `8−4=4` (det 1). Singular `δ` gives 0 | holds, including singular `δ` |
| 9. `:1201`, resolvent variable change | `A=uw−v²`, `B=u²−vw−w²`: `f=x³+4xy²+y³`, Disc `−283`. Under `diag(2,1,1)`: `A'=2uw−v²`, `B'=4u²−vw−w²`, resolvent `4x³+16xy²+4y³=2²f`, Disc `4⁴·(−283)=−72448`, i.e. `(det)⁸` as in Part II §1.3 | holds |
| 10. `:1978`, `:1986`, locators | §3.6 at line 837, Theorems 22 and 23 at lines 851 and 860, pp.16–17; `19/24<20/24` | holds |
| 11. `Suggested.lean:137–145` | Docstring polynomial equals body; elaborated type unchanged | holds |
| 12. `:2272`, Layer 2 dependencies | Lists QuadraticFormsOverABase §§1.1–1.3; depcheck as above | holds |
| 13. R02 repair, smooth-point headline | `Nat.card F=Fintype.card F` for finite `F`. The 𝔽₅ cusp keeps 5 smooth points of 6, and the bound `5−C(√5+1)≤5` is unchanged | meaning preserved |
| 14. R03 repair, the weight definitions and both acceptable sieves | All five elaborated types are identical with the Tau Ceti instance. All-ones weights still give difference 0; a zero factor gives 0 on both sides | meaning preserved |

**Adversarial table: carried forward.** These statements are untouched; values are from `packages/ArithmeticStatisticsPartIII/reports/PRREVIEW-ArithmeticStatisticsPartIII~3.md`, rows by README line. The remaining 147 rows of that report are carried forward by reference.

| Statement | Values (previous report) | Result |
|---|---|---|
| 176 Ekedahl headline | `n=0,k=1,I=(2),M=2`: count 0 against `C(1/log 2+1)`; `I=(x,y)`: only `(0,0)` against `Cr` | retained |
| 706 quartic count | constants `4ζ(2)/135, 32ζ(2)/135, 8ζ(2)/135` for 4, 2, 0 real roots | retained |
| 874 quartic acceptable sieve | all-ones weights: `N−N·1=0`; constant-halves weights fail acceptability | retained |
| 1060 cubic count | `π²/72`, `π²/24`, ratio 3 | retained |
| 1144 cubic acceptable sieve | all-ones weights give `O(X^(5/6))=o(X)` | retained |
| 1164 pair count | `m=2`: densities 1, 0, `1/4096`; divisors 48, 8, 16 | retained |
| 1182 four-times determinant | 4, −1, 0, and `32=2³·4` (recomputed in rows 5–6 above) | retained |
| 1194 pair resolvent | `x³+4xy²+y³`, Disc `−283` (recomputed in row 9) | retained |
| 1641 summed monic tail | `n=2`: `X^(3+ε)/√M+X^(14/5+ε)`; `Δ=36` contributes 1 at `M=5`, 0 at `M=6` | retained |
| 1659 monic fixed-modulus sieve | `κ=1` gives `1/5`; `κ=3` gives `1/6` | retained |
| 1854 summed binary tails, odd case | `n=3`: exponent `23/6` | retained |
| 1880 binary fixed-modulus sieve | `n=4, τ=.6`: `5.4>5` is rejected by the second cutoff | retained |
| 1968, 1976 quaternary tail and sieve | `19/24<20/24`; all-ones weights give `N−N=0` (locators now §3.6) | retained |
| 2075 smooth points | 𝔽₅ cusp: 5 smooth of 6 points; a repeated line gives 0 | retained |
| 2121 local density | odd degree has real density 1; `x₀^d−x₁x₂^(d−1)` has derivative `−1` at every prime | retained |

**Remark on untouched text (not a finding).** `README.md:1974` reads “at `most2` orbit preimages”; “at most 2” is meant.

## Not verifiable

None new. The four texts listed in the previous report (cohen-dihedral, stichtenoth, lang-weil, platonov-rapinchuk) are cited only in untouched passages and were not re-requested. The half-discriminant identities newly cited from QuadraticFormsOverABase were checked by the computations above, not against Conrad 2014.

## Source issues

- none
