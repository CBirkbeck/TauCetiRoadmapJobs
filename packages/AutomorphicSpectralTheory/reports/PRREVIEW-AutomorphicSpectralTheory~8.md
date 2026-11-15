# Review of AutomorphicSpectralTheory (pull request #925 at 2920b0d)

**Verdict:** needs changes

## R01 (P3) — The description's dependency paragraph names two of the five open suppliers

**Location:** Pull-request description, Dependencies paragraph: "By section, the README uses: AdelicAlgebraicGroups §§0.1–0.3, 2.1–2.3, 3.1, 3.4–3.6; ArithmeticLocallySymmetricSpaces ALS.F.5–F.6, ALS.4.5, ALS.5b.1, 5b.3–5b.5. … and ReductiveGroups are on main."

**Claim:** The paragraph leaves out three things.
- Four suppliers that are still open: AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactors, ArithmeticGaloisRepresentations and ArithmeticGaloisDuality.
- Two ArithmeticLocallySymmetricSpaces sections the README consumes: ALS.0.2 and ALS.F.1.
- From its on-main list: AdelicAlgebraicGroups, which is now on main, and the other on-main suppliers the README consumes.

**Witness:** These are all cited at the head:
- README lines 40–45 cite AutomorphicFormsOnReductiveGroups §§0.2–4.1, AL.R.1–AL.3 and ArithmeticGaloisRepresentations §§2.4–2.7.
- Line 113 cites ALS.0.2 and ALS.F.1.
- Line 58 cites ArithmeticGaloisDuality.

`TauCetiRoadmap/AdelicAlgebraicGroups` exists on main (`e6f6358`).

**Repair:** Replace the paragraph's last three sentences with:

"Still open, and merging first in the order below:
- AutomorphicFormsOnReductiveGroups §§0.2, 2.1–2.4, 2.6–2.7, 3.2, 3.4–3.5, 4.1;
- AutomorphicLFunctionsAndLocalFactors AL.R.1, AL.R.3–AL.R.4, AL.0, AL.1.3.2, AL.1.5.3, AL.1.6.2, AL.2.4.1 and AL.3 (AL.3.3.3, 3.6.1, 3.7.2, 3.9.3–3.9.4, 3.10.1);
- ArithmeticLocallySymmetricSpaces ALS.0.2, ALS.F.1, ALS.F.5–F.6, ALS.4.5, ALS.5b.1, ALS.5b.3–5b.5;
- ArithmeticGaloisRepresentations §§2.4–2.7;
- ArithmeticGaloisDuality §§R02.3.0d, R02.4.5a–R02.4.5b, R02.4.6.

On main:
- AdelicAlgebraicGroups §§0.1–0.3, 2.1–2.3, 3.1, 3.4–3.6;
- SmoothRepresentationsOfLocalGroups SR.1–SR.4;
- AnalyticNumberTheoryPartI §§2.1a–2.1c, 3.23b;
- AnalyticNumberTheoryPartII §§5.3n, 5.21w;
- VonNeumannAlgebras V4.0.Fields and V4.Core;
- OperatorTheory/SelfAdjointSpectralTheory, OperatorIdeals and UnboundedOperators;
- RepresentationTheory/CompactGroups, LieGroups and LieHighestWeight;
- ReductiveGroups and ReductiveGroupsPartII;
- in individual *Needs* lines: NoncommutativeGeometry, AlgebraicCurves, AlgebraicVectorBundles, SchemeAndStackFoundations, FuchsianOrbifolds, PDE, ClassFieldTheory, Chebotarev, GlobalNumberFields, LocalFieldsRamification and LFunctions."

## R02 (P3) — The *Needs:* lines omit the proof route that the new §0.30 introduction names

**Location:** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 608 (new) reads "its proof route: the differential equation of §0.31, the series of the two sides in §§0.32–0.33 and the agreement of their first coefficients in §0.34". This conflicts with two *Needs:* lines:
- line 614, the *Needs:* of §0.30;
- line 642, the *Needs:* of §0.34.

**Claim:** The new text makes three dependencies explicit that the *Needs:* lines leave out:
- `whittaker_cycle_integral` (§0.30) is proved from §§0.31–0.34;
- §0.30's route sentence also uses §0.29;
- §0.34 compares the series of §§0.32–0.33.

Neither *Needs:* line lists any of these sections.

**Witness:** Line 614 lists only §0.26, two Mathlib lemmas and AnalyticNumberTheoryPartI §3.23b. Line 642 lists only §0.26 and two Mathlib lemmas.

**Repair:**
- Line 614 becomes: "*Needs:* §0.26; §0.29; §§0.31–0.34; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Complex.Gamma_mul_Gamma_add_half`; AnalyticNumberTheoryPartI §3.23b."
- Line 642 becomes: "*Needs:* §0.26; §§0.31–0.33; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Complex.Gamma_mul_Gamma_add_half`."

This adds no cycle: the *Needs:* of §§0.26–0.29 and 0.31–0.33 cite only §§0.25–0.27, Mathlib and AnalyticNumberTheoryPartI.

## Previous findings

- none: the review of `d256618` raised no finding.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.30 introduction (new): route through §§0.31–0.34 | ODE `f″+(1−s(s−1)/t²)f=0`, Frobenius at root `s` | Recurrence `aₙ·n(2s+n−1)=−aₙ₋₂`. Since `n(2s+n−1)≠0` for `Re s>0`, we get `a₁=0`, and `c₀` fixes the solution. | route is sound | *Needs:* (R02) |
| §§0.33–0.34 (relabelled): `t^s` coefficients | (A.3) at `r=0` with the duplication formula; (A.2) at `ℓ=0` | Both give `2πe(μ/4)Γ(s)/(Γ((s+1+μ)/2)Γ((s+1−μ)/2))`. The `t^{s+2}` ratio is `−1/(2(2s+1))` on both sides. | true | none |
| §0.33 prefactor against §0.30 | `G(s,μ)·t^{1/2}J_{s−½}` | `(2π)^{3/2}2^{−s}·2^{−s+½}=π^{3/2}2^{2−2s}`, matching (A.3) | consistent | none |
| §0.39 introduction (new); §0.40 (relabelled) | consumers; `k=1,s=1` | Lines 1440 and 1449 (§§1.27–1.28) cite §0.39. The residue at `i` gives `V₁(0)=−πi/2`; the formula gives `−πi·2^{−1}Γ(2)/(Γ(1)Γ(2))=−πi/2`. | true | none |
| §0.43 (relabelled) | `k=1,r=0` | For `t>0`, the lower contour gives `−2πie^{−2πt}`, and the formula gives `2πi(−1)·1·e^{−2πt}`. For `t<0` both sides are `0`. | true | none |
| §§0.42, 0.44, 0.45 (relabelled) | `k=1` | The `K`-sum gives `(−2i/√t)(K_{s+½}+K_{s−½})`, the stated form by `K_{−ν}=K_ν`, and it is invariant under `s↦−s`. `q₀(4π\|t\|)e^{2π\|t\|}` decays like `e^{−2π\|t\|}`, as §0.41 requires. | true | none |
| §3.14 introduction (new); §3.15 Check; §3.19 (sample) | `GL₂`, `T`, `n=2` | `e=0`: `1/(1−x)+1/(1−1/x)=1`. `e=1`: `H_B=(0,−1)`, so the sum is `0`. `e=2`: `1/(λ₁λ₂)`. Line 124 builds §§6.27–6.33 before §§3.11–3.19. | true | none |
| §§3.16–3.17 (relabelled) | `c_Q≡1`, `n=2` | The limits are `1` for both `e=0` and `e=2` (each of order 1) and `0` for `e=1` (order 2). With a non-central `μ₀` the sum is `0`. | true | none |
| §6.27 introduction (new) | consumers | Lines 1749 (§2.15), 2172 (§3.15) and 3531 (§6.36) cite §6.27. Line 3466 (§6.29) cites §6.28. | exact | none |
| §6.28 (reworded) | `GL₂`; `c₊=λ₁,c₋=λ₂`; non-family `c₊=1,c₋=0` | `λ₁/(λ₁−λ₂)+λ₂/(λ₂−λ₁)=1`. The non-family `1/(λ₁−λ₂)` has a pole, so the hypothesis is needed. With `L=G`, `c_B=c_B̄` on `X_G^G`. | same content as Yu22 lines 1116–1138 | none |
| §6.29 introduction (new); §6.30 (relabelled) | `c_β(z)=z` | `c_M(λ)=(λ₁+λ₂)/(λ₁λ₂)→2`, and the formula gives `c′_α(1)+c′_{−α}(1)=2`. Lines 2179 and 2186 cite §§6.29 and 6.33. | true | none |
| §§6.31, 6.33(b) (relabelled) | `f=z^k`; central `μ₀=(μ,μ)`, `c_B=λ₁/λ₂` | `(1/2πi)∮z^{k−1}dz=δ_{k0}`. The limit `2/μ` equals `μ₀₁^{−1}c_M` with `dim a_T^G=1`; `c≡1` gives `0`. | true | none |
| §4.14 (reworded) | `GL₂`: `(d,ν)=(2,1),(1,2)` | `π̃=π`. `χ⊠2=χ∘det` is non-generic. For `n=2` these are the only cases, and `χ∘det≅χ′∘det` forces `χ=χ′`. | equals Yu22 Thm 2.3.6 and MW89 p.606 | none |
| §4.16 (sample; cites §4.14) | Yu22 Prop 5.3.1 | The statement is at line 1923 (p.36) and the remark at line 1925. The residual case uses `Fix(π)=Fix(π′)` (line 2050); the proof ends on p.39 (line 2055). | locator and route exact | none |
| §7.1b (reworded) | `F=ℚ,K=ℚ(i),p=2,β=(−1,−1)`; `β=0,T₀=∅` | The class restricts to `0` on `K`. It survives at a real place of the fixed field of complex conjugation, so the `p=2` hypothesis excludes it. With `β=0`, `E=ℚ(√2)` satisfies all three properties. | same data and conclusions as before | none |
| `Suggested.lean` (unchanged) | `#check @` of all five declarations | The types equal the signature file. Elaboration exits 0. | unchanged | none |

The rows for statements this diff leaves untouched stand as in the previous review, of `d256618`.

- **Gate** on `2920b0d` (the worker's run adds `build=0`; outside the folder `git diff --stat` is empty; since `d256618` only the README changed, 35 lines added and 61 removed):
  ```
  gate AutomorphicSpectralTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
- **Dependency check:** `depcheck: 245 roadmaps, 2225 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` exits 0; the only warnings are `declaration uses 'sorry'` at lines 42 and 84. The file is identical to the one at `d256618`, so the previous one-tactic probe and headline list stand.
- **13 source locators checked against the text:**
  - Yu22: Thm 2.3.6 (line 572); Thm 4.2.2 and (4.2.2)–(4.2.5) (lines 1116–1138); Prop 5.3.1 and Rem 5.3.2 (lines 1923–2055); Lemmes A.1–A.3 (lines 4562–4597);
  - MW89: Théorème p.606 (line 58) and its §IV note (line 49);
  - Ram18: Lemma 4.1 (line 303); Sublemma 4.2 (line 329); §5 (lines 369–459).
- **Demoted ids:** the 17 targets 0.31–0.34, 0.40–0.45, 3.15–3.17, 6.28 and 6.30–6.33 keep their numbers as bold labels. GrossZagierAndArithmeticHeights still finds §§0.39–0.45 and 0.43–0.44 at its open head. No roadmap cites a former heading title.
- **Description claims opened at the pins:** Mathlib `Complex.besselJ`, `analyticOnNhd_besselJ` and `besselJ_neg_int` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean` lines 55, 79 and 84). `FrankeInput` at ArithmeticLocallySymmetricSpaces ALS.5b.4 (its README line 528). The normal tower is in §7.1c (line 3724).
- **Remark on untouched text** (no change asked): the headings of §§0.35–0.37, 1.23–1.24 and 2.24 still carry source display numbers such as (2.5) and (2.14).

Overlap check: read AutomorphicSpectralTheoryPartII, AutomorphicLFunctionsAndLocalFactors and AnalyticNumberTheoryPartII. None of them owns the changed objects: the Whittaker cycle route, `V_s`, the floor-monomial and multiplicative `(G,M)`-families, the function-field Mœglin–Waldspurger classification and the obstruction-killing extensions. Each is owned here. AutomorphicSpectralTheoryPartII cites none of the changed ids.

Source independence: changed passages only, 7 passages compared with 3 sources (Yu22, Ram18, MW89), none shared beyond the forced hypothesis list "prime to p and split completely in K" (7 words, Ram18 line 306). The largest share is Yu22, 65 of 313 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

## Not verifiable

- [DIT16], Appendix A, pp.983–985 (§§0.30–0.34; only labels changed, locators untouched): not re-read. The previous round found only the Annals landing page, in no licence class. The values were recomputed instead (rows above).
- [GZ86], Ch. IV §3, (3.3) a)–e), pp.277–281 (§§0.40–0.45; only labels changed): the Springer page is paywalled and the manifest has no entry for it. The values were recomputed instead (rows above).

## Source issues

- **Error** in Ram18 at Lemma 4.1, p.9: the source says conclusion (c) holds for `p=2` with no condition at real places, yet `F=ℚ`, `K=ℚ(i)`, `β=(−1,−1)` survives on the index-two fixed field of complex conjugation; it should be: for `p=2`, each `β(K′)` vanishes at the real places of `K′`, or one first passes to a totally imaginary quadratic extension; affects a stated result.

## For the human reviewers

- The package `sources.toml` records only Art05. The README cites Yu22 (65 locators), DIT16 (24), GZ86 (21) and others, none of which has a manifest entry. For this review Yu22, Ram18 and MW89 were read from arXiv and Numdam.
