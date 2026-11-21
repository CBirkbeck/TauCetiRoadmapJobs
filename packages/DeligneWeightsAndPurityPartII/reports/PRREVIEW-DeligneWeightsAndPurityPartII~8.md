# Review of DeligneWeightsAndPurityPartII (pull request #1760 at cdacab3)

**Verdict:** needs changes

**Summary.** Needs changes, for one finding. The Galois-equivariance of the proper algebraic–adic comparison, which the README asks ClassicalAdicEtaleCohomology to supply as a declared gap, is already stated by GaloisActionOnEtaleCohomology §4.2 on main, so the object has two owners and the gap asks for what an earlier roadmap provides. No statement of the roadmap was found false; the sampled locators all hold. There are four small corrections and two format notes, none blocking, and three source issues (one a gap in Ito's proof of his Theorem 6.2, which the README already works around). Two points are left for the human reviewers.

## R01 (P2) — The field-automorphism naturality of the proper algebraic–adic comparison is declared as a gap for ClassicalAdicEtaleCohomology, but GaloisActionOnEtaleCohomology §4.2 on main already states it

An implementer of §4.2 is sent to a supplier contract that asks ClassicalAdicEtaleCohomology for a theorem another roadmap, earlier in the merge order and on main, already owns; the comparison then has two owners and would be planned twice.

The contract `gap:analytic-comparison-automorphisms` (supplier contracts, `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:973`) asks, for a complete rank-one K, a proper K-variety V and n invertible in K°, that `H^i(V_K̄,ℤ/n) → H^i(V_C^ad,ℤ/n)` commute with every continuous K-automorphism of C, with cup products and with coefficient reductions; the scope paragraph (`:915`) says ClassicalAdicEtaleCohomology owns this naturality, and §4.2 (`:766`, `:798`) consumes it. On main, `TauCetiRoadmap/GaloisActionOnEtaleCohomology/README.md` §4.2 (`:393`) proves, for K complete of rank one in any characteristic, Y a proper K-scheme, Λ any torsion ring and M in D⁺, that `H^i(Y_{K^sep}, M) ≅ H^i((Y^an)_C, M^an)` is G_K-equivariant; its §0.2 (`:51`) identifies G_K with all continuous K-automorphisms of C; its ownership list (`:499`) claims "the equivariant comparison with analytifications for proper schemes", and its consumer list (`:472`) names this roadmap for exactly this compatibility. The coefficients ℤ/n and the properness are the same on both sides; the README does not cite GaloisActionOnEtaleCohomology anywhere.

The smallest change: in §4.2, its *Needs* line, the Layer 4 Dependencies, the scope paragraph and the supplier contracts, cite GaloisActionOnEtaleCohomology §§0.2 and 4.2 for the automorphism square, and reduce the declared gap to what that section does not state (compatibility of the comparison with cup products and with coefficient reductions), or withdraw it if §3.5 here and the naturality in M of that §4.2 are taken to give both.

## C01 — The module docstring says the pins lack perfectoid-field and functorial tilt carriers, and they have both

`TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean:24`–`:26` says §§2.1–2.4 "lack the tower completion, perfectoid-field and functorial tilt carriers". At the pinned Tau Ceti, `TauCeti.Perfectoid.IsPerfectoidField` is a class on a complete ultrametric nontrivially normed field (`TauCeti/RingTheory/Perfectoid/Field.lean:68`, with the Frobenius criterion `isPerfectoidField_iff` at `:200`), and `TauCeti.Perfectoid.uniformTilt` with its functorial `map` is the tilt of a complete uniform Tate ring (`TauCeti/RingTheory/Perfectoid/UniformTilt/Basic.lean:114`, `:1044`). A reader takes the sentence as the reason nothing of Layer 2 is stated.

What the pins do lack is the completed Kummer tower as an object, the Galois comparison of K with K♭ and the marked data. Would you name those instead? The perfectoidness of K in §2.1 is then statable without new definitions (K complete with a dense subfield generated over k by compatible p-power roots of a uniformizer); if you count it a headline it could be stated, and if not the docstring can say that it is a preliminary of §2.4. The supplier contract for PerfectoidSpaces could also name the two declarations.

## C02 — The Check of §0.5 refers to a "condition (b)" that is labelled nowhere

In the Check of §0.5 (`README.md:219`), "The theorem fails without condition (b)" has no referent: admissibility in §0.3 (`:121`) is stated as two unlabelled conditions. Say "without the condition t(H′∩I) ≠ 0".

## C03 — In the route of §4.1, "§0.7", "§0.9" and "§4.13" mean SchemeAndStackFoundations, but read as this roadmap's own sections

The second paragraph of §4.1 (`README.md:722`) says "By §0.7 a finite separable … extension", "hence smooth by §4.13", "It maps onto X₁ (§0.7)" and "(§0.9)" without a roadmap name. This roadmap's §0.7 is the direct-summand theorem and its §0.9 is finite-extension invariance, so the references point at the wrong statements; the intended ones are SchemeAndStackFoundations §0.7 (`geometric_irreducible_components`), §0.9 and §4.13 (`regularLocus_eq_smoothLocus`), as the *Needs* line of §4.1 lists. Prefix the roadmap name at each of the five places.

## C04 — `OrientedEtaleProduct` is attributed to ClassicalAdicEtaleCohomology §5.4, which uses no such name

The supplier contract (`README.md:969`) cites "the general-base nearby-cycle topos `OrientedEtaleProduct`" of ClassicalAdicEtaleCohomology §5.4. That section (`TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3081`) defines "the oriented étale product" in prose and declares no identifier; the name occurs in no roadmap on main and not in the pinned libraries, so a search for it finds only this README. Write it in prose, as the supplier does.

## N01 — Three Checks are stated twice

§0.2 gives the unramified restriction twice (`README.md:109` and `:115`); §0.8 gives `ℙ^n_k` twice (`:273`, `:281`) and Spec k both as an API bullet and as a Check (`:269`, `:275`). One of each suffices.

## N02 — The *Needs* line of §1.1 omits DeligneWeightsAndPurity §0.6

The route of §1.1 applies the all-embeddings criterion, which is DeligneWeightsAndPurity §0.6; the *Needs* line (`README.md:339`) lists §§0.19, 5.11, 7.15 and reaches §0.6 only through "Layer 0". Adding §0.6 would make the line item by item.

## Verified sound

| Statement | Instances and values computed on each side | Result / change |
|---|---|---|
| Conventions, Frobenius relation | N e₁ = e₀, Φ = diag(1,q): NΦe₁ = q e₀ = qΦN e₁; ΦNΦ⁻¹e₁ = q⁻¹e₀. SCH12 line 2530: NΦ = qΦN | agrees with source; no change |
| §0.1 datum | tame model: (0,1)(x,0)(0,1)⁻¹ = (q⁻¹x,0); 1 ∈ Fr gives (1−Q⁻¹)t = 0; arithmetic coset needs qQ = 1; ℤ[1/Q]⋊ℤ: t = 0 on open {0} | wrong models excluded; no change |
| §0.2/§0.3 restriction | ϖ = uϖ′ᵉ: t_k = e·t_{k′}, constant e⁻¹, Q = q^f; ϖ^{1/ℓ^∞}: t = 0; ϖ^{1/p^∞}: f = 1, t(H′∩I) = ℤ_ℓ | consistent with §0.1's rule t′∘α = ct |
| §0.4 purity | Tate string: eigenvalues 1, q on gr₋₁, gr₁; weights 0, 2; w=1. Semisimplification: weights 0, 2 in gr₀. Dual at q=2: 1/2, 1; w=−1 | SCH12 lines 2518–2545; no change |
| §0.5 detection | Φ^fτ on a grade: α ↦ α^f·ζ; weight for q equals weight for q^f; converse uses N on G_k and t ≠ 0 on H′∩I | both directions hold; C02 |
| §0.6 transport | t′∘α = ct gives pulled-back operator cN′; c = ℓ: ℓ·(N/ℓ) = N | SCH12 line 2527; no change |
| §0.7 summands | N = N₁⊕N₂, spectra add; ker N in Tate string: weight 0 ≠ 1; S₃ on ℚ₃³: 3 ≠ 0, complement exists | SCH12 line 2652; no change |
| §0.9, §0.10 | ℙ¹, residue degree f: (1,q) ↦ (1,q^f); purely inseparable degree p: e = p, constant p⁻¹ ≠ 0; good reduction: N = 0, only gr₀ | SCH12 lines 2547, 2564; no change |
| §1.1–§1.2 (headline) | SCH12 Theorem 9.4: x rational; README: closed x, Q=q^a, by constant extension; DEL80 line 1528; Legendre at λ=0: node, N≠0 | wider than the source's form, route given; no change |
| §2.4–§2.5 | t = uϖ″ᵉ: t_{ℓ,k} = e·t_{ℓ,k″}∘β, constant e⁻¹; k″ = 𝔽_q((t^{1/p})): N_{k″} = pN_k, p⁻¹·pN = N; p = 2: N(ϖ₁) = −ϖ | direction of scalar correct |
| §3.1 tubes | ITO20 lines 866–931: T quasi-compact open, ∩T = d(Ẑ); V(ϖT), ε = \|ϖ\|²: radius \|ϖ\| against \|ϖ\|²; ideal (1), ε < 1: ∅ | agrees with the source |
| §3.4 fixed and uniform (headline) | ITO20 Theorem 4.5(2), line 974: char 0, locally constant F. Theorem 4.9, line 1003: either characteristic, all n. n = p: H¹(B(1),ℤ/p) infinite, origin 0 | hypotheses equal the README's |
| §3.4 sliced nearby cycles | t² = π: (σ−1)² = −2(σ−1), (σ−1)^k = (−2)^{k−1}(σ−1); zero iff n \| 2^{k−1}; odd n fails, 2-powers hold; after √π trivial action | ITO20 lines 189–251, 803; Checks correct |
| §3.4 annular covers | u²−u=T⁻¹: \|T\|=\|w\|²; z²+(T/c)z+T/c² has discriminant norm r, so δ(−log r)=−log r, unbounded; g₋₂ʲₘ=1 diverges | README's Galois-domination hypothesis is needed; see Source issues |
| §3.4 uniform annular images | ITO20 Theorem 1.4 (line 124) and 6.10 (line 1586): Kummer of degree invertible in O, then finite Galois étale; Step 1 Galois reduction (line 1608) | order of the composite as in the source |
| §3.4 truncation and duality Checks | level m contributes H^{s−m}(C_m), s ≤ r, m ≤ s+1 ≤ r+1; ℙ¹×annulus: Hom(ℤ/n(−1),ℤ/n) = ℤ/n(1), Hom(ℤ/n,ℤ/n) = ℤ/n | consistent |
| §4.1 approximation | y² = x³−x over 𝔽₃(t): disc 4 ≠ 0; deg g*O(1) = 2; conic X²+sY²+tZ² regular, not smooth; k₃ perfect, descent to k₁^{1/p^m} | SCH12 line 2496, DJ96 line 597; C03 |
| §4.2 comparison | arrows: site pullbacks or inverses of bijective ones; thickening Y ⊆ Y_eq universal homeomorphism; n = 9, q = 2: 2⁻¹ = 5 mod 9 | SCH12 lines 2604–2632; R01 on the supplier |
| §4.3 top degree | f* = 0 gives g*π*_X = 0 on H^{2d}(X_Σ); trace of g*c₁(H)^d = deg g · deg(c₁(H)^d[W]) > 0; mod ℓ can vanish | SCH12 line 2636 |
| §4.4 splitting | ax=0 ⇒ x=0; dim annihilator = dim V − dim U′; S₃ on ℚ³, c=3: plane ⊕ diagonal; characteristic 3: c=0, fails | true over every field; statable only on free carriers |
| §4.5–§4.6 (headline) | SCH12 Theorem 9.6, line 2589: k local of characteristic 0, Y geometrically connected proper smooth, set-theoretic complete intersection; Theorem 1.15, line 239, p. 251 | hypotheses equal |
| §4.7 | Σuᵢ ≤ 1: sections 1, xᵢ/x₀ of O(D₀); O(−D₀): none for n ≥ 1, O for n = 0; N = ∏(nᵢ+1)−1; Sym(0): empty Proj | SCH12 lines 2373, 2386; `projectiveSpaceToProj` at `Proj.lean:491` |
| Suggested.lean, statability | file declares nothing; pins have no monodromy filtration, Weil-number predicate, fan scheme over a field or analytic étale cohomology; they have `IsPerfectoidField`, `uniformTilt` | C01 |

- Previous review (of 7268ab8): it had no finding, so nothing to check as repaired; its remark on the *Needs* line of §1.1 stands as N02.
- Source locators read against the text: SCH12 21 (lines 34, 239, 2373, 2386, 2496–2652), ITO20 46 (lines 76–2391 as cited in §§3.1–3.6 and the gap contracts), RAM05 1 (line 1020), DEL80 1 (line 1528), DJ96 1 (line 597). All carry the theorem number, page and hypotheses the README gives.
- Library declarations opened at the pins: 14 of Tau Ceti (inertia, tame character, Frobenius lift, Teichmüller lift, product fan, symmetric-algebra grading, `IsProjectiveOver` at `ProjectiveOver.lean:57`, `projectiveSpace`, `projectiveSpaceToProj`) and 9 of Mathlib (`absoluteGaloisGroup`, `IsNilpotent.exp`, `IsPerfPair`, `Ext.comp`, `mapExactFunctor_comp`, `Sheaf.H`, `Proj`, `IsClosedImmersion`, `HasEigenvalue`); all exist where cited.
- Cross-roadmap citations resolved on main: 17 suppliers, about 60 section ids. LocalFieldsRamification now has Layers 0–2 with a table of former layer numbers, which keeps the citations of its Layers 0–4 valid. All suppliers are on main; none is an open pull request.
- Dependency check: `depcheck: 171 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The four declared gaps carry the same slugs in the plan and the README; three are precise and minimal, the fourth is R01.
- Automatic checks rerun: every check passes. Elaboration of `Suggested.lean` exits 0 with no output; the file declares nothing, so the `#check` comparison and the one-tactic probe have empty inventories. Nothing changed outside the folder.
- Title and description read against the head: every sentence of the prose and of the summary block holds (adds the folder; `Suggested.lean` declares nothing; §4.7 and the pinned projective-space identification as described).

Overlap check: read ClassicalAdicEtaleCohomologyPartII (open), AnalyticToricGeometryPartII, ClassicalAdicEtaleCohomology and EtaleDualityAndPerverseSheavesPartII (main), and, by object, GaloisActionOnEtaleCohomology and WeightsInEtaleCohomology; the equivariant proper algebraic–adic comparison is shared with GaloisActionOnEtaleCohomology, which owns it (R01); toric projection, approximation and radial regions are owned by the suppliers and cited; nothing else shared.

Source independence: 12 passages compared with 3 sources (SCH12, ITO20, RAM05), none shared beyond forced hypothesis lists (longest common run 7 words); largest share ITO20, 89 of 167 source mentions; contents compared with ITO20 (§§1–7, Appendix A): independent, only Layer 3 draws on it and the order of the blocks of §3.4 is forced by their *Needs* lines.

Research link: The end theorem is Scholze's weight–monodromy theorem for toric complete intersections (Scholze, 2012), proved by tilting to Deligne's equal-characteristic theorem (Deligne, 1980); Layer 3 is Ito's uniform neighbourhood theorem (Ito, 2020), written for a mod-ℓ analogue of Scholze's argument. Rests on the README summary, SCH12 §9 and ITO20 Remark 1.3.

## Not verifiable

- LUT93, HUB96, HUB98: settled as uncertified; their statements were read only as Ito and Scholze recall them (ITO20 lines 99–106, 964, 1198, 2009; SCH12 line 2604).
- The description's account of earlier review rounds and of who ported the package: not checkable from the head.
- The AxiomMath/Weil declarations of the Provenance section were not opened again in this round; the passage is unchanged since the previous review, which read them.
- Finiteness of the normalization of `Spec O[T]` in the Check of the adapted-coefficient block (`README.md:611`): not computed.

## Source issues

- **Misprint** in SCH12 at Proposition 9.1, p. 307: the source says the exponential formula for ρ(σ) evaluates the tame character at an element g; it should be evaluated at σ; affects nothing.
- **Gap** in ITO20 at the proof of Theorem 6.2, Appendix A, p. 52: the source says Ramero's Lemma 2.1.10 bounds the discriminant function by a constant depending only on the degree; it should require the field-factor degrees invertible in K, since the Artin–Schreier cover u²−u = T⁻¹ in characteristic 2 has unbounded discriminant function; affects the proof.
- **Misprint** in ITO20 at Theorem 4.5(1)(c), p. 21, and Theorem 4.8(3), p. 22: the source says the target is the compactly supported cohomology of d(Ẑ) minus d(Ẑ); it should be d(X̂) minus d(Ẑ); affects nothing.

## For the human reviewers

- ITO20, the source with the largest share of locators (89 of 167), is cited as arXiv:2008.07794v1 (`TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:1008`); the README gives no journal reference for it.
- The Provenance section links AxiomMath/Weil at commit 27cdb20, stated there as Apache 2.0 (`TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:1018`); `Suggested.lean` declares nothing, so no Lean here is adapted from it.
