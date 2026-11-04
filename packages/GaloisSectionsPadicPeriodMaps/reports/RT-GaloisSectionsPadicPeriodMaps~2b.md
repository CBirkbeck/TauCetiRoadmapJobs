<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1205#issuecomment-6481358886 -->
Red team round 2 pass b (claude) of 5d9cc0a

Verdict: needs_changes

1. **F01** (P3) §7.1 asserts a varying relative dimension that the imported family definition excludes

   Location: `packages/GaloisSectionsPadicPeriodMaps/README.md:1125` ("let d_i := dim `X_{y′_i}` (the relative dimension at y′_i, which may vary with i)") and `README.md:1131` ("for Y′ = Y ⊔ Y with relative dimensions 1 and 2, the total rank is 6 while 2d_1δ = 4").

   Claim: in the setting of §5.4 the relative dimension of the abelian-by-finite family may depend on the component of the finite base.

   Witness: MordellLawrenceVenkatesh §2.1 at its head: "(f : X → Y', zero section, λ) is a polarized abelian scheme of constant relative dimension d"; `README.md:333`: "The family has constant relative dimension d > 0 over Y′"; `README.md:885`: "d is the constant relative dimension"; `README.md:1081`: "abelian-by-finite family of constant relative dimension d > 0". The witness family is not an object of the cited definition, so it is a Check about a carrier the roadmap does not have, and the roadmap contradicts itself on whether d_i varies.

   Repair: at `README.md:1125` replace "let d_i := dim `X_{y′_i}` (the relative dimension at y′_i, which may vary with i), δ := deg(Y′ → Y) and B := `dim_{K_v} H¹_dR(X_{y₀}/K_v)` = `Σ_j 2d_j·[L_{w_j} : K_v]`, the total rank of H¹ of the base fibre; for constant relative dimension d, B = 2dδ." by "let d be the constant relative dimension of the family (MordellLawrenceVenkatesh §2.1), d_i := d for every i, δ := deg(Y′ → Y) and B := `dim_{K_v} H¹_dR(X_{y₀}/K_v)` = `Σ_j 2d·[L_{w_j} : K_v]` = 2dδ, the total rank of H¹ of the base fibre." At `README.md:1131` replace "A bound 2d_iδ computed from one component would be too small when the relative dimension varies: for Y′ = Y ⊔ Y with relative dimensions 1 and 2, the total rank is 6 while 2d_1δ = 4." by "B is the degree of the integral Frobenius polynomial of the total representation, which is what bounds every fibre eigenvalue; it is stated as a total rank so that it needs no constancy of the relative dimension, although MordellLawrenceVenkatesh §2.1 imposes constancy." Keep "2d_i ≤ B". Tested: with d constant and δ = 2 the total rank is 4d = 2dδ, and Betts–Stix Definition 6.11 (bs line 2472) still reads with d_i = d.

2. **F02** (P3) §8.6 cites Chebotarev Layer 10 for a natural-density statement that Layer 14 supplies

   Location: `packages/GaloisSectionsPadicPeriodMaps/README.md:1404` ("(I) When K has no CM subfield, for 100% of places (natural density) some q satisfies (1°)–(4°)"), `README.md:1416` (*Needs:* "TauCetiRoadmap.Chebotarev Layer 10"), `README.md:145` ("Layer 10 supplies Chebotarev density … residue-class densities in §8.6"), `README.md:1424` (Layer 8 Dependencies: "Chebotarev Layer 10").

   Claim: Chebotarev Layer 10 supplies the density used in §8.6 (I).

   Witness: Chebotarev on main (Completed), Layer 10 is "Dirichlet-density Chebotarev" (line 410); Layer 14 "natural density and consistency theorems" proves `hasNaturalDensity_frobeniusPrimeSet` and states "This is not derived from Layer 10: Dirichlet density alone does not imply natural density" (lines 612–626). The proof sketch at `README.md:1408` also uses log q = O(r₀), the Chebyshev bound of Layer 13 ("rational prime-counting specialisation" in the contract at `README.md:145`), which the *Needs:* line omits.

   Repair: at `README.md:1416` replace "TauCetiRoadmap.Chebotarev Layer 10" by "TauCetiRoadmap.Chebotarev Layers 10, 13 and 14, Dirichlet density, prime counting and natural density"; same replacement in the Layer 8 Dependencies at `README.md:1424`. At `README.md:145` replace "It supplies the density input in Harari–Stix, infinitely many primes fixed by CM conjugation, and residue-class densities in §8.6." by "Layer 10 supplies the density input in Harari–Stix and infinitely many primes fixed by CM conjugation; Layer 14 supplies the natural-density form of the residue-class densities in §8.6 (I)." Tested: the lower bound ∏_r max(1−18/(r−1), 0) at `README.md:1408` is a natural-density bound only with Layer 14; Dirichlet density would not give "100% of places (natural density)".

3. **F03** (P3) the §7.2 Check does not test GSp-irreducibility: its family already fails the de Rham condition

   Location: `packages/GaloisSectionsPadicPeriodMaps/README.md:1167` ("The representations ρ_λ(g)=[[1,λ(g)],[0,1]] … Every one has the stable isotropic line ℚₚe₁, so GSp-irreducibility excludes this infinite family.").

   Claim: the family ρ_λ, λ ∈ Hom(G_{K,S}, ℚₚ) nonzero, is an infinite family that only GSp-irreducibility removes from T_i.

   Witness: an extension of ℚₚ by ℚₚ over G_{K_v} is de Rham only when unramified (for V = ℚₚ, H¹_g = H¹_f since D_cris(ℚₚ(1)) has φ = p⁻¹ ≠ 1, and H¹_f(G_v, ℚₚ) is the unramified line). A λ unramified at every place above p and outside S is unramified everywhere and factors through the finite class group, so λ = 0 (ℚₚ is torsion-free). Hence no ρ_λ with λ ≠ 0 is de Rham at the places above p: the family is excluded by condition (iii) of §6.1 before GSp-irreducibility is invoked, so the Check also holds for a T_i defined without GSp-irreducibility (vacuous for the hypothesis it names).

   Repair: replace the last two sentences of the Check by "Distinct nonzero character lines give non-isomorphic representations, each with the stable isotropic line ℚₚe₁. None is de Rham at both places above p: a de Rham extension of ℚₚ by ℚₚ is unramified, and an everywhere-unramified λ factors through the finite class group, so λ = 0. The family is therefore already excluded by the de Rham condition of §6.1; the Check tests the character count and the isotropic line, not the necessity of GSp-irreducibility." Tested on λ = the cyclotomic logarithm direction: log χ_cyc is ramified at every place above p and ρ_λ is not de Rham there.

4. **F04** (P3) §1.3's base is wider than the supplied fundamental-group correspondence

   Location: `packages/GaloisSectionsPadicPeriodMaps/README.md:358` ("over a normal connected scheme Y of characteristic zero") and `README.md:360` ("Y being connected, is a continuous ℚₚ-representation of π₁^ét(Y)").

   Claim: for every normal connected scheme Y of characteristic zero, the lisse lattice of R^iπ_*ℚₚ is a continuous representation of π₁^ét(Y) by InverseGaloisAndArithmeticFundamentalGroups §IG.0.3.

   Witness: IG.0.3 at its head: "based π₁ and paths use connected nonempty locally Noetherian schemes or the componentwise groupoid"; the full-faithfulness statement is for connected X. The README's normality hypothesis is no longer used (the argument goes through the lattice), while local Noetherianity, which the supplier's based π₁ requires, is absent. Every consumer (§§1.4–1.8) has Y a smooth curve over a number field, so nothing downstream needs the wider base.

   Repair: at `README.md:358` replace "over a normal connected scheme Y of characteristic zero" by "over a connected locally Noetherian scheme Y of characteristic zero"; at `README.md:360` replace "Y being connected" by "Y being connected and locally Noetherian". Tested: a smooth curve over K is connected and Noetherian; the nodal negative control at `README.md:360` is unchanged.

## Round-1 findings at this head

Each earlier finding was checked against the head, quoting the repaired passage.

| Finding | Status | Witness at head |
| --- | --- | --- |
| r1a F01 (P1) least auxiliary primes field-independent | repaired | `README.md:1404`: "(III) for curves of genus 3 over ℚ, the least q satisfying (1°)–(4°) at some place is 23, while (1)–(3) … allow q = 11 at some place. These minima … are not asserted for an arbitrary number field." Checks at `README.md:1413–1414`. Recomputed: over ℚ, 3, 5, 7 divide `q_v·∏_{i≤7}(q_v^i−1)` for every prime q_v (Fermat); q = 3 fails (3°) since 4ζ(6) ≈ 4.07 > 1/6; 7, 11, 19 fail (2°); q = 23: 32ζ(6)/10648 ≈ 0.00306 < 1/56 ≈ 0.01786. Over K = ℚ(√5, ζ₁₁+ζ₁₁⁻¹): q_v ≡ ±1 mod 5 and mod 11 for p ∉ {5, 11}, so 5 | q_v(q_v²−1) and 11 | q_v(q_v²−1) at every place; q = 11 fails (2), q = 23 fails (2°). Correct. |
| r1a F02 (P2) local-system category restriction | repaired | `README.md:57`: "their isogeny category as continuous fundamental-group representations of a connected base … comparison … with all rational local systems assumes a normal Noetherian base; it is not used here"; `README.md:360`: "modulo torsion they give a lisse ℤₚ-lattice … lies in the isogeny category … A rational line with monodromy p around a nodal loop has no stable lattice". `README.md:294, 413` use the isogeny category. Matches IG.0.3 at its head (full faithfulness for connected X; normality only for the "finite monodromy" paragraph). See S04 for a residual generality point. |
| r1a F03 (P3) §1.4 Checks | repaired | `README.md:405–406`: the [2]-family on y² = x³−x; recomputed x(2Q) = (x²+1)²/(4x(x²−1)), zero at x = ±i; (1−i)² = −2i = i³−i and (1+i)² = 2i = (−i)³+i; conjugation swaps (i,±(1−i)) with (−i,±(1+i)) in two pairs; dim A_s^{G_ℚ} = 4 at 0 and 2 at (0,0), dim V_s = 8 at both. |
| r1a F04 / r1b F01 (P1/P2) modified adelic carrier unowned | repaired | `README.md:237`: "Define the modified adelic points `X(A_K)_• := ∏_{u finite} X(K_u) × ∏_{u | ∞} π₀(X(K_u))` … projection … surjective, and a K-morphism f … induces f_• with f_•(P_•) = (f(P))_•"; `README.md:9, 65, 262, 288` no longer cite §3.17d as supplier. Stoll §2 (stoll lines 131–139) defines the same carrier; HeightsRationalPointsAndObstructions §3.17d at its head (line 1824) is still torsor-only. Ownership grep for "modified adel" across main and all open heads finds only ArithmeticGaloisDuality (tori) and that §3.17d. |
| r1a F05 (P3) restating Checks | repaired | `README.md:954–956` (conic at 2: sum of squares ≡ number of odd coordinates mod 4 ∈ {1,2,3}; ℚₚ×ℚₚ has 4 idempotents versus 2 for a quadratic field; pairing separated via §6.6's nonsquare c); the §1.7 projection Check and the §4.5 diagram Check are gone; `README.md:1016` now computes (1, 2 dim A₀) and (2, 4 dim A₀); `README.md:1469` computes (3), (1+i) covered and (2±i) not. |
| r1a F06 (P3) §1.2 Checks | repaired | `README.md:351–352`: split base E⊔E over Spec(F×F) with dim(H⁰)^{G_F} = 2, dim H¹ = 4; non-split base Spec L with dim(H⁰)^{G_F} = 1, H¹ = Ind. Both recomputed. |
| r1b F02 (P3) root-degree bound with varying relative dimension | repaired, but the repair introduced S01 | `README.md:1125`: "B := `dim_{K_v} H¹_dR(X_{y₀}/K_v)` = `Σ_j 2d_j·[L_{w_j} : K_v]`, the total rank"; `README.md:1135`: "monic polynomial in ℤ[X] has degree dim V = B". The bound is correct (an eigenvalue of Frob_w on V_ψ is a power of an eigenvalue of Frob_u on V, degree ≤ B). |
| r1b F03 (P3) §2.3a is function-field | repaired | `README.md:65, 986, 1119` cite "§§2.4, 2.11"; at the head §2.3a is "Function-field models and products of local rings" (line 907), §2.4 "Restricted-product description" (923), §2.11 "Adelic points of separated finite-type schemes" (1049) with `homeomorph_pi_of_proper` and the Check "proper P¹ the full compact product". |

No repair introduced a new error except the parenthetical and witness in §7.1 recorded as S01.

## Verified sound

Counts: Suggested.lean declarations read: 0 (the file states nothing; 14 non-statable headlines named in the docstring); README targets read: 59 (Layers 0–9, every line, plus Conventions, 22 supplier contracts, Examples and Dependencies blocks); source line locators verified against the cached texts: 59 (bs: Theorems A, B, Remarks 1.3–1.5, Definitions 2.1, 2.6, 2.7, 2.13, 2.17, 3.1, 4.3, 6.1, 6.2, 6.8, 6.11, Propositions 2.16, 2.19 (proof), 3.19, 3.20, 6.7, 6.9, 6.15, 6.20, Lemmas 2.15, 6.4, 6.12, 6.13, 6.17, Corollaries 2.21, 5.10, 6.10, 6.16, 6.22, Remarks 2.18, 2.20, 5.11, 6.3, 6.6, 6.14, 6.21, 6.23, Theorem 7.1 and §7.1, and the 27 page-marker lines cited; hs: Introduction, Proposition 1.1, Corollary 1.7, Theorem 2.1 with Remarks (1)–(4); stoll: §2, the good/very-good definitions, Cov(X), Definitions 5.2, 5.4, Lemma 5.8, Proposition 5.9, Conjecture 9.1; stix08: Theorem 45, Remark 46); Checks recomputed: 48 (table below); supplier citations resolved: 22 roadmaps, 46 sections or layers, 14 of them at open heads through the roadmap service and 8 on main or Completed; pinned declarations located: 14 (`Field.absoluteGaloisGroup` line 42, `.map` 87, `ContinuousMonoidHom` 57, `ConnectedComponents` 510, `adicCompletion` 603, `LinearMap.IsAlt` 286, `LinearMap.Nondegenerate` 595, `Matrix.symplecticGroup` 101, `NumberField.IsCMField` 69, `ringOfIntegersComplexConj` 236, `IntermediateField` 52, `MulAction.orbit` 49, `Nat.forall_exists_prime_gt_and_eq_mod` 442, `hasSum_zeta_four` 457, `TauCeti.Symplectic.groupScheme` 122).

Dependency gate output:

```
depcheck: 174 roadmaps, 1192 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This roadmap is at position 208 of the merge order; its suppliers AnalyticNumberTheoryPartI (98), PadicHodgeTheory (140), HeightsRationalPointsAndObstructions (156), MordellLawrenceVenkatesh (175), AnabelianGeometryAndNonabelianChabauty (198) and CohomologyComparisons (207) precede it; the remaining suppliers are on main or Completed. The diff against origin/main touches nine files, all in `packages/GaloisSectionsPadicPeriodMaps/`. `roadmaps resolve` reports no missing citation and no missing Lean name. The seven gap slugs in `design/plan.json` (supplier and section) equal the seven contracts in the README; each supplier section was read: PadicHodgeTheory §7.5 is a relative Robba/B-pair interface without the horizontal D_pst specialisation; MordellLawrenceVenkatesh §§3.12–3.19 are "setting P" (good model), §8.13 describes the Kodaira–Parshin fibre for y ∈ Y(K) only, §1.2 is the integral-polynomial Faltings lemma, LV.7 uses five Lagrangians and threshold 8; AnalyticNumberTheoryPartI §0.32 is Siegel–Walfisz with no Linnik statement. None of the gaps is already supplied; each `needs` is a single precise sentence.

Suggested.lean: single `import Mathlib`, no `set_option`, no declaration, docstring of the required form naming each non-statable headline and its missing carrier; the `#check` elaboration comparison has no rows. No headline is statable at the pins: every one needs scheme-theoretic étale fundamental groups, section classes, ℓ-adic cohomology of abelian-by-finite families, or filtered (φ,N,G_v)-modules, none of which exists in the pinned Mathlib (`CategoryTheory.Galois` and `Field.absoluteGaloisGroup` are not scheme π₁) or Tau Ceti. No padding.

Suppliers checked against the text at their heads (not titles only): HeightsRationalPointsAndObstructions §3.5 defines `descentSet f = {x : ∃τ, ∀v, eval(x_v)=τ_v}` and `etaleSet` by restricting groups, matching Stoll Definition 5.2 and the §0.4 image statement; §2.11 has `homeomorph_pi_of_proper`; §3.1 has "the fibre splits iff eval(x)=τ_L", matching `README.md:65`. AnabelianGeometryAndNonabelianChabauty §7.1 has the four named paragraphs; "Injectivity of the section map" is stated for any field whose abelian varieties have no nonzero point divisible by every invertible n and X immersing into an abelian variety, exactly as §0.2 uses it. InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 defines `ℤ_p-Loc`, `ℤ_p-ILoc`, `ℚ_p-Loc` for every scheme with full faithfulness for connected X; §IG.1.3 exists. ArithmeticGaloisRepresentations §1.3 has Frobenius reciprocity and Shapiro, §1.12 "The Mackey decomposition" for H open and D closed in compact Γ, §2.1 decomposition groups. MordellLawrenceVenkatesh §1.5 defines friendly as unramified over ℚ and above a place of E_K⁺ inert in E_K (so §3.1(3) holds), §1.12 defines the filtration degree Σ j·(dim F^j − dim F^{j+1}), §2.1 abelian-by-finite families of constant relative dimension (S01), §3.18–3.19 density and finite intersection in setting P, §8.13 d_q = (g−1/2)(q−1) and the fibre description for y ∈ Y(K), §8.14 the equal-fibre map to H¹(Y, ℤ/(q−1)), §10.10 full monodromy, LV.7 size_v with threshold 8 on unramified sets. PadicHodgeTheory Conventions: "ℚ_p(1) has Frobenius p^(−1) and jump −1", weight h counts C(h), so the README's sign dictionary at `README.md:19, 69` is right; §5.3 D_pst over the algebraic `K₀^nr⊗E`; §§7.2, 7.3 (`DeRhamPair`, dual Tate local system, proper smooth pushforward), 7.5, 8.1, 8.2 exist. CohomologyComparisons §§6.4–6.7 exist with §6.5 "Trace-normalized Tate period". AbelianSchemesAndArithmeticModuli A3.5, A3.7, A4.3, A4.4, A6.30, A6.31; AlgebraicModuliForArithmeticGeometry §1.3; ComplexComparisonPartII C5.2, C6.0, C6.2; EtaleDualityAndPerverseSheaves §0.3 contains "Poincaré duality on a smooth curve over an algebraically closed field" (line 516 inside §0.3) and §0.5; ArithmeticGaloisDuality R02.3 (lines 1604–2874) contains the Hermite paragraph (1953); WeightsInEtaleCohomology R34.1 ("Linear algebra operations and rational integrality", "Restriction and induction along a finite extension") and R34.2 ("Purity and integral polynomials at good reduction"); ClassFieldTheory Layers 5 (Kummer class), 7 (uniformiser to arithmetic Frobenius), 11 (global reciprocity); GlobalNumberFields Layers 2, 7, 8; LocalFieldsRamification Layers 0, 1 ("Power classes, the primary statement", "The dyadic square-class count" = 8), 2, 4; LocalGaloisGroups Layer 7 "exact rank of the full absolute Galois group" with N+2 generators; ReductiveGroups Layers 0 and 3; AdicEtaleGeometry A1.1, A1.3; AdicSpacesPartII Layer R1; Chebotarev Layers 10, 13, 14 (S02).

Ownership by object across main, Completed, the board packages and all open heads (service index of 2026-10-28): "Selmer section", "Lawrence–Venkatesh locus", "finite descent locus" occur nowhere else; "modified adel" only in ArithmeticGaloisDuality (tori) and HeightsRationalPointsAndObstructions §3.17d (A-torsors); "Kodaira–Parshin" only in MordellLawrenceVenkatesh (cited); "symplectic pair" and "filtered discrete" only in unrelated senses. No sibling named in the brief declares the same carriers; Suggested.lean has no names to collide.

Sources: Harari–Stix Theorem 2.1 (hs lines 391–410) is stated for S of Dirichlet density 0 with X(k_v) ≠ ∅ for v ∉ S and gives (i) ⇔ (iii); Remark (1) identifies (i) with Stoll's survival; S = ∅ and U trivial give §0.5(a) with all places, as the README says. Stoll's good/very good use the closure of X(k) (stoll line 65 names the overline that the extraction drops at lines 82–83), matching `README.md:237, 252`. Betts–Stix Definition 6.1 (bs 2234–2243) is the §1.7 adelic locus with every place; Definition 6.2, Remark 6.3, Lemma 6.4, Proposition 6.7 (with dim A in (c), corrected to #Σ here), Definition 6.11 (d_i per component), Proposition 6.20's two conditions, Remark 6.21 (n_v = 7), Remark 6.23 (1°)–(4°), (1)–(3), (I)–(III) and Remark 1.4 (23 versus 11 for genus 3 over ℚ) all read as the README states them. The reciprocity convention χ_cyc∘Art = inverse norm is bs lines 663–666.

Policy: no pull-request numbers, process words or machine paths in the README or docstring; "lemma" occurs only in prose names (Schur's lemma, Faltings' lemma, orbit lemma); every target carries a locator; no `set_option`; no algorithms. Every definition has at least three Checks (§0.1: 4, §0.3: 5, §0.4: 5, §1.1: 7, §1.2: 4, §1.3: 5, §1.4: 4, §1.7: 4, §2.1: 8, §2.2: 6, §3.1: 6, §5.1: 3, §5.2: 4, §6.1: 9, §6.2: 4, §6.3: 6, §6.6: 5, §6.9: 9, §7.1: 6, §8.1: 6, §8.2: 3).

### Adversarial pass

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: χ_cyc(Art(u)) = N(u)⁻¹ | ℚ₃, u = 4 | 1/4 versus inverse character 4; bs 663–666 says inverse norm | pass |
| Conventions: ℚₚ(−1) | geometric Frobenius | eigenvalue q, weight 2, jump 1; ℚₚ(1): C_p(r)⊗ℚₚ(1) = C_p(r+1), invariants at r = −1 | pass; PHT jump −1 agrees |
| Conventions: inverse transport | T = [[1,0],[a,1]], F¹ = ⟨e₁⟩ | T⁻¹e₁ = e₁ − ae₂, point (1:−a); push-forward (1:a) | pass |
| Conventions: Nφ = pφN | φ(e)=e, φ(f)=pf, N(f)=e | Nφ(f) = pe = pφN(f); reversed p²e | pass |
| Conventions: induction lax | index 2 | 2·2 = 4 versus 2 | pass |
| §0.1 real G_m model | Ẑ(1)⋊C₂, c inverting | (b,1)(a,c)(−b,1) = (a+2b,c); b = −2 sends (2,c) to (−2,c); both square to (0,1) | pass |
| §0.1 Spec K, complex place | G_u trivial | one-point section sets both sides | pass |
| §0.2 injectivity | E/ℚₚ profinite point group; E(ℝ)⁰ divisible | ∩ nE(ℚₚ) = 0 (ℤₚ^m × finite); ∩ nE(ℝ)⁰ = E(ℝ)⁰ | pass; ℝ excluded as stated |
| §0.3 Selmer at a real place | Y(ℝ) = ∅ | Sec^Sel = ∅ although finite places may have points | pass |
| §0.4 carrier | P¹, Spec K, E/ℚ with two real components | real factor sizes 1, 1, 2 | pass |
| §0.4 image of X(A_K)^{ét} | lift P of P_• surviving per torsor | survival constant on archimedean components, so one lift survives all | equality holds |
| §0.4 very good | genus ≥ 2 | closure of finite Y(K) = Y(K) | pass with Stoll's closure definition |
| §0.5(a) | S = ∅, U trivial | hs (i) ⇔ (iii), Remark (1) = Stoll survival | pass |
| §0.5(b) | c Selmer; P ∈ f-cov | loc_v(c) = P_v by local injectivity; converse by choosing archimedean points | pass |
| §1.1 rank 0 | (A, 0), L = A | Hom(0, A) = 0 ≅ 0 | pass |
| §1.1 non-split | A = ℚ_{p²} | #Σ = 0, dim 2; A = ℚₚ[ε]/ε²: #Σ = 1, dim 2 | pass |
| §1.2 fibre algebra | closed points of degrees 1, 2 | H⁰ = ℚₚ³, orbits 1 and 2 | pass |
| §1.2 split/non-split base | F×F; L/F quadratic | invariants 2 versus 1, dim H¹ 4 both | pass |
| §1.3 pairing target | A of dimension d | H²(ℚₚ)·H^{2d−2}(ℚₚ(d−1)) → ℚₚ(d−1−d) = ℚₚ(−1) | pass |
| §1.3 base hypotheses | non-Noetherian connected base | supplier π₁ needs locally Noetherian | S04 |
| §1.4 [2]-family | sections at 0 and (0,0) | dim A^G 4 versus 2; dim V 8 both | pass |
| §1.5 restriction | res_u(c) = κ(y_u) | ρ∘s conjugate to ρ∘s_{y_u} by ρ(γ) | pass |
| §1.7 adelic locus | bs Def 6.1 | every place u, one global pair | pass |
| §2.1 Hom computations | V = W = ℚₚ; V = ℚₚ, W = ℚₚ(1) | φ(λ) = λ gives ℚₚ; σ(λ) = pλ impossible since v(σλ) = v(λ) | pass |
| §2.1 (Ind 1)|G_w | L_w/K_v Galois degree r | 1^{⊕r}, L_w⊗L_w = L_w^r | pass |
| §2.2 ordinary elliptic D | φ = Frob⊗diag(α,β), α ≠ β | End = ℚₚ×ℚₚ, Aut = G_m², multiplier ab determined; 2 ≤ 4 | pass |
| §2.2 similitudes | diag(2,3); scalar 2 | 6; 4 | pass |
| §2.3 orbits on P¹ | G_m² on P¹(ℚₚ) | [1:0], [0:1], {xy ≠ 0} transitive via (x⁻¹, y⁻¹) | three classes; pass |
| §2.4 bounds | d = 1 symplectic | d(2d+1)+1 = 4 = dim GSp₂ | pass |
| §2.4 injectivity | Σλ_iψ_i = 0 | Frobenius conjugation, trace form nondegenerate on ℚ_{p^f} | pass |
| §3.1 ℚ(i) | 3, 5, 2 | (3) fixed; (2±i) exchanged; (1+i) fixed, ramified, not friendly | pass; MLV §1.5 agrees |
| §3.2 identity | ℚₚ(−1); finite order | 1+1 = 2; 0+0 = 0 | pass |
| §3.3 global part | K = ℚ(i), p inert; p split | ℚₚ-valued at an inert place forces type (n/2, n/2), globally norm-multiple; split places not self-conjugate | pass; CM restriction needed only in the global clause |
| §3.4 weighted sum | A/K dimension g; L/K quadratic, one place of degree 2 | g = g; 2g = 2g | pass |
| §4.1 covers | z² = t over ℚ₃ at t = 1, 2 | ±1 ∈ ℚ₃; √2 ∉ ℚ₃, unramified | pass |
| §4.2 residues | 𝔽₂; 𝔽₄, 𝔽₈ | no third residue; third residues exist; gcd(2,3) = 1 generates G_v | pass |
| §4.5 period point | y = y₀ | Hodge filtration; M(Φ(y₀)) = H_pH | pass |
| §5.1 jumps | elliptic fibre | 0, 1; target 1; ω(F¹,F¹) ⊂ F² = 0 | pass |
| §5.4 dimension | degrees 1 and 2, d = 1 | 1 + 2 = 3 | pass |
| §6.1 negative controls | ℚₚ⊕ℚₚ(−1); H¹(E)(1); ε-algebra with ζ₃ over ℚ₇ | weights 0, 2; jumps −1, 0; trace 1+ζ₃ ∉ ℚ | pass |
| §6.2 conic at 2 | primitive triple | sum of squares ≡ #odd ∈ {1,2,3} mod 4 | empty locus; pass |
| §6.4 S-goodness | u ∉ S, residue degree f orbit | eigenvalues f-th roots of q_u^f-Weil numbers of weight 1 | pass |
| §6.6 nonsquare c | ω₁⊕ω₂ versus ω₁⊕cω₂ | b = a₁² = ca₂² impossible | pass |
| §6.6 numerics | g = 3 | d₂₃ = 55, d₁₁ = 25; bs Remark 1.4 attributes 23 → 11 to the symplectic formulation | pass |
| §6.8 inequality | m ≤ d, orbit Σ₀ | m#Σ₀/2 ≤ m#Σ₀_{<4} + (m−1)(#Σ₀−#Σ₀_{<4})/2 ⇒ (m+1)#Σ₀_{<4} ≥ #Σ₀ | pass with #Σ |
| §6.9 ordinary line | ordinary E at w | sub line weight 0, quotient weight 1; weight-1 stable line iff split | pass |
| §7.1 bound B | d constant, δ = 2; δ = 1 | B = 4d; B = 2d | pass; varying-d witness S01 |
| §7.2 Check family | λ ∈ Hom(G_{K,S}, ℚₚ) | H¹_g(G_v, ℚₚ) = unramified line; everywhere-unramified λ = 0 | S03 |
| §7.3 dimensions | (d,r) = (1,4), (1,3), (2,4) | 3 < 4; 3 = 3; 10 < 12 | pass |
| §7.4 constant family over degree-4 L | non-CM E | index 4, ranks (4,8), fibre GSp-irreducible | pass |
| §7.6 four lines | ⟨e⟩,⟨f⟩,⟨e+f⟩,⟨e+2f⟩ | pairwise intersections 0, no common line | pass |
| §7.7 CM at 5 | y² = x³−x over 𝔽₅ | points 1+1+1+2+2+1 = 8, a₅ = −2 unit; i ∈ ℚ₅ splits V₅ | pass |
| §8.1 monotonicity | 4 fixed ⊔ C₄-orbit → 1 fixed ⊔ orbit | 1/2 > 1/5 with fibres 4,1,1,1,1 | equal fibres needed; pass |
| §8.2 counts | ℚ₅; ℚ₇; ℚ₂ | 3+1+3 = 7 (units are cubes); 3+4 = 7 (Kummer, (9−1)/2); 7+4 = 11 | pass |
| §8.2 bound | t = N+2 | 2^t + 6^t ≥ n_v; t = 3 gives 224 ≥ 11 | pass given LocalGaloisGroups Layer 7 |
| §8.3 isotropy | g = 2, k = 5, q_v = 7 | gcd(5, 6·48·342) = 1; 7·25 = 175 of 625 | pass |
| §8.4 chain | g ≥ 2, 2k ≥ 9n_v | ζ(2g) ≤ ζ(4) ≈ 1.0823 < 9/8; proportion < 1/(4k^{g−1}) ≤ 1/((2g−1)k+1) for k > 1; k = 1 excluded since n_v ≥ 1 | pass |
| §8.5 parameter | q_v = 2 | odd primes of 42: 3, 7; q = 11 passes (1); (2) needs q−1 ≥ 99, q = 107 works | pass |
| §8.6 (III) | g = 3 over ℚ; over ℚ(√5, ζ₁₁+ζ₁₁⁻¹) | computed in the round-1 table above | pass |
| §8.6 (I) density | r₀ → ∞ | exponent O(r₀/log r₀)·18/r₀ → 0; needs natural density | S02 |
| §9.1–9.5 assembly | empty local curve | all cardinalities 0 | pass |

## Not verifiable

- The published Annals version of Betts–Stix was not read; all locators were checked on arXiv v1 as the manifest records.
- LocalGaloisGroups Layer 7's exact generator rank N+2 for the full absolute Galois group is a claim of that completed roadmap; the README consumes it for the explicit bound 2^t + 6^t and I did not re-derive it. The roadmap only needs some bound in [K_v:ℚₚ].
- The `#check` elaboration step does not apply: Suggested.lean contains no declaration; no Lean was run.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmap service's grep over their heads, not by reading them.

## Source issues

- **Error** in bs at Proposition 6.7(c) and the reduction in its proof, printed pages 46–47: the source says the number of coefficient points in small G_v-orbits is at least dim(A)/(d+1) and that the orbit reduction gives this because #Σ ≤ dim A; it should be #Σ_A/(d+1), since #Σ ≤ dim A gives the inequality in the wrong direction for non-split A (A = ℚₚ[ε]/ε³, trivial action, d = 1: 1 < 3/2); affects a stated result (every application has A split).
- **Misprint** in stix08 at Remark 46, printed page 22: the source says the assumptions of Theorem B hold for number fields and local fields; it should say Theorem 45; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5d9cc0a689cb3e24a28a353642397f80875ebeb2", "job": "RT-GaloisSectionsPadicPeriodMaps~2b", "model": "fable", "worker": "chris-x8"} -->
