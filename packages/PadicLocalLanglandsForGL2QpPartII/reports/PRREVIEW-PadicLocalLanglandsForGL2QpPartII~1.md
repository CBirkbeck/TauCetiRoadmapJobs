# Review of PadicLocalLanglandsForGL2QpPartII (pull request #2455 at 04fba00)

**Verdict:** needs changes

## R01 (P2) — The PadicHodgeTheory gap asks the supplier about this roadmap's own objects

**Location** `TauCetiRoadmap/PadicLocalLanglandsForGL2QpPartII/README.md` line 143: "Prove its compatibility with the inverse limits defining the nuclear Fréchet spaces O[M]^(G_ℚ_p) and Ω¹[M]^(G_ℚ_p) of §4.5, including the absence of an extra derived-limit term, and with their differential d."

**Claim** The `needs` of gap:continuous-galois-tensor-comparison bundles several requests. One of them is a statement about O[M]^(G_ℚ_p), Ω¹[M]^(G_ℚ_p) and d of §4.5 here, which PadicHodgeTheory (merge position 133) cannot state. The plan's `needs` sentence has the same clause ("compatible with d and the inverse limits defining the rational Drinfeld function and differential spaces").

**Witness** At its open head, PadicHodgeTheory §4.4 defines the Sen and D_dif realisations only. Neither §4.4 nor any other section of that roadmap has Drinfeld function spaces, O[M], Ω¹[M] or their differential d.

**Repair** Replace the README's gap sentence, and make the same change to the gap's `needs` in `design/plan.json`, with: "What PadicHodgeTheory must provide (gap:continuous-galois-tensor-comparison): in §4.4, for every finite L/ℚ_p and finite-dimensional continuous L-representation V of G_ℚ_p, with X = C⊗_ℚ_p V^∨, continuous H¹(G_ℚ_p, X) is Hausdorff and finite-dimensional over L, and for every Fréchet L-space F = lim_i B_i, a countable inverse limit of Banach L-spaces with trivial G_ℚ_p-action, the natural map H¹(G_ℚ_p, X)⊗_L F → H¹(G_ℚ_p, X⊗̂_L F) is a topological isomorphism, natural in continuous linear maps F → F′." In §4.5 (line 718), replace "The route uses gap:continuous-galois-tensor-comparison with B₀ = O[M]^(G_ℚ_p), B₁ = Ω¹[M]^(G_ℚ_p) and X = C⊗_ℚ_p V^∨." with "The route applies gap:continuous-galois-tensor-comparison to X = C⊗_ℚ_p V^∨ and to the Fréchet spaces B₀ = O[M]^(G_ℚ_p) and B₁ = Ω¹[M]^(G_ℚ_p), each a countable inverse limit of its Banach stages, and, by naturality, to the continuous map d: B₀ → B₁." In the same paragraph, replace "The strict model and inverse-limit comparison are part of the supplier gap" with "The strict model and the inverse-limit comparison are part of the supplier gap, and their application to B₀, B₁ and d is made here". Test on V = L, F = L: both sides are L·[logχ] (§4.5, Checks).

## R02 (P2) — The §1.7 density route translates the thesis proof step by step

**Location** `TauCetiRoadmap/PadicLocalLanglandsForGL2QpPartII/README.md` line 401: "let ℓ ∈ (Π(V)^an)′_b vanish on Π(V)_c^P-fin. For n ≥ m(V) and x ∈ D⁻_dif(V), §§1.4–1.5 give v ∈ Π(V)_c^P-fin with φ_v(1) = x and φ_v(p⁻ʲ) = 0 for j ≠ 0, so …"

**Claim** The proof plan follows its source clause by clause in translation, with the source's citations replaced by section numbers.

**Witness** DOSPINESCU12THESE lines 3346–3358 and 3383 have the same nine steps in the same order: annihilator, single-shell vector, orthogonality, nondegeneracy, φ⁻ⁿ injective, ψ, Res_ℚ_p = 0, coordinates (0, x̌), x̌ ∈ ∩φⁿ. No run of words is copied verbatim; the passage is a translation.

**Repair** Replace the sentence that begins "The route for the density" and ends "and y = 0." with: "The route for the density (DOSPINESCU12THESE, Proposition 8.4.1 and Théorème 8.4.3): by the duality formula, an annihilator ℓ of Π(V)_c^P-fin is orthogonal to every Kirillov function concentrated on one shell, and these functions exhaust D⁻_dif(V) on each shell (§§1.4–1.5); the perfectness of §1.6 therefore kills each localisation i_(0,n)(ℓ), n ≥ m(V). Injectivity of φ⁻ⁿ on the radius stage, with ψ for n < m(V), turns this into the vanishing of ℓ on every compact open subset of ℚ_p. Hence ℓ is carried by the Weyl chart, with coordinate in ∩_(n≥1)φⁿ(D_rig(V̌)), which COLMEZ14LA Théorème 3.23(i) kills for non-trianguline V̌."

## R03 (P3) — Two Checks name the base module M(·) where the type is meant

**Location** `TauCetiRoadmap/PadicLocalLanglandsForGL2QpPartII/README.md` line 210 (§0.1, Checks): "put M = M(π₀⊗χ∘det). Then JL(M) = JL(π₀)⊗χ∘Nrd, so p acts on JL(M) by χ(p²) = (1+p)² ≠ 1." The same "put M = M(π₀⊗χ∘det)" appears at line 851 (§4.12, Checks).

**Claim** In this README, M(·) is the base's module M° = M[−1] (§§0.4(a), 2.4). For that module, the JL(M) printed in the Check and the value (1+p)² are both wrong; they hold for the type M(π₀⊗χ∘det)[1].

**Witness** §0.4(a) gives M ≅ M(π)[1]. The §0.4 Checks give LL_p(M(π)[1]) = π⊗η∘det with η(p) ∈ {p, p⁻¹}. So for the literal M = M(π₀⊗χ∘det), p acts on JL(M) by (1+p)²p^(±2), not (1+p)².

**Repair** At line 210, replace "and put M = M(π₀⊗χ∘det). Then" with "and let M be the type with LL(M) = π₀⊗χ∘det, that is M = M(π₀⊗χ∘det)[1] (§0.4(a)). Then". At line 851, replace "and put M = M(π₀⊗χ∘det)." with "and let M be the type with LL(M) = π₀⊗χ∘det (§0.4(a))." With the type, JL(M) = JL(π₀)⊗χ∘Nrd and p acts by (1+p)² ≠ 1, as printed.

## R04 (P3) — The PR summary claims density for every V

**Location** Pull-request description, `roadmap-summary` block: "Kirillov duality and density hold for every absolutely irreducible two-dimensional V at every prime, whereas the base's density needs p ≥ 5."

**Claim** The head proves the density only for non-trianguline V, and its own Check shows that density fails for trianguline V.

**Witness** README line 401: "For every such V that is not trianguline, at every prime p, prove … that Π(V)_c^P-fin is dense in Π(V)^an". Line 419 (Checks): "The density needs non-triangulinity."

**Repair** Replace the sentence with: "Kirillov duality holds for every absolutely irreducible two-dimensional V at every prime, and the density of the compactly supported P-finite vectors in Π(V)^an holds for every such V that is not trianguline, at every prime, whereas the base's density needs p ≥ 5."

## Verified sound

| Target | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| §0.2 type decomposition | n = 0, Z = H⁰(M^p_(0,C)) = L² | ⊕ over ΦNᵖ_0 = {Sp, Sp⊗δ₋}, δ₋ unramified with δ₋(p) = −1 | ϖ_D swaps the factors: [Sp] = L(1,1), [Sp⊗δ₋] = L(1,−1); their sum is L² | holds |
| §0.2 level reading | full level 0, H⁰ = ∏_(h∈ℤ) L, p shifts the height by 2 | H¹(p^ℤ, H⁰) = 0 | solve f_(h+2) − f_h = a_h in each parity from f₀ = f₁ = 0; \|f_h\| ≤ sup\|a\| | holds |
| §0.3 period line | ℚ_p(1); lines ℒ ≠ ℒ′ | D_pst(V_(M,ℒ)) = M[−1]; distinct lines give non-isomorphic V | φ = p⁻¹ on D_cris(ℚ_p(1)), φ = 1 after [1]; CDN20 lines 879–913 (Lemme 2.7(ii) uniqueness) | holds |
| §0.4(c) dictionary | ℒ = Le₁ | ℒ ↦ ℒ^⊥⊗∧²M_dR | v ↦ (w ↦ e₁∧w) kills e₁ and sends e₂ to e₁∧e₂, giving Le₂* = ℒ^⊥ | holds |
| §0.4(a) shift | trivial ζ; LL_p(M) against LL_p(M[−1]) | LL(M) = LL_p(M[−1]) | LL_p(M) has central character η², with η(p)² = p^(±2) ≠ 1 | holds |
| §1.1 sandwich | weights {0,1}; wrong jumps {0,1} | D⁺ = tN⁺ + L_n[[t]]ℒ | Σt⁻ⁱFilⁱ with Fil⁻¹ = M_dR, Fil⁰ = ℒ gives it; the wrong jumps give N⁺ + t⁻¹L_n[[t]]ℒ ⊄ N⁺ | holds |
| §2.3 irreducibility | k = 1, Δ = Δ(M°) | Π(V)^an/π ≅ Π(M°,−1)⊗det | COLMEZ19POIDS line 234: quotient Π(M,−k)⊗x^k; central characters x^kω and x^(−k)ω differ by p^(2k) (E25) | holds |
| §2.3 no smooth vectors | hypothetical (u⁺)² = 0 | Res_ℤ_p∘(u⁺)² = t²·Res_ℤ_p forces 0 | (1+T)^(p^N) − 1 = p^N·t + O(p^(2N)); t² is a non-zero-divisor on D_rig(V̌) | holds |
| §3.3(iii) three lines | A = diag(1,2) | two lines leave A undetermined | A fixes Le₁ and Le₂ and sends L(e₁+e₂) to L(e₁+2e₂); a third line forces α = β | holds |
| §3.3 non-trivial ζ | p = 7, ω quadratic, ω(7) = 1 | no twist reaches trivial central character | squares of characters of μ₆ have order dividing 3; ω restricted to μ₆ has order 2 | holds |
| §3.1(b) global datum | H¹_dR(Σ_r)^ρ ≅ M*_dR⊗π′ | dim Hom_G(π′_b, H¹_dR^ρ) = 2 | M*_dR⊗End_G(π′) = L² | holds |
| §3.1(a) twist removal | π(f)_p ≅ π⊗ξ∘det | ξ removable by a finite-order Hecke character | central character ξ² has finite order, so ξ(p) is a root of unity | holds |
| §3.1 Lie action on duals | Ω¹ = O(2)⊗det | a⁺ = ∂u⁺, a⁻ = −∂u⁺, u⁻ = −∂²u⁺ | transposes with ∂u⁺ − u⁺∂ = 1 give exactly these; on O′_b, a⁺ = −1 on ker u⁺ | holds |
| §4.1 diagram | slope 1/2 against slope 0; n = 0 | θ injective; no supercuspidal of level 0 | (B⁺_cris⊗M)^(φ=1) = 0 at slope 1/2; Ǧ/O_D^× ≅ ℤ is abelian | holds |
| §4.2 Steinberg duals | μ = δ₀ − δ_∞, g_n = u(pⁿ) | (St^cont)* is not continuous for the norm | g_nμ − μ = δ_(pⁿ) − δ₀ has norm 1 (indicator of pⁿℤ_p^×) and tends to 0 on compacts | holds |
| §4.7 line extension | e ↦ ae | normalised quotient unchanged | dual generator a⁻¹e*; ℒ⁻¹ = M*_dR/ℒ^⊥ (CDN20 line 933); Props 2.9–2.10 at lines 952, 962 | holds |
| §4.10(c) bounded duals | Π = St^cont, ℓ(f) = f′(0) | ℓ ∈ (Π^an)′ is not G-bounded | diag(pᵐ,1)ℓ = pᵐℓ, ℓ(z·1_ℤ_p) = 1; F_m = p⁻ᵐz·1_(p^(2m)ℤ_p) has norm ≤ p⁻ᵐ and \|ℓ(F_m)\| = pᵐ | holds |
| §4.12 Banach multiplicity (R03) | type of π₀⊗χ∘det, χ(p) = 1+p | M ∉ ΦNᵖ, multiplicity 0 | type: p acts by (1+p)²; literal M(π₀⊗χ∘det): by (1+p)²p^(±2) | conclusion holds; printed value wrong (R03) |
| §4.13 étale multiplicity | Π = Π_(M,ℒ) | V_(M,ℒ)⊗JL(M) | dimension 2·dim JL(M) against dim JL(M) in §4.12: the line is replaced by V | holds |
| §4.14 Galois socle | n = 0; dim V = 3 | (St^cont⊗δ_G)*⊗δ_Ǧ for Sp⊗δ ∈ ΦNᵖ_0; 0 for dim 3 | H¹_ét = (St^cont)*², whose ϖ_D-eigenparts are (St^cont)* and (St^cont⊗δ₋∘det)* | holds |
| §5.5 finite generation | m = O_L | Nakayama on the O_L-dual | the O_L-dual is O_L, compact and finitely generated; the Pontryagin dual L/O_L = ϖ(L/O_L) ≠ 0 | holds |
| §6.1 interpolated dual | ρ̄_B against ρ̄_B⊗ε̄⁻¹ | the twist is needed | Π(ρ_x(ε)) has central character det·ε, Π(ρ_x) has det·ε⁻¹; the ratio ε² has infinite order | holds |
| §6.3 rigidity | O a DVR; ρ against ρ⊗χ, χ(p) = 1+p | infinitely many maximal ideals needed | same reduction, determinant ratio χ², χ²(p) = (1+p)² ≠ 1 | holds |
| §6.6 factorisation | p = 5, n = 0; A = L⟨T⟩ | completed sum; compact-convergence topology | μ_j = δ_(5^j) − δ₀ has norm 1 and tends to 0 in (St^cont)*; Ǎ/TǍ = 0, Ǎ[T] = L·ev₀ | holds |
| §2.4 weight change | k = 2, ζ = 1 | Δ_(2,ℒ) is not étale | det Δ_(2,ℒ)(p) = p²·p⁻¹ = p; δ₂(p)² = p⁻¹ restores 1 | holds |
| §7.2 BGG row | k = 1, a = p | middle term and preimage have the same scalar | p⁻³p⁴ = p and p⁻¹p² = p; four copies of π′ would give 1 | holds |
| §7.3 Teitelbaum model | p = 2, 3 | genus p(p−1)/2 | 2g − 2 = −2(p+1) + (p+1)p gives g = 1 (TEI90 line 315) and g = 3 | holds |
| §7.4 Iwasawa | p = 2, m = 1 | Γ₁ = Γ | 1+2ℤ₂ = ℤ₂^×, ℚ₂(μ₂) = ℚ₂; corestriction preserves H¹_e | holds |
| §7.5 primitivable | over ℚ_(p²), f = (1,−1) on Ω⊔Ω | f ∈ H⁰_dR·O(Ω), not in O(Ω) | primitives (z^j/j!, −z^j/j!) for every j; refutes DLB17 Théorème 1.10 at line 447 (E2) | holds |
| §7.6 derived realisation | r large | Hom has dimension 2 and Fil⁰ = ℒ | M*_dR⊗Hom((Π^an)′, π′) = L² | holds |
| LocallyAnalyticDistributionsPartII contract (HYP) | G_i with p = 3, i = 1; p = 2, i = 2 | basis value ω = 1, resp. 2 | 1+1 > 3/2 and 2+2 > 2; ω([g,h]) ≥ ω(g)+ω(h) iff i ≥ 1, resp. i ≥ 2; ω(g^p) = ω(g)+1 | holds |
| R01 gap | PadicHodgeTheory §4.4 at its head | needs O[M]^G, Ω¹[M]^G and d | none of these objects exists in that supplier | finding R01 |
| R02 density route | §1.7, line 401 | own proof plan | nine steps in the same order as DOSPINESCU12THESE lines 3346–3358 and 3383 | finding R02 |
| R04 PR summary | trianguline V̌ | density for every V | we₁ lies in every (u⁺)^j(Π^an)′ (thesis lines 3386–3408), so density fails | finding R04 |

- Source locators checked against the cached texts: about 105 (DLB17 28, CDN20 27, CDN23 32, COLMEZ19POIDS 10, TEI90 7, DOSPINESCU12THESE 3, COLMEZ14LA 1). Every sampled target matches its locator, hypotheses and statement. Source corrections E2, E3, E9, E10, E11, E14, E15, E18, E20, E22, E23, E24 and E25 are confirmed at their lines.
- Library declarations opened at the pin: `Bornology.IsVonNBounded` (Mathlib/Analysis/LocallyConvex/Bounded.lean:61), `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` (Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659), `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:679), `WithSeminorms.banach_steinhaus` (Mathlib/Analysis/LocallyConvex/Barrelled.lean:164), `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87), `BDeRhamPlus` and `BDeRham` (Mathlib/RingTheory/Perfectoid/BDeRham.lean:75, 88).
- Cross-roadmap citations: every cited section of the 17 supplier roadmaps resolves (4 on main, 13 at their open heads). I read about 40 of them against the contracts, including base §§2.5, 4.2(v), 4.9, 5.8, 5.12 and 6.9, and the base Scope line that assigns §§3.1 and 3.3 to this roadmap.
- Gate at 04fba00: every check 0, OK. Dependency check: `depcheck: 258 roadmaps, 2463 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file declares nothing, so the `#check @name` comparison is empty. No headline is statable at the pins, and the module docstring names every headline (§§2.3–2.4, 3.1, 3.3, 4.12–4.14, 6.6, 7.2–7.6) with its missing carriers.
- Declared gaps: all four slugs appear in the README and in `design/plan.json`. fixed-radius-divisibility, cuspidal-projectivity-coefficients and three-period-line-globalisation are precise and name existing supplier sections (base §6.9, GL2AutomorphicRepresentationsAndTransfer R16.2.10, CompletedCohomologyAndLocalGlobalCompatibility §6.4). continuous-galois-tensor-comparison is R01.
- Overlap check: read ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PadicHodgeParametersInLocallyAnalyticRepresentations, PadicLocalLanglandsForGL2Qp, PhiGammaModulesAndIwasawaCohomology and LocallyAnalyticDistributions. Shared objects and their owners: the Drinfeld multiplicity diagram and bounded vectors (ProetaleCohomologyOfPAdicCurvesAndTowers §§7.3–7.5), mod p finite length (ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4), the local Breuil–Strauch core (base §6.9); all are cited, and those three roadmaps assign the Galois socle, the factorisation and §§3.1/3.3 to this roadmap. Nothing has two owners.
- Source independence: 22 passages compared with 7 sources; one proof plan is translated clause by clause (R02). Largest share DLB17, 122 of 265 source-id mentions. Contents compared with DLB17 §§3–12: independent. Layers 4–6 follow CDN20 and CDN23, and §3.1 merges DLB17 §§3–5; the order of Layers 1–3 is forced by §2.1 *Needs* §1.7, §2.2 *Needs* §2.1 and §3.1 *Needs* §§2.1, 2.3.

## Not verifiable

- CD14 (Colmez–Dospinescu, *Complétés universels de représentations de GL₂(ℚ_p)*), Théorème 0.2: the source behind CDN23 Lemme 5.3(c) and behind the central-character hypothesis that §4.10 adds. It is not among this roadmap's sources, so I checked it only against the statement of base §2.5.

## Source issues

- **Error** in DLB17 at Théorème 1.10 (arXiv p. 11, line 447): the source says infinitely primitivable functions on Σ_n lie in O(Ω); it should be H⁰_dR(Σ_n)·O(Ω), since component-wise constants are primitivable; affects a stated result.
- **Gap** in DLB17 at the proof of Théorème 5.1 (arXiv p. 30, line 1198): the source ignores the unramified twist ξ before taking isotypic parts; it should remove ξ by a finite-order global character first; affects the proof.
- **Gap** in DLB17 at Proposition 11.10 (arXiv p. 64, lines 2704–2705): the source says infinite t-divisibility in the Robba ring forces z₁ = 0; it should prove this inside one lattice of fixed radius on both charts; affects the proof.
- **Gap** in DLB17 at Remarque 11.13 (arXiv p. 66, lines 2773–2781): the source says two lines and linearity in Ext¹ give BS(ℒ) = Π^an_ℒ; two lines fix the comparison only up to a diagonal matrix, so three lines are needed; affects the proof.
- **Misprint** in DLB17 at Théorème 1.9 (arXiv p. 11, lines 431–443): the source uses n for both the cover level and the cyclotomic level, and integrates over ℤ_p at n = 0; it should use separate indices and integrate over Γ at level zero; affects nothing.
- **Error** in DLB17 at §1.1 (arXiv p. 3, lines 114–116): the source says Σ₀ over ℚ_p is two copies of Ω; it should say it is connected over ℚ_p and splits only over ℚ_(p²); affects nothing.
- **Misprint** in CDN20 at the proof of Proposition 2.5(ii) (p. 22, lines 874–876): the source says the Hom has dimension 0 or 1 according as D_pst(V*) is or is not isomorphic to M[−1]*; it should be the reverse; affects nothing.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8 (HAL pp. 63–64, lines 2430 and 2471): the source states the condition as M of level ≤ n; on the p-central quotient it should be M ∈ ΦNᵖ_n, as its proof uses; affects a stated result.
- **Misprint** in CDN23 at Théorème 5.15 (HAL p. 68, line 2624): the source defines Ř_(B,M) as Hom(Ř_(B,M), L); it should be the continuous L-dual of R_(B,M); affects nothing.
- **Misprint** in CDN23 at the proof of Théorème 5.10 (HAL p. 66, lines 2549–2551): the source takes Π to be a subrepresentation of Π(V); it should be a quotient, so that Π* embeds into the Hom; affects nothing.
- **Gap** in CDN23 at the proof of Lemme 5.12 (HAL p. 67, lines 2581–2584): the source concludes isomorphism over any PID from irreducibility over the fraction field and equal traces; this needs absolute irreducibility or characteristic zero; affects the proof.
- **Misprint** in CDN23 at §0.2.1 (HAL p. 6, lines 227–228): the source says π₀(M_(n,C_p)) is a torsor under F^*/(1+m_F^n); with Ǧ_n = 1+m_D^n it should be F^*/Nrd(Ǧ_n) = F^*/(1+m_F^⌈n/2⌉); affects nothing.
- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii) (p. 4, lines 161–166): the source prints the quotient of Π(Δ) as Π(M,−k); it should be Π(M,−k)⊗x^k, as the central characters show; affects nothing.
- **Misprint** in COLMEZ19POIDS in the paragraph before Conjecture 0.10 (p. 8, line 321): the source prints the operator O_n(−k)⊗x^(−1−k) → O_n(k+2) as the k-th derivative; it should be the (k+1)-st derivative; affects nothing.

## For the human reviewers

- The every-prime density and vanishing of §1.7 (README line 401) rest on DOSPINESCU12THESE, a doctoral thesis read from the author's page (Théorème 8.4.3, Remarque 8.4.4). I did not check whether a refereed version with the same statement exists.
