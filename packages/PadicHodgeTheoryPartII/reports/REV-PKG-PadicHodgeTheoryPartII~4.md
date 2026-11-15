<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13046#issuecomment-6895627515 -->
Review (claude) of 5ff5057

Verdict: needs_changes

1. **F01** (P3) Chen14 Proposition 3.3.4 is cited one page too early

   **Location:** `packages/PadicHodgeTheoryPartII/README.md:213`: "(Chen14 Proposition 3.3.4(1), pp. 742–744, and Proposition 3.3.6, pp. 744–745; GLX26 §5.1 ¶15, arXiv v3 p. 33.)"

   **Claim:** Proposition 3.3.4(1) of Chen14 and its proof occupy journal pages 742–744.

   **Witness:** Chen14 line 951 is the running head of journal page 743; the proposition is stated at Chen14 line 966, below it, and its proof ends on page 744 (Chen14 line 1005). Page 742 (Chen14 lines 908–948) ends with Proposition 3.3.3.

   **Exact repair:** in §0.6 replace `Proposition 3.3.4(1), pp. 742–744` by `Proposition 3.3.4(1), pp. 743–744`. Tested on the refuting instance: page 743 holds the statement (line 966) and page 744 the end of the proof (line 1005). Pattern search: the other Chen14 page locators of the README (§3.1 pp. 739–740; 3.2.1(2) pp. 740–741; 3.2.3 pp. 741–742; 3.3.1 and 3.3.2 p. 742; 3.3.3 pp. 742–743; 3.3.5 p. 744; 3.3.6 pp. 744–745; 4.2.2 p. 747; 5.0.6(1) pp. 750–751) were each checked against the running heads and are right. The manifest entry needs no change (it lists the proposition without a page).

2. **F02** (P3) line locator of `AlgebraicIndependent` is off by one

   **Location:** `packages/PadicHodgeTheoryPartII/README.md:43`: "`AlgebraicIndependent` (`Mathlib/RingTheory/AlgebraicIndependent/Defs.lean`:53) is injectivity of multivariable polynomial evaluation over the stated coefficient ring."

   **Claim:** the declaration is at line 53 of that file at the pin.

   **Witness:** at the pinned Mathlib (`1b1ccf4b`), `Mathlib/RingTheory/AlgebraicIndependent/Defs.lean:54` is `@[stacks 030E "(1)"] def AlgebraicIndependent : Prop :=`; line 53 is the last line of its docstring.

   **Exact repair:** replace `Defs.lean`:53 by `Defs.lean`:54. Pattern search: the other nineteen file-and-line locators of the supplier contracts (Mathlib 179, 142, 43, 194; Tau Ceti 101, 188, 138, 69, 68, 153, 97, 113, 78, 83, 110, 102, 110, 102, 116) were opened at the pins and each is the declaration's own line.

Two P3 locator findings, no P1 or P2. The round-3 finding is repaired. The mathematics of every sampled target and every headline survives the computed pass below; the dependency check and the elaboration are clean. A package is accepted only with nothing to repair, so the two locator slips keep this round at needs changes; each repair is a one-token edit.

## Verified sound

### The round-3 finding

- **F01 (VB0 label) — repaired.** README line 67 now reads "Layer 1 supplies, for every finite extension E of Q_p with residue cardinality q …", and lines 19, 43, 172, 193, 246, 357 and 407 cite "VectorBundlesAndIsocrystals Layer 1". `VB0` occurs nowhere in the README. At the supplier's open head, "Layer 1: Finite isocrystals and division algebras" is at `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:210` and the four quoted subsection titles at lines 214, 256, 280 and 296. The repair changed labels only; the rows for §§0.4, 0.5 and 2.1 below recompute the statements that cite the relabelled supplier. No finding of the repair report was marked not actionable, and none is re-raised. The repair report's note that `design/plan.json` still says VB0 outside its `gaps` list is correct and is outside the files under review.

### Principles, shape and style

Read the whole README (520 lines: 25 numbered targets, 25 Needs clauses, 83 Check bullets), `Suggested.lean`, `metadata.toml` and `sources.toml`. No route-specific restriction (ramified and nonquasisplit G, arbitrary μ, p = 2 are kept), no re-planned roadmap (it starts where PadicHodgeTheory §§3.6, 4.4 and 5.5 stop), no algorithm, no sorried data, no `set_option`. The six definitions (§§0.1–0.5, 1.1) have API lists and 3, 3, 4, 4, 5 and 3 Checks. All five layers end with Examples and Dependencies; the upstream headings (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Downstream consumers, References) are present. A mechanical search of both authored files for LaTeX delimiters, HTML anchors, pull-request numbers, machine paths, process words, `lemma` and target-numbering tables returned nothing. Every backticked identifier is a supplier's or a pinned declaration; the README attributes no Lean name to this roadmap, consistently with a `Suggested.lean` that declares nothing.

### Seeded source sample (all 15 targets read at the cached text)

No locator is flagged unverified by the author. GLX26 is read in arXiv v3, the version the manifest and the References name.

| Target | Locator opened | Result |
|---|---|---|
| 0.1 | GLX26 (5.2), line 1302, p. 32 | Degree by membership in step i and not i+1; matches. |
| 0.2 | GLX26 (5.4), lines 1312–1316, p. 33 | Sum over i from 0 to s−1 of the degrees of the iterates; matches. |
| 0.4 | Chen14 lines 781–820 (pp. 739–740), 933–943 (p. 742); GLX26 line 1289 (p. 32) | Fibre functor by normalized φ^s-fixed vectors, k algebraically closed, s-decent identification; matches. |
| 0.5 | Chen14 lines 1008–1023 (p. 744), 1045–1056 (p. 745) | Classification by Z^s, Hom description by the image of e_0, strictness from admissibility; matches, with the misprint the README names. |
| 0.6 | Chen14 lines 966–1005 (pp. 743–744), 1028–1038 (pp. 744–745); GLX26 lines 1319–1322 (p. 33) | Statement supported; page range of 3.3.4 is R01. |
| 0.7 | Chen14 lines 896–911 (pp. 741–742), 946–954 (pp. 742–743); GLX26 lines 1289–1299 | Full closure equals the tensor group; comparison over B_cris; matches. |
| 1.1 | GLX26 lines 1340–1458 (pp. 33–35); Chen14 line 1133 (p. 747) | Definitions 5.3, 5.5, (5.8)–(5.9), Propositions 5.4, 5.6; matches. |
| 1.5 | GLX26 lines 1656–1685 (p. 39) | (5.30)–(5.36); the source moves σ_0^i across the pairing with a positive exponent, harmless after the full-period sum; the README's inverse exponent is the correct termwise form. |
| 2.2 | Chen14 lines 1346–1358 (p. 751); GLX26 lines 1605–1608 (p. 38) | Upper semicontinuity of t_H of a fixed subobject, generic value at most the value at a weakly admissible point; matches. |
| 2.4 | GLX26 lines 1591–1711 (pp. 37–40) | Hypotheses decent, generic, [b] ∈ B(G,μ), HN-irreducible all retained. |
| 3.1 | GLX26 lines 1727–1736 (p. 40); Stacks lines 3743, 3577, 3611, 2128 | Lemma 5.10; tags 054L, 02GL, 03WT, 01UA carry the numbers the References give. |
| 3.4 | MilneiAG lines 5283–5299 (p. 131); GLX26 lines 1991–1992 (p. 47) | Commutator generation and connectedness; the source's crystalline step is as the README describes it. |
| 3.5 | GLX26 lines 1920–1950 (pp. 45–46), 1991–1999 (p. 47) | Identification of admissible loci after base change; matches. |
| 4.1 | GLX26 lines 2158–2171 (p. 51) | Orbit descends to one component; stabilizer conjugate to the image; matches. |
| 4.2 | GLX26 lines 2142–2176 (pp. 50–51) | Equivariance and transitivity as separate inputs; matches. |

Also opened: GLX26 lines 594–627 (p. 15: (2.6), (2.7), Definitions 2.1 and 2.3, ¶4), 1459–1585 (¶18, Proposition 5.7), 1750–1766 (Theorem 6.1); Serre79 lines 42–45 (standing hypothesis: residue field algebraically closed) and 125 (Théorème 1, p. 158); Chen14 lines 856–858 (Proposition 3.2.1), 1320–1342 (p. 750).

### Computed adversarial pass

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions: Tate sign | G_m, b = p^m, μ = z^h | t_N = m, t_H = h; admissible iff m = h; object (p^m σ, jump m) is D_cris of Q_p(−m), so ξ = χ^(−m); supplier convention Q_p(1): φ = p⁻¹, jump −1 | consistent in §§0.3, 0.6, 0.7, 2.3 |
| Conventions: σ_0^s = 1 | ramified quasisplit group, s = 1 | a Frobenius lift fixing the totally ramified splitting field acts trivially; on inertia averages every lift does | attainable after enlarging s |
| 0.1 jump | Fil = V, Ke_1 (0 ≤ i ≤ 2), 0; zero vector | e_1: 2; e_2: −1; e_1+e_2: −1 = min(2, −1); zero lies in every step, no jump | holds |
| 0.2 degree sum | s = 0, 1; involution (1, −1); 3-cycle (2, 0, −5) | 0; d; 0 (wrong model 2); d_2 = 2, d_3 = −3 | holds |
| 0.3 tested sets | GL_2, b = diag(p,1), s = 1, Fil^1 = Ke_1 | e_1: (k, d) = (1, 1); e_2: (0, 0); e_1+e_2 not a Newton eigenvector | not additive, as stated |
| 0.4 fibre ω_s | unit; block φe_1 = e_2, φe_2 = pe_1, s = 2; φ = pσ; decent b | rank 1; φ² = p·σ², fixed space of rank 2; unnormalized fixed space 0 against normalized rank 1; φ^s = p^(sλ)σ^s on N_λ gives V ⊗ Q_(p^s) | holds |
| 0.5 rank-one objects | X(1, −1), s = 2; wrap p; T = G_m², μ = (0,1) | det φ = ±p^k, t_N = k = Σd_i = 0; stable lines F(e_0 + ce_1), cσ(c) = 1, t_H = −1 ≤ 0; wrap p gives t_N = 1 ≠ 0; e_1+e_2 has jump 0, its projection jump 1 (pair not admissible) | holds; admissibility needed |
| 0.5 Hom description | v with φ^s v = p^k v | weight components satisfy σ^s v_λ = p^(k−sλ) v_λ, forcing k = sλ and v_λ rational over Q_(p^s); strictness upgrades deg ≥ d_i to equality | holds |
| 0.6 line criterion (R01) | G_m, m ≠ 0; b = 1, μ = 0, GL_2 | H_cris = G_m with vector-fixing giving 1; lines of V ⊕ 1 force scalar 1; irreducibles alone give the centre, dimension 1 | statement holds; locator is R01 |
| 0.7 comparison | trivial pair; G_m, m ≠ 0; torus | H = H_cris = 1; both G_m; 1 ⊆ H° | holds |
| 1.1 generic filtration | GL_2 std and det; cubic torus Q_5(5^(1/3)) | Fil^1_gen std = 0, rational flag gives ke_1; det jump 1; 3 ∤ 5−1 so E is not normal, E ⊗ E = E × quadratic, Fil^1_gen = 0 | holds |
| 1.2 threshold | cubic torus; GL_2 | m_O = min(1, 0, 0) = 0; std 0, det 1; a formula over Gal(E/k) = {1} would give 1 | holds in both directions |
| 1.3 orbit bound | sizes (1, 2), pairings (0, 3); cubic torus | 0 ≤ (0 + 6)/3 = 2; 0 ≤ 0 ≤ 1/3 | holds |
| 1.4 transport | Res of Q_(p²), s = 2 | (x, y) ↦ (σy, σx): factors swapped | holds |
| 1.5 full-period bound | G_m; basic GL_2, s = 2; ms against s | m = m; d_2 ≤ 0 < 1 = k, so the tested set is empty; φ^s acts by an element of G(Q_(p^s)), so d_(ms) = m·d_s | holds |
| 1.6, 1.7 | GL_2 ν = (a, b); SL_2 c > 0; ordinary GL_2 c = 0 | lowest pairing b ≤ k/s; −cn < 0 contradiction; 0 ≤ 0 ≤ 0 with ⟨λ, α^∨⟩ = 1 | strictness needed, as stated |
| 2.2 semicontinuity | plane, fixed line L; whole plane | t_H = A·r + Σ dim(D ∩ Fil^i) (telescoping checked); 1 at ℓ_x = L, 0 elsewhere; whole plane 1 | holds |
| 2.3 generic admissibility (headline) | ordinary GL_2; G_m; basic GL_2 | slope-zero line: 1 > 0 at the bad flag, 0 = 0 generically; m = h; simple isocrystal, 1 = 1 | holds |
| 2.4 derived monodromy (headline) | basic GL_2; ordinary GL_2; torus | μ^◇ − ν = (1/2)α^∨, empty tested set, SL_2 ⊆ H°; c = 0: e_2 ∈ V^(1,0), Fe_2 weakly admissible, ξ reducible; 1 ⊆ H° | HN hypothesis needed |
| 3.1 generic points (R02) | P¹_E; n = 0 | one coordinate transcendental over E; X = Spec E and K = FE | holds; line locator is R02 |
| 3.2 open-image point (headline) | basic GL_2; norm-one torus, μ = 0, κ(b) ≠ 0 | open subgroup of H(Q_p) meets SL_2(Q_p) openly; 1 ≠ 0 in Z/2, no admissible point | holds |
| 3.3 density | 1 + pZ_p, also p = 2; SO(2) in O(2); diagonal compact subgroup | closure G_m; closure SO(2) ≠ O(2); dimension 2 < 4 | holds |
| 3.4 central lifting | GL_2 → PGL_2 with J = GL_2, SL_2, torus; det | 3 → 3, kernel μ_2; hypothesis fails for the torus; det: f(J°) ⊇ 1 but J° ⊉ SL_2 | central kernel needed |
| 3.5 z-extension (headline) | GL_2 → PGL_2, p odd and p = 2 | index of the image of SL_2(Q_p): 4 and 8, open and proper; f(H̃°) = H° by finite index and connectedness | both directions hold |
| 4.1 components (headline) | ξ = 1; C = {1, diag(1, −1)}, g = [[1,1],[0,1]] | stabilizer 1; gCg⁻¹ ∋ [[1,−2],[0,−1]] ∉ C, also for p = 2 | holds, non-abelian case |
| 4.2 stabilizers (headline) | trivial ξ for GL_2; Y a point; torus | {1} not open in SL_2(Q_p); stabilizer all of G(Q_p); automatic | open-image hypothesis needed and stated |
| Declared gaps | split G; cubic torus; n = 0 or finite image | orbit size 1; one orbit of size 3 with three geometric lines; image open in a finite closure | precise and minimal |

### Suppliers, ownership and the merge order

Dependency check output:

```text
depcheck: 245 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every supplier is earlier in the merge order or on main (ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations and DiamondsAndVStacks are on main at `1a19c9f`).

Each cited section was resolved at the supplier's present head: PadicHodgeTheory §§3.3, 3.4, 3.6, 4.4, 5.5 (lines 683, 706, 755, 895, 1072; the filtered fibre functor and neutrality at lines 767 and 1113; Sen's zero-operator theorem at line 899 is for finite K/Q_p, so the strict-field openness is a real extension); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1, R07.3.2 (lines 4628, 4701; `FilteredPhiNModule.IsWeaklyAdmissible` is supplier notation at line 4705, which settles the one lead of the citation resolver); PadicLocalLanglandsForGL2Qp §0.2 (line 241; it names its exact-category API collectively, and PadicHodgeTheory line 716 and FiniteFlatGroups line 4715 read it, as this roadmap does, as strict morphisms and an abelian extension-closed subcategory); VectorBundlesAndIsocrystals Layer 1; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8 (lines 1117, 1131, 1150, 1230); BunGAndNewtonStrata §§1.7, 1.8, 1.9, 1.12, 1.23, 1.43 (lines 375, 400, 451, 510, 694, 1027); HeckeStacksAndLocalShtukas §§HS2.11–HS2.13, HS2.15, HS2.16 (lines 1441, 1487, 1531, 1581, 1647; its μ⁻¹ convention agrees with the Conventions here); ArithmeticGaloisRepresentations §§1.1, 7.6 (lines 780, 4862); ShimuraData §3.8 (line 529); AutomorphicBundles §0.4 (line 534); AlgebraicModuliForArithmeticGeometry §1.7 (line 977); DeligneWeightsAndPurity §2.2 (line 1093); and on main `TauCetiRoadmap/DiamondsAndVStacks/README.md` D0.6, D3.10, D5.3, D5.16, D6.5 (lines 1059, 5442, 7083, 8396, 9036), `TauCetiRoadmap/ReductiveGroupsPartII/README.md` RG2.0.2, RG2.0.4, RG2.1.5 (lines 590, 852, 2446, with `transcendenceDegree_infinite` at 870), `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §0.8 (line 1194, `etale_coordinates` at 1224) and `TauCetiRoadmap/ReductiveGroups/README.md` Layers 1, 2, 3, 6, 7, 10 and 10B (lines 1275, 1499, 1537, 2448, 2821, 5303, 5378; root-subgroup generation and convex-hull bounds at 5423).

Pinned declarations opened (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): all 21 named in the supplier contracts, with their hypotheses as the README states them (`isocrystal_classification` needs an algebraically closed residue field and finrank 1; `mapPointsFunctor_derivedMap_app_surjective` needs finite type, an injective coordinate map and an algebraically closed value field; `faithfullyFlat_derivedMap` an algebraically closed base and reduced target; `isClosedEmbedding_comap_of_surjective` a T1 value ring), and `TauCeti.reductiveCommHopfAlgProperty` (`TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71`), `WittVector.Isocrystal` and `BDeRhamPlus` named in the Lean docstring. One line number is off by one (R02).

Duplication by object: searched main and the open heads for generic filtrations of representations, Hodge–Newton irreducibility, the GLX and Chen results, Galois-orbit highest weights of quasisplit groups, Serre–Sen openness and Zariski density of open subgroups. No other roadmap states the targets of Layers 0–4. AdmissiblePairsAndPadicHodgeStructures declares its own gap for strict-field Serre openness toward the same supplier, PadicHodgeTheory: two consumers, one owner. DeligneWeightsAndPurity §2.2 is the Sp(V) case the scope paragraph names. The board packages DiamondsAndVStacksPartII and GeometricSatakeAndFusionPartII cite GLX §3 only. `scratch/overlaps.md` lists no changed head, dropped id or revision-only id, and none was found by hand.

Overlap check: read AdmissiblePairsAndPadicHodgeStructures, BunGAndNewtonStrata, ReductiveGroupsPartIII, HeckeStacksAndLocalShtukas, PadicHodgeTheory, ReductiveGroupsPartII, ReductiveGroups, AdelicAlgebraicGroups; nothing shared (acceptable classes and decency: BunGAndNewtonStrata; period towers: HeckeStacksAndLocalShtukas; period torsor and Sen theory: PadicHodgeTheory; each imported here by section).

Declared gaps: `quasisplit-highest-weights` (ReductiveGroups Layer 10, 10B) and `serre-sen-openness` (PadicHodgeTheory §4.4) have the same slug and sentence in `design/plan.json` and under Exact supplier contracts, name a supplier, state their hypotheses, and ask for nothing already supplied (10B is split-only; §4.4 has no openness theorem). They are contracts, not findings.

### Suggested.lean, headlines and padding

`lake env lean` on `packages/PadicHodgeTheoryPartII/Suggested.lean` from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace: 0 declarations, so the one-tactic probe and the `#check @name` audit have 0 candidates and nothing can be padding.

| README headline | Named in the docstring | Missing at the pins (searched by object) |
|---|---|---|
| §2.3 generic admissibility | yes | B(G) with Newton and Kottwitz invariants (no `Kottwitz` anywhere), a represented flag variety, filtered isocrystals with weak admissibility |
| §2.4 generic derived monodromy | yes | crystalline representations with G-structure, B_cris comparison |
| §3.2 open-image period point | yes | B_dR-affine Grassmannian and its admissible locus |
| §3.5 z-extension comparison | yes | the carriers of §3.2 for both groups, z-extensions |
| §§4.1–4.2 components and stabilizers | yes | diamonds, Spd K, locally profinite torsors |

No statable headline is absent and none is forced through a stand-in.

### Copyright and arrangement

Seventeen passages were set beside their sources: the fifteen sampled statements and proof routes above, the decency and Hodge–Newton conventions against GLX26 lines 607–627, and the Lean docstring's first two bullets against GLX26 lines 1591–1594. The longest shared run is seven words, in the hypothesis of §3.2 against GLX26 line 1712, a formulaic statement; the proof routes of §§1.1, 1.2, 2.2, 3.1, 3.4 and 4.1 are argued differently from the sources (dense big cell, lowest weights of the whole orbit, the telescoped rank formula, the transcendence-degree count, the pinned derived-image input, finite transitive quotients). No table, figure or list is taken over.

Arrangement against GLX26, the most cited source: Layer 0 draws on its §5.1 and on Chen14 §3; Layer 1 on §5.2 and on the estimates inside the proof of Theorem 5.8 in §5.3; Layer 2 on Theorem 5.8; Layer 3 on Lemma 5.10 and Proposition 5.9 of §5.3, Proposition 6.7 of §6.2 and two targets (§§3.3, 3.4) with no counterpart there; Layer 4 on Lemma 6.12. The layers do not map one to one with equal scope onto its sections, and the order is forced: §§1.1, 1.5, 1.6 need §§0.1–0.3; §2.4 needs §§0.6, 0.7 and 1.5–1.7; §3.2 needs §§2.3–2.4; §4.2 needs §3.2.

Source independence: 17 passages compared with 5 sources, none shared beyond a formulaic seven-word hypothesis; largest share GLX26, 40 of 68 locators; contents compared with GLX26: independent.

## Not verifiable

- The published version of GLX26 (Inventiones) was not opened; every locator is to arXiv v3, as the References and the manifest say, so nothing here depends on the published numbering.
- The board package LawrenceVenkateshMethod is listed in the board index at another pull request's head and is not in this checkout; ownership against it was not checked. The open-roadmap search (which covers MordellLawrenceVenkatesh) found no shared object.

## Source issues

- **Misprint** in Chen14 at Lemme 3.3.5, p. 744: the source says the underlying space is a sum of lines over the degree-s unramified field; it should be a sum of lines over K_0 on which that field acts through the indicated embeddings; affects nothing.
- **Error** in Chen14 at Proposition 3.3.4(2) and Proposition 3.3.6(2), pp. 743–745: the source says every representation embeds in a single mixed tensor power of a faithful one; it should allow finite direct sums of such powers (for G_m and the trivial pair part (2) gives G_m, not 1); affects a stated result.
- **Error** in GLX26 at Proposition 5.7 and equation (5.29), pp. 36–38: the source says automorphisms of the reflex field index the refined orbits; it should range over all orbits of the smaller Galois group inside the orbit, weighted by cardinality in averages; affects a stated result.
- **Gap** in GLX26 at Proposition 6.7, step (4), p. 47: the source says openness transfers for a Galois image lying in the derived group of the z-extension; it should first lift derived containment of the Zariski closure, then apply Sen openness; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5ff5057fc18a482e086f2b038b4b10cda887ab41", "job": "REV-PKG-PadicHodgeTheoryPartII~4", "model": "fable", "worker": "chris-x79"} -->
