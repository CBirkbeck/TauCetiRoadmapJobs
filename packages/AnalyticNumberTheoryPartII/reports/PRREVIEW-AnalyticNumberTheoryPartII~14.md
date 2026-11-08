# Review of AnalyticNumberTheoryPartII (pull request #1167 at c0e5090)

**Verdict:** needs changes

This is an incremental re-review of the 10 README lines changed since 0d40b02. `Suggested.lean` is unchanged, and no file outside the folder changed. Four of the five previous findings are repaired, and the repairs are correct. R01 is not repaired, and its repair is in another pull request: ArithmeticGaloisRepresentations is still at the same head and still builds this roadmap's adelic foundations again. The changed passages introduce no new defect.

Cross-roadmap facts below come from the open-roadmap index of 2026-11-08T21:52:41Z (the same index the previous review used) and from main 12ed9bd.

## R01 (P2) — ArithmeticGaloisRepresentations still builds the objects of §§5.3g, 5.3h and 5.3j

**Location.**
- `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:7`: "This part is their single owner."
- `README.md:3166`: "ArithmeticGaloisRepresentations §2.7 (global inputs) takes from §§5.3g, 5.3h and 5.3j the trace character with its local self-duality, …".

**Claim.** This is the previous R01, still unrepaired. Two open roadmaps own the same objects, and the consumer bullet at `:3166` is false.
- ArithmeticGaloisRepresentations is #856, still at cf6ae2f. In ORDER.txt it is at line 56, after this roadmap at line 50.
- Its §2.7 "Global inputs" constructs its own copies of:
  - the standard trace character and its local self-duality;
  - restricted-product duality and `F⊥=F`;
  - the adelic Schwartz–Bruhat space, the self-dual Fourier transform and Poisson summation;
  - Tate's multiplicative measures.
- It does not cite this roadmap anywhere.
- Its `:2305–2306` says that AutomorphicFormsOnReductiveGroups §4.3 consumes these objects from #856. But #1037 at 06102df (`README.md:662`) takes them from §§5.3g–5.3h here.

**Witness.**
- `roadmaps grep --fixed AnalyticNumberTheoryPartII` finds no line in #856.
- #856 `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`:
  - `:2285` says "Define the standard trace character";
  - `:2299` says "Prove the diagonal self-annihilator formula";
  - `:2311` says "Construct the Schwartz–Bruhat space on the adeles".
- Its supplier contracts (`:309–652`) have no "From AnalyticNumberTheoryPartII" entry.

**Repair.** The repair is in #856. The earlier owner in the merge order is this roadmap, so #856 cites it.
1. At #856 `:2283–2316`, replace the constructions with: "AnalyticNumberTheoryPartII §5.3g (trace character, local self-duality, self-dual measures), §5.3h (restricted-product duality, `F⊥=F` = `TauCetiRoadmap.AnalyticNumberTheoryPartII.adeleRing_selfDual`, Schwartz–Bruhat space, Fourier transform, Poisson summation) and §5.3j (multiplicative measures)". Keep its standard-test-function evaluations and its root-number product formula.
2. Drop its sentence at `:2305–2306` about AutomorphicFormsOnReductiveGroups §4.3.
3. Add a supplier contract "From `TauCetiRoadmap.AnalyticNumberTheoryPartII`".

Tested on the instance: #856 at 2cbcfe8 had this form, and this README's `:3166` describes that form. Nothing in this folder needs to change.

## Previous findings

- R01 — not repaired: #856 is still at cf6ae2f. Its §2.7 `:2285`, `:2299` and `:2311` still define ψ, `F⊥=F` and the Schwartz–Bruhat space, with no citation of this roadmap. `README.md:3166` is unchanged.
- R02 — repaired: `README.md:2126` now reads "The coefficients of `logΓ(s+m/2)` and `logΓ(s−m/2)` in `(6.2)` are `(1+m)/2` and `(1−m)/2`, both `1/2` at `m=0`, so `(6.2)` at `m=0` is `(8.4)` (proof of Corollary 8.2.1, p.27)". `:2136` now reads "(6.2), p.20, at `m=0`, which is (8.4)". The new negative control at `:2128` is correct (see the table).
- R03 — repaired: `:3168` now reads "ClassicalArithmeticCompletion Layer 7 (its Tate factors and trace characters, the tame local Galois Gauss sums of §7.13 and the symplectic Artin root signs of §7.30)". `grep -c 7.12a` returns 0. Layer 7, §7.13 and §7.30 are all on main.
- R04 — repaired: `:339` adds "See [94][R94], (1.8)–(1.9) and (8.1), … Theorem 8.4, (8.15), with its proof, (8.17)–(8.20), at `c=1`, … based at `z=−1` …; [arXiv v1][R101], pp.3, 44 and 47–49". Every locator matches the source (see below).
- R05 — repaired: the description's "Depends on" now lists "#1320 PolylogarithmFunctions", and the merge order reads "#1126 → #1320 → **this pull request**". The retained "no other open supplier" is now true: no other cited supplier is open-only (below).

## Verified sound

**Gate, dependency check and build.**
- My gate rerun on c0e5090 prints: `gate AnalyticNumberTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate adds `build=0`.
- `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff 0d40b02 HEAD` touches only `README.md` (6 insertions, 4 deletions).

**Elaboration.**
- I appended `#check @name` for all 31 declarations to a scratch copy of `Suggested.lean` and ran `lake env lean` on it. It exits 0 with 14 `declaration uses 'sorry'` warnings, one per theorem, and nothing else.
- All 31 names appear in the output, matching `signatures.md`.
- `Suggested.lean` is unchanged since 0717d3f, so the earlier one-tactic probe (112 attempts, none closing) still applies.

**Sources read at their locators** (the seeded targets that fall in changed passages, §4.5 through §4.5g and §6.17 through §§6.17g–6.17h):
- **§4.5g against `LagariasLiIII` (arXiv v1).**
  - (1.8)–(1.9), defining `Li_m(z)=zΦ(m,z,1)` and the extended polylogarithm, are at line 119–125, p.3.
  - (8.1), `Li_{m,c}(z)=zΦ(m,z,c)`, is at line 2035, p.44.
  - The fundamental group is based at `−1` (line 2182, p.47).
  - Theorem 8.4 needs `m≥1` and `c∉ℤ≤0` (line 2195, p.47). (8.15) is at line 2221, p.48. (8.17)–(8.20) are at lines 2260–2275, pp.48–49.
- **The same through the sources service, read into a scratch copy of the manifest.** arXiv v2 (21 Nov 2015) carries the same numbers: (1.8) at line 122, (8.1) at line 1943, Theorem 8.4 at line 2103, (8.15) at line 2129, (8.17) at line 2168 and (8.20) at line 2183.
- **§§6.17g–6.17h against `JorgensonSmajlovicSpilioti25`.**
  - (6.2) is at lines 991–1006, p.20, with coefficients `(1+m)/2` and `(1−m)/2`.
  - Corollary 8.2.1 is at line 1527, p.27, and its proof (line 1575) inserts `m=0` into (6.2) to get (8.4).
  - (8.4) is at line 1545, p.27, and (8.8) at line 1586, p.28.
- **Untouched seeded targets checked against the same cache:**
  - §4.6's Theorem 5.1 with (5.2)–(5.5) is on v1 p.36 (lines 1602–1637).
  - §4.8's Theorem 6.1 is on v1 p.41 (line 1908).
  - §6.17's (6.1) is on p.20 and its (8.8) on p.28.
  - §6.19 cites §6.17g only for "the scalar identity factor confirmed by the heat derivative", which is still accurate.

**Cross-roadmap citations resolved:**
- **ClassicalArithmeticCompletion on main 12ed9bd:**
  - "## Layer 7: integral Galois modules and arithmetic orders" is at `:14233`.
  - "### 7.13 Tame local Galois Gauss sums" is at `:14623`.
  - "### 7.30 Symplectic Artin root signs" is at `:15080`.
  - Layer 7 on main uses trace characters, self-dual measures and archimedean Tate factors (`:14625`, `:15104`).
- **ClassicalArithmeticCompletion at #1409 aa03308:** `:244` has the contract "From TauCetiRoadmap.AnalyticNumberTheoryPartII, §5.3g". Its text at `:14072` matches this README's `:3168`.
- **Suppliers.** Every roadmap the README cites before its consumer list is on main, except AnalyticNumberTheoryPartI (#1126) and PolylogarithmFunctions (#1320). Both are named in the description, and both precede this roadmap in ORDER.txt (lines 49 and 38). UniversalCovers, ProfiniteArithmetic, RestrictedProducts and GlobalNumberFields are under `Completed/`.
- **ArithmeticGaloisRepresentations (#856 cf6ae2f):** as in R01.
- **The `roadmaps overlaps` line** "ClassicalArithmeticCompletion §7.12a (line 3168)" is stale. The index still reads #1167 at 0d40b02. At c0e5090 the id is gone.

**Library declarations.** The changed lines name no Mathlib or Tau Ceti declaration. The elaborated output of `Suggested.lean` is unchanged.

**Adversarial table.** Changed statements come first, with values computed for this review. Rows for untouched statements are carried from the previous report (r13) with its values.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.5g locator: (1.8)–(1.9), (8.1) | `m=2`, `z=½`; `c=1` | (1.8): `Li₂(½)=½Φ(2,½,1)=0.5822405`; (1.9) at `c=1` is (1.8); (8.1) `Li_{m,c}=zΦ(m,z,c)` | Match | None |
| §4.5g locator: Theorem 8.4 hypotheses | `m=n≥1`, `c=1`; base point | `1∉ℤ≤0`; π₁ based at `−1`; §4.5 base `(s,z,c)=(½,−1,½)`, `e^(2πi·½)=−1` | Met | None |
| §4.5g locator: (8.17)–(8.20) at `c=1`, `k=0` | `m=1,2,3`; `z=½` | `α(m)·z·f₀=−(2πi)^m/(m−1)!·(Log z/2πi)^(m−1)=−2πi(Log z)^(m−1)/(m−1)!`: `−2πi`; `+2πi log 2`; `−πi(log 2)²=−1.50940i`; PolylogarithmFunctions `:328` at `n=3`: `−πi(Log z)²`, the same | Agree with §4.5g Checks 1–2 | None |
| §4.5g locator: orientation of `[Z₁]` | (8.15) row 1 | `(1,−2πi,0,…)`, so `Li_{m,c}↦Li_{m,c}−2πi b_{m−1,c}`; §4.5d counterclockwise: `−Log(1−z)` changes by `−2πi`; reversed: `+2πi` | Same orientation | None |
| §6.17g: (6.2) at `m=0` | `m=0`; `m=1` | `(1±m)/2`: `½,½`, giving `logΓ(s)` and `−2logG(s+1)`, which is (8.4); at `m=1`, `(1,0)`; derivative coefficients `α−s−m/2=½−s=β−s+m/2`, giving `−C(2s−1)(ψ₊+ψ₋)` as in (6.5) | Holds | None |
| §6.17g: negative control `1±m/2` | `m=0`; `C=1`, `s=2`; `s=10` | extra `2C logΓ(s)`; `s log s` coefficient `4C` vs `2C`; derivative `−4C(s−1)ψ` vs `−2C(2s−1)ψ`: `−1.691138` vs `−2.536706` (`ψ(2)=0.422784`); Stirling `2[9.5 ln10−10+0.918939]=25.5855` vs `2lnΓ(10)=25.6036` | Excludes the misreading | None |
| §6.17g: identity derivative | (8.4); `f(s)=(logG(s+1))′` | `f(s)−f(s−1)=ψ(s)` for `f=½log2π+½−s+sψ`; `2C[log2π+1−2s+ψ−2f]=−2C(2s−1)ψ(s)` | Holds | None |
| §6.17: `det′Δ` | `s→1` | `I_g(1)=(2π)^(2(g−1))`; times the constant gives `(2π)^(g−1)exp(4(g−1)ζ′(−1)−(g−1)/2)`, which equals Sarnak's `exp((2g−2)(2ζ′(−1)−¼+log√2π))` | Holds | None |
| §6.17h: single-valued form, locator | `g=2`, `s=1`; [R116] | `(2π)^(2s)e^(2s(1−s))Γ(s)²/G(s+1)⁴` at `s=1` is `(2π)²=exp(2 log 2π)`; (6.2) p.20; Cor. 8.2.1 proof p.27 | Holds | None |
| Consumer: ClassicalArithmeticCompletion | main; #1409 | Layer 7 `:14233`, §7.13 `:14623`, §7.30 `:15080`; `7.12a` gives 0 hits in this README; #1409 `:14072` takes §5.3g | All ids on main | None |
| Consumer: ArithmeticGaloisRepresentations | #856 cf6ae2f | 0 citing lines; `:2285` ψ, `:2299` `F⊥=F`, `:2311` Schwartz–Bruhat | Bullet false | R01 |
| Description suppliers | open-only roadmaps cited | AnalyticNumberTheoryPartI, PolylogarithmFunctions; both listed in "Depends on" | Complete | None |
| §4.1 `Liₙ=zΦ(z,n,1)` (r13) | `n=2,0,−1`, `z=½`; `z=0` | `0.5822405`; `1` vs `Φ=2`; `2`; `0` vs `Φ(0,n,1)=1` | Holds | None |
| §4.5g path `ℓ_n` (r13) | circle `|z+¼|=¾` | passes `−1` and `½`; `max Re z=½`; misses `0` | Well posed | None |
| §4.5g `n=1,2,≤0` (r13) | loop `|z−1|=½` | `−2πi`; `+2πi log 2`; `zΦ=1=Li₀(½)` | Agree | None |
| §5.3g–5.3h, R01 objects (r13) | `ψ(1/6)`; `e(x_∞)`; `ℚ(i)` above 2 | `1`; `ψ′(½)=−1`; `vol(O_v)=N(𝔇)^(−½)=½` | Hold | None |
| §5.3j (r13) | `ℚ(i)` above 2; `ℝ`, `ℂ` | `d^×x(O_v^×)=½=N(𝔇)^(−½)`; `π^(−½)Γ(½)=1`; `(2π)^(−1)Γ(2)` | Holds | None |
| §5.3k (r13) | `ℤ≤ℝ`; `S₃`; `ax+b` | mass `1`; `6=3·2·1`; `Δ(2,0)=2≠1` | Holds | None |
| §5.3l (r13) | `diag(2,½)_∞`; `diag(2,1)` | `t=2`; `|2|_𝔸=1`; `Δ=2` vs `½` | Holds | None |
| §5.3m (r13) | `ℚ`; `ℚ(√−5)` | `h=1`; `h=2` | Holds | None |
| §5.3n (r13) | `q=2`, `z=3`; `ℝ`, `ℂ` | `7/6`; `2=(1/π)/(1/(2π))`; `π=2π/(z−1)` | Holds | None |
| §5.21 residue (r13) | `1_(O_v)`, `ℚ(i)` above 2 | `N(𝔇)^(−½)=½=vol(O_v)` | Holds | None |
| §5.7a (r13) | PartI 3667daa | `1−β≥c_LS/log q`; `κ_K≥c min(1/log D_K,1−β_K)` | Match | None |
| §6.19 locators (r13) | [R116] | (6.1) p.20, (8.4) p.27, (8.8) p.28 | Present | None |
| §4.4 (r13) | `z=½`, `c=1`, `s=−1` | `Φ=4`; `−sΦ=4` vs `+sΦ=−4` | Holds | None |
| §4.9 (r13) | `a=c=½` | multipliers `−i`, `1`; `L₊=0` | Holds | None |
| §4.15 (r13) | `χ₄`, `s=2` | `0.91597=G` | Holds | None |
| §5.9 (r13) | `O_F³` | weight `1/6`; `b=1` fails | Holds | None |
| §5.11 (r13) | Dirac; `diag(2,1)` | `3·2^(2s)`; `|2|_𝔸=1` | Holds | None |
| §5.12 (r13) | `R/(s−1)+T/(s−5/6)` | residues `R`, `T` | Holds | None |
| §5.17 (r13) | `d=9`; `d=1` | `0`; `−1`; period `12` | Holds | None |
| §5.18 (r13) | `(−2,−2)`; `Q` | in `B₄∖B₃`; minimum `0` | Holds | None |
| §5.22 (r13) | `ψ1`, `d=1`, `s=−1` | `1/12` | Holds | None |
| §5.23 (r13) | `ψ−2`, `s=0`; `ψ1` | `0.90032`; `0` | Holds | None |
| §5.26 (r13) | `B(0)` | `4/(3π)` | Holds | None |
| §5.27 (r13) | order at 1 | real 1; complex 2 | Holds | None |
| §6.4 (r13) | `{λ}`; `cλ` | `λ^(−s)`; `c^(−s)` | Holds | None |
| §6.5 (r13) | `β=1`, `q=2` | `μ(2Ẑ)=½` | Holds | None |
| §6.15 (r13) | genus 2 | `ζ(0)=−4/3` | Holds | None |
| §6.45 (r13) | `β=2` | `½` vs `8` | Holds | None |
| `lerchContinuation_solvable` (r13) | basepoint | `z∉{0,1}`, `c∉−ℕ` | Well posed | None |
| `lerch_completed_functional_equations` (r13) | `(1−s,1−c,a)` | `0<Re(1−c)<1` | Holds | None |
| `complexHurwitzContinuation_exists` (r13) | `m=0,1`; `c=1,½,1+i` | `−½`, `−1/12`, `0`, `−½−i` | Holds | None |
| `barnesG_asymptotic` (r13) | `N=1` | `log A=0.2487545` | Holds | None |
| `quadratic_large_sieve` (r13) | `M=1`, `N=3` | `0`, `4` | Holds | None |
| `quadratic_fourth_moment` (r13) | `σ=½,1` | pole excluded by `χ≠1` | Holds | None |
| `quadraticDoubleSeries_continuation` (r13) | `A` row 1 | `(½,½,½,−½)` | Holds | None |
| `exists_unique_restrictedAddHaar` (r13) | `Ẑ`; `p⁻¹ℤ_p` | `1`; `p` | Holds | None |
| `adeleRing_selfDual` (r13) | `ψ(1/6)` | `1` | Holds | None |
| `exists_unique_quotientMeasure` (r13) | `ℤ≤ℝ`; `ax+b` | mass 1; `Δ_G|_H≠1` | Holds | None |
| `gl2_classNumber` (r13) | `ℚ`; `ℚ(√−5)` | 1; 2 | Holds | None |
| `firstEisenstein_generate` (r13) | `ζ=1,i,−1,−i` | `(1,−1,1,−1)` | Holds | None |
| `critical_scaling_measure_unique` (r13) | `δ₀`, `β=1` | `2_*δ₀=δ₀≠2δ₀` | Holds | None |
| `supercritical_scaling_measures` (r13) | `ν=δ₁`, `β=2` | `0.60793` | Holds | None |

**Remark on untouched text** (no change requested): the description calls PolylogarithmFunctions one of the "analytic-number-theory roadmaps". It is a special-functions roadmap, but it is correctly listed.

## Not verifiable

- **Published [94]** (Research in the Mathematical Sciences). Only arXiv v1 ([R101]) and v2 were read. The equation and theorem numbers of the new §4.5g locator agree between v1 and v2. The README gives its page numbers for v1 explicitly.
- **Wright [103] and Datskovsky–Wright [105].** These are image-only scans, and this worker has no OCR. No changed sentence cites them.
- **Untouched seeded targets.** The diff leaves §§4.2, 5.2, 5.3, 5.27, 6.18, 6.26, 6.28, 6.33, 6.34 and 6.36 untouched, so they were not re-read in this incremental review. Their sources ([95], [102], [107], [112]–[114]) are not in this worker's cache.

## Source issues

- **Misprint** in LagariasLiIII at the proof of Theorem 8.4, p.49 (arXiv v1; same in v2): the source says (8.20) gives the first row of (8.16); it should say (8.15), the `[Z₁]` matrix, since (8.16) is the `[Z₀]` computation; affects nothing.
