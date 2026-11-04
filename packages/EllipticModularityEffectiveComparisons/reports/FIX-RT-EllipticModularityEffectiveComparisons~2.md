# Repair of red-team round 2 (passes a and b)

Six findings from two reviews, each settled once. Locations are in `packages/EllipticModularityEffectiveComparisons/`.

## RT-EllipticModularityEffectiveComparisons~2a/F01 (P1) — applied

Verified the witness: at p=17 the curve y²=x³+1 has Aut=μ₆, its two order-three automorphisms are the two optimal embeddings of ℤ[ζ₃], fixed by conjugation, so h₀(−3)=2 and e₃=[0]/3, whereas H₋₃=X has logarithmic derivative dj/j. The source's (5.2) (bilu-parent-rebolledo line 832) is exact only for p inert and D∉{3,4}. §5.4a now defines the multiplicity vector v_D=Σ_s m_s(D)[s]∈ℤ^S from the reduction of H₋_D, states I♯_e v_D=0 with differential H′/H dj, keeps the source's e_D as the embedding-weighted vector, and states as a target the Deuring-lifting count h_s(−D)=2m_s(D) (p inert) and h_s(−D)=m_s(D) (p ramified), hence v_D=(|O^×|/2)e_D or |O^×|e_D. §5.5 uses v_D, v_(c²D). New Checks: p=17, D=3 (v₃=[0], e₃=[0]/3, coefficient 6 in 𝔽₁₇); p=17, D=51 ramified (H₋₅₁≡(X−8)², v₅₁=2[8], e₅₁=[8]); the Hurwitz-order counts at p=2 (D=11: two classes of 12, h_s=2; D=8: one class of 12, h_s=1); D=4 split (v₄=0 while H′/H=1/(j−11)≠0).

## RT-EllipticModularityEffectiveComparisons~2a/F02 (P1) — applied

Verified by the Hasse invariant over 𝔽₃₇[t]/(t²−2): the supersingular invariants are 8 and 3±10t, and 1/(1−(3+10t))=17+26t∉𝔽₃₇. The cotangent bullet of §5.4a now identifies Cot₀(J₀(p)♯) with 𝔽_(p²)^S after base change, with Frobenius acting semilinearly by s↦s^(p), the 𝔽_p-rational cotangents being the tuples with λ_(s^(p))=λ_s^p; the pullback formula and the formal-immersion criterion are applied over 𝔽_(p²), which suffices because a formal immersion is detected after base change; v_D is Frobenius-invariant because H₋_D has integer coefficients. New Check at p=37: [3+10t] fails descent; [3+10t]+[3−10t] descends with coefficient 34 at j₀=1.

## RT-EllipticModularityEffectiveComparisons~2b/F01 (P1) — applied

Verified at the supplier's head: EisensteinIdealAndRationalTorsion README line 14 and §7.9 (line 1003) state the general geometric Manin–Drinfeld theorem for every smooth projective congruence modular curve over a number field, nonsquarefree levels and Cartan quotients included, with the pullback–norm descent; `squarefree_cusp_difference_torsion` occurs nowhere there (`roadmaps grep`: no match on main or any open head). EisensteinIdealAndRationalTorsion is earlier in the merge order (line 156 against 188). Applied differently from the suggested stub: §5.10a is deleted outright, as the house rules require for a target owned elsewhere, and the deferral is recorded in Scope and ownership. Consumers §5.16, §5.16a and the Layer 5 Dependencies cite §7.9 directly; §5.16 gains the two Checks of the deleted section that it still needs (order-one control, the ℝ/ℤ sum control). The supplier contract names the theorem and deletes the stale name; the Scope sentence, the ModularSymbolsPadicLFunctions contract sentence and the Lean docstring sentence are corrected. MordellLawrenceVenkatesh §8.11 and elkik-1990 were consumed only by §5.10a: the supplier paragraph, the Dependencies entry, the References bullet and the `sources.toml` entry are removed.

## RT-EllipticModularityEffectiveComparisons~2b/F02 (P3) — applied differently

Verified at the consumer's head: ErdosProgressionPowers README lines 73 and 553–565 name EllipticCurveModularityPartII §§1.4, 2.2, 1.5–1.8, 4.7, 5.4–5.5, 6.18 as EC.0–EC.5 and never name this roadmap. The Downstream consumers paragraph now states that the EC.0–EC.5 contract consists of the theorems of Layers 0–5 here, with the same hypotheses, and that ErdosProgressionPowers names EllipticCurveModularityPartII as its supplier; the words "current head" of the suggested text are omitted as process narrative. Depcheck reports no problem from this mention.

## RT-EllipticModularityEffectiveComparisons~2b/F03 (P3) — applied

Verified: |GL₂(𝔽₁₁)|/|N(C)|=13200/240=55 conjugates against 5 cusps. §5.16a's route now says the cusps are the double cosets N(C)\GL₂(𝔽_p)/B̄, that g⁻¹ induces the ℚ-isomorphism N(C)\X(p)→N(g⁻¹Cg)\X(p) carrying the cusp represented by g to ∞, and that the (p−1)/2 cusps are not in bijection with the p(p−1)/2 Cartan subgroups. New Check at p=11 with these numbers. The source's loose remark (darmon-merel line 722) is recorded below.

## RT-EllipticModularityEffectiveComparisons~2b/F04 (P3) — applied differently

Verified: the source's sentence (bilu-parent-rebolledo line 768) is false for real quadratic K, since the toric part contributes O_K^×. The reviewer's route is adopted up to z∈J♯_e(ℚ) (x̄=w_(p²)x because x is not rational by §4.17, x₁=ȳ, x₂=w_p y, z̄=−w_p z, w_p=−1 on J♯_e since w_p=−T_p∈𝕋♯ and (1+w_p)e♯=0). Its last step differs: 𝔾_m(ℚ)=ℚ^× is infinite, not {±1}. §5.4a instead proves z is a ℤ-section of the identity component G⁰ of the Néron lft-model (same smooth point above p, same component elsewhere, descent from O_K to ℤ) and that G⁰(ℤ) is finite as an extension of a subgroup of (J₀(p)/I♯_e J₀(p))(ℚ), isogenous to the winding quotient and finite by gap:modular-rank-zero, by 𝔾_m(ℤ)={±1}. The identity w_p=−T_p on J₀(p)♯ is a stated target: Atkin–Lehner on J₀(p); on the torus w_p inverts f(0)/f(∞) while T_p(∞)=p(∞), T_p(0)=(0)+(p−1)(∞) fix it. *Needs:* gains ModularForms Layer 6, gap:modular-rank-zero with EulerSystemsAndKolyvaginSystems §5.13, Deuring lifting from ComplexMultiplicationAndExplicitReciprocity §§5.1–5.5, and Layer 4.17.

## Checks run

- Elaboration: `lake env lean packages/EllipticModularityEffectiveComparisons/Suggested.lean` exits 0 in 10 s with exactly 14 `declaration uses sorry` warnings at lines 77, 82, 91, 102, 116, 133, 180, 186, 192, 199, 236, 244, 254, 263 (the 14 theorems; every line moved by the module header below). No errors, no other warning. Only the module docstring and the import header changed.
- Signatures: a scratch copy of the file with `#check @name` for all 24 declarations elaborated once, before and again after the header repair; all 24 types printed both times and, after whitespace normalisation, are identical to each other and to the worker's `signatures.md` artefact. No binder changed.
- Worker repair (the two `imports Mathlib from package mathlib, which is designed for use with the module system` warnings): the pinned Mathlib and every pinned Tau Ceti module are module-system files, so the file now starts with `module` and its nine import lines are `public import Mathlib` followed by the same seven `public import TauCeti.*` lines, which is the form the warning asks for and the form a roadmap on main (CoboundaryExpansion) already uses. `public` keeps the file's re-export behaviour for any consumer that imports it. The gate's import scan accepts the header (`import Mathlib` first, then only existing `TauCeti.*` modules, nothing after the header); nothing below the header changed.
- Dependency check:

```text
depcheck: 207 roadmaps, 1785 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. `roadmaps resolve` lists only the two known R15.2/R15.4 aliases of AlgebraicModularFormsAndSerreWeights (its README says other roadmaps cite its layers as R15.1–R15.5); no Lean name is unresolved.
- `sources.toml` parses with 18 entries after removing elkik-1990. No new source was needed; `needs-references.toml` does not exist.

## Adversarial pass on new and changed statements

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| h_s(−D) versus m_s(D), inert | p=17, D=3; p=2, D=11 | Aut(y²=x³+1)=μ₆, two order-3 elements, orbits of size 1, h=2, m=1; Hurwitz order: 24 elements of trace 1 norm 3, centralizer ±1, orbits of 12, h=2, h(−11)=1 | h_s=2m_s |
| h_s(−D) versus m_s(D), ramified | p=2, D=8 and D=4; p=17, D=51 | 12 elements of trace 0 norm 2 (resp. 6 of order 4), one class, h=1=h(O); H₋₅₁ mod 17 = X²+X+13=(X−8)², m₈=2=h(−51) | h_s=m_s; Eichler's sum h(O)(1−(O/p)) reproduced |
| differential of v_D equals H′/H dj | p=17, D=3, 12, 51 | H₋₃≡X, H₋₁₂=X−54000≡X−8, H₋₅₁≡(X−8)²; differentials dj/j, dj/(j−8), 2dj/(j−8) | equal to the log derivative |
| differential of e_D | same | factors 2/6, 1, 1/2 of the log derivative | not equal in general, as the finding says |
| split control | p=17, D=4 | 1728≡11 ordinary; v₄=0; H′/H=1/(j−11)≠0 | hypothesis inert-or-ramified needed |
| Frobenius descent | p=37 | supersingular 8, 3±10t by Hasse invariant over all 1369 elements; (−2−10t)(17+26t)=1; 17+26t∉𝔽₃₇; sum 34 | descent condition necessary |
| w_p=−T_p on the torus | cusps of X₀(p) | T_p(∞)=p(∞), T_p(0)=(0)+(p−1)(∞), both of degree p; T_p fixes (0)−(∞); w_p inverts f(0)/f(∞) | consistent |
| z̄=−w_p z | x₁=ȳ, x₂=w_p y | z̄=[(w_p ȳ)−(y)]; −w_p z=−[(y)−(w_p ȳ)] | equal |
| G⁰(ℤ) finite versus G⁰(O_K) | K real quadratic | 𝔾_m(ℤ)=±1 finite; 𝔾_m(O_K)=O_K^× infinite | descent to ℚ needed; reviewer's 𝔾_m(ℚ)=ℚ^× infinite |
| Cartan count | p=11 | 13200/240=55; cusps (11−1)/2=5 | not a bijection |
| §5.16 Checks moved | X₀(1); ℝ/ℤ | order one; 1/11 killed by 11 with non-torsion summands | unchanged values |

## Sources, ownership and the maintainer

- Source issues recorded in this round: bilu-parent-rebolledo line 832 (equation (5.2) exact only for p inert and D∉{3,4}), lines 775–781 (𝔽_p^S needs base change to 𝔽_(p²) and descent) and line 768 (Merel's torsion sentence fails over real quadratic O_K); darmon-merel line 722 (cusps are not the (p−1)/2 Cartan subgroups). The citations stay by locator; the README states the corrected forms.
- Ownership: the general cuspidal-divisor torsion theorem is now imported from EisensteinIdealAndRationalTorsion §7.9 (open head, earlier in the order). No new owner question arises; the generalized Jacobian of X₀(p) remains here as before. Ownership against the open pull requests was checked through `roadmaps grep` and the heads named in the brief.
- Changed names and sections: §5.10a is deleted; its consumers cite EisensteinIdealAndRationalTorsion §7.9. No Lean name changed. MordellLawrenceVenkatesh and elkik-1990 are no longer cited. The Downstream consumers paragraph now records that ErdosProgressionPowers cites the sibling EllipticCurveModularityPartII for EC.0–EC.5; the settled duplicate between the two roadmaps is the maintainer's decision and is not re-raised.
- `design/plan.json` is unchanged: no supplier gap was added or removed.
