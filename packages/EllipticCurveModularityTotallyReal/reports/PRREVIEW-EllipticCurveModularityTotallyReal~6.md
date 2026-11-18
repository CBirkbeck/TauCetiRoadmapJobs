# Review of EllipticCurveModularityTotallyReal (pull request #2185 at 77d2100)

**Verdict:** accepted

**Summary.** Accepted: no statement of the roadmap was found false, unsupported or unowned, and both Lean statements elaborate and are not closed by one tactic. The acceptance is conditional on the three supplier contracts the README declares (weight-two lifting in GL2ModularityLifting, solvable residual modularity in cohomological weight in GL2AutomorphicRepresentationsAndTransfer, the field of definition of CM endomorphisms in ComplexMultiplicationAndExplicitReciprocity). There are three small corrections and one format note, none blocking. The humans who approve have four points to decide, chiefly that the two main sources are unrefereed 2026 preprints.

## C01 — JacobianChallenge constructs the Jacobian without a rational point, so the point is not one of its standing hypotheses

A reader of the supplier contract would conclude that `J^δ_m` exists only because §1.2(6) produces a point, and that the import would fail for a pointless curve such as `D_t`, whose `Pic⁰` the imported `auxiliaryEllipticCurve` uses. In the contract "From TauCetiRoadmap.JacobianChallenge" (README line 1329) the text says "The rational point is one of that roadmap's standing hypotheses". JacobianChallenge on main says the opposite in its Conventions (line 100 there): the point `x₀` "is a hypothesis exactly of the statements that use it: the Abel–Jacobi morphism, its universal property and the rigidified comparisons. `Jac X` is constructed without one (Layer D)", and its summary repeats "constructed without a rational point".

The smallest change: "Layers D–F: the Jacobian `Pic⁰` of a smooth proper geometrically connected curve over a field, as an abelian variety, constructed without a rational point; the Abel–Jacobi map needs one, and the curves `C^δ_m` have one, `φ⁻¹(O, 1)` of §1.2(6)."

## C02 — ModularityAndLanglandsExtensions states no degree restriction on the base field that §4.4 could remove

A reader who follows the second bullet of "Downstream consumers" (README line 1139) to that roadmap finds nothing to match it. The bullet says "§4.4 removes degree restrictions on the base field there". At their open heads, ModularityAndLanglandsExtensions and its Part II take elliptic modularity over ℚ from "EllipticCurveModularity, Layer R29.6 (the cuspidal `π_E`)" (its README line 2151 and the contract at line 3008), say that "Over an arbitrary number field the elliptic conclusion is potential modularity" (line 3048), and neither names this roadmap nor mentions real quadratic or bounded-degree base fields for elliptic curves. The pull request's description repeats the claim ("the elliptic input of the applications in ModularityAndLanglandsExtensions").

The smallest change is to say what is true today: "ModularityAndLanglandsExtensions and its Part II take elliptic modularity over ℚ from EllipticCurveModularity; §4.4 makes the same input available over every totally real field", and the same in the description.

## C03 — The description does not say that the endpoint rests on three statements its suppliers do not yet contain

Someone reading only the pull request's text learns that the roadmap "covers every coefficient prime and every finite local factor" and that the dependencies are "the roadmaps the README cites by name and section". The README's supplier contracts say more: §2.2, §2.4 and §4.3 each use a statement that the named supplier "must add" (after §5.10 of GL2ModularityLifting, after R17.5.14 of GL2AutomorphicRepresentationsAndTransfer, before §1.1 of ComplexMultiplicationAndExplicitReciprocity), and GL2AutomorphicRepresentationsAndTransfer is already on main, so its addition is a revision of a merged roadmap. Through §§3.2–3.3 and §4.1 the endpoint §4.4 depends on all three.

The text that would be right, added to the Dependencies paragraph: "Three statements are required of suppliers and are specified under Exact supplier contracts: the totally real weight-two lifting theorem without local matching (GL2ModularityLifting, Layer 5), solvable residual modularity in a cohomological weight (GL2AutomorphicRepresentationsAndTransfer, R17.5, a roadmap on main), and the field of definition of the endomorphisms of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity, Layer 1). §4.4 is conditional on them."

## N01 — The determinant sentence of the Conventions attaches "transported by duality" to the wrong side

In the second bullet of the Conventions (README lines 71–73), `TauCeti.det_tateModuleGaloisRepresentation` is the statement `det V_ℓ(E) = ε_ℓ` itself; it is `det H¹(E) = ε_ℓ⁻¹` that is obtained from it by duality. Moving the clause to the `H¹` statement would say that.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 real cyclotomic data; `realCyclotomic_isCMField` | (ℚ,3), (ℚ,4), (ℚ,6), (ℚ(√2),8), (ℚ(√5),5), (ℚ(√−3),3), (ℚ(i),3) | `ζ+ζ⁻¹` = −1, 0, 1, √2, (−1+√5)/2; L = ℚ, ℚ, ℚ, k, k; non-real k: L = k ≠ max real subfield ℚ(√3) of ℚ(ζ₁₂) | true; totally real hypothesis needed and present | none |
| 1.2 reflection twist | cocycle law; rationality of `u′_ζ`; point `(O,ζ)`; matrix witness | `a_{gh}=a_g·ᵍa_h`; `φ⁻¹w^e u_{ζ^δ} w^e φ = u′_ζ`; `w(O,ζ⁻¹)=(O,ζ)`; `R³=I`, `WRW=R²` | true | none |
| 1.2 cubic negative control | n = 5 and n = 15, cubic cover | valuations 1,−1,−5,5: four branch points, `2g−2=8`, g = 5; ∓15: two, `2g−2=4`, g = 3 | true | none |
| 1.3 descended systems | `w′^*` on `W_θ`; induction non-example; n = 3 | `u′^*_ζ w′^* x = θ(ζ)⁻¹ w′^* x`; `Ind V_θ = W_θ ⊗ (1 ⊕ δ)`, rank 4; `6 = 2+2+2` | true | none |
| 1.4 determinant, oddness, restriction | alternation; `y²=x³−x+1` mod 5, inert in ℚ(√−3); ramified `ℚ(√5)` | `[y,x]=−[x,y]`; 8 points, `a₅=−2`; `P_{1,5}=X²−2X+5`; squared roots give `X²+6X+25`, 32 points over 𝔽₂₅; f = 1 keeps `X²−2X+5` | true | none |
| 1.5 lattices and chain | `ψ̄ = 1` mod p, `η̄ = 1` mod 3; k′ = k(μ₁₅, J[3]) | chain `η ≡_p χ ≡_3 ψ ≡_p 1`; `H¹(𝔽₃) ≅ J[3]⊗μ₃⁻¹` trivial over k′, so accidental `W_χ ≡_3 W_η` | true; LeHung26 lines 136–138 agree with `W_η ≡_3 W_1` | none |
| 1.6 endpoints | `w′`-invariants of `H¹(C^δ_3)` | `0 + 2 = 2`; `H¹(E)|G_L ≅ W_1⊗δ⊗χ_{h(t)}` | true | none |
| 2.1 change of prime | 11a1 at 3; non-split extension of `ε_ℓ⁻¹` by 1 | `X²+X+3` for all ℓ ≠ 3; same polynomials, not isomorphic, so semisimplicity needed | true | none |
| 2.2 lifting for summands | ℓ = 2, 3, 5; 𝔽₂₅ control `C = aB`, `a² = 3` | `B²=2I`, `C²=I`, `det C = 4` square, `det B = 3` nonsquare; LeHung26 line 231 excludes 5, BD14 line 2145 has hypothesis (a), FLHS15 lines 241–265 give (b) | true as a declared supplier contract | none |
| 2.3 switch curve; `three_five_switch` | group orders; `ζ₃ ∈ K`; multiplication by 2 on `E[5]` | 24 ∤ 12, 8, 16; determinant trivial so image ≤ SL₂(𝔽₃); `e₅(2P,2Q)=e₅(P,Q)⁴` | true; README adds infinitude to FLHS15 Lemma 6.1 with its own argument | none |
| 2.4 mod-three seed | chain of GL₂(𝔽₃); oddness | orders 48, 24, 8, 2, 1, abelian quotients; `ε̄₃⁻¹(c) = −1 ≠ 1` | true, on the declared residual-modularity contract | none |
| 2.5 mod-five seed | line stabilisers in SL₂(𝔽₃); image GL₂(𝔽₅) | orders 6 and dividing 4, both < 24; projective image of `G_{K(ζ₅)}` is PSL₂(𝔽₅), so alternative (b) is needed | true | none |
| 3.1 parameter | `c(λ)` at cube root; order of 3 mod 101 and mod 7; `L(ζ_ℓ)` | `c = 3`; `3^50 ≡ −1`, `3^20 ≡ 84` mod 101, order 100; order 6 mod 7; `L(ζ₃)=L(ζ_p)=M` | true; hypotheses equal the supplier's §§7.2 and 7.4 | none |
| 3.2 auxiliary seed | subgroup inclusion | `G_{M(ζ₅)} ⊆ G_{L(ζ₅)} ⊆ G_{K(ζ₅)}`; irreducibility passes upward | true | none |
| 3.3 three lifts | each row against §2.2 | primes p, 3, p, never 5; residual irreducibility from 3.1(1), (2), (3); idempotent `e_θ ∈ M₀[U′]` | true | none |
| 4.1 descent | cubic `x³−4x+1`; twists of an irreducible restriction | discriminant `256−27 = 229`, prime, positive: totally real S₃; one descent of `χ⊕χ⁻¹`, three of `1⊕1` | true | none |
| 4.2 local factors | 11a1 at 3 and 11; `y²=x³−x+1` at 23; Steinberg | `(1+3^{−s}+3^{1−2s})⁻¹`; `1−T`; Δ = −368 = −2⁴·23, `c₄ = 48`, 5 nonsquare mod 23; eigenvalues `q^{∓1/2}·q^{1/2} = 1, q` | true | none |
| 4.3 CM branch | `y²=x³−x` at 3, 5; `y²=x³+1` at 5; central character | 4 points, `a₃=0`; 8 points, `a₅=−2`, `−1±2i`; 6 points; `η(3)ξ(3)/3 = (−1)(−3)/3 = 1`; `ξ^u_∞ = (z/|z|)^{±1}` | true | none |
| 4.4 endpoint | K = ℚ; `ℚ(√5)` example | d = 1 gives p > 100; `j = −6912/23` non-integral, so non-CM | true, conditional on the three contracts | none |
| Conventions: twist rule on `H¹` | `y²=x³+1` and `y²=2x³+1` over ℚ(ζ₃) | `a_g(x,y) = (ζ₃⁻¹x,y)`; `(a_g⁻¹)^*ω = ζ₃ω`, the transported action; uninverted gives `ζ₃⁻¹ω` | true | none |
| JacobianChallenge contract (C01) | its Conventions on main | `Jac X` built without a point; point only for Abel–Jacobi | README misdescribes the supplier | C01 |
| Downstream consumers (C02) | ModularityAndLanglandsExtensions and Part II at their heads | no elliptic degree restriction; elliptic input is EllipticCurveModularity R29.6 over ℚ | claim not found there | C02 |

- Source locators checked against the text: 51 (LeHung26 22, FLHS15 12, OpenAI26 6, BD14 2, BLGG12 2, BLGG13II 3, Kisin09 1, BCDT01 1, SW99 2), all at the stated line and printed page.
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): 27, among them `NumberField.CMExtension.eq_maximalRealSubfield` (`Mathlib/NumberTheory/NumberField/CMField.lean:456`), `IsCyclotomicExtension.Rat.isCMField` (same file, 564, base ℚ only, so §1.1 is not a restatement), `WeierstrassCurve.torsionGaloisAction` (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77`), `TauCeti.Isogeny.weilPairing` (`.../WeilPairing/Basic.lean:225`), `WeierstrassCurve.nonempty_basis_torsionBy` (`.../Torsion/Structure.lean:149`).
- Cross-roadmap citations resolved: over 80 section or target citations in 23 roadmaps, at main or at the open head; the sections of EllipticCurveModularityImaginaryQuadratic cited as §§4.2, 4.4, 7.4 and 8.5 are run-in numbered paragraphs there and resolve.
- Declared supplier contracts: three, each with the same slug in the plan and in the README, each precise and not already provided (R17.5.14 gives weight one only; GL2ModularityLifting §§5.7 and 5.10 need potentially Barsotti–Tate lifts; ComplexMultiplicationAndExplicitReciprocity §1.1 has the equivariance over ℚ only).
- Dependency check: `depcheck: 209 roadmaps, 2259 edges, 0 problem(s)`; no upward or cyclic line. EllipticCurveModularity, which takes §4.4 at K = ℚ in its Layer R29.3, is later in the merge order and none of this roadmap's suppliers cites it as a supplier.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; `#check @realCyclotomic_isCMField` and the elaborated type of `three_five_switch` agree with README §§1.1 and 2.3 and no binder is lost; `simp`, `rfl`, instance search and `aesop` close neither.
- Automatic checks: all passed on this head; no change outside the folder.
- Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityImaginaryQuadraticPartII, EllipticCurveModularity, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, SmallRamificationAndAbelianVarietyBaseCases; shared objects and owners: the cyclic covers, character systems and `SymplecticTorsionEquiv` (EllipticCurveModularityImaginaryQuadratic, cited), the raw compatible-system carrier (SmallRamificationAndAbelianVarietyBaseCases §5.0d, cited), the newform of an elliptic curve over ℚ (this roadmap §4.4, cited by EllipticCurveModularity R29.3), the totally real change of prime §2.1 (here, a stated variant of the CM statement §8.1 there).

Source independence: 13 passages compared with 5 sources (LeHung26, OpenAI26, FLHS15, BD14, BLGG13II), none shared beyond formulas and one-way hypotheses; largest share LeHung26, 35 of 87 source references; contents compared with LeHung26: independent (Layer 1 expands its §3.2 into six sections and precedes Layer 2, which draws on its §§2.4 and 3.1 and on FLHS15 §§2, 5, 6; Layer 3 is its §§3.3–3.4; Layer 4 its §5 with OpenAI26 §9.4).

Research link: The endpoint extends Freitas–Le Hung–Siksek 2015 (real quadratic fields) to all totally real fields by the prime switch of Le Hung 2026 and OpenAI 2026, using the Breuil–Diamond 2014 lifting theorem; over ℚ it gives Breuil–Conrad–Diamond–Taylor 2001, Theorem A. Rests on the README and on LeHung26, FLHS15 and BD14 as read.

## Not verifiable

- The licence class of the copy of LeHung26: its host is recorded in the manifest as an open repository; I could read the text but could not classify the host myself.
- The description's sentence on earlier review and red-team rounds: nothing in the folder records them.

## Source issues

- none

## For the human reviewers

- Scope: the largest source, LeHung26 (35 of 87 references), is a "discussion draft" of 7 October 2026 whose Theorem 1.1 (line 86) is conditional on inputs of OpenAI26, itself an unrefereed preprint; LeHung26 lines 147–149 say its first draft was machine-generated. The refereed sources (FLHS15, BD14) cover real quadratic fields and the lifting theorem.
- Licence: LeHung26 is read from `hexagonmath.org` and OpenAI26 from a file in a public code repository; neither copy states a licence that I could find.
- Reuse: the three-row table of §3.3 has the same first three columns (modular system, prime, target) as the table at LeHung26 lines 266–269; the entries are the congruence chain and the other two columns are the roadmap's own.
- Conditional acceptance: §4.4 depends on three statements that GL2ModularityLifting, GL2AutomorphicRepresentationsAndTransfer (on main) and ComplexMultiplicationAndExplicitReciprocity do not yet contain; the README specifies each under its supplier contracts.
