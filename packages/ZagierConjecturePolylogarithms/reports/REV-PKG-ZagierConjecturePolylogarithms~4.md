<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6785609798 -->
Review (codex) of a129016

Verdict: needs_changes

1. **F01** (P1) The specified Hodge product and differential contradict the period formulas

   **Location:** `packages/ZagierConjecturePolylogarithms/README.md:468`, :480, :720 and :724. The target is “the commutative dg-algebra ... of [G08] §4”, and on single symbols the API specifies “the exterior derivative `d`”.

   **Claim:** One map is simultaneously multiplicative for G08's product, has the displayed weight-four components, and intertwines the differential using the displayed ordinary-derivative equations.

   **Witness:** G08 Definition 4.10, p.47, G08 line 1971 gives four units `Alt₄/24`, not `Alt₄/6`; Lemma 4.13, p.48, G08 line 2045 gives `−d/2` on weight-four zero-forms, not `d`.

   The nonzero evaluations are in the adversarial table below. This is not repaired by the new factor `i` or by merely naming the Hodge differential. The inputs of weights 2,1,1 also give coefficients `(3/5,−1/5,1/5)`, whereas §5.1 retains `(3/7,−1/7,1/7)`. Thus multiplicativity already fails independently of the single-symbol differential.

   **Exact repair:** Distinguish the literal G08 Hodge dg-algebra period from its image in an explicitly specified ordinary Deligne/form complex. Give the comparison, including its normalization in each relevant bidegree, and transport both the product and differential. Recompute §§3.7, 3.9, 5.1–5.4 and 6.2 consistently through that comparison. If the literal G08 model is retained, its four-unit component is `Alt₄/24`, its three-factor coefficients here are `(3/5,−1/5,1/5)`, and its differential on a weight-n zero-form for n>1 is `−d/2`; the single-symbol normalization must then be reconciled with these, not patched independently. Keep `d^C` fixed. Add the constant-unit and angular tests below. For the literal product the repaired four-unit test gives `−i log(2)/4` on both sides, and the weights-(2,1,1) test gives `−3iD(i)/10` on both sides. A transported model must yield the same equalities after its stated comparison.

2. **F02** (P2) Expressing a motivic class does not construct the combinatorial chain lift

   **Location:** `packages/ZagierConjecturePolylogarithms/README.md:812`: “then apply §3.12 to express it in `L₄(F)`”; :822 uses that expression as an `L₄`-valued cocycle. At :549 the realization explicitly asserts no injectivity.

   **Claim:** A motivic Grassmannian class, its motivic relations and its motivic cobracket can be lifted by expressing the class in correlator generators, giving the required map to the combinatorial complex.

   **Witness:** Let `ρ: ℚe⊕ℚk → ℚe` kill k. Representatives u↦e and v↦e+k have equal realized classes, but the relation u−v lifts to −k≠0. GR lines 4240–4243 supply no relation-compatible lift.

   Depth reduction gives representatives, not independence of those representatives or compatibility of their full combinatorial cobrackets. Even choosing a linear section, thereby respecting linear relations, does not ensure a chain lift: the second finite-dimensional model in the table demonstrates the missing obstruction. G09 Theorem 3.4 explicitly warns that its integrable-symbol construction need not preserve the coproduct (G09 line 750). The additional motivic requirements already in §5.7 do not repair the passage back to the combinatorial coalgebra.

   **Exact repair:** Add a named target constructing a relation-compatible chain lift from the relevant Grassmannian/flag complex to the combinatorial weight-four complex. State its source and target, both nine-term relations in `L₄(F)` itself, and equality of the full cobracket in the specified combinatorial degree-two target. Prove the lift and its necessary field, specialization and stabilization compatibilities, or give the exact owned obstruction-vanishing result that constructs it. Use this target in §5.8. Do not infer it solely from §3.12 or assume injectivity not supplied by §3.13. In the first test the new relation obligation rejects the representatives `(e,e+k)` and accepts `(e,e)`; in the second test it detects the nonzero boundary b and refuses the purported chain lift.

3. **F03** (P2) A number-field lift cannot be evaluated at the generic points used later

   **Location:** `packages/ZagierConjecturePolylogarithms/README.md:812` constructs the lift “for a number field `F`”; :822 claims a cocycle “on the simplicial variety”; :832 extends that cocycle by residues; :870 excludes other infinite fields in degrees 1,2.

   Re-raised: F04.

   **Claim:** The number-field construction suffices for the generic coefficient diagram and the universal Deligne comparison used to obtain κ and its regulator.

   **Witness:** The generic 4×8 matrix has coefficient field `ℚ(a₁₁,…,a₄₈)`, of transcendence degree 32. A number field has transcendence degree zero. Thus §5.7 cannot be instantiated on this generic configuration or its function-field residue diagram.

   The repair's observation about the source is correct: GR line 4239 invokes a number subfield of ℂ. Its conclusion does not justify narrowing the prerequisite while retaining the generic-variety consumer. Even over ℂ, a Hodge-realization class alone supplies neither a combinatorial `L₄(ℂ(X))` class nor the residue-compatible motivic lift. Specializing to algebraic closed points does not produce that class. This issue persists even if R02 is solved over each number field.

   **Exact repair:** Supply the general algebraic, relation-compatible lift required by §5.8 over infinite fields, including the function fields of the flag varieties and their residue fields. It can be an owned target here; if a broader motivic route is used instead, declare the precise missing interfaces with their actual owners and field hypotheses. Make the generic construction depend on that interface, and recover the all-infinite-field degree-1,2 maps through it rather than omitting the theory. Retain the number-field hypotheses on the final arithmetic regulator theorems. Test the repaired interface on the above rational function field, on `ℚ(t)` and on `𝔽₂(t)`; it must cover these and give the degree pairs `(K₇,H¹)` and `(K₆,H²)`, alongside the already covered `(K₅,H³)` and `(K₄,H⁴)`. Merely restoring the broader sentence without supplying the construction does not fix the gap.

Three findings: one P1 and two P2. The acceptance file elaborates, contains no padding, and retains its binders. The remaining defects are in the period normalization and the construction of the generic combinatorial Chern cocycle. No package input was changed.

## Previous findings, checked first

Locations in this table are in `packages/ZagierConjecturePolylogarithms/README.md`.

| Previous finding | Repaired passage and status | Independent verification |
| --- | --- | --- |
| F01, scalar/form-valued periods | **Partly repaired.** Line 720 now says “`P(S₄(z)) = i·L₄*(z)`”; line 502 inserts “multiply by `i^{m−1}`” and allows a weight-dependent comparison constant. | The angular derivative, tree value line and Tate division now agree as scalar/form conversions. However, calling the retained formulas the dg-algebra map to G08's Hodge complex is still false: its actual product and differential give the different values in R01. |
| F02, unsigned flag sum | **Repaired.** Line 598: “`t = Σ_a (−1)^{|a|} t_a`”. | For N=5 the unsigned residual is `2A−2B`, signed residual zero. For N=6 the two residual coefficients are `1−1=0` and `−1+1=0`. The corrected map is used again in §§4.4 and 5.8. |
| F03, quotient-complex overclaim | **Repaired.** Line 14 promises “explicit raw cycles are inductive raw cycles” and says no map of complexes is constructed. | At line 950 the raw square sends `[x]` along either path to `[x]₃^ind⊗u(x)`. The obstruction/period-span condition remains on the stronger every-family claim. No quotient-complex promise was found elsewhere. |
| F04, infinite-field scope | **Partly repaired.** Lines 866–868 separate “every infinite field” in degrees 3,4 from “every number field” in degrees 1,2. | The algebraic maps in degrees 3,4 do not need the lift. The repair correctly identifies a gap in the source's broader proof. It does not cover the generic function fields already consumed by §§5.8–5.10; R03 gives this additional witness and addresses the repair's reason. |
| F05, flag ownership in the Summary | **Repaired.** Line 3 now owns “the signed weight-four flag-to-configuration map”; line 588 says “Nothing about flags is constructed here”. | The imported generic flag complex remains in Polylogarithms §3.4, supplemented by the declared all-length contract. This package owns its weight-four map, not another construction of the flags. |

## Verified sound

### Extent, principles and shape

All 47 numbered targets, their API lists, Checks and Needs lines were read, as were the five previous findings and the repair report. Changed period, flag, scope and K-comparison passages were reviewed again; their patterns were searched throughout the package. For unchanged material the computations explicitly identified as inherited below are the round-3 report's recorded computed values, not its unsupported summaries. In particular the previous summary of §5.7 was not accepted as a verification of the chain lift: it led to R02.

The six layers have mathematical names, Examples and Dependencies. Their build order is explained by the mathematics rather than a claim to follow a source's chapters. The Part II introduction identifies where Polylogarithms stops. Definitions have API lists and at least three Checks; the eight Lean definitions have individual discriminating tests within §6.4. The raw formula used before its later descent is not a dependency cycle. No good-prime restriction, copied source passage, executable mathematical algorithm, prohibited supplier, process residue, HTML anchor or machine path was found in the package inputs. R01–R03 concern substantive specifications despite this satisfactory shape. Main-branch house-style comparisons were `Completed/HodgeStructures/README.md` and `TauCetiRoadmap/PolylogarithmFunctions/README.md`.

All six cited works have one manifest entry each, with readable legal cached texts. No additional unverified locator was flagged in README or sources.toml. No source was fetched and no manifest entry was modified. Metadata does not introduce a different scope.

### Acceptance file, headline completeness and padding

`lake env lean` on the absolute package Suggested.lean, run from the specified content checkout, exited 0. Its only output was two `declaration uses sorry` warnings, at lines 123 and 132. There is exactly one `import Mathlib`, no Tau Ceti import requiring a build, no `set_option`, no admitted data and no admitted example. Eight definitions have real bodies; two theorems are admitted.

A fresh scratch copy with `#check @name` for all ten declarations also elaborated. Field, rational-module and number-field instances, and the every-family cycle hypothesis, remain in the signatures. No lost binder or README/signature discrepancy was found. The quotient needed to test `IsCycle4` lives in the quantified universe `Type u`, so the universal test is not vacuous.

Each of the two sorried theorems was probed separately with `rfl`, `infer_instance`, `simp`, and `exact riemannZeta_four`: all eight attempts failed for the relevant mathematical goal. The scalar zeta lemma has the wrong type for both quantified determinant theorems. No theorem is a boundary case, a Check, a restatement of a definition or a one-tactic consequence of the inspected near-matches. No padding finding is warranted.

| README headline/deep result | Acceptance-file coverage |
| --- | --- |
| Existence for every number field of explicit cycles with a nonzero rational zeta multiple | `zagier_four_exists`, Suggested.lean:123, with the actual cycle and determinant definitions. |
| Rationality for every family of explicit cycles | `zagier_four_everyFamily`, Suggested.lean:132; multiplier may be zero. |
| Weight-four extension theorem, cluster map and cobracket descent | Named in the module docstring; missing explicit Bloch and single/double-symbol quotient carriers. |
| Motivic realization, base-point change, depth reduction and periods of every cycle | Named; mixed Tate motives, punctured-line groupoids and framed Hodge–Tate coalgebras are missing. Native unframed Hodge structures do not supply them. |
| Collision continuity | Named; Hodge correlator integral carrier is missing. |
| Grassmannian chain map and generic Chern cocycle | Named; configuration complexes, G₄ and the Deligne classifying-variety realization are missing. |
| K-comparison and regulator of κ | Named; higher Quillen K-groups and Borel regulator are missing. The README route still needs R01–R03. |

The own Lean identifiers are exactly `polylog`, `singleValued`, `unitVector`, `trilogCyclic`, `TrilogRelationFunction`, `IsCycle4`, `periodMatrixFour`, `zagierDeterminantFour`, `zagier_four_exists`, and `zagier_four_everyFamily`. Each appears in README and is declared in Suggested.lean. Mathematical symbolic notation was distinguished from claimed ASCII declaration names. The analytic and presentation restatements explicitly credit their suppliers and are needed to state the headlines on native carriers.

### Adversarial calculations

Here D(i) is Catalan's constant and β(4) is the Dirichlet beta value. “Inherited” means an unchanged computation with explicit values in the previous review, not a newly run numerical experiment. Exact heptagon coefficient collections and both symbolic-module ranks were recomputed this round with rational arithmetic. The table covers every seeded target, both headlines, the repaired patterns and every finding. Numerical values below are illustrative evaluations of the displayed exact expressions, not proofs of global identities.

| Statement | Instances; values on the two sides | Result / change |
| --- | --- | --- |
| §1.1 raw symbols | `s(∞,1,0,2)=r(∞,0,1,2)=2`; unpermuted ratio `−1`. Six-point `Z(0,1,2,3,4,5)=1/5`, opposite sign `−1/5`. Raw `S₃(2)−D₂₁(2,2)` has tagged coefficients `(1,−1)`, not zero. | Ratio convention and independent tags agree; unchanged computed row. |
| §§1.2–1.5 relations and specialization | `D₂₁(t,3)↦−[3]₃`; reduction specializes to `[2/3]₃+[−2]₃−[1]₃=−[3]₃`. Equal poles have coefficients 2 in weight three and 3 in weight four. | Inherited; no analytic substitute for the declared algebraic specialization contract. |
| §1.6 cobracket | At `(x,y)=(2,3)`, the four terms combine to `[2]₂⊗u(3/2)+[3/2]₂⊗u(2)+[2]₂⊗u(2/3)+[3]₂⊗u(1/2)=[3/2]₂⊗u(2)−[3]₂⊗u(2)`. At `S₃(2)`, the next differential is `u(−1)∧u(2)∧u(2)=0`; alternative last unit `u(1−2)` would already make the first boundary zero. | Substitution agrees with GR (110); tensor cancellation is exact. Specialization to `−S₃(3)` has boundary `−[3]₂⊗u(3)` on both paths. |
| §§2.1–2.2 cells/orientations | Counts of vertices `1,2,5,14`; K₃ cell counts `(14,21,9,1)` give Euler sum 1. Two diagonal-insertion orders give `+1−1=0`. | Inherited computed cells; finite combinatorial object, not another disc-moduli construction. |
| §2.3 square | Vertices `W,W+a,W+a+b,W+b`: edge sum `2B⊗a−2A⊗b`; differential of `2B∧A` is identical. Value `B∧A` gives only `B⊗a−A⊗b`. | Correct factor 2 and orientation. |
| §2.4 hexagon/heptagon | Three seven-tuples `(0,1,3,7,11,17,23)`, `(0,1,2,5,−3,1/2,9)`, `(2,3,5,7,11,13,19)`: raw support sizes 70 and 35; every coefficient of the displayed corrected difference is 0 in each case. | Fresh exact computation; quotient relation was not mistaken for the uncorrected raw identity. |
| §§3.1–3.3 co-Jacobi/extension coordinates | Inherited nontrivial test at `x=−7/9−8i,y=−2+3i`: tensor contribution approximately `−0.5011`, exterior contribution `+0.5011`, sum 0; wrong exterior convention gives `−1.0023`. Equal-pole paths both give `3[u₀/v₀]₃⊗u(u₀/v₀)`. | Negative exterior identification is explicit. Small tests do not prove the extension theorem. |
| §§3.4–3.5 cyclic coalgebra | Pure length-two word maps to 0 only after the specified quotient; pure length-three shuffle is twice that word, hence 0 over ℚ. Length-five cuts number `5+5+5=15`; reversal negates the three-letter cut. | Inherited computed controls exclude the unreduced wrong model. |
| §3.6 frames | Kummer −1 has rational class 0; Kummer 2 has period log 2≠0; split extension has class 0; `(ℚ(n),id,id)` has weight 0 and unit 1. | Framing and Tate conventions discriminate. |
| §3.7 rigidity | `F⁻¹ℚ(m)=0` for m≥2, so extension derivative 0; for m=1 the coordinate Kummer period has derivative `dt/t≠0`. | The weight threshold is necessary. |
| §§3.7,5.1: four-unit product (R01) | On `(Gm)³` use units `2,y,z,w`; evaluate at y=z=w=1 on the three angular vectors. G08 product gives `−i log 2/4≈−0.1732867951i`; README `Alt₄/6` gives `−i log 2≈−0.6931471806i`. | Failure by factor 4. G08 N-eigenvalues of the factors are 1,1,1,1 and of the product 4. Alternation contributes 3!=6 copies of the surviving term. |
| §§3.7,5.1: weights-(2,1,1) product (R01) | Set `x=i`, y=z=1 on angular vectors, with the stated `P(S₂(i))=iD(i)/2`. G08 `(3/5)` term gives `−3iD(i)/10≈−0.2747896782i`; README `(3/7)` gives `−3iD(i)/14≈−0.1962783416i`. | Failure; G08 input N-eigenvalues `(3,1,1)` and output 5 fix the denominator. |
| §§3.7,5.1: differential (R01) | At z=i on ∂θ, ordinary `d(iL₄*)=−15iζ(3)/512≈−0.0352165108i`, matching the displayed tensor expression. But G08 `δ_H(iL₄*)=+15iζ(3)/1024≈+0.0176082554i`. | The repaired ordinary equation is correct; its identification with the literal Hodge differential is false. |
| §§3.8–3.9 tree normalization | At `(0,1,i)`, real tree integral is `−πD(i)≈−2.8775907816`; literal M20 integral `−iD(i)/(4π²)≈−0.02320167954i`; multiplying by i gives `+0.02320167954`, as M20 (4) at −i. With the stated scalar `p=D(i)/2≈0.4579827971`, comparison constant is −2. | The new phase repairs the value line. It does not settle R01's normalization of the canonical Hodge period. |
| §3.9 all-weight phase | For m=1,2,3,4 the corrected value lines are respectively `iℝ,ℝ,iℝ,ℝ`; literal uncorrected tree is in `iℝ` in all four weights. Weight-one value at `(0,2)` is `log2/(2πi)`. | The factor `i^(m−1)` has the stated effect; this is not a claim of an independently proved all-weight comparison. |
| §3.10 collisions | Partial collision `(0,1,1+t)` gives `D(1+t)→0=D(1)`; full collisions `(0,t,it)` and `(0,t,2t)` give respectively nonzero D(i) and 0. Weight-one `(0,t)` has `log|t|→−∞`. | Full-diagonal exclusion and weight distinction are correct. |
| §§3.11–3.13 realization | At y=3, positive correlator has boundary `(1−3)∧3=2∧3`, negative gives `−2∧3`. At `(0,0,3,1,5)`, cut component is `−[3]₂∧[5]₂`, corresponding to positive model coordinate. Independent boundaries are `2∧3` and `2(2∧5)`. | Inherited computed sign controls; no injectivity is inferred. |
| §3.13 constants | Primitive weights 3,4 over ℚ have ranks 1,0; `L₃*(1)=3ζ(3)/8≠0`, while weight-four rational constant extension is 0. | Killing constants in weight four is not a general injectivity theorem. |
| §4.1 truncation | `BC₄=0`, `BC₅=C₅(4)`; `C₆(4)→C₅(3)` becomes 0 in the quotient. Mixed faces have coefficients +1 and −1, sum 0. | Correct quotient rather than subcomplex; duality sends q to m−q. |
| §§4.2–4.4 signed flags | N=4: one summand. N=5: unsigned residual `2A−2B`, signed 0. N=6: signed residual coefficients `(1−1,−1+1)=(0,0)`, unsigned `(2,2)`. | F02 repaired. The N=5 separating example is over ℚ; its characteristic-two degeneration is acknowledged. |
| §4.5 G₄ | Two projection orders on a nine-tuple give 72 terms in 36 opposite-sign pairs: coefficient sums 0. Thus `p²=0` and `δ̃π₈p=0`. | The two specified nine-term relation families have the stated domains. |
| §4.7 symbolic modules | Exact relation matrices: b₂(2,6) has 15 generators, rank 5, dimension 10; b₂(3,7) has 105 generators, rank 50, dimension 55. Three-term b₃ image is `[1]₃≠0`, but its boundary is `[1]₂⊗u(1)=0`. | Fresh ranks agree with source; weight-three evaluation correctly uses the quotient by `[1]₃`. |
| §4.8 chain coefficients | `3/28−9/84=0`; incorrect sign gives `3/14`, hence residual 3 at X=14. Previous nontrivial alternation recorded X≈−60.7015 and contributions −6.50373,+6.50373. | Arithmetic recomputed; exhaustive numerical 8! alternation inherited, not rerun. |
| §§5.1–5.2 tensor/calibration | Pair of unit factors y,y⁻¹ gives zero for corrected tensor formula. The scalar correction on inverse-pair cycles is `D(x)log²|x|−D(x)log²|x|=0`; at i it is 0 and `L₄*=5L₄/16`. | Unit-argument repair and scalar identity survive; identifying this scalar with the literal canonical period still needs R01. |
| §§5.3–5.4 residue convention | Successive residues of `t₁∧t₂∧u∧w` give `ū∧w̄` and `−ū∧w̄`; all-unit residue is 0. `dd^C log|t|=2πiδ₀`. | Inherited degree/sign controls; no silent change of d^C can repair R01. |
| §§5.5–5.6 scissors | `a₁(∞,0;1,2)=u(2)` unchanged by a lift rescaling by 3; a single determinant gains u(3). Triangle example gives both boundaries `2(2∧3)+2(2∧5)−2(3∧5)`. Four additivity coefficients `1,−9,−8,2` have signed sum 0. | Inherited exact values. Triple-ratio rescaling `T₃=3r₃` turns coefficient 1/6 into 1/18; printed 1/2 is nine times too large. |
| §5.7 relation lift (R02) | With relation u−v, lifts e,e+k give realized difference 0, combinatorial difference −k. Choosing e,e instead gives both differences 0. | Surjectivity supplies choices, not their relation compatibility. |
| §§5.7–5.8 chain lift (R02) | Let L⁰=ℚe⊕ℚk, L¹=ℚb, de=b, dk=0; M⁰=ℚe, M¹=0; ρ kills k and b. A generator g of a zero-differential source maps to e in M. Every lift e+ak has boundary b≠0, but lifted source boundary is 0. | Even a linear section need not lift a cocycle. This tests the inference used, not a counterexample to the intended Grassmannian theorem. |
| §§5.7–5.10 field interface (R03) | Generic coefficient field `ℚ(a₁₁,…,a₄₈)` has transcendence degree 32; every number field has 0. `ℚ(t)` has degree 1 of transcendence; `𝔽₂(t)` has characteristic 2, whereas all number fields have 0. | None is in §5.7's domain. All 4×4 generic minors are nonzero polynomials, so this is inside the intended generic configuration space. |
| §5.8 correction | Correct coefficient contributes `−3/28·1`, exactly the unwanted wedge coefficient. Taking coefficient 1 instead leaves a nonzero coefficient of magnitude `31/28`. | Local cancellation correct; existence of the input combinatorial cocycle still needs R02–R03. |
| §§5.9–5.10 residue/Chern degrees | Codimension-three unit term has degree `1+2·3=7`; terminal codimension-four condition degree 8. Primitive degree-seven ranks for U(3),U(4) are 0,1. | Inherited degree/nonvanishing controls; not a certification of the unsupported preceding lift. |
| §§6.1–6.2 degrees and Tate coordinate | i=1,2,3,4 gives `(7,1),(6,2),(5,3),(4,4)`. `(2πi)³=−8π³i`, so `ip/(2πi)³=−p/(8π³)`; at `[i]`, stated p≈0.3090451724 gives −0.001245897627. | Degree arithmetic and phase conversion repaired; canonical scalar identification still R01. |
| §§6.2–6.4 determinant exponent | `3r₂+(r₂−4(r₁+2r₂))=−4(r₁+r₂)`; at signature (0,1), exponent −4. | Borel supplier's Tate-divided convention matches this arithmetic. |
| Native analytic definitions | `polylog 0 1=0` by total division; `polylog 1 3=−log2−πi`; weight-two series coefficient `1/k²`. `singleValued 4` at 0,1,2 is 0 and at i is β(4)≠0. | Native bodies and endpoint/nonexample controls; inherited analytic evaluations. |
| Native units/presentation | `u(0)=u(−1)=0`, `ord₂(u(2))=1`; constant cyclic block is 2v, total 22-term expression 7v. At a=c=d=1: `3ζ(3)+4(−3ζ(3)/4)=0`. Prior three admissible-triple residuals are approximately `−2.22e−16,−1.78e−15,−2.89e−15`; swapping A,B gives −0.52104143746. | Six denominator hypotheses retained; no new numerical polylog evaluation claimed. |
| `IsCycle4` | `[i]` is a cycle since u(i)=0 and has period β(4); `[2]` has period 0 but obstruction `7ζ(3)/8≠0`; inverse-pair obstruction is 0. | Separates algebraic cycles from vanishing numerical periods. |
| §6.4, both Lean headlines | ℚ: determinant 1, `Z₄=π⁴=90ζ(4)`. ℚ(i), column `[i]`: `Z₄=π⁴β(4)/2=45ζ_{ℚ(i)}(4)`, sign reversed by conjugate embedding. Zero column gives determinant 0 and q=0. | Fresh ratio arithmetic; existence needs nonzero q, every-family permits zero, empty determinant cannot be rescaled. |
| §6.5 raw transfer | Each path sends `[x]` to `[x]₃^ind⊗u(x)`. In inductive weight four, `2[1]₄=0`, hence `[1]₄=0` over ℚ, period 0. | F03 repaired; no conclusion about an unspecified quotient map. |

For R01 the calculations use the actual Hodge bidegrees, not just suggestive names. A weight-n zero-form has bidegree (−n,−n), by G08 line 1704, and hence N-eigenvalue 2n−1, by G08 lines 1766–1775. Applying Definition 4.10 gives the coefficients above. Lemma 4.13 with s=t=n−1 gives `−(∂+∂̄)/2` for n>1. This is why the repaired angular computation with ordinary d cannot certify the Hodge-complex claim.

For the tree value, the ordinary real integral is obtained by polar coordinates: with `ρ=min(r,r⁻¹)`, the angular Fourier term is `2πρ^(2k−1)ρ′sin(kπ/2)`, and its radial integral against log r is `−1/(2k²)`. The sum is `−πD(i)`. Together with `d^C h₁∧d^C h₂=−dh₁∧dh₂`, this gives the literal imaginary value and the new phase-corrected real value. Its value line is now consistent; the full period comparison still depends on resolving R01.

### Seeded source checks

All fifteen requested locators were read against the supplied legal versions. The table separates support for a statement from the additional proof gaps above. Page numbers are those cited in the package; PDF and printed numbering differ for G00 and M20.

| Seeded target | Source text and result |
| --- | --- |
| 1.1 Raw symbols | GR (3), p.4, GR line 130; (23)–(25), p.10, GR lines 385–441; (34), p.13, GR line 537. Infinite-field rational setting, admissibility, endpoint convention and tagged generators agree. |
| 1.6 Cobracket on L₃ | GR (37)–(38), pp.13–14, GR line 567; Definition 5.3, (110), Proposition 5.4, pp.54–56, GR lines 2428–2546. Four terms and single-symbol boundary agree; the inherited specialization contract is still needed for all specialized relations. |
| 2.3 Cluster maps through dimension two | GR (94)–(99), pp.50–51, GR lines 2243–2289, and Lemmas 3.12–3.15. The package's doubled square corrects the normalization mismatch in (99); its edge computation supplies the witness. |
| 2.4 Hexagon three-cell | GR (35)–(36), p.13, GR lines 537–552; Definition 4.2, (101)–(102), p.52, GR lines 2297–2303. Six-term cell formula and quotient relation agree. The stronger raw identity with corrections was independently recomputed. |
| 3.6 Framed mixed Hodge–Tate structures | GR (183)–(184), p.76, GR lines 3503–3519; G08 §§4.1–4.2, pp.39–44 and §5. Frames, Tate indexing and good variations agree. These are extra data beyond the pinned unframed structure. |
| 3.9 Hodge correlators | M20 (3), p.3, M20 lines 102–130; (4), p.4, M20 lines 145–148; Theorem 6(a), p.13, M20 lines 626–629; G08 §11.1, pp.102–105, G08 lines 4500–4633. Phase correction is explicitly an author modification, justified by the calculation. The sources do not certify the currently conflated Hodge normalization. |
| 3.10 Collision continuity | M20 Theorem 11, p.18, M20 line 899; Lemma 29 and closing corollary, pp.44–45, M20 lines 2378–2433. Exclusion of full diagonal and retention of repeated points are supported. |
| 3.13 Realization | GR Theorem 1.13, pp.15–16, GR lines 660–671; (66)–(67), pp.28–29, GR lines 1215–1253; §5.3, pp.56–57. The package's sign transport is explicit and no injectivity is asserted. Nothing here supplies R02's inverse chain lift. |
| 4.1 Weight-four Bigrassmannian | GR (129)–(130), pp.62–63, GR lines 2826–2902; duality and (159), pp.68–69, GR lines 3170–3209. Row quotient, generic vector configurations and exchange of deletion/projection agree. |
| 4.5 Grassmannian group | GR Definition 7.5 and (161)–(164), p.70, GR lines 3223–3238. Quotient by deletion from C₉(4) and projection from C₉(5), after projectivization, agrees exactly. |
| 4.7 Symbolic Bloch modules | GR Definitions 10.2, 10.4, 10.7 and Example 10.6, pp.95–97, GR lines 4350–4417. Relation types and dimensions agree. The package correctly changes weight-three evaluation to the quotient by the nonzero constant. |
| 5.8 Generic Chern cocycle | GR (224)–(228), pp.86–87, GR lines 3890–3998; §9.3, p.93, GR lines 4236–4267. Correction coefficient is justified by the earlier wedge term. The source's intervening passage from motivic expressions to the combinatorial cocycle does not establish the required lift or generic-field scope: R02–R03. |
| 5.9 Residue extension | GR Lemmas 9.2–9.3, Corollary 9.4, pp.88–90, GR lines 4019–4125; Lemma 9.6, p.93, GR lines 4251–4267; G93 Theorem 4.5 and (4.10)–(4.11), printed p.190, G93 lines 787–815. Local formulas and degree shifts agree; the generic input remains R03. G93 OCR partly damages the theorem number, but page and equations identify it. |
| 6.2 Regulator of κ | GR Theorem 1.3(ii),(iv), pp.6–7, GR lines 230–242; Theorem 9.1, p.87, GR lines 3988–3992; §9.3, p.94, GR lines 4271–4300. Nonzero rational comparison is the intended theorem. The package's Tate division is now arithmetically correct; constructing the claimed regulator needs R01–R03. |
| 6.4 Weight-four Zagier theorem | GR Theorem 1.2, p.5, GR lines 196–200; §9.3, p.94, GR line 4292. General number fields and every-family rationality agree; the package's nonzero rational multiplier correctly handles the totally real empty determinant. |

Other checked proof inputs include G09 Definition 4.1 and Theorems 4.2–4.3, pp.22–24, G09 lines 930–997; its coproduct warning at p.18, G09 lines 742–768; G00 §2 and Proposition 2.3, PDF pp.5–6, G00 lines 178–221, and Theorems 3.2–3.3, PDF pp.12–14, G00 lines 550–593; G93 Theorem 4.6, printed p.191, G93 lines 831–860. The source claim of general infinite-field K-comparison was compared with its number-field-only motivic step, not accepted solely from the theorem heading.

### Pinned libraries and duplication by object

Pins inspected: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following are library-relative paths opened at those pins.

| Object | Declaration/file evidence; boundary of what it supplies |
| --- | --- |
| Finite symbol sums | `Mathlib/Data/Finsupp/Defs.lean:89`, `Finsupp`, finite support; `Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean:54`, `Finsupp.linearCombination`. |
| Presentations | `Mathlib/LinearAlgebra/Span/Defs.lean:46`, `Submodule.span`; `Mathlib/LinearAlgebra/Quotient/Defs.lean:61`, :227, `Submodule.Quotient.mk`, `Submodule.mkQ`. Quotients exist; Bloch relations are not furnished by these declarations. |
| Units/tensors/exterior powers | `Mathlib/Algebra/Group/TypeTags/Basic.lean:50`, `Additive.ofMul`; `Mathlib/LinearAlgebra/TensorProduct/Basic.lean:122`, `TensorProduct.lift`; `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:79`, `ExteriorAlgebra.exteriorPower`; `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:56`, `exteriorPower.ιMulti`. |
| Determinants | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63`, :97, :141, `Matrix.det`, `Matrix.det_isEmpty`, `Matrix.det_mul`; empty determinant is 1. |
| Lie inputs | `Mathlib/Algebra/Lie/Free.lean:121`, `FreeLieAlgebra`; `Mathlib/Algebra/Lie/Derivation/Basic.lean:43`, `LieDerivation`. Neither defines the reduced cyclic shuffle or correlator coalgebra. |
| Homology/resolutions | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226`, `groupHomology`; `Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean:41`, `CategoryTheory.ProjectiveResolution`; `Mathlib/CategoryTheory/Abelian/Projective/Resolution.lean:92`, `ProjectiveResolution.lift`. The last takes two projective resolutions, not any acyclic flag target. |
| Number fields | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50`, `NumberField.dedekindZeta`, ideal-norm L-series; `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36`, :41, discriminant and nonvanishing. The square-root denominator is nonzero. |
| Places | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, :188, :437, :441: `embedding`, `IsComplex`, `nrRealPlaces`, `nrComplexPlaces`. Rows and columns use the same finite complex-place subtype. |
| Analytic bodies | `Mathlib/NumberTheory/Bernoulli.lean:197`, :207: `bernoulli`, `bernoulli_one=−1/2`; `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean:30`, `Arg.lean:30`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean:655`. Total logarithm and integral conventions match the native definitions. |
| Near-matches | `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:232`, `riemannZeta_four`; `Mathlib/NumberTheory/ZetaValues.lean:458`, `hasSum_zeta_four`; `Mathlib/NumberTheory/NumberField/Units/Regulator.lean:225`, :315, unit regulator; `Mathlib/RingTheory/Trace/Basic.lean:410`, `embeddingsMatrix`; `Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean:67`, `logTaylor`. None proves either general K₇/polylogarithmic determinant headline. |
| Existing Hodge structures | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, `Mixed/Category.lean:56`, `Mixed/Abelian.lean:33`, `Mixed/Strictness.lean:110`, `Tate/Basic.lean:93`: `TauCeti.Hodge.MixedHodgeStructure`, its category/abelian structure, `Hom.range_inf_F_eq_map_F`, and `TauCeti.Hodge.tate`. The structure contains bounded filtrations and purity of graded pieces, not frames, variations, periods or the finiteness of a good variation. |

Object searches in both pinned trees, main roadmaps, board packages and available open heads covered polylogarithms, Bloch groups, cyclic shuffles, special derivations, generic decorated flags, Grassmannian configurations, framed Hodge–Tate structures, correlators, scissors congruence, Stasheff complexes and regulators. The supplied library-match leads were checked against the actual pinned declarations. The board package index was read before making ownership claims: its other entries are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. No conflicting fully qualified name or second owner for the retained weight-four construction was found. FukayaTheory's geometric compactified-disc associahedra differ from the finite combinatorial cell construction here; ColemanIntegration's p-adic objects differ from these complex periods. Imported flags, explicit weight-three groups, analytic functions and Borel normalizations remain assigned to the earlier owners below.

### Supplier resolution and order

Every external supplier citation in Scope, contracts and Needs lines was resolved at main or the supplied head of a new-roadmap pull request. These are current file locators, excluding the show tool's extra header line.

| Supplier | Resolved sections and evidence |
| --- | --- |
| PolylogarithmFunctions, main | `TauCetiRoadmap/PolylogarithmFunctions/README.md:105`, :540, :625, :641, :697, :719, :806: §§1.1, 4.2, 4.6–4.7, 5.1–5.2, 5.7. Analytic formulas, lower cut, Bernoulli normalization, functional equations; their weight hypotheses are retained. |
| Polylogarithms, PR #1424 | `TauCetiRoadmap/Polylogarithms/README.md:136`, :152: §§2.1–2.2, descent and rational primitive Hurewicz. At :310, :342, :377: §§3.1–3.3, explicit relations, universal tests and residues. At :396, :415, :500, :519: §§3.4–3.7, configurations/flags, ratios, duality and homology maps. |
| Polylogarithms, continued | Same file :575, :598, :625, :642, :672, :691, :715: §§4.1–4.7, inductive objects, analytic descent, determinant calibration, explicit cycles, obstruction and totally real theorem. At :831, :852, :999, :1027, :1114: §§5.1, 5.2, 5.4, 5.5, 5.9, current/regulator inputs. |
| K3BlochGroups, PR #1430 | `TauCetiRoadmap/K3BlochGroups/README.md:581`, :608, :682, :717, :806: §§3.2–3.5, 3.8. Ratios, pre-Bloch group and boundary. Supplier boundary `x∧(1−x)` is explicitly negated here; ratio permutations are stated. |
| BorelRegulators, PR #1461 | `TauCetiRoadmap/BorelRegulators/README.md:170`, :266, :286, :639, :661, :723, :794: §§1.1, 2.2–2.3, 5.3–5.4, 6.0a, 6.2. Tate-divided coordinates, rank/injectivity, exponent `dₙ−Nn` and `r_Bo=−2r_Be` agree with the arithmetic in §§6.2–6.4. |
| MotivicEtaleKTheory, PR #1470 | `TauCetiRoadmap/MotivicEtaleKTheory/README.md:397`, :420, :650: §§3.3–3.4, 7.1. Logarithmic Deligne complex for smooth separated finite-type varieties; Chern character retains smooth quasi-projective scope. The small Deligne model has its own signed projection differential; it cannot silently be identified with G08's dg model. |
| PeriodsAndSpecialValues, PR #1496 | `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:751`, :2084, :2189, :2210, :2230: PS.3.0, PS.9.3, PS.9.8–PS.9.10. PS.9.3 regularizes the 0,1 iterated integrals; PS.9.8–PS.9.10 have ℚ/ℤ and three-puncture scope. The declared gaps below broaden these, but still only to number fields, not R03's function fields. |
| MotivesAndAlgebraicCycles, PR #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:536`, :555, :1116, :1130, :1149: §3.6, Layer 4, §§6.1–6.3. Neutral fiber functors, geometric motives, reconstruction, Hopf algebra and functoriality. No numerical-semisimplicity substitute for reconstruction is used. |
| HodgeStructures, completed main | `Completed/HodgeStructures/README.md:326`, Layer L2, together with the pinned implementations above. The frames, variations and period structure are additional constructions owned here. |

The four declared gap slugs match between README and `design/plan.json`, have named earlier suppliers, and are coherent, precise extensions rather than already supplied results:

- `trilog-specialization-closure`: Polylogarithms §3.1, algebraic specialization closure of admissible coordinate relations over F(t).
- `mixed-tate-number-fields`: PeriodsAndSpecialValues PS.9.8–PS.9.9, mixed Tate heart with the specified Ext, primitive and Hodge-realization comparison over every number field.
- `punctured-line-path-torsors`: PeriodsAndSpecialValues PS.9.10, arbitrary finite rational punctures and tangential groupoids over number fields, with the stated realizations and action.
- `decorated-flag-lengths`: Polylogarithms §3.4, all lengths 1≤k≤N, pre-coinvariant acyclicity and comparison/naturality/homotopy/stabilization. A generic projective-resolution lift alone does not already provide this.

No finding treats those declared contracts as unowned merely because they are unimplemented. R03 concerns a different, undeclared generality. The supplied overlaps ledger has no conflicting head changing this package, no dropped cited ID, no revision-only cited ID and no dropped package ID needing an old-to-new map. The nearest heads—Polylogarithms #1424, BorelRegulators #1461, K3BlochGroups #1430, PeriodsAndSpecialValues #1496 and ColemanIntegration #1043—were inspected by object. No new overlap finding was established. The residual broad wording about flags in Polylogarithms' Scope is not a second flag construction here; the precise ownership in this package and the supplier's §3.4 agree.

Fresh citation resolution reported no unresolved cross-roadmap citations or own Lean names. That tool could not check libraries on its host, so the local pin reads above were used. The mandated dependency check returned:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file, source package input or content-repository file was edited.

## Not verifiable

- No cited source was inaccessible; no missing-reference request is needed. G93's damaged OCR theorem label was resolved by its printed page, equations and adjacent Theorem 4.6.
- The four supplier gaps are future contracts. Their precision, ownership, nonredundancy and declarations were checked; their fulfillment is not an existing pinned implementation.
- The full degree-eight 8! numerical alternation and unchanged numerical polylogarithm/scissors evaluations were inherited only where the previous review records computed values. This round reran the heptagon collections, symbolic-module ranks and new normalization arithmetic; it does not claim a new exhaustive analytic or symbolic proof of every target.
- The all-weight numerical-correlator/canonical-period comparison cannot be certified from the inconsistent normalizations currently combined in the package; R01 gives explicit failures. R02–R03 likewise prevent certifying the construction of the generic Chern cocycle, independently of source availability.
- Ownership was checked against the supplied main, board and available open-head files. Unprovided heads were not sought independently. The supplied overlaps ledger is the evidence for its mechanical categories.

## Source issues

- **Error** in GR at (187)–(192), printed pp.76–78, GR lines 3544–3607: the source identifies ordinary-form coefficients with the cited Hodge dg-algebra product and differential; it should specify a compatible comparison or use G08's coefficients and differential; affects a stated result.
- **Error** in GR at (192), printed p.78, GR line 3600: the source differentiates the trilogarithm of the unit argument; it should differentiate the symbol argument and multiply by the unit logarithm; affects a stated result.
- **Error** in GR at (99), printed p.51, GR line 2284: the source leaves the square undoubled after doubling the edge normalization; it should double the square with the compatible orientation; affects a stated result.
- **Gap** in GR at §9.3 item 2, printed p.93, GR lines 4240–4243: the source passes from motivic correlator expressions to a combinatorial chain map; it should prove relation-compatible lifting and equality of the full combinatorial cobracket; affects the proof.
- **Gap** in GR at Theorem 1.3(i) and §9.3 item 2, printed pp.6 and 93, GR lines 230 and 4239: the source states infinite-field maps but invokes number-field motives for the lift; it should supply the lift over the other infinite fields, including generic coefficient fields; affects the proof.
- **Gap** in GR at Lemma 5.2(ii), printed p.54, GR lines 2423–2427: the source uses specialization to identify presentations; it should justify closure of the coordinate-relation subgroup under those specializations; affects the proof.
- **Misprint** in GR at §9.3 item 2, printed p.93, GR line 4247: the source omits the double-symbol correction coefficient; it should include the coefficient −3/28 of the configuration-map wedge term; affects nothing.
- **Error** in GR at §9.3 item 1 and footnote 24, printed pp.91–92, GR lines 4177–4185: the source uses coefficient 1/2 with its triple-ratio normalization; it should use 1/18 to recover G00's map; affects a stated result.
- **Error** in GR at Theorem 1.2, printed p.5, GR lines 196–200: the source asserts exact determinant equality for all number fields; it should allow a nonzero rational multiplier for the empty determinant, giving ratio 90 over ℚ; affects a stated result.
- **Error** in GR at Definition 10.7 and evaluation, printed p.97, GR lines 4397–4412: the source evaluates the constant-free three-term quotient in B₃; it should evaluate in B₃ modulo ℚ[1]₃ or after the cobracket; affects a stated result.
- **Error** in M20 at (3), printed p.3, M20 lines 110–130: the source assigns its literal tree integral the weight-dependent real line; it should correct the phase, since ordinary integration in weight two gives a nonzero imaginary value; affects a stated result.
- **Error** in M20 at (4) and the example after (16), printed pp.4 and 18, M20 lines 145–148 and 889–895: the source gives dilogarithm values differing by a factor −2; it should reconcile both with one integral and period normalization; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a129016b43ee1f3f3d4c4a6d8ff9fabe68d5aeef", "job": "REV-PKG-ZagierConjecturePolylogarithms~4", "model": "gpt-6-astra", "worker": "chris-10"} -->
