<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13169#issuecomment-6851365548 -->
Review (claude) of 608e1cc

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Three page locators into Ding stop one page short of the proof they cite

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:874` (§4.5): "Ding, proof of Proposition 3.1 and of Lemma 3.10, arXiv v2 pp. 37 and 43"; `README.md:1632` (§10.3): "Ding, Lemma 3.15 and its proof, arXiv v2 p. 48"; `README.md:1668` (§10.6): "Proposition 3.19, (3.36) and its proof, arXiv v2 p. 50".

   **Claim:** Each cited proof is on the page given.

   **Witness:** DING25 line 1752 is the marker of page 44 and the proof of Lemma 3.10 is lines 1761–1789. Line 1966 is the marker of page 49 and the proof of Lemma 3.15 is lines 1964–1973. Line 2044 is the marker of page 51 and the proof of Proposition 3.19 is lines 2047–2052.

   **Exact repair:** In §4.5 replace "pp. 37 and 43" by "pp. 37 and 44". In §10.3 replace "arXiv v2 p. 48" by "arXiv v2 pp. 48–49". In §10.6 replace "and its proof, arXiv v2 p. 50" by "and its proof, arXiv v2 pp. 50–51". Tested against the same page markers: §9.2 already cites Lemma 3.10 with its proof as "pp. 43–44" (`README.md:1496`), which is right, and the other Ding page locators of Layers 8–10, and those of 1.7, 1.9, 1.10, 5.3, 5.5 and 6.7, agree with the markers (list under the seeded sample). `sources.toml` carries none of the three pages and needs no change.

One finding, P3; none blocking. Both round-6 findings are repaired, the repairs are sound, and the repaired patterns do not recur. All 86 numbered targets were read again this round and the 15 seeded targets were checked against the source texts at their locators; the mathematics stands. `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean` elaborates with exit 0 and no output; the dependency check reports 0 problems. No author file and no manifest entry was changed by this review; no source was fetched.

## Verified sound

### Previous findings, checked first

| Round-6 finding | Repaired passage (`packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`) | Status |
|---|---|---|
| F01 (P3): layer Dependencies lines omit items of their Needs lines | Line 1586: "Layers 0, 1, 4, 5, 6, 8." Line 798: "Layers 0 and 2; LocallyAnalyticDistributions §0.0; VStackSheavesAndLisseCategories §§VS2.1–VS2.2; …". Line 341 gains `UniversalEnvelopingAlgebra.lift` and `BarrelledSpace`. | **Repaired.** |
| F02 (P3): §2.5 Check used B = ℚ_p, not an E-space | Line 619: "applied to the trivial character B = E, a one-dimensional E-Banach representation, and M = c_0(ℕ, ℚ_p), since E ⊗̂_(ℚ_p) c_0(ℕ, ℚ_p) = c_0(ℕ, E) for E finite over ℚ_p". | **Repaired.** |

Adversarial pass on the changed passages:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Layer 9 Dependencies | Needs lines of 9.1–9.7 | 9.1: 8.7, 8.1, 5.1, 0.9, 1.5. 9.2: 8.5, 6.3, 6.5, 4.5. 9.3: 8.7, 1.4. 9.4: 8.12, 8.9. 9.5: 0.9, 1.4, 1.5, 5.1, 6.7. 9.6: 8.14, 8.12. 9.7: 8.12, 8.8. Union of layers {0, 1, 4, 5, 6, 8} | Equals the line |
| Layer 3 Dependencies | Needs lines of 3.1–3.10 | 3.1 cites LocallyAnalyticDistributions §0.0, VS2.1, VS2.2, PadicLocalLanglandsForGL2Qp §0.1; 3.8 cites 2.3, 2.5; 3.10 cites 0.3 and LocallyAnalyticDistributionsPartII §2.5; all are in the line | Covered |
| Layer 0 Dependencies | Needs lines of 0.1–0.9 | Mathlib names cited: `LieGroup` (0.1), `BarrelledSpace` (0.2), `PolynormableSpace.banach_steinhaus` (0.2, 0.3, 0.5), `UniversalEnvelopingAlgebra`, `UniversalEnvelopingAlgebra.lift` (0.3): 5 of 5 in the line | Covered |
| Same pattern, Layers 1, 2, 4–8, 10 | Needs against Dependencies | Layer 2: §0.3 of NoncommutativeAndEquivariantIwasawa (2.1) and LocallyAnalyticDistributions §0.0 (2.3) present. Layer 5: 4.6 (5.4) gives Layer 4, present. Layer 7: 0.3 (7.3), 4.4 (7.6) present. Layer 8: 2.2 (8.6), 5.3 (8.1) present. Layer 10: 6.6 (10.2), 7.2 (10.4) present | No further instance |
| §2.5 Check, B = E, M = c_0(ℕ, ℚ_p) | E = ℚ_p(√p); E = ℚ_p | B′ = E = E[[ℤ_p]]/(augmentation), one generator: admissible. E ⊗_(ℚ_p) c_0(ℕ, ℚ_p) = c_0(ℕ, ℚ_p)², norm max(\|a_n\|, p^(−1/2)\|b_n\|), equivalent to that of c_0(ℕ, E). Dual of c_0(ℕ, E) is ℓ^∞, killed by the augmentation ideal, infinite-dimensional: not admissible | Check true |
| §2.5 Check, acyclicity computed directly | G = ℤ_p, trivial action, level n, coordinate y = x/p^n | H¹ at level n is the cokernel of f(y+1) − f(y) on power series with coefficients tending to 0; antidifference of y^k is B_(k+1)(y)/(k+1), with denominators at most p·p^(v(k+1)) (von Staudt). At level n+1, y = pz multiplies the k-th coefficient by p^k, which absorbs them for every p, including p = 2 | Transition n → n+1 is zero, as the Check says |
| §2.5 tensor clause, independent route | X_n = B ⊗̂ C^an(G_n, ℚ_p), M = c_0(I, ℚ_p) | Cochains with values in c_0(I, X_n) are null families of cochains. The pairs (z, y) with τ(z) = dy form a Banach space mapping onto the cocycles; the bounded-lift form of the open mapping theorem gives ‖y_j‖ ≤ C‖z_j‖, so a null family of cocycles becomes a null family of coboundaries at the same later level | Clause holds; see the Gap under Source issues |
| Same pattern (a ℚ_p-space as an E-representation) | grep of `⊗̂_(ℚ_p)`, `(ℕ, ℚ_p)`, `B = ℚ_p` | Remaining uses (2.3, 3.8, 3.9) tensor an E-representation with the ℚ_p-Banach space C^an(G_n, ℚ_p) | No further instance |

Settled items, not counted and not re-raised: round-3 F05 (irreducibility outside type A for p ≤ 3) and F06 (SpringerResolutionAndCharacteristicCycles §10.4 still builds principal-block Verma modules without importing Layer 4; its head, README lines 12, 22 and 1215, is unchanged in this respect). Neither stated reason has become wrong.

### Seeded source sample (15 targets, all read at the locator)

| Target | Passage opened | Result |
|---|---|---|
| 2.2 | EMJ2 lines 131–134 (Definition 0.12, p. 3), 137–140 (remark, p. 4); EM17 lines 6696–6701 (Proposition 6.5.9, p. 134) | Definition and both directions agree; the converse for compact G is (ii) ⇔ (iii) of 6.5.9. The Banach target is "admissible continuous", not unitary, as 2.1 requires |
| 2.3 | PAN22 lines 426–442 (§2.1.1, pp. 10–11), 510–513 (Lemma 2.1.5, p. 12), 522–523 (Lemma 2.1.8, p. 12), 537–545 (Definition 2.2.1, pp. 12–13) | Norm sup ‖p^(n\|k\|)b_k‖, both acyclicity notions and the two lemmas agree; the source is over ℚ_p, the README over E by ⊗̂_(ℚ_p) |
| 3.1 | RJRC22 lines 102–107 (§1.2.1, p. 3), 111–118, 784–786 (Corollary 3.17, p. 16), 1279–1284 (Theorem 3.40, p. 25); BCGP25 lines 955–957 (Proposition 2.2.9, p. 20), 979–980 (Lemma 2.2.14, p. 21) | (i)–(iv) supported; Banach and Smith roles in (iii) as in 3.17 |
| 3.4 | BCGP25 lines 1044–1054 (§2.2.20, Definition 2.2.21, Remark 2.2.22, p. 22); RJRC22 lines 119–121 (§1.2.2, p. 3) | Solidified ring, the formula over a compact open M_0 and both forms of the definition agree |
| 3.10 | BCGP25 lines 2444–2449 (Definition 3.4.2, p. 53), 2450–2460 (Proposition 3.4.3, p. 53), 1112–1117 (§2.2.29, p. 23, groups G_r) | Stagewise actions of shrinking groups inducing the Lie action; the README states the direction of restriction correctly (see Source issues) |
| 4.5 | OS15 lines 356–364 (Example 2.10, p. 9); DING25 lines 1501–1502 (proof of Proposition 3.1, p. 37), 1761–1765 (proof of Lemma 3.10, p. 44); HUM08 uncertified | Statement recomputed (table below); Ding's two uses agree with (ii) and (iii); OS15 lines 356–364 (Example 2.10, p. 9) give the generalised Verma module and the surjection from M(λ). Page of the second Ding passage: R01 |
| 6.2 | OS15 lines 104–105 (main theorem (i)–(ii), p. 3), 716 (Proposition 4.2, p. 18), 868 (Proposition 4.9 a), p. 22); BR16 lines 412–413 (Théorème 2.3(ii), p. 10) | Functoriality and exactness in both arguments |
| 8.4 | DING25 lines 1488–1503 (Proposition 3.1 and proof, p. 37) | (1)–(4) agree; the README replaces the source's route for (3), as its Source corrections say |
| 8.11 | DING25 lines 1637–1652 ((3.10), (3.11), Proposition 3.6, p. 41), 1692–1695 (Remark 3.9, p. 42) | Bijectivity, dimension n + n·d_K and (2) agree |
| 8.12 | DING25 lines 1659–1691 (Proposition 3.8, (3.12)–(3.15), pp. 41–42), 1696–1701 ((3.16), p. 42) | Agree, with the full index set (Source issues) |
| 9.2 | DING25 lines 1747–1789 (Lemma 3.10 and proof, pp. 43–44) | Conditions (1), (2), multiplicity one and the socle statement agree |
| 9.3 | DING25 lines 1790–1804 ((3.21) and the definition, pp. 44–45), 1816–1818, 1888 | Count, uniqueness, the case P = B and the extension to π_1 agree |
| 9.6 | DING25 lines 1858–1887 (Proposition 3.12, (3.28), (3.29), pp. 46–47), 1888–1905 ((3.30), p. 47) | (1)–(4) agree |
| 9.7 | DING25 lines 1906–1934 (end of §3.1.3, Proposition 3.13, Remark 3.14, pp. 47–48) | Labels, both exact sequences and ζ_F agree |
| 10.4 | DING25 lines 1974–1989 (Proposition 3.16, (3.31)–(3.32), Remark 3.17, p. 49) | Bijection, bound (n + 1) + (n − 1) and Remark 3.17 agree |

Ding page locators checked against the page markers beyond the sample: 8.5–8.10, 8.13, 8.14, 9.1, 9.4, 9.5, 10.1, 10.5, 10.7, and (3.6) p. 39, (2.17) p. 19, §2.1 p. 10 (DING25 lines 1578, 779, 416): all agree except the three of R01. No locator is flagged unverified by the author. Manifest: 29 entries, 26 certified, 3 settled uncertified (SCHN11, NFA02, HUM08); the 29 keys are the 29 reference keys; no local path.

### Adversarial table: sampled targets, headlines, sections without computed rows in round 6

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 (iv) | L = ℚ_p(√p), p odd | √p ⊗ 1 ↦ (√p, −√p); L ⊗ E ≅ E² | Agree |
| 0.3 | χ(x) = σ(x)^k on L^× | g_τ acts by k for τ = σ, 0 otherwise | Agree |
| 0.4 | G = ℚ_p; g = diag(p, 1) | D = ⊕ over ℚ_p/ℤ_p, countably infinite; Ad(g)e = pe | (iii), Checks true |
| 0.6, 1.3 (headline) | χ(x) = x on ℚ_p^× | (g·λ)(v) = λ(g⁻¹v): δ_x acts by x⁻¹ on the dual line | Contragredient as in Convention 3 |
| 0.7 | G = ℤ discrete | Dual of E^ℤ is E^(ℤ); its bounded sets lie in finite-dimensional subspaces; bidual seminorms max over finitely many coordinates | Reflexive, not of compact type |
| 0.8 | c_0(ℕ, E), e_n | Pairing with (1, 1, …) gives 1 for all n | Not weakly null; consistent |
| Layer 0 Examples | p = 3 | Cubes of units of ℤ_3 are ±1 mod 9; 4 is not | Example true |
| 1.2 (iii) | Steinberg of GL_2(ℚ_p) | f ↦ f(0) − f(∞) has stabiliser the split torus, not open; smooth dual is a proper dense D(G, E)-submodule | Abstract simplicity correctly not asserted |
| 1.7, 1.8 (headline) | G = ℤ_p; ℚ_p^× | Ext¹_D(D/T, D/T) = E; Hom(ℚ_p^×, E) has basis valuation, log_p | Agree |
| 1.10 | GL_2(ℚ_p), fixed central character | Abelianisation of PGL_2(ℚ_p) is ℚ_p^×/(ℚ_p^×)², finite: Hom_sm = 0 | Check true |
| 2.1 | x ↦ x on ℚ_p^×; c_0(ℕ, E) trivial | p acts by p: no invariant lattice; dual ℓ^∞ killed by augmentation | Checks true |
| 2.2 | G compact; G = ℚ_p^× | Converse from 6.5.9; x ↦ x embeds in itself | Agree |
| 2.5 (headline) | C(G_0, E); rows above | Shapiro vanishing; transitions zero | Sound |
| 3.1 | V = c_0(ℕ, E) | V^∨ = (∏ O_E)[1/p]; V^∨ ⊗ V is families f_i → 0 uniformly, the identity has ‖e_i^*‖ = 1 | Roles in (iii) not exchangeable |
| 3.4 | M = ℤ_p, finite M | O_E[[T]][1/p]; E[M] | Agree |
| 3.7, 3.8 (headlines) | M = 1; character χ of M_r | Generators E_■[S]; invariant function f(g) = χ(g)v, right translate value χ(h)v | Agree |
| 3.10 | Verma module of sl_2, finest topology | Banach subspaces are finite-dimensional; lowering operator is injective and shifts weights | Not integrable |
| 4.5 | gl_2, λ = (1, 1); gl_3 | s·λ = (3/2, 1/2) ↦ (1/2, 3/2) − ρ = (0, 2). −u·λ = u(−λ − ρ) + ρ, the 𝔟⁻-dot action. [M : L(s·μ)] = 1; factors of M(s_α·μ) are L(x·μ), x ≥ s_α, so L(s·μ) occurs in the parabolic Verma module iff s ∉ W_P. gl_3: second layer has 2 summands, length 6 | (i)–(iii) hold |
| 5.3 | L = ℚ_p(√p), n = 2 | 2(1 + 2) = 6; n + d_L = 4; Hom_σ(L^×) = 2 | Agree |
| 5.4, 5.5 (headline) | Sym^k; Σ = 1, ρ = z^((0,2)) | Upper: H_0 (0, k), H_1 (k + 1, −1). Lower H_1 of 1: (−1, 1) ≠ (0, 2) | Agree; Ext vanishes |
| 6.2 | 0 → K → M⁻(−λ) → L⁻(−λ) → 0 | 0 → F(L) → PS → F(K) → 0 | Contravariant, exact |
| 6.3, 6.4 (headline) | Lower-Borel GL_2 induction | δ_(B⁻)^(−1/2) = \|a/d\|^(1/2); reducible iff χ_2/χ_3 ∈ {1, \|·\|^(−2)}; for φη: iff φ_1/φ_2 = \|·\|^(±1) | Agrees with genericity of 8.1 |
| 6.6 | GL_2(ℚ_p) × GL_2(ℚ_p(√p)) | 2·4 = 8; non-generic first factor 3·4 = 12 | Agree |
| 7.1 | GL_2(ℚ_p), V = 1 | Hom_T(δ_B⁻¹δ_B, 1) = E | Twist U(δ_P) correct |
| 7.5 | ℚ_3^×, 3 ↦ (0 3; 1 0) | X² − 3 irreducible over ℚ_3 | Check true |
| 7.4, 7.6 (headlines) | W of weight −s·λ, π = w(φ)ηδ_B | M⁻(−s·λ)^∨ has socle L⁻(−s·λ), so F of it surjects onto C(I, s); right side Hom_T(z^(s·λ)w(φ)ηδ_B, J_B) | Agrees with 8.6 |
| 8.4 | n = 3 | w = (1 2 3), w′ = (2 3)w: w(w′)⁻¹ = (2 3) ∈ W_1; (1 2) ∉ W_1. Route for (3): F(K) embeds in ⊕ Ind z^(u·λ), socles C(w, u), each also a subobject | (1)–(4) hold |
| 8.5 | n = 3 | w⁻¹(1) = 3 = w′⁻¹(1); forward images 2 and 3. For v ∈ W_i, (vw′)⁻¹({1..i}) = w′⁻¹({1..i}) | Inverse-image label well defined |
| 8.11 | (n, d) = (2, 1), (2, 2) | n(1 + d) = 4, 6; E_2^(0,1) = 0 since s·λ ≠ λ | Agree |
| 8.12 (headline) | (2, 1), (3, 1), (2, 2) | (n + d) + (2^n − 2)d = 5, 10, 8; per w: n + nd − (n + d) = (n − 1)d | Agree |
| 8.14 | n ≥ 2 | n(1 + d) < n + (2^n − 1)d iff n < 2^n − 1; n = 2: 2 < 3 | Proper |
| 9.2, 9.3 | n = 3, blocks (2, 1) | Case (1): i = 1, I ∈ {{1}, {2}}; case (2): I = {1, 2}; block count 2^(n_k) − 2; #S = (2 + 0 + 1)d | Agree |
| 9.4, 9.5 | blocks (2, 1) | n + d + #S = 3 + 4d; source (2 + 3d) + (1 + d) = 3 + 4d | Agree |
| 9.6, 9.7 (headlines) | general n | F: nonempty I ⊆ {1..n − 1}, 2^(n−1) − 1 labels; G: proper I ∋ n, 2^(n−1) − 1; 2(n + 2^(n−1)d) − (n + d) = n + (2^n − 1)d | Agree |
| 10.3–10.7 (headlines) | n = 2, d = 2; general | 2n; (n + 1) + (2^n − 2); n + r + Σ(2^(n_i) − 2) = (n + 1) + #S/d; 2(n + 2^(n−1)) − (n + 1) = n + 2^n − 1 | Agree |

Positive characteristic, the zero ring and inseparable L are excluded by the standing hypothesis that L and E are finite over ℚ_p; p = 2 was tried where a Check depends on p (2.5, 3.3, 3.8, 1.6).

### Lean form, headlines, padding

`lake env lean` on `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean`, run from the content checkout: exit 0, no output. The file has the single `import Mathlib`, one module docstring, the namespace, no declaration, no `sorry`, no `set_option`. The one-tactic probe and the `#check @name` comparison have no input; nothing changed.

Headlines of the Summary and where the docstring names each as not statable: the anti-equivalence and Ext¹ classification (Layers 0–1), Pan's acyclicity (Layer 2), the solid Grothendieck property and comparison (Layer 3), Schraen's spectral sequence and the Orlik–Strauch theorems (Layers 5–6), the adjunctions (Layer 7), Ding's theorems (Layers 8–10). Searched both pinned libraries by object: no coadmissible module, Fréchet–Stein algebra, distribution algebra of a Lie group, category O, solid module or locally analytic representation. No headline is statable; none is forced through a stand-in. All 32 backticked items of the README are library names or library paths; none is presented as this roadmap's own.

Declarations opened at the pins: `Mathlib/CategoryTheory/Abelian/Ext.lean:41`; `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:55`, `:118`; `Mathlib/Analysis/LocallyConvex/Barrelled.lean:90`, `:122`, `:164`, `:192`; `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:51` (`[PartialOrder 𝕜]`, as the docstring says); `Mathlib/Algebra/DualNumber.lean:46`, `:50`; `Mathlib/Algebra/Lie/UniversalEnveloping.lean:65`, `:92`; `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`; `Mathlib/RepresentationTheory/Continuous/TopRep.lean`; `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`; `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`; `Mathlib/Algebra/Category/ModuleCat/Basic.lean:59`; `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`; `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:140–146` (`[IsKilling K L]`, so Verma modules only for Killing algebras, as the docstring says); `TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.lean`; `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45`.

Remark, no change needed: `TauCeti/Topology/MetricSpace/SphericallyComplete.lean:52` defines `TauCeti.SphericallyCompleteSpace`, with every proper space an instance (line 58), which confirms Convention 1's sentence that a finite extension of ℚ_p is spherically complete. The README does not restate the notion; 0.8 takes it through LocallyAnalyticDistributions §0.2, whose Hahn–Banach target states the ball condition itself.

### Suppliers, duplication, merge order

Dependency check output:

```text
depcheck: 208 roadmaps, 1907 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap is line 253 of the merge order.

Citations resolved this round, at main, at the open heads and on the board:

- ReductiveGroups (main): Layers 1, 2, 4, 7, 8, §8.1, Layer 10 §10B at README lines 1275, 1499, 2112, 2821, 3687, 3689, 5378. LieHighestWeight (main): Layers 3, 4, 5, 7, 9 at lines 405, 537, 567, 931, 1432. ReductiveGroupsPartII (main): RG2.0.2, RG2.4.2, RG2.4.4 at lines 590, 5711, 6213, with the five named targets. AdicSpacesPartIII (main) §R3.4 at line 10053; PadicMeasuresIwasawaAlgebras (main) §1.7 at line 909.
- PadicLocalLanglandsForGL2Qp (open head): §0.1 at line 206, §2.4 at 750, §4.8 at 1588. SmoothRepresentationsOfLocalGroups (open head): SR.0.1, 0.2, 0.4, 0d.1, 0d.2, 2.1, 2.2, 2.3, 3.1, 3.2, 3.4 at lines 589, 668, 870, 1676, 1738, 1917, 2046, 2206, 2572, 2711, 2958, and all 19 named targets. CompletedCohomologyPartII F.1, F.4 at lines 184, 242. OverconvergentAutomorphicForms §0.6 at line 316. VStackSheavesAndLisseCategories *Solid nonarchimedean coefficients* at line 734. NoncommutativeAndEquivariantIwasawa §§0.1, 0.2, 0.3, 0.6, 0.7 at lines 151, 178, 210, 304, 334. ArithmeticLocallySymmetricSpaces ALS.4.5 at line 3594. LocallyAnalyticDistributions §0.0 at line 892, §0.2 at 1082, and the nine named targets (lines 896–1136).
- The resolver's one lead is refuted: `packages/LocallyAnalyticDistributionsPartII/README.md:141`, `:164`, `:248` are §§1.1, 1.2, 2.5; that roadmap is line 199 of the merge order.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, none is defined only by a revision. TriangulineVarietyAndItsLocalModel cites the former ids LR.4 and LR.5 (its README lines 19, 118), which the former-numbering table maps.
- The nine declared gaps: same slug in `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/plan.json` and once each under the supplier's contract in the README; each names an earlier supplier. Checked against the suppliers' heads: LocallyAnalyticDistributions has no barrelled-space statement and its *Compact-type tensor comparison* (line 989) states no exactness; PadicLocalLanglandsForGL2Qp §0.1 states coadmissibility for D(H, L) only; SmoothRepresentationsOfLocalGroups *finite-length*, *generic-irreducibility*, *principal-series-jacquet* and *bernstein-centre-blocks* are over ℂ (lines 2625, 2692, 2194, 2800); ALS.4.5 is for Res_(F/ℚ)G. None asks for what is provided. They are contracts and were not raised.
- Object searches over open heads and main (`roadmaps grep`): "very strongly admissible", "LA-acyclic", parabolic category O, Schraen's spectral sequence: no other roadmap. "Orlik–Strauch": only TriangulineVarietyAndItsLocalModel, which imports from here. "coadmissible" in CompletedCohomologyAndLocalGlobalCompatibility is Emerton's notion for smooth modules over a Hecke algebra, a different object. PadicFunctionalAnalysis (main) hands locally convex limits, strong duals and completed tensors to LocallyAnalyticDistributions and has no barrelled-space or weak-convergence target for locally convex spaces.
- No algorithm, machine path, pull-request number, date, HTML anchor or LaTeX delimiter in the README (grep); "lemma" occurs only in prose names such as Shapiro's lemma.

Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, SmoothRepresentationsOfLocalGroups, TriangulineVarietyAndItsLocalModel, LocallyConvexDuality (no roadmap on main and none by results is listed as close); nothing shared: compact distribution algebras and compact-group admissibility are PadicLocalLanglandsForGL2Qp's, the smooth theory SmoothRepresentationsOfLocalGroups', ordinary parts and completed cohomology CompletedCohomologyAndLocalGlobalCompatibility's, real and complex barrelled and nuclear spaces LocallyConvexDuality's (it excludes nonarchimedean spaces, README line 54), and locally analytic induction, the Orlik–Strauch constituents and the σ-analytic Ext theory are this roadmap's, imported by TriangulineVarietyAndItsLocalModel.

Maintainer notes: none were given.

### Shape and organisation

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–10 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition read has its API and at least three Checks (fewest: 3, in 2.2, 3.1, 3.3); every theorem has its hypotheses and a locator. No layer is named after a source's section and no sentence says the roadmap follows a source.

### Copyright and arrangement

Passages set beside the sources: the 15 sampled targets, plus 1.7 (DING25 lines 1449–1460), 7.3 (EMJ2 lines 123–128), 8.2 (DING25 lines 1466–1474), 10.1 (DING25 lines 1935–1939), 2.4 (PAN22 lines 550–570) and 2.5 (PAN22 lines 573–598). The longest shared runs are formulae and standard definitions (a Smith space; a representation as a solid E_■[M]-module), under ten words each. The proof routes of 2.4 and 2.5 have the steps of Pan's proofs in the order the logic forces, in different words.

Arrangement: DING25 has the largest share, about 56 of about 220 locators. Its contents are §§1, 2.1–2.4, 3.1–3.2, 4.1–4.2 (DING25 lines 20–31). Layers 0–7 correspond to no section of it; Layers 8, 9, 10 all lie inside its single §3.1, and §§2, 3.2 and 4 are not in the roadmap. Within §3.1 the order principal series, parabolic induction, σ-analytic is forced here by the Needs lines: 9.1 needs 8.7 and 8.1; 9.2 needs 8.5; 10.2 needs 8.7 and 9.3; 10.6 needs 9.6; 10.7 needs 9.7. No table, figure or list is taken over.

Source independence: 21 passages compared with 8 sources (DING25, PAN22, EMJ2, EM17, RJRC22, BCGP25, OS15, BR16), none shared; largest share DING25, about 56 of about 220 locators; contents compared with DING25: independent.

## Not verifiable

- SCHN11, NFA02, HUM08: settled uncertified books. Their locators (0.1; the barrelled-space gap; 4.3–4.5) cannot be checked against text. The statements of 4.5 that rest on HUM08 were recomputed for gl_2 and gl_3 instead.

## Source issues

- **Misprint** in DING25 at the paragraph after Proposition 3.1 and Lemma 3.2, arXiv v2 p. 37 (DING25 lines 1505, 1510): the source says the label is the forward image of the first i indices under w; it should be the inverse image, constant on the coset W_i·w; affects a stated result.
- **Misprint** in DING25 at (3.1), Lemma 3.2 and (3.8)–(3.9), arXiv v2 pp. 37–40 (DING25 lines 1509, 1511, 1616): the source says the inducing weight is minus the dot-reflected weight; it should be plus, as in its own §3.1.4 (DING25 line 1944); affects a stated result.
- **Misprint** in DING25 at Lemma 3.2(1), arXiv v2 p. 37 (DING25 line 1511): the source says the Hom is over the ℚ_p-points of the torus; it should be over its K-points; affects nothing.
- **Misprint** in DING25 at (3.12) and (3.15), arXiv v2 pp. 41–42 (DING25 lines 1662, 1686): the source says the subsets lie in the first n − 1 indices; it should be all n indices, as the stated dimension requires; affects a stated result.
- **Misprint** in DING25 at §3.1.4, arXiv v2 p. 48 (DING25 lines 1949, 1955): the source says the locally algebraic representation is indexed by λ; it should be indexed by h, as everywhere else; affects nothing.
- **Gap** in PAN22 at Corollary 2.2.4, p. 14 (PAN22 lines 590–598): the source says the tensor identity for cohomology with coefficients in B gives the claim; it should treat coefficients B ⊗̂ C^an(G_n, ℚ_p), not admissible, for example by lifting null families of cocycles with the open mapping theorem; affects the proof.
- **Misprint** in BCGP25 at Definition 3.4.2(1), p. 53 (BCGP25 line 2448): the source says the transitions are equivariant for a map from G_r to G_(r′) with r ≤ r′; it should be the inclusion of the smaller G_(r′) into G_r; affects nothing.

## For the human reviewers

- **Scope.** The Orlik–Strauch irreducibility statements of Layer 6 assume p > 3 outside type A (`packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1013`); the unrestricted statement is open in the literature (OS15 lines 120–122). Whether the roadmap keeps that hypothesis is yours.
- **Ownership.** SpringerResolutionAndCharacteristicCycles §10.4 (its README line 1215) still constructs principal-block Verma and simple modules without citing Layer 4 here; this README claims single ownership (line 13). The edit is in that pull request.
- **Licence.** Three cited sources are preprints with no journal reference in the manifest: BCGP25 (arXiv:2502.20645v1, 12 locators), EMJ2 (author's copy) and OR19 (arXiv:1802.07514v2). Nothing is reused from them beyond statements with locators.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "608e1ccdabcd42ac1033949c5ff2050163fc3af3", "job": "REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~7", "model": "fable", "worker": "chris-x11"} -->
