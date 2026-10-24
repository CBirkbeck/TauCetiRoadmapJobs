<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1169#issuecomment-6385694070 -->
Review (claude) of 87ade09

Verdict: needs changes

1. **F01** (P2) The completion decomposition is an auxiliary lemma, not a headline

   - **Location.** `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean` lines 44–57 (`dyadicCompletionDecomposition`) and line 5 (`import TauCeti.RingTheory.DedekindDomain.AdicValuation.Completion`). README line 238: "Both the product of ideal-adic completions and the product of valuation-completion integer rings are the R-algebra equivalences asserted by `dyadicCompletionDecomposition`."
   - **Claim.** `Suggested.lean` should carry headline theorems only. Here the Chinese-remainder splitting of the 2-adic completion is stated as one of its acceptance tests. The statement is true (see the adversarial table). Padding is graded P2 here under the project rule that non-headline declarations are blocking, although the brief's default grade for padding is P3. The same applies to R02 and R03.
   - **Witness.** The source uses it only inside proofs (CDHHLMNNS-III-v4 line 2068; lines 2087–2091); README line 3 omits it from the endpoints; its number-ring case follows from pinned `TauCeti.integralSemilocalEquiv`. The Completion import is unused: the file elaborates without it.
   - **Repair.** Delete `dyadicCompletionDecomposition` and the `AdicValuation.Completion` import from `Suggested.lean`. Keep §2.1 as a README target, and remove the sentence with the backticked name at README line 238. Optionally, add a Check that the number-ring case agrees with `TauCeti.integralSemilocalEquiv` (`TauCeti/NumberTheory/NumberField/LocalGlobal/Semilocal/Integers.lean:268`) composed with `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` (`Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:327`). Tested: without the import the file elaborates with only `sorry` warnings, and a docstring-only file with `import Mathlib` elaborates cleanly.

2. **F02** (P2) The ℚ₂ Witt-ring presentation computes a small classical value

   - **Location.** `Suggested.lean` lines 63–93 (`q2V`, `q2C`, `q2Coordinates`, `q2WittRingPresentation`). README line 438 names all four.
   - **Claim.** The 32-element additive presentation of W(ℚ₂) and the multiplication-by-c formula are stated as a headline. The statement is true: I enumerated all 32 triples and found them distinct, with cv=4u, c²=0 and ann(c)={a even, b=0}. It is an input to the roadmap, not an end theorem.
   - **Witness.** The source imports W(ℚ₂) from Lam VI Thm 2.29 (CDHHLMNNS-III-v4 lines 2120–2123); README line 440 calls it derived from imported classification and §§4.3, 5.3, 5.5 use it as input: a small computed value.
   - **Repair.** Delete the theorem and its three definitions from `Suggested.lean`, and remove the backticked names from README line 438. Keep §4.1 as a README target with its Checks. Rewrite the module docstring: drop the sentence "The dyadic completion decomposition and the explicit Witt-ring presentation … are statable" and the sentence "The field Witt ring below cannot stand for any of these carriers". Once R01–R03 are applied, reduce the imports to `import Mathlib`. Tested: a docstring-only file elaborates.

3. **F03** (P2) `eisensteinFieldWittExactness` is the a=−3 case of the QuadraticFormInvariants gap

   - **Location.** `Suggested.lean` lines 97–117. README line 548: "The field exact sequence with these actual maps is `eisensteinFieldWittExactness`". README line 552: "Apply the supplied quadratic-extension restriction/transfer sequence with a=−3."
   - **Claim.** The field restriction/transfer exact sequence for ℚ₂(√−3) is stated here as a headline, but it is a special case of a supplier-owned theorem, which belongs in a Check.
   - **Witness.** README line 67 assigns the general sequence to QuadraticFormInvariants Layer 9 (gap:quadratic-extension-witt-exactness); the Lean statement is that contract at F=ℚ₂, a=−3. The headline, integral θ:Ws(ℤ₂)→Ws(O), is unstatable.
   - **Repair.** Delete the declaration from `Suggested.lean` and the backticked name at README line 548. Keep the ℚ₂(√−3) instance in §5.3 as prose and as a Check. Keep "integral restriction kernel/cokernel" among the unstatable headlines in the docstring, where it already is. Tested: the docstring-only file elaborates.

4. **F04** (P2) §5.1 re-proves facts that pinned Mathlib already states

   - **Location.** README lines 515–528: "R is the full ring of integers, a norm-Euclidean PID, with unit group μ6 … The ideal (2) is prime with residue F4." The proof route is norm-Euclidean rounding plus a norm-one equation. *Needs:* "elementary quadratic integer and norm theory".
   - **Claim.** §5.1 plans its own proofs of the ring of integers, the PID property, the unit group and the inertness of 2. All four are already proved at the pin, so here they must be cited, not restated.
   - **Witness.** Pinned Mathlib has `IsCyclotomicExtension.Rat.isIntegralClosure_adjoin_singleton_of_prime`, `IsCyclotomicExtension.Rat.three_pid`, `IsCyclotomicExtension.Rat.Three.Units.mem`, `IsCyclotomicExtension.Rat.inertiaDeg_eq_of_not_dvd` and `ramificationIdx_eq_of_not_dvd` (orderOf (2 : ZMod 3) = 2 gives residue 𝔽₄, e=1).
   - **Repair.** Under "From Mathlib", cite the five declarations with their files, all under `Mathlib/NumberTheory/NumberField/`: `Cyclotomic/Basic.lean:126`, `Cyclotomic/PID.lean:34`, `Cyclotomic/Three.lean:50` and `Cyclotomic/Ideal.lean:291, 311`. Cite `ClassGroup.equivPic` for Pic(R)=0. Reduce §5.1 to the consequence actually new here: the completion O is unramified quadratic over ℤ₂ with fraction field ℚ₂(√−3). Delete the rounding and norm-equation route, and keep the Checks.

5. **F05** (P2) Several Checks claim a discrimination they do not make

   - **Location.** README lines 173, 174, 176 and 177 (§0.4) end with "The value tests the full polar and absolute trace, rather than the untraced symplectic sum." Lines 256, 257 and 258 (§2.1) end with "This counts prime factors, not their ramification multiplicities."
   - **Claim.** Each of these Checks says it separates the correct definition from the stated wrong one. For these instances that claim is false, so the Checks as written are false.
   - **Witness.** Over 𝔽₂ the absolute trace is the identity, so lines 173–174 cannot separate traced from untraced sums; lines 176–177 involve no trace; ℤ and ℤ[ζ₃] have e=1 and ℤ[1/2] no dyadic prime (lines 256–258).
   - **Repair.** Keep the trace clause only on the 𝔽₄ Checks (lines 175, 178, 179), and the multiplicity clause only on the ℤ[i] Check (line 259). On each other bullet, state what it actually tests: "tests nonsingularity of the full polar" (line 176), "tests the zero-dimensional boundary case" (line 177), "tests the empty product" (line 257), and "tests the residue degree" (line 258). Also replace the generic tails at line 147 (§0.3, a base-change Check) and lines 368–372 (§3.1, "preserves the indicated empty or one-prime boundary case") with what each Check tests.

6. **F06** (P2) gap:derived-completion-poincare-criterion bundles two contracts

   - **Location.** README line 53, and the identical `needs` in `design/plan.json`: "the derived localization–completion square of perfect complexes … together with the coefficient-compatible Poincaré–Verdier change-of-rings criterion of Paper II Proposition 4.5.5 on the two K₀-image subcategories."
   - **Claim.** One declared gap asks for two distinct theorems, which makes its `needs` compound.
   - **Witness.** The derived pullback of rings (cited at CDHHLMNNS-III-v4 line 1991) and the five-hypothesis change-of-rings criterion (CDHHLMNNS-II-v5 line 5253, pp.108–110) are separate theorems; "Paper II" is undefined in the README.
   - **Repair.** Split into two slugs, each one sentence with its hypotheses. (a) For an associative ring R and a central integer ℓ with bounded ℓ-power torsion, ordinary ℓ-adic completion is derived completion and the square R→R̂_ℓ over R[1/ℓ]→R̂_ℓ[1/ℓ] is a pullback in D(R). (b) The CDHHLMNNS-II-v5 Proposition 4.5.5 criterion for the K₀-controlled Poincaré squares. Add both to the plan's `gaps`, to README §"From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic" and to the §2.2 *Needs* line. Name the source by its manifest key.

7. **F07** (P3) §3.3 is narrower than its source

   - **Location.** README line 395: "For R as in the preceding theorem and d≥2, rank parity induces a canonical surjection A(R)→(Z/2)^d/Δ(Z/2)".
   - **Claim.** The parity obstruction is stated only for number-field fraction fields, which is narrower than the source supports.
   - **Witness.** CDHHLMNNS-III-v4 Remark 2.3.12 (line 2099) works under Proposition 2.3.9's hypotheses: any Dedekind ring with char K≠2. The README route (even completed rank, constant global rank, unit lines) is not number-field specific.
   - **Repair.** State §3.3 for every Dedekind R with char K≠2 (d is always finite), and drop §3.2 from its *Needs*. Keep the number-field and d=0, 1, 2, 3 instances as Checks.

8. **F08** (P3) §2.1 locator points to the wrong proof

   - **Location.** README line 240: "(CDHHLMNNS-III-v4, Proof of Proposition 2.3.9, pp. 44–45; CDHHLMNNS-III-v4 line 2086.)"
   - **Claim.** The cited line is said to support the decomposition inside the proof of Proposition 2.3.9.
   - **Witness.** Line 2086 opens the proof of Corollary 2.3.10 (decomposition at lines 2087–2091); the proof of Proposition 2.3.9 has only item ii), the product of local Dedekind rings, at line 2068.
   - **Repair.** Cite "(CDHHLMNNS-III-v4, proof of Proposition 2.3.9 ii), p. 45, line 2068; proof of Corollary 2.3.10, p. 45, lines 2087–2091.)"

9. **F09** (P3) §0.1 locator does not contain the stated comparison

   - **Location.** README line 91: "(CDHHLMNNS-III-v4, §2.3, pp. 41–48; Proposition 2.3.9, p. 44; Remark 2.3.17, p. 48; CDHHLMNNS-III-v4 line 2031.)"
   - **Claim.** These pages are cited for σ on every commutative ring and for its inverse b↦b(x,x)/2 when 2 is a unit.
   - **Witness.** Pages 41–48 state neither; Proposition 2.3.9 concerns Dedekind rings. Ls₀=Ws is the proof of Proposition 2.3.1 (line 1896, via Corollaries 1.2.16 and 1.3.14); Lq₀=Wq is line 2050.
   - **Repair.** Cite line 1896 and line 2050 for the two identifications. Present σ and its invert-two inverse as standard: they are π₀ of GeometryOfNumbersAndQuadraticArithmetic §6.8a's symmetrization norm, read through HermitianKTheoryOfPoincareCategories §§3.4, 4.5 and 6.6.

10. **F10** (P3) Three facts are credited to the wrong supplier section

   - **Location.** README line 57 credits "perfect fields have Ws(K)=ℤ/2 by rank parity" to HermitianKTheoryOfPoincareCategories §7.9. Line 316 cites "GeometryOfNumbersAndQuadraticArithmetic §6.8a fundamental fibre sequence and L-periodicity". Line 544 lists "Hilbert reciprocity comparison" without an owner.
   - **Claim.** These cited sections do not make these statements, although each fact exists in another supplier the README already uses.
   - **Witness.** HermitianKTheoryOfPoincareCategories §7.9 treats only 𝔽₂ (perfect fields: KTheoryFiniteLocalFields §1.7); GeometryOfNumbersAndQuadraticArithmetic §6.8a has integer shifts, not sign periodicity (HermitianKTheoryOfPoincareCategories §1.6); the product formula is GlobalQuadraticForms §4.4.
   - **Repair.** Repoint the three items to KTheoryFiniteLocalFields §1.7, HermitianKTheoryOfPoincareCategories §1.6 `bordism_invariant_periodicity` and GlobalQuadraticForms §4.4 respectively.

11. **F11** (P3) Process narrative in a locator

   - **Location.** README line 534: "proof adapted here using GlobalQuadraticForms layer 8 instead of the inaccessible book citation".
   - **Claim.** The locator records how the author worked.
   - **Witness.** The house style forbids process narrative; the phrase records the author's access problem, not mathematics.
   - **Repair.** Write "(CDHHLMNNS-III-v4, Example 2.3.14, p. 46, line 2159; the proof here uses GlobalQuadraticForms §§8.1–8.3.)"

## Verified sound

**Elaboration.** `lake env lean packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean`, run from the content checkout at the manifest pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`). Result: exit 0, and the only warnings are three "declaration uses `sorry`" (lines 48, 88, 102). The four imported Tau Ceti modules exist and their object files were present. There is no `set_option`, `lemma`, sorry'd data, `#eval` or `#print`.

**Binder check.** I put `#check @` for all six declarations in one scratch file. Every needed binder is in the declaration's own signature, and each elaborated type matches its README statement. The `[Invertible (2 : ℚ_[2])]` binder is redundant, because the global instance `invertibleTwo` is found by `#synth`; this is moot under R02 and R03.

**One-tactic probe.** I tried `simp`, `rfl`, `infer_instance`, `constructor <;> exact ⟨by exact?⟩` and `exact?` on each of the three theorems. None closes. The padding verdicts rest on headline status instead (R01–R03).

**Dependency check.** Output: `depcheck: 34 roadmaps, 310 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. The roadmap sits at line 113 of the merge order, after all of its open-PR suppliers.

**Headline inventory.** The README's headlines are §§0.1–0.4, 1.1–1.2, 2.2–2.5, 3.1–3.4, 4.2–4.3 and 5.2–5.5. All are unstatable at the pins, because there are no ring Witt carriers and no Poincaré or L-spectra; a grep of both pins for Poincaré, L-theory, `ExactW0` and Arf finds none. All of them are named in the module docstring. No statable headline is absent.

**Sources (seeded sample, 15 of 15 targets).** All were checked at the locator against the cached text. Line numbers are CDHHLMNNS-III-v4 lines unless another source is named.

| Target | Lines checked |
| --- | --- |
| 0.1 | 2031, 2050, 1896 (see R09) |
| 0.3 | Lemma 2.2.9 at 1840, Remark 2.2.10 at 1869, Lemma 2.2.2 at 1690 |
| 1.2 | Remark 2.3.5 at 1960, Cor. 2.3.2 at 1904/1930 |
| 2.1 | 2068, 2086 (see R08) |
| 2.2 | Prop. 2.3.6 at 1976; CDHHLMNNS-II-v5 Prop. 4.5.5 at 5253 |
| 2.4 | Prop. 2.3.7 at 2000–2022 |
| 2.5 | Remark 2.3.8 at 2023; CMM Remark 5.6 at 1659–1674, Thm 3.15 at 892 |
| 3.1 | Prop. 2.3.9 at 2031–2071 |
| 3.3 | Remark 2.3.12 at 2099–2109 (see R07) |
| 4.1 | Examples 2.3.13–14 at 2110–2182 |
| 5.1–5.5 | Example 2.3.14 at 2150–2205 |

Spot checks outside the sample:

| Target | Lines checked |
| --- | --- |
| 0.2 | 1899, 2242 |
| 1.1 | Cor. 2.3.4 at 1936 |
| 2.3 | Wall-1970 Lemma 1 at 104, Thm 2 at 132–167 |
| 3.2 | Cor. 2.3.10 at 2072 |
| 3.4 | Remarks 2.2.8 and 2.3.15 at 1807 and 2206 |
| 4.3 | 2117–2124 |

Printed page numbers equal the PDF page markers.

**Adversarial table (computed values).**

| Statement | Instances | Values computed (source or library ↔ roadmap) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. sign shift L_n(−1)=L_{n−2}(+1) | ℤ, n=2, 0 | Ls₀(ℤ)=ℤ, so L⁻ˢ₂=ℤ; Ls₋₂=Ls₂=0, so L⁻ˢ₀=0; HermitianKTheoryOfPoincareCategories §1.6 gives L(M)≃Ω²L(−M) | agrees | none |
| Conv. Hilbert formula | (−1,−1), (2,5), (−1,2) | −1, −1, +1 from ε, ω | agrees | none |
| Conv. unital vs half-diagonal | ℚ-line b=xy | x² vs x²/2, polars 2 vs 1, differ by ⟨2⟩ | agrees | none |
| §0.1 σ | 𝔽₂ Arf-one plane; zero module; ℤ[√−5], I=(2,1+√−5) | polar [[0,1],[1,0]] metabolic; 0→0 is iso; I²=2R and I→I⁻¹=I/2 is iso | true | R09 |
| §0.2 injection | ℤ ⟨1⟩; 𝔽₂[t] polar of xy; char 2 | signature 1; hyperbolic, so 0; σ=0 by Remark 2.3.17 | true | none |
| §0.3 ∂ | ℤ_(2): ⟨3⟩,⟨2⟩,⟨4⟩; ℤ_(3): ⟨6⟩; ℤ_(5): π′=10 | 0, ⟨1⟩, 0; ⟨2̄⟩=⟨−1⟩ nonsquare; ⟨3⟩ (3 nonsquare mod 5) | true | none |
| §0.4 Arf | 𝔽₂ xy; 𝔽₂ x²+xy+y²; 𝔽₄ same; 𝔽₄ x²+xy+ζy²; basis ((1,1),(ζ,ζ²)) | 0; 1; Tr(1)=0 and q(ζ,1)=0; Tr ζ=1; raw sum 1, trace 0; Tr_{k′}=m·Tr_k | true | R05 |
| §1.1 char-2 table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic=0 in each, so odd groups 0; even groups = Ws(R) | true (Cor. 2.3.4) | none |
| §1.2 DVR/global | ℤ_(2), ℤ_(3), ℤ, 𝔽₃[t], 𝔽₂[[t]] | Ls₁ = ℤ/2, 0; ℤ gives ℤ, ℤ/2, 0, 0; d=0; odd groups 0 | true | none |
| §2.1 decomposition (README and Lean) | ℤ, ℤ[1/2], ℚ, ℤ_(3), a field, ℤ[i], ℤ[ζ₃] | ℤ₂; the four 2-inverting cases give zero rings on both sides; ℤ[i]: one factor, e=2; ℤ[ζ₃]: one factor with residue 𝔽₄ | true | R01, R08 |
| §2.2 fracture | ℓ=1; R=ℤ/4, ℓ=2; ℤ, ℓ=2 | R̂=0 and c=K₀(R); R̂=R and R[1/2]=0; overlap ℚ₂ | true (Prop. 2.3.6) | R06 |
| §2.3 lifting | ℤ₂ xy; x²+xy+y² vs xy; lines ⟨1⟩, ⟨3⟩ | det −1; Arf 1 vs 0; 3 nonsquare, so the lines are not isometric | true (Wall Thm 2) | none |
| §2.4 complete rigidity | ℤ₂; J=R; symmetric case | Lq = ℤ/2, 0, ℤ/2, 0 = Lq(𝔽₂); R=0; |Ws(ℤ₂)|=16 ≠ 2 | true | R10 |
| §2.5 henselian rigidity | (ℤ₂,(2)), (𝔽₂[ε],(ε)), J=0 | same groups as complete case; identity | true (Remark 2.3.8, CMM 5.6) | none |
| §3.1 A(R) | D=ℤ/4; (ℤ/2)^d; ℤ; ℤ[ζ₃]; ℤ[1/2] | ℤ/2; 2^{d−1}; Ws(ℤ₂)/(⟨u⟩+⟨c+4u⟩)=0; ℤ/4; 0 | true | none |
| §3.2 number-field table | ℤ, ℤ[1/2], ℤ[ζ₃] | Lq₂ = ℤ/2, 0, ℤ/2; A = 0, 0, ℤ/4 | true (Cor. 2.3.10) | none |
| §3.3 parity | d=0, 1, 2, 3 | quotient orders 1, 1, 2, 4; A(ℤ[ζ₃])=ℤ/4 at d=1 | true | R07 |
| §3.4 localization | S=∅, {(3)}, {(2)} | identity; ℤ[1/3]; {(2)} would force Lq₂(ℤ)=0, contradiction | true (Remarks 2.2.8, 2.3.15) | none |
| §4.1 W(ℚ₂) (README and Lean) | all 32 triples, by Hilbert-symbol invariants | 32 distinct; |u|=8, |v|=|c|=2; cu=c, cv=4u, c²=0; (c)={0,c,4u,c+4u}; ann(c)={a even, b=0}, 8 elements; c=⟨1,−5⟩; ⟨1,−3⟩=2u+c | true | R02 |
| §4.2 E₈ | all 256 vectors | 136 zeros of Σxᵢ²−Σxᵢxⱼ mod 2; Gram det 1 | true | none |
| §4.3 Ws(ℤ₂) | polar of x²+xy+y²; ⟨−1,2⟩ | ⟨2,3/2⟩ = c+4u (≠ c); ⟨−1,2⟩ has order 2 | true | none |
| §5.1 Eisenstein ring | norm form; t²+t+1 mod 2; ℚ(√−7) | six norm-one solutions; irreducible; t²+t+2 ≡ t(t+1) | true | R04 |
| §5.2 Ws(R)=ℤ/4 | 2u, 4u in K and E | 2u has disc −1, a nonsquare; 4u has disc 1 and Hasse (−1,−1)_E = (−1,N(−1))_{ℚ₂} = 1 = Hasse(2H) | true | none |
| §5.3 restriction (README and Lean) | θ′ on c, 4u, u; Lean at x=c and x=u | 0, 0, order 4 (level of E is 2); c ∈ (c), u ∉ (c) by rank parity; s_*⟨1⟩_E = 2ab is hyperbolic | true | R03 |
| §5.4 Arf base change | Tr_{𝔽₄/𝔽₂}(1), Tr ζ, N(1−4ζ) | 0; 1; 21 ≡ 5 mod 8, a nonsquare; 2u has disc −1 with norm 1 | true | none |
| §5.5 Eisenstein L-groups | transfer matrix in README lines 603–608 | det 21; diagonal ⟨1,−1,4,−21/4⟩; class = c (≠ c+4u, ≠ 4u); A = ann(c)/⟨c⟩ = ℤ/4; σ(t) ∉ ⟨u⟩, so Lq₀(R)=0 | true (source wrong) | none |
| gap: quadratic-extension exactness | Lam VII 3.5 at a=−3 | ker θ′ = (c) and im s_* = ann(c) are consistent with the W(ℚ₂) computation; not in QuadraticFormInvariants Layer 9 or Tau Ceti (`Transfer/QuadraticExtension.lean` only diagonalizes trace forms) | precise and minimal | none |
| gap: derived-completion criterion | — | two theorems in one `needs` | compound | R06 |

**Duplication and ownership.** For each object, I searched the pins, main and the 338 open roadmap pull requests at their heads with the index tool, plus the board packages. Searched objects: W(ℚ₂) presentations, the total cokernel, Eisenstein Witt and L-groups, finite-field Arf with trace, ideal-adic product decompositions, quadratic rigidity, henselian L-theory, localization–completion squares and quadratic-extension exactness. The only overlaps found are R04 (Mathlib) and R03 (the declared gap). ArithmeticKTheory §3.5 owns the Dedekind tables, and this roadmap consumes rather than restates them. QuadraticFormInvariantsPartII (merge-order line 311) and ArithmeticKTheoryPartII (line 223) come later and plan none of this roadmap's targets. No declaration in `Suggested.lean` shares a fully qualified name with another roadmap.

**Library declarations opened at the pins (file:line).**

- Tau Ceti: `TauCeti.WittRing` (`Witt/Ring.lean:218`); `wittClass` (288); `WittRing.baseChange` (`Witt/BaseChange.lean:211`); `WittRing.scharlauTransfer` (`Transfer/Witt.lean:147`); `scharlauTransfer_baseChange_mul` (186); `invertibleTwoOfBaseField` (66); `regularFormSetoid` (`RegularFormClass/Basic.lean:186`); `hilbertSymbol_padicTwo` (`PadicTwo.lean:150`); `RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` (`Classification.lean:129`); `isAdicComplete_adicCompletionIntegers` (`AdicValuation/Completion.lean:367`); `residueFieldEquivAdicCompletionIntegers` (434); `IntegralLattice` (`IntegralLattice/Basic.lean:63`).
- Mathlib: `QuadraticMap.polarBilin` (`QuadraticForm/Basic.lean:317`); `proj` (628); `Anisotropic` (1056); `weightedSumSquares` (1410); `Equivalent` (`IsometryEquiv.lean:46`); `QuadraticForm.baseChange` requires `Invertible 2` (`TensorProduct.lean:39`); `Ideal.quotientMulEquivQuotientProd` (`Ideal/Quotient/Operations.lean:325`); `ClassGroup.mk0_surjective` and `mk_eq_one_iff` (`ClassGroup/Basic.lean:347, 353`); `ClassGroup.equivPic` (`PicardGroup.lean:876`).

**Cross-roadmap citations resolved.**

| Roadmap | Copy read | Sections resolved |
| --- | --- | --- |
| GeometryOfNumbersAndQuadraticArithmetic | open-PR head | §§6.2–6.5, 6.8a, 6.9 (6.9.1–6.9.3), 6.10a, 6.11 |
| HermitianKTheoryOfPoincareCategories | open-PR head | §§1.6, 3.4, 4.5, 4.6, 6.6, 7.9 |
| ArithmeticKTheory | open-PR head | §§1.1–1.3, 2.2, 3.5 |
| KTheoryFiniteLocalFields | open-PR head | §1.7 |
| GeneralAlgebraicKTheory | open-PR head | §§11.3, 11.4, 11.15 |
| StableHomotopyKTheory | open-PR head | §§5.5, 5.7–5.9 |
| QuadraticFormInvariants | main | Layers 4, 6, 9 |
| GlobalQuadraticForms | main | §§4.4, 8.1–8.3 |
| SchemeAndStackFoundations | main | §§0.14, 0.15, 0.21 |
| IntegralLattices | main | Completed/IntegralLattices Layers 1–5; IntegralLattices milestone 1I |

Only R10 shows drift.

**Gaps.** Both slugs appear in `design/plan.json` `gaps` and in the README contracts and *Needs* lines (53/280, 67/561). gap:quadratic-extension-witt-exactness is precise, minimal and owned. gap:derived-completion-poincare-criterion is owned and not already provided (GeometryOfNumbersAndQuadraticArithmetic §6.8a has no change-of-rings criterion), but it is compound (R06).

**Shape.** Every definition has an API list and at least three Checks (§0.1: 4, §0.3: 6, §0.4: 7, §2.1: 6, §3.1: 6, §4.1: 3+3+3). Every theorem has hypotheses and a locator. Every layer ends with Examples and Dependencies. There are no LaTeX delimiters, target tables or PR numbers. The sources manifest records all seven cited works.

## Not verifiable

- **Wall-1973** (Corollary 1, Lemma 1, Proposition 4, Lemma 5): paywalled and recorded as uncertified. Its use matches how CDHHLMNNS-III-v4 lines 1996 and 2019–2021 cite it.
- **Lam-2005** (VII Thm 3.5; VI Thm 2.29, Remark 2.31): uncertified. I checked the a=−3 content numerically in W(ℚ₂), but not the general theorem.
- **Scharlau-1985** (Chapter 6 §6, Thm 6.11): uncertified. It is cited only as the source's own reference (line 1931).
- **Annals of Mathematics version** of CDHHLMNNS-III: not compared, so whether the errors below are corrected in print is unknown.

## Source issues

- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed pp. 46–47 (lines 2160–2163, 2202, 2205): the source says the completion map on the quadratic ℤ/2 factor is the identity, giving Lq₀(R)=ℤ/2 and Lq₃(R)=ℤ/4⊕ℤ/2; it should be the zero map, since the Arf-one plane over 𝔽₂ becomes hyperbolic over 𝔽₄, giving Lq₀(R)=0 and Lq₃(R)=ℤ/4; affects a stated result.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p. 47 (line 2180): the source says the kernel of multiplication by ⟨1,3⟩ on W(ℚ₂) is generated by 2⟨1⟩ and ⟨1,−2⟩; it should be 2⟨1⟩ and ⟨1,3⟩ (equivalently ⟨1,−3⟩), because ⟨1,3⟩·⟨1,−2⟩ = 4⟨1⟩ ≠ 0; affects the proof.
- **Gap** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p. 46 (lines 2156–2157): the source says (2) is prime because 2 does not divide the discriminant; that gives only unramifiedness, and inertness needs t²+t+1 irreducible mod 2 (ℚ(√−7) shows that unramified primes can split); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "87ade09", "job": "REV-PKG-GeometryOfNumbersAndQuadraticArithmeticPartII", "model": "opus", "worker": "fable-rev61"} -->
