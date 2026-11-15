<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13046#issuecomment-6899970196 -->
Red team round 1 pass a (claude) of dc03a56

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the PadicLocalLanglandsForGL2Qp §0.2 contract states what §0.2 does not

   **Location.** `packages/PadicHodgeTheoryPartII/README.md`:63: "and its exact-category API: weakly admissible objects form an abelian subcategory, closed under extensions, in which every morphism is strict. Strictness is used in §0.5."

   **Claim.** PadicLocalLanglandsForGL2Qp §0.2 states that the weakly admissible objects form an abelian subcategory, closed under extensions, with strict morphisms.

   **Witness.** PadicLocalLanglandsForGL2Qp §0.2 at its open head says only "Prove tensor, dual, Tate twist, exact-category, scalar-change and descent APIs"; the words strict, abelian and extension do not occur in §0.2. PadicHodgeTheory §3.4 names them as imports from that API.

   **Repair.** Replace the sentence by:

   > Section 0.2 supplies the category of filtered (φ, N)-modules over a complete discretely valued field K of characteristic zero with perfect residue field (the carrier that FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.1 names `FilteredPhiNModule K`), weak admissibility on it, and its exact-category API. PadicHodgeTheory §3.4 records what that API contains: strictness of morphisms between weakly admissible objects, weak admissibility of their kernels, images and cokernels, and the abelian category of weakly admissible objects. Strictness, in the form stated in PadicHodgeTheory §3.4, is used in §0.5.

   and in the *Needs:* line of §0.5 and in the Layer 0 Dependencies change "PadicLocalLanglandsForGL2Qp §0.2 (strict morphisms)" to "PadicLocalLanglandsForGL2Qp §0.2 with PadicHodgeTheory §3.4 (strict morphisms of weakly admissible objects)". Tested on the instance: §0.5 uses strictness only for a nonzero map X(d) → `F_{b,μ}(V)⊗Q_{p^s}` between weakly admissible objects, which is the PadicHodgeTheory §3.4 statement.

2. **F02** (P3) the ArithmeticGaloisRepresentations §7.6 contract drops "algebraically closed"

   **Location.** `packages/PadicHodgeTheoryPartII/README.md`:87: "the equality of the closure of α(Σ) with α of the closure for a homomorphism α of algebraic groups, and the compatibility of closures with field extension."

   **Claim.** §7.6 states closure(α(Σ)) = α(closure Σ) over every field; §§3.2 and 3.5 use it over Q_p (f(H̃) = H).

   **Witness.** ArithmeticGaloisRepresentations §7.6 at its open head: "Prove that over an algebraically closed field the closure of `α(Σ)` is `α(Σ̄)` for a homomorphism `α` of algebraic groups". The Q_p statement is not a target there.

   **Repair.** Replace the clause by:

   > the equality, over an algebraically closed field, of the closure of α(Σ) with α of the closure for a homomorphism α of algebraic groups, and the compatibility of closures with field extension. Over Q_p the equality used in §§3.2 and 3.5, with α(Σ̄) the scheme-theoretic image, follows from these two: both sides are closed subgroups of the target over Q_p, and after base change to Q̄_p they are the closure of α(Σ) and α of the closure of Σ, which agree.

   Tested on the instance of §3.5: Σ = ξ̃(Γ_L) ⊂ G̃(Q_p), α = f; base change gives (closure f(Σ))_{Q̄_p} = closure over Q̄_p of f(Σ) = f(Σ̄_{Q̄_p}) = f(H̃)_{Q̄_p}, hence H = f(H̃) by descent of closed subschemes.

3. **F03** (P3) §2.3 chooses the field E without placing it inside K

   **Location.** `packages/PadicHodgeTheoryPartII/README.md`:381: "Choose s and a finite E containing `Q_{p^s}` and a field of definition of a representative μ; genericity over the reflex field persists over E because Fl_μ is geometrically irreducible."

   **Claim.** Any such E may be used. But §2.2 and §1.1 need η: Spec K → Fl_μ ×_{E_0} E, hence E ⊆ K, and §1.5 (used by §2.4) assumes K contains the field of definition of the dominant representative; §§2.3–2.4 assume only K ⊇ reflex field.

   **Witness.** G = D^×, {μ} = (1,0), reflex field Q_p, K = F, s even. E = `Q_{p^s}`(√p) contains `Q_{p^s}` and a field of definition of a representative, yet E ⊄ F, so η does not factor through Fl_μ ⊗ E.

   **Repair.** Replace the sentence by:

   > Choose s as in the Conventions and let E be the compositum of `Q_{p^s}` with the reflex field E_0 of {μ}. Since `G_{Q_{p^s}}` is quasisplit with T ⊆ B over `Q_{p^s}`, the B-dominant representative μ ∈ X_*(T) of {μ} is unique, so it is fixed by exactly the stabilizer of {μ} in `Γ_{Q_{p^s}}`: its field of definition is E. As K contains F ⊇ `Q_{p^s}` and E_0, it contains E, so the hypothesis of §1.5 holds for every K as in this section. Genericity over E_0 persists over E because Fl_μ is geometrically irreducible: κ(Fl_μ) ⊗_{E_0} E is the function field of Fl_μ ⊗ E.

   Tested on the instance: for D^× and s even, E = `Q_{p^s}` ⊂ F = K, the representative (1,0) is defined over `Q_{p^s}` (which splits D), and η: Spec K → ℙ^1 over `Q_{p^s}` is defined.

4. **F04** (P3) Layer 0 Examples call a rank-one coefficient object "rank-two"

   **Location.** `packages/PadicHodgeTheoryPartII/README.md`:242: "For the rank-two coefficient object with s = 2, φ(e_0) = e_1, φ(e_1) = e_0 and jumps 1, −1".

   **Claim.** The object X(1, −1) has rank two as a coefficient object.

   **Witness.** §0.5 (README:191): "an object is of rank one when its underlying F-space has dimension s"; here s = 2 and dim_F = 2, so the object is of rank one, as §0.5's second Check treats it. A rank-two coefficient object would have F-dimension 4.

   **Repair.** Replace the opening of the sentence by: "For the rank-one coefficient object X(1, −1) with s = 2 (of dimension 2 over F), φ(e_0) = e_1, φ(e_1) = e_0 and jumps 1, −1,". Tested: X(1, −1) has k = 1 + (−1) = 0, wraparound p^0 e_0 = e_0, F-dimension 2 = s.

Four P3 findings (two supplier contracts that state more than the supplier does, one under-specified choice in a proof plan, one term used against its own definition). No P1 or P2. No finding of an earlier repair report was marked `not actionable in this package`, so nothing is re-raised.

Dependency check, run on the head:

```text
depcheck: 246 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

Counts: 0 Lean declarations (the file has none; whole file read), 25 numbered README targets read (§§0.1–0.7, 1.1–1.7, 2.1–2.4, 3.1–3.5, 4.1–4.2) with the Conventions and the supplier contracts, 83 Checks evaluated, 50 source locators verified in 5 cached sources (GLX26 31, Chen14 11, Serre79 2, MilneiAG 2, Stacks 4), 48 sibling citations resolved (16 roadmaps: 12 at their open heads, 4 on main; the heading of every cited section is present, and the text was read for PadicHodgeTheory, PadicLocalLanglandsForGL2Qp, FiniteFlatGroupsAndIntegralPadicHodgeTheory, BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, ArithmeticGaloisRepresentations, ShimuraData, AutomorphicBundles, AlgebraicModuliForArithmeticGeometry, DeligneWeightsAndPurity, ReductiveGroups Layer 10B and ReductiveGroupsPartII), 20 pinned declarations opened at the pins.

**Suggested.lean.** `import Mathlib` only, one module docstring, empty namespace, no declaration, no `set_option`, no `sorry`. The `#check @name` audit has no candidate, so it was not run and nothing changed. Headline theorems listed by the README (line 7): §2.3, §2.4, §3.2, §3.5, §4.1, §4.2. Each is named in the docstring with its missing carriers; I confirmed at the pins that there is no `B(G)`, no filtered isocrystal with weak admissibility, no flag scheme G/P, no B_dR-Grassmannian and no diamond (`BDeRhamPlus` exists in `Mathlib/RingTheory/Perfectoid/BDeRham.lean`:75; `TauCeti.reductiveCommHopfAlgProperty` in `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`:71). No headline is statable; no padding (nothing is declared). Observation, not a finding: the auxiliary targets §3.3 and §3.4 have all their carriers at the pins (`IsNonarchimedeanLocalField`, the point topology, `HopfIdeal.identityComponent`, `derivedDefiningIdeal`), but the README does not list them among its headline theorems, so their absence is consistent with the rules.

**Policy.** The pull request changes only `packages/PadicHodgeTheoryPartII/` (README.md, Suggested.lean, three reports). No pull-request number, no process narrative, no `lemma`, every target has a locator, no computational algorithm.

**Adversarial pass (values computed).**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Conventions: Q_p(1), orientation | G_m, b = p^m, μ = z^m; HS2.11's b = p⁻¹, HS-μ = id | ours: κ = m = μ^♮, t_H = t_N = m, ξ = χ^{−m}; HS: our μ = z⁻¹, m = −1, ξ = χ = Q_p(1), D_cris = (F, p⁻¹σ) | agree with PadicHodgeTheory §5.5 and HS2.11 | none |
| Conventions: enlarging s | s-decent b, ms | (bσ)^{ms} = ((sν)(p)σ^s)^m = (msν)(p)σ^{ms}, as (sν)(p) ∈ G(`Q_{p^s}`) | decency persists | none |
| §0.1 jump | zero vector; e_1 + e_2 in the two-step example; Fil not separated | 0 has no jump; jumps 2, −1, sum −1 = min; existence needs separation and decrease | true | none |
| §0.2 degree sum | s = 0, 1; identity; 2-cycle (1, −1); 3-cycle (2, 0, −5) | 0; d(v); s·d(v); 0; d_3 = −3, d_2 = 2 | true | none |
| §0.3 `V^{s,k}` | G_m with b = p^a, weight h; GL_2, b = diag(p,1), rational flag; v = 0 | k = sa = sh; e_1 ∈ `V^{1,1}`, e_2 ∈ `V^{1,0}`, e_1 + e_2 in none; 0 excluded | true | none |
| §0.4 ω_s | unit; slope 1/2 block, s = 2; φ = pσ; b = p^m | `Q_{p^s}`; φ² = pσ², dim 2; unnormalized space 0, ω_s of dim 1; ω_1 = V | true | none |
| §0.5 rank-one objects | s = 1; s = 2, d = (1, −1); wraparound p with Σd = 0; morphism bullet on 𝔾_m², b = 1, μ = (0,1) | t_H = t_N = k; lines F(e_0 + ce_1), cσ(c) = 1, t_H = −1 ≤ 0; t_N = 1 ≠ 0; v = e_1 + e_2 jump 0, image e_2 jump 1 (pair not admissible) | true; admissibility needed and present | R04 (wording) |
| §0.5 Hom description | general v with φ^s v = p^k v | slope components: σ^s v_λ = `p^{k−sλ}`v_λ forces k = sλ, v ∈ V⊗`Q_{p^s}`; t_H(image) = Σ deg(φ^i v) ≥ Σ d_i = k = t_N forces equality | true | R01 (citation) |
| §0.6 line criterion | G_m, b = p^m, μ = z^m; b = 1, μ = 0, V ⊕ 1; lines in irreducibles only for GL_2 | H_cris = G_m (fixing v would give 1); scalar forced to 1, intersection trivial; centre 𝔾_m | true | none |
| §0.7 period comparison | b = 1, μ = 0; G_m; torus; change of trivialization | H = H_cris = 1; H = 𝔾_m; 1 ⊆ H°; conjugation by h, G_der normal | true | none |
| §1.1 generic filtration | GL_2 standard and det; Res torus of `Q_5(5^{1/3})`/Q_5 | Fil^1_gen = 0, generic line K′(1,t) meets V in 0, rational flag in ke_1; Fil^1_gen det = det; x³ − 5 Eisenstein, 3 ∤ 4 so E ⊗ E = E × (quadratic field), diagonal V ∩ (E × 0) = 0 | true | none |
| §1.2 threshold | Res torus; GL_2 standard, det; μ = 0 | Γ_E-orbits of sizes 1, 2, pairings 1, 0, m_O = 0; m = 0, 1; m_O = 0 | true; GLX26 (5.18) at λ = e_1 would give 1 | none |
| §1.3 orbit bound | sizes 1, 2, pairings 0, 3; Res torus; GL_2 | 0 ≤ (0 + 6)/3 = 2; 0 ≤ 0 ≤ 1/3; 0 = 0 | true | none |
| §1.4 Frobenius transport | Res torus of `Q_{p²}`/Q_p; split G | 1⊗σ swaps the two factors = σ_0; identity | true | none |
| §1.5 full-period inequality | G_m; GL_2 basic slope 1/2, s = 2; s → ms | m = m; b = [[0,p],[1,0]], (bσ)² = pσ², every nonzero v ∈ `Q_{p²}`² has generic jump 0, d_2 = 0 < 1; both sides × m | true | none |
| §1.6 Newton inequality | GL_2, ν = (a, b); torus | exponents in {sa, sb} ≥ sb; equality | true | none |
| §1.7 strict positivity | SL_2, c > 0, weight −n; GL_2 ordinary, c = 0, λ = (1,0); torus | −cn < 0; 0 ≤ 0 ≤ 0 with ⟨λ, α^∨⟩ = 1; vacuous | true; strictness needed | none |
| §2.1 descent | b = 1; simple block; diag(p,1) | rational lines; 0 and the block; Fe_1, Fe_2 | true | none |
| §2.2 semicontinuity | plane, jumps 1, 0, line L; whole plane; formula t_H = A·r + Σ_{i>A} dim(D′_0 ∩ Fil^i) | 1 at [L], 0 elsewhere; 1; telescoping Σ i(f_i − f_{i+1}) with f_A = r, f_{B+1} = 0 | true | none |
| §2.3 generic admissibility | GL_2, diag(p,1), flag Ke_2; G_m; basic slope 1/2; D^× with K = F | t_H = 1 > 0 = t_N at the bad flag, 0 at the generic one; m = h; simple; E must lie in K | true | R03 (proof plan) |
| §2.4 derived monodromy | GL_2 basic; torus; GL_2 ordinary at a generic flag | μ^◇ − ν = (1/2)α^∨, `V^{2,1}` empty, SL_2 ⊆ H°; 1 ⊆ H°; `V^{1,0}` = Q_p^×e_2, c_α = 0, ξ reducible | true; hypothesis needed | none |
| §3.1 generic points | ℙ^1; torus (n = 0); closed points | t transcendental; X = Spec E, K = FE; algebraic coordinates | true | none |
| §3.2 open-image point | torus; norm-one torus, μ = 0, κ(b) ≠ 0; finite K′/K | automatic; X_*(T)_Γ = ℤ/2, no admissible point; finite index, still open | true | R02 (citation) |
| §3.3 Zariski density | 𝔾_m, 1 + pℤ_p (p = 2: ℤ_2^×, infinite); O(2), SO(2)(Q_p); diagonal subgroup of GL_2(ℤ_p) | closure 𝔾_m; SO(2) ≠ O(2); diagonal torus | true; connectedness and openness needed | none |
| §3.4 central lifting | GL_2 → PGL_2, J = GL_2, SL_2, torus; det: GL_2 → 𝔾_m | D(J°) = SL_2, dim 3 = dim PGL_2, kernel μ_2; hypothesis fails; kernel not central, conclusion fails | true | none |
| §3.5 z-extension | GL_2 → PGL_2; G × 𝔾_m → G | index [Q_p^× : Q_p^{×2}] = 4 (p odd), 8 (p = 2); image not in G̃_der | true | R02 (citation) |
| §4.1 torsor components | ξ trivial; C = {1, diag(1,−1)}, g = [[1,1],[0,1]] | stabilizers trivial; gcg⁻¹ = [[1,−2],[0,−1]] ∉ C (also for p = 2) | true | none |
| §4.2 ambient stabilizers | Y a point; Y = T_y ⊔ (G(Q_p) × Spd K); trivial ξ for GL_2 | G(Q_p); trivial stabilizers, not open when G_der ≠ 1; {1} not open in SL_2(Q_p) | true; hypotheses needed | none |

**Supplier citations resolved** (section present with the cited content): PadicHodgeTheory §§3.3, 3.4, 3.6, 4.4, 5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1, R07.3.2 (`FilteredPhiNModule.IsWeaklyAdmissible` is defined there as notation, so the lead of the citation check is not a defect); PadicLocalLanglandsForGL2Qp §0.2 (see R01); VectorBundlesAndIsocrystals Layer 1, four quoted headings; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; BunGAndNewtonStrata §§1.7, 1.8, 1.9, 1.12, 1.23, 1.43; HeckeStacksAndLocalShtukas §§HS2.11, HS2.12, HS2.13, HS2.15, HS2.16, with the orientation μ ↦ μ⁻¹ recomputed on HS2.11's Q_p(1) example; ArithmeticGaloisRepresentations §§1.1, 7.6 (see R02); ShimuraData §3.8 `parabolicTypeVariety`; AutomorphicBundles §0.4 `associatedCoefficient`; AlgebraicModuliForArithmeticGeometry §1.7 `rankLocus`; DeligneWeightsAndPurity §2.2; on main ReductiveGroups Layers 1, 2, 3, 6, 7, 10 (10B), ReductiveGroupsPartII §§RG2.0.2, RG2.0.4 (`transcendenceDegree_infinite`), RG2.1.5, SchemeAndStackFoundations §0.8 `etale_coordinates`, DiamondsAndVStacks §§D0.6, D3.10, D5.3, D5.16, D6.5. All suppliers are on main or earlier in the merge order.

**Declared gaps.** `gap:quasisplit-highest-weights` and `gap:serre-sen-openness` have the same slug and sentence in `design/plan.json` and in the README, a named supplier and section each. Minimality: no roadmap on main or at an open head states the Galois-orbit classification for quasisplit groups (searched "orbits of dominant weights", "Tits algebra", "quasi-split" in ReductiveGroups); PadicHodgeTheory §4.4 states the zero-Sen-operator theorem for finite K/Q_p and not openness in the Zariski closure. Truth: multiplicity one in W_O ⊗ k̄ holds because the Tits algebras of a quasisplit group are split; the Sen sentence is Serre79 Théorème 1 with Serre's hypotheses (Serre79 lines 42–45, 125). AdmissiblePairsAndPadicHodgeStructures, later in the merge order, declares a second gap on PadicHodgeTheory for the same theorem (`gap:strict-field-serre-openness`); that is for the supplier's intake, not a defect here.

**Ownership.** Searched all roadmaps on main and at the open heads for generic filtrations, Hodge–Newton irreducibility, Chen's criterion, the GLX source, Zariski density of open subgroups, crystalline monodromy groups. No second owner of any target. DeligneWeightsAndPurity §2.2 owns the Sp(V) case of §3.3 and is cited. No `Suggested.lean` name can collide (none declared). Board packages that are not open roadmap pull requests were not searched beyond the index the tools provide.

**Pinned declarations** opened and compared with the README's description: 5 Mathlib and 15 Tau Ceti declarations of the supplier contracts (all but the carrier `Submodule`), each at the stated file and line; hypotheses as described (`faithfullyFlat_derivedMap` has `[IsReduced H]` on the coordinate ring of the target group; `isClosedEmbedding_comap_of_surjective` needs `[T1Space R]`; `isCompact_range_mapValue_integer` needs no finite type).

Source independence: 12 passages compared with 4 sources (GLX26, Chen14, Serre79, MilneiAG), none shared beyond formulas and standard names; largest share GLX26, 40 of 66 locators; contents compared with GLX26 (§§5.1–5.3, 6.2, 6.7): independent — Layer 0 ↔ §5.1 and Layer 1 ↔ §5.2 are close, but §5.3 is split over Layers 1, 2 and 3, Layer 3 joins the end of §5.3 with a step of §6.2 and two results of the roadmap's own (§§3.3, 3.4), and Layer 4 is one lemma of §6.7; the order 0, 1 → 2 → 3 → 4 is forced by the *Needs:* lines of §§2.4, 3.2 and 4.2.

## Not verifiable

- The published (Inventiones) numbering of GLX26: only arXiv v3 is in the cache. The README cites arXiv v3 explicitly, so no locator depends on it.
- The page of Lemma 3.2 of GLX26 that its Lemma 6.12 invokes was not opened; the README's §4.1 does not rely on it.
- PadicLocalLanglandsForGL2Qp §0.2's "exact-category API" is not itemised in that roadmap; whether it will contain closure under extensions cannot be read from its head (R01 routes the citation through PadicHodgeTheory §3.4, which itemises strictness).
- Elaboration of `Suggested.lean` was not run (no Lean command is given in this pass); the file has no declaration.
- Packages on the board that are not yet roadmap pull requests could not be read; ownership against them was not checked.

## Source issues

- **Error** in GLX26 at §5.1 ¶14, arXiv v3 p. 32 (GLX26 line 1290): the source says the identity component MT of the Zariski closure is the Tannakian group of the generated category of representations; it should be the full Zariski closure, as in Chen14 Définition 3.2.2 and Proposition 3.2.3; affects a stated result.
- **Error** in GLX26 at Proposition 5.7, equation (5.18), arXiv v3 pp. 36–37 (GLX26 lines 1501–1510): the source says the threshold condition runs over the automorphisms of E over K applied to one weight λ; it should run over all Γ_E-orbits inside the Γ_K-orbit of λ, since E need not be normal; affects a stated result.
- **Error** in GLX26 at equation (5.29), arXiv v3 p. 38 (GLX26 lines 1640–1643): the source says an isotypic vector is the sum of its refined components over the automorphisms of E over K; it should be the sum over the distinct Γ_E-orbits in the orbit, each once; affects the proof.
- **Misprint** in GLX26 at the justification of (5.34), arXiv v3 p. 39 (GLX26 lines 1673–1681): the source says the Frobenius action moves across the pairing with the same exponent; it should move with the inverse exponent, the full-period sum being unchanged; affects nothing.
- **Gap** in GLX26 at Proposition 6.7, crystalline step, arXiv v3 p. 47 (GLX26 lines 1991–1993): the source says openness of the Galois image inside the derived group passes along the isogeny of derived groups; it should compare intersections with the derived groups, the image not lying in the derived group; affects the proof.
- **Misprint** in Chen14 at Lemme 3.3.5, p. 744 (Chen14 line 1011): the source says the rank-one object is a sum of lines over the degree-s unramified extension of Q_p; it should be a sum of lines over K_0, of total K_0-dimension s; affects nothing.
- **Error** in Chen14 at the proof of Proposition 3.3.4(2), p. 743 (Chen14 lines 978–979): the source says every representation embeds in one mixed tensor power of a faithful one; it should allow finite direct sums of such powers and subquotients; affects the proof.

## For the human reviewers

- **Scope.** §1.2, §§3.4–3.5 and §4.1 state corrected forms of GLX26 Proposition 5.7, Proposition 6.7 and Lemma 6.12 (README lines 277, 447, 479); no refereed source states them in this form.
- **Licence.** Serre79 is recorded as `open-repository` in `sources.toml`; its Numdam cover page reserves all rights to the Société mathématique de France (Serre79 lines 10–15). The README cites it by locator only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dc03a56398ac5405507775ea9100999abe223687", "job": "RT-PadicHodgeTheoryPartII~1a", "model": "fable", "worker": "chris-x91"} -->
