# Review of SchubertGeometry (pull request #1224 at 368c92d)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/SchubertGeometry/README.md` (2018 lines) and `TauCetiRoadmap/SchubertGeometry/Suggested.lean` (111 lines). Since 25ea793 the branch has merged main, so the manifest now pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`. The pull request changes nothing outside the folder. `PROGRESS.md` and `STATUS.md` are main's generated files and are unchanged here. The previous review's findings are checked one by one under "Previous findings" below. Five of them are repaired; one leaves a single run-together word, which is folded into R06.

## R01 (P2) — Littelmann's decomposition formula can be stated on the same carriers as the character identity, but it is absent

**Location:** `Suggested.lean:32–35`: “S4's component isomorphism theorem and tensor-component theorem need the normal crystal structure on the encodings of a dominant shape … the crystal `B(λ)` on `TauCeti.LSPath` is not.” `README.md:1120`: “with the translated-chamber multiplicity rule and the actual tensor-factor convention”.

**Claim:** The crystal-isomorphism form of the tensor theorem needs a crystal on `TauCeti.LSPath`. Its multiplicity form does not. That form is Littelmann's decomposition formula:

`char B(λ) · char B(μ) = Σ char B(λ+η(1))`, summed over the η ∈ B(μ) with λ+η(t) dominant for all t.

This is a statement about weights of encodings, like theorem 4. The condition "λ+η(t) dominant for all t" is `-⟨λ,α_i∨⟩ ≤ minHeight` for each simple i. Every carrier it needs is native. So a headline that is statable at the pins is absent. In addition, the README states it only through the non-standard phrase "translated-chamber multiplicity rule".

**Witness:** Littelmann1995, Introduction, p. 500 (lines 87–94), states the decomposition formula, and §10, p. 521 (lines 848–865) proves it from Theorem 9.1. The declaration below elaborates at the pins with only a `sorry` warning, in a scratch copy of `Suggested.lean`.

**Repair:**

1. In S4.4, give the decomposition formula its own sentence with the exact quantifiers above and the locator "Littelmann1995, Introduction, p. 500; proof §10, p. 521". Drop the phrase "translated-chamber multiplicity rule".
2. Add the following to `Suggested.lean` after `weylDenominator_mul_finsum_single_eq_dotAlternatization`, and name it in the README's S4.4 bullet:

```lean
/-- **Littelmann's decomposition formula** (S4.4; Littelmann1995, Introduction, p. 500, proved in
§10, p. 521). For dominant `λ, μ`, the product of the characters of the encodings of shapes `λ`
and `μ` is the sum, over the encodings `η` of shape `μ` with `λ + η(t)` dominant for all `t`,
of the characters of the encodings of shape `λ + η(1)`. -/
theorem finsum_mul_finsum_eq_finsum_finsum_of_minHeight
    (hlam : lam ∈ dominantChamber P b) {mu : M} (hmu : mu ∈ dominantChamber P b)
    (f : M →+ V) (hf : Function.Injective f)
    (F : b.support → Module.Dual 𝕜 V) (hF : ∀ i m, F i (f m) = (P.coroot' i m : 𝕜))
    (wt : LSPath P b mu → M) (hwt : ∀ η, f (wt η) = (η.toPLPath 𝕜 f).endpoint) :
    (∑ᶠ π : LSPath P b lam, single (π.toPLPath 𝕜 f).endpoint (1 : ℤ)) *
        ∑ᶠ η : LSPath P b mu, single (η.toPLPath 𝕜 f).endpoint (1 : ℤ) =
      ∑ᶠ η : {η : LSPath P b mu //
          ∀ i : b.support, -(P.coroot' i lam : 𝕜) ≤ (η.toPLPath 𝕜 f).minHeight (F i)},
        ∑ᶠ π : LSPath P b (lam + wt η), single (π.toPLPath 𝕜 f).endpoint (1 : ℤ) := by
  sorry
```

3. Keep the crystal-level tensor-component theorem and the isomorphism theorem in the docstring as not statable.

**Tested:**

| Case | Encodings η and their minimal heights | Right side | Left side |
|---|---|---|---|
| SL₂, λ=μ=ω | min H = 0 and −1; both pass the bound −1 | char B(2ω)+char B(0) = e^(2ω)+2+e^(−2ω) | (e^ω+e^(−ω))² |
| SL₂, λ=ω, μ=2ω | min H = 0, −1, −2; the straight path −2ω fails the bound −1 | e^(3ω)+2e^ω+2e^(−ω)+e^(−3ω) | the same product |
| PGL₂, λ=μ=α | all three encodings pass the bound −2 | e^(2α)+2e^α+3+2e^(−α)+e^(−2α) | (e^α+1+e^(−α))² |

## R02 (P3) — ReductiveGroups §3A.5 is cited for content that only an open revision of it defines

**Location:** `README.md:404–409`: “ReductiveGroups §3A.5 supplies, for every scheme X locally of finite type over ℂ, the classical topology on X(ℂ) with its functoriality … For smooth X it supplies the holomorphic charts”. The same attribution appears at lines 39–42, 816, 1589–1592, 1615, 1679, 1691 and 1791.

**Claim:** On main, §3A.5 ("Properness and the complex comparison") does not construct the point topology of an arbitrary locally finite-type scheme or the charts of smooth schemes. It consumes them from ComplexComparisonPartII C−1.1 (`.complexPoints`, `.separatedHausdorff`, `.smooth`), which is still an open pull request. The content that S9.0, S9.1, S2.5 and S9.8 now consume is defined only by an open ReductiveGroups revision. The pull request's description does not name that revision. Before this round, S9.0 built the point space itself.

What main's §3A.5 does supply is the part S9.1 and S9.8 use for the flag:

- the closed-orbit holomorphic submersion;
- its local sections;
- the biholomorphism G(ℂ)/H(ℂ)≃O_x(ℂ).

**Witness:** Main `ReductiveGroups/README.md:339–343` “consume ComplexComparisonPartII C−1.1's actual `.complexPoints` … `.smooth` interfaces”. Open revision #1332, line 942: “For every scheme X locally of finite type over ℂ, put the classical topology on X(ℂ)”; #1676 repeats it at 1335–1402.

**Repair:** The README's reading of §3A.5 is the intended one, so record the dependency. The description's merge-order ("Depends on") paragraph names the ReductiveGroups revision whose §3A.5 constructs the classical point topology and smooth charts (#1332 at 7dbc27d), so that it merges first. No README text changes.

If instead this folder must stand on main as it is, do two things:

- Restore S9.0's own clause, as at 25ea793: the underlying points are X(ℂ); separated finite-type X gives a Hausdorff, second-countable space; smooth charts are identified with holomorphic charts (SGA1, Exposé XII, Theorem 1.1 and §§2–3, retyped pp. 239–247).
- Cite §3A.5 only for the closed-orbit biholomorphism and its local sections.

**Tested:** `grep -n 'classical topology' ReductiveGroups/README.md` on main returns nothing. At #1332's head the same command returns lines 20 and 943.

## R03 (P3) — S8.2's integral presentation has no locator, though a cited source states it

**Location:** S8.2, `README.md:1514`: “The geometric kernel and surjectivity are targets of the stated flag push-pull/filtration argument; the representation-ring freeness input is Steinberg1975, Theorem 2.2”.

**Claim:** The theorem R(T)⊗_(R(G))ℤ≅K₀(G/B−), for G whose derived group is simply connected, carries no locator. Only its freeness input does, and that input is uncertified. MerkurjevEquivariant is already in the manifest, and its Corollary 6.8, applied to X=G/B−, states the presentation under exactly S8.2's hypothesis.

**Witness:** MerkurjevEquivariant Corollary 6.8, p. 16 (line 676), for split reductive G with simply connected commutator subgroup (Theorem 6.6, line 668) and smooth projective X: K′₀(X)=ℤ⊗_(R(G))K′₀(G;X). Corollary 1.12, p. 5 (line 200): K₀(G;G/H)=R(H).

**Repair:** Append to S8.2's *Needs:* line: “The presentation is MerkurjevEquivariant, Corollary 6.8, p. 16, applied to X=G/B− (setting of Theorem 6.6: G split reductive over a field with simply connected commutator subgroup), with Corollary 1.12, p. 5, identifying K₀(G;G/B−) with R(B−)=R(T); these locators refer to the author draft.”

**Tested:** For SL₂, ℤ⊗_(ℤ[z+z⁻¹])ℤ[z^(±1)]=ℤ[z]/(z−1)². This has rank 2, equal to K₀(ℙ¹). It sends z to [O(1)]=t⁻¹ with (1−t)²=0, which is S8.2's own first Check.

## R04 (P3) — The characteristic-zero character comparisons ignore the native Lie-algebra Weyl character formula and tensor multiplicities

**Location:** S4.4, `README.md:1120`: “Compare the character with the rational representation supplier. In characteristic 0 compare with simple rational modules”. S3.4, line 954: “In characteristic 0 identify it with the character of the simple module”. The From Tau Ceti contract (lines 95–394) names neither declaration below.

**Claim:** At the pin, Tau Ceti proves, for a Lie algebra with non-degenerate Killing form over an algebraically closed field of characteristic 0:

- the Weyl character formula char L(λ)·Δ=N(λ), with the same `TauCeti.weylDenominator`;
- the Racah–Speiser closed form for the multiplicity of L(ν) in L(λ)⊗L(μ).

These carry the characteristic-zero comparison of S4.4's path characters with module characters, on the Lie-algebra side, and the module form of R01's decomposition formula. The README restates these comparisons as targets without the native inputs. Here N(λ) is `TauCeti.weylNumerator`, Σ_w sgn(w)e^(w⬝λ), which is `RootPairing.dotAlternatization` of e^λ.

**Witness:**

- `TauCeti/Algebra/Lie/HighestWeight/Weyl/Character.lean:324`: `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`.
- `TauCeti/Algebra/Lie/HighestWeight/RacahSpeiser.lean:92`: `TauCeti.tensorMultiplicity_eq_sum_weylSign_mul_formalCharacter_coeff`.
- `TauCeti/LinearAlgebra/RootSystem/Weyl/Numerator.lean:109`: `TauCeti.weylNumerator`.

**Repair:**

- **From Tau Ceti:** add one paragraph naming these three declarations, with their files and their hypotheses: algebraically closed field of characteristic 0, non-degenerate Killing form, and a Cartan subalgebra with a base.
- **S4.4:** state that, in characteristic 0, char B(λ)=char L(λ) follows from `weylDenominator_mul_finsum_single_eq_dotAlternatization`, the native formula and the non-zero-divisor `RootPairing.isLeftRegular_one_sub_single_neg_root`, after the comparison of the integral root datum with the Lie algebra's root system. The comparison with rational G-modules stays with ReductiveGroups.
- **S3.4:** add the same citation for its characteristic-0 sentence.

**Tested:** For SL₂ (sl₂ over ℂ) and λ=ω, the native formula gives char L(ω)·(1−e^(−α))=e^ω−e^(−3ω). That is S4.4's second Check for char B(ω).

## R05 (P3) — S4.1's Checks test only native carriers, and fifteen Check bullets name Lean declarations

**Location:** S4.1 “Checks for rational paths” and “Checks for crystals” (`README.md:1050–1075`), for example “(`TauCeti.PLPath.ofSegments_eq_one_iff`)” and “as `TauCeti.NormalCrystal.e_ne_some_self` says”. Native names also appear in Checks at lines 934, 937, 1092, 1093, 1111, 1112 and 1187.

**Claim:** S4.1 owns two constructions:

- the subtype of integral-endpoint rational paths with its ambient operators;
- the dictionary that turns an operator-closed set of paths with integral heights into a `TauCeti.NormalCrystal`.

All six of its Checks test `TauCeti.PLPath` or `TauCeti.NormalCrystal` themselves, and each cites the native lemma that proves it. None tests the dictionary or its integrality hypothesis. A Check is prose and never names a Lean counterpart.

**Witness:** The SL₂ path −ω/2 then 3ω/2 has endpoint ω and minimal height −1/2. The native string criteria (README line 1082) give ε=0, φ=1; the dictionary's formulas give 1/2 and 3/2. No Check records this.

**Repair:**

1. Replace S4.1's six Checks with Checks on the dictionary. Two are tested here:
   - For SL₂, the realized set {t↦tω, t↦−tω} is closed under the operators, with minimal heights 0 and −1. The dictionary gives a two-element crystal of weights ±ω with (ε,φ)=(0,1) and (1,0).
   - For the path above, the true string lengths are 0 and 1, not 1/2 and 3/2. So the integrality hypothesis cannot be dropped.
   - Add a third Check on strict morphisms.
2. In the other eight bullets, delete the backticked names and keep the prose.

**Tested:** Lowering the path above gives segments −3ω/2 then ω/2, with endpoint −ω and minimal height −3/2. There ε=1 and φ=0, so φ−ε=−1=⟨−ω,α∨⟩. The set is closed under the operators, but ε=−min H fails on both elements.

## R06 (P3) — The type-A worked example has a run-together label and restates the native Plücker coordinates

**Location:** `README.md:1795`: “TypeA: the six minors of an actual two-frame in k⁴, their signs/change of frame, the Gr(2,4) Plücker quadric, coordinate-chart inverse”.

**Claim:**

- “TypeA” is the one run-together word left from the previous review's spacing finding.
- The maximal minors of a frame, their scaling by the determinant under change of frame, their non-vanishing exactly for independent frames, and the injectivity of the Plücker point are native. The Plücker quadric relation is not native, and nor are the charts and Schubert ideals, so those stay.

**Witness:**

- `TauCeti/LinearAlgebra/ExteriorPower/Plucker.lean:104` (`TauCeti.plucker`), `:163` (`TauCeti.plucker_sum_smul`) and `:250` (`TauCeti.plucker_ne_zero_iff`).
- `TauCeti/LinearAlgebra/Projectivization/Plucker.lean:56` (`TauCeti.mk_plucker_eq_mk_plucker_iff`).

**Repair:** Make the label a bold bullet title, “**Type A.**”, as at line 1796. Replace “the six minors of an actual two-frame in k⁴, their signs/change of frame” with “the Plücker coordinates of a two-frame in k⁴, which are native (`TauCeti.plucker`, with the change-of-frame law `TauCeti.plucker_sum_smul` and injectivity `TauCeti.mk_plucker_eq_mk_plucker_iff`)”. Add these names to the From Tau Ceti contract.

**Tested:** Take rows (1,0,2,0) and (0,1,0,3).

- The minors are p₁₂=1, p₁₃=0, p₁₄=3, p₂₃=−2, p₂₄=0, p₃₄=6. They satisfy p₁₂p₃₄−p₁₃p₂₄+p₁₄p₂₃=6−0−6=0.
- Changing the frame by [[1,1],[0,2]] (determinant 2) gives p₁₂=2 and p₃₄=12. Both are doubled, as `TauCeti.plucker_sum_smul` states.

## Previous findings

- **R01 (previous) — repaired.**
  - `lake-manifest.json` pins Tau Ceti `2fd255d997f4`.
  - `Suggested.lean` states `exists_toPLPath_eq_of_lower_eq_some`, `exists_toPLPath_eq_of_raise_eq_some`, `reflTransGen_lower_toPLPath_straight` and `weylDenominator_mul_finsum_single_eq_dotAlternatization`.
  - The S1 clause now reads “The Grassmannian scheme `Module.Grassmannian.scheme` … is native … the relative parabolic, flag and isotropic schemes are not” (lines 23–26).
  - `lake env lean` gives four `sorry` warnings and nothing else.
- **R02 (previous) — repaired.** From Tau Ceti (lines 112–148) now names `Module.Grassmannian.scheme`, `schemeHomEquiv`, `isProper_toSpec`, the pivot files, `isotropicLocus`, `isotropicLocus_map`, `isotropicLocus_le_ker_iff` and `IsAlt.exists_basis_toMatrix_eq_J_inl_eq`. S1.1 (line 576), S1.3 (line 618) and S1.5 (line 650) consume them. The retest from the previous review still holds: pivots (1,3) give one free entry and λ=(2,1).
- **R03 (previous) — repaired.**
  - S5.6 cites Ramanathan1987 proof of Theorem 3.11 (lines 960–974), Theorem 4.2 (1042–1045), LRPT2006 Lemma 1.2, Proposition 2.1 and Theorem 2.2, and BrionFlags §1.3 and Proposition 1.3.2.
  - S6.2 cites CFL §1.1 and LLM Theorems 4 and 6.
  - S9.8 is stated as a deduction from SGA1 XII Proposition 1.3.1 and S3.1.
  - S3.1 cites Proposition 1.4.3 through the Chevalley involution, with the GL₂ computation.
  - All of these were read at their lines (table below).
- **R04 (previous) — repaired.** `grep -nE '\bTPC\b|\bAVB\b|GG.s|\bTopK\b|HR R2a|\bRG\b'` returns nothing. Scope (lines 60–64) adds the TensorProductCombinatorics §6.3 and Layer 6 and AlgebraicVectorBundles §3 deferrals.
- **R05 (previous) — partly repaired.** The 37 run-together lines are fixed except “TypeA” at line 1795 (R06). The process sentence about unread diagram labels is gone. The incidence-flag heading is now a bold bullet (line 1840).

## Verified sound

**Gate, build and dependencies.**

- The worker's gate and my own run on 368c92d both report every check at 0 and `OK`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchubertGeometry'` is empty.
- `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean` gives only the four `sorry` warnings (lines 65, 76, 88, 104).
- Dependency check: `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Lean form.**

- The file has one module docstring that names every headline that is not statable, with its missing carrier. It imports `Mathlib` and five existing `TauCeti.*` modules.
- It has no `set_option`, no sorry'd data, no `lemma`, and no declaration outside the namespace.
- I ran `#check @name` on all four declarations. Each elaborated type equals `scratch/signatures.md`, keeps every binder its statement uses, and matches the README's generality: any additive realization with coroot-compatible height forms for S4.2–S4.3, an injective one for S4.4.
- One-tactic probe: `simp`, `rfl` and `exact?` each fail on all four declarations. None is padding.
- The four fully qualified names occur in no other roadmap (`roadmaps grep --lean-only`).

**Library declarations.** All 177 backticked library names in the README exist at the pins: 129 through `#check` in a scratch file, and 48 in modules without prebuilt object files, found by declaration grep in the pinned source. I opened these:

- `LSPath/Basic.lean:101` (the structure), `:234` (`straight`), `Highest.lean:73`, `RootOperator.lean:249` (`minHeight`), `Concatenation.lean:116,133` (the tie convention matches S4.4), `LinearMap.lean:71` and `Central/Shift.lean:240,253`;
- `Central/Transport.lean` (main results as cited);
- `Weyl/Denominator/Basic.lean:72` (Δ=∏(1−e^(−α))) and `Weyl/Denominator/Integral.lean:209` (J=Σ sgn(w)e^(−(ρ−wρ))w);
- `Chamber.lean:141` (`dominantChamber` = nonnegative simple-coroot pairings);
- `LagrangianBasis.lean:94,131`: the Gram matrix is `Matrix.J` with e in `Sum.inl`, so ω(e_i,f_j)=−δ_ij as the README says;
- `Isotropic.lean:81,124,140`;
- `Basis/Flag.lean:137,215,224,427`: `finrank_inf_flag` counts zero-based pivots i<j, the README's one-based p_i≤j;
- `Grassmannian/FiniteLocallyFree.lean` and `UniversalQuotient.lean`: these are Hopf-ideal and universal-quotient constructions, not a non-affine Grassmannian, so ModularCurves §0G is still the right owner.

**Cross-roadmap citations, on main db5e748.** These all resolve:

- ReductiveGroups Layers 7, 7b, 8 (Borel scheme), 9, §§9A and 9C, Layer 10, and §3A.5's closed-orbit part (lines 335–369);
- ModularCurves §0G (901), GroebnerGeometry G5 (394);
- SchemeAndStackFoundations Layers 1, 2 and 5 with §§2.2, 2.6, 4.12 and 5.7;
- StableReduction Layer 2 (relative `Proj`, 405; contract line 323) and Layer 4 (529);
- AlgebraicVectorBundles L2A and Successor roadmaps §3 (429);
- TopologicalKTheory T1.5, LieGroups Layer 8 (1078), ComplexKahlerGeometry K3–K4, RealAnalyticGeometry R3.2, AlgebraicTopology Stage 5, MorseTheory M2, HamiltonianReduction R2a;
- KacMoody §§5.4, 6.4, 7.2 and 7.3 (920, 1016, 1072, 1092), QuantumEnvelopingAlgebras §8.2 (1173), CharacteristicClasses C5a, FlagVarieties §6.1 (263), TensorProductCombinatorics §6.3 (1777), Layer 6 (1707) and §8.3 (2277).

Each consumer cites SchubertGeometry (4–16 mentions). At open heads: GeometricQuantization §§3.3–3.4 (#1186, lines 694 and 759) and IndexTheory I8 (#1077, line 1575). SpringerResolutionAndCharacteristicCycles (#1828, line 12) consumes S1 and S2.3 without restating them. The five unresolved-citation leads are manifest source ids.

**Seeded sample.** Each locator was read at the text.

| Target | Locator read | Result |
|---|---|---|
| S1.0 | ConradReductive Thm 2.3.6 (line 2993, p. 72), Thm 5.1.13 (6011, p. 143), Cor. 5.2.8 (6512, pp. 155–156), Cor. 5.2.9 (6551, p. 156): smooth proper Par with S-ample det(Lie P)*; G/P = étale-local conjugates | correct; projective over affine S follows from proper plus ample |
| S1.1 | BrionFlags §1.2 p. 7 (256–258, 266–272), Ex. 1.2.3(5) pp. 9–10 (345–354) | correct, including the d_j=dim(V_j/V_(j−1)) conversion |
| S1.3 | BrionFlags §1.1 pp. 4–5 (184: dimension Σ(i_j−j)) | correct; the source's Prop. 1.1.3 has a misprint the README avoids (Source issues) |
| S1.5 | no source; deductions from native declarations and matrix identities | sound; identities recomputed (table below) |
| S2.2 | LLM §1.4 pp. 300–301 (294–305): Z_i=(P_i1×⋯×P_ir)/B^r, twisted action, dimension r | correct |
| S3.3 | KnutsonDemazure p. 3 (85–98): d_αp=(p−αr_αp)/(1−α); “negates” refers to p−r_αp | correct; the README's s_i(N)=−e^(−α)N is right for its numerator |
| S3.5 | Ramanathan1987 Thm 3.11(i) (950, p. 86), Remark 2.4 (490, p. 73), Thm 3.5(ii) (803, p. 82), §3.1 simply connected (750) | correct |
| S3.6 | KnutsonDemazure §4.0.2 (142, p. 4) | motivates only, as stated; the values were recomputed |
| S4.7 | LLM Prop. 14 (809, p. 312), §4.1 (946, p. 315) | correct; the README's “at most w” fixes the source's misprint (Source issues) |
| S5.1 | Ramanathan1987 Def. 1.1 (193, p. 65), §1.16 (360, p. 70), Lemmas 1.18–1.19 (392–406, p. 71) | correct |
| S5.2 | Def. 1.1(b–c), Prop. 1.4 (231, p. 66), Thm 3.5(i) (801, p. 82) | correct |
| S6.2 | CFL §1.1 p. 1 (22–32), LLM Thm 4 (263, p. 299), Thm 6 (338, p. 301), lines 333–335 | correct |
| S8.2 | Steinberg1975 uncertified; MerkurjevEquivariant Cor. 6.8 (676, p. 16) | R03 |
| S8.3 | MerkurjevEquivariant Cor. 1.12 (200, p. 5), Prop. 6.5 (644, pp. 15–16): θ is an isomorphism for G′ simply connected | correct, at the stated hypothesis |
| S9.0 | SGA1 XII Thm 1.1 (9399, p. 239), Prop. 1.3.1 (9479, p. 241), Thm 4.2 (9738, p. 248), Cor. 4.3 and Thm 4.4 (9801–9805, p. 249); SerreGAGA §12 Thms 1–3 (735, 741, 746, pp. 19–20) | correct |
| S5.6 (new) | LRPT2006 Lemma 1.2 (115–118, p. 3), Prop. 2.1 (165–178, pp. 4–5), Thm 2.2 (190–204, p. 5) | correct, for simply connected semisimple G over an algebraically closed field of characteristic p |
| S4.2–S4.4 | Littelmann1995 Prop. 4.7 (502, pp. 511–512), Cors. 2–3 (520–526, p. 512), Thm 9.1 (815, p. 520), Introduction (87–94, p. 500) | correct; R01 |
| Worked | KnutsonBorelWeil pp. 4–5 (292–338): the 8-versus-9 calculation | correct |

**Adversarial table.** All values were computed this round.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Lean thm 1 (lower) | SL₂, shape 2, straight path; realization ℤω→ℚ², m↦(m,0) | H=2t, last min at 0, rises by 1 at 1/2, giving (s₁,1;0,1/2,1), endpoint 0; again min −1 at 1/2, giving (s₁;0,1), endpoint −2 | pass |
| Lean thm 2 (raise) | SL₂, shape 2, (s₁;0,1) | first min −2 at t=1, back to −1 at 1/2, giving (s₁,1;0,1/2,1) | pass |
| Lean thm 3 | SL₂, shape 2; λ=0; empty root system | 0, 1, 2 lowerings; B(0) and the empty case are singletons, so the relation is reflexive | pass |
| Lean thm 4 | PGL₂ λ=α; SL₂ λ=ω; λ=0; empty root system | e^α−e^(−2α) on both sides; e^ω−e^(−3ω); Δ·1=J(1)=Δ; 1·e^λ=e^λ | pass |
| Decomposition formula | SL₂ ω⊗ω, ω⊗2ω; PGL₂ α⊗α | see R01: 4 = 3+1; 6 = 4+2; 9 = 5+3+1 terms | statable, absent: R01 |
| S1.0 | GL₃/𝔽₂; ℙ² over 𝔽₂; GL₂ canonical line | 168/8=21=1+2+2+4+4+8; 7; det(Lie B)*=ω⁻¹=O(2) | pass |
| S1.1 | ℙ²×ℙ̌²; k[ε], e₁+εe₃ in span(e₁,e₂) | dimensions 4 and 3; value εē₃≠0 | pass |
| S1.3 | Gr(2,4): (1,2), (1,3), (3,4); E₁₂ at j=1 | Σ(p_i−i)=0, 1, 4; \|λ\|=4, 3, 0; dim(E₁₂∩⟨e₁⟩)=1 against Brion's count 0 | pass; source misprint |
| S1.5 | r=s=1, Y=(1,2), Y′=(3,4), Z=5, Z′=6; m=1; m=2 | YᵀJ₀Y′=4−6=−2, giving 9 (flipped sign 13); Q_src=−J; dimensions 0, 3, 3 | pass |
| S2.2–S2.3 | empty word, i, ii | dimensions 0, 1, 2; fixed sections 1, 2, 4; δ(ii)=s_i, image dimension 1 | pass |
| S3.1 | GL₂ λ=(1,0) on G/B− | f(gb)=(b⁻¹g⁻¹)₁ⱼ=b₁₁⁻¹f(g): 2 sections, degree +1; Brion line 593 read literally gives 0 sections | pass |
| S3.3 | m=0, −1, −2 for D_i; m≤0, 1, ≥2 for Δ_i | e^λ, 0, −e^(λ+α) (augmentations 1, 0, −1 = h⁰−h¹); Δ_i strings recomputed from (1−x^(−k))/(1−x) | pass |
| S3.5 | weight of ev_e; SL₂ Frobenius twist | (t·ev_e)(f)=f(t)=λ(t)⁻¹f(e), weight −λ; differential of [x^p:y^p] is 0 | pass |
| S3.6 | script on (0,5,7) | word 121: 1, 6, 33, 81; word 212: 1, 3, 21, 81; ψ₃=χ₃; Δ₁ and Δ₂ fix χ₃; 46 weights (21/15/10); formula exact on all weights; (4,4,4)→3, (9,3,0)→0; 81 Gelfand–Tsetlin patterns agree; D₁D₂D₁e^(7,5,0)=χ₃ | pass |
| S4.1 dictionary | SL₂ path −ω/2 then 3ω/2 | ε=0 and φ=1 against −min H=1/2 and H(1)−min H=3/2 | R05 |
| S4.3 | SL₂ bond 2; break 1/3 | 2·(1/2)=1, 2·(1/3)=2/3; with 1/3 and 2/3 allowed, 5 elements instead of 3 | pass |
| S4.4 adjoint | SL₃ θ=ρ | covers s₁s₂→s₂ and s₂s₁→s₁ have bond 2; the other covers have bond 1; 6+2=8 encodings, 2 of weight 0 | pass |
| S4.7 | GL₃ λ=e₁, w=s₂ | κ=−e₃, θ(s₂)=s₁∈W_κ, representative e: one section, weight −w₀(−e₃)=e₁ | pass |
| S5.1–S5.2 | characteristic 2, k[x], s=x | Tr(1)=0, Tr(x)=1, Tr(x³)=x; σ(x²)=x∉(x²); σ(x·x^b)∈(x) for odd b≥1 | pass |
| S5.5 | Y={0,∞}⊂ℙ¹, λ=0 | H⁰(O_Y)=k², diagonal k→k², H¹(I_Y)=H¹(O(−2))=k | pass |
| S6.2 | Gr(2,4) in degree 2 | 20 comparable pairs τ≤σ = 21−1; the one nonstandard monomial is p₁₄p₂₃ | pass |
| S7.1 | GL₃ ω₁, w=s₁s₂ and s₂s₁; λ=ρ | 0 and 1; 1 and 1 (ε₃>ε₁ is not a cover; ε₃>ε₂ has bond 1); 1 and 2 | pass |
| S7.2 | X₍₁₎⊂Gr(2,4) | p₃₄=0, p₁₃p₂₄=p₁₄p₂₃; p₂₄=0 gives the planes p₂₃=0 and p₁₄=0, pivots (1,4) and (2,3), λ=(2) and (1,1) | pass |
| S8.2 | SL₂ | ℤ[z]/(z−1)², rank 2, z↦t⁻¹ | correct; R03 |
| S8.3 | SL₂, z | 1⊗z restricts to z and z⁻¹; z⊗1 restricts to z and z; R(T) has rank 2 over R(G), equal to the number of fixed points | pass |
| S9.0 | ℙ¹ over ℂ[t], class t; dual numbers | RΓ=[A→A] with differential t; H⁰=0 over A but ℂ at t=0; ε≠0 kept | pass |
| S9.0 / S9.1 supplier | §3A.5 on main against #1332 | main consumes C−1.1 (lines 339–343); #1332 constructs the topology (line 942) | R02 |
| S9.5 | GL₂ (t,0); shift by (1,1) | lowers to (0,t); endpoint (2,1), height t | pass |
| S9.6 | SU₂, SU₃ | ℝP²: H⁰=ℤ, H¹=0, H²=ℤ/2; χ=6/6=1 | pass |
| Worked: fixed plane | (n,k₀)=(4,2), (3,2) | d∈{0,1,2} and d∈{1,2}: min(k₀,n−k₀)+1 = 3 and 2 | pass |
| Worked: incidence flag | V⊗Λ²V | 9=8+1; (2,1,0); dual (0,−1,−2); trace of u↦v⊗(u∧ω) is v∧ω | pass |
| Worked: word 121 | Rees charts | [u:v]=[−y:x] solves ux+vy=0; v=ur, u=vs, rs=1 | pass |
| Worked: type A | frame (1,0,2,0),(0,1,0,3) | minors 1, 0, 3, −2, 0, 6; Plücker relation 0; ×2 under det 2 | R06 |

**Ownership.**

- ShimuraData, AlgebraicModuliForArithmeticGeometry and ComplexComparisonPartII: the previous review's result stands. This roadmap is on main and is the earlier owner.
- ReductiveGroups revisions #1332 and #1676 own the classical point topology that S9 now consumes (R02). There is no second owner, because S9 defers to them.
- No open pull request changes this folder or drops an id it cites (`scratch/overlaps.md`).
- KacMoody (main) cites Littelmann's LR rule only as a reference. Its Layer 6 consumes S4 as the finite case, so R01's formula belongs here.

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only. I read no text of them, so S8.2's freeness locator (Theorem 2.2, p. 173) is unchecked.
- I did not elaborate the 48 library names in modules that have no prebuilt object file. I confirmed them by declaration grep in the pinned source.
- Ownership was checked against the open pull requests named above and the worker's overlap list, not against all 461.

## Source issues

- **Misprint** in BrionFlags at Proposition 1.1.3(i)–(ii), p. 5: the source counts the indices k with i_k strictly less than j; it should count those with i_k at most j, since E₁₂ meets ⟨e₁⟩ in dimension 1; affects a stated result.
- **Misprint** in BrionFlags at §1.4, p. 15 (line 593): the source lets B act on G×ℂ through λ(b), which leaves dominant λ without sections; it should act through λ(b)⁻¹, as Proposition 1.4.3's degree λ_i−λ_j requires; affects a stated result.
- **Misprint** in LLM at Proposition 14, p. 312 (line 809, author copy): the source requires the initial direction strictly below w; it should allow equality, as its line 612 does, since only the straight chain indexes V_λ(e); affects a stated result.
- **Error** in KnutsonBottSamelson at §6.1, Proposition, p. 5: the source says some Weyl element negates S and fixes the other simple roots; in A₂ with S={α₁} none fixes α₂, so it should say the longest element of W_S makes S's positive roots negative; affects a stated result.
- **Gap** in MerkurjevEquivariant at Theorem 6.6, p. 16 (author draft, line 671): the draft derives the spectral sequence from Theorem 5.7 with a marginal note asking for a proof; it should give the argument that Corollary 6.8 rests on; affects the proof.
