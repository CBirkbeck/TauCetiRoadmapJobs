<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13140#issuecomment-6856823826 -->
Review (claude) of 2a2f6c4

Verdict: needs_changes

1. **F01** (P2) The correspondence 2-category and the relative trace formula have a second, unacknowledged plan in an open later roadmap

   **Location.** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:26` (Scope and ownership), "Outside this roadmap: the computation of local terms of Satake sheaves on affine Grassmannians and the Kottwitz conjecture (Hansen–Kaletha–Weinstein §§5–6), which consume this roadmap", and `README.md:2051`–`2053` (Downstream consumers).

   **Claim.** The roadmap owns CoCorr_S (VS8.7), the trace class (VS8.10), the relative Lefschetz–Verdier formula (VS9.1) and base change of local terms (VS9.6), and names its consumers only by subject.

   **Witness.** Open pull request #1090, `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:2456` (§7.9b): it plans to construct the dualizable cohomological-correspondence category with trace maps and to prove the relative Lefschetz–Verdier identity, sourced to HKW pp. 32–33, citing only VStackSheavesAndLisseCategories VS0.2.

   That roadmap is later in the merge order (line 187; this roadmap is line 129), so this roadmap is the owner and the other is the citing side. Neither text names the other, so the same theorem (HKW22 Theorem 4.3.8, HKW22 line 1572) has two plans. `roadmaps grep` for "decent v-stack", "CoCorr_S", "BCoCorr", "prespatial", "universal local term" and "Haar(G" finds no other owner on main or at any open head.

   **Exact repair.** In this package, state the boundary so that there is one owner:

   1. Append to the "Outside this roadmap" paragraph of *Scope and ownership*: "The elliptic local trace of *Igusa varieties and torsion concentration* (`IgusaVarietiesAndTorsionConcentration` §7.9b) consumes this roadmap: for coefficient rings killed by an integer prime to p, the category of cohomological correspondences, its trace maps and the relative Lefschetz–Verdier identity used there for the local Shimura Hecke correspondence are CoCorr_S (VS8.7), the trace class (VS8.10) and VS9.1, and its base change of local terms is VS9.6. The descent to rational coefficients, the identification of the fixed loci by elliptic elements and the computation of the local terms stay in that roadmap."
   2. Add to *Downstream consumers* the bullet: "The elliptic local trace of `IgusaVarietiesAndTorsionConcentration` §7.9b uses, for torsion coefficients, CoCorr_S (VS8.7), the trace class (VS8.10), the relative Lefschetz–Verdier formula (VS9.1) and the local terms of VS9.4–VS9.6."

   No `*Needs:*` line and no supplier contract changes: the other roadmap is a consumer, never a supplier. Tested: the dependency check run on a scratch copy of the README with the bullet added still prints `depcheck: 223 roadmaps, 1980 edges, 0 problem(s)`. The matching citation in §7.9b of the other roadmap (its `*Needs:*` line gaining VS8.7, VS8.10, VS9.1, VS9.6 of this roadmap) is that pull request's edit, not this package's; it is recorded here for the maintainer.

2. **F02** (P3) The morphisms of BCoCorr_S are written with a fibre product that does not exist

   **Location.** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1847` (VS11.7), "q♮ = (p, q, p′) a morphism of correspondences C → X ×_U X′ over U → T ×_S T′".

   **Claim.** A morphism of BCoCorr_S has an underlying correspondence C → X ×_U X′.

   **Witness.** X maps to T and X′ to T′; neither maps to U. For the coevaluation of VS11.7 itself, U = T, X′ = X ×_S X over T ×_S T: no map X′ → U exists, so X ×_U X′ is undefined.

   The expression is taken over from HKW22 line 1884; the diagram (4.5.3) at HKW22 lines 1850–1860 shows what is meant. The same sentence uses c, c′, u without naming them.

   **Exact repair.** Replace the clause by: "morphisms (q♮, α, β), where q♮ = (p, q, p′) is a morphism of correspondences: a correspondence (c, c′) : C → X ×_S X′ and a correspondence (u, u′) : U → T ×_S T′ with a map q : C → U such that the squares p ∘ c ≅ u ∘ q and p′ ∘ c′ ≅ u′ ∘ q are 2-commutative (diagram (4.5.3)), with u′ : U → T′ cohomologically smooth; α : c^*A → c′^!A′; and β : u^*B ≅ u′^!B′ an isomorphism". Add to *Corrections to the sources* an entry for Hansen–Kaletha–Weinstein, Definition 4.5.4, p. 39 (misprint): X ×_U X′ and X ×_V X′ stand for X ×_S X′ with the correspondence lying over U, respectively V. Tested on the witness: C = X, (c, c′) = (id, Δ_(X/S)) : X → X ×_S (X ×_S X), U = T, q = p : X → T; both squares commute.

3. **F03** (P3) The unique-lift statement of VS8.3 does not name its square

   **Location.** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:872` (VS8.3), "For a 2-morphism p from c to a square g ∘ c ⇒ c′ ∘ f and (c, u) above c, there is a unique (c′, u′) above c′".

   **Claim.** The statement of Lu–Zheng Lemma 1.11.

   **Witness.** f, g and c′ are not introduced, and "from c to a square" does not parse. LZ22 lines 397–407 fix f : X → X′, g : Y → Y′, c′ : X′ → Y′, and the lifted morphism runs (X′, F(f)L) → (Y′, F(g)M).

   **Exact repair.** Replace the sentence by: "Let f : X → X′, g : Y → Y′, c : X → Y and c′ : X′ → Y′ be morphisms of B and p : g ∘ c ⇒ c′ ∘ f a 2-morphism. For every morphism (c, u) : (X, L) → (Y, M) above c there is a unique morphism (c′, u′) : (X′, F(f)L) → (Y′, F(g)M) above c′ such that p is a 2-morphism g♮ ∘ (c, u) ⇒ (c′, u′) ∘ f♮ in C_F, where f♮ = (f, id) and g♮ = (g, id)." Tested on B = Corr_S, f = q♮, g = q♮, p the proper map of VS9.1: source (X′, Rq_∗A), target (X′, Rq_∗A), as VS9.1 uses it.

4. **F04** (P3) `Suggested.lean` locates pretilts in the wrong Mathlib directory

   **Location.** `packages/VStackSheavesAndLisseCategoriesPartII/Suggested.lean:13`–`14`, "Mathlib has pretilts, the untilt map and Fontaine's θ (`Mathlib/RingTheory/Perfectoid/`)".

   **Claim.** The three objects are in `Mathlib/RingTheory/Perfectoid/`.

   **Witness.** At the pin, `PreTilt` is `Mathlib/RingTheory/Perfection.lean:623`. The directory `Mathlib/RingTheory/Perfectoid/` holds `Untilt.lean` (`untilt`, line 49), `FontaineTheta.lean` (`fontaineTheta`, line 166) and `BDeRham.lean` only.

   **Exact repair.** Write: "Mathlib has pretilts (`Mathlib/RingTheory/Perfection.lean`), the untilt map and Fontaine's θ (`Mathlib/RingTheory/Perfectoid/`)". The rest of the docstring is correct at the pins (below).

Four findings: one P2 (an ownership overlap with an open, later roadmap that the package does not state) and three P3 (an ill-typed fibre product taken over from the source, an unnamed square, and a file locator in the Lean docstring). The three repairs of the preceding round are all repaired, and the mathematics they introduced was recomputed and holds. No package file was changed by this review.

## Verified sound

### Previous findings, checked first

The preceding review had F01–F03; the repair report marks all three applied and none "not actionable". Each was read at the current head.

| Finding | Repaired passage | Status and recomputation |
|---|---|---|
| F01: invertible objects described as single shifts | Conventions, line 32: "An object I ∈ D_ét(X, Λ) is invertible if it is ⊗-invertible: there is J ∈ D_ét(X, Λ) with I ⊗ J ≅ Λ_X"; VS7.10, line 755: "I ∈ D_ét(X, Λ) is ⊗-invertible (Conventions)" | **Repaired.** Λ = F₃ × F₃: (e₁Λ ⊕ e₂Λ[1]) ⊗ (e₁Λ ⊕ e₂Λ[−1]) = e₁Λ ⊕ 0 ⊕ 0 ⊕ e₂Λ = Λ; H⁰ and H⁻¹ of I are both F₃. The supplier's notion resolves: DiamondSixOperations §S4.2 defines invertible as étale locally Λ[n] on any small v-stack and says the converse is not part of the definition. |
| F02: based dualizability without smooth diagonal | VS11.7, line 1858: "If the diagonal Δ_(T/S) is cohomologically smooth and 𝔖(𝔛), 𝔅(𝔛) are dualizable in CoCorr_S, then 𝔛 is dualizable" | **Repaired.** HKW22 lines 1961–1966 assume π and Δ smooth. The dual base is forced: β for the coevaluation needs Λ_T ≅ K_Δ ⊗ B ⊗ B′, so B′ = K_Δ⁻¹ ⊗ B⁻¹ = K_(T/S) ⊗ B⁻¹. For P¹: Δ^!Λ = Λ(−1)[−2] from Δ^!pr₁^!Λ = Λ, against Λ after self base change. |
| F03: torsor map not equivariant | VS11.12, line 1986: "the torsor automorphism (x, g, h) ↦ (x, xg, h), with inverse (x, g, h) ↦ (x, x⁻¹g, h)" | **Repaired.** In S₃, right to left, x = (12), a = (123): xa = (23) on both sides of the equivariance square; the unconverted formula gives ax = (13) against (23). HKW22 line 1707 has left torsors, f(gy) = g f(y) g⁻¹, so its formula at line 2081 is right for its convention. |

The repaired patterns were searched in the rest of the package. Every use of "invertible" (VS6.2, VS7.4, VS7.8, VS7.9, VS7.11, VS11.5–VS11.7) is correct for ⊗-invertible objects, and VS7.8 (2)/(3) name the stronger notion explicitly, as GHW22 lines 1597–1600 need. VS11.9 step 1 and VS11.12 step 1 now invoke VS11.7 with the smooth diagonal; for T = [S/G] the diagonal has fibre (G × G)/G ≅ G over the chart S → [S/G]², smooth under VS11.10's hypothesis. Right-torsor conventions agree in VS6.9, VS11.2, VS11.10 and VS11.12 (table below). The one new slip the repairs exposed is R02, in the same subsection.

### Principles and shape

All 65 numbered subsections were read in full, with their API lists, Checks, proof sketches and `*Needs:*` lines. No route-specific shortcut, re-planned roadmap, algorithm, sorry'd data, `set_option` or extra import was found. A residue search (process words, pull-request numbers, dates, machine paths, HTML anchors, LaTeX delimiters, `lemma` as a keyword, "optional", "deferred") found nothing in the README or the Lean file; "lemma" occurs only in citations and in "snake lemma", "Yoneda lemma". The six layers end with *Examples* and *Dependencies*; every definition block has at least three Checks; every theorem has a locator. The former-numbering table is an allowed mapping. Shape was compared with `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` and `TauCetiRoadmap/DGAInfinity/README.md` on main.

No backticked identifier in the README is presented as this roadmap's own: the backticked names are Mathlib or Tau Ceti declarations, supplier declarations (`HaarMeasureWithValues`, `CohCorr.pullbackAlong`, `CohCorr.restrictOpen`, `perfection_universalHomeomorphism`) or roadmap names.

### Seeded source sample

No locator is flagged unverified by the author. All fifteen seeded targets were opened in the cached texts.

| Target | Text and locator | Outcome |
|---|---|---|
| 6.2 Decent v-stacks | GHW22 lines 67–83, Definition 1.1 and Remark 1.2, p. 2 | Both conditions, charts and clean charts agree; the fibre-product remark is Remark 1.2(i). |
| 6.3 Decent ⇒ Artin | GHW22 lines 1001–1010, Proposition 4.4, p. 20 | Statement and the two proof steps (FS21 Remark IV.1.4(ii), Proposition 4.3(i)) agree. |
| 6.4 Fibre products | GHW22 lines 1011–1026, Proposition 4.5, pp. 20–21 | Charts by two base changes, diagonal by cancellation: agree. |
| 7.3 Weakly compactifiable | GHW22 lines 788–832, Definition 3.11, Lemma 3.12, Scholium 3.13, p. 16 | Definitions, (i)–(v), the factorisation and Rf_! = h_! Rp_* j_! agree; the README correctly says (i)–(iv) are left to the reader and that the Scholium's full claim is not a target. |
| 7.4 Enhanced operations | GHW22 lines 837–851, Theorem 3.14, Proposition 3.15, pp. 17–18; lines 928–945, Proposition 3.16, p. 19 | Values, ∗- and !-directions, ⊗-descent for all surjections, !-codescent with the three hypotheses: agree. |
| 7.10 Twisting | HKW22 lines 1187–1191, Lemma 4.1.10, p. 24; line 1122, p. 23 | The lemma and its inverse-map proof use only I⁻¹; the p. 23 description is recorded as a correction. |
| 8.2 Functoriality of traces | LZ22 lines 225–353, Constructions 1.7–1.8, Remark 1.9, pp. 5–7 | Right-adjointable case, split case and preservation by symmetric monoidal functors agree. |
| 8.3 Grothendieck construction | LZ22 lines 364–440, Construction 1.10, Lemma 1.11, Remark 1.12, pp. 7–9; Constructions 1.13–1.16, pp. 9–10 | Objects, morphisms, 2-morphisms, tensor, the formula for u′ and the hypotheses of Remark 1.12(b) agree; the wording of the square is R03. |
| 8.5 Reflexivity | HKW22 lines 3512–3548, Lemmas B.1.1 and B.1.2(1), pp. 72–73 | Λ = R/𝔪^k, k > 0; the m-for-k misprint (lines 3534, 3543) is recorded. |
| 8.12 Open restriction | HKW22 lines 1567–1571, Lemma 4.3.7, p. 32 | Agrees. |
| 9.2 Proper pushforward of cc | HKW22 lines 1615–1617, Corollary 4.3.9, p. 33; LZ22 line 933, Corollary 2.22, p. 19 | Agrees, with "proper" made "cohomologically proper". |
| 9.7 Diamondification | HKW22 lines 2374–2395, §5.3, p. 49 | The functor on Spec R, finite limits, representability, c_X^*, the two comparison maps and u^♢ agree. |
| 10.2 Sheaves as smooth modules | HKW22 lines 3598–3622, Lemmas B.2.4–B.2.5, p. 74 | Agrees. |
| 10.9 Structure map of BG | HKW22 lines 1294–1305, Example 4.2.4, p. 27 | Four functors, K = Haar(G, Λ)^∗ and the proof through f ∘ q = id agree. |
| 11.7 Based correspondences | HKW22 lines 1845–1960, (4.5.3) on p. 38, Definition 4.5.4 on p. 39, (4.5.7) on p. 40; lines 1961–1966, p. 40 | Objects, β, fibre product and (4.5.7) agree; "pp. 38–40" is right; the fibre product X ×_U X′ is R02. |

Further locators opened: FS21 Theorem IV.2.23 (line 4801, p. 124), Proposition IV.2.24 (p. 125), Propositions IV.2.32–IV.2.33 (p. 129), Theorem V.1.1 (p. 168), Corollary V.1.4 (p. 170), Theorem V.7.1 (p. 183); Sch17 Definition 23.8 (line 6035, p. 144); GHW22 Proposition 4.14 (lines 1594–1619, p. 31), the p. 3 list of examples (lines 90–98); HKW22 §4.4 (lines 1700–1711), §4.6 (lines 2000–2130, pp. 41–43), Proposition 5.3.1–5.3.2 (lines 2360–2404, pp. 49–50). All eight cited works have manifest entries, all `certified`; none was fetched or added.

### Adversarial computations

Permutations are composed right to left; Hⁱ(M[n]) = Hⁱ⁺ⁿ(M).

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Conventions: invertible = ⊗-invertible | Λ = F₃ × F₃ at a point; a connected Λ with non-trivial Picard group and L a non-free invertible module | First: I ⊗ J = Λ, two nonzero degrees. Second: the constant sheaf L is ⊗-invertible with stalk L ≇ Λ, so it is not étale locally Λ[n]. | The README claims only that the converse fails for disconnected Spec Λ, which holds; it does not claim the converse for connected Λ. No change. |
| VS7.10 twist | P¹ → Spd C with I above; q : S → [S/Z_p] with I = C(Z_p, Λ) | Both sides e₁Λ(1)[2] ⊕ e₂Λ(1)[3], degrees −2 and −3. Rq^!M = lim_K M^K along normalised averaging: Λ for M = Λ, Dist(Z_p, Λ) for M = C(Z_p, Λ); the map C(Z_p, Λ) → Dist misses δ₀. | Holds for ⊗-invertible I, fails without it. |
| VS7.8 (2)/(3) | Δ : P¹ → P¹ × P¹; q : S → [S/Z_p] | K_Δ = Λ(−1)[−2], H⁰ = 0, against Λ after self base change. Rq^!Λ ≅ Λ but the twist map is not onto. | Invertibility alone is not smoothness. |
| VS11.7 objects and morphisms | Coevaluation of 𝔛: U = T, X′ = X ×_S X | X′ maps to T ×_S T, not to U = T: X ×_U X′ undefined; X ×_S X′ = X ×_S X ×_S X is defined and (id, Δ) lies over (π, Δ_(T/S)). | R02. |
| VS11.7 dualizability | T = S; T = P¹ over Spd C, Λ = F₃ | T = S: K_Δ = K = Λ, dual base B⁻¹. P¹: Δ not smooth; an equivalence of Corr_S has both legs invertible, so any coevaluation base has right leg Δ up to isomorphism. | Hypothesis necessary and sufficient on both instances. |
| VS11.12 α₀ | G = S₃, x = (12), a = (123) | xa = (23); ax = (13); F(t·(a,1)) = (x, xa, 1) = F(t)·(a,1). Inertia coordinate φ(y) = y⁻¹xy, φ(1) = x. | Equivariant; middle map sends x to its class. |
| VS6.9 labels | h = (123), f₂(t) = (12) | f₁(t) = h(12)h⁻¹ = (23); h⁻¹f₁(t) = (13) = f₂(t)h⁻¹; (12)(123) = (23), (123)(12) = (13). | Left action, labels multiply as stated. |
| VS11.2 inertia | c = (12), y = (123) | y⁻¹cy = (13); ycy⁻¹ = (23). | Right-torsor convention consistent with VS6.9 and VS11.12. |
| Conventions: Haar character | Affine group over ℚ_p, g = diag(p, 1) | μ(Eg) = \|p\|·\|p\|⁻²·μ(E) = pμ(E); gKg⁻¹ = (1 + pZ_p) ⋉ pZ_p of index p in K, so δ_G(g) = p⁻¹. | χ_G = δ_G⁻¹ on the witness. |
| VS6.2–VS6.4 | B(C₂) over a geometric point; empty base | Chart S → B(C₂) has 2 sheets; S ×_(B(C₂)) S = C₂ × S, two points, a locally spatial diamond; over ∅ everything is ∅. | Decent and Artin; not representable only when S ≠ ∅. |
| VS7.3 | Identity; a proper strongly compactifiable map | j = p = h = id gives Rf_! = id; for proper f, j = id and Rf_! = Rf_*. | Agrees with Lemma 3.12(iii)–(iv). |
| VS7.5 (headline) and VS10.9 | f : B(C₃) → S, p = 2, Λ = F₃ | Hom_G(M, Haar^∗ ⊗ N) = Hom((M ⊗ Haar)_G, N); H⁻¹(Rf_!Λ) = H₁(C₃, F₃) = F₃, H⁻¹(Rf_*Λ) = 0, H¹(Rf_*Λ) = F₃. | Stacky Rf_! is not Rf_*; fine but not proper. |
| VS8.2, VS8.3 | Lemma 1.11 with B = Corr_S | u′ = F(c′)F(f)L ≅ F(c′f)L → F(gc)L ≅ F(g)F(c)L → F(g)M: source (X′, F(f)L), target (Y′, F(g)M). | Mathematics right; wording R03. |
| VS8.4 | Λ = Z/6, P = 3Λ; Λ ⊕ Λ[1] | 3² = 9 = 3; \|P\| = 2, not free; projective trace 3; supertrace 1 − 1 = 0. | Projective trace needed. |
| VS8.5 | Z/9 with M = Z/3; F_ℓ^(ℕ) | Hom(Z/3, Z/9) = 3Z/9 of order 3, double dual of order 3; the dual of a countable-dimensional space has uncountable dimension. | Both directions of the iff discriminate. |
| VS8.6 | q♮ = (id, q) | Unit X → X ×_(X′) X is the diagonal, counit X → X′ is q; both cohomologically proper. | Adjunction typed correctly. |
| VS8.9 (headline) | A = Λ² at a point; A free of infinite rank | dim(A^∗ ⊗ A) = 4 = dim End(A); infinite rank: the left side is the finite-rank operators and misses id. | Dualizable iff perfect. |
| VS9.1 (headline) | X = S a point, C = S ⊔ S the fold, u = (1, 2), Λ = F₅ | Class (1, 2), integral 3; pushed endomorphism is multiplication by 1 + 2 = 3. | Equal. |
| VS9.2 (headline) | Two points to a point, A = Λ | Pushforward of (1, 1) is 2 = cc(Λ²). | Equal. |
| VS9.2 step 2 | p : X → X′ proper | In_S(X) → X ×_(X′) In_S(X′) is the base change of Δ_p along (x, h) ↦ (x, x, h). | Closed immersion, as stated. |
| VS9.3 | P¹, z ↦ az, a ≠ 1; closed disc, T ↦ T + p | Local terms 1 + 1 = 2 = trace on H⁰ ⊕ H². Disc: p ≠ 0 needs characteristic 0, no fixed point, trace 1. | Properness needed; the Check states characteristic 0. |
| VS10.2 | T = {a, b}; T = ℕ | Dimensions 2, 1 and 3 = 2 + 1; Λ^(ℕ) against Λ^ℕ. | The two realisations differ. |
| VS10.5 | G = Z_p, Λ = F_p | μ(Z_p) = p·μ(pZ_p) = 0, so Haar = 0. | Invertibility hypothesis needed. |
| VS11.4 (headline) | C₂, sign representation, Λ = F₃ | Values (1, −1) against (1, 1) for the trivial one. | Character, not dimension. |
| VS11.9 (headline) | T = S a point, ranks 2 and 3, Λ = F₅ | 2·3 = 6 = 1 = cc(A₁ ⊗ A₂). | Equal. |
| VS11.12 (headline) | G = S₃ acting trivially on a point | Middle map (12) ↦ class of transpositions; without α₀, the class of 1. | Holds with the converted formula. |
| VS8.12 | X = [S/(Z/2)] | \|X\| is one point; the inertia has two components. | The Check is right: an open of the inertia is not the inertia of an open. |

### Pinned libraries, elaboration and headlines

`lake env lean` on the package's `Suggested.lean`, run from the content checkout (main at 45f58dbe): exit 0, no output, **no warnings** (the file has no `sorry`, since it declares nothing). It has the single import `import Mathlib`, no `TauCeti.*` import, no `set_option`. A scratch file with `#check @name` for the 23 Mathlib names of the README and `TauCeti.IsSmoothDiscrete` elaborated every `#check`.

| Pinned file and line | Checked |
|---|---|
| `Mathlib/LinearAlgebra/Dual/Defs.lean:203`; `Mathlib/LinearAlgebra/Dual/Lemmas.lean:262`, `:284` | `Module.IsReflexive`; the finite-projective instance (auto-named `Module.instIsReflexiveOfFiniteOfProjective`); `Module.instFiniteDimensionalOfIsReflexive` over a field only. No instance covers R/𝔪^k. |
| `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:265` | `RightRigidCategory (FGModuleCat K)`, noncomputable. |
| `Mathlib/RingTheory/Perfection.lean:623`; `Mathlib/RingTheory/Perfectoid/Untilt.lean:49`; `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166` | `PreTilt`, `untilt`, `fontaineTheta` (R04). |
| `TauCeti/RingTheory/Perfectoid/Basic.lean:86`, `TauCeti/RingTheory/Perfectoid/Field.lean:68`; `TauCeti/AlgebraicGeometry/AdicSpace/` | `IsPerfectoidTateRing`, `IsPerfectoidField`; pre-adic and adic spaces. A search of both libraries finds no perfectoid space, v-topology, diamond, small v-stack, étale sheaf on such, or monoidal bicategory. |

Headline theorems from the Summary: VS7.5, VS8.9, VS9.1, VS9.2, VS11.4, VS11.9, VS11.12. None is statable at the pins, for the carriers just listed; each is named in the module docstring with what it lacks, together with VS9.3, VS9.6 and VS9.8. The file has zero named declarations, so the one-tactic padding probe and the `#check @name` binder comparison each have zero inputs: no padding, no stand-in, nothing changed. Remark, no change asked: VS8.5 (reflexive iff finitely generated over R/𝔪^k) and VS10.1–VS10.3 could be stated in Mathlib alone, but they are auxiliary results, not headlines, and the README keeps them as targets.

`scratch/library-matches.md` and `scratch/signatures.md` have no entries, as there is no declaration.

### Suppliers, gaps and order

Every cross-roadmap citation was resolved again at the supplier's current text (main, or the open head through `roadmaps show`): VStackSheavesAndLisseCategories §§VS0.1, VS0.2 (with the Check on `[*/H]` for H = ℤ_p and the API identity for the stacky left adjoint), VS1.1, VS1.2, VS4.2, VS5.2 and the seven named slugs and two sub-targets; DiamondSixOperations §§S0.1, S0.2, S0.4, S1.1–S1.5, S2.3, S2.4, S3.1–S3.4, S4.1–S4.5, S5.4, S5.5 (§S4.5 smooth base change is for arbitrary f, as VS7.7 step 4 uses it); DiamondsAndVStacks §§D4.1, D4.6, D4.7, D4.10, D5.1, D5.2, D5.5, D5.11, D5.12, D5.14, D6.4, D6.5 with their thirteen slugs; DiamondEtaleCohomology §C8.44; EnhancedDerivedSheaves §§E1.4, E2.6, E3.2, E3.4, E5:abstract.1; EtaleDualityAndPerverseSheaves §§6.1–6.3 with `CohCorr.pullbackAlong` and `CohCorr.restrictOpen`; AdicCoefficientsAndComparisons, the two L1 and four L3 targets; SchemeAndStackFoundations §§0.23a, 0.24 and `perfection_universalHomeomorphism`; SmoothRepresentationsOfLocalGroups §§SR.0.3, SR.0d.2, SR.1.1, SR.2.1, SR.2.2 with their slugs and `HaarMeasureWithValues`; PivotalSpherical Layers 2 and 7; AdicSpacesPartIII §R3.8 with both targets; DGAInfinity Layer 5. All exist where cited. No forbidden supplier is named. `scratch/citations.md` lists nothing unresolved, and `scratch/overlaps.md` lists no changed, dropped or revision-only id.

The six gap slugs of `design/plan.json` and of the README's supplier contracts are the same six, each with a named supplier and section. Each `needs` states one object with its hypotheses and a locator (LiuZhengEnhanced §§2.3, 3.4, Proposition 2.2.4, Theorem 4.1.8(1); LiuZhengGluing Theorem 5.4; the coefficient and complex range for the two scheme gaps), and none asks for what §E3.4 or §§6.2–6.3 already state (ringed diagrams only; finite ℓ-power-torsion rings and bounded constructible complexes of finite Tor dimension only).

Dependency check, with the prescribed command and `--movable`; complete output:

```text
depcheck: 223 roadmaps, 1980 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap stands at line 129 of the merge order, right after its base roadmap.

Ownership against open work was checked by object with `roadmaps grep` over main and the open heads: "decent v-stack", "fine map(s) of decent", "prespatial", "CoCorr_S", "BCoCorr", "universal local term", "Haar(G" have no other occurrence; "cohomological correspondence" and "Lefschetz–Verdier" occur for schemes in EtaleDualityAndPerverseSheaves (the declared supplier), in automorphic applications of the scheme theory, and in IgusaVarietiesAndTorsionConcentration §7.9b (R01); "trace distribution" occurs for complex coefficients in AutomorphicSpectralTheory and its consumers, which the README's ownership paragraph already distinguishes. HeckeStacksAndLocalShtukasPartII lists local-shtuka Lefschetz–Verdier applications as outside its scope. The board's package index (nine packages) has no second package on these objects. This is not a second copy of a roadmap on main.

Overlap check: read DiamondSixOperations, VStackSheavesAndLisseCategories, HeckeStacksAndLocalShtukas, AdicCoefficientsAndComparisons, GeometricSatakeAndFusion, EnhancedDerivedSheaves, and IgusaVarietiesAndTorsionConcentration §7.9b; representable six operations and the §S4.2 notion of invertible object: DiamondSixOperations; smooth stacky f^!, its left adjoint, ULA and the classifying-stack equivalence: VStackSheavesAndLisseCategories; scheme comparison c_X^*: AdicCoefficientsAndComparisons; the ∞-categorical inputs and the four declared extensions: EnhancedDerivedSheaves; Hecke and Satake applications: their own roadmaps; cohomological correspondences of v-stacks and the relative Lefschetz–Verdier formula: this roadmap, with IgusaVarietiesAndTorsionConcentration §7.9b to cite it (R01).

### Wording, arrangement and reuse

Twenty-one passages were put beside their sources: the fifteen sampled statements and VS6.5 (GHW22 lines 90–98), VS7.8 (GHW22 lines 1594–1600), VS10.1 (HKW22 lines 3587–3597), VS11.2 (HKW22 lines 1705–1708), VS11.10–VS11.11 (HKW22 lines 2000–2040) and VS11.12 step 1 (HKW22 lines 2061–2093). The longest shared runs are definitional lists of hypotheses (about a dozen words in the definition of strongly compactifiable maps, GHW22 line 788), which can be written one way only; no sentence, list or proof plan follows a source clause by clause. No table, figure or list of examples is taken over. The Lean file declares nothing, so it adapts no formalisation.

Locators were counted by blank-line-delimited paragraph before *References*, one per source per paragraph: HKW22 124, GHW22 41, LZ22 24, Sch17 22, FS21 19, LiuZhengEnhanced 5, LiuZhengGluing 1, Stacks07LT 1; 237 in all. The contents of HKW22 (lines 26–70 of its text) were set beside the layers: VS6–VS7 use §4.1 with GHW22 §§1, 3, 4; VS8 uses LZ22 §1, HKW22 §4.3 and Appendix B.1; VS9 uses §4.3 and §5.3; VS10 uses §4.2 and Appendix B.2; VS11 uses §§4.4–4.6. The layers are not a run of that source's sections: VS10 (§4.2) stands after VS8–VS9 (§4.3, §5.3), VS9 joins §4.3 to §5.3, and VS8 opens with Lu–Zheng's category theory. The order is forced by the `*Needs:*` chains VS6 → VS7 → VS8 → VS9 and VS11 ← VS8, VS9, VS10.

Source independence: 21 passages compared with 3 sources, none shared beyond forced definitional hypotheses; largest share HKW22, 124 of 237 locators; contents compared with HKW22: independent.

## Not verifiable

- Elaboration certifies an empty target-signature file; the geometric theorems and the six declared supplier extensions cannot be tested at the pins.
- Whether c_f is invertible for every proper fine map is not settled by the cited texts. The package states this, works with cohomologically proper maps, and the question was settled as not actionable in an earlier round; it is not re-raised.
- That an invertible span in a bicategory of correspondences of v-stacks has both legs invertible (used in the negative Check of VS11.7) was checked by the standard 1-categorical argument, not against a cited text.

## Source issues

- **Misprint** in HKW22 at Definition 4.5.4, printed p. 39 (line 1884): the source says a morphism is represented by a correspondence into a fibre product of X and X′ over U; it should be the product over S, with the correspondence lying over U; affects nothing.
- **Error** in HKW22 at the paragraph before Theorem 4.1.6, printed p. 23 (line 1122): the source says ⊗-invertible objects are exactly those étale locally a single shifted invertible module; it should allow different shifts on idempotent factors of the coefficient ring; affects a stated result.
- **Error** in HKW22 at Example 4.1.1, printed p. 22 (line 1055): the source says maps of classifying stacks are homomorphisms of the groups; it should be torsors with a commuting action, homomorphisms arising after a trivialisation; affects a stated result.
- **Gap** in HKW22 at Theorem 4.1.8, printed p. 24 (line 1168): the source says the cited six-functor theorem gives an isomorphism of exceptional and ordinary pushforward on proper maps; it should say that theorem contains no such comparison; affects a stated result.
- **Misprint** in HKW22 at Definition 4.3.4, printed p. 30 (line 1482): the source says the tensor product of correspondences ends in a mixed unprimed and primed pair; it should end in the two primed target sheaves; affects a stated result.
- **Misprint** in HKW22 at the paragraph after Proposition 4.3.5, printed p. 31 (line 1514): the source says the ULA criterion is FS21 Theorem IV.2.24; it should be Theorem IV.2.23 (FS21 line 4801); affects nothing.
- **Error** in HKW22 at Example 4.3.10, printed p. 33 (line 1621): the source says properness of X suffices for an arbitrary correspondence; it should also require the correspondence to be proper over the base; affects a stated result.
- **Misprint** in HKW22 at the proof of Theorem 4.5.3, printed p. 41 (line 1990): the source says the fibre product is over the inertia of T₁; it should be over the inertia of T; affects the proof.
- **Gap** in HKW22 at equations (4.5.8)–(4.5.9), printed p. 40 (line 1960): the source says functoriality and monoidality of the fibre product are straightforward; it should prove the coherence; affects the proof.
- **Error** in HKW22 at the closing remark of §4.6, printed p. 44 (line 2138): the source says isolated fixed points make the restricted inertia étale; it should assume that étaleness; affects a stated result.
- **Misprint** in HKW22 at §5.3, printed p. 48 (line 2320): the source says the trace map is discussed before Definition 4.3.5; it should be Definition 4.3.6; affects nothing.
- **Misprint** in HKW22 at the proof of Lemma B.1.1, printed pp. 72–73 (lines 3534, 3543): the source says the exponent is m − 1; it should be k − 1, the lemma's exponent being k; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2a2f6c48f9bca118255d627592b0d10dccf29f8c", "job": "REV-PKG-VStackSheavesAndLisseCategoriesPartII~8", "model": "fable", "worker": "chris-x14"} -->
