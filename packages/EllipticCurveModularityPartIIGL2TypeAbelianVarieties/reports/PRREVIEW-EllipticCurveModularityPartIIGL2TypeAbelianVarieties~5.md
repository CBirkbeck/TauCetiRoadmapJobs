# Review of EllipticCurveModularityPartIIGL2TypeAbelianVarieties (pull request #1036 at d30b928)

**Verdict:** accepted

**Summary.** Accepted: no statement of the roadmap was found false, unsupported or unowned, the sampled locators agree with the sources, and `Suggested.lean` elaborates with its three `sorry` warnings only. There are eight small corrections, the most important being that the roadmap named as the downstream consumer of §6.4 does not consume it, and that the E-equivariance asserted in §1.3 rests on a Skolem–Noether step the proof plan does not name; and four format notes. None blocks. One fact about the ordering of Layer 2 against its main source is left for the human reviewers.

## C01 — The roadmap named as the consumer of §6.4 does not consume it

A reader of “Downstream consumers” (README line 1395) is told: “EllipticCurveModularityImaginaryQuadratic uses §6.4 for non-CM ℚ-curves over quadratic fields in the Caraiani–Newton sense.” That roadmap, at the head of its open pull request, cites this roadmap nowhere and never mentions ℚ-curves (0 occurrences of this roadmap's name, of `GT.`, of “ℚ-curve” in its README); its route is the prime switch that proves modularity for every curve without the quadratic-point case analysis. It also stands before this roadmap in the merge order, so it could not consume §6.4 without an upward edge. The roadmaps that do cite this one are AbelianSurfacesModularity (GT.3, its supplier contracts) and SatoTateGroups (`End0`, `totallyRealOrCm`, `IsGeometricQCurve`).

The smallest change: say what §6.4 supplies mathematically (the ℚ-curve input to Caraiani–Newton Corollaries 7.2.5 and 7.3.4 and to Freitas–Le Hung–Siksek §12, as §6.4 already says) without attributing its use to EllipticCurveModularityImaginaryQuadratic, and name the two roadmaps that cite Layers 1, 3 and 5.

## C02 — The pull request description repeats the same consumer claim

The summary block says “Its quadratic-field theorem supplies EllipticCurveModularityImaginaryQuadratic with the ℚ-curve cases that Caraiani–Newton's argument requires”, and the prose ends “… modularity of non-CM ℚ-curves over their fields of definition, which the imaginary-quadratic modularity roadmap consumes.” For the reason given in C01 the head of that roadmap contradicts both. Text that would be right: “Its quadratic-field theorem is the ℚ-curve input of Caraiani–Newton's Corollaries 7.2.5 and 7.3.4”, and in the prose drop the relative clause.

## C03 — The description does not state the change of supplier for Serre's conjecture, and its merge-order chain is the earlier one

Since the head the previous review read, §3.2, the Layer 3 dependencies and the supplier table take the strong form of Serre's conjecture from SerreModularityByCompatibleSystems (`S6/strong-form-of-serre-conjecture`) and no longer cite ClassicalSerreModularity (0 occurrences in the README). The prose of the description does not say so; it says “The open pull requests that must merge first are in the merge order below”, and the generated `merge-order` block still chains through ClassicalSerreModularity and omits SerreModularityByCompatibleSystems, which the `depends-on` block lists. One sentence in the prose would do: “Serre's conjecture is consumed from SerreModularityByCompatibleSystems Layer S6; ClassicalSerreModularity is no longer a supplier”, with the `merge-order` block regenerated.

## C04 — The proof plan of §1.3 does not provide the E-equivariance that its statement and `ribetTheorem21` assert

§1.3 states an E-equivariant ℚ-isogeny `A ∼ E ⊗_F B`, and `ribetTheorem21` asserts an algebra isomorphism e with `e (ι x) = Algebra.leftMulMatrix b x`; §1.2's equivalence “primitive ⇔ ℚ-simple” needs exactly this, since primitivity is defined through equivariant isogenies. Steps 1–4 (README lines 216–219) give `X ≅ M_n(F)` and `A ∼ Bⁿ` and stop there, as the source does (Ribet92 lines 122–130). To pass from an arbitrary isomorphism `X ≅ M_n(F)` to one carrying ι to the regular representation one conjugates one F-embedding `E → M_n(F)` into the other, which is Skolem–Noether; neither a step nor the *Needs:* line names it.

It is available at the pin: `TauCeti.skolemNoether`, `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`. Add a step 3a saying that the two F-algebra embeddings of E into `M_n(F)` are conjugate by an element of `GL_n(F)`, which is an isogeny of `Bⁿ`, and add the declaration to the *Needs:* line.

## C05 — §3.9 attributes to Serre a prediction that the cited page makes about ℚ-curves

Line 820: “This is the Γ₀ form of the modular characterization that Serre predicted ([Ribet92], §1, p. 2)”. At that place (Ribet92 lines 69–71) what Serre is said to have predicted is the characterisation of the elliptic curves over ℚ̄ that are quotients of some `X₁(N)` as the ℚ-curves, which is §5.7 here, not the equivalence of total reality, trivial ε and Γ₀ modularity. The two other locators of §3.9 (Ribet92 line 172 for `det ρ_λ = χ_ℓ` when E is totally real, lines 671–673 for “ε nontrivial iff E imaginary”) do support the statement. Either move the sentence about Serre to §5.7 or replace it by “This is the Γ₀ refinement of Theorem 4.4 of Ribet92”.

## C06 — §§3.4 and 3.5 cite the proof of Ribet's Theorem 4.4 for steps that proof does not take

Both end “Sources: [Ribet92], proof of Theorem 4.4, p. 8”. That proof (Ribet92 lines 339–360, pp. 8–9) goes from the homomorphisms `φ_λ` to a nonzero Galois map `A_f[ℓ] → A[ℓ]` for infinitely many ℓ and then to `Hom_ℚ(A_f, A) ≠ 0` by Faltings' finiteness; it never identifies `K_f` with E through exact coefficients and never compares λ-adic representations. The statements of §§3.4–3.5 are true and follow from Theorem 4.4 together with Ribet80, Corollary 4.2, but the route (integral closure of `𝒪_{K_f} ⊗ 𝒪_E`, vanishing of an algebraic integer, Chebotarev and Brauer–Nesbitt) is the roadmap's own. Write the locator as “consequence of [Ribet92], Theorem 4.4, pp. 8–9; the route here differs from Ribet's”, as §6.2 already does for its general statement.

## C07 — The module docstring calls Tate's vanishing “a supplier's theorem”, while §5.3 makes it a target of this roadmap

`Suggested.lean` lines 30–31: “Tate's vanishing `H²(G_ℚ, ℚ̄ˣ) = 0` (§5.3) is a supplier's theorem and is not restated here.” The supplier, ArithmeticGaloisRepresentations §7.6 (Projective lifting), proves `H²(G_F, ℚ/ℤ) = 0`; the `ℚ̄ˣ` form is proved in §5.3 here from it (“Prove that continuous `H²(G_ℚ,ℚ̄ˣ)` vanishes …”), and the supplier table says the same (“from which the ℚ̄ˣ version follows”). The sentence would be right as: “Tate's vanishing (§5.3) is derived here from the supplier's `ℚ/ℤ` form; it is an auxiliary result, not a headline, and is not stated in this file.”

## C08 — The `J₀(23)` Check of §3.2 holds only where `ρ̄_λ` is irreducible, and one of the primes it names is Eisenstein

Line 653: “For `J₀(23)` and λ above ℓ ≡ `±1` mod 5, `g_λ` can be taken to be the newform of level 23.” The witness `g_λ` exists only for λ in Λ, that is with `ρ̄_λ` absolutely irreducible. At ℓ = 11 ≡ 1 mod 5 the prime `λ = (11, a₂ − 3)` fails this: `3² + 3 − 1 = 11`, so `a₂ ≡ 3 = 1 + 2`, and `a₃ = −(2a₂ + 1) ≡ −7 ≡ 4 = 1 + 3` modulo λ, the Eisenstein congruences of the rational point of order 11. Add “with `ρ̄_λ` absolutely irreducible” to the Check; the prime above 11 would then be a second negative control beside `X₀(11)[5]`.

## N01 — Four pointers have the wrong direction since the scope and the contracts moved to the end

“the contracts above” (lines 82 and 1085) should read “below”; “imported at the layers specified below” (line 1467) and “The `J₀(23)` worked checks below” (line 1489) should read “above”.

## N02 — Two supplier names stand in code font although no pinned library declares them

`TateModule.lambdaTateModule` and `TateModule.residualRep` (lines 47, 336, 356, 1484) are intended signatures of ArithmeticGaloisRepresentations §§6.4 and 6.1, which that roadmap writes in italics. Saying “the supplier's intended `…`” once would let a reader tell them from the declarations of the second table.

## N03 — §1.1 says the division algebra acts “on `End⁰_ℚ(A)`”

Line 123: D acts on A up to isogeny, through a unital map `D → End⁰_ℚ(A)`; it does not act on the endomorphism algebra.

## N04 — §6.3 could say, as §6.2 does, which part of its statement is the roadmap's own deduction

The locators of §6.3 (FLHS15 §12, p. 18; CN23 §1, p. 2) state the definition of modularity and that ℚ-curves are modular; the statement over an arbitrary solvable Galois field, with every finite local factor, is the consequence of steps 1–4. One sentence saying so would match §6.2.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 degree divides dimension | `B × B` with quadratic and cubic fields; regular `ℚ(√2)`; supersingular curve over `𝔽_p` | `2 ∣ 2`; `3 ∤ 2`; `√2 ↦ [[0,2],[1,0]]` sends e₁ to e₂; quaternion algebra of dimension 4 on a curve, Frobenius zero on Lie | Agrees; Ribet92 lines 75–82 (fields only, division algebras at 113–116) | N03 |
| §1.2 primitive, power construction | `E = F`; `ℚ(√2) ⊗ B`; two bases | n = 1 returns B; `dim = 2 = [E:ℚ]`, not simple; change of basis in `GL_n(F)` | Agrees; Ribet92 lines 91–99 defines primitivity without equivariance, equivalent by §1.3 | none |
| §1.3 and `ribetTheorem21` | A simple; `B × B` with `ℚ(i)`; `J₀(23)` | `F = E`, n = 1; `X = M₂(ℚ)`, centraliser of `ℚ(i)` of dimension 2, n = 2; `hd` forces `dim ≥ 1` | True; Ribet92 lines 100–131 | C04 |
| §1.4 endomorphism field | elliptic curve; `J₀(23)`; `B × B` | ℚ; `T₂² + T₂ − 1`, discriminant 5, `ℚ(√5)`; `M₂(ℚ)` not a field | Agrees; Ribet92 lines 156–159 | none |
| §1.5 and `totallyRealOrCm` | ℚ; `ℚ(√5)`; `ℚ(√−3)`; nontrivial involution on `ℚ(√2)` | totally real; totally real; CM; `Tr(x x†) = 2(a² − 2b²) = −2` at a = b = 1, not positive | Agrees; Ribet92 lines 157–159, 234–237; `IsCMField` at `Mathlib/NumberTheory/NumberField/CMField.lean:70` | none |
| §2.3 determinant | E real; `J₁(13)`; norm | ε = 1; ε of order 6; `χ^n = N(ε)·χ^n` gives `N(ε) = 1` | Agrees; Ribet92 lines 177–206 | none |
| §2.9 residual irreducibility | `X₀(11)` at 5; `J₀(23)` at `(11, a₂ − 3)` | rational 5-torsion; `a₂ ≡ 3`, `a₃ ≡ 4`, both `≡ 1 + p` | Finitely many exceptions, as stated; Ribet92 lines 295–299 | none |
| §3.1 modular varieties | N ≤ 10, N = 12; N = 11, 13, 22 | genus 0; `g(X₁(11)) = 1`, `g(X₁(13)) = 2`, `g(X₀(13)) = 0`; level 11 gives level 22 | Agrees; KW-I lines 919–921 | none |
| §3.2 witnesses | `J₀(23)`, ℓ = 11 | λ Eisenstein: `ρ̄_λ` reducible, λ not in Λ | Check too wide | C08 |
| §3.4 exact coefficients | `ℚ(√5)` at 5; `dim A = 1` | both factors send `√5 ↦ 0`, 5 divides D; `K_f = ℚ` | Agrees; route not in Ribet92 lines 339–360 | C06 |
| §3.5 comparison with the newform | dimension 1; dimension 2 | `2 = 2`; `Σ_{λ∣ℓ}[E_λ:ℚ_ℓ]·2 = 4 = dim V_ℓ`, one conjugate factor gives 2 | Agrees | C06 |
| §3.6 modularity (headline) | simple A; `Bⁿ`, n = 2 | `A_f → A`; `d(2^{n−1}) = n` copies in `J₁(N·2^{n−1})`, `d(2) = 2` | Agrees; KW-I line 923, Ribet92 lines 336–338 | none |
| §3.9 Γ₀ form | `J₀(23)`; `J₁(13)` | E real, ε = 1; ε of order 6, `J₀(13) = 0` | Agrees; Ribet92 lines 172, 671–673; line 71 is about ℚ-curves | C05 |
| §3.10 parametrisation | `dim A = 0`; `J₁(13)`; `B × B` at level 22 | constant map excluded by `dim A > 0`; Abel–Jacobi embedding, genus 2; `d(2) = 2` | Agrees; Ribet92 lines 9–18 | none |
| §4.1 conductor (headline) | `J₀(23)`; elliptic curve | `Σ[E_λ:ℚ_ℓ] = 2`, `f₂₃ = 2·1`, `cond = 529`; n = 1, `cond = N` | Agrees; Carayol86 lines 86–104 | none |
| §4.2 exact level (headline) | `J₀(23)`; n = 1 | `N(A) = 23`; KW level `cond^n = 529² = 23⁴ = N^{n²}`; equal for n = 1 | Agrees; KW-I lines 920–921 | none |
| §4.3 strict compatibility | `X₀(11)` at 3 | `a₃ = −1`: Tate `X² + X + 3`, dual `X² + X/3 + 1/3` | Agrees; KW-I lines 288–306, Carayol86 lines 77–92 | none |
| §4.5 dimension one | `y² + y = x³ − x² − 10x − 20` | `Δ = −11⁵ = −161051`, `c₄ = 496`, `j = −122023936/161051`, 5 points over `𝔽₂`, `a₂ = −2`; rescaled `Δ·2¹²` | Agrees; DDT lines 677–698, 2132–2135 | none |
| §5.1 Checks | twist of `y² = x³ − x + 1` by √2 at 7 | 12 points over `𝔽₇`, `a₇ = −4`; `√2 ↦ 3` (non-residue) gives 4, `↦ 4` gives −4; `j = −6912/23` | Agrees | none |
| §5.3 Tate vanishing | exact sequence; natural action | `H¹(M/μ_∞) = 0 → H²(μ_∞) → H²(M) → 0`; `c(1,1) = α(1) = 1`; with Galois action `Br(ℚ) ≠ 0` | Agrees; Ribet92 lines 535–549 | C07 |
| §5.6 and `ribetTheorem61` (headline) | rational model; cubic character; `ℚ(√13)` curve with order-five character; CM curve | `E_α = ℚ`; `ℚ[C₃] = ℚ × ℚ(ζ₃)`, dimension 2; `[ℚ(√3, ζ₅):ℚ] = 8`; `dim End⁰ = 2`, hypothesis fails | Agrees; Ribet92 lines 515–518, 633–644 | none |
| §5.7 quotients of `J₁(N)` | curve over ℚ | `K′ = ℚ`, f its newform | Agrees; Ribet92 lines 519–522, FLHS15 lines 841–845 | none |
| §5.8 quadratic Weil restriction | m square; m < 0; K imaginary; levels 81 and 169 | `ℚ × ℚ`; `deg μ = ∣m∣`, `θ(σ) = m/∣m∣`; `m = γγ̄ > 0`; `(ℚ(√3), ℚ(√−3))`, `(ℚ(√3), ℚ(√13))` | Agrees; Ribet92 lines 646–707 | none |
| §6.1 twist by a character | `S₃ × C₃`; `H = G`; reducible restriction | trace `2ζ₃` against `2ζ₃⁻¹`; ψ = 1; `Hom_H` of dimension 2 | Agrees | none |
| §6.3 solvable fields (headline) | K = ℚ; split multiplicative place | `Π = π_f ⊗ ψ`; Frobenius 1 on coinvariants, q on the invariant line, factor `1 − T` | Agrees; CN23 lines 57–60, 5052–5056; FLHS15 lines 66–69, 841–845 | N04 |
| §6.4 quadratic fields (headline) | CM curve; m square | modular by definition (CN23 lines 57–58); two non-isogenous twists, both Γ₀-modular, product a quotient of `J₀(N)` | Agrees; CN23 lines 4987–4995; FLHS15 lines 851–888 | none |
| Downstream consumers | EllipticCurveModularityImaginaryQuadratic at its open head | citations of this roadmap: 0; “ℚ-curve”: 0; merge-order position 205 against 267 | Contradicted | C01, C02 |

- Previous review: it had no finding; its four repaired items remain repaired (docstrings at `Suggested.lean:42`–50, the Layer 5 section comment at :95 equal to the README heading, the grouping convention now at README lines 15–18, the AI-assistance sentence of the description).
- Source locators checked against the text: 44 (Ribet92 27, KW-I 3, Carayol86 3, FLHS15 3, CN23 5, DDT 2, Ribet80 1); all 15 sampled targets included; the README flags none as unverified.
- Library declarations opened at the pins: 16, among them `NumberField.IsCMField` (`CMField.lean:70`), `AbelianVariety.baseChange` (`Basic.lean:281`), `AbelianVariety.End` (`End/Basic.lean:74`), `finrank_tangentSpace_eq_dim` (`TangentSpace.lean:193`), `Module.finrank_dvd_finrank_right` (`Dimension/Free.lean:85`), `TauCeti.skolemNoether` (`SkolemNoether.lean:107`), `TauCeti.CoefficientField` (`Newforms/Fields.lean:48`).
- Cross-roadmap citations resolved to headings: 22 roadmaps, on main or, for SerreModularityByCompatibleSystems, EllipticCurveModularity, AutomorphicGaloisRepresentations and FaltingsFinitenessAndIsogenyTheorems, at their open heads; none missing. GL₂-type data is owned by SmallRamificationAndAbelianVarietyBaseCases §5.1 and cited; SerreModularityByCompatibleSystems leaves Khare–Wintenberger Corollary 10.2(i) outside its scope, so §3.6 has one owner.
- Automatic checks: all passed. Dependency check: `depcheck: 210 roadmaps, 2275 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `Suggested.lean` gives three `declaration uses sorry` warnings (lines 76, 91, 100) and nothing else. The nine `#check @name` types were compared with the README; no binder lost, nothing changed. One-tactic probe: `simp`, `rfl`, `infer_instance`, `trivial`, `aesop`, `tauto` on each of the three theorems, 18 attempts, 18 failures: no padding.
- Headlines: modularity (§3.6), conductor and exact level (§§4.1–4.2), the ℚ-curve factor (§5.6), automorphy over solvable and quadratic fields (§§6.3–6.4). Stated: §§1.3, 1.5, 5.6. The others need `J₁(N)`, `A_f`, conductors or automorphic representations, absent at the pins and named in the module docstring.
- Overlap check: read EllipticCurveModularity, EllipticCurveModularityTotallyReal, ClassicalSerreModularity, AutomorphicGaloisRepresentations, EllipticCurveModularityImaginaryQuadratic, AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation, SmallRamificationAndAbelianVarietyBaseCases; shared objects: the GL₂-type bundle (owner SmallRamificationAndAbelianVarietyBaseCases §5.1, cited), the residual attachment predicate (owner AlgebraicModularFormsAndSerreWeights §7.5, cited), dimension-one modularity (owner EllipticCurveModularity R29, compared in §4.5); nothing with two owners.

Source independence: 24 passages compared with 6 sources (Ribet92, KW-I, Carayol86, FLHS15, CN23, DDT), none reproduced, longest shared run 6 words (a phrase on the Lie algebra in §5.6); largest share Ribet92, 54 of 82 locators; contents compared with Ribet92 (§§1–8): Layers 4 and 6 have no counterpart, its §§5 and 8 are not used, Layer 1 takes material of its §3, Layer 2 of its §4, Layer 5 merges its §§6–7; the layer order is forced by the layer dependency lines (2 on 1, 3 on 1–2, 4 on 2–3, 5 on 1–4, 6 on 5): independent. Shimura71, FW84 and DS05 were not read.

Research link: the headline targets are Ribet's 1992 theorems on GL₂-type varieties and ℚ-curves, made unconditional by Khare–Wintenberger 2009 (Corollary 10.2); modularity of ℚ-curves over quadratic fields is used by Freitas–Le Hung–Siksek 2015 (§12) and Caraiani–Newton 2023 (Corollaries 7.2.5, 7.3.4). Rests on Ribet92, KW-I, FLHS15 and CN23 as read.

## Not verifiable

- Shimura71, Theorem 1, p. 206 (§5.7, step 2): the publisher's page is on a host in no licence class and no open copy was found; Ribet92 line 48 cites the same theorem for the same fact.
- FW84, Theorem 1, p. 204 (§2.9) and DS05, §5.10 (§4.4): cited by locator alone; not read. Ribet92 line 297 gives the FW84 locator as the README does.

## Source issues

- none

## For the human reviewers

- **Arrangement.** Targets 2.3–2.11 of the README follow Ribet92's results (3.1)–(3.7), (4.1), (4.2) one for one and in that order; the dependency lines force it except for the place of 2.5. The layers themselves do not follow the source's sections.
- **Not tested.** Shimura71, FW84 and DS05 (one locator each) could not be read; no statement of the roadmap rests on them alone.
