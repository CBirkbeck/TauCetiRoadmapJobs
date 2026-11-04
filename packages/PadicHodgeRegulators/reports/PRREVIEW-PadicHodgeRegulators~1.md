# Review of PadicHodgeRegulators (pull request #1498 at 09a5b3a)

**Verdict:** needs changes

## R01 (P1) — Point the Herr/B-pair comparison to its actual owner

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:57, repeated at lines 2530 and 2551: “From §4.5, consume … `herrBPairDerived` with its étale specialization.”

**Claim:** PadicHodgeTheory §4.5 supplies that named comparison, used to identify the new exponential with the representation-theoretic exponential.

**Witness:** TauCetiRoadmap/PadicHodgeTheory/README.md:949–953 assigns the cochain comparison to PhiGammaModulesAndIwasawaCohomology §3.9. There is no `herrBPairDerived` in the current supplier. The latter roadmap's README:1885–1891 constructs the equivariant comparison and its B-pair/Herr routes.

**Repair:** Update all three occurrences and the ownership/dependency descriptions to consume PhiGammaModulesAndIwasawaCohomology §§1.6 and 3.9's equivariant realization and cohomology comparison by section. Retain PadicHodgeTheory §4.5 for its de Rham realization and sign adapter, and PhiGammaModulesAndIwasawaCohomology §3.4 for the rational torsion-convention comparison. Explicitly require the comparison of the localization/positive-period exact sequences and their connecting maps used in §9.30a; do not introduce a new copy of the comparison or assume the obsolete declaration exists.

**Repair test:** In the φ-first complex with φ=2, γ=3, the boundary of 1 is (1,2), and d¹(1,2)=0. The transposed vector gives 3. PadicHodgeTheory's degree-one swap and degree-two negation preserve this differential; the replacement supplier retains cup and trace compatibility. On D=D_rig(V), Nakamura2014 line 983–990 compares all four cohomologies and the exact sequences, so the repaired route supplies the connecting-map comparison required here. The mathematical construction need not be deleted; its stated dependency must be corrected.

## R02 (P2) — Keep the abelian logarithm theorem at arbitrary reduction

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:607: “an abelian variety with good reduction”, repeated for the naturality assertion.

**Claim:** The roadmap builds the Kummer/logarithm comparison only in this restricted reduction class.

**Witness:** BK1990 line 885–904, Example 3.11, printed p.361, gives the exponential/Kummer diagram for an arbitrary abelian variety and reduces its proof to semistable reduction. SelmerIwasawaCohomology §4.26 already retains arbitrary reduction for elliptic curves.

**Repair:** State §1.9 for every abelian variety over finite K/Qₚ, including naturality under isogenies and quotient maps. Cite BK1990 Example 3.11 and the supplied de Rham/Raynaud/descent interfaces; retain good reduction as a Check. Update the ownership and downstream descriptions accordingly. This is the same theorem at the source's generality, not a new good-prime route.

**Repair test:** Take the split multiplicative Tate curve E_q/Q₅ with q=5 and P represented by 6 in Q₅×/5^Z. Its logarithm is log₅(6)−ord₅(6)log₅(5)=log₅(6)≡55 mod125, also log_BK κ(P). On its semistable periods, N sends the slope-zero basis vector to the slope-one vector; ker N is the φ=1/5 line, so D_cris(V)^{φ=1}=0. Thus H_e=H_f=H_g has dimension1 and the tangent logarithm is defined, although E_q has bad reduction and the original target excludes it. This is the required additional discriminating Check.

## Verified sound

The review covered both files at the requested head, including all 113 numbered target subsections, the conventions and supplier blocks, and the three Lean headline theorems. Finite computations below test the stated formulas and exclude particular wrong models; they are not proofs of the full theorems.

The worker's gate passes every scanner, the dependency check and the targeted build. The independent direct elaboration of Suggested.lean also exited successfully, with exactly three warnings, all for the intended `sorry` theorem bodies. The diff outside this roadmap folder is empty. No sorry-bodied data, option override, alternate import, computational algorithm or re-planning defect was found. R02 identifies the unnecessary good-reduction restriction.

The independent dependency command returned:

```text
depcheck: 204 roadmaps, 1497 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. The graph check does not validate the mathematical content of supplier citations; R01 is a separately resolved citation defect. R02 is the generality finding.

**Headline coverage and Lean probes.** The README's end results are the normalized syntomic/étale/Bloch–Kato comparisons (§§4.2–4.7); completed local K₃ regulator, lattice isomorphism and root generation (§§5.7–5.9); global regulator and its functoriality (§§6.1–6.6); good- and arbitrary-reduction curve formulas (§§7.4–7.11); Perrin–Riou interpolation, reciprocity and determinant (§§8.13–8.19); exact Coleman images, elementary divisors and integral finite cokernel (§§9.26–9.29); and general de Rham interpolation/crystalline comparison (§§9.30a–9.36). Section 6.7 defines injectivity propositions and proves implications; it does not claim the conjectural positive-rank injectivity theorem.

The statable deep ingredients are present: `residueDilogValue_spans`, `constraint_basis_and_determinant`, and `evaluationConstraints_coordinate_image`. The module docstring names the remaining headline families and their missing completed K-theory, period-cohomology, syntomic, Robba/Wach and distribution carriers. Searches at the pins found no native versions allowing these missing headlines to be stated without substantial new constructions. The four kept definitions have real bodies on finite fields, polynomials and submodules.

A scratch copy elaborated all seven `#check @...` signatures. They agree with the README: positive extension degree and p>3 remain in the spanning theorem; the constraint theorems retain the field, domain, distinct-point, nonzero-factor and exact evaluation-kernel assumptions, restricted to J. The unrestricted definitions do not silently acquire those theorem assumptions. No binder repair was needed. Each of the three theorem bodies was tested separately against `simp`, `rfl` and `infer_instance` using failure assertions in that copy: none closed. Object searches found no single pinned lemma proving any of the three headlines. No padding finding results.

**Seeded source audit: 15 of 15 targets read.** Source line numbers below refer to the legally cached source-service extractions. The theorem numbers and printed/preprint pages were compared, not inferred from the roadmap. No README locator is explicitly marked unverified.

| Target | Text opened and locator | Assessment |
|---|---|---|
| 1.9 | Berger2003 line 65–81, introductory formal-group diagram, journal p.100 / preprint p.2; Rubin2000 line 906–922, I §6.4(9), p.16 | The displayed case is true, but unnecessarily narrow: BK1990 line 885–904, Example 3.11 p.361, gives arbitrary reduction. The homological Hodge quotient comes from the named abelian suppliers. See R02. |
| 2.4 | CC99 line 875–918, IV.2.1 pp.20–22; line 966–988, IV.3.1–3.3 p.23; line 1122–1163, V.3.2 pp.26–27; Berger2003 line 618–696, II.3 pp.114–115, and line 943–987, II.16–17 pp.122–123 | Read the actual cocycles and the opposite lift sign. The roadmap retains the Tate-root component and supplies the conversion; rational finite-level equality alone would not suffice. |
| 5.9 | GSWZ2024 line 1993–2027, Proposition 3.3 and Theorem 9, pp.38–39 | Unramified finite extensions and p>3, completed groups, residue spanning and root generation agree. The finite-product extension is componentwise. |
| 7.4 | AM18 line 2270–2286, Theorem 9.1 p.45; BdJ2012 line 181–187, Remark 1.10 p.4 | The symbol pairing is in the normalized Θ coordinate with inverse 1−p⁻²φ, on the stated good-reduction curve and holomorphic test form. It is not an unnormalized identification. |
| 8.2 | LLZ2011 line 1399–1406, proof of Lemma 5.6 p.1126 | Both Frobenius inverse identities follow from the quadratic relation with b≠0. |
| 8.5 | Same LLZ2011 locator | The quadratic Euler expression agrees, retaining both nonzero denominators. |
| 8.13 | LZ2014 line 1610–1677, dagger and B.1–B.2 pp.36–37; line 1705–1757, B.4–B.5 pp.38–39 | Conductor, Gauss, Gamma, twist and Frobenius factors checked in both integer ranges. The logarithm requires the specified finite/exponential condition. |
| 8.18 | LZ2014 line 1758–1796, equation (10), B.6 pp.39–40; positive adjunction line 214–219; Berger2003 line 943–987, II.16–17 | The roadmap's positive sign includes the degree-one swap omitted in the printed LZ calculation; it is independently consistent with Berger after conversion. |
| 8.19 | LLZ2011 line 1114–1135, Corollary 4.7 p.1120 | Determinant ideal is the product of the weight factors, modulo units; multiplicities and the empty determinant are retained. |
| 9.12 | LLZ2011 line 936–981, §3A pp.1116–1117, including Lemma 3.3 | Coleman coordinates are J∘(1−φ), with row vectors and right multiplication. |
| 9.20 | LLZ2011 line 1490–1508, Proposition 5.11 pp.1128–1129; preprint arXiv:1006.5163v2 line 1189–1220, Remark 5.12 p.25 | Maximal-ideal choices avoid finitely many slopes and force a unit determinant. The published proof's nonzero-determinant shortcut is not used. |
| 9.29 | LLZWach line 1409–1435, Proposition 4.6 pp.24–25; line 1540–1569, Proposition 4.11 pp.26–27; LLZ2011 line 1458–1486, Theorem 5.10 p.1128 | The source has restrictions (C),(D). The roadmap explicitly proves its broader lower inclusion using φ²M⊂𝔪M, then the integral quotient filtration and Weierstrass division. It does not attribute that broader range to Proposition 4.11. |
| 9.30a | Nakamura2014 line 455–474 (§2.2 p.12), 562–586 (2.8 p.15), 674–735 (2.10–2.12 pp.18–19), 835–841 (2.16 p.23), 983–990 (2.21 p.27), 1286–1328 (3.5–3.6 pp.34–35), 1370–1385 (3.10 pp.36–37); RJ2018 line 1020–1074, IB9/I.10 pp.908–909 | Arbitrary de Rham modules, positive lattices, the non-étale example, coordinate adapter and corrected Gamma factor checked. R01 concerns the formal supplier, not absence of the source theorem. |
| 9.35 | RJ2018 line 1280–1294, I.15 p.914; line 1644–1669, IC9/I.28–I.29 p.920 | The conductor-dependent φ⁻ⁿ factor is real. The roadmap's global object is the Amice distribution, and its explicit rank-one example refutes the source's claimed global extension of the other function. The basis-free formulation avoids an eigenbasis assumption. |
| 9.36 | Rubin2000 line 2392–2406, III §5.8 Proposition 5.14 p.52 | Supports injectivity and augmentation containment in the split multiplicative case, with the stated integral differential normalization. It does not assert surjectivity onto the augmentation ideal. |

**Adversarial computations.** “Retain” means the displayed instance agrees and no change is requested on its evidence. Values involving periods are computed in the specified source/supplier coordinate. Conditional rows retain the declared supplier contract. Zero inputs alone are supplemented by nonzero or excluded inputs. All numbered subsections have a row; additional rows distinguish the source corrections, carrier conventions and Lean declarations.

| Statement | Instances tried | Values computed on the two sides / wrong model | Result; change |
|---|---|---|---|
| Conventions: Tate period and reciprocity | p=5, twists 0,1,2; ordered Kummer/logχ | φ(d_r)=1,1/5,1/25; quotient dimensions 0,1,1. Pairings (κ(6),logχ) and reverse are log₅6 and −log₅6; log₅6≡55 mod125. | Retain. |
| Fundamental/finite period complexes | V=Q₅ and V=Q₅(2) | (1−φ,can) is x↦(0,0) in weight 0 and x↦(24x/25,x) in weight 2; finite H¹ dimensions 1 and 1. | Retain; no integral rescaling. |
| Rigid/dagger filtration | A¹ compactified in P¹; G_m; point weight 0 | H¹(F¹)=0 on A¹ versus K[x]dx for stupid truncation; (1−φ/5)dlog t=0 on G_m; point H⁰,H¹=(Q₅,Q₅) at weight 0. | Retain the filtration and gap. |
| Divided/undivided arrows | p=5,r=2; reduction mod5 | Both composites have scalar25; mod5 scalar0 is not1. Fib(0) on F₅ has H⁰=H¹=F₅ while Fib(id) has both0. | Retain. |
| Period lattice conversion | (p,r)=(2,2),(3,6),(5,2) | EN/CN generators 1/8 and1/4; 1/162 and1/27; 1 and1. Multipliers2,6,1 give equality. | Retain. |
| Unramified algebra / root convention | F₂; Q₅(ζ₅); empty product | Tame roots over F₂ have order1; ramified degree4 but residue degree1; empty algebra rank0. | Retain; no full-root assertion at2. |
| Completed versus integral K₃ | Q₂,Q₃,Q₅; empty product | Completed groups Z₂⊕Z/8, Z₃⊕Z/3, Z₅, and0; torsion maps to0 in the rational target. | Retain. |
| 0.1 | Q₅(2),Q₅,Q₅(−1) | Quotients have dimensions1,0,0; φ on the first is1/25. Opposite numerical weight without filtration transport gives the wrong quotient. | Retain. |
| 1.1 | Tate twists r=0,1,2 over Q₅ | (dim H_e,dim H_f,dim H_g,dim H¹)=(0,1,1,2),(1,1,2,2),(1,1,1,1). | Retain; e,f,g remain distinct. |
| 1.2 | V=Q₅(1); unit6 and uniformizer5 | exp(log₅6·d₁)=κ(6); valuation of κ(6)=0, of κ(5)=1. Thus κ(5) is outside exp image. | Retain. |
| 1.3 | V=Q₅(2) and V=Q₅ | log(exp(d₂))=d₂; trivial representation has tangent quotient0 and ordinary exp domain0. Quotient-log kernel correction remains necessary in general. | Retain. |
| 1.4 | V=Q₅, cyclotomic and unramified classes | exp*(logχ)=1; exp*(unramified class)=0; ordered adjunction on κ(6) gives log₅6 on both sides. | Retain. |
| 1.5 | r=0,1,2 | dim t=(0,1,1), dim H⁰=(1,0,0), dim H_f=(1,1,1); sum formula gives1 each time. | Retain. |
| 1.6 | V=Q₅(1), dual Q₅ | Unit Kummer line pairs to0 with unramified line and nontrivially with logχ; valuation direction pairs nontrivially with unramified line. | Retain both annihilator directions. |
| 1.7 | Unramified quadratic extension; input6 | Norm6=36; trace(log₅6)=2log₅6=log₅36; cor∘res has scalar2, identity extension scalar1. | Retain. |
| 1.8 | r=1,2,−1 | H_g dimensions2,1,0; uniformizer is allowed only in the first H_g, while H_f at r=1 is the unit line. | Retain. |
| 1.9 | P=exp_A(v), torsion P, product A×B; Tate E₅/Q₅ and P=[6] | log_BK κ(P)=v=log_A(P); torsion gives0; products keep(v,w). Bad-reduction E₅ gives log_BK κ([6])=log₅6≡55 mod125=log_E₅([6]); all three local-condition dimensions are1. | Broaden as R02; retain natural Lie quotient. |
| 1.10 | L=Q₅,r=2,a=1; p=3,r=2 | (1−1/25)⁻¹=25/24, so lattice image25Z₅ and index25; Q₃ weight2 has Z/3 torsion and is outside2≤r≤p−2. | Retain. |
| 1.11 | Q₅×Q₅; empty algebra | Independent (κ(6),0),(0,κ(6)) give dimension2 versus diagonal dimension1; empty source/target0. | Retain. |
| 2.1 | γ↦γ² | Log normalizer doubles while generator-division contribution halves; product multiplier2·(1/2)=1. | Retain. |
| 2.2 | ε↦ε², p=5 | t and v₁ multiply by2, d₁ unchanged; derivative multiplies by1/2, derivative⊗v₁ unchanged. | Retain. |
| 2.3 | Order-four η, η(γ)=i | Inverse twist evaluates γ as −iγ; direct convention gives iγ. Specialization lands in D(η⁻¹), whereas RJ's integral at η lands in D(η). | Retain. |
| 2.4 | f=1+π and f₆=((1+π)⁶−1)/π | Δf=1, giving the nonzero Tate-root Iwasawa class although rational finite-level classes=0; Δf₆(0)=5/2. Negative lift reverses the class. | Retain positive cocycle conversion. |
| 3.1 | Roots of unity; z=0,1; two factors | log ζ=0 so D(ζ)=Li₂ζ; specified total values at0,1 are0; product evaluation (D(a),D(b)) keeps two coordinates. | Retain. |
| 3.2 | F₂₅ with a²=2 | Arithmetic Frobenius sends a↦a⁵=−a; scalar extension preserves the value while Frobenius conjugates it. Identity square has multiplier1. | Retain. |
| 3.3 | Imaginary quadratic field split at p; torsion Bloch class | Embedding values form (d,−d); torsion maps to(0,0). An unmarked scalar sum would give0 and lose both coordinates. | Retain. |
| 3.4 | Weights1,2,3 | Ordinary Chern/character multipliers1,−1,2; raw-symbol character multipliers−1,1,−2, hence ordinary multipliers−1,−1,−4. | Retain. |
| 3.5 | Local root of unity, unit6 and nonunit5; global Q | log ζ=0, log₅6≡55 mod125≠0, log₅5=0; Q has unit rank0 and rr₅=0. | Retain unit-domain restriction. |
| 3.6 | Quadratic scalar unit6, identity extension | log Norm6=log36=2log6=Tr log6; identity gives log6. | Retain. |
| 4.1 | n=1,2,3; F₃ coefficients mod2 at n=3 | c_n/ch_n=1,−1,2; multiplier2 becomes0 mod2 although edge group has order2. | Retain separate Chern maps. |
| 4.2 | Point, weight1 unit6; weight2 normalized coordinate a | exp(log6)=κ(6); log_BK(r_et,ch)=a=r_syn. Using c₂ instead changes a to−a. | Retain. |
| 4.3 | Raw weight-two root class | Character coordinate Li₂ζ; ordinary Chern coordinate −Li₂ζ. They differ by−1, not an unspecified unit. | Retain. |
| 4.4 | Weight3 raw symbol | Character gives−2Li₃; ordinary c₃ gives−4Li₃ by multiplier2. | Retain. |
| 4.5 | p=5,n=2,σ=1 | Gros factor1−1/25=24/25; normalized input25 gives24, not25. | Retain. |
| 4.6 | p=5,r=2; divided boundary value a | Undivided value25a; p⁻²δ_U=a=δ_D. At mod5 the factor25 is0, so no integral inverse. | Retain conditional boundary contract. |
| 4.7 | Q(i), root i; zero/doubled class | de Jeu complex value P₂(i)=iD_BW(i)≠0; Borel value−2P₂(i); doubling gives2P₂(i), excluding arbitrary rescaling. | Retain universal calibration route. |
| 5.1 | p=5,n=2; n=0 | Polynomial X+4X²+4X³+X⁴; at0,1,2,3,4 gives0,0,1,3,0. At n=0 coefficients all1. | Retain polynomial, not merely function. |
| 5.2 | F₅, admissible2,3,4; junk input1 | f-values1,4,0; total division at1 gives0 but1 is excluded from spanning domain. | Retain. |
| 5.3 | p=5,ζ=ω(2) | f(2)=1, so 25⁻¹D(ζ⁵)≡1 mod5; ζ⁵=ζ here. Omitting25 changes the residue to0. | Retain. |
| 5.4 | Same special unit; ramified ζ₅ | D(ω(2))≡25 mod125, valuation2. ζ₅−1 has valuation1/4, so it fails the special-unit hypothesis. | Retain. |
| 5.5 / residueDilogValue_spans | F₃,F₅,F₇,F₁₁,F₂₅ | Admissible F₃ values{0}, ranks(0,0); F₅ values{1,4,0}, ranks(1,1); F₇ values3,1,4,6,0, ranks(1,1); F₁₁ ranks(1,1). In F₂₅, f(a)=4+2a, value/difference ranks(2,2). | Retain p>3 and s>0. |
| 5.6 | Root order4 at p=5; inversion | Denominator4 is a unit mod5 with inverse4; inversion negates the Bloch/regulator class. Root1 gives0. | Retain coefficient-localized classes. |
| 5.7 | Root generator and zero class | D_p([ζ])=Li₂ζ by fixed −c₂·log_BK∘c₂ normalization; zero gives0; raw ordinary Chern sign alone gives the opposite value. | Retain. |
| 5.8 | Q₅, Q₂₅×Q₅; Q₃ excluded | Target lattices25Z₅ and25Z₅³ have ranks1,3; source at3 has nonzero order3 torsion and cannot embed into a torsion-free lattice. | Retain full stated range. |
| 5.9 | F₅; residue degree2 plus degree1 | Root residues span dimension1; in product the independent component lifts span2+1=3, so Nakayama gives generation of rank3 lattice. Empty product gives0. | Retain. |
| 6.1 | Totally real F and imaginary quadratic F | Rational K₃ ranks r₂=0 and1; global regulator source dimensions0 and1, with no claimed positive-rank injectivity. | Retain. |
| 6.2 | Class represented by ξ and 2ξ; torsion relation | Additivity gives D(2ξ)=2D(ξ); a torsion relation evaluates to0 in the characteristic-zero target. | Retain. |
| 6.3 | Degree-two extension on restricted class | Transfer/regulator gives2D(ξ)=Tr(D(ξ)); identity degree1 givesD(ξ). | Retain. |
| 6.4 | F₂₅ root a | φ(a)=−a; Frobenius applied twice gives a and twice-transformed regulator returns its initial value. | Retain. |
| 6.5 | Torsion ξ and denominator N prime to5 | D(ξ)=0; D(N⁻¹ξ)=N⁻¹D(ξ), N=2 gives multiplier1/2. A denominator5 does not preserve25O. | Retain. |
| 6.6 | Root Frobenius and norm compatibility | On a root ζ, both exported values are Li₂(ζ⁵)=φLi₂ζ; degree-two trace of scalar a is2a. | Retain. |
| 6.7 | Q-linear map Q²→Qₚ, (a,b)↦a+αb with α∉Q | Q-kernel0; after tensoring with Qₚ, vector(−α,1) maps to0. Strong injectivity implies rational injectivity; converse fails. | Retain two predicates. |
| 6.8 | Cubic X³−X²+1 mod5 | (X−2)(X²+X+2); three root rows (2,4,4),(1,3,2),(2,3,3) have determinant3 mod5; combination(1,3,1) gives(2,1,3). | Retain corrected exponent2. |
| 7.1 | p=5,weight2,Frobenius scalar2 | η_can=(1−2/25)η_norm=(23/25)η_norm; inverse factor25/23. At η_norm=25, η_can=23. | Retain both coordinates. |
| 7.2 | One boundary logarithmic class with φ=5 | Weight-two operator1−φ/25 acts by4/5, inverse5/4; this differs from the proper H¹ factor23/25 in the preceding test. | Retain. |
| 7.3 | Symbol {f,1}; Steinberg {f,1−f} | Both K₂ classes=0, hence regulator0; tame symbol at a simple zero of f is g(P)⁻¹ under the stated convention. | Retain full tame kernel. |
| 7.4 | Symbol {f,1}; constant g=c, holomorphic ω | Both sides0 in first case. Second gives log(c)·Σ ord_P(f)F_ω(P)=0 on a principal divisor, agreeing with decomposable regulator pairing. | Retain normalized pairing. |
| 7.5 | c₂-character sign conversion and zero class | log_BK(ch_et ξ)=r_syn ξ; ordinary c₂ gives−r_syn ξ; zero maps to0 on both sides. | Retain. |
| 7.6 | Finite étale cover degree2 and identity | f_*f*ξ=2ξ and Tr(f*r)=2r; identity givesξ,r. | Retain projection formula. |
| 7.7 | Smooth proper semistable curve with N=0 versus N≠0 | At N=0, kerN is full and graph correction0; a vector v with Nv≠0 is excluded as test form, not as regulator class. | Retain arbitrary-reduction descent contract. |
| 7.8 | Base point and tame symbol {t,c} | Relative connection on a constant period is0; at t=0 the tame value is c⁻¹, so a nontrivial residue cannot be silently admitted to the tame kernel. | Retain. |
| 7.9 | Identity fibre specialization; nonsplit quadratic point | Identity sends a↦a; trace of1 from the quadratic residue field is2, not1. | Retain Frobenius-compatible specialization. |
| 7.10 | Change boundary by a; two-term monodromy | w↦w+a, y↦y+Na leaves ρ=y−Nw unchanged; z↦z−I(a) leaves β=z+Iw unchanged. For N(a,b)=(b,0), λ=2, ρ=(0,1), the displayed transport gives Δβ=(−2,−2). | Retain coordinates; algebraic test is not a realizability claim. |
| 7.11 | One loop c=2,index3; two parallel edges; quadratic trace | Half of two oriented loop contributions is6; parallel contribution2·3−2·5=−4. Tr(α²)=2π while (Trα)²=0 when α²=π, proving trace must follow the full index. | Retain loop and trace terms. |
| 8.1 | Φ=[[2,1],[0,3]],a=−5,b=6 | P=−(Φ−5I)/6=[[1/2,−1/6],[0,1/3]]. For b=0 the formula is not licensed. | Retain. |
| 8.2 | Same nonsymmetric Φ | ΦP=PΦ=I; ΦPᵀ=[[5/6,1/3],[−1/2,1]]≠I. | Retain both inverse identities. |
| 8.3 | Same Φ | 1+a+b=2; Q=(Φ−4I)/2=[[-1,1/2],[0,−1/2]]. Eigenvalue1 would make the denominator0. | Retain. |
| 8.4 | Same Φ | Q(I−Φ)=(I−Φ)Q=I. At Φ=I the left factor I−Φ=0 cannot have inverse. | Retain nonvanishing hypothesis. |
| 8.5 | Same Φ,p=5; scalar Φ=−1 | Q(I−P/5)=[[-9/10,13/30],[0,−7/15]], also the quadratic formula; scalar−1 gives3/5. | Retain. |
| 8.6 | Γ*(j),j=0,−1,−2,−3 | Values1,−1,1/2,−1/6; Γ*(1),Γ*(2),Γ*(3)=1,1,2. | Retain leading coefficient convention. |
| 8.7 | ℓ_i(χ^j),i=0,1;j=3 | Values3 and2; their product6. Replacing log denominator by1 changes these values by logχ(γ). | Retain. |
| 8.8 | Rank-one Tate class from f₆ | L=(1−φ)(Δf₆v₁); χ²-value−70/3·d₁, nonzero. A zero regulator fails. | Retain actual Iwasawa input. |
| 8.9 | Frobenius eigenline α=p⁻ʲ versus other eigenline | (1−pʲφ) has scalar0 versus1−pʲα≠0; obstruction occurs exactly on the first line. | Retain full derivative obstruction. |
| 8.10 | h=1,2,3 on a monomial weight j=4 | ∇_h multiplies by4,12,24 respectively; h-step recursion contributes the next factor3 then2. | Retain. |
| 8.11 | h↦h+1 at j=4,h=2 | Numerator and normalizing product both acquire factor2; quotient unchanged. At j=h the factor0 prohibits numerical division without the analytic identity. | Retain. |
| 8.12 | Twist byχ and byχ² | Scalar algebra variable γ becomes χ(γ)⁻¹γ and χ(γ)⁻²γ; iterated twists multiply toχ(γ)⁻²γ. | Retain meromorphic extension. |
| 8.13 | p=5, conductor5²; j=0 and−2, α=1/5 | Γ*(1)·5²·α²=1 and Γ*(−1)·5⁻²·α²=−1/625, before the same Gauss/period factor. Dropping conductor/Frobenius factors changes both. | Retain each branch's BK-map domain. |
| 8.14 | Scalar α=2,p=5,j=0 | (1−α)/(1−1/(5α))=−10/9; clearing denominator gives (9/10)(−10/9)=−1. | Retain. |
| 8.15 | α=1 and α=1/5 at j=0 | First Euler numerator0; second case denominator0. Cleared equality is meaningful; a formal inverse at denominator0 is not. | Retain cleared statement. |
| 8.16 | Direct sum of slopes1 and3; projection to first quotient | Projected bound uses1; whole module bound3. Zero projection has value0 but does not determine the required slope bound for nonzero quotients. | Retain quotient-wise hypothesis. |
| 8.17 | Scalar coefficient extension and zero map | Extension sends L(z)↦1⊗L(z); zero sends both sides0; lattice multiplication by5 yields5L(z), not a unit basis change. | Retain. |
| 8.18 | j=2, ordered Tate pairing1 | σ₋₁(χ²)=1, ℓ₀(χ²)=2, hence positive formula2. Degree-zero transpose adds0 signs; degree-one transpose adds−1, correcting printed value−2. | Retain source correction. |
| 8.19 | Weights(0,2),(1,1),empty; χ³ | Determinants up to units evaluate as ℓ₀ℓ₁=6, ℓ₀²=9, empty product1. Maximum weight alone would conflate6 and9. | Retain multiplicities. |
| 8.20 | Row L=(2,3); linear functional(v₁,v₂)↦v₁+2v₂ | Projected value8; functional twice as large gives16. Specifying the functional excludes arbitrary scalar normalization. | Retain. |
| 8.21 | f₆=6+15π+20π²+⋯ at p=5 | Δf₆(0)=5/2; ∂Δf₆(0)=40/6−(15/6)²+15/6=35/12; Col moment−35/3; L moment−70/3. | Retain factor2 and signs. |
| 8.22 | Split α=1, nonsplit α=−1 at5 | Trivial Euler factors0/(4/5)=0 and2/(6/5)=5/3. | Retain distinction. |
| 9.1 / evaluationConstraints | R=Q[X],d=2,V₀=span(1,0) | Row(1,X) has value(1,0)∈V₀; row(0,1) has value(0,1)∉V₀; multiplying first row byX gives(0,0) at0. | Retain native submodule closure. |
| 9.2 | Vanishing at0,5; repeated point0 | X(X−5) is divisible by both distinct factors; X vanishes twice at the repeated point but X² does not divideX. | Retain distinctness. |
| 9.3 | One line constraint; dual numbers excluded | Basis diag(1,X), determinantX. In Q[ε]/ε², ε·ε=0, so (ε) is not free rank1. | Retain domain/nonzero factor. |
| 9.4 | Old basis(X), new point5 versus0 | Evaluation5 has inverse1/5; evaluation0 is singular. Empty old basis specializes with determinant1. | Retain separation at new point. |
| 9.7 / constraint_basis_and_determinant | Transverse lines at0,5 | Basis rows(X−5,0),(0,X) satisfy the two lines; determinantX(X−5), one codimension at each point. Empty J givesI. | Retain. |
| 9.8 | Same basis, first row scaled by2; d=0 | DeterminantsX(X−5) and2X(X−5) generate the same ideal in Q[X]; d=0 gives1. | Retain Associated, not literal equality. |
| 9.9 / coordinateImageGenerator | Transverse lines; empty J | Coordinate generators X−5 andX; empty product1. Evaluation of X−5 at0 is−5≠0 and at5 is0. | Retain. |
| 9.10 | Nodes0,5 | Lagrange functions1−X/5 andX/5 have evaluations(1,0),(0,1). Thus prescribed allowed coordinate values have an explicit polynomial lift. | Retain. |
| 9.11 / evaluationConstraints_coordinate_image | Transverse lines and diagonal condition at0 | First coordinate r=X−5 is realized by(r,0); r=1 is not divisible and not realized. Diagonal condition has both coordinate imagesR although row(1,0) fails. | Retain both directions; projections do not identify whole image. |
| 9.12 | Basis vectors and c=(5,7) | J(b₁)=(1,0),J(b₂)=(0,1); J(5b₁+7b₂)=(5,7). Zero map fails both basis values. | Retain arithmetic J∘(1−φ). |
| 9.14 | M=[[1,2],[3,4]] | detM=−2; row expansion uses its rows, not columns. Rank0 matrix has determinant1. | Retain. |
| 9.15 | Same M,c=(5,7) | cM=(26,38); cMᵀ=(19,43). | Retain row convention. |
| 9.16 | Same coordinate equivalence | J⁻¹(5,7)=5b₁+7b₂ and regulator row(26,38). Plain equivalence reconstruction is supplied by Mathlib; identification with1−φ is additional. | Retain. |
| 9.17 | U=diag(2,1),c=(6,7) | New coordinates cU⁻¹=(3,7); new matrix UM cancels it: (cU⁻¹)(UM)=cM. Wrong cU gives(12,7). | Retain. |
| 9.18 | e₁=2,e₂=3; c=(7,11) | New coordinates(29,32), determinant1−6=−5; invertible over Q₅ but not Z₅. e₁=5,e₂=10 gives−49, a unit. | Retain unit determinant requirement. |
| 9.19 | Original slope r=7/11 with preceding shear | (1+3r)·29=(r+2)·32=928/11; original relation7=r·11. | Retain transformed line. |
| 9.20 | Z₂, forbidden slope−2, e₁=4,e₂=2 | r+e₁=2≠0,1+e₂r=−3≠0,det=−7 unit. In Z₅,e₁=1,e₂=−4 gives det5 nonunit despite nonzero. | Retain maximal-ideal choice. |
| 9.21 | A line avoiding both coordinate axes | Each coordinate projection has imageE although the joint line has dimension1<2; shearing does not imply joint surjectivity. | Retain coordinate-only conclusion. |
| 9.22 | Flag dims1,2 and transverse filtration line | Intersection dimensions give codimensions1,0; taking the flag line equal to the forbidden filtration line changes first intersection from0 to1. | Retain noncritical transversality. |
| 9.23 | Saturated line in rank2; nonsaturated pR·e₁ | Quotient by R·e₁ is free rank1; quotient by pR·e₁ has nonzero R/p torsion. | Retain saturation. |
| 9.24 | Weights0,2; empty module | Logarithmic matrix divisors1 and n₂; determinant n₂. Rank0 gives unit1. | Retain divisor multiplicity, not just determinant. |
| 9.25 | Rank2, one allowed line and full space | Specialization codimensions1 and0; replacing the line by its inverse-coordinate image preserves dimension1 but changes the membership test. | Retain actual transported subspaces. |
| 9.26 | F(0)=G(0) | Image is proper: (1,0) fails since1≠0, but both coordinate projections are allR via(r,r). | Retain joint constraint theorem. |
| 9.27 | Weights0,2 and1,1 | Regulator divisors (1,ℓ₀ℓ₁) and(ℓ₀,ℓ₀); atχ³ their products6 and9. | Retain. |
| 9.28 | p=5,k=2,a_p=0; (Col₁,Col₂)=(1,2) at0 | Correct relation (2−a_p)Col₂−(p−1)Col₁=4−4=0; printed transposed relation gives2−8=−6. | Retain corrected coordinate order. |
| 9.29 | p=5,h=9,P₀=[[0,−5⁹],[1,5]]; ideal(ϖ,X) | P₀ mod5=[[0,0],[1,0]], square0; φ²M⊂𝔪M gives φ²ⁿM⊂𝔪ⁿM. O[[X]]/(ϖ,X) has length1, not0; φ=1 gives constant iterates1 and no convergence. | Retain broader contraction proof and finite-cokernel conclusion. |
| 9.30 | c=(1,0), U⁻¹=[[1,1],[0,1]] | New row(1,1) changes second kernel membership from true to false; unit rescaling of a coordinate keeps its zero set. | Retain dependence on chosen basis. |
| 9.30a: complex and étale comparison | φ=2,γ=3,x=1; trivial D | d⁰1=(1,2),d¹=0; swap alone gives3. exp of trivial D=0; exp* of cyclotomic class=1 and of unramified class=0. | Mathematics retained; repair R01 supplier. |
| 9.30a: differential module | D=R_E(1); nonétale φ=5⁻¹ᐟ²,γ=1 | N=t⁻¹D and ∂e₁=t⁻¹e₁∉D; nonétale module has dimD_dR=1, slope−1/2 and Herr dimensions(0,1,0). | Retain arbitrary de Rham scope. |
| 9.30a: interpolation factors | h=3,j=0 in(i); h=1,j=1,2 in(ii) | Γ*(−2)⁻¹=2; corrected factors1,1 versus printed−1,2. | Retain correction. |
| 9.31 | p=5,c=2,3; p=2,c=2,3 | Distance valuations1/20 and1; N=1 at5 gives bound1/25 so overlap; N=2 gives1/5 so separation. At2,N=3 gives bound1 and strict balls separate. | Retain conductor strata. |
| 9.32 | z=(1+T)^6, k=0,1,−1 | κ(∂)z=z,6z,z/6 respectively; ∂(z/6)=z. On constants∂=0, so no global inverse. | Retain ψ-zero domain. |
| 9.33 | z=Σ(φʳ((1+T)^6−(1+T))) | (1−φ)z=(1+T)^6−(1+T); both overlap charts give η(6)⁻¹ζ₅⁻¹−1. Printed labeling gives η(6)⁻¹ζ₅−1 in one chart, unequal. Conductor5 Gauss normalization1 becomes0 at imprimitive modulus25. | Retain inverse-character chart label. |
| 9.34 | j=−1,−2,0; trivial representation | Γ*(j+1)=1,−1,1; conductor powers1,p⁻ⁿ,pⁿ. At−1 uniformizer valuation1 lies outside exp image; at−2 exponential is bijective. | Retain sufficiently-negative condition. |
| 9.35 | φ(d)=2d, (1−φ)z=(1+T)d | Global Amice value=d; conductor n chart value2⁻ⁿd versus2⁻ⁿ⁻¹d at n+1. For negative slope α, same valuesα⁻ⁿd andα⁻ⁿ⁻¹d differ. | Retain chart comparison; global extension belongs to Amice object. |
| 9.36 | Split/nonsplit multiplicative at5 | Augmentation Euler factors0 and5/3; only split case forces0. Rescaling differential by a unit preserves integral containment; by5 may lose integral normalization. | Retain containment, not equality. |

The finite-field rows were recomputed by arithmetic in F₅[a]/(a²−2), including all 23 admissible elements and all their differences. The matrix, cubic determinant and Coleman jet rows were recomputed using exact rational/modular arithmetic. The constraint theorem was also checked structurally: an adapted E-basis gives the one-point free module; at a new point the preceding determinant evaluates to a nonzero scalar; induction gives the stated determinant; Lagrange interpolation supplies the reverse coordinate-image inclusion. This works for the stated E-algebra with principal evaluation kernels, without silently assuming R is a PID. In the zero ring the theorem's IsDomain binder fails; in rank zero the determinant is1 and no Fin 0 coordinate can be chosen. Finite extensions of Qₚ exclude equal-characteristic and inseparable local-field inputs; such inputs have not been used to extend the arithmetic statements.

**Pinned-library audit.** Pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 13 named declarations were opened at those pins; these are actual inputs, not proposed parallel APIs.

| Declaration | File and line at pin | What was checked |
|---|---|---|
| Submodule.comap | Mathlib/Algebra/Module/Submodule/Map.lean:171 | Carrier is the actual inverse image under a semilinear map, with inherited closure. |
| LinearEquiv.symm_apply_apply | Mathlib/Algebra/Module/Equiv/Defs.lean:358 | Inverse reconstruction is already supplied. It does not identify an arithmetic map with that equivalence. |
| LinearEquiv.finrank_eq | Mathlib/LinearAlgebra/Dimension/Finrank.lean:115 | Dimension is preserved by an actual linear equivalence. |
| GaloisField.finrank | Mathlib/FieldTheory/Finite/GaloisField.lean:80 | Requires n≠0; the headline's s>0 supplies it. |
| GaloisField.card | Mathlib/FieldTheory/Finite/GaloisField.lean:130 | Same nonzero degree requirement; cardinality pⁿ. |
| Matrix.det_mul | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:141 | Multiplicativity supplies basis-change ideal invariance. |
| Matrix.det_fin_two | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809 | The shear determinant is ad−bc, giving1−e₁e₂. |
| TauCeti.teichmuller | TauCeti/RingTheory/Henselian/Teichmuller.lean:92 | Units of the finite residue field lift to tame roots; this is not a section on arbitrary nonunits. |
| TauCeti.unitsMap_residue_teichmuller | TauCeti/RingTheory/Henselian/Teichmuller.lean:123 | Reduction composed with this lift is identity. |
| TauCeti.rootsOfUnityAlgebraMulEquivUnitsResidueField | TauCeti/RingTheory/Henselian/Teichmuller.lean:258 | Uses integral closedness and the q−1 root group; not all roots at p=2. |
| TauCeti.unitFiltrationZeroEquivProd | TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean:281 | Topological tame/principal-unit decomposition is native. |
| TauCeti.frobeniusAlgEquiv_teichmullerLift | TauCeti/NumberTheory/LocalField/Frobenius.lean:61 | Unramified finite Galois extension; arithmetic residue Frobenius. |
| TauCeti.frobeniusAlgEquiv_rootsOfUnity | TauCeti/NumberTheory/LocalField/Frobenius.lean:74 | Raises tame roots to q_K, specializing to p for K=Qₚ. |

**Ownership and supplier resolution.** Object searches used the roadmap CLI across main and open heads, the board packages, and both pinned libraries: completed K₃/Bloch quotients, Chern regulators, Bloch–Kato maps, differential modules, Coleman coordinates, finite polylogarithms, evaluation kernels and determinant ideals. No second fully qualified declaration name was found for any of the three Lean headlines. The following contracts were resolved against their actual main copies or the available open heads, rather than against remembered numbering:

| Object | Resolved owner/locator | Boundary checked |
|---|---|---|
| Period rings and fundamental sequence | TauCetiRoadmap/PadicPeriodRings/README.md:216,416,469; FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1370,1412,1486 | Period carriers and finite-K continuous sequences are imports. |
| Finite local condition and adjunction | TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:3735,3753; SelmerIwasawaCohomology/README.md:1923,2329 | Representation-only exponential/finite condition and elliptic comparison; the arbitrary non-étale extension is new here. |
| Abelian de Rham/tangent realization | TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1899; NeronModelsAndSemistableAbelianVarieties/README.md:3024 | H¹ de Rham and its homological dual; no unproved minimal-differential scalar is imported. |
| Continuous and completed multiplicative carriers | TauCetiRoadmap/ArithmeticGaloisDuality/README.md:599; Completed/LocalGaloisGroups/README.md:678; Completed/ProfiniteArithmetic/README.md:274,336,407 | Continuous coefficients, pro-p multiplicative completion, integral torsion retained. |
| Unit logarithms and Leopoldt | Completed/LocalFieldsRamification/README.md:281; TauCetiRoadmap/IntegralIwasawaTheory/README.md:308,542,572 | Deep-unit log and global localization/matrix are imported; §3.5 uses the transpose and adds the stated local extension. |
| Fontaine/Herr/Wach | TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1374,1400,1520,2207,2288,2453,2494,2670 | φ-first signs, inverse specialization, representation differential module and integral good bases; R01 corrects the separate B-pair citation. |
| General de Rham modification | TauCetiRoadmap/PadicHodgeTheory/README.md:838,934,999 | Localization and filtered-module modification exist; the general N_rig(D)/exponential adapter here is not the representation-only N_dR(V). |
| Coleman series and distributions | TauCetiRoadmap/ColemanPowerSeries/README.md:4236,6360; LocallyAnalyticDistributions/README.md:1481,1606,1640,1672,1805,2007; PadicMeasuresIwasawaAlgebras/README.md:909,1148,1597,1978,2124,2485,2620 | Actual norm-compatible series, bounded/unbounded Amice and Mellin, growth, character and Weierstrass interfaces. |
| Completed local K-groups and edges | TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:284,316,512,613,1287,1373,1398,1418,1459,1484 | Ordinary Chern versus edge, small-prime torsion, TₚK₂=0 and completion all retained. |
| Integral Bloch group and roots | TauCetiRoadmap/K3BlochGroups/README.md:526,598,672,707,755,1685,2089,2119,2230 | Antisymmetric tensor boundary and coefficient-localized roots imported; their regulator normalization is additional here. |
| Coleman polylogarithms and supplied regulators | TauCetiRoadmap/ColemanIntegration/README.md:454,518,1542,1754,1829,2417,2991,3016 and §§L2.Fb,L3.Fa–Fc | The target consumes evaluation, rational localization, raw-symbol regulator and complex coordinate. It adds their comparison, not a second integration construction. |
| Complex normalization | TauCetiRoadmap/BorelRegulators/README.md:247,267,287,724,795; PolylogarithmFunctions/README.md:697,719,806,840 | Universal character, point coordinate and Borel conversion supplied; Suslin/de Jeu scalar comparison owned here. |
| Scheme transfer/weights and arithmetic rank | TauCetiRoadmap/SchemeKTheoryOperations/README.md:586,646,1895,2399,2568,2627,2719,2923; ArithmeticKTheory/README.md:653,950,1190 | Regular ample-family scope, projective smooth transfer formula and global K₃ finite generation/rank retained. |
| Syntomic and relative carriers | TauCetiRoadmap/CohomologyComparisonsPartII/README.md:182,295,324,361,390,448,478,509,529,548,596,613,648,676,768,788,817,872,892 | Filtered, divided/undivided, semistable and relative constructions have named owners; four additional contracts remain explicitly conditional. |
| Semistable periods and integration | TauCetiRoadmap/CohomologyComparisons/README.md:762,772,788,800; ColemanIntegrationPartII/README.md:116,189,348,414,786,828,856,970,1152,1198,1224 | Two independent suppliers; whole-regulator cancellation is the new assertion, not inferred from local choice independence. |
| Curve residue and tame symbols | TauCetiRoadmap/AlgebraicCurves/README.md:403,520,712,1099,1468; K2SymbolsBrauer/README.md:1425,1475,1602,1650,2500,2531 | Proper smooth curve/finite boundary domains and tame-kernel restrictions retained. |
| Downstream K₃ use | TauCetiRoadmap/HabiroNumberFields/README.md:826,843; HabiroNahmSeries/README.md:1634; Polylogarithms/README.md:189 | These consume the local normalized regulator/root presentation or Suslin evaluation here. No reverse supplier edge was added. |

The two automatic resolver leads were also checked: FontaineBPR1994 is a source ID, not a missing roadmap; `KTheoryQ.dvr_localization_iso` is a target of ColemanIntegration §L3.Fa.1 at README line2417, not a claimed pinned-library declaration. Neither is a finding.

The four active gap slugs in README lines96–102 match design/plan.json: dagger-syntomic-filtration, rigid-negative-weights, normalized-syntomic-boundary, semistable-period-descent. They name CohomologyComparisonsPartII and precise geometric/weight/normalization domains; their requested maps and compatibilities describe single coherent interfaces. They are conditional supplier contracts, not unowned prerequisites. The older completed-bloch-comparison entry has been discharged by the cited KTheoryFiniteLocalFields §§3.5,6.2,6.8–6.10 and K3BlochGroups §6.6; README lines61 and388 now consume those actual targets. I do not request a duplicate construction or treat that fulfilled contract as a missing supplier.

## Not verifiable

No sampled source was inaccessible. No additional explicitly unverified locator was found in the README. The 32 recorded cached texts were available; the additional cited dJ1995, G1995 and Nakamura2014 texts were obtained through the source service from legal locations. The LLZ2011 preprint was checked as a version of the same work, not as a second source identity.

The computations and source comparisons are review evidence, not completed formal proofs of the proposed library. In particular, the four declared CohomologyComparisonsPartII gaps remain future supplier obligations. This report does not certify them as already implemented. The positive-rank global p-adic K₃ injectivity conjectures remain conjectures, as the README states.

## Source issues

- **Misprint** in CC99 at IV.3.1 and V.3.2, pp.23,26–27 (CC99 line 968,1130): the source says the positive unit logarithm comes from a lift with 1−τ boundary; it should be τ−1 for that positive Kummer normalization, or the ensuing logarithm formulas must be negated; affects a stated result.
- **Error** in LZ2014 at Theorem B.6 and its transpose step, pp.39–40 (LZ2014 line 1772,1791–1792): the source says regulator reciprocity has a minus sign with its positive exponential adjunction; it should be plus after the degree-one Tate transpose contributes its missing minus; affects a stated result.
- **Misprint** in LLZ2011 at Proposition 5.9, p.1127 (LLZ2011 line 1449): the source says the coefficients 2−a_p and −(p−1) apply to first and second coordinates; it should be −(p−1) and 2−a_p, consistently with the preceding specialization relation; affects a stated result.
- **Gap** in LLZ2011 at proof of Proposition 5.11, pp.1128–1129 (LLZ2011 line 1498–1502): the source says a nonzero shear determinant establishes integral invertibility; it should be a unit determinant, obtained by choosing both parameters in the maximal ideal; affects the proof.
- **Misprint** in RJ2018 at Theorem I.10(ii), p.909 (RJ2018 line 1069): the source says the coefficient is Γ*(1−j−h)⁻¹; it should be Γ*(1+j−h)⁻¹=1/(j−h)!; affects a stated result.
- **Error** in RJ2018 at equation (3), Theorems I.15 and I.27, pp.914,919–920 (RJ2018 line 1280–1294): the source says the Gauss-sum chart is evaluated at ηκ; it should be evaluated at η⁻¹κ with the displayed η-weighted sum; affects a stated result.
- **Error** in RJ2018 at Corollary I.29, p.920 (RJ2018 line 1663–1666): the source says the conductor-normalized function extends to all weight space; it should be the Amice function that extends globally, with φ⁻ⁿ retained only on conductor-n charts; affects a stated result.
- **Misprint** in GSWZ2024 at Example 4.3, equation (273), p.54 (GSWZ2024 line 2706): the source says the second listed root value has exponent5; it should be exponent2, as in equation (274) and the residue computation; affects a stated result.
