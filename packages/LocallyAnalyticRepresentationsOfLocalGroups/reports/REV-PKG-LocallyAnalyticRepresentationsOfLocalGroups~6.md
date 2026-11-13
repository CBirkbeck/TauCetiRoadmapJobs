<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13169#issuecomment-6849386936 -->
Review (claude) of 9c0774b

Verdict: needs_changes

1. **F01** (P3) Two layer `### Dependencies` lines omit what their targets' `*Needs:*` lines cite

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1586` (Layer 9): "Layers 0, 1, 5, 6, 8." and `README.md:798` (Layer 3): "Layers 0 and 2; VStackSheavesAndLisseCategories §§VS2.1–VS2.2; AdicSpacesPartIII §R3.4; …".

   **Claim:** Each layer's Dependencies line is the union of what its targets need.

   **Witness:** `README.md:1498`, §9.2: "*Needs:* 9.1, 8.5, 6.3, 6.5; 4.5." Layer 4 is absent from line 1586. `README.md:645`, §3.1: "*Needs:* … LocallyAnalyticDistributions §0.0; …". LocallyAnalyticDistributions is absent from line 798. The nine other layers' lines agree with their Needs lines (compared item by item).

   **Exact repair:** Line 1586 becomes "Layers 0, 1, 4, 5, 6, 8." Line 798 gains "LocallyAnalyticDistributions §0.0;" after "Layers 0 and 2;". Tested: with these, §9.2's 4.5 and §3.1's §0.0 are both covered, and no roadmap-level edge changes (both suppliers are already edges of the dependency check).

2. **F02** (P3) The tensor-clause Check of §2.5 uses a representation outside the stated category

   **Location:** `README.md:619`, §2.5 Checks: "it is strongly LA-acyclic by the B ⊗̂ M clause applied to the trivial character B = ℚ_p and M = c_0(ℕ, E)".

   **Claim:** The clause of §2.5 (B an admissible Banach representation of G in the sense of §2.1, M a ℚ_p-Banach space) applies with B = ℚ_p.

   **Witness:** `README.md:534`, §2.1: a Banach representation is "an E-Banach space B". For E = ℚ_p(√p), ℚ_p is not an E-vector space, so B = ℚ_p is not an object of Ban^adm_E(G). Pan's own statement is over ℚ_p (PAN22 lines 573, 588–589); the README's is over E.

   **Exact repair:** Replace "B = ℚ_p and M = c_0(ℕ, E)" by "B = E and M = c_0(ℕ, ℚ_p), since E ⊗̂_(ℚ_p) c_0(ℕ, ℚ_p) = c_0(ℕ, E)". Tested on E = ℚ_p(√p): B = E is a 2-dimensional admissible E-Banach representation with trivial action, and the completed tensor product is c_0(ℕ, E), the space of the Check.

Two findings, both P3; none blocking. The round-5 finding is repaired and the repair is mathematically sound. `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean` elaborates with exit 0 and no output; the dependency check reports 0 problems. No author file and no manifest entry was changed by this review.

## Verified sound

### Previous finding, checked first

| Round-5 finding | Repaired passage (`README.md`) | Status |
|---|---|---|
| F01 (P2): algebraicity away from σ needs an algebraic group model | §10.1, line 1594: "let 𝐆 be a split connected reductive group over L with split maximal torus 𝐓 and G an open subgroup of 𝐆(L) … the inclusion G ⊆ 𝐆(L) being part of the data"; "lies in the category O^g_alg of 4.2 … for … the group 𝐆_(Σ∖σ) with its torus 𝐓_(Σ∖σ)". Layer 4 preamble, line 802: "𝔤 = Lie(𝐆) for a split connected reductive group 𝐆 over k with split maximal torus 𝐓, both fixed as part of the data". | **Repaired.** Recomputed below. |

Adversarial pass on every changed or added passage:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §10.1 torus Check | L = E = ℚ_3(√3), H = 1 + 3O_L | 1/(p−1) = 1/2 < 1 = v_3 on 3O_L, so log: H ≅ 3O_L. dχ_1 = (0, 1), dχ_(1/2) = (0, 1/2). Pull-back of t^m along inclusion: differential m; along j(g) = g²: 2m. 2m = 1 has no integer solution | Check true; separates the two models |
| §10.1 "equivalently the differential of an algebraic representation" | 𝐆 = GL_2, SL_2 × 𝔾_m, torus; non-reductive 𝔾_a | Finite-dimensional, 𝔥 diagonalisable with weights in X ⇒ semisimple with summands L(μ), μ ∈ X dominant ⇒ integrates to connected split 𝐆. For 𝔾_a, (1 a; 0 1) has trivial factors and nonzero Lie action | Equivalence holds for split connected reductive; reductivity needed, assumed |
| §10.1 (1) stability | v = (v_1, v_2); quotient v̄ | U·(v_1, v_2) ⊆ U·v_1 ⊕ U·v_2; U·v̄ is a quotient of U·v | Follows from 4.2 (i) |
| §10.1 (2) subspace | Baer sum; scalar c = 0, c ≠ 0 | Baer sum is a subquotient of X_1 ⊕ X_2; c = 0 gives V ⊕ W; c ≠ 0 gives an isomorphic middle term | Holds |
| §10.1 (3) | n = 1, L = ℚ_p(√p), V = W = χ | g_τ acts by (μ_τ, dψ_τ; 0, μ_τ); semisimple iff dψ_τ = 0. dim Ext¹ = 1 + 2 = 3, dim Ext¹_σ = 2 | Matches §10.3 (n + 1 = 2) and §5.3 (3) |
| §10.1 degenerate | L = ℚ_p | Σ∖σ = ∅, 𝐆_∅ = 1, g_∅ = 0, X = {0} | Every representation qualifies; Ext¹_σ = Ext¹ |
| §10.1 API, locally algebraic ⇒ algebraic away from σ | GL_2(ℚ_p(√p)), W = std_σ ⊠ std_τ | U(g_τ)·x finite-dimensional with τ-weights (1,0), (0,1) ∈ ℤ² | Holds for G = 𝐆(L), as restricted |
| Layer 4 preamble and §4.2 group Check | 𝔤 = sl_2; SL_2, PGL_2 | ϖ(H) = 1; SL_2: X = ℤϖ. PGL_2: H ≡ diag(2, 0) mod centre, α(H) = 2, X = 2ℤϖ. Standard module weights ±ϖ | In O^g_alg only for SL_2; Check true |
| §4.2 first Check, left as "for gl_2" | GL_2, SL_2 × 𝔾_m, PGL_2 × 𝔾_m | det = (1,1), Sym² = (2,0), (1,1), (0,2): all in ℤ², in ℤ(½,−½) ⊕ ℤ(½,½) and in ℤ(1,−1) + ℤ(½,½) | True for every model; no change needed |
| Supplier contract, ReductiveGroups Layer 4 and §8.1 | main | `TauCetiRoadmap/ReductiveGroups/README.md:2112` (Layer 4), `:3689` (§8.1), `:3711` (SL₂/PGL₂ Check), `:1508` (differential of a homomorphism) | Citations resolve |

The repaired pattern (an algebraicity condition with no group fixed) was searched in §§0.2, 0.3, 1.6, 1.10, 3.10, 4.1–4.6, 5.2, 6.1, 6.6, 10.2–10.7: each names a group (𝐆(L), GL_n, ∏_σ gl_n with GL_n, or 𝔾). No further instance.

Settled items, not counted: round-3 F05 (small-prime irreducibility outside type A, a human scope decision) and F06 (SpringerResolutionAndCharacteristicCycles still builds overlapping Verma objects; its head, README lines 12 and 22, is unchanged in this respect). Neither reason has become wrong; neither is re-raised.

### Seeded source sample (15 targets, all read at the locator)

| Target | Passage opened | Result |
|---|---|---|
| 0.5 | ST02 lines 508–546 (Proposition 3.2, p. 13, proof to p. 14); DLB17 line 1153 (Lemme 5.9, p. 28, proof p. 29) | Separate continuity, module structure, U(g)-extension and D-linearity of G-maps all stated; barrelled hypothesis used in the proof |
| 0.9 | EM17 lines 901, 914 (Props 1.1.31–1.1.32, p. 18), 3861–3865 (Prop. 3.6.18, p. 74); DING25 line 1743 ((3.19), p. 43); BHS19 line 3658 (§5.2, printed p. 390) | Compact-type hypotheses and the route through 3.5.15 and 3.6.12 agree |
| 1.3 | ST03 lines 1223–1257 (§6, p. 31, G arbitrary; Lemma 6.1), 1333–1342 (Theorem 6.3, pp. 33–34) | The theorem is stated for arbitrary locally analytic G; pages agree |
| 1.4 | ST03 lines 1343–1358 (Prop. 6.4, p. 34), 430 and 447 (Lemma 3.6 and closed ideals, p. 11), 401 (Cor. 3.4) | (i)–(iii) are Prop. 6.4; (iv) is Cor. 3.4 with the remark after Lemma 3.6 |
| 1.6 | ST01 lines 519–530 (Prop. 3.4, pp. 13–14); EM17 lines 4370 (4.2.10, p. 85), 6163–6170 (6.3.6, p. 123), 6196–6200 (6.3.10, p. 124), 5643 (6.1.5, p. 112), 6094 (6.3.2, p. 122) | Statements and pages agree; U ⊗_B W with B = End_G(W) |
| 2.5 | PAN22 lines 573–598 (Theorem 2.2.3, p. 13, Corollary 2.2.4, p. 14); CD14 line 1826 (Cor. IV.14, p. 43) | Inclusions C^(G_n-an) ⊂ C^((n+2)) ⊂ C^(G_(n+1)-an) at line 581; source is over ℚ_p (see R02) |
| 3.2 | BCGP25 lines 1000–1038 (§§2.2.15–2.2.16, Remark 2.2.18, pp. 21–22); RJRC22 line 119 (§1.2.2, p. 3) | Coaction axioms, the two cases, D(𝔾) and the functor to modules agree |
| 3.3 | BCGP25 lines 1039–1043 (Remark 2.2.19, p. 22) | Quasi-compact and Banach hypotheses both present |
| 4.2 | OS15 lines 275–325 (§2.5, pp. 7–8), 303–308 (Def. 2.6), 309–313 (Ex. 2.7), 342 (Lemma 2.8, p. 9) | G connected split reductive, X^*(T) through the derivative: supports the repaired preamble |
| 5.4 | SCH11 lines 1157–1173 (Remarque 3.9, printed p. 68), 1766–1773, 1787–1804 (printed p. 82) | Hausdorff condition, (4.40)–(4.42) agree |
| 6.2 | OS15 lines 104–105 (main theorem (i)–(ii), p. 3), 716 (Prop. 4.2, p. 18), 868 (Prop. 4.9 a), p. 22) | Exactness in both arguments |
| 7.2 | EMJ2 lines 63–76 (Lemma 0.3 and the definition, p. 2), 2089–2094 (Lemma 2.8.3, p. 45, §2.8 from p. 44), 2835–2836 (Cor. 5.1.4, p. 60); DING25 lines 1510, 1539, 1653 | Agree; the quasi-split Borel restriction of (ii) is the source's |
| 8.2 | DING25 lines 1466–1474 (§3.1.1, p. 36), 1530 ((3.2), p. 38), 1603 (Remark 3.4, p. 40) | Genericity, η, w(φ) and I_sm agree |
| 8.12 | DING25 lines 1659–1700 (Prop. 3.8, (3.12)–(3.16), pp. 41–42) | Dimension n + (2^n − 1)d_K; the README's index set corrects line 1662 |
| 9.5 | DING25 lines 1819–1852 ((3.25)–(3.27), pp. 45–46) | Construction agrees with the corrected kernel (lines 1837–1839 printed reversed) |

Manifest: 29 entries, 26 certified, 3 settled uncertified; the 29 keys equal the 29 reference keys; no local path. No locator is flagged unverified by the author. No source was fetched.

### Adversarial table: sampled targets, headlines, findings

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Convention 5 | GL_2(ℚ_p), m = diag(p, 1) | Ad(m) on 𝔫 is p; δ_B(m) = p⁻¹; index [N_0 : mN_0m⁻¹] = p | Averaged operator is 1 on the trivial line |
| Convention 7 | n general | η exponent i − 1 from −θ_i; δ_B exponent n + 1 − 2i: first n − 1, last 1 − n | Agree with DING25 line 1468 |
| 0.2 non-example | f = Σ p^n 1_(p^n + p^(2n)ℤ_p), all p | Balls disjoint (v(p^m − p^n) = n < 2n); f(p^n) = p^n; f(3p^n) = 0 for n ≥ 2 | Zeros accumulate at 0, f ≢ 0 nearby |
| 0.5 | χ(a) = (1 + p)^a; trivial representation | x̃ acts by log(1 + p), δ_1 by 1 + p; δ_a and δ_0 both act by 1 | Extension of the U(g)-action; not faithful |
| 0.9 | χ = x^a, χ′ = x^b on ℚ_p^×; finite-dimensional | Derivative of the diagonal twist a + b; dimension dim V_1 · dim V_2 | Agree |
| 1.3 (headline) | G discrete; χ = x on ℚ_p^× | Finite-dimensional duality; δ_x acts by x⁻¹ on the dual line | Variance and contragredient correct |
| 1.4 | D(G, E) for non-compact G | Finitely presented over D(G, E), free of infinite rank over D(H, E) | (iv) correctly restricted to D(H, E) |
| 1.6 | Sym², v = e_1e_2 | u(t)v = e_1e_2 + t e_1²; (u(t) − 1)v = t e_1² | Difference route needed; Hom_g(W, V) is the smooth part (derivative of g⁻¹φ(g·) vanishes) |
| 1.8 (headline) | G = ℤ_p; ℚ_p^× | Corner a, a ↦ (1 a; 0 1); log_p class not smooth; dim Ext¹(1,1) = 2 | Agree with 1.7 |
| 1.10 (2) | E_2^(p,q), H¹ = H² = 0 | E^(n,0) for n ≤ 2 receives d_r only from q = r − 1 ≥ 3, where p < 0 | Isomorphism for n ≤ 2; fails to be forced at n = 3 |
| 2.5 (headline) | C(G_0, E) ≅ C(G_n, E)^(d_n); R02 instance | Shapiro: H^i(G_n, C(G_n, C^an)) = 0 for i ≥ 1; E ⊗̂ c_0(ℕ, ℚ_p) = c_0(ℕ, E) | Theorem sound; Check repaired by R02 |
| 3.2 | 𝔾_m^an, c(v) = v ⊗ T^k; ℤ_p + p𝔻 | x ↦ x^k; a rigid function constant on cosets of p²ℤ_p in pℤ_p is constant | Agree |
| 3.3 | ℤ_p + p𝔻, a ↦ (1 + p)^a, p odd | \|x log(1 + p)\| ≤ p⁻¹ < p^(−1/(p−1)) iff p > 2 | Analytic on the group; p odd needed and stated |
| 3.7, 3.8 (headlines) | M = 1; M_0 = ℤ_2, 𝔾_1 = 2𝔻 | Generators E_■[S]; idempotents 2 against 4 | Agree with the stage-group formulation |
| 4.1 | gl_2, μ = 0 | s·0 = (−1, 1); (1, −1) + ρ = (3/2, −3/2) not in W·ρ | Infinitesimal characters as stated |
| 4.2 | ℚ_3[t]/(t² − 3) | No ℚ_3-root (valuation 1/2); weight-space sum 0 | Not in O; split semisimplicity needed |
| 4.5 | n = 2, λ = (1, 1) | s·λ = (0, 2); ⟨(0,−2) + ρ⁻, (−α)^∨⟩ = −1 | M⁻((0, −2)) simple |
| 4.6, 5.4 | GL_2, Sym^k | Lower: H_0 (k, 0), H_1 (−1, k+1). Upper: H_0 (0, k), H_1 (k+1, −1) = −(s·(0, −k)) | Formulae agree |
| 5.5 (headline) | GL_2(ℚ_p), Σ = 1, ρ = z^((0,2)) | H_0 weight (0,0), H_1 weight (−1,1); neither (0,2) | All Ext vanish, by 5.3 (1) |
| 6.2 | 0 → K → M⁻(−λ) → L⁻(−λ) → 0 | 0 → F(L) → PS → F(K) → 0, contravariant | Agree with 6.1 |
| 6.3, 6.4 (headline) | Ind_(B⁻_2)(χ_2 ⊠ χ_3) | δ_(B⁻)^(−1/2) = \|a/d\|^(1/2); normalised ratio (χ_2/χ_3)\|·\|; reducible iff χ_2/χ_3 ∈ {1, \|·\|^(−2)} | Agree; generic φ gives φ_1/φ_2 ∉ {\|·\|^(±1)} |
| 7.1 | V = 1, U = χ on GL_2(ℚ_p) | ∫ (m·f) = χ(m)δ_B(m) ∫ f, so χ = δ_B⁻¹ | Twist U(δ_P) correct |
| 7.2 | U smooth χ; λ = (1,1), s·λ = (0,2) | Open cell gives χδ_B in the N-Jacquet module; M⁻((0,−2)) simple so I(U) is the full induction | Agree |
| 7.4, 7.6 (headlines) | Smooth δ; simple generalised Verma | Hom_T(δδ_B^(1/2), V_Nδ_B^(−1/2)) = Hom_T(δδ_B, V_N); 7.6 reduces to 7.4 with U(δ_Q) = W′ ⊗ π | Agree |
| 8.1, 8.2, 8.3 | n = 2, 3 | θ^P = (0,−1,−1), (0,0,−2); (1 2 3)(φ) = φ_3 ⊠ φ_1 ⊠ φ_2; z^θ(ε⁻¹ ∘ θ) = η; φ_1 = φ_2\|·\| gives χ_1/χ_2 = 1 | Agree |
| 8.9, 8.11 | λ = (1,1), ρ = z^(s·λ)w(φ)η and ρ = z^λw(φ)η | E_2^(0,1) = E, E_2^(1,0) = 0, E_2^(2,0) = 0; resp. E_2^(0,1) = 0, E_2^(1,0) = Hom(T, E) of dimension n(1 + d_L) | Lines and bijection as stated |
| 8.12 (headline) | (n, d) = (2,1), (3,1), (2,2) | (n + d) + (2^n − 2)d = 5, 10, 8; per w: n + nd − (n + d) = (n − 1)d | Agree |
| 9.2–9.4 | n = 3, blocks (2,1) | Labels {1}, {2}, {1,2}; #S = 3d; dim = n + d + #S = 7 for d = 1 | Agree |
| 9.5 | dim A_i = 1, dim B_i = 2, r = 3 | First graded piece 2 + 2 + 2 = 6; reversed 12; class linear in each X_i | Corrected kernel; additive, not multilinear |
| 9.6, 9.7 (headlines) | n = 3, d = 1; general | Source (2 + 3) + (1 + 1) = 7 = target; 2(n + 2d + (2^(n−1) − 2)d) − (n + d) = n + (2^n − 1)d | Agree |
| 10.3–10.7 (headlines) | n = 2, d = 2 | n + 1 = 3; 2n = 4; n + 2^n − 1 = 5; (5 − 2) + (5 − 2) = 6 = 8 − 2; 4 + 4 − 3 = 5 | Agree |
| R01 | Layers 3 and 9 | §9.2 needs 4.5; §3.1 needs LocallyAnalyticDistributions §0.0; both absent from the layer lines | Repair R01 |

All 86 numbered targets and their Checks were read in this round. Positive characteristic, the zero ring and inseparable L are excluded by the standing hypothesis that L and E are finite over ℚ_p.

### Lean form, headlines, padding

`lake env lean` on `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean`, run from the content checkout: exit 0, no output. The file has `import Mathlib` only, one module docstring, the namespace, no declaration, no `sorry`, no `set_option`. The one-tactic probe and the `#check @name` comparison therefore have no input; nothing changed.

Headlines from the Summary and where the docstring names them as not statable: the anti-equivalence and Ext¹ classification (lines 11–23); Pan's acyclicity (24–27); the solid Grothendieck property and comparison (28–31); Schraen's spectral sequence and the Orlik–Strauch theorems (32–37); the adjunctions (38–40); Ding's theorems of Layers 8–10 (41–46). Checked at the pins: no coadmissible module, Fréchet–Stein algebra, distribution algebra of a Lie group, category O or locally analytic representation exists in Mathlib or Tau Ceti (search by object over both libraries: no hit). No headline is statable; none is forced through a stand-in. No backticked name in the README is presented as this roadmap's own: all 31 backticked items are library names or library paths.

Declarations opened at the pins: `Mathlib/CategoryTheory/Abelian/Ext.lean:41` (`Ext`); `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:55`, `:118` (`HasExt`, `CategoryTheory.Abelian.Ext`); `Mathlib/Algebra/Category/ModuleCat/Algebra.lean:63` (`linearOverField`, which makes `ModuleCat` over a non-commutative E-algebra E-linear); `Mathlib/Analysis/LocallyConvex/Barrelled.lean:90`, `:122`, `:164`, `:192`; `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:51` (needs `[PartialOrder 𝕜]`, as the docstring says); `Mathlib/Algebra/DualNumber.lean:46`, `:50`; `Mathlib/Algebra/Lie/UniversalEnveloping.lean:65`, `:92`; `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`; `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`; `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`; `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`; `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` (namespace at 103); `TauCeti/Algebra/Lie/HighestWeight/Verma.lean` (`VermaModule`, `irreducibleQuotient`, namespace at 134); `TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.lean` (99); `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45`.

### Suppliers, duplication, merge order

Dependency check output:

```text
depcheck: 206 roadmaps, 1907 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap is at line 253 of the merge order; LocallyAnalyticDistributionsPartII is at 199; its consumers (lines 258–260) come later.

- The citation resolver's one lead, LocallyAnalyticDistributionsPartII §1.1, is refuted: the board index lists that package, and `packages/LocallyAnalyticDistributionsPartII/README.md:141`, `:164`, `:248` are §§1.1, 1.2, 2.5.
- ReductiveGroups (main): Layers 1, 2, 4, 7, §8.1, §10B resolved at lines 1275, 1499, 2112, 2821, 3689, 5378.
- PadicLocalLanglandsForGL2Qp (open head): `Ban(η₁, η₂) := Ind^{an}_B^G(η₂ ⊗ η₁χ^{−1})` at README line 1590, central scalar η₁(a)η₂(a)χ(a)⁻¹ at 1608; equal to §5.2's Check after the swap by the Weyl element.
- The remaining supplier sections were resolved line by line in round 5; the overlap facts list no dropped id, no revision-only id and no conflicting head, and the object searches below found no move.
- Object searches over open heads and main (`roadmaps grep`): "very strongly admissible", "LA-acyclic", closed induction: no other roadmap. "Orlik–Strauch", "σ-analytic": only TriangulineVarietyAndItsLocalModel, which imports them from here (its README lines 19, 116–122). Category O: SpringerResolutionAndCharacteristicCycles, the settled F06.
- All nine declared gaps have the same slug in `design/plan.json` and in the README, a named earlier supplier, and a precise, single-interface `needs`. They are contracts and were not raised.
- No algorithm, copied passage, machine path, pull-request number, HTML anchor or LaTeX delimiter in the README (grep). The former-numbering table is the permitted old → new mapping. No layer is named after a source chapter; Layers 9 and 10 follow Layer 8 because their Needs lines force it.

Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, SmoothRepresentationsOfLocalGroups, TriangulineVarietyAndItsLocalModel, OverconvergentAutomorphicForms (no roadmap on main is listed as close); nothing shared: compact distribution algebras and compact-group admissibility are PadicLocalLanglandsForGL2Qp's, smooth theory SmoothRepresentationsOfLocalGroups', Emerton's Jacquet functor OverconvergentAutomorphicForms', and locally analytic induction, Orlik–Strauch constituents and the σ-analytic Ext theory are this roadmap's, imported by TriangulineVarietyAndItsLocalModel.

Maintainer notes: none were given.

## Not verifiable

- SCHN11, NFA02, HUM08: settled uncertified books; their locators (§0.1, the barrelled-space gap, §§4.3–4.5) cannot be checked against text. Not requested again.
- The Orlik–Strauch irreducibility theorem outside type A for p ≤ 3 remains the settled scope item; not certified here.

## Source issues

- **Misprint** in DING25 at Lemma 3.2, arXiv v2 p. 37 (DING25 line 1510): the source says the subset is the forward image of the first i indices under w; it should be the inverse image, which is constant on the coset W_i·w; affects a stated result.
- **Misprint** in DING25 at (3.12), arXiv v2 p. 41 (DING25 lines 1661–1662): the source says the subsets range inside the first n − 1 indices; it should be all n indices, as the stated dimension requires; affects a stated result.
- **Misprint** in DING25 at the construction before (3.26), arXiv v2 pp. 45–46 (DING25 lines 1837–1839): the source says each summand of the kernel has one algebraic factor and π_1 in the others; it should be one π_1 factor and algebraic factors elsewhere; affects the proof.
- **Error** in OS15 at §2.5, after Example 2.7, p. 8 (OS15 lines 320–324): the source says O^p lies in O and O^g is all finite-dimensional semisimple modules; it should also require the Cartan to act diagonalisably over the coefficient field; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9c0774b372c8c3f1c35239945854f2b410e01f8e", "job": "REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~6", "model": "fable", "worker": "chris-x60"} -->
