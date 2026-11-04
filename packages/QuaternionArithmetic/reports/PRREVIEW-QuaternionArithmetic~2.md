# Review of QuaternionArithmetic (pull request #1722 at c060b6d)

**Verdict:** needs changes

## R01 (P1) — Exclude the identity from the involution fixed-point formula

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:1377`, “`# Fix(w_m) = ∑_S m(S,O;O^×)`”; also the degree-two Riemann–Hurwitz formula at line 1384.

**Claim:** These formulas apply to the Hall divisors introduced in §8.5, which include 1. No nonidentity hypothesis is imposed in §8.6.

**Witness:** At D=6, N=1, m=1, w₁ is the identity. Its fixed locus is the entire complex curve, hence infinite. The displayed embedding sum is m(ℤ[i],O;Oˣ)=2.

**Repair:** Require m>1 in the fixed-point and degree-two quotient statements. Give m=1 its own identity-map Check: quotient degree 1, unchanged genus, whole fixed locus. Retesting m=2,3,6 gives fixed counts 2,2,2 and quotient genus 0 in each case. The identity case also invalidates the asserted enumeration of possible traces: t=±1 satisfies t²<4m when m=1.

## R02 (P1) — Use the image of the polarization stabilizer in the orbit count

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:1455`, “`∑_S m(S,O;O^×)·#Aut_μ(O)/2^{ω(DM)}`”.

**Claim:** The preceding sentence correctly identifies the stabilizer as the image of Autμ(O) in W=N(O)/(ℚˣOˣ), but the formula substitutes the cardinality of Autμ(O) itself. Those cardinalities need not agree, even under the stated order-two condition.

**Witness:** Use §9.10's D=21, δ=21, μ=21i′, with optimal ℤ[i′]⊂O. Autμ={1,[i′]}, but i′∈Oˣ. Four embedding classes form one W-orbit; the formula gives 4·2/4=2.

**Repair:** Sum stabilizer-image cardinalities over the embedding classes and divide by |W|. A constant factor is permitted only after proving it is constant; replacing image cardinality by |Autμ| additionally requires trivial intersection with the image of Oˣ. Here the local embedding product is (1−(−4|3))(1−(−4|7))=4. Nonmaximal orders of conductor dividing 21 contribute zero at a division prime. The corrected count is 4·1/4=1. At D=6, δ=1 the image has order 2, retaining the intended count 2·2/4=1. Add the D=21 case as a negative control.

## R03 (P1) — The cited canonical-model supplier does not supply the enhanced Galois interpretation

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:1607`, “Record the meaning, consumed from R18.1”; also lines 1621–1623 and the `torsion`/`galEnd` rows of §10.2.

**Claim:** R18.1 is said to identify the enhanced fixed module with rational torsion and the automorphism projection with the endomorphism-field action.

**Witness:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:1627` explicitly excludes a general abelian moduli interpretation of that exact G_B. R18.1.7–8 supplies an auxiliary PEL bridge, not the asserted enhanced representation or these integral identifications.

**Repair:** Retain the group-theoretic invariants, but make their arithmetic comparisons owned targets with exact hypotheses and inputs. Alternatively declare separate precise supplier gaps, in both plan and supplier contracts, for the Galois-equivariant O/NO torsion identification and for the endomorphism-action comparison. Do not describe either as already supplied by R18.1. The first comparison must specify its QM surface, field, integral module identification, action convention and image H; the second must specify the geometric endomorphism order and the kernel defining its field. Test the resulting identification at D=15, M=N=2, residue-unit H: the invariant module has four elements, so it must identify with four rational 2-torsion points, not merely an abstract curve uniformization. No declared gap currently covers this.

## R04 (P2) — Add finite residue fields to the numerical local-unit counts

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:687`, “where `q = N𝔭`”.

**Claim:** §2.4 gives finite numerical indices and kernel cardinalities for the standing Dedekind-domain scope. Unlike §§1.7 and 6.2, it does not assume a finite residue field.

**Witness:** R=ℝ[[t]], O=M₂(R), 𝔭=(t) satisfies the standing hypotheses. Oˣ/(1+tO)≅GL₂(ℝ) is infinite; there is no finite integer q=N𝔭 for the displayed polynomial count.

**Repair:** Keep the residue-algebra/Eichler-symbol definition over the general complete DVR. Require finite k=R/𝔭, q=|k|, only for the numerical counts and λ factors, and propagate this to uses of those formulas. For q=2 the four displayed values are 6,4,12,8; for q=3 they are 48,36,72,54. These agree with the residue-algebra counts. The infinite-residue example is excluded from counting, not from order theory. Voight 24.3.12 introduces q as the residue cardinality (`voight line 16895`); its proof counts GL₂(k) and finite radical quotients.

## R05 (P2) — Import the existing tree and native quaternion identities

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:594`, “prove it is a tree”; also §0.1, lines 345–351.

**Claim:** §1.12 constructs the generic lattice tree before its order comparison, while §0.1 lists native norm and equivalence identities as new proof targets.

**Witness:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:3647` already owns this exact lattice graph and `BTTree.isTree`. `TauCeti/Algebra/Quaternion/NormForm.lean:130,146` and `AlgEquiv.lean:93,114` already prove the listed native identities.

**Repair:** Consume ReductiveGroupsPartII RG2.2.2, “sl2-tree”, for the carrier, adjacency, tree theorem and action. Retain the genuinely additional map [L]↦End_R(L), its order stabilizers and distance/level comparison here. Delete native proof targets from §0.1 and cite the declarations in supplier contracts; retain only additional arithmetic comparisons. At R=ℤ₂ the supplied vertex R² has three neighbors, while the retained adapter sends R² and R⊕2R to maximal orders meeting in O₀(2), of level 2. For the norm identity in ℍ[ℚ,3,−1], nrd(i)nrd(j)=−3=nrd(ij). These inputs are earlier or pinned, so this repair introduces no upward edge. This is the remaining part of previous R23, not rejection of the new quaternion-order scope.

## R06 (P2) — State the available existence and saturation headlines

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:1447`, “every maximal order has a principal polarization μ ∈ O with μ² = −D”; `TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:11` and its Layer 9; also README §2.3 at line 670.

**Claim:** Principal-polarization existence and unique Gorenstein saturation are neither stated in Lean nor listed as unavailable in the module docstring. Their carriers and predicates already exist in the file.

**Witness:** A scratch copy elaborates the theorem with O:QuatOrder a b ℤ, ¬IsDefinite a b, IsMax O, and conclusion ∃μ∈O, IsPolarization O μ ∧ μ²=algebraMap ℚ B (−discNat a b).

**Repair:** Add that headline, with sorry, in Layer 9 and name it in the README. It requires no additional definition or stand-in. Voight 43.6.6–7 (`voight line 34061`, printed p.802) supplies existence and the trace condition. The D=6 witness μ=i+3j has square −6 and trace pairings (0,6,−6,0) on the displayed order basis; thus the existing IsPolarization predicate applies. Both scratch probes passed under default options with only sorry warnings. For §2.3 the general Dedekind/characteristic-zero statement is already expressible as a unique pair P : Ideal R × QuatOrder a b R, with P.1≠⊥, IsGorenstein P.2, and O.toSubmodule = Submodule.span R {1} ⊔ P.1 • P.2.toSubmodule. State it too, without new carriers. For O=ℤ+2O₆ the unique pair is ((2),O₆), giving discriminant48; for O₆ it is ((1),O₆), giving6.

## R07 (P2) — Replace the unspecified change-of-level fibre bound by a theorem

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:844`, “with fibres of size controlled by `[O^× : O'^×]`-type indices”.

**Claim:** “Controlled by” and “-type” give neither a bound nor an equality, and omit the stabilizer attached to the target ideal class. An implementer cannot determine the promised theorem.

**Witness:** For Hurwitz H and an Eichler suborder E of level 7, the local unit index is 8 and the global unit index is 24/6=4, while the class-set map has its single fibre of size 2.

**Repair:** State the fibre over an adelic representative g explicitly as Γ_g\Ôˣ/Ô′ˣ, where Γ_g=(g⁻¹Bˣg)∩Ôˣ acts on Ôˣ/Ô′ˣ, and derive any numerical bound from this finite orbit set. Include the representative-independence comparison. In the level-7 example the eight local cosets have two orbits of size four, giving fibre size 2. If only surjectivity is intended, delete the unspecified bound. Cite the exact finite-level quotient/volume result, not just AA.5.3 as a whole.

## R08 (P3) — Complete per-definition APIs and discriminating Checks

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:461` (§1.2), §1.3 at 470, §1.4 at 478, §1.9 at 550, and §2.4 at 684.

**Claim:** The new global headings and layer endings are present, but these definitions still lack their required API bullet lists and three discriminating Checks. The same problem occurs for later definitions, including AL(O) in §3.7.

**Witness:** §1.2 ends after one prose paragraph and its Needs line; it has zero Checks. §1.4 likewise defines both traceDual and codiff without a Check list.

**Repair:** Supply prose API bullets and at least three discriminating computations per definition. For units: Hurwitz Oˣ/O¹ has size 1; indefinite O₆ has size 2; scalar 2 has norm 4 and is not an integral unit. For trace dual: L♯=(1/2)L for the Lipschitz order, M₂(ℤ) is self-dual, and (2L)♯=(1/4)L. These distinguish normalization, integrality and scaling. Also remove the dated “landed” wording at lines 312–316 and the “checked in Sage” process remark at line 1464. These repairs belong in the README, not as Lean padding.

## R09 (P3) — Supply the missing source records and exact locators

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:584` (§1.11), §4.6 at 920, and §10.2 at 1685; folder bibliography at 1861.

**Claim:** There is still no sources.toml. Several targets have no claim-level source locator, and the page-coverage table names database columns without an inspectable schema/version locator.

**Witness:** §1.11 cites Module.Free for basis existence but gives no locator for a basis beginning with 1 or the stored discO identification. §4.6 has only internal Needs; §10.2 has only column names.

**Repair:** Add one source record per work, preserving the cited Voight v0.9.28 numbering. Give §1.11 its index/discriminant locators and the primitivity argument for 1; identify §4.6 as a corollary of the norm and normalizer sequences with their exact locators. Cite the database knowls/schema for §10.2 and record inaccessible texts honestly. Retesting ℤ+2O₆ gives index 8 and reduced discriminant 48=8·6; §4.6 gives positive-normalizer quotient size 4 at D=6. These mathematical checks do not certify a live database schema.

## Verified sound

The following records distinguish computations and resolved contracts from the defects above. They are not an assertion that every theorem has been proved. No file in the pull request was changed.

**Previous findings, checked first against this head.** The quoted fragments are from this head. Twenty-five specific findings are repaired; R23, R27 and R28 are partly repaired. No supplied repair report marks a finding “not actionable in this package”.

| Previous finding | Passage in this head | Assessment and witness |
| --- | --- | --- |
| R01 cubic discriminant | §1.5: “δ(I) = (I ∩ F)cubic(I)” | Repaired: for 2L, δ=64, cubic=32, scalar ideal=(2); disc=4096=64². |
| R02 improper ideals | Lean:296: “rightOrder_eq” | Repaired: M₂(ℤ) over O₀(2) is excluded; 2O₀(2) has index16 and norm4. |
| R03 index direction | §1.5: “relative index of L's additive subgroup in H's” | Repaired: [H:L]=2 and 4=2·2; old erroneous headline is absent. |
| R04 arbitrary DVR division | §1.7: “which need not be two” | Repaired for the reported division claim: Hamilton(ℝ)((t)) has e=1, discriminant unit; finite residue is now explicit for e=2 and §6.2 division counts. R04 above concerns a different remaining count. |
| R05 wrong local symbols | §2.7: “residue division fields 𝔽₄ and 𝔽₉” | Repaired: O₆ at2,3 has counts12,72. |
| R06 Pic quotient | §3.6: “{aO : a ∈ Fˣ}” | Repaired: for M₂(ℤ[√−5]), Pic has size2, not1. |
| R07 level norm | §3.6: “norm 𝔭ᵉ at a level prime” | Repaired: at level4, determinant−4 and square4I. |
| R08 zero norm | §4.4: “nonzero” | Repaired: 0 excluded; −1 remains represented in the indefinite case. |
| R09 Brandt transpose | §7.1: “matrix T(𝔫)ᵗ” | Repaired: T₂δ₁=(1,2), A₂δ₁=(1,3), weighted cross terms6=6 and1=1. |
| R10 one double coset | §7.5: “A norm ideal alone does not specify one double coset” | Repaired: norm9 at3 contributes12+1=13, central type contributes1. |
| R11 CM orientation | §8.9: “modulo precomposition by complex conjugation” | Repaired: O¹ count4 becomes2 points; §6.1 retains selected CM type for the modular comparison. |
| R12 normalizing μ / split algebra | Lean:574–575: “hdiv”, “hnormal” | Repaired: general cardinality includes1,3; stronger theorem includes normalization; μ=i+4j has norm13 and fails normalization. |
| R13 enhanced image | §9.4: “image(Oˣ)·Aut±μ(O)” | Repaired: D14 image≤2 while full W has size4. |
| R14 base genus | §9.6: “(2g(X_G) − 2)” | Repaired: degree1 has zero ramification; at base genus1, both sides0. |
| R15 fixed torsion | §9.7: “y(u−1) = 0” | Repaired: Eichler residue at2 has four fixed elements, split M₂(𝔽₂) has one. |
| R16 invalid (D,N) | Off-hypothesis Checks: “D = 15 and level 4” | Repaired: gcd=1, genus5; (6,4) explicitly rejected. |
| R17 definite normalizer | Off-hypothesis Checks: “has order 4/2 = 2” | Repaired: two class orbits, stabilizer2; unit index4 differs from ψ(7)=8. |
| R18 twisting reversed | §9.1: “exactly in the twisted case” | Repaired: k anticommutes with μ=i+3j; untwisted sign classes stay distinct. |
| R19 Fuchsian supplier | §8.1: “TeichmullerGeometry §9.1” | Repaired: actual arithmetic-lattice statement resolves; rational covolume owned at §8.2. Generic tree duplication is R05 above. |
| R20 Hurwitz supplier | §1.8: “AdelicAlgebraicGroups §5.3” | Repaired: supplier has one class,24 units,mass1/12. |
| R21 module build | Lean:1: “module” | Repaired: direct elaboration and recorded targeted gate pass. |
| R22 missing mass headline | Lean:409: “theorem eichler_mass_formula” | Repaired: proper complete class representatives give mass1/12 at D2. |
| R23 duplicated theory | Contracts: “generic order, multiplier-order … results are consumed” | Partly repaired: CAC comparisons replace the major duplicates; native identities and lattice tree remain R05. |
| R24 computational classification | §5.5: “as a mathematical classification” | Repaired: the target counts24 isomorphism classes; computational-certificate route removed. |
| R25 wrong transfer level | §7.5: “the Eichler level is 𝔑/𝔇” | Repaired: level11 newform transfers to D11, level1; arbitrary local types and norm characters retained. |
| R26 padding | Docstring: “Only native bundles and definitions needed by those statements” | Repaired: old controls removed;16 substantive theorems, none closed by the one-tactic probe. |
| R27 README shape | “Scope and ownership”, “Examples”, “Dependencies” | Partly repaired: global shape and11 layer endings present; per-definition omissions remain R08. |
| R28 source documentation | References: “author edition v0.9.28” | Partly repaired: Voight version and Rotger link are useful; missing manifest/locators remain R09. |

**Gate, pins and signatures.** The supplied gate at this exact head reports all checks zero and `OK`, including the targeted build, outside-folder and stray-file checks. A fresh direct elaboration of `TauCetiRoadmap/QuaternionArithmetic/Suggested.lean` exited 0 with exactly 16 sorry warnings and no other warning. The worktree stayed clean; the diff outside this folder is empty. There are no sorry-valued data definitions, set_option directives, admitted examples, forbidden imports, or fully qualified names colliding with a sibling namespace in the inspected ownership results.

Mathlib is pinned at `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti at `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. I generated and elaborated `#check @name` for all 62 actual declarations (including the named instances), and compared their types with the README. The worker's count of 64 includes two scanner tokens from prose, `-number` and `representatives`. Its 25 dropped-binder leads do not expose a false theorem here: simple native definitions legitimately use fewer hypotheses, while theorems that need characteristic zero, a number field, division or normalization retain them. In particular `IsEichler.isBass`, `finite_classSet`, and both polarized-automorphism signatures keep their needed binders. No change to the target file was made.

The one-tactic simplifier probes left all 16 target theorems admitted; inspection of the definitions and pinned APIs found no one-lemma or definitional proof of those headlines. The extra warnings in the scratch probe concern unsuccessful/unreachable probe tactics, not the target file. No current padding declaration is reported. The separate principal-polarization and Gorenstein-saturation probes establish R06's statability, not their proofs.

The required dependency check returned:

```text
depcheck: 204 roadmaps, 1600 edges, 0 problem(s)
```

No UPWARD or CYCLE line was produced. Every Needs line was read. This coarse result does not resolve missing ownership such as R03 or the unspecified statement in R07. Later consumers are kept out of the supplier direction. The earlier-owner repair for the tree in R05 is compatible with this order.

**Seeded source sample: all 15 targets.** Voight was read in the explicitly cited 2021 author edition v0.9.28, rather than assuming newer numbering. Printed pages below are not PDF page indices. There are no README locators explicitly flagged “unverified”; inaccessible texts are listed separately below. Statements were checked against hypotheses, not merely located by number.

| Target | Source text and locator inspected | Outcome |
| --- | --- | --- |
| 1.3 Discriminants | Voight 15.2.2, 15.2.6–7, 15.2.10, 15.2.14–15; printed pp.234–237; `voight line 10464`, `10480`, `10511`, `10545`, `10560` | Trace determinant, projective-lattice transformation and index-square law agree. Char0 supplies separability. The cubic/determinant distinction is correctly repaired in §1.5. |
| 1.9 Eichler orders | 23.4.1–3, printed p.372; `voight line 15964` | Intersection definition and local split form O₀(𝔭ᵉ) agree, including e=0. |
| 1.10 Level/genus | 23.4.19–21, printed p.375; `voight line 16209` | Coprimality with the algebra discriminant and one genus per level agree. The local unit index retains the division/split distinction. |
| 1.11 Integral bases/index | 15.2.15, printed p.237; `voight line 10560` | Index/discriminant consequence verified. A basis starting with 1 additionally uses primitivity of ℤ⊂O, not freeness alone. No source/schema locator is attached to the stored discO claim: R09. |
| 2.3 Gorenstein saturation | 24.2.15, 24.2.22, printed pp.385–387; `voight line 16649`, `16705` | Unique Gorenstein overorder and conductor formula agree; the proof gives the primitive ternary-form factor. |
| 2.4 Eichler symbol/unit counts | 24.3.1–2, 24.3.12, printed pp.388–391; `voight line 16739`, `16895` | Four finite-residue counts agree. General-DVR numerical scope needs R04; the radical inclusion in the source proof has the misprint recorded below. |
| 3.10 Norm-ideal counts | 26.3.4, 26.3.9, 26.4.1, printed pp.424–427; `voight line 18303`, `18348`, `18392` | Genus invariance, coprime multiplicativity and maximal split/division local counts agree. Nonzero ideal convention is essential. |
| 4.6 Positive normalizer | 28.9.17, 28.9.21, printed pp.486–487; `voight line 20829`, `20856` | Over ℚ and under Eichler's condition, a norm−1 unit adjusts the sign. −1 lies in O¹, so using positive scalars gives the same quotient. Add the corollary locator, R09. |
| 6.2 Maximal embedding numbers | 30.5.3, 30.5.5, printed pp.540–541; `voight line 23340`, `23410` | Split conjugacy count1, finite-residue division counts1 or2, and nonmaximal quadratic-order obstruction agree. Finiteness uses the stated arithmetic group context; the source's proof uses finite-index central quotient. |
| 6.6 Eichler class number | 30.1.5, printed p.531; `voight line 22961`; 30.8.6, printed p.550 | Rational corrections and vanishing when 4 or9 divides the level agree. Since gcd(D,M)=1 and D is squarefree, testing DM or M for those square factors is equivalent. |
| 6.8 Type number | 30.9.1–2, printed p.551; `voight line 23965` | Type classes are Pic orbits, not division of cardinalities by a constant. The Deuring formula and p≥5 restriction match. |
| 7.1 Brandt definition | 41.2.3–7, printed pp.751–752; `voight line 32045`, `32058`, `32076` | Column-source counts and the Oᵢˣ element quotient agree. The README now explicitly uses the transpose on functions. |
| 8.4 Genus | 39.4.20, printed p.726; `voight line 30965` | Division, indefinite rational algebra, Eichler level prime to D and the elliptic corrections match. |
| 9.6 Enhanced genus | §8.2 normalization from 39.2.6, 39.2.14, pp.720–722 (`voight line 30725`, `30760`); FuchsianOrbifolds Layer 5.3 | Derived from finite-index area scaling and Riemann–Hurwitz with the actual base genus. Direct numeric checks below agree. The unrelated arithmetic moduli claim remains R03. |
| 10.2 Page coverage | Cited LMFDB knowls, including polarized_order, enhanced_group, label, index and is_coarse | Not certified: fetched files contain only the browser challenge (`lmfdb_label line 5`, `lmfdb_polarized_order line 5`). Internal formulas were tested; actual columns and stored representatives were not read. |

Further source checks: Voight 43.6.6–7, printed p.802 (`voight line 34061`) supports the missing existence headline; 41.5.2 and 41.5.8 support the corrected conductor sum, whereas 41.1.13 (`voight line 32006`) has the error below. Dembélé–Voight arXiv:1010.5727v2, Theorem 3.9 and Remark 3.10, printed pp.11–12 (`dembele_voight line 583`, `600`), supports coprime level and transfer, not a universal Eichler model for every ramified local type. The author copy of Rotger and institutional OCR of Pizer 1976 were obtained and their identity/scope checked; they were not substitutes for the sampled Voight locators.

**Pinned-library audit by object.** Native objects were searched in both pinned trees, not only under proposed declaration names. The following declarations and their surrounding hypotheses were opened. IsLattice supplies finite generation and spanning; it does not assert discreteness. IsCofinite supplies discreteness and finite covolume; it does not itself assert compactness. Natural-valued indices return 0 at infinite index. These distinctions were retained in the computations.

| Pinned file | Declarations/lines inspected and consequence |
| --- | --- |
| `Mathlib/Algebra/Quaternion.lean` | `swapEquiv`:539, `self_add_star`:608, `mul_star_eq_coe`:662. Symbol algebra, not an abstract unmarked quaternion carrier. |
| `Mathlib/Algebra/Module/Lattice.lean` | `Submodule.IsLattice`:67, fields fg and span_eq_top. Zero submodule in a quaternion field-space fails spanning. |
| `Mathlib/GroupTheory/Index.lean` | `Subgroup.index`:55 and `relIndex`:62; the latter counts H∩K in K, fixing the index direction. |
| `Mathlib/NumberTheory/NumberField/DedekindZeta.lean` | `dedekindZeta`:49 and `tendsto_sub_one_mul_dedekindZeta_nhdsGT`:77; native ideal-norm series and residue. This file alone is not a citation for the Euler product. |
| `TauCeti/Algebra/Quaternion/NormForm.lean` | normForm:78, apply:84, coordinate formula:88, normForm_mul:130, isUnit_iff_normForm_isUnit:146, anisotropic_normForm_iff:158, pure norm:175. R05 removes duplicate proof targets. |
| `TauCeti/Algebra/Quaternion/AlgEquiv.lean` | reducedTrace_eq_of_algEquiv:93, map_star_of_algEquiv:105, normForm_eq_of_algEquiv:114; regularity of 2 is explicit and follows in the stated char0 field. |
| `TauCeti/Algebra/Quaternion/Split.lean`, `SymbolEquiv.lean`, `Steinberg.lean` | oneEquivMatrix:121, aNegAEquivMatrix:219; rescaleJEquiv:226, normMulEquiv:426; steinbergEquivMatrix:126. Nonzero parameters/invertible scalings are preserved. |
| `TauCeti/Algebra/Quaternion/SplittingCriterion.lean`, `BaseChange.lean`, `BrauerClass.lean` | nonempty_algEquiv_matrix_tfae:156, baseChangeTwoParams:142, quaternionClass:94. They already own field-level splitting/base change. |
| `TauCeti/NumberTheory/HilbertSymbol/Basic.lean`, `Archimedean.lean` | hilbertSymbol_congr_sq:146, splitting equivalence:201, comm:228; hilbertSymbol_real:59. |
| `TauCeti/NumberTheory/QuadraticForm/Global/Localization.lean`, `HilbertSymbol.lean` | unitAtFinitePlace:41, unitAtRealPlace:65; hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace:120. No new finite-support theorem is needed. |
| `TauCeti/NumberTheory/LocalField/Quaternion/Subgroup.lean`, `Invariant.lean` | quaternionSubgroupSignEquiv:114; quaternionSubgroup_eq_twoTorsion:67, invariant-half iff:79. Nonarchimedean local field and invertible 2 remain required. |
| `TauCeti/NumberTheory/NumberField/Global/Orders/Basic.lean` | NumberFieldOrder:59 bundles a ℤ-subalgebra, finite generation and rational spanning; its native Pic/discriminant imports elaborate in all embedding/type signatures. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean`, `Fuchsian/Covolume.lean` | instMulActionPSL2:132; IsCofinite:114. Coarse quotient, compactification and ramification APIs were also searched; arithmetic order subgroups are not supplied by those generic carriers. |

The README's Euler-product wording in §5.3 should name the actual ideal Euler-product input: the native Mathlib file above supplies the series and residue, while `Completed/ArithmeticDirichletSeries/README.md`, Layer 3, owns ideal local factors and their transport. This is an attribution clarification, not a claim that the analytic argument is unavailable.

**Ownership and supplier resolution.** Object searches used the roadmap service over main and open heads, and the board-package/read-only sibling files for orders, Gorenstein/Bass, Brandt operators, Hurwitz and the Bruhat–Tits tree. No existing roadmap with this full arithmetic-order scope was found, so the verdict is repairable rather than rejected. Generic theory remains with its earlier owners; the specialization bundles in Lean are permitted for headlines. Scope-only mentions of later CanonicalModelsAndGonality, FiniteGroupInvariants and AbelianVarietiesOverFiniteFields do not become upward inputs.

| Contract resolved | Actual owner and distinction checked |
| --- | --- |
| Generic orders/multiplier orders | ClassicalArithmeticCompletion §§7.4 (:14393), 7.20 (:14829), 7.21 (:14867), 7.56 (:15757) on main. The new carrier is a native bundle, not a second general theory. |
| Arithmetic lattices/class sets | CAC §§7.44 (:15456), 7.60 (:15856), 7.72 (:16146), 7.77 (:16263), 7.78 (:16313), 7.98 (:16744). The exact norm positivity, idele rank-one comparison and cancellation hypotheses match. |
| Quaternion classification/transfer | GL2AutomorphicRepresentationsAndTransfer R17.1.5 (:1427), R17.3.1 (:1578), R17.3.3 (:1609), R17.3.9 (:1659): local splitting predicates, realization/uniqueness and local transfer conditions. |
| Definite class functions | QuaternionicModularForms §0.3 (:267), finite_stab (:277), and §3.1: central units quotient in general F, full finiteness over ℚ, and inverse-coset action. finite_stab is a roadmap target, not a missing pinned theorem. |
| Reduction/strong approximation/Hurwitz | AdelicAlgebraicGroups §§3.4 (finite_classes at :3185), 4.2, 4.6, 5.3; CAC §7.44 gives the archimedean Eichler instance. Reduction.finite_classes is a supplier target, resolving that scanner lead. |
| Canonical curves and graph/function comparison | HilbertModularVarietiesAndShimuraCurves R18.1.3 (:1625), R18.3.1 (:2702), R18.5.17a (:2372). Complex uniformization and central-quotient definite graph exist. Enhanced integral Galois interpretations do not follow: R03. |
| Fuchsian lattice and volume inputs | TeichmullerGeometry §9.1 (:690) supplies discreteness, finite covolume and division/cocompact criterion. EndoscopicTransferAndUnitaryTraceComparison §6.2 supplies τ=1 for simply connected semisimple groups; AA §2.4 fixes measures. FuchsianOrbifolds Layers 0–5 supply generic quotients and Layer 5.3 Riemann–Hurwitz. |
| Local building | ReductiveGroupsPartII RG2.2.2, sl2-tree (:3647), owns the very graph of §1.12: R05. The order-to-vertex and discriminant/level adapters remain here. |
| Quadratic forms and reciprocity | QuadraticFormInvariants Layer 2 and 6C; GlobalQuadraticForms §§4.4,5.5,6.1,6.3; ClassFieldTheory Layers 5,10,14. Presentation, local symbol and global reciprocity inputs are distinct from the order arithmetic. |
| Number-field arithmetic | Completed/NumberFieldArithmetic Layers 1,5; GlobalNumberFields Layers 1,4,6,11. Completions of number fields are local fields; arbitrary complete DVRs need not be. Orders/Picard groups are native at the pin. |
| Theta and oriented CM | ThetaSeries Layer 7 supplies modularity of norm-lattice theta series. GrossZagierAndArithmeticHeights §0a.3 (:206) retains the chosen CM type and gcd(c,N)=1; the revised comparison does too. Its §0a.4 owns arithmetic CM reciprocity, while §8.9 here counts analytic embedding points. |
| Neighboring scopes | FiniteGroupInvariants §7.1 (:821) owns Gassmann equivalence. AbelianVarietiesOverFiniteFields §8.4 (:1405) concerns commutative reduced rational algebras. GeometryOfNumbersAndQuadraticArithmetic §§2.8,3.3 and OrthogonalTamagawaAndLatticeMass concern hermitian lattices/masses, not a second quaternion-order library. |

All ten unresolved-name scanner leads were examined: IsEichler.isBass is declared in this file; finite_stab and finite_classes are named supplier targets; the remaining seven tokens are database knowl identifiers, not Lean declarations. The open-work searches reveal the tree duplication above, not a fully duplicated roadmap. No source or PR text was treated as an instruction.

**Headline inventory.** README end results include the maximality/discriminant criterion, Clifford correspondence, Gorenstein saturation, Bass property, ideal-class finiteness, Eichler's indefinite class/type/norm and normalizer theorems, rational/general mass and class-number formulas, Deuring types, embedding trace formulas, Brandt/Hecke/trace/theta comparisons, Shimura area/genus/CM/quotient theorems, principal-polarization existence and polarized automorphisms, and enhanced-curve/torsion comparisons.

The 16 stated headlines are `isMax_iff_discrdNat_eq`, `relindex_normOne_eq_psi`, `IsEichler.isBass`, `finite_classSet`, `card_atkinLehnerGroup`, `classNumber_eq_one_of_not_isDefinite`, `exists_conj_of_level_eq`, `exists_unit_nrd_eq_neg_one`, `classNumber_eq_one_iff`, `eichler_mass_formula`, `embeddingNumber_gaussian`, `embeddingNumber_eisenstein`, `classNumber_eq_mass_add`, `typeNumber_prime`, `card_autPmMu`, and `card_autPmMu_general`. Each is covered by the numerical rows below. The module docstring names missing Clifford, general mass/local residue, completed local-embedding, Brandt-correspondence and arithmetic-curve/action carriers. It does not justify omission of §9.1's already-statable existence theorem or §2.3's already-statable unique Gorenstein saturation: both probes elaborate, R06.

**Adversarial computations.** One row for each of the 86 numbered targets follows, with additional rows for conventions and worked examples. Integer/rational arithmetic, reduced positive binary forms, quaternion multiplication and finite residue rings were used. A successful instance is a regression test, not a proof of the general theorem. “Retain” means no defect was exposed by those instances; source/database limits remain as stated above.

Notation in this table: L is the Lipschitz order, H the Hurwitz order, Eₑ=O₀(pᵉ), and O₆ is the displayed maximal order in ℍ[ℚ,3,−1]. Unit indices are projective where specified. Matrix entries use column-source convention.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| 0.1 trace, norm, pairing | a=3,b=−1; x=i,y=j; x=0 | trd(i)=0; nrd(i)=−3,nrd(j)=1,nrd(ij)=−3; Gram determinant−144=−16·3²; nrd(0)=0 and 0 is not a unit | Arithmetic agrees; consume native identities, R05. |
| 0.2 local ramification | (−1,−1) at2,3,∞; (1,7) | Signs(−1,+1,−1); splitting indicators(false,true,false). Square parameter1 gives sign+1 and M₂ | Retain. |
| 0.3 finite even support | Hamilton; (3,−1); hypothetical {5} with split∞ | Supports{2,∞},{2,3}, sizes2,2; sign products+1,+1. Singleton product−1 contradicts reciprocity | Retain imported classification. |
| 0.4 algebra discriminant | Same two algebras; split | Products2,6,1; squarefree positive, including empty product1 | Retain; 0 not a discriminant. |
| 0.5 definite/Eichler condition | (−1,−1), (3,−1), (1,7) overℚ | Real signs−1,+1,+1; definite true,false,false | Retain. |
| 0.6 quadratic subfields | ℚ(i) in D6; ℚ(√5) in Hamilton | At2,3 first field does not split, so obstruction0 and embedding exists; second splits at∞, obstruction1 and no embedding | Retain both directions with local conditions. |
| 0.7 symbol examples | (−1,−13); (5,5) | At13 first symbol+1, D=2 rather than13; second is split, D=1 | Retain. |
| 1.1 orders/multiplier orders | I=O; I=0 | O_L(O)=O_R(O)=O; zero's multiplier order=B, but scalar span of0 is0≠B | Retain fullness; zero is rejected. |
| 1.2 units and norm-one group | H; O₆; scalar2 | Quotient sizes1 and2; nrd(2)=4, inverse1/2∉O | Retain mathematics; add Checks, R08. |
| 1.3 trace discriminants | L,2L,M₂(ℤ) | Absolute determinants16,4096,1; [L:2L]=16 and 16²·16=4096 | Retain index-square law. |
| 1.4 dual/codifferent | L,2L,M₂(ℤ) | L♯=(1/2)L, (2L)♯=(1/4)L, double dual returns respectively L and2L; [L♯:L]=16=discL; matrix order self-dual | Retain; add Checks, R08. |
| 1.5 determinant versus cubic | L⊂H; 2L; R=F | 4=2·2; δ(2L)=64, cubic=32, scalar factor2, disc4096=64²≠32²; overF all nonzero ideals=F | Repaired; retain. |
| 1.7 local maximal orders | M₂(ℤ₂); Hamilton(ℝ)((t)); division overℚ₂ | Trace determinant−1; constant Hamilton determinant−16 a unit and e=1; ℚ₂ division e=2,P²=2O, discrd=(2) | Retain distinction. |
| 1.8 maximality criterion | H,L,O₆,ℤ+2O₆ | discrd/D=2/2,4/2,6/6,48/6; maximal true,false,true,false | Both directions agree. |
| 1.9 Eichler definition | E₀,E₁,E₂ | Intersections of endpoint maximal orders give level1,p,p²; matrices' lower-left ideals R,pR,p²R | Retain e=0 and repeated-prime levels. |
| 1.10 level/genus/local index | Split p=2,e=0,1,2; ramified2 | Levels1,2,4; local unit indices1,3,6=ψ(1),ψ(2),ψ(4); division maximal level1 | Retain; a division prime cannot also divide level. |
| 1.11 integral basis/index | H/L; ℤ+2O₆ | Indices2,8; reduced discriminants4=2·2 and48=8·6=2³·6 | Retain formulas; locator R09. |
| 1.12 tree/order adapter | ℤ₂², ℤ₂⊕2ℤ₂, ℤ₂⊕4ℤ₂ | Distances0,1,2; levels1,2,4; base vertex has3 neighbors=q+1 | Adapter agrees; import tree, R05. |
| 1.13 lattice products/inverses | H,2H; incompatible arbitrary lattices excluded | (2H)((1/2)H)=H; norm ideals(4),(1/4), product(1); zero lattice has no inverse/fullness | Retain compatibility/fullness. |
| 2.1 Clifford versus trace-zero form | H; M₂(ℤ); L | H trace-zero discr4 versus Clifford discr2; split trace-zero −x²−yz has discr1; L has trace-zero discr4≠discrd(L)²=16 | Retain Eichler hypothesis; zero ternary form fails nondegeneracy. |
| 2.2 Gorenstein | L; O₆; ℤ+2O₆ | discrd·nrd(codiff)=1,1,2 respectively; last conductor2 excludes Gorenstein | Retain. |
| 2.3 saturation/conductor | O₆; ℤ+2O₆; L | (Gor,f)=(O₆,1),(O₆,2),(L,1); discrd6,48,4 | Retain uniqueness; add statable headline, R06. |
| 2.4 symbol and unit counts | q=2,3; ℝ[[t]] split | Four polynomial counts(6,4,12,8),(48,36,72,54); split real residue quotient GL₂(ℝ) infinite | Finite results agree; general numerical claim R04. |
| 2.5 Bass | Maximal H; E₁; ℤ+2O₆ | Maximal overorder list{H}, invertible codifferent true; E₁ overorders Eichler/maximal; ℤ+2O₆ itself has conductor2 so Bass false | Retain. |
| 2.6 local residue classification | M₂(ℤ₂),E₁,L₂,division maximal | Residue semisimple dimensions4,2,1,2; algebras M₂(𝔽₂),𝔽₂²,𝔽₂,𝔽₄ give ∗,+1,0,−1 | Retain four cases; “trichotomy” is imprecise wording. |
| 2.7 worked orders | O₆ at2,3,5; Eichler level5 | Symbols−1,−1,∗; counts12,72,480; level5 discrd30 and symbol+1 | Repaired; retain. |
| 3.1 norm/index and invertibility | 2E₁; 2M₂(ℤ) considered over E₁ | Proper ideal norm4,index16=4²; superorder lattice norm4,index8≠16, right order wrong | Repaired carrier rejects second case. |
| 3.2 right class quotient | E₁; D11; D37 | Correct E₁ class count1; M₂ superorder excluded; class/type pairs(2,2),(3,2) | Retain; type map need not inject. |
| 3.3 genus/type/connecting ideals | H with itself; D37 maximal genus | HH=H connecting ideal; 3 classes map onto2 types with fibre sizes1,2 | Retain. |
| 3.4 ideles and class sets | Identity idele; scalar2 | Lattices O,2O; normsR,(4); same principal class on both sides | Retain CAC adapter and central quotient. |
| 3.5 finiteness/bound | H; D11 | Counts1,2; H integral representative norm1≤16/π²≈1.621 | Retain; not a finiteness claim over arbitrary Dedekind domains. |
| 3.6 Pic and local generators | M₂(ℤ[√−5]); E₂ at2 | Pic size2, quotient by all scalar ideals size1; w=[[0,1],[4,0]], determinant−4,w²=4I | Repaired; principal scalar quotient retained. |
| 3.7 Atkin–Lehner ideal group | D6,N1; D2,N7 | Ideal-group orders4,4; Hall classes{1,2,3,6} and{1,2,7,14}, all squares1 | Retain; definite normalizers can be smaller. |
| 3.8 class examples | D2,3,5,7,11,13,37 | Class counts1,1,1,1,2,1,3; D11 weights2,3; D37 weights1,1,1 | Retain as worked consequences. |
| 3.9 extension/fibres | H/E level7 | Class counts1,2; local cosets8,global index4,fibre2 | Surjection agrees; unspecified size claim R07. |
| 3.10 counts by norm | H, norms1,2,3,5,9 | Counts1,1,4,6,13; σ(1)=1,σ(3)=4,σ(5)=6,σ(9)=13; ramified2 gives1 | Retain nonzero norm convention. |
| 4.1 Eichler class bijection | E₁ overℤ; O₆ | Proper class counts1=|Clℤ| in both cases | Retain; old improper-class counterexample excluded. |
| 4.2 types under Eichler condition | D6,N1; equal-level conjugates | Type count1; conjugation transports both orders to same class | Retain. |
| 4.3 rational class/conjugacy/reduction | D6,N5; modulus1 | Class and type counts1,1; norm-one reduction at modulus1 has one element, image size1 | Retain; zero modulus outside convention. |
| 4.4 unit and element norms | O₆; Hamilton; n=0 | Unit−1 norm exists in O₆; Hamilton nonzero norms positive; 0 is excluded from the asserted unit norm image | Repaired nonzero condition. |
| 4.5 normalizer sequence | D6,N1; definite D2,N7 | Indefinite quotient size4=2²; definite stabilizer size2<4 | Retain indefinite hypothesis. |
| 4.6 positive normalizer | O₆ | Positive quotient4=AL order4; full/positive sign index2; scalar−1 has norm1 and is inO¹ | Retain; locator R09. |
| 4.7 cancellation | Free O of rank1; rank0 | O⊕O=O² implies the rank1 module remains O; rank0 case0⊕O=O | Retain imported CAC theorem. |
| 5.1 mass | H; D11; D37 | 1/12<1;1/2+1/3=5/6<2;1+1+1=3=class count3 | Retain; ±1 makes denominators nonzero. |
| 5.2 rational mass | D2 levels1,3,7 | Mass1/12,1/3,2/3 equals φ(2)ψ(N)/12; complete representative counts1,1,2 | Headline agrees; empty representative list cannot satisfy bijectivity. |
| 5.3 totally real mass | F=ℚ,D11 | 2ζ(2)/(2π)²=1/12,d=h=1; φ(11)/12=5/6 | Normalization agrees; explicit Euler-product attribution needed. |
| 5.4 level change | H at3; L₂⊂H₂ | Ratios4=ψ(3);3=2·(1−1/4)/(1−1/2) | Retain; split and division factors differ. |
| 5.5 class number one | D2,3,5,7,13 versus11,37 | h=1 five times; h11=2,h37=3; mass alone at11 is5/6 and does not imply h1 | Rational equivalence agrees;24-class classification remains a theorem, not a computational certificate. |
| 5.6 worked masses | D3,5,7,13,37 | φ(D)/12=1/6,1/3,1/2,1,3; reciprocal-weight sums give same values | Retain. |
| 6.1 optimal embeddings | ℤ[i] inO₆; restriction toℤ[2i] | Oˣ classes2; O¹ classes4; full intersectionℤ[i]≠ℤ[2i] rejects restricted nonoptimal map | Retain selected orientation in modular comparison. |
| 6.2 local maximal counts | Split M₂(ℤ₂); division at2 | Split conjugacy count1; ramified ℤ₂[i] count1−0=1; nonmaximal ℤ₂[2i] count0; unramified quadratic maximal count2 | Retain finite-residue division scope. |
| 6.3 local Eichler roots | ℤ₂[i] intoE₁,E₂; p=3 unramified nonsplit | x²+1 has1 root mod2,0 mod4; counts1,0. Inert p3 levelp count1+(−1)=0 | Retain dyadic and nonsplit controls. |
| 6.4 embedding trace sum | D6 andD11, S=ℤ[i] | h(S)=1, product2 in both; indefinite single term2, definite sum over classes2 | Retain summed form, no selectivity shortcut. |
| 6.5 Gaussian/Eisenstein formulas | D6,N1; D2,N3; square level4/9 | Counts(2,2),(0,2); Gaussian at4 and Eisenstein at9 vanish; (−3|2)=−1 | Two Lean headlines agree. |
| 6.6 class-number formula | D2,11,37; (D,N)=(2,3) | 1/12+1/4+2/3=1;5/6+1/2+2/3=2;3+0+0=3;1/3+0+2/3=1 | Retain. |
| 6.7 worked class counts | Same four cases | 1,2,3,1 from independent rational arithmetic | Retain README examples. |
| 6.8 Deuring types | p=2,3,11,37 | t2=t3=1; h(−11)=1,h(−44)=3 gives1+1/4+3/4=2; h(−148)=2 gives3/2+1/2=2 | Retain p≥5 Lean scope and degree-two field binder. |
| 7.1 Brandt definitions | D11,T2; H,T3 | T₂=[[1,3],[2,0]],T₂δ₁=(1,2),A₂δ₁=(1,3); H count4 | Transpose repaired. |
| 7.2 multiplicativity/recurrence | D11,T2,T3; H,p3,r=s=1 | Products both[[8,6],[4,6]],column sums12=σ6; H:4²=13+3·1=16 | Retain central P(p) term. |
| 7.3 pairings/semisimplicity | D11 weights2,3; H | Divisor cross terms2·3=3·2=6; function cross terms3/3=2/2=1; H basis norms12 versus1/12 | Retain inverse weights on functions. |
| 7.4 trace formula | H,n=3,9 | Correct sums4,13; fundamental-discriminant shortcut4,10; square mass term1/12 only at9 | Retain conductor sum; source error below. |
| 7.5 Hecke/transfer interface | H,norm9; newform level11 | Local types12+1=13; central double coset1; transfer D11 has level11/11=1, not11 | Retain local types and full norm-character complement. |
| 7.6 worked matrices | D11,p2,3,5; D37,p2 | Column sums(3,3),(4,4),(6,6); D37 all3. T2 row sums4,2 distinguish transpose | Retain. |
| 7.7 theta comparison | H norm lattice | Bilinear determinant4=D²,level2; norm1 vectors24; coefficient24/(2·12)=1=T(1),constant1/24 | Retain bilinear r(2n) normalization. |
| 8.1 arithmetic Fuchsian group | O₆; Hamilton; split D1 | O₆ real sign+1,division true: compact quotient; Hamilton real sign−1: no splitting; D1 split gives cusps | Retain D>1 and indefinite scope. |
| 8.2 index/area | D6,N1,5; definite D2,N7 | Areas2π/3,4π with ratio6=ψ5; definite unit index24/6=4≠ψ7=8 | Retain indefinite global index hypothesis. |
| 8.3 elliptic embeddings | D6,N1; D15,N4 | First embedding products(2,2)=elliptic counts(2,2); second(0,0), including dyadic obstruction | Retain. |
| 8.4 genus | D6,N1; D15,N4 | 1+2/12−2/4−2/3=0;1+48/12=5 | Retain division and coprime-level hypotheses. |
| 8.5 Atkin–Lehner groups | D6,N1 | W has4 elements,three nonidentity involutions; w₂w₃=w₆ and w₂²=1 | Retain identity distinction required in next section. |
| 8.6 fixed points/quotients | D6,N1,m=1,2,3,6 | m1: whole infinite curve versus asserted2; nonidentity counts2,2,2; RH quotients each0 | R01; add m>1. |
| 8.7 intermediate stabilizers | Γ¹(O₆),Γ⁺(O₆) | Γ¹ signature(0;2,2,3,3), area2π/3; Γ⁺ signature(0;2,4,6), areaπ/6; Euler contributions−2+7/3=1/3 and−2+25/12=1/12 | Retain orders2,3,4,6 for nontrivial stabilizers. |
| 8.8 canonical comparison | D6,N1 identity component | Rational class number1,φ(1)=1; one component and analytic genus0 | Retain complex comparison; does not supply enhanced Galois module. |
| 8.9 CM point count | D6,ℤ[i]; nonmaximalℤ[2i] | m(O¹)=4,divide by conjugation2 gives2 points; nonmaximal at division2 gives0 | Repaired orientation and local obstruction. |
| 9.1 degree/existence/orbits | μ=i+3j,2μ; D6 degree2; D21 degree21 | Norms6,24 give squareclasses1,1;3/6=1/2 has representative2; D21 orbit1 versus formula2 | R02 and R06; retain degree convention. |
| 9.2 stabilizer classification | O₆,μ=i+3j or i+4j; split control | μ²=−6 or−13; valuation13(norm)=1 excludes normalization in latter; split μ²=−23 has stabilizer1 | Strong/general cardinality distinction repaired. |
| 9.3 worked automorphism groups | D6 selected degrees1,2,6; D21 degree21 | Projective cyclic factors2,6,4 with inversion double to4,12,8; D21 centralizing factor2 doubles to4, not8 | Algebraic controls agree; other stored representatives uncertified. |
| 9.4 semidirect product/kernel | D6 degree1,N1; D14 degree1 | K={(±1,1)} size2,image atN1 size1; residue units size1,enhanced size4; D14 automorphism image≤2<W size4 | Retain intermediate image and two product conventions. |
| 9.5 levels/subgroups/curves | D6,N1,H=1/full; N3,H=1 | Indices4,1; groupsΓ¹,Γ_G; K-image at1 size1, at3 size2; H and Hρ(K) have same curve | Retain coarseness distinction. |
| 9.6 enhanced genus/RH | X(6;1); H=G at genus1; D6,M101 | 1+4·(1/4)·2/12−(1/2)(1+4/3)=0; identity RH0=0; base genus17, total W fixed32:32=8·0+32 gives quotient genus1 | Repaired base term. |
| 9.7 torsion action | E₁/2E₁; M₂(𝔽₂); N1 | First ring four units,annihilator span(E12,2E21) size4; split annihilator0 size1; N1 zero module size1 | Algebraic formula repaired; Galois comparison R03. |
| 9.8 projection/content | H=1; H full; D14 degree1 | Projection sizes1,2; trivial content{1}; full enhanced group is its defining semidirect product | Definitions agree; arithmetic endomorphism-field assertion R03. |
| 9.9 worked genera/prefixes | D6 levels5,11; D10,14,26,35 | Genera1,3;0,1,2,3. D6 level5 has order discriminant30,tuple(6,30,1,1,4,1) | Internal arithmetic agrees; database suffix/representatives uncertified. |
| 9.10 boundary controls | D21,δ21; D6,δ2; Hamilton | v₂(nrd(1+i′))=1 but split-normalizer norm valuation even; Aut± size4; norm ratio1/2≠degree2; Hamilton has no real splitting | Retain; D21 also refutes §9.1 count. |
| 10.1 intrinsic prefix | D6 maximal and level5 | Tuples(6,6,1,1,4,0),(6,30,1,1,4,1); omit second6 only for maximal presentation | Internal convention consistent; actual schema not certified. |
| 10.2 coverage map | D6 area/CM; D15 residue torsion | Normalized area1/6,CM count2,fixed module4; integer norm ratio claim would give1/2 at degree2 | Mathematical coverage subject to R02/R03; live columns not certified. |
| 10.3 worked suite | D2 versusD6; D15,N4 | Real signs−1,+1; D2 mass1/12,class1; D6 genus0; D15,N4 genus5 | Retain separated definite/indefinite cases. |

Additional convention and worked-example checks:

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Group composition/right versus left | Quaternion units i,j and i⁻¹ji | ij=k,ji=−k,i⁻¹ji=−j; in S₃, (123)⁻¹(12)(123)=(13) | Nonabelian tests distinguish conjugation from multiplication; no commutativity is assumed in ClassRel or EmbRel. |
| Trace dual direction | I=M₂(ℤ),β=diag(2,1) | (βI)♯ consists of matrices with first column half-integral, second integral; I♯β⁻¹ gives exactly that, β⁻¹I♯ would instead halve the first row | Right-sided inverse in §1.4 retained. |
| Positive-modulus junk values | N=1 versus0 | psi(1)=1,psi(0)=1 (empty prime product); O/O has one element, O/0 infinite | N>0 convention prevents using the junk value as a finite-level theorem. |
| Field/zero/characteristic controls | R=F; zero lattice; characteristic2 field | Nonzero fractional ideals=F; zero lattice span0≠B; char2 violates CharZero and is not an omitted case of this roadmap | Field boundary retained, zero and char2 exclusions explicit. Residue char2 remains included. |
| Nonmaximal dyadic units | L₂⊂H₂ | Unit counts mod2L and mod2H are8 and12; lattice index2 with local unit index3 | Checks finite-residue formula and codifferent/conductor separately. |
| Definite normalizer | D2,level7; D37 | Ideal group4 acts transitively on2 classes, stabilizer2; D37 involution fixes1 class and swaps2, giving stabilizers2 and1 | Previous false triviality repaired. |
| Worked indefinite table | D=10,14,15,21,22,26,33,34,35,38,39 | (ν₂,ν₃,g)=(0,4,0),(2,0,1),(0,2,1),(4,0,1),(2,4,0),(0,0,2),(4,2,1),(0,4,1),(0,0,3),(2,0,2),(0,0,3) | All genus columns recomputed; selected polarization column not certified from database. |
| Large genus control | D6,M101 | h(−808)=6,h(−2424)=12; fixed counts(4,0,4,0,12,0,12),sum32; X₀ genus17,full W quotient genus1 | Retains base-genus correction. |
| Scaling a principal polarization | O₆,μ=i+3j and2μ | Squares−6,−24; trace pairs(0,6,−6,0),(0,12,−12,0); norm/discrd1,4 have same squarefree representative1 | Definition fixes degree, not a unique scalar representative. |

The polarization count in R02 is deliberately tested against the larger wrong model (the full stabilizer instead of its image), and the discriminant, relative index, Brandt transpose and CM orientation computations explicitly reject their plausible wrong conventions. No successful small example is used to waive the hypotheses or source limits.

## Not verifiable

- **Live LMFDB material:** all eleven cited knowl URLs were attempted through the source service. The returned text is the reCAPTCHA/browser-check page, not the knowl. This includes `lmfdb`, `lmfdb_polarized_order`, `lmfdb_aut_pm_mu_o`, `lmfdb_enhanced_group`, `lmfdb_level`, `lmfdb_index`, `lmfdb_is_coarse`, `lmfdb_nrdmu`, `lmfdb_disco`, `lmfdb_eichler`, and `lmfdb_label`. The precise list is preserved in the missing-reference ledger. No access control was bypassed. The named stored polarizations, coordinates, label suffixes and §10.2's live column schema therefore remain uncertified. Arithmetic computed from a formula above is distinguished from verification of a stored row.
- **Paywalled texts:** `vigneras` (Springer DOI 10.1007/BFb0091027), `pizer1980` (Elsevier DOI 10.1016/0021-8693(80)90151-9), and `ogg` (the published real-points chapter) resolved as uncertified. Their text was not read, and they are not claimed source-verified. Independent checks of accessible Voight statements and the explicit D6 fixed-point cases are recorded above.
- **No legal text obtained from the attempted landing pages:** `eichler` (De Gruyter DOI 10.1515/crll.1955.195.127), `shimizu` (JSTOR DOI 10.2307/1970389), and `alsina_bayer` (AMS DOI 10.1090/crmm/022). These are recorded once under their existing source IDs. Pizer 1976 was subsequently obtained as institutional OCR; Rotger was obtained from the author, so neither is a missing text.
- The completed numerical and signature checks do not certify every chosen automorphism representative in the worked database table, nor a general proof of all promised theorems. The review is not parked: the actionable mathematical and ownership findings above determine the verdict independently of those inaccessible texts.

## Source issues

- **Error** in voight at 15.4.5 and Lemma 15.4.7, printed p.239 (`voight line 10654`): the source says cubic discriminants scale by the four-dimensional lattice index and square to trace discriminants for all projective lattices; it should be restricted to normalized scalar lattice, including orders, with the scalar-ideal factor for general lattices; affects a stated result.
- **Misprint** in voight at proof of Lemma 15.4.7, printed p.239 (`voight line 10662`): the source says the alternating trace on i,j,ij is 4ab; it should be −4ab because (ij)²=−ab; affects nothing.
- **Misprint** in voight at proof of Lemma 24.3.12, printed p.391 (`voight line 16905`): the source says the radical J is contained in 𝔭O; it should be 𝔭O contained in J, as the topological-nilpotence argument requires; affects the proof.
- **Error** in voight at Theorem 41.1.13, printed p.751 (`voight line 32016`): the source says the weighted quadratic class number ignores the conductor square; it should be summed over admissible overorders, retaining conductors prime to the quaternion discriminant; affects a stated result.
- **Error** in voight at 41.2.5–6, printed p.752 (`voight line 32071`): the source says the displayed function operator has the previously defined Brandt matrix; it should be the transpose in column coordinates, since its value at class j sums column j; affects a stated result.
