# Review of ArithmeticKTheory (pull request #1418 at e79082a)

**Verdict:** needs changes

This is a full review: 151 lines of the folder changed since 1f52567. All five findings of the previous review are repaired (table under Verified sound). There are two new findings, both P3:

- R01: the Solomon–Tits docstring and README §3.2 overstate what the stated theorem says at m=2.
- R02: §2.4 limits even-degree injectivity to n≥4 for a reason that §2.4 itself contradicts.

The gate passes and the dependency check is clean. The fifteen seeded targets were checked against their sources, and so were the new Thomason and SchemeKTheoryOperations §4.3 citations.

## R01 (P3) — At m=2, `solomonTits` does not give nonemptiness, though its docstring and README §3.2 say it does

**Location.**
- `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` lines 94–95: “Equivalently, the reduced integral homology of the building is concentrated in degree `m − 2`: the building is nonempty, connected when `m ≥ 3`”.
- `README.md` lines 1060–1062: “Thus its reduced integral homology vanishes outside degree m−2; in particular the building is nonempty”.

**Claim.** The theorem is equivalent to the reduced homology being concentrated in degree m−2. In particular, it gives nonemptiness.

**Witness.** At m=2 the hypothesis k≠m−2=0 leaves only k≥1. The empty simplicial set has H_k(∅)=0=H_k(pt) for every k≥1, so it satisfies the conclusion. Its reduced homology, however, is ℤ in degree −1.

**Repair.**
- In `Suggested.lean`, replace “Equivalently, the reduced integral homology of the building is concentrated in degree `m − 2`: the building is nonempty, connected when `m ≥ 3`, and has no homology in positive degrees other than `m − 2`” with: “For `m ≥ 3` the case `k = 0` makes the building nonempty and connected, so its reduced integral homology is concentrated in degree `m − 2`; for `m = 2` the statement says only that the building, a discrete set, has no homology in positive degrees.”
- In README lines 1060–1062, replace “Thus its reduced integral homology vanishes outside degree m−2; in particular the building is nonempty, and connected for m≥3.” with: “For m≥3 the degree-zero case makes the building nonempty and connected, so its reduced integral homology vanishes outside degree m−2. At m=2 the building is the nonempty discrete set of lines, and the statement concerns positive degrees only.”

**Tested.**
- At m=3 over 𝔽₂, the case k=0 holds for the connected incidence graph (ℤ≅ℤ). It fails for ∅ (0→ℤ) and for the antichain of seven lines (ℤ⁷→ℤ), so the new m≥3 sentence is right.
- At m=2, both the three-point building over 𝔽₂ and ∅ satisfy the statement, as the new m=2 sentence says.

## R02 (P3) — §2.4 restricts Dedekind even-degree injectivity to n≥4, for a reason that §2.4 itself contradicts

**Location.** `README.md` lines 951–956: “For any Dedekind domain R with finite residue fields and even n≥4, prove that K_n(R)→K_n(K) is injective … include n=2 using the supplied tame-kernel theorem, not the vanishing argument in a degree where it has not been established”.

**Claim.** The finite-field vanishing argument is not available at n=2.

**Witness.**
- Lines 956–958 of the same paragraph use K₂(k(v))=0 to prove surjectivity at n=3.
- kbook lines 24572–24579 (p. 409) derive 0→K₂(R)→K₂(F), for every Dedekind R with finite residue fields, from K₂(R/p)=0.

**Repair.**
- At line 951, write “even n≥2”.
- Replace “Specialize to number-field S-integers and include n=2 using the supplied tame-kernel theorem, not the vanishing argument in a degree where it has not been established by that argument.” with: “For number-field S-integers the case n=2 is the injectivity in K2SymbolsBrauer §§12.1–12.3's tame-kernel sequence.”
- Make the locator “(K-book, V.6.6 and the finite-residue-field sequence after it, p. 409; V.6.8, pp. 412–413.)”.
- In the *Needs:* line 963, change “for degree two” to “for the degree-two comparison”.

**Tested.**
- At R=ℤ and n=2, K₂(𝔽_p)=0 for every p gives K₂(ℤ)=ℤ/2↪K₂(ℚ) (kbook III.6.5.1, line 13575, p. 236).
- The coordinate ring of a smooth affine curve over 𝔽_q is a Dedekind domain with finite residue fields that the number-field clause does not cover. The same vanishing gives its n=2 injectivity, which the repaired statement now includes.

## Verified sound

### The previous review's findings

| Finding | Status at e79082a | Evidence |
| --- | --- | --- |
| R01, Solomon–Tits statable | Repaired | `Suggested.lean` 82–106 defines `titsBuilding` (the nerve of `{W : Submodule K V // W ≠ ⊥ ∧ W ≠ ⊤}`) and states `solomonTits`: for m≥2, the map to the point is an isomorphism on homology in each degree k≠m−2. This is not the form proposed last round, but it is true, and for m≥3 it is the full reduced statement. Freeness in degree m−2 follows anyway, since top-degree cycles of a free complex form a free group. Docstring lines 28–34 now keep only the three Aut(P)-module theorems as unstatable. README lines 184–189, 1056–1069, 1251, 1263 and 1321 are updated. The m=2 wording is R01 above. |
| R02, §6.15 re-plans the descent spectral sequence | Repaired | Lines 3466–3473 identify the sequence with SchemeKTheoryOperations §4.3 and prove only the cohomological-dimension bound here (Thomason Cor. 1.48). The contract is at lines 358–363 and the *Needs:* at lines 3510–3514. SchemeKTheoryOperations §4.3 exists at #1229 (its README line 1387 states the Godement sequence, citing Thomason Prop. 1.36). The index change p=−s, q=t turns E₂^{p,q}⇒π_{q−p} into H^{−s}⇒K^β_{s+t}. |
| R03, Layer 1 locators | Repaired | Lines 629–630 are changed. Lines 704–707 now cite Ex. III.1.3.6, p. 183 (kbook lines 10189–10197: rank s−1, with s the number of places at infinity) and note the misprint in VI.8.1. Lines 4423–4424 are changed. |
| R04, `Odd p` | Repaired | `hodd` is gone (line 115). README lines 3738 and 3760–3762 are changed, and the new Check at lines 3784–3787 gives B₂/1=1/6, B₄/2=−1/60, B₆/3=1/126 and B₈/4=−1/120, all with odd numerators. |
| R05, r→r₁ | Repaired | Lines 2509, 2530–2532, 2535 and 2539. |

### Gate, dependency check and Lean

- **Gate:** rerun on this head; every check is zero (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`).
- **Dependency check prescribed by the brief:** `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`.
- **Merge order:** ArithmeticKTheory is at position 136. Its open suppliers all come earlier: StableHomotopyKTheory 16, GeneralAlgebraicKTheory 17, IntegralIwasawaTheory 28, CyclotomicClassGroupsAndStickelberger 33, SchemeKTheoryOperations 36, AdelicAlgebraicGroups 52, GeometryOfNumbersAndQuadraticArithmetic 55, ArithmeticLocallySymmetricSpaces 59, ArithmeticGaloisDuality 61, HermitianKTheoryOfPoincareCategories 63, SelmerIwasawaCohomology 85, KTheoryLowDegrees 88, K2SymbolsBrauer 89, KTheoryFiniteLocalFields 90 and AutomorphicLFunctionsAndLocalFactors 94. The consumers come later: K3BlochGroups 138 and EllipticKTheory 380.
- **Pins and folder:** the pins are unchanged since the last review (`lake-manifest.json` is not in the diff), and the diff outside the folder is empty. No never-cite roadmap appears in the folder.
- **Elaboration:** `lake env lean Suggested.lean` gives exactly four `declaration uses 'sorry'` warnings, at lines 67, 73, 98 and 115.
- **`#check @name`** on all six declarations keeps every binder and matches `signatures.md`. That file's `-number` entry is a tool artifact from the word “class-number” in the module docstring.
- **One-tactic probe:** `first | rfl | infer_instance | decide | norm_num | simp | aesop | simp_all` closes none of the four theorems, so there is no padding.

### Headline theorems

- **Stated:**
  - `integer_isLocalization_iff` and `integer_isLocalization_of_torsion_classGroup` (§1.1);
  - `solomonTits` (§3.2);
  - `regularPrime_dividedBernoulli_num` (§7.2).
- **Named in the docstring as not statable, correctly:**
  - finite generation and ranks, Soulé, the Harris–Segal summand, and the odd and even tables;
  - wild kernels, Bott descent, K₄(ℤ)=0 and H₃(K(ℤ));
  - the order ratio, the even orders, the Vandiver table and the tame kernels;
  - hermitian finiteness, the arithmetic CW model and Borel's comparison;
  - π₄(S)⊗ℤ[1/2] and the Adams–Novikov E₂-term.
- **Why they are not statable:** neither pin has Milnor K-theory, the Q-construction, the plus construction or a Steinberg group (grep of both pins). Lie algebra cohomology exists only in low degree (Mathlib `Algebra/Lie/Cochain.lean`; Tau Ceti `Algebra/Lie/Cohomology/LowDegree.lean` and `Continuous.lean`).
- **The three Aut(P)-module theorems of §3.2:** these are inputs, not end theorems. `CategoryTheory.nerveMap` (`Nerve.lean:55`) and `SSet.homologyMap_comp` would give the GL(V)-action. Packaging it as a `Rep ℤ` of Aut(P) needs functor-equality proofs inside data, so leaving them unstated is acceptable.
- **No duplication at the pins:** Mathlib's `padicValRat_bernoulli` (`NumberTheory/Bernoulli.lean:696`) and `not_dvd_num_bernoulli` (:709) cover only the branch where p−1 divides 2k. The headline needs the supplier's unrestricted Kummer congruences off that branch, so it restates nothing.

### Adversarial pass

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| `integer_isLocalization_iff` | R a field; ℤ with S={(2)} and M=⟨2⟩, ⟨6⟩; 0∈M | Field: Spec¹=∅ and S.integer=F≅R. M={1}: true=true. 0∈M: 0 is not a unit, so false=false. ⟨2⟩: ℤ[1/2] and 2∈(2), true=true. ⟨6⟩: 6 is not a unit of ℤ[1/2], false=false. | Pass |
| `…of_torsion_classGroup` | ℤ[√−5], S={𝔭}, 𝔭²=(2); S=Spec¹ | 2∈𝔭 has valuation 0 elsewhere, so it lies in the monoid and the iff applies. At S=Spec¹ the monoid is R∖0 and S.integer=K. | Pass |
| `solomonTits` | m=2 and 3 over 𝔽₂; ∅; antichain of lines | m=2: three points, H_k=0=H_k(pt) for k≥1; ∅ also passes (R01). m=3: 14 vertices and 21 edges, connected; k=0 gives ℤ≅ℤ, k≥2 gives 0≅0, and H₁ has rank 8=2³ (excluded degree). The seven-line antichain fails at k=0 (ℤ⁷→ℤ). | Pass; R01 |
| `regularPrime_dividedBernoulli_num` | p=2; (5,5); (7,6); p=37 | p=2: 1/6, −1/60, 1/126, −1/120, all odd numerators. (5,5): B₁₀/5=1/66. (7,6): −691/16380, and 7∤691. p=37: 37·208360028141 is the numerator of B₃₂, but 37 divides h(ℚ(ζ₃₇)), so the hypothesis fails. | Pass |
| §1.3 K₁ rank | ℤ[1/p] | r₁+r₂+\|S\|−1=1, the rank of ±pⁿ; the formula printed in VI.8.1 gives 0. | Pass |
| §2.4 (R02) | ℤ at n=2, 3, 4 | n=2: K₂(𝔽_p)=0, so ℤ/2↪K₂(ℚ). n=3: K₂(𝔽_p)=0, so the map is onto. n=4: K₄(𝔽_p)=0, so the map is injective. | R02 |
| §3.2 duality and curve | ℤ at m=2; 𝔽₂[t], P=R², k=1 | d=1·3−2=1; χ(diag(−1,1))=−1. Stabilizer order (q−1)²q^(k+1)=4, gap k/2. | Pass |
| §3.4 Borel range | SL₂/ℚ; Γ(3); ℚ(i), q=3; m=5, q=1 | 4q<1 gives q=0. [SL₂(ℤ):Γ(3)]=24 and χ=24·(−1/12)=−2, so Γ(3) is free of rank 3 and H¹=ℝ³. Degree 3 needs m≥14, against m≥26 for the [F:ℚ]-scaled range. At m=5, q=1, 4q=m−1 is excluded by 9.5(3). | Pass |
| §4.2 | ℓ=3, F=ℚ (r=2, a=1) at weights 1, 2, 6 | 1, 3, 9: the 3-parts of w₁=2, w₂=24, w₆=504. | Pass |
| §4.4 | i=2, 4, 6, 8, 10, 12 | 24, 240, 504, 480, 264 (the K-book prints 1320) and 65520 from 2^(2+v₂(i))∏ℓ^(1+v_ℓ(i)). | Pass |
| §5.1 / §5.3 | ℚ(i), i=2; q=2, i=1 | w₂(ℚ(i))=8·3=24, so ℤ⊕ℤ/24. K₁(𝔽₂)=0. | Pass |
| §5.4 | ℚ at n=3, 5, 7, 9; KO/2 | ℤ/48; ℤ⊕0; ℤ/240; ℤ⊕ℤ/2. KO_n/2 orders 2,2,4,2,2,1,1,1 by universal coefficients, with ℤ/4 in degree 2. | Pass |
| §6.3 | ℚ(√7); ℚ(√2); r₁=1 | Thm 9.11 rows match the table. ℚ(√7): ρ=1, K₄(O_F){2}=ℤ/2 and H²=0. ℚ(√2): ρ=0. r₁=1 forces j=ρ=0. | Pass |
| §6.4 | ℤ[1/2] (r₁,r₂,s,t,j)=(1,0,1,0,0) | Table log₂ orders for n=1,…,8: 2,2,2,1,1,0,1,1. Direct K_n/2⊕K_(n−1)[2]: (ℤ/2)², ℤ/2⊕ℤ/2, ℤ/2⊕ℤ/2, 0⊕ℤ/2, ℤ/2⊕0, 0, ℤ/2⊕0, 0⊕ℤ/2. | Pass |
| §6.5 | ℚ at i=2, 4 | 2·2/48=1/12=2/24; 2·1/240=1/120=2/240. | Pass |
| §6.6 | Caputo's sextic; ℤ/4, T=2A; the 2ⁿyₙ=x group | T{3}=ℤ/3 and T∩3K₂(F)≅ℤ/3≠0=div. In ℤ/4, T∩2A=T≠0=div. In the last group, div=⟨x⟩≅ℤ/2 is not divisible. \|Δ_F\|=3·549⁴ and the Minkowski bound is about 1.66·10⁴. | Pass |
| §6.12 | ℚ; ℚ(√−14), i=1 | ℚ is not special, quotient 0. For ℚ(√−14), {−1,−1}∈WK∖div, quotient ℤ/2 (Theorem A). | Pass |
| §6.15 | j=0, −1, 1; index change | Slots (0,0)/(2,1); (2,0)/(0,−1) with total −2; (2,2). p=−s, q=t gives H^{−s}(ℤ/q(t/2))⇒K^β_{s+t}. | Pass |
| §8.2 | p=2, 3 | K₂(ℤ[1/3])=ℤ/2⊕ℤ/2; K₄(ℤ[1/2])=ℤ/3; K₁(ℤ[1/p])=ℤ/2⊕ℤ, using the zero map K₀(𝔽_p)→K₀(ℤ). | Pass |
| §8.8 | the eleven primes; v=(2); v=(−1+2ε) | Norms 4,5,9,11,11,19,19,29,29,31,31. At (2), the vectors (1,−3), (0,3), (1,3), (−1,3) have minors 6 and −3, gcd 3=q−1; ε⁶−1=2·(2ε³) is excluded. At (−1+2ε), ε↦3 and the residues 4, 3, 2 generate 𝔽₅×. | Pass |
| §8.7 / §8.9 | d=2√5/π | 16d²=320/π²≈32.42<33; (20d)^(2/3)≈9.33; d³≈2.885. g↦(−1,−1), h↦(1,−1); w₂(ℚ(√5))=8·3·5=120 and 4/120=1/30. | Pass |

### Sources opened (seeded sample and new locators)

| Target | Locator, cache line | Result |
| --- | --- | --- |
| 1.3 | kbook Ex. III.1.3.6 lines 10189–10197, p. 183; VI.8.1 line 31281, p. 513 | ✓ |
| 2.1 | kbook V.4.3–4.4 lines 24007–24018, p. 401; V.6.1–6.1.2 lines 24317–24363, p. 406; (V.6.6) and the finite-residue case, lines 24560–24579, p. 409; IV.2.4–2.5 lines 16293–16320, p. 280; V.6.8–6.8.1 lines 24726–24795, pp. 412–413; V.6.9.2 lines 24897–24922, pp. 414–415; VI.1.1–1.7 lines 28040–28316, pp. 463–468 | ✓ |
| 3.2 | putman-studenmund §1 lines 100–108, p. 3; kahn §3.2 lines 620–638, pp. 14–15; kahn §4.3.1 lines 712–718, which cites [12, Th. 2 p. 180], and Thm 4.3.3 lines 722–730, p. 17 | ✓ |
| 3.4 | borel1974 3.3 line 325, p. 243; Prop. 3.6 line 422, p. 245; Thm 7.4 line 837, p. 256; Thm 7.5 line 934, p. 259; 9.1 line 1006, p. 261; 9.5(3) lines 1061–1070, p. 262. borel1977 §5.2 lines 440–461, pp. 626–627. kbook IV.1.17–1.18 lines 15726–15779, p. 271; Ex. 1.18.2 line 15795, p. 272 | ✓ |
| 4.2 | kbook Prop. VI.2.2 and proof, lines 28465–28485, pp. 470–471 | ✓ |
| 4.4 | kbook Ex. VI.2.1.2 lines 28417–28431, p. 470; Lemma VI.2.4 line 28557, p. 472 | ✓ |
| 5.1 | kbook V.6.8, 6.8.1 with proof, and 6.8.2, lines 24726–24807, pp. 412–413 | ✓ |
| 5.3 | kbook Thm VI.8.2 line 31296, p. 513; Thm VI.8.4 line 31382, p. 514; Thm VI.9.5 lines 31706–31717, p. 519 | ✓ |
| 6.3 | kbook ℚ(√2) paragraph lines 31945–31956 and Cor. VI.9.10 line 31958, p. 523; Ex. 9.10.1 lines 31986–32012, p. 524; Thm 9.11 lines 32029–32082, pp. 524–525 | ✓ |
| 6.5 | kbook Thm VI.9.12 and proof, lines 32095–32115, p. 525 | ✓ |
| 6.6 | kbook V.6.8.2 lines 24796–24807, p. 413. caputo Prop. 2 line 203, p. 4; Thm 1 line 588, p. 12; Prop. 4 line 823, p. 16; Ex. 2 lines 847–860 and Rem. 11(ii) line 864, p. 17. wildkernel Cor. 4.6 and proof, lines 402–406, p. 13. banaszak (56)–(60) lines 768–781, p. 17; Rem. 6.1 line 1409 and Thm 6.4 line 1450, p. 31 | ✓ (two K-book errors recorded below) |
| 6.12 | wildkernel Thm A line 26, p. 1; Thm B line 100, p. 3; Thm 5.5 line 449, p. 14; Lemmas 7.2 (line 556) and 7.4, p. 18; Props 7.6 and 7.8, lines 584–592, p. 19; Prop. 8.1 line 602 through Thm 8.7 line 655, pp. 20–21. hutchinson Lemma 5.2, Cor. 5.3 and Rem. 5.4, lines 800–810, p. 18 | ✓ |
| 6.15 | thomason Prop. 1.36 lines 664–673, p. 452; Cor. 1.48 and proof, lines 871–898, pp. 457–458; Thm 2.45 lines 2551–2571, pp. 500–501; Cor. 2.46 line 2572, p. 501 | ✓ |
| 8.2 | kbook III.6.5.1 line 13575, p. 236; VI.2.1.2 and the Lee–Szczarba paragraph, lines 28417–28431, p. 470; Rem. VI.10.1.3 line 32284, p. 528; VI.8.1 lines 31271–31293, p. 513 | ✓ |
| 8.8 | groenewegen (journal) Lemma 7 and triangle, lines 265–290, pp. 1448–1449; the README's pp. 6–7 refer to the waived preprint, whose numbering agrees | ✓ |

### Library declarations opened at the pins

- **Mathlib:**
  - `CategoryTheory.nerve` (`AlgebraicTopology/SimplicialSet/Nerve.lean:37`) and `nerveMap` (:55);
  - `SSet.chainComplexFunctor` (`AlgebraicTopology/SimplicialSet/Homology/Basic.lean:44`), whose chains are the unnormalized complex on all simplices, with `SSet.homology` (:124) and `SSet.homologyMap` (:129);
  - `padicValRat_bernoulli` (`NumberTheory/Bernoulli.lean:696`), `not_dvd_num_bernoulli` (:709), `Bernoulli.vonStaudt_clausen` (:669) and `bernoulli_eq_bernoulli'_of_ne_one` (:217);
  - `riemannZeta_neg_nat_eq_bernoulli` (`NumberTheory/LSeries/HurwitzZetaValues.lean:251`);
  - `Set.unitEquivUnitsInteger` (`RingTheory/DedekindDomain/SInteger.lean:124`) and `IsLocalization.isLocalization_of_submonoid_le` (`RingTheory/Localization/LocalizationLocalization.lean:193`);
  - `NumberField.Units.finrank_eq` (`NumberTheory/NumberField/Units/DirichletTheorem.lean:462`) and `NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces` (`NumberTheory/NumberField/InfinitePlace/Basic.lean:447`).
- **Tau Ceti:** all 35 names in the contract were found by grep, among them:
  - `finrank_sUnits` (`RingTheory/DedekindDomain/SInteger/Rank.lean`) and `finrank_sUnits_numberField` (`NumberTheory/NumberField/Units/SUnit/Basic.lean`);
  - the `integer…` and `unitValuation` maps (`SInteger/Spectrum.lean`, `ClassGroup.lean` and `Unit.lean`) and `ClassGroup.relNorm` (`RingTheory/ClassGroup/RelNorm.lean`);
  - `ExactStructure` (`CategoryTheory/Exact/ExactStructure.lean:241`) and `ExactK0.liftEquiv` (`CategoryTheory/GrothendieckGroup/Exact.lean:354`);
  - the eighteen `TauCeti.NumberField.Sqrt5` names in `WorkedExamples/Sqrt5/{Basic,Invariants,Units,RealPlace}.lean`.
- **What the pins lack:** no Tits building, Steinberg module or Solomon–Tits theorem exists at either pin. Tau Ceti's `GeneralLinear/Weight/Parabolic/TitsSystem.lean` is a BN-pair, not a building.

### Cross-roadmap citations resolved

- `roadmaps resolve` reports one lead, `VanishingCycles.etaleTateTwists`. It is the planned name in EtaleCohomologyFoundations F.0.3 on main (its README, line 233).
- **At the open heads, re-checked this round:**
  - SchemeKTheoryOperations §§3.6, 3.7 and 4.3 (#1229, its README lines 1018, 1117 and 1364);
  - AutomorphicLFunctionsAndLocalFactors AL.3.10.5 and AL.3.10.7 (#924, lines 1947 and 1967);
  - GeometryOfNumbersAndQuadraticArithmetic §§6.1a, 6.4 (`ExactW0`, 6.4.2), 6.8a, 6.9, 6.10a and 6.11 (#851);
  - StableHomotopyKTheory §§1.24–1.28, 3.36 and Layer 7: 7.1–7.3, 7.8, 7.13, 7.21, 7.24 and 7.28 (#1227);
  - KTheoryFiniteLocalFields §§0.5, 1.1–1.6, 2.2, 3.0a and 6.5a (#1281). Its §§1.6 and 1.9 use K_{2i}(𝔽_q)=0, including i=1, which bears on R02.
- **Consumers:** they cite §§1.1–1.3, 2.1, 2.4, 3.2–3.5, 4.1–4.4, 5.1–5.4, 6.1, 6.3, 6.13, 7.5 and 8.10, all of which exist. None relies on §2.4 at n=2 outside number fields: EllipticKTheory's citation of §§2.1, 2.4 and 3.4 (its README line 1057) concerns number-field K₂. K2SymbolsBrauer (#1302) and ArithmeticGaloisDuality (#858) mention this roadmap only as a downstream consumer, so there is no cycle.

### Declared gaps

- Both slugs and `needs` sentences in `design/plan.json` match the README contracts at lines 288–297 and 434–441.
- `gap:connective-c2-homotopy-orbit-spectral-sequence` remains genuine: StableHomotopyKTheory at #1227 still has no homotopy-orbit spectral sequence.
- `gap:number-ring-witt-signature` remains genuine: GeometryOfNumbersAndQuadraticArithmetic §6.11 at #851 still treats ℤ only.

### Ownership and overlap

- `overlaps.md` lists no pull request that changes this roadmap and no dropped id.
- `roadmaps grep` for Solomon–Tits and the Tits building finds only this roadmap and its consumer EllipticKTheory. ReductiveGroups and SmoothRepresentationsOfLocalGroupsPartII use “Steinberg module” for the algebraic representation, a different object.
- HomologicalStabilityOfGeneralLinearGroups (#2036, new) explicitly leaves §3.2's rank-filtration bounds here, so it is not a second owner.

### Notes for the worker (outside this folder)

- The pull-request description still lists “HomotopySpheres Stage 9, item 2” as a direct prerequisite. HomotopySpheres is on the never-cite list, and the README does not cite it.
- K3BlochGroups at #1430, line 1367, still says that ArithmeticKTheory §7.5 “shows that d₃ maps onto E₃^(4,8)”. README lines 4983–4986 disclaim this.

## Not verifiable

- **Bass–Tate** (`bass-tate`, waived): cited in §§8.3–8.5 and 8.8–8.9. Tate's criterion and the eleven residue steps were checked by computation instead.
- **Groenewegen's preprint pages** (`groenewegen-preprint`, waived): the journal text was used.
- **Grayson, LNM 966** (`grayson-curve`, uncertified): the README cites it by its page range, the only locator it flags as unverified.
- **Quillen's Seattle notes, Harris–Segal, Mitchell and Serre** (all waived): not read.
- **AINTLIB declarations** (§§7.1–7.3): an external repository, not opened.
- **Not reopened this round, as they lie outside the sample:** fgv, hermitian, ravenel, rognes-k4, rognes-weibel, handbook, sharifi and ribet (verified in earlier rounds).

## Source issues

- **Error** in kbook at Wild Kernels V.6.8.2, printed page 413: the source says that if ℓ annihilates the torsion T of K_n(R), then div K_n(F) is the kernel of K_n(R;ℤ/ℓ)→K_n(F;ℤ/ℓ); it should be that this kernel is T∩ℓK_n(F), equal to div only for ℓ a multiple of a stabilisation modulus (Caputo's Example 2 field, ℓ=3); affects nothing.
- **Error** in kbook at Wild Kernels V.6.8.2, printed page 413: the source says div K_(2i)(F) is isomorphic to the wild kernel, citing Weibel's wild-kernel paper; it should say div has index at most two there, exactly two for odd i and special F (Theorem A); affects nothing.
- **Misprint** in caputo at Example 2, printed page 17: the source says the auxiliary cyclic field E is totally split at 3 while p is still a general odd prime; it should be totally split at p; affects nothing.
- **Misprint** in kbook at Classical Data VI.8.1, printed page 513: the source says K₁(O_S)≅ℤ^(r₂+|S|−1)⊕μ(F); it should be ℤ^(r₁+r₂+|S|−1)⊕μ(F), as Example III.1.3.6 counts all places at infinity; affects nothing.
- **Misprint** in kbook at Classical Data VI.8.1, printed page 513: the source says the groups K_n(F) are finite for even nonzero n; it should say K_n(O_S), since K₂(ℚ) is infinite; affects nothing.
- **Error** in kbook at Example VI.2.1.2, printed page 470: the source says w₁₀(ℚ)=1320=2³·3·5·11; it should be 264=2³·3·11, since 4 does not divide 10 (Lemma VI.2.4); affects a stated result.
