# Review of IntegralIwasawaTheory (pull request #1306 at eaaddd4)

**Verdict:** accepted

This is an incremental re-review of the 121 lines that changed since 7fdfbc8: 59 insertions and 62 deletions in `README.md` and `Suggested.lean`, and no file outside the folder. All six previous findings are repaired. The repairs introduce no new defect, and I found none in the changed passages. The gate passes.

## Previous findings

- R01 — repaired: README line 1387 says "`finiteWeightHilbert_classicalAttachment` is the single construction of these representations. AlgebraicModularFormsAndSerreWeights R15.5A.1 for F=ℚ, WeightsInEtaleCohomology R34.3 and R34.6 …, HilbertModularVarietiesAndShimuraCurves §R18.3.29 and, through it, AutomorphicGaloisRepresentations §3.10 import it". The "reuse this core" and "shared Carayol/Saito/Taylor member" sentences are gone (lines 13, 1889).
- R02 — repaired: README line 1883 says "**CyclotomicClassGroupsAndStickelberger** §§3.4, 6.1–6.4 and 7.1–7.3 import the prime-power specializations … rather than prove them again: `primePowerHasseUnitIndex_one` (§1.5) …; and `VandiverCondition` (§7.4)". The sentence about two Vandiver predicates is deleted.
- R03 — repaired: `Suggested.lean` lines 19–20 now read "The prime-power statements include the exponent `a = 0`, where the field is `ℚ`." The five-name catalogue and the passages on the smoothing set, N₀ and S are deleted. README lines 153, 174 and 185 now state those five facts in prose.
- R04 — repaired: README line 528 is the new heading "### 3.6 Uniform capitulation and real-unit square classes", placed after §3.2. Line 416 points from §2.8 to §3.6, the build note is deleted, and lines 1572 and 1574 cite §3.6.
- R05 — repaired: README line 1067 now cites "(RJW, Definition 13.12, p. 193, and Lemma 12.20, pp. 186–187, as used in the proof of Corollary 13.16(iii), p. 194.)"
- R06 — repaired: `ha` is deleted from `primePowerCircularUnitIndex`, `primePowerHasseUnitIndex_one` and `vandiver_propagation`. README lines 191, 195, 197 and 1056 state `a≥0`, and each computes the a=0 case (ℚ).

## Verified sound

**Gate, elaboration and dependency check.**
- `tauceti-roadmap … gate … IntegralIwasawaTheory --base origin/main` exits 0. Every check is 0 (set_option, sorry-data, imports, readme-ids-missing, statement-hygiene, depcheck, stray-files, outside-folder, …) and the run ends with `OK`.
- `lake env lean TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean` exits 0 in 4.4 s. The only diagnostics are six `declaration uses sorry` warnings, at lines 80, 92, 113, 135, 146 and 162.
- The dependency check prints `depcheck: 240 roadmaps, 2364 edges, 0 problem(s)` and exits 0. There is no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/IntegralIwasawaTheory'` is empty.
- The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml`.

**Signatures and padding.**
- I put `#check @` of all 13 declarations in one scratch file and elaborated it. The types match signatures.md. The three changed theorems now have the binders `(p a : ℕ) [Fact p.Prime] … [IsCyclotomicExtension {p ^ a} ℚ K]` with no `ha`, and no other binder was lost.
- Each type agrees with its README statement at §§1.5 and 7.4 (a≥0) and §§3.3, 4.1e and 5.6 (unchanged).
- One-tactic probe (`first | simp | rfl | norm_num | decide | infer_instance | (intros; simp_all) | exact?`): all six theorems fail with unsolved goals. There is no padding.

**Library declarations opened at the pins.**
- Mathlib `IsCyclotomicExtension.singleton_one` (`NumberTheory/Cyclotomic/Basic.lean:113`): `{1}`-cyclotomic means `⊥ = ⊤`, so at a=0 the field K is ℚ.
- `NumberField.IsCMField.realUnits` (`CMField.lean:269`): the range of the units map from `𝓞 K⁺`, which is everything when K⁺ = ⊤.
- `IsPrimitiveRoot.one_right_iff`: ζ=1 at order 1.
- Neither Mathlib nor Tau Ceti at the pins contains "HilbertModular", which confirms the new docstring sentence on §9.5 (lines 42–43).

**Changed passages, rechecked.**
- §1.2 line 155: at conductor 2, `closure{−1, ζ=−1, 1−(−1)=2}=⟨−1,2⟩`; at conductor 1, `closure{−1,1}={±1}`.
- §1.3 line 174: RJW Lemma 12.18(i) generates `D_n^+` by −1 and γ_{n,a} with 1<a<pⁿ/2, (a,p)=1 (rjw line 3659, p. 185). The README's set "γ_a(b) with p∤b" contains these, and each γ_a(b) is real, so the generated group is the same.
- §1.4 line 185: for b generating `(ℤ/p^aℤ)^×`, the norm of γ_a(b) is γ_a(−1)=−1, by the product formula in the proof of Corollary 12.19 (rjw lines 3697–3707, p. 186) with `b^{φ(p^a)/2}≡−1`.
- §§2.8 and 3.6: the moved paragraphs are word-for-word as before. Their *Needs:* (§3.2, `uniformCapitulationBound`, §2.7, PadicMeasuresIwasawaAlgebras §§4, 5.2) are now all earlier than or within Layer 3. Layer 3's Dependencies (line 551) add §2.7. Layer 2's Dependencies (line 430) no longer name the square-class calculation.
- §§9.5 and 13: the three construction branches named on line 13 match §9.5 line 1371: Carayol range, the even-degree congruence branch, and the degree-one parabolic realization.
- No roadmap on main constructs the Galois representation of a classical newform. I searched ModularForms, ModularCurves and EllipticCurves; ModularForms uses Eichler–Shimura only via modular symbols. §9.5's claim to the case F=ℚ therefore duplicates nothing on main.

**Cross-roadmap citations resolved at the open heads.**
- AlgebraicModularFormsAndSerreWeights (364af81): line 18 names R15.5A.1 = §6.1.
- WeightsInEtaleCohomology (9e753f8):
  - R34.3 is Layer 3 (line 352), with Carayol's `M_{n,H}` integral model at line 498;
  - R34.6 is Layer 6 (line 691), with Carayol's Theorem 0 hypothesis at line 766.
- HilbertModularVarietiesAndShimuraCurves (8a9e596): line 183 has the row for R18.3.29.
- AutomorphicGaloisRepresentations (480c64f):
  - §3.10 (line 2219) twists to π₀ of type `(k,k−2)` and applies R18.3.29 (lines 2221, 2229);
  - it cites §9.5 at lines 73, 2223 and 2247.
- CyclotomicClassGroupsAndStickelberger (10bc9eb) has headings §3.4 (line 610), §§6.1–6.4 (lines 1020–1125) and §§7.1–7.3 (lines 1150–1193), and cites IntegralIwasawaTheory §§1.1–1.6 and 7.4 at lines 79–81, 1127 and 1146.
- `dyadicPrimePowerCircularUnitIndex` is §1.6, line 201, and `classNumberGrowth` is §3.3.
- Merge positions: IntegralIwasawaTheory 28, before CyclotomicClassGroupsAndStickelberger 33, AlgebraicModularFormsAndSerreWeights 98, WeightsInEtaleCohomology 147, HilbertModularVarietiesAndShimuraCurves 160, AutomorphicGaloisRepresentations 165 and EulerSystemsCyclotomicMainConjecture 167. This roadmap, as the earliest, is the single owner of §§1.5, 7.4 and 9.5.

**Moved id.**
- EulerSystemsCyclotomicMainConjecture cites "IntegralIwasawaTheory §2.8 (`uniformCapitulationBound`, `S`-class version)" at README lines 2841 and 2883.
- §2.8 still exists, and line 416 gives the move to §3.6; line 1877 names §3.6 for that consumer. This counts as the README's old → new numbering line, so it is not a finding.
- No roadmap links to the old §2.8 heading anchor. I searched for `minus-classes-capitulation` and `real-unit-square`.

**Remarks (not findings; consumer-side edits belong to those pull requests).**
- At their heads, the consumers named in R01 and R02 have not yet made the matching edits:
  - CyclotomicClassGroupsAndStickelberger still declares `primePower_indexRealUnits_eq_one` (its `Suggested.lean` line 158) and proves it (README line 624). It also defines its own Vandiver condition for nonzero p (line 1129), identified with §7.4 at odd p (line 1131).
  - WeightsInEtaleCohomology, HilbertModularVarietiesAndShimuraCurves and AlgebraicModularFormsAndSerreWeights do not mention IntegralIwasawaTheory. HilbertModularVarietiesAndShimuraCurves line 20 names WeightsInEtaleCohomology R34.6 as the supplier of the Carayol/Saito core.
- Until those pull requests cite §§1.5, 7.4 and 9.5, the import sentences at lines 13, 1387, 1883 and 1889 describe their contract, not their present text. Their own reviews should raise the duplication.

**Seeded sample.**
- Of the 15 targets, two fall in the changed passages; both locators hold:
  - §1.3: RJW Lemma 12.18 is at rjw line 3659 (p. 185) with its proof on p. 186, and Corollary 12.19 is at line 3695 (p. 186).
  - §2.8: Sharifi Propositions 3.4.1–3.4.2 are at sharifi lines 2690 and 2719 (pp. 90–91); Proposition 3.2.15 and Corollary 3.2.16 at lines 2470 and 2483 (pp. 82–83); Proposition 3.3.9, which §3.6 and §10.6 cite, at line 2606 (p. 87).
- The R05 repair: Definition 13.12 is at rjw line 3972 (p. 193), Lemma 12.20 at line 3715 (pp. 186–187), and Corollary 13.16(iii) uses Lemma 12.20 at lines 4027–4036 (p. 194). Definition 11.6 (§1.2) is at line 3272 (p. 176).
- The other 13 sample targets (§§0.5, 1.8, 2.4, 3.3, 4.1e, 4.3, 5.7, 6.2, 6.5, 7.2, 7.6, 8.1, 11.4) are untouched by the diff. Per the incremental brief they were not re-read; §§6.2 and 11.4 were checked in the previous review.

**Adversarial pass.** One row per changed statement, with values computed now. Rows for unchanged statements are carried from the previous review (PRREVIEW-IntegralIwasawaTheory~7, adversarial table), as marked.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `primePowerCircularUnitIndex` (a≥0) | a=0; p^a=2; 3; 5 | a=0: K=ℚ, ζ=1, `cyclotomicNumbers 1 1={±1}=𝓞_ℚ^×`, both indices 1=h(ℚ). 2: `⟨−1,2⟩∩{±1}={±1}`, index 1. 3: `(1−ζ²)/(1−ζ)=1+ζ=−ζ²`, D=μ₆=all units, index 1=h(ℚ). 5: D⁺=⟨−1,φ⟩, index 1=h(ℚ(√5)) | holds without `ha` |
| `primePowerHasseUnitIndex_one` (a≥0) | a=0; ℚ(i); F(12) as negative control | a=0: K⁺=⊤, realUnits=⊤, index 1. ℚ(i): μ₄=all units, index 1. F(12): `(1−ζ)/(1−ζ̄)=−ζ₁₂`, index 2 | holds; prime power needed |
| `vandiver_propagation` (a≥0) | a=0; p=3, a=2; p=2 | a=0: `CyclotomicField 1 ℚ`≅ℚ, h=1, 3∤1. h(ℚ(ζ₉)⁺)=1. p=2 makes the condition false | holds |
| §1.2 conductors 1, 2 | ζ=1, ζ=−1 | {±1}; ⟨−1,2⟩ | correct |
| §1.3 generators | p=5, a=1 | γ(2)=ζ²+ζ³=−φ; γ(−2)=σ₋₁(γ(2))γ(−1)=φ; γ(4)=γ(−1)=−1; ⟨−1,γ(b):5∤b⟩=⟨−1,φ⟩ | correct |
| §1.4 norm −1 | p=5; p=3 | N(−φ)=φφ′=−1; p=3: γ(2)=γ(−1)=−1, trivial Galois group | correct |
| §1.5 empty matrix | a=0, p^a=2, 3, 4 | `(ℤ/p^aℤ)^×/±1` trivial, so the matrix is 0×0, det 1=h(ℚ)R_ℚ | correct |
| §2.8 Check: dyadic norm kernel | A=A⁺=ℤ/2, ι=0, N=1 | ιN=0=1+j on ℤ/2; Nι=0=2; ker N=0; A^{j=−1}=ℤ/2; A/(1+j)A=ℤ/2. For x∈A⁻: ι(Nx)=(1+j)x=0, and 2·ker ι=Nι(ker ι)=0 | correct |
| §2.8 Check: two systems | A_n=ℤ/p, ι iso | N=p·ι⁻¹=0, so lim←=0 and lim→=ℤ/p | correct |
| §3.6 Check: capitulation | X=Y=ℤ/p, trivial Γ | ν_{n,n₀}=p^{n−n₀}=0, so A_n=ℤ/p (n>n₀); ν_{m,n}=0, kernel order p, C=p | correct; refutes "injective" |
| §3.6 Check: kernels vs orders | X=Λ/p | ω_n≡T^{pⁿ}, ν_{m,n}≡T^{p^m−pⁿ}; v_T(f)<pⁿ gives v_T(ν f)<p^m, injective; #A_n=p^{pⁿ} | correct |
| §3.6 order of build | Needs edges | §3.6 needs §§3.2, 2.7 and PadicMeasuresIwasawaAlgebras §§4, 5.2; §3.2 needs §§2.1–2.4; nothing earlier needs §3.6 | no cycle |
| §9.5 ownership, F=ℚ | main roadmaps | ModularForms, ModularCurves, EllipticCurves: no newform Galois representation | single owner |
| `classNumberGrowth` | carried from ~7 | ℤ₂ over ℚ: (0,0,0); base shift `(p^rμ,λ,ν+rλ)` | holds |
| `bakerBrumer_expDisc` | carried from ~7 | ι=∅ gives β₀=0; ‖1‖>ρ_p, exp(1)=0 needs the disc; `‖2ⁿ/n!‖₂=2^{−s₂(n)}` | holds |
| `ferreroWashington` | carried from ~7 | E=ℚ, p=2: h odd, (λ,ν)=(0,0) | holds |
| §§2.0, 2.3, 4.1a, 4.2, 6.1–6.3, 7.3, 7.5, 7.8, 8.2–8.4, 9.4, 9.5 oldform, 10.4–10.5, 11.4, 12.4, 3.3 Check | carried from ~7 | values as recorded there: e.g. B₃₂ numerator 37·208360028141; `Σaω(a)^{−31}≡777 mod 37²`; ℚ(i), T={5} cyclic of order 4 | correct |
| §2.8/§3.6 cohomology Checks | carried from ~7, now in §3.6 | B=ℤ/4: #B[2]=2, #B=4; r=1, B=0: order 2⁰=1 | correct |

## Not verifiable

- **NSW, *Cohomology of Number Fields*, ed. 2.3** (Proposition 11.1.9, p. 730, now cited from §3.6): the moved text is unchanged. As in the previous review, the sources service resolves the link to the authors' HTML index, not to the PDF.
- **Wiles, Invent. Math. 94; Taylor, Invent. Math. 98** (§9.5, whose wording changed only in its ownership paragraph): only the GDZ volume landing pages are reachable.
- The untouched citations listed as not verifiable in the previous review (Burns–Flach, Koblitz, Baker, Hindry–Silverman, Katz) were not reopened.
- Ownership against the open pull requests was checked for the six roadmaps named in the changed text (CyclotomicClassGroupsAndStickelberger, AlgebraicModularFormsAndSerreWeights, WeightsInEtaleCohomology, HilbertModularVarietiesAndShimuraCurves, AutomorphicGaloisRepresentations and EulerSystemsCyclotomicMainConjecture). It was also checked by a search of all open heads for `finiteWeightHilbert_classicalAttachment` and "IntegralIwasawaTheory §9.5": only AutomorphicGaloisRepresentations cites §9.5.

## Source issues

- none
