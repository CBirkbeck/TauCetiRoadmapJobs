# Review of IntegralIwasawaTheory (pull request #1306 at 92927d1)

**Verdict:** needs changes

This is a full review: the folder changed by 461 lines since 3acabe2. The change adds §§4.1a–4.1e, an in-house proof of Brumer's p-adic Baker theorem that replaces the earlier citation of LinearFormsInLogarithms §8.10. It also adds 39 declarations to `Suggested.lean`. I checked the new mathematics step by step and found no false statement. The four findings are all P3: padding in `Suggested.lean`, one source attribution, a few locators, and two existing Tau Ceti variants that are not named.

## Previous findings

- The previous review (at 3acabe2) had no findings, so there is nothing to re-check. I re-reviewed every statement it carried forward as part of this full review.

## R01 (P3) — `Suggested.lean` has become an API catalogue of §§4.1a–4.1e

**Location.** `TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean`, lines 134–429 (`section BakerBrumer`), the imports at lines 4–5 and the docstring at lines 31–39. Also `README.md` line 3: "`Suggested.lean` states `classNumberGrowth`, `ferreroWashington`, `primePowerHasseUnitIndex_one`, `primePowerCircularUnitIndex`, and `vandiver_propagation`".

**Claim.** The new section contains 39 declarations. Only one of them is a headline, `bakerBrumer_expDisc`, which needs the definition `padicExpRadius`. The other 37 are:
- supporting lemmas of §§4.1a–4.1c;
- a definition that no headline needs (`expTwistDeriv`);
- a repackaging of Mathlib's Siegel lemma (`exists_siegelConstant`, `_linear`);
- a boundary case (`inv_lt_padicExpRadius_iff`);
- the k=0 special case, which is also a README Check (`transcendental_padicExp`);
- two restatements of the headline (`bakerBrumer_expDisc_linearIndependent`, `bakerBrumer_expDisc_transcendental`).

The README Summary still lists only the five older headlines.

**Witness.** One-tactic probe on a scratch copy:
- `padicExpRadius_pos` closes with one `exact Real.rpow_pos_of_pos …`.
- `padicExpRadius_lt_one` closes with one `exact Real.rpow_lt_one_of_one_lt_of_neg …`.
- `expTwistDeriv_zero` closes with `rfl`.
- `expTwistDeriv_succ` closes with `simp [expTwistDeriv, pow_succ']`.

The docstring at line 404 calls `_linearIndependent` "the same theorem".

**Repair.**
1. In `Suggested.lean`, delete everything in `section BakerBrumer` except `padicExpRadius` and `bakerBrumer_expDisc`. Keep the linear-independence form instead if you prefer it, but not both. The README keeps every deleted statement as a target or Check.
2. Remove `import TauCeti.RingTheory.PowerSeries.EvalAt`, `import TauCeti.RingTheory.PowerSeries.HasseDeriv.Basic` and `open Polynomial`; after step 1 nothing uses them.
3. Shorten docstring lines 31–39 so that they name `bakerBrumer_expDisc` and say that its supporting statements are README targets.
4. Add `/-! ## Layer k: … -/` headers in README order: Layers 1, 3, 4, 5 and 7.
5. In README line 560, state the three `padicExpRadius_*` facts in prose without backticked names. Otherwise the gate's `readme-ids-missing` check flags them.
6. Add `bakerBrumer_expDisc` to the Summary's list on line 3.

Tested on a scratch copy with steps 1–4:
- It elaborates with `import Mathlib` alone, exits 0, and gives six `sorry` warnings.
- `#check @bakerBrumer_expDisc` gives the same type as at this head.
- The gate's `readme_identifiers_missing` run on that copy returns exactly `padicExpRadius_lt_one`, `padicExpRadius_pos` and `padicExpRadius_pow_sub_one_le_norm_factorial`. Step 5 removes those three.

## R02 (P3) — The headline Baker–Brumer statement is attributed to sources that prove only the homogeneous case

**Location.** `README.md` line 685, after `bakerBrumer_expDisc`, which allows a constant term β₀ and an arbitrary complete, algebraically closed Ω: "(Brumer; Baker, Chapter 2; Rousseau, exposé 11.)"

**Claim.** None of the cited p-adic sources contains the statement as written. "Brumer" has no locator at all.

**Witness.** The Théorème in rousseau line 38 (p. 11-01), credited there to [3] = Brumer 1967 (rousseau line 205), is homogeneous. It takes algebraic p-adic units whose logarithms are ℚ-independent and concludes that the logarithms are Q̄-independent. It has no β₀ and no general Ω.

**Repair.** Replace the parenthesis with: "(Rousseau, exposé 11, Théorème, p. 11-01, after Brumer 1967: the homogeneous case for p-adic units, which is all §4.2 uses; Baker, Chapter 2, its main theorem: the complex inhomogeneous argument followed here.) The constant term β₀ and the general field Ω are this roadmap's extension, proved in §§4.1d–4.1e." I checked the extension's proof sketch step by step; its rows are in the table below.

## R03 (P3) — Locators in §9.3 and §5.7 point to the wrong page or the wrong equations

**Location.** `README.md`:
- line 1312: "Dasgupta–Kakde–Silliman–Wang, Theorem 3.2, p. 22";
- line 1331: "(Dasgupta–Kakde, equations (75), (79), (83), (87), (89), (92), Theorems 8.8–8.23, pp. 54–65.)";
- line 1333: "Lemma 3.10 and Chebotarev" under the range "pp. 21–26";
- line 835: "(Oesterlé, Propositions 1–2 and §§3–4, pp. 173–175.)"

**Witness.**
- DKSW Theorem 3.2 is at dksw line 827, and p. 24 begins at line 816.
- In dk v3, (75) is at line 1389 (p. 37) and (92) at line 1742 (p. 47). These equations are about Selmer modules and cusps. The §8 constructions are (102) on p. 57, (103) on p. 59, (105) on p. 61 and (107) on p. 62.
- DKSW Lemma 3.10 is at dksw line 961, on p. 27.
- Oesterlé §3 ("Questions en suspens", oesterle line 141) is on p. 172.

**Repair.**
- "Theorem 3.2, p. 24".
- "(Dasgupta–Kakde, equations (102), (103), (105) and (107), Theorems 8.8–8.23, pp. 54–65.)"
- "(Dasgupta–Kakde–Silliman–Wang, Lemma 3.10, p. 27) and Chebotarev".
- "(Oesterlé, §4 and Propositions 1–2, pp. 173–175.)"

## R04 (P3) — §4.1a does not name the pinned Tau Ceti versions it generalizes

**Location.** `README.md` line 562, "(Koblitz, Chapter IV, §1.) *Needs:* Mathlib only.", and the exponential-disc supplier paragraph at line 49. Neither names any Tau Ceti exponential, logarithm or factorial norm statement.

**Witness.** At the pin:
- `TauCeti/NumberTheory/Padics/ExpLog.lean:95–119` proves `Padic.norm_exp_sub_one`, `Padic.norm_log`, `Padic.log_exp` and `Padic.exp_log` on ℚ_[p], for `‖x‖ ≤ p^(−i)` with `1 < (p−1)i`.
- `TauCeti/NumberTheory/Padics/Factorial.lean:108` proves `Padic.rpow_neg_div_le_norm_factorial`: `p^(−n/(p−1)) ≤ ‖n!‖`.

**Repair.** Cite these four statements and the factorial bound, with their modules, in the line 49 paragraph. Add one clause saying how §4.1a differs: it works over any complete normed field over ℚ_p (ℂ_p included), on the open disc of radius ρ_p, and with the sharper exponent n−1. Add a Check that §4.1a specialises to them on ℚ_p.

## Verified sound

**Gate, build and dependency check.**
- I ran the brief's gate at 92927d1. Every check is 0, it ends with `OK`, and it exits 0.
- `lake env lean …/Suggested.lean` exits 0 with exactly 42 `declaration uses sorry` warnings: 37 new theorems plus 5 older ones.
- Dependency check: `depcheck: 244 roadmaps, 2468 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/IntegralIwasawaTheory'` is empty.
- The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`).
- `Suggested.lean` contains no `lemma`, `set_option`, `#eval` or `True`.

**Signatures.**
- I compared all 50 elaborated types in signatures.md with the README. They keep every binder, and their generality matches §§4.1a–4.1e.
- Two notes, not findings: `[CharZero L]` is implied by `NormedAlgebra ℚ_[p] L`, and `hn : n ≠ 0` in the factorial bound is unused, since n=0 gives 1≤1.

**Library names checked at the pin.**
- `#check` succeeds for every Mathlib name in the line 49 paragraph:
  - the exponential and logarithm: `NormedSpace.exp`, `expSeries`, `exp_add_of_mem_ball` (Exponential.lean:438) and `NormedSpace.log`, which is junk 0 off convergence (Logarithm.lean:90);
  - p-adic completion: `PadicComplex.isAlgClosed` and `IsUltrametricDist.of_normedAlgebra` (Ultra.lean:41);
  - factorials: `Nat.Prime.sub_one_mul_multiplicity_factorial`;
  - houses: `NumberField.house_mul_le`, `house_add_le`, `house_pow`, `house_sum_le_sum_house`, `house_intCast`, `house_nat_mul`, `house_prod_le` (Finset K only, House.lean:54, as the README says) and `one_le_house_of_isIntegral`;
  - denominators and number fields: `exists_integral_multiples`, `IntermediateField.finiteDimensional_adjoin` and `NumberField.of_module_finite`;
  - Siegel's lemma `NumberField.house.exists_ne_zero_int_vec_house_le` (House.lean:348; it needs a ≠ 0 and 0 < card α, as the README says);
  - `Algebra.norm_eq_prod_embeddings` and `algebraicClosure`;
  - power series and polynomials: `PowerSeries.exp`, `rescale`, `derivative`, `Polynomial.hasseDeriv` and `factorial_smul_hasseDeriv`;
  - `LinearIndependent.units_smul_iff`.
- Tau Ceti names, checked by `#check` or by reading the source:
  - `PowerSeries.evalAt` (EvalAt.lean:96) and `evalAt_at_zero`;
  - `PowerSeries.hasseDeriv` (HasseDeriv/Basic.lean:72), `coeff_hasseDeriv` and `factorial_smul_hasseDeriv`;
  - `PowerSeries.IsRestricted.evalAt_eq_zero_iff` (Weierstrass/Schwarz.lean:75);
  - `PowerSeries.IsRestricted.norm_evalAt_le_gaussNorm_mul_prod_pow` (Schwarz.lean:182);
  - `TauCeti.PowerSeries.gaussNorm_mul_of_isRestricted` (GaussNorm.lean:983);
  - `IsNonarchimedean.apply_le_one_of_isIntegral_int` (Analysis/AbsoluteValue/Nonarchimedean.lean:131);
  - `Set.jointEval_injective` and `Set.charGroupRing.proj_univ_bijective` (CharGroupRing.lean:260, 267). `TauCeti.Algebra.MonoidAlgebra.CharGroupRing` exists, so the citations tool's lead on it is a false positive.

**Cross-roadmap citations resolved.**
- `IntegralRibet.local_ribet` is IntegralHeckeAndGaloisDeterminants §6.7 (Layer 6). Its Suggested.lean line 581 declares `local_ribet`, and README line 4960 states it.
- EulerSystemsAndKolyvaginSystems line 4423 cites IntegralIwasawaTheory §12.6, consistent with §12.6's ownership of `TauCeti.StarkSystems`/`TauCeti.RubinStark`. Those names are targets, not pinned modules; that is the citations tool's other two leads.

**Ownership of the new material.**
- §§4.1a–4.1e plan the same objects as LinearFormsInLogarithms §§8.1–8.10 (open, another author): the exponential on its disc, ultrametric Liouville, many-zeros bounds, Hermite interpolation and Baker–Brumer. Main's DiophantineApproximationAndTranscendence (README line 57) cites that section.
- LinearFormsInLogarithms is on the brief's list of roadmaps never to cite and is absent from the merge order. This roadmap is at position 29, so the notion moves down and this roadmap is its owner. I record that move here.
- The citations in LinearFormsInLogarithms and DiophantineApproximationAndTranscendence should point here. That is not a defect of this pull request.
- `roadmaps grep` finds no other open roadmap declaring the headline names. overlaps.md lists no pull request that changes this roadmap and no dropped id.

**Seeded sample (15 sections), checked against the texts.**

| § | Locators verified |
|---|---|
| 0.4 | sharifi Def. 3.2.2, line 2348, p. 78: inverse limits are Λ-modules (lines 2349–2352). kolster2009 p. 7, lines 129–136: the conjugation action. sharifi Lemma 2.4.4, line 1564, p. 52. kurihara §4.1, line 835, pp. 22–24. |
| 1.8 | sinnott1980 (printed page = scan page + 179): Prop. 2.3, line 561, p. 194; Prop. 4.1, line 923, p. 203; Prop. 4.2, line 1020, p. 205; corollary, line 1083, p. 207; Thm 4.1 with both formulas, lines 1095–1102, p. 207; (4.8), line 1116, p. 207. sharifi Thm 4.7.1, line 3840, p. 121 (intersection C_F, Def. 4.3.1, line 3400); Prop. 4.7.7, line 3879, p. 122. |
| 2.3 | sharifi Prop. 3.2.6 and Cor. 3.2.7, p. 79; Def. 3.2.10, p. 80; Prop. 3.2.11, line 2405, p. 80; Props 3.2.20–3.2.21, p. 83. |
| 2.6 | sharifi Thms 3.3.3–3.3.4, lines 2520 and 2532, p. 84: all p, with the λ(X′) bound when μ_{2p}⊂F. |
| 3.2 | sharifi (3.2.1), line 2414; Rem. 3.2.12, Lemma 3.2.13, lines 2425–2455, and Thm 3.2.14, pp. 80–82. The kernel-transition argument matches. |
| 5.7 | oesterle Props 4–6, pp. 176–179; conclusion of §6, line 376, p. 180. washington1978 Prop. 2, line 234, p. 91; sign arrangement on p. 92. sharifi Prop. 6.2.8, line 5167, p. 162. The §3 range is R03. |
| 7.5 | rjw (journal) Def. 13.12 and Prop. 13.13, lines 3972–3983, p. 193; Cor. 13.16, lines 4009–4026, p. 194. |
| 9.3 | silliman v2 Prop. 8.2, p. 37; Thm 8.4, p. 39; Thm 8.10, p. 42; Thms 8.11–8.13, pp. 43–44. dk Thms 8.8, 8.9, 8.15, 8.17, 8.18 and 8.23, pp. 54–64. DKSW Lemma 3.1, p. 22; Thms 3.3 and 3.5 with Cors 3.6 and 3.8, pp. 24–26. The rest is R03. |
| 10.5 | kolster2009 Prop. 2.1 and Cor. 2.2, p. 10; Prop. 3.1, line 383, p. 14. rognes-weibel App. A, proof of Thm A.1, line 2451, p. 47. kurihara (14), line 978, p. 26. |
| 11.3–11.5 | kurihara Lemma 4.2(1)–(2), line 924, p. 25, with proof to line 968, p. 26; Thm 2.12, line 505, p. 14. |
| 11.7 | kurihara Thm 4.1, line 882, with its reduction (lines 886–900) and proof, pp. 24–27; Cor. 4.3, line 1012, and its proof (t=γ−1, P₁=Coker f, P₂=C³/tC³), lines 1018–1035, pp. 27–28. |
| 12.5 | dk Thms 3.5 (line 782, p. 21) and 3.7, Cor. 3.8, Lemma 3.9, pp. 21–25; Lemmas B.4–B.7 and Thm B.8, pp. 93–96. kurihara Thm 2.8 and Cor. 2.9, p. 11. dksw Thm 1.1, p. 4, and Thm 2.4, p. 8, with (A5) at line 162. dk Thm 1.2 and (5), pp. 4–5. |
| 12.6 | dk (8)–(10), p. 8; Thm 1.6, line 316, p. 9; §3.4, pp. 25–27. |

**Adversarial pass.** One row per statement. The rows for the new statements are new; the older headlines were recomputed.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `bakerBrumer_expDisc` | ι=∅; the single point ℓ=1 in ℂ_p; ℓ=(x,2x); k=0 | ∅: the relation gives β₀=0. ℓ=1: ‖1‖=1>ρ_p, exp(1)=0 (non-summable tsum), and −1+1·1=0, so the disc hypothesis is needed. (x,2x) is not ℚ-independent. k=0 is p-adic Hermite–Lindemann | holds; every hypothesis is needed |
| §4.1e parameter choice | k=0: J*=36, h=X⁸, D=X¹³ | Condition 1: (D+1)²≥X²⁶ against 2(h²+1)h≤4X²⁴, ratio ≥(X/2)². Condition 3: X^{22+J} log G against 2^{35−J}X^{23+J} log r₀. Condition 4: exponent (8k+13)(k+3)=39 < 9k²+48k+59=59. Condition 2: 2^{36}X¹⁵≤X¹⁶ when n≥36 | the conditions can be met |
| §4.1e extrapolation step | \|m\|≤S′, j<S′ | \|m′\|<2S′≤S_J. M=B^{S′}r₀^D. Upper bound B^{S′}r₀^{D−R_JS′}; lower bound μ^{S′}Σ′^{−d_K}. Final: ‖ιP‖≤‖1/u₁!‖ϱ^{−(D+1)^{k+2}}r₀^{D−R*S*}, and ‖1/u!‖≤p^D | contradicts conditions 3 and 4 as stated |
| §4.1d size E | k=0, D=h=1; G=1,2 | E=2G⁴, giving 2 and 32 (8 without the leading G-factor). k=0, D=2, h=1: E=4 | Checks correct |
| §4.1d separation | p=5, α′=1/6, δ=6, G=1 | ‖1/6−1‖₅=1/5<ρ₅≈0.669. ‖λ₀‖=1/5 against the claimed bound (2G)^{−1}=1/2 | δ≤G is needed; Check correct |
| §4.1d derivative identity | k=0, P=δ_{(0,(1))} | F₀=e^{λ₀X}, F₁=θe^{λ₀X}; F₀′=F₁ iff λ₀=θ | holds |
| Liouville at an ultrametric place | ℚ with x=p, c=1, H=p; ℚ(i) with x=1+i, p=2, H=√2; x=p/2 | 1≤p·p⁻¹=1 (sharp); 2·2^{−1/2}=√2≥1; non-integral x gives (p/2)(1/p)=1/2<1 | holds; integrality is needed |
| Schwarz coefficient bound | f=X(X−1), A={0,1}, R=1, M=r²; R=r | ‖aₖ‖≤r²·r^{−2}=1, attained by −1 and 1; when R=r the conclusion equals the hypothesis | holds |
| Schwarz value bound | f not restricted at r with ‖x‖=r; a with ‖a‖=r and ‖x‖<r | evalAt=0≤RHS; that factor is (r/r)^S=1 | junk cases are safe |
| Hermite interpolation | ℚ₃, ι=1, S=4, s=3; S=1; 𝔽_p((t)) with s=p | W=X³; W=X³/6 with ‖1/6‖₃=3; W=1; the p-th derivative vanishes, so CharZero is needed; construction bound ϱ^{−(#ιS−s−1)}≤ϱ^{−#ιS} | holds |
| `expTwistDeriv` laws | c, m=1; c=0, m=3; P=1 | 1+cX (the opposite sign would give 1−cX); 24X; c^m; (Qe^{ψX})′=(Q′+ψQ)e^{ψX} | correct |
| weighted exponential coefficients | p=2, Q=1, ψ=4, r=2 | ‖4^k/k!‖2^k=2^{v₂(k!)−k}: 1/2 at k=1, 2 and 4. In general ρ^n≤ρ^{n−1}≤‖n!‖ | holds |
| disc facts | p=2, 3; n=4 at p=2; y=−1 at p=2 | ρ₂=1/2=‖2‖, not strictly inside; ρ₃≈0.577>1/3; ‖24‖₂=1/8=ρ₂³; ‖−2‖=ρ₂ and log(−1)=0, so exp(log y)=1≠−1 | iff and strictness correct |
| Siegel with constant | M=0; a=0; 2M≤N | unit vector with house 1≤C; exponent M/(N−M)≤1 gives the bound C²NA | holds |
| §0.4 norm polynomials | p=2, m=0, d=1; augmentation; ω₁ | 2+X; p^d; 2T+T²≡T² mod 2 | Checks correct |
| §1.8 Sinnott index | ℚ(√5); g=1–4; ℚ(i) | h·2^{d−1}·(2/2)·1=2; a=0,0,0,1; (1−i)²=−2i, so g′=1, and Sinnott's bounds give μ=ν=1 | matches Thm 4.1 and Prop. 4.1 |
| §§2.3/2.6 Λ-ranks | totally real base; one complex place | rank r₂: 0 and 1 (kolster2009 line 149) | correct |
| §3.2 inertia kernel | two ramified primes; n=m | ker(ℤ_p²→ℤ_p)=⟨(t,−t)⟩, rank 1; ν_{m,m}=1 | correct |
| §5.7 dyadic representatives | p=2 | H={±1}, so R has 1 element (oesterle line 170) | correct |
| §7.5 first real layer | p=3 | F(1)⁺=ℚ, −1≡2 mod 3, so the principal closure is trivial | correct |
| §9.3 Hasse lift | F=ℚ, p=5, m=2 | weight ≡0 mod 20; w=20t+4 is divisible by p−1=4 but excluded | README correct; source issue below |
| §10.5 Check | F=ℚ, n=2, S={∞,2}∪{3} | 24·(−1/12)=−2 with v₂=1; ℤ₂/(3−1) has order 2; total order 4 | correct |
| §11.3 joint ideals | ℤ₂, J₁,₀ | 2∈(2,T) but 2∉(T); a=0 gives the unit ideal | correct |
| §11.4 lifting | M=0; M=R | r=0 with det 1; a 1×1 zero presentation, not torsion | correct |
| §11.5 comparison | p=2 | H¹(C₂,ℚ₂/ℤ₂)=ℤ/2; H²=(ℚ₂/ℤ₂)/2=0 | cokernel ℤ/2, as in Lemma 4.2(1) |
| §11.7 trivial character | F=k | Det⁻¹=char(H²)·T⁻¹=g, so char 𝔛_S=(Tg); char P₁/char P₂=g | correct |
| §12.5 Check | ℚ(ζ₃), S={∞,3}, T={5}; d=2 | 5 is inert, so 𝔽₂₅^× of order 24 contains μ₆; (A5) fails; Σ={∞}, Σ′={3,5}; Θ/2 annihilates; the unit uses Θ | correct |
| §12.6 lattices | sign module ℤ² for C₂; ℤ with r=1 | det=(a₁b₂−a₂b₁)·2(1−c), so λ∈½ℤ and the lattice is ½∧²M; ½ fails the identity functional | correct |
| `primePowerCircularUnitIndex` | p^a=2, 4 | ℚ: ⟨−1,2⟩∩ℤ^×={±1}, index 1=h(ℚ). ℚ(i): units μ₄, index 1 | holds |
| `primePowerHasseUnitIndex_one` | K=ℚ; ℚ(i) | `realUnits`=all units, index 1; ±i are torsion, index 1 | holds |
| `classNumberGrowth`, `ferreroWashington` | K=E=ℚ, p=2, 3 | p∤h of ℚ_n and of ℚ(ζ_{p^{n+1}}), so μ=λ=ν=0 | holds |
| `vandiver_propagation` | p=3; p=2 | h⁺=1 holds; at p=2 `VandiverCondition` is false | holds |

## Not verifiable

- NSW, *Cohomology of Number Fields*, version 2.3, §§10.3.13, 10.3.22, 10.3.24 and 10.3.25 (§§2.6 and 10.5). The sources service resolves `NSW2e/NSW2.3.pdf` to the author's HTML landing page, both with and without `?download=true`.
- Katz, Corollary 4.4.2 (§9.3 Check): paywalled.
- Baker, *Transcendental Number Theory*, Chapter 2; Brumer, Mathematika 14 (1967); Koblitz, GTM 58, Ch. IV §1; Hindry–Silverman, GTM 201, §D.4 (§§4.1a–4.1e): no legal open copy. I read Brumer's theorem through Rousseau's exposé (R02).

## Source issues

- **Error** in silliman (arXiv:2009.14353v2) at Theorem 8.10, p. 42: the source says every sufficiently large even k divisible by p−1 carries a level-one form congruent to 1 mod p^m; it should require divisibility by (p−1)p^N with N large in terms of m (Serre's congruence excludes k=20t+4 for p=5, m=2; the proof's (38) raises weight by p-powers); affects a stated result; corrected in print at Dasgupta–Kakde, arXiv:2010.00657v3, Theorem 8.8, p. 54.
