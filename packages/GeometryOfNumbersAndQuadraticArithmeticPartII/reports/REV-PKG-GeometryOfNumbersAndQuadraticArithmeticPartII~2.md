<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1169#issuecomment-6394990603 -->
Review (claude) of bc888e6

Verdict: needs changes

1. **F01** (P2) The finite-field Arf headline is statable but declared unstatable

   - **Location.** `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean` lines 10–13 list "the finite-field Arf isomorphism with its extension-degree law" as not statable, because "Witt carriers over rings, including finite fields of characteristic two, are missing". README §0.4, line 158.
   - **Claim.** The docstring says no statement of the §0.4 headline is possible at the pins. The file therefore states nothing.
   - **Witness.** HermitianKTheoryOfPoincareCategories `Suggested.lean` (open-PR head 5a6365d, lines 44–76) states the 𝔽₂ case on Mathlib's `QuadraticForm` and `Submodule`. The general finite-field version below elaborates at the pins with only a `sorry` warning.
   - **Repair.**
     - Under `/-! ## Layer 0: integral forms and residue coordinates -/`, state one theorem, for example `arf_trace_classifies`, with these hypotheses:
       - `{k V W} [Field k] [Fintype k] [CharP k 2] [Algebra (ZMod 2) k]`, where the `Algebra` binder is needed because instance search finds none;
       - finite-dimensional V and W, with `q : QuadraticForm k V`, `q' : QuadraticForm k W`;
       - symplectic bases `b : Module.Basis (Fin n × Bool) k V` and `b'` of the two polar forms, with the three conditions of the supplier's `arfInvariantF2_eq_sum`.
     - Its conclusion is: `Algebra.trace (ZMod 2) k (∑ i, q (b (i,false)) * q (b (i,true)))` equals the same expression for `q'` and `b'` exactly when there is `L : Submodule k (V × W)` with `∀ x ∈ L, (q.prod q') x = 0` and `2 * finrank L = finrank (V × W)`.
     - Taking `q' = q` gives basis independence, because the diagonal is a Lagrangian of `q ⊥ q` in characteristic two. So no definition and no second theorem are needed.
     - Name the theorem in backticks in README §0.4.
     - In the docstring, remove "the finite-field Arf isomorphism" from the unstatable list. Keep "its extension-degree law", with the reason that `QuadraticForm.baseChange` requires `[Invertible 2]` (`Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:38–39, 127`).
     - **Tested.** The scratch statement elaborates by `lake env lean` from the content checkout: exit 0, only the `sorry` warning. On the instances:
       - xy against x²+xy+y² over 𝔽₂ gives traces 0 and 1, and the orthogonal sum has Arf one, so no Lagrangian exists: both sides are false.
       - The same pair over 𝔽₄ gives Tr(1)=0 on both sides, and the sum is hyperbolic: both sides are true.

2. **F02** (P3) The Summary and the docstring disagree with the acceptance file about the headlines

   - **Location.** README line 3: "The endpoints are its parity quotient, explicit Witt arithmetic over ℚ₂, the integral dyadic comparison, and …". `Suggested.lean` line 21: "the quadratic/symmetric completion pullback".
   - **Claim.**
     - The Summary names the §4.1 presentation as an endpoint. `Suggested.lean` neither states it nor lists it as unstatable.
     - The docstring lists a supplier-owned pullback as a headline of this roadmap.
   - **Witness.**
     - §4.1 is statable on `TauCeti.WittRing ℚ_[2]`. Round 1 stated it and then deleted it as a computed input (F02).
     - README line 13 and line 433 say ArithmeticKTheory §3.5 supplies the completion pullback.
   - **Repair.**
     - Summary: remove "explicit Witt arithmetic over ℚ₂," from the endpoints, and describe it as the input of Layer 5.
     - Docstring line 21: delete "the quadratic/symmetric completion pullback,".
     - Keeping §4.1 as an endpoint would instead require stating it (P2).

3. **F03** (P3) *Needs:* lines left stale by the §5.1 repair

   - **Location.** README line 533 (§5.1 *Needs*: "ArithmeticKTheory §§1.1–1.3 for number-field arithmetic comparisons"), line 549 (§5.2 *Needs*: "§§0.2 and 5.1; …") and line 602 (§5.5 *Needs*).
   - **Claim.** §5.2 takes its unit square classes ±1 from §5.1 (line 541), and §5.5 takes Pic(R)=0 from §5.1 (line 593). §5.1's route needs ArithmeticKTheory.
   - **Witness.**
     - §5.1 now states only the completion identification (line 520).
     - Units and Pic(R)=0 come from the Mathlib contract (line 41).
     - ArithmeticKTheory §§1.1–1.3 (denominators, enlarging primes, Steinitz) enter no step of line 524.
   - **Repair.**
     - §5.1 *Needs*: drop ArithmeticKTheory §§1.1–1.3.
     - §5.2 *Needs*: add `IsCyclotomicExtension.Rat.Three.Units.mem`.
     - §5.5 *Needs*: add `IsCyclotomicExtension.Rat.three_pid` and `ClassGroup.equivPic`.

4. **F04** (P3) The new §3.3 Check does not test the generality it claims

   - **Location.** README line 410: "For the DVR R=ℤ[t]_(2) … There is one dyadic prime, so the parity quotient is zero; finiteness and perfection of the residue field are unnecessary."
   - **Claim.** The Check is said to show that no finiteness or perfection of the residue field is needed.
   - **Witness.** At d=1 the target (ℤ/2)/Δ is zero for every residue field. A version restricted to finite residue fields would give the same value, so the Check discriminates nothing.
   - **Repair.** Use R=ℤ[t]_(2)[(1+√17)/2]. Its polynomial x²−x−4 has unit discriminant 17 and reduces to x(x+1), so R has two dyadic primes, each with residue field 𝔽₂(t). The target is (ℤ/2)²/Δ=ℤ/2, so A(R)≠0. Tested: d=2, target order 2.

5. **F05** (P3) ASCII mathematics and unformatted Lean names in prose

   - **Location.** README lines 147–151, 171–172, 177–180, 260–263, 374, 486, 530, 537 and 572 (for example "Ws(F2)", "Z_(2)", "Z/2", "Q2", "Z_2", "Q(√−7)"). Line 173: "Mathlib QuadraticMap.polarBilin, not Q.associated".
   - **Claim.** House style requires Unicode mathematics outside code spans, and Lean names in backticks.
   - **Witness.** The rest of the README uses ℤ, 𝔽₂, ℚ₂ and ℤ₂ (for example lines 223–225 and 443), so the file mixes both notations.
   - **Repair.** Replace the ASCII forms with ℤ_(2), 𝔽₂, 𝔽₃, 𝔽₄, ℤ/2, ℤ/4, ℤ/8, ℤ₂, ℚ₂, ℤ[i], ℤ[ζ₃] and ℚ(√−7). Write `QuadraticMap.polarBilin` and `QuadraticMap.associated` in backticks. No statement changes.

Five findings: one blocking (P2), four P3. The eleven round-1 findings are all repaired. Three repairs left small residues, recorded as R02–R04. R01 is new: the round-1 headline inventory missed that a supplier already states the 𝔽₂ case of the Arf classification on native Mathlib carriers.

## Round-1 findings: repair status

| Id | Status | Repaired passage (quoted or located) | Residue |
| --- | --- | --- | --- |
| F01 | repaired | `Suggested.lean` is now `import Mathlib` plus the docstring. README line 242 ends "as well as every quotient projection." and names no Lean declaration | none |
| F02 | repaired | README line 443: "define the coordinate function as au+bv+ec using least nonnegative representatives". The four declarations and the two docstring sentences are gone | the Summary still calls this an endpoint (R02) |
| F03 | repaired | README line 553: "In the field sequence the ordered basis is (1,s) with s²=−3, the transfer kernel is the restriction image, and the transfer image is ann(c)." | none |
| F04 | repaired | README line 41 cites the five cyclotomic declarations. Line 520: "Using the supplied cyclotomic arithmetic, identify the completion O at the unique dyadic prime" | dependent *Needs:* lines not updated (R03) |
| F05 | repaired | Lines 147–151, 177–181, 260–262 and 372–376 now say what each Check tests, e.g. line 149: "This tests valuation parity, since valuation two is even." | none |
| F06 | repaired | Lines 55 and 57 hold two contracts with their hypotheses. They are identical to the `needs` of `design/plan.json` (checked by script), and §2.2 *Needs* (line 284) uses both slugs | none |
| F07 | repaired | Line 399: "For every Dedekind domain R with char K≠2 and its finite set I of dyadic primes, rank parity induces a canonical surjection" | the new Check at line 410 does not discriminate (R04) |
| F08 | repaired | Line 244: "proof of Proposition 2.3.9 ii), p.45, line 2068; proof of Corollary 2.3.10, p.45, lines 2087–2091". Both locators verified | none |
| F09 | repaired | Line 95 cites line 1896 (Ls₀=Ws) and line 2050 (Wq≅Lq₀). Both verified. GeometryOfNumbersAndQuadraticArithmetic §6.8a has "The norm gives the symmetrization map." | none |
| F10 | repaired | Line 79 now cites KTheoryFiniteLocalFields §1.7, lines 61 and 320 cite HermitianKTheoryOfPoincareCategories §1.6 `bordism_invariant_periodicity`, and line 549 cites GlobalQuadraticForms §4.4. All three destinations make the cited statements | none |
| F11 | repaired | Line 539: "(CDHHLMNNS-III-v4, Example 2.3.14, p.46, line 2159; the proof here uses GlobalQuadraticForms §§8.1–8.3.)" A whole-file scan finds no process words | none |

## Verified sound

**Elaboration.**
- `lake env lean packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean` was run from the content checkout at the manifest pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`). Result: exit 0 with empty output.
- The file has one `import Mathlib`, one module docstring, a namespace and no declarations. It has no `set_option`, no `lemma`, no sorry'd data, no `#eval` and no `#print`.
- Binder check and one-tactic probe: there are no declarations, so there is nothing to `#check` and no theorem to probe.
- Probes: `ArfProbe2` (R01) and a Lagrangian-descent probe for §0.2 were elaborated in scratch.

**Dependency check.**
- Command: `tauceti-roadmap … gate --depcheck … --name GeometryOfNumbersAndQuadraticArithmeticPartII --order … --movable`. Output: `depcheck: 49 roadmaps, 561 edges, 0 problem(s)`.
- There is no UPWARD, CYCLE or moved line. The roadmap sits at line 113 of the merge order, after ArithmeticKTheory (line 112) and GeometryOfNumbersAndQuadraticArithmetic (line 80).

**Citation resolver.** `roadmaps resolve` against main `c44faf6` and 354 open heads finds no cross-roadmap citation or Lean name missing anywhere.

**Sources: the seeded sample, 15 of 15 targets checked.** Printed page numbers equal the PDF page markers.

| Target | Locator checked (CDHHLMNNS-III-v4 lines unless another source is named) | Result |
| --- | --- | --- |
| 0.1 | Proof of Proposition 2.3.1, line 1896, p.41 (Ls₀=Ws via Corollaries 1.2.16 and 1.3.14). Proof of Proposition 2.3.9, line 2050, p.44 (Wq≅Lq₀) | supports |
| 0.2 | Line 1899 (0→Ls₂ₖ(R)→Ls₂ₖ(K)). Lines 2226–2236 (strict-Lagrangian argument, p.48). Remark 2.3.17, lines 2240–2245 | supports |
| 0.3 | Lemma 2.2.2, line 1690, p.37. Lemma 2.2.9, line 1840, p.40. Remark 2.2.10, line 1869, p.41. Ramified ℤ→ℤ[i] residue map is zero at lines 1793–1798 | supports |
| 0.4 | Line 2095, p.45 (Arf isomorphism Wq(𝔽_q)≅ℤ/2 for finite residue fields). The trace and extension law are derived here, not sourced | supports |
| 1.2 | Remark 2.3.5, line 1960, p.42. Corollary 2.3.2, line 1904, and its proof at line 1930 (Scharlau 6.11 cited at line 1931) | supports |
| 2.2 | Proposition 2.3.6, lines 1976–1994, p.43. CDHHLMNNS-II-v5 Proposition 4.5.5, lines 5253–5274, pp.108–109 | supports |
| 2.3 | Wall-1970 Lemma 1, line 104, p.427. Theorem 2, line 132, p.428. Induction step at line 155, p.429 | supports |
| 2.4 | Proposition 2.3.7, lines 2000–2022, pp.43–44, with the Wall-1973 inputs at lines 2019–2021 | supports |
| 3.1 | Proposition 2.3.9, line 2044, p.44 (total cokernel of the Lq₀/Ls₀ square) | supports |
| 3.2 | Corollary 2.3.10, lines 2072–2096, p.45 | supports |
| 3.4 | Remark 2.3.15, lines 2206–2216, p.47. Remark 2.2.8, lines 1807–1818 (begins on p.39; the nondyadic sentence is on p.40) | supports |
| 4.1 | Example 2.3.13, lines 2110–2124. Example 2.3.14, lines 2175–2182 | supports; the source's annihilator generator is wrong (Source issues) |
| 5.3 | Line 2168 (2 a uniformiser in both rings). Lines 2172–2182 | supports |
| 5.4 | Diagram at lines 2160–2163, p.46 | the source's quadratic arrow is wrong; the README uses the corrected value |
| 5.5 | Line 2183 ff., p.47 | the source's table is wrong; the README's corrected table is verified below |

Spot checks outside the sample:
- Conventions at lines 1933 and 2097.
- Corollary 2.3.4 at lines 1936–1959.
- Remark 2.3.8 at line 2023.
- Remark 2.3.12 at lines 2099–2109.
- CMM Theorem 3.15 (line 892, p.21) and Remark 5.6 (lines 1659–1674, p.39).
- Crossref confirms that DOI 10.1007/BF01418851 is Wall, Invent. Math. 19 (1973) 59–71, part III.

**Adversarial table.** Values were computed with exact rational and 𝔽₄ arithmetic in two scratch scripts, using the normalized ℚ₂ Hilbert symbol. Witt equality is tested as hyperbolicity of q₁⊥−q₂, by dimension, signed discriminant and Hasse sign.

| Statement | Instances | Values computed (roadmap ↔ source/library) | Result | Change |
| --- | --- | --- | --- | --- |
| Convention: sign shift L⁻=Σ²L⁺ | ℤ, degrees 2 and 0 | Degree 2 is positive degree 0, giving ℤ. Degree 0 is positive degree −2, giving Ls₂=0. Source line 1933 | agrees | none |
| Convention: Hilbert formula | (−1,−1), (2,5), (−1,2) | −1, −1, +1 | agrees | none |
| Convention: unital versus half-diagonal | ℚ, b=xy | x² has polar 2xy. x²/2 has polar xy. The two differ by ⟨2⟩, and 2 is a nonsquare in ℚ₂ | agrees; differs knowingly from Part I's B↦B(x,x)/2 | none |
| Convention: signed determinant | ⟨1,1⟩; [[2,1],[1,2ζ]] | −1; 1−4ζ | agrees with §5.4 | none |
| Convention: uniformizer change | ℤ_(5), ⟨5⟩, π=5 and π′=10 | ⟨1⟩ and ⟨2⁻¹⟩=⟨3⟩. The squares mod 5 are {1,4} | agrees | none |
| Convention: difference map | Identity pair | (1,1)↦0 and (2,1)↦1. A sum map gives a↦2a≠0, so not a complex | agrees | none |
| §0.1 σ | 𝔽₂ Arf-one plane; ℚ, q=x²; ℤ[√−5], I=(2,1+√−5) | Polar [[0,1],[1,0]] is metabolic while the Wq class is 1. b(x,x)/2=x². I²=2·(2,1+√−5,−2+√−5)=2R, since 3 and 2 lie in the bracket | true | none |
| §0.2 injection | ℤ⟨1⟩; 𝔽₂[t], polar of xy; R=K | Signature 1. Alternating, so 0. Identity map. A form-level descent statement elaborates in scratch | true | none |
| §0.3 ∂ | ℤ_(2): ⟨3⟩, ⟨2⟩, ⟨4⟩; ℤ_(3): ⟨6⟩; ℤ→ℤ[i] | 0, ⟨1⟩, 0; ⟨2⟩ with 2 a nonsquare mod 3. ⟨2⟩=⟨−i(1+i)²⟩∼⟨−i⟩, a unit, so residue 0 (source line 1798) | true | none |
| §0.4 Arf | 𝔽₂: xy and x²+xy+y²; 𝔽₄: the same plane, x²+xy+ζy², basis ((1,1),(ζ,ζ²)) | 0, 1. Tr(1)=0 and q(ζ,1)=0. Tr ζ=1. Polar 1, raw sum 1, trace 0. The classification statement elaborates | true | R01 |
| §1.1 char-2 table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic=0 in each, so odd groups vanish. ∂_(t)⟨t⟩ has parity 1. Source Corollary 2.3.4 | true | none |
| §1.2 DVR and global | ℤ_(2), ℤ_(3), ℤ, 𝔽₃[t] | Ls₁ = coker(Ls₂(ℚ)=0→ℤ/2) = ℤ/2, and 0 since Ls₂(𝔽₃)=0. ℤ gives ℤ, ℤ/2, 0, 0 (source 2133–2136). d=0 | true | none |
| §2.1 completion | ℤ, ℤ[i], ℤ[ζ₃], ℤ[1/2], ℚ, ℤ_(3) | One factor; one factor with exponents 2m; one factor with residue 𝔽₄; (2)=R so C=0 in the last three | true | none |
| §2.2 fracture | ℓ=1; ℤ/4 with ℓ=2; ℤ with ℓ=2 | C=0 and R[1/ℓ]=R. C=R and R[1/2]=0. Overlap ℚ₂. The Ore and compatibility conditions are automatic for central ℓ (source 1987) | true | none |
| gap: derived-localization-completion-square | (ℤ,1), (ℤ/4,2), (ℤ,2) | Bounded torsion makes the R[ℓⁿ] tower pro-zero, so Rlim(R⊗ᴸℤ/ℓⁿ)=R̂. The cofibre of R→R̂ is ℓ-local, so the square is a pullback | precise, true; first clause has a commutative instance in DerivedModuleAlgebra §1.5 (note) | none |
| gap: poincare-change-of-rings-criterion | Items i–v against source lines 5258–5268 | All five match. The README correctly reads the Ore pair over B (source misprint) | precise; absent from GeometryOfNumbersAndQuadraticArithmetic §6.8a, HermitianKTheoryOfPoincareCategories and every roadmap (grep for 4.5.5, Ore, Poincaré–Verdier square) | none |
| gap: quadratic-extension-witt-exactness | a=−3 over ℚ₂ | Image of ·c is {0,c,4u,c+4u}. ann(c) has 8 elements. Not in Tau Ceti (`Transfer/QuadraticExtension.lean` only diagonalizes trace forms) or QuadraticFormInvariants Layer 9 | precise, minimal | none |
| §2.3 lifting | ℤ₂: xy; x²+xy+y² against xy; lines ⟨1⟩, ⟨3⟩ | det −1. Residue Arf 1 against 0. 3≢1 mod 8. Wall Theorem 2: complete ring, automorphism ≡ id mod I | true | none |
| §2.4 complete rigidity | ℤ₂→𝔽₂; J=R; symmetric case | Lq = ℤ/2, 0, ℤ/2, 0 on both sides. R=0. Orders 16 and 2 (source 2121) | true | none |
| §2.5 henselian rigidity | (ℤ₂,(2)), (𝔽₂[ε],(ε)), J=0 | Same groups as §2.4. Route matches CMM Remark 5.6 | true | none |
| §3.1 A(R) | D=ℤ/4 with images (2D,0), (D,0), (0,D); (ℤ/2)^d with the diagonal | Orders 2 (intersection gives 4), 1, 1; 2^(d−1) | true | none |
| §3.2 number-field table | ℤ, ℤ[1/2], ℤ[ζ₃] | d=1, 0, 1. Lq₂ = ℤ/2, 0, ℤ/2. A = 0, 0, ℤ/4 | true | none |
| §3.3 parity | d=0, 1, 2, 3; ℤ[t]_(2); ℤ[t]_(2)[(1+√17)/2] | Target orders 1, 1, 2, 4. The second ring has target 0 at d=1. The third has target ℤ/2 at d=2 | true | R04 |
| §3.4 nondyadic localization | S=∅, {(3)}, {(2)} | Identity. ℤ₂ on both sides. {(2)} would force Lq₂(ℤ)=0 (source 1809–1814) | true | none |
| §4.1 W(ℚ₂) | All 32 (a,b,e) | 32 classes distinct. 8u=0, 4u≠0, 2v=2c=0. c=⟨1,−5⟩, ⟨1,−3⟩=2u+c. cu=c, cv=4u, c²=0. c·(a,b,e)=ac+4bu for all 32. ann(c) has 8 elements (a even, b=0) | true | R02 |
| §4.2 E₈ | All 256 vectors | Gram determinant 1. 136 zeros = 2⁷+2³ | true | none |
| §4.3 Ws(ℤ₂) | ⟨2,3/2⟩; ⟨−1,2⟩ | Coordinates (4,0,1)=c+4u and (0,1,0)=v | true | none |
| §5.1 dyadic place | t²+t+1 mod 2; ℚ(√−7); norm a²−ab+b²=1 | Values 1, 1. t²+t+2 ≡ t(t+1). Six solutions | true | R03 |
| §5.2 Ws(R)=ℤ/4 | 2u, 4u in K and in E | −1 is a nonsquare in E, since −3/−1=3 is a nonsquare. (−1,−1)_E=(−1,N(−1))=1, so the level is 2 | true | none |
| §5.3 restriction | Snake lemma with the iso Ws(𝔽₂)→Ws(𝔽₄) | ker θ=ker θ′ of order 4. coker ≅ ann(c) of order 8. |Ws(O)|=32=|W(E)|/2 | true | none |
| §5.4 Arf base change | 1−4ζ=3−2√−3 | Norm 21 ≡ 5 mod 8, a nonsquare. N(−1)=1 | true | none |
| §5.5 Eisenstein L-groups | Transfer recomputed from λ on (1,s) | Matrix equals the README table. det 21. Diagonal ⟨1,−1,4,−21/4⟩, class c. A=ann(c)/⟨c⟩=ℤ/4. Wq(R)=0: if σ_R(x)=2u then θ(2u)=2u∉{0,t}, a contradiction | true (source wrong) | none |

**Library declarations opened at the pins (file:line).**
- Mathlib:
  - `Mathlib/NumberTheory/NumberField/Cyclotomic/`: `Basic.lean:126`, `PID.lean:34`, `Three.lean:50` (namespace `IsCyclotomicExtension.Rat.Three`), `Ideal.lean:291, 311`.
  - `QuadraticForm.baseChange`: `TensorProduct.lean:127`, inside the `Invertible 2` section at line 38.
  - `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`: `QuadraticMap.polarBilin` (317), `proj` (628), `Anisotropic` (1056), `weightedSumSquares` (1410).
  - `QuadraticMap.Equivalent`: `IsometryEquiv.lean:46`.
  - `AdicCompletion.of`: `AdicCompletion/Basic.lean:364`.
  - `Ideal.quotientMulEquivQuotientProd`: `Operations.lean:325`.
  - `Mathlib/RingTheory/ClassGroup/Basic.lean`: `ClassGroup.mk0_surjective` (347), `mk_eq_one_iff` (353).
  - `ClassGroup.equivPic`: `PicardGroup.lean:876`.
  - `LinearMap.BilinForm.baseChange`: `BilinearForm/TensorProduct.lean:135`.
- Tau Ceti:
  - `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean`: `WittRing` (218, field with `[Invertible 2]`), `wittClass` (288), `WittRing.dimMod2` (386).
  - `WittRing.baseChange`: `Witt/BaseChange.lean:211`.
  - `TauCeti/LinearAlgebra/QuadraticForm/Transfer/Witt.lean`: `WittRing.scharlauTransfer` (147), `scharlauTransfer_baseChange_mul` (186).
  - `regularFormSetoid`: `RegularFormClass/Basic.lean:186`.
  - `hilbertSymbol_padicTwo`: `PadicTwo.lean:150`.
  - `RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq`: `Classification.lean:129`.
  - `TauCeti/RingTheory/DedekindDomain/AdicValuation/Completion.lean`: `IsDedekindDomain.HeightOneSpectrum.isAdicComplete_adicCompletionIntegers` (367), `residueFieldEquivAdicCompletionIntegers` (434).
  - `IntegralLattice`: `IntegralLattice/Basic.lean:63`.
  - The pinned Tau Ceti has no Arf invariant, no ring or characteristic-two quadratic Witt carrier, and no Poincaré or L-theory carrier (grep).

**Cross-roadmap citations resolved.**

| Roadmap | Copy read | Sections resolved |
| --- | --- | --- |
| GeometryOfNumbersAndQuadraticArithmetic | open head 465728d | §§6.2–6.5, 6.8a (symmetrization norm, residue line, dévissage, fundamental fibre sequence, filtered colimits), 6.9.1–6.9.3, 6.10a, 6.11 |
| HermitianKTheoryOfPoincareCategories | open head 5a6365d | §§1.6 (`bordism_invariant_periodicity`), 3.4, 4.5, 4.6, 6.6, 7.9, and its `Suggested.lean` |
| ArithmeticKTheory | open head 76f1a28 and the board copy | §§1.1–1.3, 2.2, 3.5 |
| KTheoryFiniteLocalFields | open head afe02e8 | §1.7 |
| GeneralAlgebraicKTheory | open head e0552fe | §§11.3, 11.4, 11.15 |
| StableHomotopyKTheory | open head 00bfbf7 | §§5.5, 5.7–5.9, and 7.13–7.20 for ownership |
| QuadraticFormInvariants | main | Layers 4, 6, 9 |
| GlobalQuadraticForms | main | §4.4 and §§8.1–8.3 |
| SchemeAndStackFoundations | main | §§0.14, 0.15, 0.21 |
| IntegralLattices | main | Completed/IntegralLattices Layers 1–5 (E₈ at line 382); IntegralLattices milestone 1I (Milgram) |
| DerivedModuleAlgebra | main | §§1.3–1.5 (ownership of derived completion) |

**Gaps.** All three slugs are in `design/plan.json` `gaps`, with README contracts identical to their `needs` and with *Needs* uses (lines 284 and 566). All three are owned, precise and not already provided in their stated generality.

Note, not counted as a finding: DerivedModuleAlgebra §1.5 (main) already proves the commutative case of the first clause of gap:derived-localization-completion-square. That is, the ordinary quotient tower computes derived completion when there is bounded torsion. The contract could cite it.

**Duplication and ownership.** I searched by object across main, the 354 open heads (index tool) and the board packages. The objects were:
- Arf invariants over finite and characteristic-two fields;
- W(ℚ₂) presentations;
- the total cokernel;
- henselian and complete rigidity of quadratic L-theory;
- Paper II Proposition 4.5.5;
- localization–completion squares;
- quadratic-extension exactness;
- Eisenstein L-groups.

Outcome:
- HermitianKTheoryOfPoincareCategories owns only the 𝔽₂ Arf invariant, which this roadmap generalizes (§0.4; R01).
- ArithmeticKTheory §3.5 claims as owned prerequisites the Dedekind ℓ=2 localization–completion square, citing Propositions 2.3.6–2.3.9. This roadmap consumes that square (README lines 13 and 433). It owns only the general-ring Propositions 2.3.6–2.3.8 in §§2.2–2.5, which no later section here consumes, so nothing is built twice.
- No `Suggested.lean` name clashes with another roadmap.

**Shape.**
- Every definition has its API and at least three Checks: §0.1 has 4, §0.3 6, §0.4 7, §2.1 6, §3.1 6, and §4.1 has 3+3+3.
- Every theorem has hypotheses and a locator. Every layer ends with Examples and Dependencies.
- There are no LaTeX delimiters and no pull-request numbers.
- A whole-file scan found no text corruption, such as Greek letters inside English words.
- The manifest records all seven works, and each has one key.

## Not verifiable

- **Wall-1973** (Corollary 1, Lemma 1, Proposition 4, Lemma 5): paywalled and settled as uncertified. Its use matches CDHHLMNNS-III-v4 lines 2019–2021.
- **Lam-2005** (VII Theorem 3.5; VI Theorem 2.29 and Remark 2.31): uncertified. The a=−3 instance was checked numerically in W(ℚ₂).
- **Scharlau-1985** (Chapter 6 §6, Theorem 6.11): uncertified. It is cited only as the source's own reference (line 1931).
- **Published CDHHLMNNS-III** (to appear in Annals of Mathematics): not compared, so whether the errors below are corrected in print is unknown.
- **Ownership against open pull requests** was checked through the index tool at all 354 heads and through the board packages. Sibling checkouts were not opened separately.

## Source issues

- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed pp. 46–47 (lines 2160–2163, 2202, 2205): the source says the map on the completed quadratic ℤ/2 factor is the identity, giving quadratic groups ℤ/2 in degree 0 and ℤ/4⊕ℤ/2 in degree 3; it should be zero, because the absolute trace of 1 over 𝔽₄ is 0, giving 0 and ℤ/4; affects a stated result.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p. 47 (lines 2180–2182): the source says the kernel of multiplication by ⟨1,3⟩ on W(ℚ₂) is generated by 2⟨1⟩ and ⟨1,−2⟩; it should be generated by 2⟨1⟩ and ⟨1,−3⟩, since ⟨1,3⟩⟨1,−2⟩ equals 4⟨1⟩, which is nonzero; affects the proof.
- **Gap** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p. 46 (lines 2156–2157): the source says (2) is prime because 2 does not divide the discriminant; that gives only unramifiedness, and inertness needs t²+t+1 irreducible modulo 2, as ℚ(√−7) shows; affects the proof.
- **Misprint** in CDHHLMNNS-II-v5 at Proposition 4.5.5 iv), printed p. 109 (line 5262): the source says the image of S satisfies the left Ore condition together with the source ring A; it should be the target ring B, as the proof's use for B[f(S)⁻¹] at line 5287 shows; affects a stated result.
- **Misprint** in CDHHLMNNS-II-v5 after Proposition 4.5.5, printed p. 109 (lines 5276–5277): the source says condition iv) is equivalent to isomorphisms on kernels and cokernels of right multiplication; it should say condition iii), the cofibre condition, which that reformulation describes; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bc888e6", "job": "REV-PKG-GeometryOfNumbersAndQuadraticArithmeticPartII~2", "model": "opus", "worker": "fable-rev101"} -->
