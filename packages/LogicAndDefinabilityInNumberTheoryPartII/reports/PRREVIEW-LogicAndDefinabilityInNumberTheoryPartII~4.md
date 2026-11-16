# Review of LogicAndDefinabilityInNumberTheoryPartII (pull request #2438 at 05885da)

**Verdict:** needs changes

## Previous findings

The previous review, of this same head, listed no finding; there is nothing to check as repaired. The three findings below are new.

## R01 (P3) — Poonen's Theorem 2.2 cited for the valuation-ring family

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean:66`: "**Rumely's uniform valuation rings** (Rumely, Introduction and §2; Poonen, Theorem 2.2)"; the same pairing covers item (1) at `README.md:337`.

**Claim:** Poonen's Theorem 2.2 does not state the uniform family of valuation rings.

**Witness:** poonen_uniform lines 113–125: eight items (number-field sentence, prime field, `ℤ`, `ℕ`, constant field, `F[x]`, `k[x]`, powers of `x`), none on valuations. The family is rumely lines 22–23 and 136–138.

**Repair:** Docstring: "(Rumely, Introduction I, p. 195, and §2, p. 198)". README 0.7: "(Rumely, Introduction I–III, pp. 195–196, §2, p. 198, and p. 211; items (2)–(5) are also Poonen, Theorem 2.2, p. 3)".

## R02 (P3) — The summary misstates where the base roadmap stops

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheoryPartII/README.md:3`: "continues *Logic and definability in number theory* (LogicAndDefinabilityInNumberTheory), which stops at interpretations on definable quotients (its §§0.1–0.4)".

**Claim:** The base roadmap does not stop at its Layer 0, and it does not carry that title.

**Witness:** LogicAndDefinabilityInNumberTheory at its open head: title "logic, definability, valued fields and motivic integration"; `## Layer 4: Diophantine normal forms and arithmetic definability`; `## Layer 7: Pila–Zannier reductions under explicit inputs`.

**Repair:** "This roadmap continues LogicAndDefinabilityInNumberTheory, whose theory of interpretations (its Layer 0, §§0.1–0.4) stops at interpretations on definable quotients, without homotopies or bi-interpretations, and which never treats finitely generated fields as a class."

## R03 (P3) — The pull request's summary repeats it

**Location:** pull request description, `roadmap-summary` block: "The earlier logic roadmap ends at interpretations and never studies finitely generated fields as a class."

**Claim:** The earlier roadmap continues for seven layers after its interpretations.

**Witness:** As in R02: Layers 1–7 of LogicAndDefinabilityInNumberTheory (valued-field transfer, motivic integration, Diophantine normal forms, o-minimal counting, Pila–Zannier reductions).

**Repair:** "The earlier logic roadmap takes interpretations no further than definable quotients and never studies finitely generated fields as a class."

## Verified sound

| Target | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 0.4 bounded finite extensions | `X² + 1` over `ℚ`; `X² − X`; `N = 0` | factor `1`: quotient is the zero ring, rejected; `X² + 1`: two coordinates, `ℚ(i)`; factor `X`: `K`, not `K × K`; no admissible factor | holds; akns line 595 |
| 0.5 formal coordinates | `𝔸¹_ℚ` at `0`; `𝔽₂(s)`, point `t² = s` | `1/(1 − t) ↦ Σ tⁿ`; a coefficient field containing `k` gives `y² = s`, so `π = (t − y)²` has value at least 2, not 1 | holds; inseparable case excluded |
| 0.9 elliptic inputs | `K = ℚ(t)`; a finite subgroup; an infinite one | `ℙ¹ → E` constant, `E(ℚ(t)) = E(ℚ)`; torsion closed, not open; nonzero subgroup of `ℤ_p` has closure `pⁿℤ_p` | holds; poonen_uniform lines 142–152 |
| 1.2 Jannsen's principle | `d = 1`, `K = ℚ`; `K = ℚ(x)`, `α = (−1)³` | `Br(ℚ)[2]` injectivity; `H³(ℚ_p^h) = 0`, `cd₂ = 1` at the complex place, `8⟨1⟩` anisotropic at the real place | holds; degree `(d − 1) + 2 = d + 1` matches the supplier's §6.3 |
| 1.5 Kato's principle | `ℚ(x)`, `(−1)³`; `k = ℚ(i)`; `k` a function field | all non-dyadic residues `0` yet class nonzero; `2v(4) = 8 > 2v(2) = 4`; `KH₂ = KH₁ = 0`, `KH₀ = ℤ/n` | holds with `√−1`; pop_eei2 lines 258–268 |
| 2.1 nice presentations | tails `(21, −1)` and `(7/3, −1)` over `ℚ` | `(21, −1)₂ = +1`, `21 > 0`: nice; `v₃(7/3) = −1`, odd value not a norm from `ℚ₃(i)`: not nice; `21 = 9 · 7/3` | holds; dittmann_pop lines 340–347 |
| 2.4 nice anisotropic tails | `k₁ = ℚ`, `l₁ = ℚ(i)`, `Σ = {2}`, `(a₁, a₀) = (145, 3)` | `3` nonsquare mod `5`, `v₅(145) = 1`: anisotropic over `ℚ₅ ⊇ ℚ(i)`; `145 ≡ 1 mod 72`: square in `ℚ₂`, `ℚ₃` | holds; dittmann_pop lines 407–431 |
| 2.5 adapted parameters | `𝔽_p(s, t, r)`, `r`-adic `w`; `ℚ(s, t)`, `t`-adic | basis `(s, t^p)`: residue extension purely inseparable of degree `p`; `(s, t)`: separable; `k₁ = ℚ`, `u₂ = s`; `d − 2` parameters | holds; dittmann_pop lines 432–456 |
| 4.5 stabilizer of a ball | `a = t³` in `κ(t)`; `w(x) < 0` | `m = 1`, `B = t²O`; `t·B ⊆ B`; `(1/t)·t² = t ∉ B`; in general `x·π^{m+1}` has value at most `m` | `Stab = O_w` |
| 4.6 union of balls | the identity for `a_d`; `V_a = {w}`, `w(a_d) = 3`; `τ = 0` | `(a_dβ/τ)²(1 − 1/β) = a_d²(β² − β)/τ² = a_d`; `b_a = 𝔪²`; `β ∈ {0, 1}` | holds; dittmann_pop lines 625–640 |
| 5.2 guarded formula | `V_a = ∅`; two places; a zero slot | `raw = K` fails the omitted element; `O_P ∩ O_Q` fails `x ∨ x⁻¹` with `ord_P x < 0 < ord_Q x`; guard false: empty | every nonempty fibre is one place ring |
| 6.1 normalizations | `ℚ`, `()`; `𝔽_q(t)`, `(t)`; finite `K`; `ℚ(t)` | `R = ℤ`, `S = ℚ`; `R = S = 𝔽_q[t]`; `R = S = K`; `1/2 ∉ R_T` | holds; dittmann_pop lines 694–704 |
| 6.8 composite intersection | `ℚ`; `ℚ(√5)`; `ℚ(i)` at `5` | `ℤ`; `ℤ[(1 + √5)/2]`, not `ℤ[√5]`; one prolongation `(2 + i)` admits `1/(2 − i)` | holds; minimal-polynomial coefficients lie in `⋂ O_v` |
| 7.4 domains and `ℤ` | `ℤ[√5, t]`; `𝔽₄` | core `ℤ[√5]`, Dedekind only after inverting `2`; `b⁴ = b`, no transcendental element | holds with the conductor step; akns lines 1063–1095 |
| 7.6 fields and `ℤ` | `ℚ`; `𝔽₂(t)`; `𝔽₂(s, t)`; `𝔽₉` | `R_∅ = ℤ`, fraction presentation; `δ = 1, 2`: no resolution; `δ = 0`: excluded | holds; dittmann_pop lines 52–54 |
| `exists_formula_valuationSubring_ne_top` | `ℚ`; `𝔽_q(t)`; a finite field | fibres `ℤ_(p)`; the place at infinity occurs; `δ = 0 ≠ 1`, vacuous; valuation overrings of a Dedekind domain are its localizations | holds; locator R01 |
| `exists_sentence_kroneckerDimension_eq` | `n = 0`; `𝔽₄`; `𝔽₃(t)`; `δ(K) ≠ n` | `4 > 2` and `6 > 3` variables over a `C₁` field; non-cube exists in `𝔽₄`; `t̄⁴⁰ = −1` in `𝔽₈₁`; subform argument both ways | holds |
| `exists_sentence_charZero` | `ℚ`; any field of odd `p`; `p = 2`; `Z = ∅` | `ℤ ≠ 2ℤ`; `s = 2·((p + 1)/2)s`, so `Z = 2Z`; `2 = 0`; `∅ = 2∅` | holds; no finite generation needed in the second clause |
| `exists_formula_mem_primeField` | `ℚ(√2, t)`; `𝔽₉(t)`; `𝔽₉` | `ℚ`, not `ℚ(√2)`; `𝔽₃[x] ∩ 𝔽₃[1/x] = 𝔽₃`; excluded by `Infinite` | holds; poonen_uniform lines 49–52 |
| `exists_formula_not_algebraicIndependent` | `n = 0`; `n = 1`; finite `K`; `𝔽₂(s, t)` | empty family independent: false formula; the constant field; `t₁ ∈ κ = K`; `(s, s² + s)` dependent | holds; poonen_uniform lines 55–58 |
| `exists_formula_isGeometricPrimeDivisor` | `d = 0`; `ℚ` and `𝔽_q(t)`; `ℚ(t)`; characteristic two, `d = 3` | false formula; no residue characteristic `0`, all places; `ℤ_(p)[t]_{(p)}` excluded; `(G)_{2,1}` by kerz_saito line 1862 | holds |
| `exists_formula_arithmeticNormalization` | `(d, e) = (1, 0)`, `ℚ`; `(2, 1)`, `ℚ(s)`; `𝔽₂(t)`, `T = (t²)`; `𝔽₄` | `ℤ`; `ℤ[s]`, not `ℚ[s]`; `𝔽₂[t]`; `𝔽₄`; wrong `e`: vacuous | holds |
| `exists_sentence_realize_iff_nonempty_ringEquiv_of_isDomain` | `B = ℤ`; `B = 𝔽₉`; `S = 0`; `S = ℤ/4` | fails in `ℤ[i]`, `ℤ × ℤ`; `θ₉`; one element; fails the field conjunct | holds; akns lines 882–885, 961 |
| `exists_sentence_realize_iff_nonempty_ringEquiv` | `K = 𝔽₄`; `K = ℚ`; `L` of characteristic two, `δ = 5` | `θ₄` fails in `𝔽₂`; fails in `ℚ(i)`, `ℚ(t)`; `L` excluded by `σ_{δ(K)}` or `1 + 1 ≠ 0` | holds; dittmann_pop lines 44–46 |
| Summary sentence (R02, R03) | layers of the base roadmap at its head | Layers 0–7; §§0.1–0.4 are Layer 0 only | repaired by R02, R03 |

- **Gate.** Every check of the push gate passes at this head, the worker's build included. Dependency check: "depcheck: 258 roadmaps, 2454 edges, 0 problem(s)". No change outside the folder.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives the 9 `declaration uses sorry` warnings only. The 11 elaborated types in `signatures.md` were compared with README 0.1, 0.2, 0.7, 0.8, 0.10, 0.13a, 0.14, 5.7, 6.9, 8.4, 8.5: no binder lost, same generality.
- **Padding probe.** `first | simp | rfl | infer_instance | (intros; simp) | decide` on a scratch copy fails on all 9 theorems. The two definitions have real bodies; `kroneckerDimension` has the body of QuadraticFormInvariantsPartII's in another namespace.
- **Sources.** About 80 locators read against the text: dittmann_pop (all cited statements and pages), poonen_uniform (Theorems 1.1–1.4, 2.2, 2.3, Lemmas 3.2–3.5, 4.7, 4.8), akns, kerz_saito (lines 1562–1572, 1818–1869), pop_eei2, pop_eei, rumely, jannsen_hasse, Stacks tags 0C0S and 032A.
- **Library declarations.** 24 opened at the pins, among them `Field.FG` (`Mathlib/Algebra/Field/Subfield/Basic.lean:458`), `Algebra.trdeg` (`RingTheory/AlgebraicIndependent/Basic.lean:45`), `TauCeti.Place.exists_forall_mem_valuation_sub_le` (`Place/Approximation.lean:130`), `exists_ord_eq_neg_and_forall_ne_ord_nonneg` (`Consequences/HighDegree.lean:247`), `TauCeti.IsRegularLocalRing.isDomain` (`RegularLocalRing/Basic.lean:164`). The pins have no interpretation, no simple normal crossings divisor and no Kronecker dimension.
- **Cross-roadmap citations.** The resolver lists none missing. Sections opened at their heads: LogicAndDefinabilityInNumberTheory §§0.1–0.4, QuadraticFormInvariantsPartII (16 sections), LocalFieldsRamificationPartII §§1.1–1.3 and 5.1–5.3, AdicCoefficientsAndComparisonsPartII §PA.0.12, ArithmeticGaloisDuality §§R02.3.2 and R02.4.4, LefschetzPencilsAndVanishingCycles §§0.10 and 3.5, FunctionFieldArithmetic §5.8; 13 cited declaration names found in their roadmaps.
- **Declared gaps.** The five slugs agree between `design/plan.json` and the README. The base roadmap has no homotopy or bi-interpretation, so gap:biinterpretation-homotopy asks for nothing already provided.
- **Pull request text.** Apart from R03, every sentence of the title, the summary block and the prose agrees with this head; the 14 open suppliers of the description are the README's.

Overlap check: read QuadraticFormInvariantsPartII, AdicCoefficientsAndComparisonsPartII, LogicAndDefinabilityInNumberTheory, LocalFieldsRamificationPartII, EtaleDualityAndPerverseSheavesPartII, SchemeAndStackFoundations. Kronecker dimension: QuadraticFormInvariantsPartII §5.7 owns it, and this roadmap restates the definition only in Lean. Threefold resolution: AdicCoefficientsAndComparisonsPartII §PA.0.12 owns the proper form, 1.3b the projective form over fields. Nothing else is shared; no other roadmap states geometric prime divisors, bi-interpretability with `ℤ`, Kato complexes or Kerz–Saito's principle.

Source independence: 9 passages compared with 6 sources (dittmann_pop, poonen_uniform, akns, kerz_saito, pop_eei2, rumely), none shared beyond forced hypothesis lists and statements of about a dozen words. The largest share is dittmann_pop, 56 of 159 locator groups in the layers. Contents compared with dittmann_pop: independent. Layer 2 takes its Definition 3.3 with §3B, Layer 3 its §3A with §3C, Layers 4 and 5 split §4 and add Pop's construction, and Layers 0, 1, 7, 8 rest on other sources. The order is forced by the *Needs* lines of 3.1, 4.6, 5.2 and 6.4.

## Not verifiable

- kato_hasse (§1; Corollary, p. 145; p. 149): uncertified; read only through pop_eei2 lines 256–268 and dittmann_pop lines 143 and 182–186.
- merkurjev_suslin (Theorem 12.2): uncertified; read only through pop_eei2 lines 279–280.
- moret_bailly (Lemma 11.1(i)): uncertified; read only through poonen_uniform line 144.
- lenstra_cm (Theorem 1(a)): uncertified.
- Stacks, *Commutative Algebra* tags other than 0C0S and 032A: not in the cached text, and not opened in this review.

## Source issues

- **Misprint** in dittmann_pop at proof of Proposition 5.1 and of Lemma 5.3, printed pp. 16–17: the source says the composite valuations are indexed by the rank-one set of divisors containing the basis; it should be the geometric prime e-divisors defined just before; affects nothing.
- **Gap** in akns at proof of Theorem 3.1, printed p. 23: the source says the finitely generated one-dimensional core is therefore Dedekind; it should first invert a conductor element, since the core of `ℤ[√5, t]` is `ℤ[√5]`; affects the proof.
- **Misprint** in akns at §2.9, printed p. 19: the source says the sentence characterizes the structure among all structures of the language; it should be among the finitely generated ones; affects nothing.
- **Error** in poonen_uniform at Lemma 4.8, printed p. 9 (arXiv v1): the source says the sums lie in `K` and the form is tested over `K`; it should take the sums in `K_u` and test there, since over `𝔽₅(u, s)` the printed test accepts `s²`; affects a stated result.
- **Error** in pop_eei2 at Notation/Remarks 3.5, printed p. 2102: the source says the threshold is twice the valuation of `2n`; it should use `n` in characteristic two, where `2n = 0` excludes every element; affects a stated result.

## For the human reviewers

- none
