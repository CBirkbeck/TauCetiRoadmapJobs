# Review of AnalyticNumberTheoryPartII (pull request #1167 at 0d40b02)

**Verdict:** needs changes

This is an incremental re-review of the 97 README lines changed since 0717d3f. `Suggested.lean` is unchanged, and no file outside the folder changed. All six findings of the previous review are repaired in this folder. One finding (R01) comes from another pull request: ArithmeticGaloisRepresentations was moved to a head that builds this roadmap's adelic foundations again. The other four findings are P3 defects in the new or reworded text.

Cross-roadmap facts below are read from the open-roadmap index of 2026-11-08T21:52:41Z and main 12ed9bd.

## R01 (P2) — ArithmeticGaloisRepresentations again builds the objects of §§5.3g, 5.3h and 5.3j

**Location.**
- `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:7`: "This part is their single owner … a later roadmap that uses any of these objects cites these sections rather than constructing them again".
- `README.md:3164`: "ArithmeticGaloisRepresentations §2.7 (global inputs) takes from §§5.3g, 5.3h and 5.3j the trace character…".

**Claim.** Two open roadmaps own the same objects, and the consumer bullet at `:3164` is false. ArithmeticGaloisRepresentations is #856 at cf6ae2f, ORDER.txt line 56, which is later than this roadmap at line 50. Its §2.7 "Global inputs" builds its own copies of:
- the standard trace character;
- local self-duality and restricted-product duality;
- `F⊥=F`;
- the adelic Schwartz–Bruhat space, the self-dual Fourier transform and Poisson summation;
- Tate's multiplicative measures.

It never mentions this roadmap. Its `:2305–2306` also still says that AutomorphicFormsOnReductiveGroups §4.3 consumes these from #856. But #1037 at 06102df (`README.md:662`) takes them from §§5.3g–5.3h here.

**Witness.**
- `roadmaps grep --fixed AnalyticNumberTheoryPartII` finds no line in #856. On the 21:20Z index it found 14.
- #856 `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2285` says "Define the standard trace character". `:2299` says "Prove the diagonal self-annihilator formula". `:2311` says "Construct the Schwartz–Bruhat space on the adeles".
- None of the eight commits on cf6ae2f's history back to 72dcbb9b (2026-11-07) cites this roadmap.

**Repair.** The repair is in #856. Restore its §2.7 citations as they were at 2cbcfe8, which the previous review read:
1. At `:2283–2316`, replace the constructions with "AnalyticNumberTheoryPartII §5.3g (trace character, local self-duality, self-dual measures), §5.3h (restricted-product duality, `F⊥=F` = `TauCetiRoadmap.AnalyticNumberTheoryPartII.adeleRing_selfDual`, Schwartz–Bruhat space, Fourier transform, Poisson summation) and §5.3j (multiplicative measures)". Keep its standard-test-function evaluations and root-number product formula.
2. At `:2306`, drop the sentence saying that AutomorphicFormsOnReductiveGroups §4.3 consumes #856's foundations.
3. Restore the supplier contract "From `TauCetiRoadmap.AnalyticNumberTheoryPartII`".

Tested on the instance: at 2cbcfe8, #856 `README.md:2303–2309` had exactly this form, and `README.md:3164` here describes it. Nothing in this folder needs to change.

## R02 (P3) — §6.17g asserts a conflict in Jorgenson–Smajlović–Spilioti (6.2) that the source does not have

**Location.**
- `README.md:2124` (§6.17g): "Do not specialize the Gamma coefficient in `(6.2)`: its literal scalar specialization is incompatible with `(8.4)` and with the scalar derivative `−2C(2s−1)ψ(s)` just checked."
- `README.md:2134` (§6.17h): "the conflicting literal specialization of (6.2), p.20, is recorded in §6.17g".

**Claim.** This claim is false. The Gamma coefficients in [116] (6.2) are `(1+m)/2` and `(1−m)/2`. At `m=0` each is `1/2`, so (6.2) becomes `logΓ(s)`, which is exactly (8.4). The proof of Corollary 8.2.1 (p.27) says the same: (6.2) at `m=0` gives (8.4). No target of this roadmap changes, because §6.17g's `I_g` is (8.4).

**Witness.**
- **From the PDF.** In [R116] p.20, the fraction bar under the coefficient is 25.9 pt wide and spans `1 + m`. The `m/2` bars in (6.3) are 7.1 pt wide.
- **From the mathematics.** Write `ψ±=ψ(s±m/2)` and give `logΓ(s+m/2)` the coefficient `α`. The derivative of (6.2)'s exponent is `2C[(α−s−m/2)ψ₊+(β−s+m/2)ψ₋]`. Matching this to `−C(2s−1)(ψ₊+ψ₋)` from (6.5) forces `α=(1+m)/2`.

**Repair.**
- At `:2124`, replace the sentence with "At `m=0` the coefficients `(1±m)/2` of (6.2) are both `1/2`, so (6.2) is (8.4) ([116], proof of Corollary 8.2.1, p.27)."
- At `:2134`, replace the clause with "(6.2), p.20, at `m=0`".

Tested on the instance: at `m=0` the derivative of the corrected exponent is `2C[ψ(s)−2sψ(s)]=−2C(2s−1)ψ(s)`, which is §6.17g's own Check.

## R03 (P3) — The consumer list cites ClassicalArithmeticCompletion §7.12a, which only an open revision that consumes this roadmap defines

**Location.** `README.md:3168`: "ClassicalArithmeticCompletion §§7.12a, 7.13 and 7.30 (Tate factors and trace characters, …) take from §5.3g…".

**Claim.**
- §7.12a exists only at the head of ClassicalArithmeticCompletion's revision #1409 (aa03308). Main has §§7.12, 7.13 and 7.30, but no §7.12a.
- Neither this pull request's description nor its merge-order paragraph names #1409.
- Naming #1409 would not help either. #1409 itself takes §5.3g from this roadmap (its `README.md:14072`), so it must merge after this pull request. It cannot be required to merge first.

The previous review's R04 wording asked for "a ClassicalArithmeticCompletion §7.12a bullet". That wording introduced this problem.

**Witness.**
- `roadmaps overlaps AnalyticNumberTheoryPartII`: "ClassicalArithmeticCompletion §7.12a (line 3168): #1409 … defines it … (main does not): that pull request must merge first".
- On main, `grep -n "7\.12a"` over `ClassicalArithmeticCompletion/README.md` finds nothing.

**Repair.** Drop the id that only the revision defines. Write "ClassicalArithmeticCompletion Layer 7 (Tate factors and trace characters, the tame local Galois Gauss sums of §7.13 and the symplectic Artin root signs of §7.30) takes from §5.3g…". Main (read at fb99861) has §7.13 (`:14623`) and §7.30 (`:15080`) under the same titles, so after this change every cited id exists on main.

## R04 (P3) — §4.5g has no locator

**Location.** `README.md:324–339`. §4.5g states a theorem (the continued `zΦ(·,n,1)` is the branch `Liₙ^[p]`) with three Checks and a *Needs:* line, but no "See" line.

**Claim.** Every theorem needs a locator. The source this README already cites states this result. Lagarias–Li III ([94]) specializes the Lerch transcendent to `Li_m(z,c)=zΦ(m,z,c)`. Its Theorem 8.4 gives the monodromy of that function on `ℙ¹∖{0,1,∞}` based at `−1`, which is the `z` of §4.5's base point. At `c=1` its `[Z₁]` action is §4.5g's.

**Witness.**
- [R101] arXiv v1, §2 (Summary of main results), p.14: the extended polylogarithm is defined as `Li_m(z,c)=zΦ(m,z,c)`; §8 (Double specialization: Deformed polylogarithm) begins on p.44.
- Theorem 8.4, (8.17)–(8.19), pp.48–49: at `c=1`, `zM_[Z₁]=−(2πi)^m(Log z/2πi)^(m−1)/(m−1)!=−2πi(Log z)^(m−1)/(m−1)!`. For `m=1` this is `−2πi`, and for `m=2` it is `−2πi Log z`. These are §4.5g's first two Checks.

**Repair.** Add before the *Needs:* line: "See [94][R94], §2 (the extended polylogarithm `zΦ(m,z,c)`) and Theorem 8.4 with its proof, (8.16)–(8.19), at `c=1`, base point `z=−1`; [arXiv v1][R101], printed pp.14 and 47–49."

## R05 (P3) — The description names neither PolylogarithmFunctions as an open supplier nor a merge order for it

**Location.** The pull request description at this head:
- "this pull request has no other open supplier";
- "**Depends on** … #1126 AnalyticNumberTheoryPartI";
- "**Merge order.** #1126 (AnalyticNumberTheoryPartI) → **this pull request**".

**Claim.** The repair of the previous R05 made PolylogarithmFunctions a supplier:
- the new contract at `README.md:59–61`;
- §4.1 at `:132`;
- §4.5g at `:339`.

PolylogarithmFunctions is the open new roadmap #1320 (f13ce0d). It is not on main. If this pull request merged first, §§4.1 and 4.5g would cite sections that do not exist on main.

**Witness.** `ls content/TauCetiRoadmap | grep -i polylog` returns nothing. ORDER.txt line 38 lists PolylogarithmFunctions before this roadmap at line 50.

**Repair.**
- Add `- [ ] #1320 PolylogarithmFunctions` under "Depends on".
- Put #1320 before this pull request in the merge-order paragraph.
- Delete "this pull request has no other open supplier".

## Previous findings

- R01 — repaired: #1037 at 06102df, `AutomorphicFormsOnReductiveGroups/README.md:662`: "The additive characters of `F\𝔸_F` are those of AnalyticNumberTheoryPartII: the standard trace character `ψ` of §5.3g, and the identification `ξ↦ψ(ξ·)` … of §5.3h's second statement"; `addChar_equiv` no longer appears; this README `:3166` lists it.
- R02 — repaired: `README.md:41` now reads "§0.31b's uniform quadratic zero gap `1−β≥c_LS/log q`, whose constant is the effective `c_LS` of §0.34's `landau_siegel_exclusion`", with §2.31e and §2.1a cited in prose; none of the six names remains.
- R03 — repaired: Checks added after §5.3j (`:721`, four), §5.3k (`:734`, three), §5.3l (`:752`, four), §5.3m (`:768`, three) and §5.3n (`:785`, four); every value recomputed below.
- R04 — repaired: `README.md:3159` "The adelic harmonic analysis of Layer 5 has these consumers:", with ProbabilisticAndMetricNumberTheory §4.9a, ClassicalArithmeticCompletion and AutomorphicFormsOnReductiveGroups §4.3 added; the §7.12a id it introduced is R03.
- R05 — repaired: `README.md:59–61` "From PolylogarithmFunctions" contract, `:132` "`Liₙ(z)=zΦ(z,n,1)`" bullet, `:324` §4.5g continuation along paths in `U`; its missing locator is R04, its description gap R05.
- R06 — repaired: `:1095` "with the conductor row corrected as in §5.1 and the conductor factors `q` of §5.16"; `:2134`, `:2169` now point to §6.17g; no "normalization convention" remains. The reworded §6.17g claim is R02.

## Verified sound

**Gate, dependency check and build.**
- My gate rerun on 0d40b02 prints `gate AnalyticNumberTheoryPartII: set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate adds `build=0`.
- `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. PolylogarithmFunctions (line 38) and AnalyticNumberTheoryPartI (line 49) both precede this roadmap (line 50).
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.**
- `Suggested.lean` is unchanged since 0717d3f (`git diff --stat` is empty).
- A scratch copy with `#check @name` appended for all 31 declarations, run through `lake env lean`, exits 0 and prints 14 `declaration uses sorry` warnings and nothing else.
- The elaborated types are identical to `signatures.md`. The previous review's one-tactic probe (112 attempts, all failing) still applies.

**Library declarations opened at the pin** (Mathlib 1b1ccf4b), all for names in changed lines:
- `MeasureTheory.Measure.modularCharacter` (`Mathlib/MeasureTheory/Group/ModularCharacter.lean:130`). `map_right_mul_eq_modularCharacterFun_smul` (`:93`) states `map (· * g) μ = modularCharacterFun g • μ` for a left Haar `μ`. That is the `μ(E·b⁻¹)=Δ(b)μ(E)` used by the §5.3l Check and the `Δ(a,b)=a` of the §5.3k negative control.
- `NumberField.dedekindZeta_residue` (`…/NumberField/DedekindZeta.lean:57`) and `dedekindZeta_residue_def` (`:61`).
- `NumberField.abs_discr_gt_two` (`…/Discriminant/Basic.lean:275`).
- `NumberField.discr_dvd_discr` (`…/Discriminant/Different.lean:120`).
- `Complex.cpow_def_of_ne_zero` (`…/Pow/Complex.lean:40`).

**Cross-roadmap citations resolved** (main 12ed9bd and the heads above). 21 ids were opened:
- **PolylogarithmFunctions (#1320 f13ce0d)**, in `TauCetiRoadmap/PolylogarithmFunctions/README.md`:
  - §1.1 (`:105`): `Liₙ(0)=0` for every integer weight.
  - §1.3 (`:151`): the disc series `Σz^(k+1)/(k+1)^n`, absolutely and locally uniformly convergent.
  - §1.4 (`:170`): analytic on `ℂ∖{1}`.
  - Conventions (`:46`): the total value at `x>1` is the lower limit.
  - §§2.1–2.3 (`:251`, `:281`, `:306`). `:328` gives `Liₙ^[T₁p]=Liₙ^[p]−2πi(Log^[p])^(n−1)/(n−1)!`, and `:301` gives `Li₂^[T₁ base]=Li₂(1/2)+2πi log 2`.
  - `:21` hands the comparison and its continuation to this roadmap. There is a single owner.
- **AnalyticNumberTheoryPartI (#1126 3667daa):**
  - §0.31b (`:843`): uniform gap `1−β≥c_LS/log q`.
  - §0.34: `landau_siegel_exclusion` in its Lean.
  - §2.31e: `κ_K≥c min(1/log D_K,1−β_K)`, the quadratic subfield, and a subpower bound whose constant may be ineffective.
  - §2.1a: `K_(−ν)=K_ν` and `K_(1/2)(x)=√(π/(2x))e^(−x)`.
  - `dedekindZeta_residue_le`, `BBRFiniteInput`, `besselK` and the four `hecke*` names each occur in its README or Lean.
- **AutomorphicFormsOnReductiveGroups (#1037 06102df):** §4.3 at `:47` and `:662`.
- **ProbabilisticAndMetricNumberTheory (#1421 d311ebe):** "### 4.9a Lattice quotients, Howe–Moore and Moore ergodicity" at `:6318`, citing §5.3k at `:6352`.
- **SieveMethodsAndPrimePatterns (#1495):** §5.29, at `:15` and `:2259`.
- **ArithmeticDirichletSeriesPartII (#1415):** §4.5c "integer Gamma model", at `:994`.
- **ClassicalArithmeticCompletion:** §§7.13 and 7.30 on main; §7.12a only at #1409. This is R03.
- **Other consumers still citing:** AdelicAlgebraicGroups #792 (§§5.3f, 5.3k, 5.3l, 5.3m), AutomorphicLFunctionsAndLocalFactors #924 (§§5.3g, 5.3j), GeometryOfNumbersAndQuadraticArithmetic #851 (§5.3g) and AutomorphicSpectralTheory #925 (§§5.3n, 5.21w).
- **This README's own pointers:** §5.1 (`:574`, the corrected conductor row) and §5.16 (the same `q` table as §5.15), the targets of the reworded §5.15 locator.

**Sources read at their locators** (the seeded targets that fall in changed passages):
- §4.5 against [R101] arXiv v1:
  - Theorem 2.1 (p.12) and Theorem 2.2 (p.13).
  - `N♯=ℂ×(ℙ¹∖{0,1,∞})×(ℂ∖ℤ≤0)` (2.2) and the base point `a=1/2`, which is `z=−1`. Both match §4.5.
  - §2 (p.14) and Theorem 8.4 with (8.16)–(8.19) (pp.47–49), for §4.5g.
- §6.19 against [R116] arXiv v2: Theorem 6.1 (6.1) is at p.20, (8.4) at p.27 and (8.8) at p.28.
- [R116] (6.2), p.20, read from the PDF's text positions (R02).
- The other thirteen seeded targets (4.2, 4.4, 4.7, 4.9, 4.11, 5.5, 5.18, 5.25, 5.27, 6.12, 6.15, 6.28, 6.30) are untouched since the previous review, which read their sources.

**Remarks on untouched or other-roadmap text** (no change requested here):
- PolylogarithmFunctions `:1137` gives §4.1 the continuation and a Lean name `lerch_transcendent.polylog`. This roadmap does not declare that name, and the continuation is §4.5g. This is for #1320's review.
- §5.15's *Needs:* line does not list §5.16, which its locator now names. §5.15 restates `q` itself, so no input is missing.
- In arXiv v1, §4.5's "Theorems 2.1–2.2 p.12" puts Theorem 2.2 on p.13. The README's [94] pages are those of the published version, which I did not read.

**Adversarial table.** Changed statements first, with values computed for this review. Rows for untouched statements are carried from the previous review (r12) and marked so.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.1 `Liₙ(z)=zΦ(z,n,1)` | `n=2,z=½`; `n=−1,z=½`; `n=0,z=½`; `z=0` | `½Φ(½,2,1)=0.5822405=0.8224670−0.2402265`; `½Σ(k+1)2^(−k)=2=½/(¼)=Li₋₁(½)`; `zΦ=1=Li₀(½)`, `Φ=2`; `0` vs `Φ(0,n,1)=1` | Holds | None |
| §4.5g path `ℓ_n` | circle `|z+¼|=¾`; segment | passes `−1`, `½`; `max Re z=½<1`; `|0+¼|=¼≠¾`; `c∈[½,1]` misses `ℤ≤0` | Well posed | None |
| §4.5g, `n=1` | loop `|z−1|=½` from `½` | §4.5d: `zΦ` changes by `−2πi`; PF `:328`: `log 2↦log 2−2πi`; LL (8.18)–(8.19), `m=1`: `−2πi`; reversed: `+2πi` | Agree | None |
| §4.5g, `n=2` | same loop | §4.5f: `−(2πi)²a e^(−2πia)=−2πi Log z/z`, so `+2πi log 2` at `½`; PF `:301`: `Li₂(½)+2πi log 2`; LL `m=2`: `−2πi Log z` | Agree | None |
| §4.5g, `n≤0` | `n=0`, `z=½` | `zΦ=z/(1−z)=1=Li₀(½)`; `Φ=2` | Holds | None |
| §4.5g locator | LL III Thm 8.4 at `c=1` | the source gives the `[Z₁]` action above; README has no "See" | Missing | R04 |
| §5.3j `d^×x_v` | `ℚ(i)` above 2 | `N(𝔇)=4`: `O_v` mass `½`, `O_v^×` mass `¼`, `d^×x(O_v^×)=2·¼=½=N(𝔇)^(−½)`; `∏N(𝔇_v)^(−½)=½=|−4|^(−½)` | Holds | None |
| §5.3j Checks | `ℝ`, `ℂ`, `s=1,2`; `q=2` | `π^(−½)Γ(½)=1`, `½` with `dx/(2|x|)`; `(2π)^0Γ(1)=1`, `(2π)^(−1)Γ(2)=1/(2π)`; `Σ2^(−ns)=(1−2^(−s))^(−1)`, unit mass `1` vs `½` | Holds | None |
| §5.3k Checks | `ℤ≤ℝ`; `S₃`; `ax+b` | mass `1`, `½`; `6=3·2·1`, mass `2` with probability; `μ(E(2,0)⁻¹)=2μ(E)`, so `Δ(2,0)=2≠1=Δ_H`; `r↦r/2` scales Lebesgue by `½` | Holds | None |
| §5.3l Checks | `diag(2,½)_∞`; `diag(2,1)∈B(ℚ)`; `b=diag(2,1)`; `ι(n(x))` | `t=2` (raw `4`); `|2|_𝔸=2·½=1` vs `√2`; `μ(Eb⁻¹)=2μ(E)`, `Δ=2` vs `½`; `wn(−x)w=[[1,0],[−x,1]]` | Holds | None |
| §5.3m Checks | `ℚ`; `ℚ(√−5)`; `diag(p,1)`; Siegel | `h=1`; `h=2` (`x²+5y²=2` unsolvable, so `𝔭` is nonprincipal); `g⁻¹∋1/p`; `∫_c^∞λ^(−3)dλ=1/(2c²)` vs `∫dλ/λ=∞` | Holds | None |
| §5.3n Checks | `q=2,z=3`; `ℝ`, `ℂ` at `z=3`; `ℚ` | `1+Σ2^(k−1)2^(−3k)=7/6=(7/8)/(3/4)`; `[x/√(1+x²)]=2=(1/π)/(1/(2π))`; `4π·¼=π=2π/(z−1)`; `ξ(1)` pole, `ξ(2)≠0`; `t^(2z)`: `Re z>1` | Holds | None |
| §5.3n local integral with `N(𝔇_v)^(−½)` | general `q` | `1+(1−q⁻¹)Σq^(k(1−z))=(1−q^(−z))/(1−q^(1−z))=ζ_v(z−1)/ζ_v(z)`, as in the Spherical-section bullet | Consistent | None |
| §5.21 residue at `z=1` | `f=1_(O_v)`, `ℚ(i)` above 2 | `(1−q⁻¹)^(−1)N(𝔇)^(−½)∫f dx_v/L_v(1)=N(𝔇)^(−½)=½=vol_self-dual(O_v)` | Holds | None |
| §5.7a prose citations | PartI 3667daa | §0.31b `1−β≥c_LS/log q`; §2.31e `κ_K≥c min(1/log D_K,1−β_K)` and the ineffective `c_(n,a)`; `e·a·c_n D^(−a)` from `log x≤x^a/(ea)` | Match | None |
| §6.17g (6.2) claim | `m=0`; general `m` | bar spans `1+m`: coefficients `(1±m)/2`, `½+½`, so `logΓ(s)`=(8.4); (6.5) forces `α=(1+m)/2` | Claim false | R02 |
| §6.17g derivative | (8.4) | `2C[log2π+1−2s+ψ−2(sψ−s+½log2π+½)]=−2C(2s−1)ψ(s)` | Holds | None |
| §6.19 locators | [R116] | (6.1) p.20, (8.4) p.27, (8.8) p.28 | Present | None |
| Consumer #856 | cf6ae2f | 0 citations; `:2285` defines ψ, `:2299` `F⊥=F`, `:2311` Schwartz–Bruhat | Bullet false | R01 |
| Consumer #1037 | 06102df | `:662` takes §5.3g, §5.3h; `addChar_equiv` absent | Holds | None |
| Consumer #1409 | aa03308 vs main | §7.12a only at #1409 `:14070`; #1409 `:14072` consumes §5.3g | Revision-only id | R03 |
| PolylogarithmFunctions contract | #1320 | §§1.1, 1.3, 1.4, Conventions `:46`, §§2.1–2.3 as quoted above | Match | None |
| Description | pull request text | Depends on: #1126 only; README cites #1320 at `:61`, `:132`, `:339` | Incomplete | R05 |
| §4.4 (r12) | `z=½,c=1,s=−1` | `Φ=4`; LHS `4`; `−sΦ=4`; `+sΦ=−4` | Holds | None |
| §4.9 (r12) | `a=c=½` | multipliers `−i`, `1`; `L₊=0` | Holds | None |
| §4.15 (r12) | `χ₄`, `s=2` | `(17.1973−2.5419)/16=0.91597=G` | Holds | None |
| §5.9 (r12) | `O_F³` | weight `1/6`; `b=1` fails `3∣b` | Holds | None |
| §5.11 (r12) | Dirac; `diag(2,1)` | `3·2^(2s)`; `|2|_𝔸=1` | Holds | None |
| §5.12 (r12) | `R/(s−1)+T/(s−5/6)` | residues `R`, `T` | Holds | None |
| §5.17 (r12) | `d=9,ψ1,n=3`; `d=1,ψ2` | `0`; `−1`; period `12=4d` | Holds | None |
| §5.18 (r12) | `(−2,−2)`; `Q` | in `B₄∖B₃`; `min=0` at `(−3/2,−3/2)` | Holds | None |
| §5.22 (r12) | `ψ1,d=1,s=−1` | `(1−2)(−1/12)=1/12` | Holds | None |
| §5.23 (r12) | `ψ−2,s=0`; `ψ1,s=0` | `0.90032`; `1/Γ(0)=0` | Holds | None |
| §5.26 (r12) | `B(0)[(1,0),(1,0)]` | `4/(3π)` | Holds | None |
| §5.27 (r12) | order at 1 | real 1; complex 2 | Holds | None |
| §6.4 (r12) | `{λ}`; `cλ` | `λ^(−s)`; `c^(−s)` | Holds | None |
| §6.5 (r12) | `β=1,q=2` | `μ(2Ẑ)=½` | Holds | None |
| §6.15 (r12) | `{λ₁,λ₂}`; genus 2 | `c²λ₁λ₂`; `ζ(0)=−4/3` | Holds | None |
| §6.45 (r12) | `β=2` | `2^(1−β)=½` vs `8` | Holds | None |
| `lerchContinuation_solvable` (r12) | basepoint `(½,−1,½)` | `z∉{0,1}`, `c∉−ℕ`; denominator in `[1,2]` | Well posed | None |
| `lerch_completed_functional_equations` (r12) | `(1−s,1−c,a)∈D` | `0<Re(1−c)<1` | Holds | None |
| `complexHurwitzContinuation_exists` (r12) | `m=0,1`; `c=1,½,1+i` | `−½`, `−1/12`, `0`, `−½−i` | Holds | None |
| `barnesG_asymptotic` (r12) | `N=1` | `B₄−B₄({t})≤0`; `log A=0.2487545` | Holds | None |
| `quadratic_large_sieve` (r12) | `M=1,N=3` | `0`, `4` | Holds | None |
| `quadratic_fourth_moment` (r12) | `σ=½,1` | `χ≠1` excludes the pole | Holds | None |
| `quadraticDoubleSeries_continuation` (r12) | `A` row 1 | `(½,½,½,−½)`; `e=+1,−1,−1,+1` | Holds | None |
| `exists_unique_restrictedAddHaar` (r12) | `Ẑ`; `p⁻¹ℤ_p`; `2μ₂` | `1`; `p`; `2` | Holds | None |
| `adeleRing_selfDual` (r12) | `ψ(1/6)`; `e(x_∞)` | `1`; `ψ′(½)=−1` | Holds | None |
| `exists_unique_quotientMeasure` (r12) | `ℤ≤ℝ`; `ax+b` | mass 1; `Δ_G|_H≠1` | Holds | None |
| `gl2_classNumber` (r12) | `ℚ`; `ℚ(√−5)` | 1; 2 | Holds | None |
| `firstEisenstein_generate` (r12) | `ζ=1,i,−1,−i` | `(1,−1,1,−1)=e(½)` | Holds | None |
| `critical_scaling_measure_unique` (r12) | `δ₀`; `β=1` | `2_*δ₀=δ₀≠2δ₀` | Holds | None |
| `supercritical_scaling_measures` (r12) | `ν=δ₁`, `β=2` | mass `n^(−2)·6/π²`; `W`: `0.60793` | Holds | None |

## Not verifiable

- **Wright [103]** (GDZ). The scan is image-only and this worker has no OCR. Affected: the §§3 and 6 locators of §§5.3l–5.3n. Their new Checks were verified by computation (table).
- **Datskovsky–Wright [105].** Image-only, and already in `needs-references.toml`. Affected: §5.3m's (6.8), p.73.
- **Published [94]** (Springer, which the sources service classes as paywalled). Only [R101] (arXiv v1) was read, so R04's suggested page numbers are arXiv v1's. Its theorem numbers (2.7, 2.9, 8.4) are the ones to cite.
- **Sarnak [115], Tate [129], Bump [131] and Folland [132]** are not open access or are image-only. None of them is cited by a changed sentence except through unchanged "See" lines.

## Source issues

- **Misprint** in R101 (Lagarias–Li III, arXiv v1) at Theorem 8.4, p.47 (also Theorem 2.9 and (2.17), pp.16–17): the source says the monodromy matrices act on the basis `z^(1−c)(log z)^n`; it should be `z^(1−c)(log z)^n/n!`, the `b_(n,c)` of the proof on p.48, for which the entries `(2πi)^j/j!` of (8.14) hold; affects nothing.
