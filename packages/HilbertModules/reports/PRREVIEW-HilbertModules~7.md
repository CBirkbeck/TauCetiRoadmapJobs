# Review of HilbertModules (pull request #2625 at 14016f0)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every Check and worked value was recomputed and holds, including in the zero and empty cases; the three Layer 2 theorems of `Suggested.lean` elaborate with `sorry` as the only warning and none closes in one tactic; every supplier is on main and every cited library name exists at the pins. There are three small corrections (the GNS contract names the unital declaration only, the locally constant integer sheaf of §5.10 is already at the Tau Ceti pin, and a consumer expects a pre-imprimitivity completion that §3.5 does not state) and one format note, none blocking. The human reviewers have two licence questions and one text that could not be read.

## C01 — The GNS contract names the unital representation only, while §3.4 localizes at states of possibly nonunital algebras

An implementer of §3.4 who follows the *Needs:* line (line 519–520) and the Mathlib contract (line 1497–1498) reaches `PositiveLinearMap.gnsStarAlgHom`, which at the pin requires `[CStarAlgebra A]` (`Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`, line 230 and 246). Convention 1 makes A possibly nonunital, and the state localization `x ↦ x ⊗ ξ_ω` is used in that generality in Layer 7. The declaration for that case is `PositiveLinearMap.gnsNonUnitalStarAlgHom` (same file, line 196), which VonNeumannAlgebras V0 also uses. The cyclic vector at the Tau Ceti pin, `PositiveLinearMap.gnsVector`, is the class of the unit and so is unital only (`TauCeti/Analysis/CStarAlgebra/GNS.lean`, line 72–76).

Naming `PositiveLinearMap.gnsNonUnitalStarAlgHom` beside `gnsStarAlgHom` in both places, and saying that the cyclic vector `ξ_ω` for nonunital A is taken from VonNeumannAlgebras V0, would make the contract match the generality of §3.4.

## C02 — The sheaf of locally constant integer-valued functions that §5.10 constructs is already at the Tau Ceti pin

§5.10 (line 992–994) asks to construct "the locally constant integer-valued functions Z" as a sheaf, and Scope and ownership lists the three sheaves as owned here. At the pin, `TopCat.locallyConstantSheaf X R` is the sheaf of commutative rings of locally constant R-valued functions, with the gluing proved in `TopCat.isSheaf_locallyConstantRingCatPresheaf` (`TauCeti/Topology/Sheaves/LocallyConstant.lean`, line 176). The sheaf Z of abelian groups is its image under the forgetful functor for R = ℤ, up to the universe of X.

§5.10 would say that Z is obtained from `TopCat.locallyConstantSheaf`, and the Tau Ceti contract would name it; the sheaves `C(−, ℝ)` and `C(−, 𝕋)` of abelian groups, the value 0 on the empty set and the exponential sequence stay targets.

## C03 — OperatorAlgebraDynamics says Layer 3 supplies the completion of a pre-imprimitivity bimodule over dense *-subalgebras, and §3.5 does not state it

On main, OperatorAlgebraDynamics (its README, line 304–312) lists among what "HilbertModules H3" supplies "the completion of a pre-imprimitivity bimodule over dense *-subalgebras `A₀⊆A`, `B₀⊆B` to an imprimitivity bimodule". This README has the one-sided completion over a dense *-subalgebra in §1.2 (line 155–158) and, in §3.5, the equivalence with the definition by two full inner products, but no statement that a bimodule over `A₀` and `B₀` with two compatible pre-inner products completes to an A–B imprimitivity bimodule. The Downstream consumers entry for OperatorAlgebraDynamics (line 1364–1365) mentions only the one-sided completion.

One sentence in §3.5 would close it: for dense *-subalgebras `A₀ ⊆ A` and `B₀ ⊆ B` and an `A₀`–`B₀` bimodule with full pre-inner products satisfying `_A⟨x, y⟩z = x⟨y, z⟩_B` and the two boundedness conditions, the completion of §1.2 is an A–B imprimitivity bimodule. If the author prefers to leave the statement with OperatorAlgebraDynamics, nothing here is false.

## N01 — One Mathlib name is written without its namespace

`cechComplexFunctor` (Convention 8, §5.10, the Layer 5 Dependencies and the Mathlib contract) is `CategoryTheory.cechComplexFunctor` at the pin (`Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean`, line 27 and 65); the bare name does not resolve.

## Previous findings

The previous review, of this same head, raised no finding, no small correction and no format note, so there was nothing to check for repair. Its five earlier points (the §5.11 Check, the Layer 5 Examples sentence, the Kaad–Lesch and Dixmier–Douady locators, the CStarAlgebras §2.6 entry in §7.2, the Downstream consumers list) were read again at this head and stand repaired: §5.11 says "for every cover with a nonempty index set"; the Examples say "exhaust the nonzero finitely generated projective"; §7.2 cites "Kaad–Lesch, §3, Theorem 3.1" and names CStarAlgebras §2.6; fifteen consumers are listed.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.4 right self-module (sample) | M₂, a = E₁₂, b = E₁₁; A = 0; op-transport | a*b = E₂₁, b a* = 0; `inner_def` gives y·star x, in Aᵐᵒᵖ at (op a, op b): op(a*b) | true; pin `WithCStarModule.inner_def` |
| §1.1 Cauchy–Schwarz, right form | M₂, x = E₁₁, y = E₁₂; pin statement | ⟨x,y⟩*⟨x,y⟩ = E₂₂ = ‖x‖²⟨y,y⟩; reversed E₁₁ ≰ E₂₂; pin: ⟪x,y⟫⟪y,x⟫ ≤ ‖x‖²⟪y,y⟫, unop gives the right form | true |
| §1.1 Gram Check | x = (E₁₁, E₁₂) | Gram Σ E_ij⊗E_ij = vv*, eigenvalue 2; transpose Σ E_ij⊗E_ji = flip, eigenvalue −1 | true |
| §1.8 complements (sample) | C[0,1], J = ker δ₀; F = E; F = 0 | J⊥ = 0, J⊥⊥ = A ≠ J; F = E: P = 1; F = 0: P = 0 | true |
| §2.1 adjoint pairs (sample, headline) | A = 0; A = ℂ, multiplication by n on finite sequences | A = 0 forces E = F = 0; symmetric unbounded on a dense domain, so totality is needed | true; one-tactic probe fails |
| `norm_adjoint_comp_self` (headline) | T = diag(2,1); T = 0; incomplete E | 4 = 2²; 0 = 0; ‖Tx‖² = ‖⟨x,STx⟩‖ ≤ ‖ST‖‖x‖², no completeness used | true; probe fails |
| `exists_parseval_frame_iff_finite_projective` (headline) | A = 0; E = pA; E = C[0,1] with ⟨f,g⟩ = t·conj(f)g | n = 0 both sides; frame {p}; incomplete: needs Σ\|xᵢ\|²t = 1, fails at 0, so completeness is needed | true; probe fails |
| §2.8 polar decomposition (sample) | T = multiplication by t on C[0,1]; T = 0 | closure of range = J, not complemented, no decomposition; T = 0: V = 0 | matches Liu–Luo–Xu Thm 3.8, Rem. 3.11 (lines 225, 267) |
| §2.9 non-adjointable maps | (f,g) ↦ (g,0) on A ⊕ J | adjoint would be (f,g) ↦ (0,f), needs f(0) = 0 | true |
| §3.2 induced maps, units (sample) | x⊗b; B = F = ℂ, φ = 0 | ⟨x⊗b,x′⊗b′⟩ = b*⟨x,x′⟩b′ = ⟨xb,x′b′⟩; φ = 0 gives B⊗_B F = 0 ≠ F | true |
| §3.5 left inner product | ℂⁿ over Mₙ–ℂ; x = e₁, y = e₂, z = e₁ | xy*z = 0 = x⟨y,z⟩; variant yx*z = e₂ ≠ 0 | true |
| §4.2 Kasparov (sample, headline) | E = Aⁿ; E = 0; A = K(H), H nonseparable | shift is unitary; 0 ⊕ H_A = H_A; summand A not countably generated, so H_A is not | true |
| Brown–Green–Rieffel (headline) | Mₙ and ℂ; K(H), H nonseparable | Mₙ⊗K ≅ K; K(H)⊗K = K(H⊗ℓ²) ≇ K, yet K(H) ∼ ℂ: σ-unitality needed | true |
| §5.1 C₀(X)-algebras (sample) | C(Y) over C(X), Y = [0,1]⊔{p}, p ↦ 0 | fibre norm of 1_p: 1 at 0, else 0; upper semicontinuous, not continuous; h not open | consistent with §5.2 |
| §5.4 torus lines (sample) | (m,n) then (m′,n′); Θ_(v,w) | phase e^{2πikns}e^{2πikn′(s+m)} = e^{2πik(n+n′)s} as kn′m ∈ ℤ; Θ_(v,w)u = v·conj(w)·u = ⟨w,v⟩u | true |
| §5.5 curvature and Chern number | ∇_s = ∂_s − 2πikt; theta section for k = 1 | [∇_s,∇_t] = 2πik; iF/2π = −k ds∧dt; Σ e^{−π(t+n)²}e^{−2πins} is in M₁, antiholomorphic, one zero of index −1 | −k confirmed two ways |
| §5.7 determinant, classification (sample) | b-cycle; Γ_(1,2)⊗Γ_(1,3); zero module | det = (−1)^{b−1}e^{2πiar}; gauge e^{−πi(b−1)s} gives phase e^{2πiar}; parameter 3+2 = 5, rank 6; zero module excluded | true; Hatcher Prop. 3.10 (line 3359) |
| §5.8 unitary dual, continuous trace (sample) | A = K(ℓ²); A = 0 | point dual; diag(1/(n+1)) compact, trace ∞; m(A) = trace class, dense proper; A = 0: Â = Prim = ∅ | true |
| §5.9 local Morita (sample) | Â Hausdorff | equal kernels are indistinguishable in the induced topology, T₀ forces injectivity | true |
| §5.10 refinement Check | {a,b}, ({a},{b}) into ({a},{b},{b}) | (c₁,c₂,c₃) ↦ (c₁,c₂) or (c₁,c₃); equal on cocycles where c₂ = c₃ | true |
| §5.11 exponential sequence (sample) | X = 𝕋; X = ∅; I = {∗}, U = ∅ | identity has no logarithm; ∅: complex 0; one empty member with value ℤ: H⁰ = ℤ | true; pin `isZero_cechCohomology_obj_of_isEmpty` |
| Dixmier–Douady (headline) | X = point; X = ∅; X = S³ | Ȟ³ = 0, K(H) ∼ ℂ; A = 0, both sides trivial; ℤ realized by a bundle | consistent |
| §6.2 regularity, graph module (sample) | A = ℂ; ι on graph module | 1+T*T onto (von Neumann); ⟨x,Ry⟩ + ⟨Tx,TRy⟩ = ⟨x,(1+T*T)Ry⟩ = ⟨x,y⟩ | matches Kaad–Lesch Prop. 2.4 (line 346) |
| §6.3 bounded transform | T = t on ℂ | z = t/√(1+t²), (1−z²)^{1/2} = 1/√(1+t²), T((1−z²)^{1/2}x) = zx | true |
| §6.4 calculus, resolvents (sample) | T = t on ℂ; block operator | \|(λ−t)⁻¹\| ≤ 1/\|Im λ\|, equality at t = Re λ; block criterion | matches Kaad–Lesch Lemma 2.3 (314), Prop. 4.1 (604) |
| §6.5 deficiency | −i d/dt on H₀¹[0,1] | −if′ = if gives e^{−t}; −if′ = −if gives e^{t}; S*(u+Uu) = iu − iUu | true |
| §7.2 separation (sample) | A = 0, L = ∅; C[0,1], L = ker δ₀, x = 1 | A = 0 has no state, "nonempty" needed; only δ₀ works, ι_δ₀(L) = 0 ∌ 1 | Kaad–Lesch Thm 3.1 (377), erratum Thm 2.1 (1581) |
| Local–global principle (headline) | A = ℂ; Λ(s) = e^{i/s} on [0,1] | all localizations equal T; sing-supp = {0} = sing-supp_r: selfadjoint, not regular, localization at 0 is D_min | Kaad–Lesch Thm 4.2 (616), Lemma 6.2 (934), Prop. 6.3 (1008) |
| §7.5 sum criterion | T = 0, 𝓔 = E | hypotheses hold trivially; conclusion is the block criterion for S | matches Assumption 7.1 (1086), Thm 7.10 (1425) |
| C01: GNS at the pin | `gnsStarAlgHom`, `gnsNonUnitalStarAlgHom` | first needs `[CStarAlgebra A]`; second has `[NonUnitalCStarAlgebra A]` | contract incomplete |
| C02: sheaf Z | `TopCat.locallyConstantSheaf` | sheaf of commutative rings of locally constant R-valued functions, R = ℤ | present at the pin |
| C03: pre-imprimitivity completion | OperatorAlgebraDynamics line 310–312; §§1.2, 3.5 here | consumer attributes it to H3; this README states only the one-sided completion | not stated |

- Source locators checked against the text: Kaad–Lesch §2.2–2.3, Lemmas 2.1 and 2.3, Prop. 2.4, Thm 3.1, Prop. 4.1, Thm 4.2, Lemma 6.2, Props 6.3–6.4, Assumption 7.1, Thm 7.10, erratum Thm 2.1 (13); Liu–Luo–Xu Lemma 3.6, Thm 3.8, Rem. 3.11 (3); Hatcher Prop. 3.10 (1); Dixmier–Douady Def. 1, Prop. 4 (2).
- Library declarations elaborated at the pins in a probe file outside the repository: 23 Mathlib names of the contracts and the three opposite-algebra instances (`cechComplexFunctor` read in source, see N01); 29 Tau Ceti names located by file and line, among them `TauCeti.Topology.cechCohomology` (Colimit.lean 70), `PointOpenCover.exists_refinement` (CoverSystems.lean 107), `TopCat.Hom.cechComplexPullback` (Pullback.lean 53), `NonUnitalStarAlgHom.multiplierExtension` (Nondegenerate.lean 204), `DoubleCentralizer.congr` (Multiplier.lean 265), `LinearPMap.cayley` (Cayley.lean 64), `TauCeti.integralTopForm` (TopForm.lean 518).
- Duplication by object at the pins: no adjointable operators, Hilbert-module tensor products, imprimitivity, continuous trace, unitary dual, Dauns–Hofmann or exponential sequence in either library; the one hit is C02.
- Cross-roadmap citations resolved on main (a61e2d8), all present: CStarAlgebras §§1.3, 1.4, 1.7, 2.2, 2.6, 2.7, 5.1, 5.4, 6.1–6.2, 7.1, 9.7; VonNeumannAlgebras V0, V4.Core, V4.Normality, V7.StandardAmplifications, V7.Dimension; TopologicalKTheory T1, T1.5a; CharacteristicClasses C1.2b, C1.6, `c(F) = det(1+(i/(2π))F)`; AlgebraicTopology §4.5, Layer 6; SmoothBundlesConnections B1.3, B3.3, B6.0–B6.3; DifferentialGeometry 5.2; PDE §§1.1, 1.2, 1.6; BanachSpaceTheory B1; BanachAlgebras §4.3; SelfAdjointSpectralTheory Parts C–D and its `zI − A` convention; ComplexKahlerGeometry §2.5; NoncommutativeGeometry N7; HeisenbergImprimitivity §6.3.
- Automatic checks: every check passed. Dependency check output: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 56, 69, 81) and nothing else. `#check @` of the four declarations was compared with the README: completeness is present on the first and third theorems and absent, correctly, on the second; `StarOrderedRing` on all three; `CStarAlgebra` on the frame theorem. No binder is lost.
- One-tactic probes: `simp_all [IsAdjointPair]`, `rfl`, `infer_instance`, `aesop` and `exact?` close none of the three theorems. Headline audit: the three statable Layer 2 headlines are stated; the docstring names the multiplier identification, Morita equivalence, Kasparov stabilization, Brown–Green–Rieffel, Dixmier–Douady and the local–global principle with the carrier each lacks.
- Pull request text against the head: 54 sections each with a *Needs:* line, 35 Checks lists with 58 bullets, eleven roadmap contracts, fifteen consumers, the Lean declarations unchanged; no sentence is contradicted.

Overlap check: read TracesOnCStarAlgebras, FreeProbability, GeneralizedCohomology, SpectralManifolds and QuantumFoundations (open, by vocabulary), CStarAlgebras, OperatorAlgebraDynamics and OperatorKTheory (main, by vocabulary); the list by results and headings is empty. Shared objects: CStarAlgebras' structure theory is CStarAlgebras', consumed here, and CStarAlgebras names this roadmap as owner of Hilbert modules, Morita equivalence, `C(X)`-algebras and the point-separation theorem; imprimitivity bimodules, induced Hilbert spaces, the standard module and Kasparov stabilization are owned here and consumed by OperatorAlgebraDynamics and OperatorKTheory (which owns only the graded stabilization); the open roadmaps consume H1–H6 and own none of these objects; TracesOnCStarAlgebras shares nothing (its traces are lower semicontinuous traces, not continuous-trace algebras).

Source independence: 11 passages compared with 4 sources (Kaad–Lesch Thm 3.1, Prop. 2.4, Lemma 2.3, Prop. 4.1, Lemma 6.2, Assumption 7.1 and erratum Thm 2.1; Liu–Luo–Xu Thm 3.8 with Rem. 3.11; Hatcher Prop. 3.10; Dixmier–Douady Def. 1 and Prop. 4), none shared beyond formulas, standard names and forced hypothesis lists; largest share Raeburn–Williams, 23 of 62 source mentions in the layers; contents not compared with Raeburn–Williams, whose text and table of contents could not be read. The order of Layers 1–4 is forced by their *Needs:* lines (2 needs 1, 3 needs 1–2, 4 needs 1–3); Layers 6–7 rest on Kaad–Lesch, whose sections they do not map one to one (its §§2–4 are spread over §§6.1–6.4 and 7.1–7.3, and §6.5 and the torus and Čech sections have no counterpart there).

Research link: Layer 7's sum criterion (Kaad–Lesch 2012, Theorem 7.10) is, by that paper's §7 (line 1082–1083), the regularity input for the Kasparov product of unbounded modules; Layer 5 is the Dixmier–Douady classification (Dixmier–Douady 1963; Raeburn–Williams 1998). Rests on the Kaad–Lesch text and the README's references.

## Not verifiable

- Raeburn–Williams, *Morita Equivalence and Continuous-Trace C*-Algebras*: paywalled and not in the manifest; the sampled locators of §§2.1 (Definition 2.17), 4.2 (Theorem 5.49), 5.8 (Definition 5.13) and 5.9 (Proposition 5.15) were not read.
- Williams, *Crossed Products of C*-Algebras*, Appendix C (§5.1), and Blackadar, *Operator Algebras*, II.7: paywalled; not read.
- Roe, Proposition 10.2 (§2.7): the linked host is in no licence class the sources service knows.
- Teschl, Theorem 2.27 (§6.5): the sources service refused the linked URL as not shown to be the author's page; the text was requested.
- Pierrot 2006, Théorème 1.18 (§7.3): not read; its statement is known only through the Kaad–Lesch erratum (line 1546–1565).

## Source issues

- **Gap** in kaadLesch12 at Theorem 3.1, printed page 8: the source says every point outside a closed convex subset is separated from it by some state, with no nonemptiness or nonzero-algebra condition; it should be assume the subset nonempty or the algebra nonzero, since the zero algebra has no state and the empty set is closed and convex; affects nothing.

## For the human reviewers

- Licence: the README links Roe's notes on a wpmucdn.com host under sites.psu.edu (`TauCetiRoadmap/HilbertModules/README.md`, line 1661–1662); the sources service could not classify it as the author's page.
- Licence: the README links Teschl's book at www.mat.univie.ac.at/~gerald (line 1667–1668); the service refused it because the URL does not name the author. A human can confirm it is Teschl's own page.
- Not tested: Raeburn–Williams has the largest share of the locators (23 mentions). Neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
