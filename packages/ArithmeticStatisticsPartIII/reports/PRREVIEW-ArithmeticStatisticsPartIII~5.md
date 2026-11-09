# Review of ArithmeticStatisticsPartIII (pull request #1174 at a9cc8cd)

**Verdict:** accepted

This is an incremental re-review of the 58 lines changed since d732072:
- 16 lines in `README.md`;
- 42 lines in `Suggested.lean`;
- no file outside the folder.

All three previous findings are repaired, and no repair introduced a new problem. The gate passes, and the dependency check reports 0 problems. This report has no findings.

## Previous findings

- R01 — repaired: `README.md:50` now reads "§1.2 supplies the half-discriminant `δ'(Q)` … over any commutative ring; for odd `n`, its independence of the bilinear representative …, and `δ'(Q)=2^(n−1)·QuadraticForm.discr' Q` when 2 is invertible."
- R02 — repaired: `Suggested.lean:306–309` now reads "`∀ (F : Type) [Field F] [Finite F]` … `(Nat.card F : ℝ) ^ (n - 1) - C * ((Nat.card F : ℝ) ^ ((n : ℝ) - 3 / 2) + (Nat.card F : ℝ) ^ (n - 2))`".
- R03 — repaired: `Suggested.lean:2` reads `import TauCeti.Data.Nat.Prime.Basic`. Every `letI : Fact p.val.Prime` is gone from the five `φ` binders and the five bodies. `README.md:36` names `Nat.Primes.instFactPrime` as the supplier.

## Verified sound

### What was reviewed

**Changed passages.** Each was reviewed in full, together with everything that cites it:
- `README.md:36`: the new Tau Ceti instance contract.
- `README.md:50`: the QuadraticFormsOverABase contract.
- `README.md:1585`: a §2.13 Check.
- Six lines that only fix fused code spans: `:1585` (§2.13), `:1928` (§2.17), `:1948` (§2.18), `:1974` (§2.19), `:2002` (§2.20) and `:2099` (§2.23).
- `Suggested.lean`: the import, `hypersurfacePadicDensity`, `hypersurfaceClasses`, `degree_uniform_hypersurface_smooth_points`, `AcceptableBinaryWeight`, `binaryWeight`, `binaryLocalMass`, `quartic_acceptable_sieve` and `cubic_acceptable_sieve`.

**Citers of the changed contract.** All three uses of the narrowed §1.2 contract are at `n=3`, which is odd:
- `README.md:1186–1190`: `Counting.ternaryDet4` and its three laws;
- `README.md:1201`: the resolvent variable change;
- `README.md:2272`: the Layer 2 dependencies.

### Gate, run at this head

```text
gate ArithmeticStatisticsPartIII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's run of the same gate also reports `build=0`.

### Dependency check

```text
depcheck: 236 roadmaps, 2276 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.

### Elaboration

- **The file itself.** `lake env lean` on `Suggested.lean` gives exactly 12 warnings, all `declaration uses sorry`, at lines 232, 246, 256, 268, 285, 294, 305, 316, 333, 355, 409 and 419.
- **Signatures.** I elaborated `#check @` for all 44 declarations twice, once on this file and once on the d732072 file. The two printed outputs differ in only two lines, both in `degree_uniform_hypersurface_smooth_points`:
  - `[inst_1 : Fintype F]` became `[Finite F]`;
  - `↑(Fintype.card F)` became `↑(Nat.card F)` three times.
- **Why removing the `letI`s changes nothing.** `Fact` is a `Prop`. So `⟨p.property⟩` and `Nat.Primes.instFactPrime p` are definitionally equal by proof irrelevance. In scratch, `example (p : Nat.Primes) : (inferInstance : Fact (p : ℕ).Prime) = Nat.Primes.instFactPrime p := rfl` elaborates.
- **Remaining `letI`s.** The only two left are the `MeasurableSpace`/`BorelSpace` ones in the bodies of `padicMass` (lines 209–210) and `AcceptableBinaryWeight` (lines 391–392). This matches the README's claim that no statement carries a local primality instance.
- **Padding probe.** I replaced the `sorry` of each of the three changed theorems by one of `simp`, `rfl`, `infer_instance` or `norm_num`, one tactic per run. Every run gives 3 errors and 9 remaining `sorry`s. None of the three closes, so the earlier verdict stands: 12 headlines and no padding.

### Pinned declarations opened

- **Tau Ceti `Nat.Primes.instFactPrime`** (`TauCeti/Data/Nat/Prime/Basic.lean:41`): `instance (p : Nat.Primes) : Fact (p : ℕ).Prime := ⟨p.2⟩`. Its module and object file exist at the pin.
- **Mathlib** has only `local instance (p : Nat.Primes) : Fact p.1.Prime` (`Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean:57`). So the import is needed, and the README's attribution to Tau Ceti is correct.

### Supplier citation resolved: QuadraticFormsOverABase at its open head 464f81f

The README line numbers below are the file's own.

| Cited claim (`README.md:50`) | At that head | Result |
|---|---|---|
| §1.1 `univHalfDisc n`, `2·univHalfDisc n=det(U+Uᵀ)` for odd `n` | README §1.1 (line 342); Lean `two_mul_univHalfDisc (hn : Odd n)` | agrees |
| §1.2 `δ'(Q)` for every `n`; independence of the representative and `2^(n−1)·discr'`, odd `n` | `def halfDisc` has no parity hypothesis. README §1.2 (line 366) says "for `n` odd" and "When `Invertible (2 : R)` and `n` is odd". Lean `two_mul_halfDisc (hn : Odd n)` (line 121), `halfDisc_eq_of_toQuadraticMap (hn : Odd n)` (line 127) | agrees after the repair |
| §1.3 `halfDisc_mapCoeffs` for every `n`; `halfDisc_comp` for odd `n`; `δ'(aQ)=aⁿδ'(Q)` for every `n` | README §1.3 (line 396) | agrees |
| Direction of supply | The supplier's Downstream consumers (line 956) names ArithmeticStatisticsPartIII §2.8 | single direction |

### Ownership and overlaps

The overlap report (`roadmaps overlaps`) shows:
- no other open pull request that changes this roadmap;
- no id this README cites that an open pull request drops;
- no id that only an open revision defines.

The change adds no new object. The only new name is the pinned Tau Ceti instance. The citation resolver's 41 leads are all this roadmap's own `Counting.*` names, and each is declared in `Suggested.lean` (`readme-ids-missing=0`).

### Sources checked in the changed text

Texts were read through the sources service, with no manifest edit. Two of the changed passages fall in the seeded sample: §2.13 (`:1585`) and §2.20 (`:2002`).

| Changed passage | Text at its locator | Result |
|---|---|---|
| §2.20 quinary tail, `([13], Theorem 27 and Lemma 28, pp.18–20)`, "at most `2` orbit preimages" | `bs-five`: Theorem 27 at line 948 (p.18), tail `X^(5/6)/(M log M)+X^(49/60)` plus `εX^(5/6)`; Lemma 28 at line 1029 (p.19), the weak-to-strong map is at most 2 to 1; proof ends at line 1054 (p.20) | agrees |
| §2.13 Check, conjugate factors only for even degree at least `4` | `bsw-sqfree1`: Proposition 4.3 at line 973 (p.21); the conjugate-factor case is stated only "when n ≥ 4 is even" (line 985, p.22) | agrees |
| §2.18 ternary cubic tail, "at most `3`", `([11], Proposition 25 and Lemma 26, §2.7, pp.13–14)` | `bs-ternary`: §2.7 at line 660; Proposition 25 at line 678 (p.13), exponent 3/4; Lemma 26 at line 707 (p.14), at most three orbits, because the reduction has at most 3 linear factors (line 718) | agrees |
| §2.19 quaternary tail, "at most `2`", `p>2` | `bs-four`: Lemma 24 at line 904, at most 2 to 1, for `p>2` (line 876), with exponent 19/24 (line 865), inside Theorem 23 (§3.6, pp.16–17) | agrees |
| §2.17 large family tail, codimension at least `2` | `bgw-hyperelliptic` (reference [4]): Definition 39 at line 1297 (p.31), "codimension at least 2" at line 1299; Proposition 42 at line 1414 (p.33), `O(X^(n+1)/M)+O(Xⁿ)` | agrees |
| §2.23 hypersurface tail, codimension at least `2` except plane conics | Computed in row 8 of the adversarial table | agrees |

The other sampled sections (2.3–2.10, 2.12, 2.14, 2.16, 2.21, 2.22) are untouched. They keep the source table of `packages/ArithmeticStatisticsPartIII/reports/PRREVIEW-ArithmeticStatisticsPartIII~3.md`.

### Adversarial table: changed statements, computed here

| # | Statement | Instances and values on each side | Result |
|---|---|---|---|
| 1 | `README.md:36`, `Nat.Primes.instFactPrime` is the global `Fact (p : ℕ).Prime` | `inferInstance = Nat.Primes.instFactPrime p` holds by `rfl` in scratch. Mathlib has only the local instance. Five families need it: `hypersurfacePadicDensity` (`ℤ_[p]`, `ℚ_[p]`), `hypersurfaceClasses` (`ℚ_[p]`), `AcceptableBinaryWeight`, `binaryWeight` and `binaryLocalMass` (`ℤ_[p]`). Every one elaborates without a `letI`. | holds |
| 2 | `README.md:50`, §1.2 for odd `n` | `n=3`, `u²+v²+w²`: `δ'=4adf+…=4` and `discr'=det I=1`, so `4·1=4`. `n=3`, `uv+w²`: `δ'=−1` and `discr'=det[[0,½,0],[½,0,0],[0,0,1]]=−1/4`, so `4·(−1/4)=−1`. `n=2`, `x₀x₁` (now outside the contract): the triangular representative gives `δ'=−1`; the symmetric one gives `−3/4` (Lean's `(−1)/2=−1`); `2·discr'=−1/2`. Both consumers use `n=3`. | holds |
| 3 | `Suggested.lean:305`, smooth-point headline with `[Finite F]`, `Nat.card F` | 𝔽₅, `n=2`, `d=3`, cusp `y²z−x³`: 6 points, 5 smooth. `5−C(√5+1)≤5` for every `C>0`, and `Nat.card 𝔽₅=5=Fintype.card 𝔽₅`. Negative control `x₀²` (`d=2`): it is not irreducible over `F̄`, has 0 smooth points, and `q−C(√q+1)>0` for large `q`, so the irreducibility hypothesis is needed. `Finite` excludes the junk `Nat.card F=0`. | meaning preserved |
| 4 | `Suggested.lean:381–405`, `AcceptableBinaryWeight`, `binaryWeight`, `binaryLocalMass` | Elaborated types are identical to d732072. For the all-ones `φ`: acceptability holds with `E=∅`; `binaryWeight=∏'1=1`; `binaryLocalMass=μ(univ)/μ(univ)=1`, since Haar on compact `ℤ_p^(n+1)` has `0<μ(univ)<∞`. | meaning preserved |
| 5 | `Suggested.lean:409`, `quartic_acceptable_sieve` | For all-ones weights, `∑'1−ncard·1=0`, both for a finite and an infinite class set (both sides 0). That is `o(X^(5/6))`. | holds |
| 6 | `Suggested.lean:419`, `cubic_acceptable_sieve` | For all-ones weights, `N_±(X)−(π²/72 or π²/24)·1·X=O(X^(5/6))=o(X)`. | holds |
| 7 | `Suggested.lean:215`, `:222`, bodies of `hypersurfacePadicDensity` and `hypersurfaceClasses` | Elaborated types are unchanged. The removed instance term and the global one are both proofs of the `Prop` `Fact (p : ℕ).Prime`, so they are definitionally equal. | meaning preserved |
| 8 | `README.md:2099`, geometrically reducible locus has codimension `≥2` except plane conics | The codimension of the multiplication image is `N−N_a−N_b+1`. `(n,d)=(2,2)`: `6−3−3+1=1` (the exception). `(2,3)`: `10−3−6+1=2`. `(3,2)`: `10−4−4+1=3`. `(2,4)`: `min(15−3−10+1, 15−6−6+1)=3`. | holds |
| 9 | `README.md:1928`, codimension `≥2` envelope | Codimension 1 fails. With `S0={a₀=0}`, almost every `a₀` has a prime factor `>M`, so the tail is `≍X^(n+1)`, not `O(X^(n+1)/M+Xⁿ)`. | hypothesis needed |
| 10 | `README.md:1585`, §2.13 Check | `x²−2=(x−√2)(x+√2)` over `ℚ(√2)`. Counting conjugate factors at `n=2` would put every irreducible quadratic in `V_2^red`: `≍X³` against the bound `O(X² log X)`. | Check discriminates |
| 11 | `README.md:1948`, `:1974`, `:2002`, at most 3 / 2 / 2 preimages | A ternary cubic reduction has at most 3 linear factors (`bs-ternary` line 718). The quaternary and quinary maps are 2 to 1 (`bs-four` line 904, `bs-five` line 1029). | holds |

### Adversarial table: carried forward

These statements are untouched since d732072. Their values come from `packages/ArithmeticStatisticsPartIII/reports/PRREVIEW-ArithmeticStatisticsPartIII~4.md` (rows 1 and 4–12 of its changed-statement table, and its carried table). The remaining rows of `PRREVIEW-ArithmeticStatisticsPartIII~3.md` are carried forward by reference.

| Statement | Values (previous reports) | Result |
|---|---|---|
| `README.md:1186` `ternaryDet4 = δ'` at `n=3` | 4, −1; `det(M+Mᵀ)=2·(4adf+bce−ae²−dc²−fb²)` proved symbolically | retained |
| `:1188` degree three | `2(u²+v²+w²)` gives `32=2³·4` | retained |
| `:1189` base change | `uv+w²`: −1 over ℤ, 1 in 𝔽₂, 2 in 𝔽₃ | retained |
| `:1190` every 3×3 `δ` | `(u,v,w)↦(u+v,v,w)` gives 4; singular `δ` gives 0 | retained |
| `:1201` resolvent | `x³+4xy²+y³`, Disc −283; under `diag(2,1,1)`, `4⁴·(−283)` | retained |
| 176, Ekedahl headline | `n=0,k=1,I=(2),M=2`: 0 against `C(1/log 2+1)` | retained |
| 706, quartic count | `4ζ(2)/135`, `32ζ(2)/135`, `8ζ(2)/135` | retained |
| 1060, cubic count | `π²/72`, `π²/24`, ratio 3 | retained |
| 1164, pair count | `m=2`: densities 1, 0, 1/4096 | retained |
| 1641, summed monic tail | `n=2`: `X^(3+ε)/√M+X^(14/5+ε)` | retained |
| 1659, monic fixed-modulus sieve | `κ=1` gives 1/5; `κ=3` gives 1/6 | retained |
| 1854, odd binary tail | `n=3`: exponent 23/6 | retained |
| 1880, binary fixed-modulus sieve | `n=4`, `τ=.6`: `5.4>5` rejected | retained |
| 1968, 1976, quaternary tail and sieve | `19/24<20/24`; all-ones weights give `N−N=0` | retained |
| 2121, local density | odd degree has real density 1; `x₀^d−x₁x₂^(d−1)` | retained |

### Remarks on untouched text (not findings)

- **Fused code spans.** Three untouched lines have the same fused spans that this change fixes elsewhere:
  - `README.md:1577`: "`be3, giving22/3`";
  - `README.md:1812`: "`not1/16`";
  - `README.md:1938`: "`coefficient128/45`".
- **The word "deferred".** The `Suggested.lean` module docstring uses it at lines 23 and 39. In both places it says that a statement is not statable at the pins.

## Not verifiable

None new. The four texts listed in earlier reports (cohen-dihedral, stichtenoth, lang-weil, platonov-rapinchuk) are cited only in untouched passages.

## Source issues

- **Error** in bsw-sqfree1 at proof of Proposition 4.3, printed p.22: the source says a polynomial factoring as `g·ḡ` over a quadratic field has splitting degree at most `2(n/2)!`, hence Galois index at least `n(n−1)/2`; it should be degree up to `2((n/2)!)²`, index 3 at `n=4` (`x⁴−2`, group `D₄` of order 8) and `10<15` at `n=6`; affects the proof.
