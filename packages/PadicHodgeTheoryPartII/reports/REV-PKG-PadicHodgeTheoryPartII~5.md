<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13046#issuecomment-6899487897 -->
Review (claude) of dc03a56

Verdict: accepted
Conditional on the announced gaps: `quasisplit-highest-weights`, `serre-sen-openness`

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

No finding. Both round-4 findings are repaired, the fifteen sampled targets agree with their sources at the stated locators, every statement of the sample and every headline survives the computed pass below, all supplier citations resolve at the suppliers' present heads, all pinned declarations sit at the cited lines, the dependency check is clean and `Suggested.lean` elaborates with no output. The acceptance is conditional on the two declared supplier gaps, `quasisplit-highest-weights` and `serre-sen-openness`.

## Verified sound

### The round-4 findings

- **F01 (Chen14 Proposition 3.3.4 page range) — repaired.** `packages/PadicHodgeTheoryPartII/README.md` §0.6 now reads "(Chen14 Proposition 3.3.4(1), pp. 743–744, and Proposition 3.3.6, pp. 744–745; GLX26 §5.1 ¶15, arXiv v3 p. 33.)". Chen14 line 951 is the running head of p. 743, the proposition is stated at Chen14 line 966 and its proof ends at Chen14 line 1005 under the p. 744 head (Chen14 line 991).
- **F02 (`AlgebraicIndependent` line) — repaired.** The From Mathlib contract now reads "`AlgebraicIndependent` (`Mathlib/RingTheory/AlgebraicIndependent/Defs.lean`:54)". At the pinned Mathlib (`1b1ccf4b`) line 54 is `@[stacks 030E "(1)"] def AlgebraicIndependent : Prop :=` and line 55 its body `Injective (MvPolynomial.aeval x …)`.
- The repair changed two tokens and no statement. The repaired patterns were searched again in the whole README: every other Chen14 page locator and every other file-and-line locator was reopened (tables below) and is right. No finding of the repair report was marked not actionable; nothing is re-raised. Its note that `design/plan.json` still carries the old page range outside the `gaps` list is correct and lies outside the files under review.

### Principles, shape and style

Read all of `README.md` (520 lines: 25 numbered targets, 25 `*Needs:*` clauses, 25 Check blocks with 3, 3, 4, 4, 5, 3, 4, 3, 4, 3, 3, 3, 3, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4 bullets), `Suggested.lean`, `metadata.toml` and `sources.toml`.

- No route-specific restriction: ramified and nonquasisplit G, arbitrary μ, nonnormal reflex fields and p = 2 are all kept (§§1.2, 2.4, 3.2 say so and their Checks test them).
- No re-planned roadmap: the text starts where PadicHodgeTheory §§3.6, 4.4, 5.5 stop and imports everything else by section. No algorithm, no sorried data, no `set_option`.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–4 each ending in Examples and Dependencies, Downstream consumers, References. Every definition (§§0.1–0.5, 1.1) has an API list and at least three Checks; every theorem has its hypotheses in the sentence and a locator.
- A mechanical search of `README.md` and `Suggested.lean` for LaTeX delimiters, HTML anchors, pull-request numbers, machine paths, job ids, process words ("so far", "current", "removed", "optional", "deferred"), `lemma` and target-numbering tables returned nothing.
- Backticked identifiers: every Lean-style name in the README is a supplier's or a pinned declaration (`parabolicTypeVariety`, `associatedCoefficient`, `rankLocus`, `etale_coordinates`, `transcendenceDegree_infinite`, `FilteredPhiNModule.IsWeaklyAdmissible`, each found in its supplier, lines below); the other code spans are mathematics. The README attributes no Lean name to this roadmap, consistently with a `Suggested.lean` that declares nothing.
- The layer order is forced: §§1.1, 1.5, 1.6 need §§0.1, 0.2, 0.3; §2.3 needs §§2.1–2.2 and §1.1; §2.4 needs §§0.6, 0.7, 1.5–1.7; §3.2 needs §§2.3, 2.4, 3.1; §4.2 needs §§3.2, 4.1. The Dependencies paragraphs were compared with the 25 `*Needs:*` clauses item by item; each is a superset of its layer's needs and none names anything the scope excludes.

### Seeded source sample (15 targets, all read at the cached text)

The author flags no locator as unverified. GLX26 is read in arXiv v3, the version the References and the manifest name. Chen14 journal page = page marker + 721; Serre79 journal page = page marker + 153.

| Target | Locator opened | Result |
|---|---|---|
| 0.3 | GLX26 lines 1300–1318, (5.3)–(5.5), pp. 32–33 | Newton operator, degree sum over i < s and the set of vectors satisfying both; matches. The README's exclusion of 0 agrees with the source's domain of the degree function. |
| 0.4 | Chen14 lines 781–820 (pp. 739–740), 933–943 (p. 742); GLX26 lines 1289–1295 (p. 32) | k algebraically closed, slopes with denominators dividing s, fixed vectors of the normalized φ^s, decent identification with V⊗Q_{p^s}; matches. |
| 0.7 | Chen14 lines 896–911 (pp. 741–742), 946–954 (pp. 742–743); GLX26 lines 1289–1299 | Full closure = tensor group; comparison over B_cris; the README's remark that GLX calls H° the Tannakian group where H is meant is accurate (Chen's MT is the full closure, Chen14 line 879). |
| 1.1 | GLX26 lines 1340–1458 (pp. 33–35); Chen14 lines 1133–1150 (p. 747) | Definitions 5.3, 5.5, ¶17 with (5.8)–(5.9), Propositions 5.4, 5.6, Lemme 4.2.2; pages as cited; matches. |
| 1.2 | GLX26 lines 1501–1585 (pp. 36–37) | Proposition 5.7 and proof; the source indexes by Gal(E/K), the README by all Γ_E-orbits in O; the correction is justified (row 1.2 below). |
| 1.3 | GLX26 lines 1622–1646 (p. 38), 594 (p. 15) | (5.23)–(5.29) and (2.6); matches, with the stated reweighting. |
| 1.4 | GLX26 lines 1649–1654 (p. 39) | Frobenius twist of W_O is the φ_0-translate; matches. |
| 1.6 | GLX26 lines 1686–1702 (pp. 39–40) | (5.37)–(5.38), dominant Newton point assumed; matches. |
| 2.1 | Chen14 lines 781–820 (pp. 739–740), 1333–1337 (p. 750) | Bijection of subisocrystals over Q_{p^s} and over the completed unramified field for decent b; matches. |
| 2.2 | Chen14 lines 1346–1358 (p. 751); GLX26 lines 1605–1608 (p. 38) | Upper semicontinuity of t_H of a fixed subobject, generic value ≤ value at a weakly admissible point ≤ t_N; matches. |
| 2.3 | GLX26 lines 1591–1608 (pp. 37–38); Chen14 lines 1303–1361 (pp. 750–751) | Hypotheses decent, generic, [b] ∈ B(G,μ); no Hodge–Newton irreducibility in GLX 5.8(1), and Chen's proof of (1) does not use it; matches. |
| 3.2 | GLX26 lines 1712–1726 (p. 40), 1287–1288 (p. 32) | Proposition 5.9 with the same hypotheses and conclusion; Theorem 5.2 on p. 32. |
| 3.3 | Serre79 lines 97–135 (§1.3, pp. 157–158), 42–45 | Zariski envelope, Lie algebra of the image inside that of the envelope, Théorème 1 on p. 158; residue field algebraically closed. The README cites it as a comparison, not as the source of the density statement. |
| 3.4 | MilneiAG lines 5283–5302 (p. 131); GLX26 lines 1991–1993 (p. 47) | Proposition 8.20 (commutator generation), Corollary 8.21(b) (connectedness); the GLX step is as the README describes it. |
| 4.1 | GLX26 lines 2158–2171 (p. 51) | Galois orbit descends to one component; stabilizer conjugate to the image; matches. |

Also opened: GLX26 lines 607–627 (Definitions 2.1, 2.3, ¶4, p. 15), 1464–1490 (¶18, pp. 35–36), 1656–1685 ((5.30)–(5.36), p. 39), 1727–1736 (Lemma 5.10, p. 40), 1920–1950 (Proposition 6.6, pp. 45–46), 2142–2176 (Lemma 6.12, pp. 50–51); Chen14 lines 856–858 (Proposition 3.2.1, p. 740), 966–1005 (3.3.4, pp. 743–744), 1008–1056 (3.3.5, 3.3.6, pp. 744–745); Stacks lines 2128 (01UA = Lemma 26.10), 3577 (02GL = 37.7), 3611 (03WT = 37.13), 3743 (054L = 37.21), all in the Morphisms chapter, as the References give them.

### Computed adversarial pass

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions: Tate sign | G_m, b = p^m, μ = z^h | t_N = m, t_H = h, admissible iff m = h; (p^m σ, jump m) is D_cris of Q_p(−m), so ξ = χ^(−m); Q_p(1): φ = p⁻¹σ, jump −1 | consistent in §§0.3, 0.6, 0.7, 2.3 |
| Conventions: decency under conjugation | b′ = gbσ(g)⁻¹, g ∈ G(Q_{p^s}) | (b′σ)^s = g(bσ)^s g⁻¹ = (g·sν_b·g⁻¹)(p)·gσ^s(g)⁻¹σ^s = (sν_{b′})(p)σ^s since σ^s(g) = g | decency preserved |
| Conventions: totally ramified splitting, σ_0^s = 1 | L/Q_p Galois splitting field, residue degree f, f ∣ s | [L·Q_{p^s} : Q_{p^s}] = e, Galois, totally ramified; a lift of Frobenius in Gal(L/Q_p) has finite order dividing an enlarged s | attainable by enlarging s |
| Conventions: μ^◇ against BunGAndNewtonStrata §1.7 | Q = image of Γ_{Q_p}, N = image of Γ_{Q_{p^s}}, cosets σ_0^i N | (1/s)Σ_{i<s} σ_0^i(N-average) covers each coset s/[Q:N] times = Q-average | the two definitions agree |
| 0.3 tested sets | G_m, b = p^a, weight h; b = 1, jump 1; GL_2, b = diag(p,1), s = 1, Fil^1 = Ke_1 | k = sa and k = sh, empty unless a = h; Newton k = 0 but d_s = s > 0, empty; e_1 ∈ V^{1,1}, e_2 ∈ V^{1,0}, e_1 + e_2 is no eigenvector of diag(p,1) | holds; not additive, as stated |
| 0.4 fibre ω_s | unit; block φe_1 = e_2, φe_2 = pe_1, s = 2; φ = pσ; decent b on N_λ | rank 1; φ² = pσ², fixed space of rank 2 over Q_{p²}; unnormalized fixed space 0 against normalized rank 1; φ^s = p^{sλ}σ^s gives the σ^s-invariants (V⊗Q_{p^s})_λ | holds |
| 0.4 stability under φ | x with φ^s x = p^{sλ}x | φ^s(φx) = φ(p^{sλ}x) = p^{sλ}φx | ω_s(D′) is ρ(b)σ-stable (used in §2.1) |
| 0.5 rank-one objects | s = 2, jumps (1, −1); wraparound p; no slope restriction | det φ = ±p^k, t_N = k = Σd_i = 0; lines F(e_0 + ce_1), cσ(c) = 1, jump −1, t_H = −1 ≤ 0; wrap p gives t_N = 1 ≠ 0; φ^s = p^kσ^s on all of N, so the slope k/s has denominator dividing s automatically | holds |
| 0.5 Hom description | v with φ^s v = p^k v, decent b | components: σ^s v_λ = p^{k−sλ}v_λ forces k = sλ and v_λ ∈ V⊗Q_{p^s} | holds |
| 0.5 negative control | T = G_m², b = 1, μ = (0,1), v = e_1 + e_2 | jump min(0,1) = 0, so v ∈ V^{1,0}; projection e_2 has jump 1; t_H(χ_2) = 1 > 0 = t_N | admissibility needed, as stated |
| 0.6 line criterion | G_m, m ≠ 0; b = 1, μ = 0 on GL_2 | H_cris = G_m acting on Q_p e by a nontrivial character (vector-fixing would give 1); every line of V ⊕ 1 stable forces scalar 1; irreducibles alone give the centre | holds |
| 0.7 comparison and derived containment | trivial pair; G_m, m ≠ 0; torus; change of trivialization | H = H_cris = 1; H = G_m = H_cris; 1 ⊆ H°; H ↦ hHh⁻¹ with G_der normal | holds |
| 1.1 generic filtration | GL_2 std and det; cubic torus over Q_5(5^{1/3}) | Fil^1_gen std = 0 while the rational flag gives ke_1; det has jump 1; 3 ∤ 5 − 1 so E is not normal, E⊗E = E × (quadratic field), diagonal V meets the weight-one factor in 0 | holds; genericity needed |
| 1.1 subrepresentation | comodule map on v ∈ V ∩ W, W the largest G_E-stable subspace of Fil^i | (V⊗O(G)) ∩ (W⊗O(G)) = (V ∩ W)⊗O(G) by flatness of O(G) over k | V ∩ W is G-stable |
| 1.2 threshold | cubic torus; GL_2 std, det; μ = 0 | m_O = min(1, 0, 0) = 0 = computed jump, while the source's index set Gal(E/k) = {1} at e_1 gives 1; std: ⟨(0,1),(1,0)⟩ = 0; det: 1; μ = 0: 0 | README formula right in both directions; source formula fails for nonnormal E |
| 1.3 orbit bound | refined orbits (1, 2) with pairings (0, 3); cubic torus; GL_2 std | 0 ≤ (1·0 + 2·3)/3 = 2 (unweighted 3/2 is not the orbit average); 0 ≤ 0 ≤ 1/3 with μ̄ = (1/3,1/3,1/3); 0 = 0 | holds |
| 1.3 identity | λ ∈ O, Γ finite quotient | ⟨w_0λ, μ̄⟩ = avg_γ⟨γ⁻¹w_0λ, μ⟩ = (1/|O|)Σ_{λ′∈O}⟨w_0λ′, μ⟩, using that w_0 commutes with Γ | equality as stated |
| 1.4 transport | Res of Q_{p²}, s = 2, b = 1; split G; σ omitted | a⊗c ↦ (ac, σ(a)c); 1⊗σ sends (x, y) to (σy, σx): factors swapped; σ_0 = 1; ρ(b) alone preserves isotypic parts | holds |
| 1.5 full-period bound | G_m; basic GL_2 (b = [[0,p],[1,0]], b² = p, 2-decent); s ↦ ms | m = m; d_2 ≤ 2·0 = 0 < 1 = k, so V^{2,1} is empty; d_{ms} = m·d_s since φ^s acts through G(Q_{p^s}) on V⊗Q_{p^s} | holds |
| 1.6 lowest-weight inequality | GL_2, ν = (a, b), a ≥ b; torus | exponents in {sa, sb}, lowest-weight value b ≤ k/s; equality | holds; dominance of ν used |
| 1.7 strict positivity | SL_2, c > 0, weight −n; ordinary GL_2, c = 0, λ = (1,0) | −cn < 0 contradicts 0 ≤ Σc_α a_α ≤ 0; sandwich 0 ≤ 0 ≤ 0 holds with ⟨λ, α^∨⟩ = 1 | strictness needed, as stated |
| 2.1 descent | b = 1, s = 1; simple block; GL_2, b = diag(p,1) | rational lines; 0 and the block; exactly the two slope lines Fe_1, Fe_2 | holds |
| 2.2 semicontinuity | plane, fixed line L; whole plane | t_H = A·r + Σ_{i=A+1}^{B} dim(D′ ∩ Fil^i) (telescoping of Σ i(d_i − d_{i+1}) with d_A = r, d_{B+1} = 0); 1 at ℓ_x = L, 0 elsewhere; 1 everywhere | holds; minimum at the generic point |
| 2.3 generic admissibility (headline) | ordinary GL_2; G_m; basic GL_2; base change of the generic point | slope-zero line: t_H = 1 > 0 at the flag Ke_2, 0 at a generic flag; m = h; simple isocrystal, 1 = 1; K ⊇ reflex field and F ⊇ Q_{p^s} give K ⊇ E, and the fibre of the finite map Fl_E → Fl over the generic point is the generic point | holds |
| 2.4 derived monodromy (headline) | basic GL_2; ordinary GL_2; torus | μ^◇ − ν = (1/2)α^∨, tested set empty, SL_2 ⊆ H°; c = 0: V^{1,0} = Q_p^× e_2, V^{1,1} empty, Fe_2 weakly admissible, ξ reducible; 1 ⊆ H° | Hodge–Newton irreducibility needed and stated |
| 3.1 generic points | P¹_E; n = 0 | one coordinate transcendental over E; X = Spec E, K = FE | holds |
| 3.2 open-image point (headline) | basic GL_2; norm-one quadratic torus, μ = 0, κ(b) ≠ 0 in Z/2; finite extension | open subgroup of H(Q_p) meets SL_2(Q_p) openly; μ^♮ = 0 ≠ κ(b), the modified bundle is nontrivial and the admissible cell is empty; finite index in a compact group stays open | holds; acceptability needed |
| 3.3 density | 1 + pZ_p, p = 2 included; SO(2) in O(2); diagonal compact subgroup of GL_2(Z_p); J = 1 | closure G_m; closure SO(2) ≠ O(2); closure of dimension 2 < 4; trivial | connectedness and openness needed, as stated |
| 3.4 central lifting | GL_2 → PGL_2 with J = GL_2, SL_2, torus; det; G × T → G with J a graph {(g, χ(g))} | D(J°) = SL_2 → PGL_2, kernel μ_2, dimensions 3 = 3; hypothesis fails for the torus; det: f(J°) ⊇ 1 but J° ⊉ SL_2; graph contains G_der × 1 since χ kills G_der | central kernel needed |
| 3.5 z-extension (headline) | GL_2 → PGL_2, p odd and p = 2 | image of SL_2(Q_p) has index [Q_p^× : Q_p^{×2}] = 4, 8: open, proper; f(H̃°) connected of finite index in H, so = H° | both directions hold |
| 4.1 components (headline) | ξ = 1; C = {1, diag(1,−1)}, g = [[1,1],[0,1]] | stabilizers trivial; g·diag(1,−1)·g⁻¹ = [[1,−2],[0,−1]] ∉ C, also for p = 2 | holds on a non-normal C |
| 4.2 stabilizers (headline) | trivial ξ for GL_2, Y = T_ξ; Y a point; Y = T_y ⊔ (G(Q_p) × Spd K); torus | {1} not open in SL_2(Q_p); stabilizer G(Q_p); components g × Spd K have trivial stabilizer; automatic | open-image and transitivity hypotheses needed and stated |
| Declared gaps | split G; cubic torus; finite image | orbits of size 1 (10B); one orbit of size 3, W_O = E with three geometric lines; finite image open in its finite closure | precise and minimal |

### Suppliers, ownership and the merge order

Dependency check output:

```text
depcheck: 246 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `PadicHodgeTheoryPartII` is at line 192 of `merge-order/ORDER.txt`, after its last supplier HeckeStacksAndLocalShtukas (line 191).

Every cited section was resolved at the supplier's present head (open heads for roadmaps still in pull requests, main for the four on main):

- PadicHodgeTheory §§3.3, 3.4, 3.6, 4.4, 5.5 (README lines 683, 706, 755, 895, 1072). §3.6 has the filtered fibre functor of (b, μ) for finite K over Q̆_p and the admissibility predicate; §5.5 has neutrality for [b] ∈ B(G,{μ}) and the conjugacy class of ξ; §4.4 has Sen's zero-operator theorem for finite K/Q_p only, so the openness theorem is a real gap.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1, R07.3.2 (lines 4628, 4701; `FilteredPhiNModule.IsWeaklyAdmissible` at 4705 is supplier notation, which settles the one lead of the citation resolver). PadicLocalLanglandsForGL2Qp §0.2 (line 241, exact-category API).
- VectorBundlesAndIsocrystals Layer 1 (line 210) and the four quoted subsection titles (lines 214, 256, 280, 296). MotivesAndAlgebraicCycles §§6.1–6.3, 6.8 (lines 1117, 1131, 1150, 1230).
- BunGAndNewtonStrata §§1.7, 1.8, 1.9, 1.12, 1.23, 1.43 (lines 375, 400, 451, 510, 694, 1027): §1.9's decency equation has exactly r factors, as the Conventions say; §1.12 gives quasisplit and the dominant Newton map; §1.23's set is κ(b) = μ♯ and the averaged Newton bound.
- HeckeStacksAndLocalShtukas §§HS2.11, HS2.12, HS2.13, HS2.15, HS2.16 (lines 1441, 1487, 1531, 1581, 1647): HS2.12 states the comparison through λ = μ⁻¹; HS2.15 gives a point over a finite extension exactly when [b] ∈ B(G, μ⁻¹) in its orientation; HS2.16 gives transitivity for minuscule μ and, for general μ, under the finite-level openness hypothesis, as the README says.
- ArithmeticGaloisRepresentations §§1.1, 7.6 (lines 780, 4862); ShimuraData §3.8 with `parabolicTypeVariety` (lines 529, 535); AutomorphicBundles §0.4 with `associatedCoefficient` (lines 534, 536); AlgebraicModuliForArithmeticGeometry §1.7 with `rankLocus` (lines 977, 979); DeligneWeightsAndPurity §2.2 (line 1093, the Sp(V) case).
- On main: `TauCetiRoadmap/ReductiveGroupsPartII/README.md` RG2.0.2, RG2.0.4, RG2.1.5 (lines 591, 853, 2447; *smooth-morphism-open-map* 632, *smooth-group-analytic-charts* 641, *points-topological-group* 620, `transcendenceDegree_infinite` 871); `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §0.8 (line 1195, `etale_coordinates` 1225); `TauCetiRoadmap/ReductiveGroups/README.md` Layers 1, 2, 3, 6, 7, 10 and 10B (lines 1276, 1500, 1538, 2449, 2822, 5304, 5379; root-subgroup generation, highest-weight order and convex-hull bounds at 5424); `TauCetiRoadmap/DiamondsAndVStacks/README.md` D0.6, D3.10, D5.3, D5.16, D6.5 (lines 1059, 5442, 7083, 8396, 9036).

Pinned declarations opened (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the `rev` entries of `lake-manifest.json`), each on its own line with the hypotheses the README states:

- `Mathlib/RingTheory/WittVector/Isocrystal.lean:179` `isocrystal_classification` (`IsAlgClosed k`, `finrank = 1`); `Mathlib/RingTheory/AlgebraicIndependent/Defs.lean:54`; `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:43` and `:142` (`Flat`, `LocallyOfFinitePresentation`); `Mathlib/RingTheory/Etale/Field.lean:194` (`EssFiniteType`).
- `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean:101` (finitely generated Hopf ideal, a line in an exterior power, a unique character, stabilizer over every value algebra); `…/Tannaka/Equivalence.lean:188`; `…/Tannaka/GroupFunctor.lean:138`; `…/Derived/Basic.lean:69`; `…/Derived/Functoriality.lean:68`; `…/Derived/Connected.lean:153` (`Algebra.FiniteType`, connected spectrum); `…/Derived/Image.lean:97` (finite type, injective coordinate map, `IsAlgClosed L`) and `:113`; `…/Isogeny/Basic.lean:78`.
- `TauCeti/Topology/Algebra/PointTopology/Basic.lean:83`, `:110`; `…/Group.lean:102` (`IsTopologicalSemiring R`); `…/Functoriality.lean:110` (`T1Space R`, surjective coordinate map); `…/IntegralPoints.lean:102`, `:116`.
- Named in the Lean docstring: `TauCeti.reductiveCommHopfAlgProperty` (`TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`), `IsParabolic` as a predicate (`TauCeti/Algebra/AlgebraicGroup/Parabolic/Basic.lean:248`), `WittVector.Isocrystal`, `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean`).

Duplication by object: searched main and the open heads for Hodge–Newton irreducibility (no match anywhere), generic filtrations of representations (the three hits are slope filtrations of other objects), the GLX results (cited as inputs only by PadicHodgeTheory, HeckeStacksAndLocalShtukas, BunGAndNewtonStrata and four roadmaps on main), and Zariski density of open subgroups of rational points. DeligneWeightsAndPurity §2.2 states only the Sp(V) case, which the Scope paragraph names; this roadmap owns the general statement (§3.3). AdmissiblePairsAndPadicHodgeStructures defines its connected Mumford–Tate group for pairs over an algebraically closed field (its §2.5) and declares its own gap `strict-field-serre-openness` toward PadicHodgeTheory: two consumers, one owner, no shared target. GaloisActionOnEtaleCohomology names this roadmap once, without a section. `scratch/overlaps.md` lists no changed head, no dropped id and no revision-only id, and none was found by hand.

Overlap check: read AdmissiblePairsAndPadicHodgeStructures, BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, ReductiveGroupsPartIII, PadicHodgeTheory, ReductiveGroupsPartII, ReductiveGroups, AdelicAlgebraicGroups; nothing shared (acceptable classes and decency: BunGAndNewtonStrata; period towers and classical points: HeckeStacksAndLocalShtukas; period torsor and Sen theory: PadicHodgeTheory; split highest weights: ReductiveGroups; each imported here by section).

Declared gaps: `quasisplit-highest-weights` (ReductiveGroups Layer 10, 10B, with Layer 7) and `serre-sen-openness` (PadicHodgeTheory §4.4) carry the same slug and the same sentence in `design/plan.json` and under Exact supplier contracts, name a supplier, state their hypotheses and ask for nothing already supplied (10B is split-only; §4.4 has no openness theorem). They are contracts, and the acceptance is conditional on them.

### Suggested.lean, headlines and padding

`lake env lean` on `packages/PadicHodgeTheoryPartII/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace. With 0 declarations, the one-tactic probe and the `#check @name` audit have no candidate, so nothing can be padding and nothing changed.

| README headline | Named in the docstring | Missing at the pins (searched by object in both libraries) |
|---|---|---|
| §2.3 generic admissibility | yes | σ-conjugacy classes with Newton and Kottwitz invariants (`Kottwitz`: 0 files), a flag variety as a scheme (`FlagVariety`: 0), filtered isocrystals and weak admissibility (0 arithmetic hits) |
| §2.4 generic derived monodromy | yes | crystalline representations (`IsCrystalline`: 0), B_cris (0), Colmez–Fontaine |
| §3.2 open-image period point | yes | B_dR-affine Grassmannian (0) and its admissible locus |
| §3.5 z-extension comparison | yes | the carriers of §3.2 for both groups, z-extensions (0) |
| §§4.1–4.2 components and stabilizers | yes | Spd K and locally profinite torsors (0) |

No statable headline is absent and none is forced through a stand-in. §§3.3 and 3.4 are supporting statements, not headlines of the Summary, and are rightly left to the README.

### Copyright and arrangement

Twenty passages were set beside their sources: the fifteen sampled statements and proof routes, the decency and Hodge–Newton conventions (GLX26 lines 607–627), the gap sentence (GLX26 lines 1464–1490), the §3.1 proof (GLX26 lines 1729–1736), and the first and third bullets of the Lean docstring (GLX26 lines 1591–1594, 1712–1717). The longest shared run is the formulaic hypothesis of §3.2 ("a finite extension … containing the reflex field", GLX26 line 1713, under ten words). The proof routes of §§1.1, 1.2, 2.2, 3.1, 3.4 and 4.1 are argued differently from the sources (dense big cell, lowest weights over the whole orbit, the telescoped rank formula, the transcendence-degree count, the pinned derived-image declarations, finite transitive quotients). No table, figure or list is taken over.

Arrangement against GLX26, the most cited source (its §§5.1, 5.2, 5.3, 6.1–6.7): Layer 0 draws on §5.1 and on Chen14 §§3.1–3.3; Layer 1 on §5.2 and on the estimates inside the proof of Theorem 5.8 in §5.3; Layer 2 on Theorem 5.8 itself; Layer 3 on Lemma 5.10 and Proposition 5.9 of §5.3, on Proposition 6.7 of §6.2 and on two targets (§§3.3, 3.4) with no counterpart there; Layer 4 on Lemma 6.12 of §6.7. Section 5.3 is spread over three layers and no layer equals a section in scope; the order is the one the `*Needs:*` lines force (listed above).

Source independence: 20 passages compared with 5 sources, none shared beyond a formulaic hypothesis; largest share GLX26, 40 of 66 locators; contents compared with GLX26: independent.

## Not verifiable

- The published version of GLX26 (Inventiones) was not opened; every locator is to arXiv v3, as the References and the manifest say, so nothing here depends on the published numbering.
- The board package LawrenceVenkateshMethod is listed in the board index at another pull request's head and is not in this checkout; ownership against it was not checked. The open-roadmap search found no shared object.

## Source issues

- **Misprint** in Chen14 at Lemme 3.3.5, p. 744: the source says the underlying space is a sum of lines over the degree-s unramified field; it should be a sum of lines over K_0 on which that field acts through the indicated embeddings; affects nothing.
- **Error** in Chen14 at Proposition 3.3.4(2) and Proposition 3.3.6(2), pp. 743–745: the source says every representation embeds in a single mixed tensor power of a faithful one; it should allow finite direct sums of such powers (the sum of the trivial and a faithful character of G_m embeds in none); affects a stated result.
- **Error** in GLX26 at Proposition 5.7 and equation (5.29), pp. 36–38: the source says automorphisms of the reflex field index the refined orbits; it should range over all orbits of the smaller Galois group inside the orbit, weighted by cardinality in averages; affects a stated result.
- **Misprint** in GLX26 at equation (5.34), p. 39: the source says the i-th power of Frobenius moves across the pairing unchanged; it should be the inverse power, the sum over a full period being the same; affects nothing.
- **Gap** in GLX26 at Proposition 6.7, step (4), p. 47: the source says openness transfers for a Galois image lying in the derived group of the z-extension; it should first lift derived containment of the Zariski closure, then apply Sen openness; affects the proof.

## For the human reviewers

- **Licence.** MilneiAG (`sources.toml`) is version 2.00 of course notes on the author's page, not a published text; the manifest records it as `open-repository`. It is cited by locator only (§3.4, Proposition 8.20, Corollary 8.21).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dc03a56398ac5405507775ea9100999abe223687", "job": "REV-PKG-PadicHodgeTheoryPartII~5", "model": "fable", "worker": "chris-x91"} -->
