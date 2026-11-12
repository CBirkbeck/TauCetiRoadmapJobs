# Review of EllipticCurveModularityTotallyReal (pull request #2185 at 7df3ef6)

**Verdict:** accepted

No findings. The acceptance is conditional on the three declared supplier gaps
(`gap:totally-real-weight-two-lifting`, `gap:totally-real-solvable-residual-cohomological-weight`,
`gap:cm-elliptic-endomorphism-field`), each stated with the same slug in `design/plan.json` and under
`## Exact supplier contracts` of the README.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 real cyclotomic subfield; `realCyclotomic_isCMField` | k=ℚ: n=3, 4, 6, 9, 15; k=ℚ(√2), n=8; k=ℚ(√5), n=5; k=ℚ(i), n=3; k=ℚ(√−3), n=3 | L=ℚ, ℚ, ℚ, cubic (x³−3x+1), degree 4 ∋ √5; L=k twice with [M:L]=2; L=ℚ(i) ≠ M⁺=ℚ(√3); M=L=k. Lean needs k totally real: last two excluded | holds | none |
| §1.2 reflection twist | R=[[0,−1],[1,−1]], W=[[0,1],[1,0]]; Riemann–Hurwitz for Y^m=f_t, n=5 forced cubic, n=15 | R²=[[−1,1],[−1,0]], R³=I, WRW=R²=R⁻¹; genus m from 2 branch points; 4 branch points → genus 5; 2 → genus 3; w(O,1)=(O,1) | holds | none |
| §1.3 descended character systems | n=3; θ=1; induction from G_M; δ trivial | dim H¹(C₃)=6=3·2; W₁=H¹(B^δ_t) rank 2; Ind=W_θ⊕W_θ⊗δ rank 4; rank 2 when M=L | holds | none |
| §1.4 determinant, weights, oddness | pairing ⟨x,w′*y⟩; y²=x³−x+1 mod 5; inert 5 in ℚ(√−3); ramified ℚ(√5) | alternating, det=ε⁻¹, det(c)=−1; 8 points, a₅=−2; P₁,₅=X²−2X+5, squared roots −3±4i → X²+6X+25, 32 points over 𝔽₂₅; f=1 keeps X²−2X+5 | holds | none |
| §1.5 lattices and congruence chain | ℓ=3, p with n=3p; χ=ηψ; k′=k(μ₁₅,J[3]) | χ̄=η̄ mod p, χ̄=ψ̄ mod 3, ψ̄=1 mod p; η̄=1 mod 3; 1/n not 3-integral, regular module free rank 2; all reductions trivial over k′ | holds | none |
| §1.6 elliptic endpoints | w′-invariants of H¹(C^δ₃); inert v; n=45, d=3 | 0+2=2; traces of W₁ and H¹(B_t) differ by δ(Frob_v)=−1; degree 15 | holds | none |
| §2.1 change of prime | 11a1 at 3; nonsplit extension vs sum; p=5 labels | X²+X+3 for all ℓ≠3; same polynomials, not isomorphic; (√5−1)/2 ≠ −(√5+1)/2 | holds | none |
| §2.2 weight-two lifting for summands | ℓ=2; 𝔽₂₅ control a²=3, B=[[0,2],[1,0]], C=aB; 𝔽₅-model with PSL₂ or PGL₂ projective image | excluded; B²=2I, C²=I, det C=4 square, det B=3 nonsquare; PSL₂ ⇒ √5∈L, order-2 quotient of A₅ impossible; PGL₂ ⇒ √5∉L, [L(ζ₅):L]=4 | holds given the gap | none |
| §2.3 3–5 switch; `three_five_switch` | subgroup orders in GL₂(𝔽₃); ζ₃∈K; multiplication by 2 on E[5] | 24 ∤ 12, 8, 16; image ⊆ SL₂(𝔽₃), P has two K-components of degree 24; e₅(2P,2Q)=e₅(P,Q)⁴ | holds | none |
| §2.4 mod-three seed | GL₂(𝔽₃) solvable; solvable irreducible images for p≥5 | orders 48, 24, 8, 2, 1; projective image dihedral, A₄ or S₄, order prime to p, so a complex lift exists | holds given the gap | none |
| §2.5 mod-five seed | SL₂(𝔽₃) line stabilisers; E[5] image GL₂(𝔽₅) | 6 and ≤4, both <24; projective image of G_{K(ζ₅)} is PSL₂(𝔽₅), so alternative (b) is needed | holds | none |
| §3.1 parameter | c(λ)=2−λ−λ⁻¹; p=101, 7; L(ζ_ℓ) for ℓ∈{3,p} | 3 at a cube root; 101 ∣ 3¹⁰⁰−1, 7 ∣ 3⁶−1; =M since ζ_ℓ∉L totally real and [M:L]=2 | holds | none |
| §3.3 three lifts | rows (p, 3, p) against §1.5 and §3.1(1)–(3) | each target residually ≅ a modular source, irreducible on G_{L(ζ_ℓ)}=G_M; ℓ∈{3,p}, never 5 | holds | none |
| §4.1 descent | x³−4x+1; twists of an irreducible restriction | disc 229, no rational root, S₃, totally real; Hom_{G_L}(ρ,ρ⊗ψ)≠0 forces ψ=1; 1⊕1 has 3 descents | holds | none |
| §4.2 all places | 11a1 at 11; y²=x³−x+1; y²=x³−x at 2; twist π⊗\|det\| | a₁₁=1, factor (1−11^{−s})⁻¹; Δ=−368=−2⁴·23, c₄=48, 5 nonsquare mod 23; conductor exponent 5, factor 1; type (2,−2) by j=(w−k+2)/2 | holds | none |
| §4.3 CM branch | y²=x³−x at 3, 5; y²=x³+1 at 5; central character at 3 | 4 points a₃=0; 8 points a₅=−2=(−1+2i)+(−1−2i); 6 points a₅=0; ξ(3𝒪)=−3=η(3)·3, (−1)(−3)/3=1 | holds given the gap | none |
| §4.4 endpoint | K=ℚ; K=ℚ(√5), E: y²=x³−x+1 | type (2,0), t₃=−1, s₃=1; j=−6912/23 non-integral, non-CM, Steinberg at norm 529 | holds given §§4.1–4.3 | none |
| Conventions: twist rule on H¹ | X: y²=x³+1, X′: y²=2x³+1 over ℚ(ζ₃) | a_g=(ζ₃⁻¹x,y); (a_g⁻¹)*ω=ζ₃ω matches transported action; uninverted gives ζ₃⁻¹ω | holds | none |
| Conventions: half shift | 11a1 at 3 | L(s−1/2,π₃)=(1+3^{−s}+3^{1−2s})⁻¹; reversed shift gives (1+3^{−s−1}+3^{−2s−1})⁻¹; 1+T+3T² at 1/3 is 5/3 | holds | none |

- Source locators checked against the text: 40 (LeHung26 12, OpenAI26 6, FLHS15 10, BD14 2, BLGG12 2, BLGG13II 3, Kisin09 2, SW99 2, BCDT01 1); every sampled target's locator, page and hypotheses agree.
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): 31, among them `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `NumberField.CMExtension.eq_maximalRealSubfield` (`:456`), `IsCyclotomicExtension.Rat.isCMField` (`:564`, base ℚ only), `WeierstrassCurve.j` (`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388`), `WeierstrassCurve.torsionGaloisAction` (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77`), `TauCeti.Isogeny.weilPairing` (`.../WeilPairing/Basic.lean:225`), `WeierstrassCurve.nonempty_basis_torsionBy` (`.../Torsion/Structure.lean:149`).
- Cross-roadmap citations resolved at main or at the open heads: all 20 supplier roadmaps, including every named target of EllipticCurveModularityImaginaryQuadratic (20 names; §7.4 gives the pair (3,5) and non-CM `A_t` over an arbitrary number field), PotentialAutomorphyInfrastructure §2.3(2), GL2AutomorphicRepresentationsAndTransfer R16.2.13–R17.5.14, GL2ModularityLifting §§5.7 and 5.10, ComplexMultiplicationAndExplicitReciprocity §§1.1, 4.1, 4.2, SmallRamificationAndAbelianVarietyBaseCases §5.0d, HilbertModularForms §11.3.
- Gaps: each of the three is absent from its supplier today, has one named supplier and section, and asks for nothing an earlier roadmap states (EllipticCurveModularityImaginaryQuadratic §8.6 asserts the CM field of definition without a target).
- Duplication and ownership: no other roadmap on main or in an open pull request states the totally real theorem, the reflection twist, the Breuil–Diamond lifting theorem or the 3–5 switch over a number field; the Part II of EllipticCurveModularityImaginaryQuadratic leaves totally real fields to this roadmap; EllipticCurveModularityWild3Adic is later in the merge order.
- Gate: every check passed. Dependency check: `depcheck: 229 roadmaps, 2063 edges, 0 problem(s)`. No change outside the folder.
- Elaboration of `Suggested.lean`: two `sorry` warnings and nothing else; `#check` of both declarations agrees with the README statements, no binder lost. One-tactic probes (`simp`, `infer_instance`, `exact Set.infinite_univ`, `aesop`) close neither theorem. No cuspidal automorphic representation or Hilbert attachment exists at either pin, so the remaining headlines are not statable, as the module docstring says.
- Pull request text: title and description agree with the head (a new roadmap folder with README, `Suggested.lean`, `metadata.toml`; two declarations).

## Not verifiable

- The published numbering of BD14, BLGG12 and BLGG13II was not compared with the arXiv versions read; the README cites the arXiv versions.

## Source issues

- **Misprint** in LeHung26 at §3.1, sentence before Proposition 3.1, p.6: the source says the lifting proposition follows from Theorem 3 of Freitas–Le Hung–Siksek; it should be Theorem 2, the lifting theorem (Theorem 3 is the seed); affects nothing.
- **Misprint** in BLGG13II at proof of Theorem 3.1.1, p.3: the source says the image lies in the scalars of characteristic p times GL₂(𝔽₃); it should be the scalars of characteristic 3, the prime of that section; affects nothing.
