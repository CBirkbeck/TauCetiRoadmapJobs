# Review of Foams (pull request #1629 at 78a1fb3)

**Verdict:** needs changes

Full review of the repaired head (the folder changed by 214 lines since `f31846e`). The previous review's three findings are repaired (status under "Verified sound"). The gate fails at this head on two counters (`dropped=8`, `statement-hygiene=1`); they are R01 and R02. R03 and R04 are new.

## R01 (P2) — Two suppliers are roadmaps the project has dropped

**Location:** `TauCetiRoadmap/Foams/README.md:237`–238 (supplier table), 1016–1017 and 1051 (2.4), 2519 and 2572 (7.2), 2788–2789 (link definitions). "[SurfaceTopology, Layer 2][surface] | Finite-map/permutation-triple/bipartite-ribbon-graph comparisons and Euler counts" and "[PlanarTopology, Layers 6–7][planar] | Euler/orientation results and Schoenflies and interior-arc isotopy theorems".

**Claim:** 2.4 and 7.2 consume these two roadmaps.

**Witness:** Both names are on the project's dropped-names list and may not be cited as suppliers; the gate reports `dropped=8` at these eight lines and fails. Neither roadmap is on main or in the merge order, so the prerequisites of 2.4 and 7.2 have no admissible owner as written.

**Repair:** Repoint each contract to an owner that exists, and keep the rest as targets the sections already claim.

- 2.4 (lines 237, 1016–1017, 1051): delete the SurfaceTopology row and cite the pinned Tau Ceti comparisons in the `From Tau Ceti` bullet on permutation triples: `TauCeti.PermutationTriple.ribbonGraph` with `facePerm_ribbonGraph` and `isConnected_ribbonGraph` (`TauCeti/Combinatorics/RibbonGraph/OfPermutationTriple.lean:70`, 108, 121), `TauCeti.BipartiteRibbonGraph.toPermutationTriple` (`ToPermutationTriple.lean:45`), and `eulerChar_toPermutationTriple`, `even_eulerChar`, `IsConnected.eulerChar_le_two` (`EulerCharacteristic.lean:29`, 35, 41). These are the permutation-triple/ribbon-graph comparison and the Euler count the row asks for. The trivalent-web adapter, subdivision independence and vertex-free circles are already 2.4 targets ("Construct the trivalent-web adapter here").
- 7.2 (lines 238, 2519, 2572): replace the PlanarTopology row by KhovanovHomology G (on main: finite plane realizations, the polygonal complement dictionary, boundary orientation and the relative extension) and GeometricTopology 2.2 and 3.3 (on main: Schoenflies and relative isotopy extension). The interior-arc and boundary-relative statements for disks with holes stay 7.2 targets, as line 2521 already says ("prove the additional boundary-relative extension and subdivision statements here").
- Delete the two link definitions at 2788–2789 and the two `#271` lines of the description's depends-on block.

Tested on a scratch copy with both names replaced by an on-main owner: the dependency check returns `depcheck: 236 roadmaps, 2265 edges, 0 problem(s)` and no line contains a dropped name.

## R02 (P3) — `letI` in the signature of the Frobenius headline

**Location:** `TauCetiRoadmap/Foams/Suggested.lean:38`. "∃! c : Coalgebra R A, letI : Coalgebra R A := c …".

**Witness:** Gate `statement-hygiene`: "`letI` in the signature of theorem `existsUnique_frobeniusCoalgebra`; repair: use an instance binder or a named instance in the signature".

**Repair:** State the conclusion with the bound structure named explicitly:

```lean
    ∃! c : Coalgebra R A,
      c.counit = ε ∧ @Coalgebra.IsFrobenius R A _ _ _ _ _ c.toCoalgebraStruct := by
```

Tested on a scratch copy at the pins: it elaborates with only the `sorry` warning, and `example : existsUnique_frobeniusCoalgebra = existsUnique_frobeniusCoalgebra' := rfl` is accepted, so the statement is unchanged.

## R03 (P3) — The README names Tau Ceti declarations that the branch's pin does not have

**Location:** `TauCetiRoadmap/Foams/README.md:646`–647 ("this distinguishes it from Tau Ceti's differential graded DGShiftClosure") and 548–550 ("consume KhovanovHomology K2's native DualNumber R carrier, chosen coalgebra, perfect trace pairing and base-change comparison").

**Witness:** The branch pins Tau Ceti `a91d3aaf` (merge base `737e4821`); main pins `2fd255d9`. `DGShiftClosure` does not occur at `a91d3aaf`; it is `TauCeti/CategoryTheory/DG/ShiftClosure/Basic.lean:101` only at `2fd255d9`. The same holds for the Khovanov natives: `TauCeti/KnotTheory/Khovanov/` is absent at `a91d3aaf` and at `2fd255d9` has `Frobenius.lean` (scoped `TauCeti.Khovanov.coalgebra` line 69, `isFrobenius` 112, `mul_compr₂_counit` 120, `baseChangeCoalgEquiv` 146) and `CircleTensor.lean` (`CircleTensor` 128, `circleBasis` 133, `circleQuantumGrading` 229).

**Repair:** Merge main into the branch so that the folder is read against `2fd255d9`, and re-elaborate `Suggested.lean` there. Then add to `From Tau Ceti` one bullet citing `TauCeti.Khovanov.coalgebra`, `TauCeti.Khovanov.isFrobenius`, `TauCeti.Khovanov.mul_compr₂_counit` and `TauCeti.Khovanov.baseChangeCoalgEquiv` for 0.8 and KH1, and `TauCeti.Khovanov.CircleTensor` with `circleBasis` and `circleQuantumGrading` for KH2; write `TauCeti.DGShiftClosure` in a code span in 0.10. This review could not elaborate the file at main's pins; the Mathlib declarations it uses (`Coalgebra.IsFrobenius`, `LinearMap.IsPerfPair`, `MvPolynomial.weightedHomogeneousSubmodule`, `YoungDiagram.colLen`) exist in main's pinned Mathlib `1b1ccf4b`, with `RingTheory/Coalgebra/IsFrobenius.lean` lines 60–110 identical at both pins.

## R04 (P3) — Two locators

**Location:** `TauCetiRoadmap/Foams/README.md:1048` ("[Erickson, Planar Graphs, “Rotation systems” and “Surface maps”]") and 839, 1510 ("[Goertz–Wedrich v2, Propositions 10–11, pp. 3–4]").

**Witness:** The cited Erickson page has no section "Surface maps" and the word "surface" does not occur in it; its sections are Abstract graphs, Data structures, Topological graphs, Rotation systems, Formalities and Trivialities, Duality, … (`erickson line 9`, 85, 158, 228, 300, 388). The definition used by 2.4 (a combinatorial map as a triple of darts, involution and successor, with faces the orbits of their composite) is in "Rotation systems" (`erickson line 267`–276). In Goertz–Wedrich, Propositions 10 and 11 are both on p. 4 (`gw-cob line 154`, 184); only Lemma 8 is on p. 3 (line 133).

**Repair:** At 1048 write "[Erickson, Planar Graphs, “Rotation systems”]". At 839 and 1510 write "Propositions 10–11, p. 4" (lines 403, 2160 and 2684, which also cite Lemma 8, are correct with "pp. 3–4").

## Verified sound

**The previous review's findings, at this head.**

- R01 (direction of numbering in the 2.7 switch): repaired. Line 1173 now reads "number six boundary points 0,…,5 clockwise", and the Check at 1246–1248 pins the coefficients: "At q=1, N=4 and boundary colours (0,0,0,1,1,0), Q_01 has 2 colourings, P_R has 0 and R₀ has 1". Recomputed: P_R = (01)(23)(45) needs c₂ = c₃, but 0 ≠ 1, so 0; R₀ = (01)(25)(34) has c₀ = c₁, c₂ = c₅, c₃ = c₄, so 1; in Q_01 the square's two 1-edges carry one colour x with x ∉ {0,1}, so 2 = 0 + (4−2)·1.
- R02 (four supplier rows citing sections without the object; uncited `IsFrobeniusFunctional`): repaired. The DGAInfinity, ZigzagPreprojective, AlgebraicVectorBundles and GrothendieckEulerForms rows are gone (no occurrence in the README); `From Tau Ceti` cites `TauCeti.InternalGrading.tensorProduct`, the shift isomorphisms and `LinearMap.IsFrobeniusFunctional`, and 0.8 says how the perfect-pairing notion differs; the associator, unitors and symmetry of ⊗_𝕜 are 0.10 targets.
- R03 (Lean carriers unnamed, docstring title, a line starting with "#", Bar-Natan's unit/counit names): repaired at README 1282–1283, Suggested.lean line 4, README 2035 and 870–871.

**Build, gate, scope.** Head `78a1fb399281d0828218c3a4fcce9f48302225f7`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Foams'` is empty; the folder holds README.md, Suggested.lean and metadata.toml. `lake env lean` on Suggested.lean: exactly three warnings, `declaration uses sorry` at lines 34, 63, 113. Gate: every counter zero except `statement-hygiene=1` (R02) and `dropped=8` (R01). Dependency check output:

```text
depcheck: 236 roadmaps, 2265 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Foams is at line 401 of the merge order, TemperleyLieb at 244; PivotalSpherical, KhovanovHomology and RepresentationTheory/SchurWeyl are on main (`3090489d`).

**Signatures.** `#check @name` for the three theorems on a scratch copy; the elaborated types agree with README 0.8, 2.8 and 2.11 and with `signatures.md`; no binder is lost. The Frobenius headline carries `[CommRing R] [CommRing A] [Algebra R A] [Module.Free R A] [Module.Finite R A]` and the perfect-pairing hypothesis; the circle headline has `a ≤ N` and no field hypothesis, as 2.11 says. All 11 declarations are named in the README, and every backticked name of the roadmap's own in the README is declared.

**Headlines and padding.** Headlines: RW polynomiality (1.1), planar decomposition (2.7–2.10), the monoidal 2-categories (4.1–4.3), spatial duality (5.1), progressive spanning (6.6), the canopolis (7.3), KH1–KH4: none statable at the pins (no web, foam or closure carrier), each named in the module docstring with what it lacks. Stated: Frobenius reconstruction (0.8), integral graded freeness (2.8), circle Schur basis (2.11). One-tactic probe (`simp`, `rfl`, `infer_instance`, `decide`) on a scratch copy: none of the three closes. The eight definitions are the carriers of the two algebraic statements, with real bodies. No padding. No same-statement declaration in the pinned libraries: Mathlib `RingTheory/Coalgebra/IsFrobenius.lean` has the class and consequences but no construction from a trace; Tau Ceti at `2fd255d9` has `InternalGrading.exists_homogeneous_basis` (`Algebra/Module/GradedModule/HomogeneousBasis.lean:144`) only for torsion-free modules over `k[X]`, a different statement.

**Seeded sample.** Cache ids: `gmw` c6def817, `rw` 68b7a569, `bn` 7e8d5aad, `gw-cob` 7b8724ef, `kk` 54037c33, `dw` aebbaf65, `erickson` e3c0e566.

| Target | Locator read | Outcome |
| --- | --- | --- |
| 0.1 | GMW Def 3.4 p. 13 (`gmw line 546`) | Vertices, edges split into loops and oriented arcs, cyclic order at each vertex. Agrees; the README's edge-end occurrences are its stated adaptation. |
| 0.2 | GMW Def 2.1 p. 9 (line 357), Def 3.1 p. 12 (498) | Agree. RW Def 2.1, Remark 2.2, Lemma 2.5 pp. 6–8 as read last round, text unchanged. |
| 0.3 | GMW Def 3.9 (line 749) and Prop 3.10 (769), p. 17 | Identity foam; small symmetric monoidal category. Agree. |
| 0.6 | GMW Def 3.13 p. 18 (line 810), Prop 3.17 p. 19 (866) | Symmetric monoidal k-linear category. Agree. |
| 1.4, 2.13 | BN Def 7.1 / Prop 7.2 printed p. 1470 (`bn line 1247`, 1258, 1276) | v± of degree ±1; ǫ: 1 ↦ v₊; η: v₊ ↦ 0, v₋ ↦ 1; Δ and m as README 1.4 and 6.1 with 1 = v₊, X = v₋. |
| 2.1 | GMW Lemmas 3.18–3.19 p. 20 (line 888, 919) | The two pairings, ideals (3.3), (3.4); I₁(∅,W) = I₂(∅,W). Agree. BHMV under "Not verifiable". |
| 2.4 | Erickson, "Rotation systems" (`erickson line 228`–276) | Combinatorial map; faces as orbits of the composite. "Surface maps" does not exist: R04. |
| 2.5 | KK (13)–(16) p. 11 (`kk line 467`–488) | (16): the RW evaluation is (−1)^(χ(F)/2) times the deformed one at p = 1. Agrees with the README's "closed sign antecedent". |
| 2.9 | none (a Foams transport result) | Checked by instance below. |
| 2.10 | GMW Lemmas 3.24 p. 22 (line 990), 3.26 p. 24 (1048), 3.28, 3.30, 3.31 p. 25 (1082, 1102, 1110) | Pages agree. |
| 2.12 | GMW Lemma 3.32 p. 26 (line 1151); GW Props 10–11 (`gw-cob line 154`, 184) | Agree in content; page of Props 10–11 is 4: R04. |
| 4.1 | GMW Def 4.2 / Conv 4.3 p. 30 (line 1296, 1313), Constr 4.9–4.11 pp. 33–34, 4.13 p. 34, 4.17 p. 35, 4.18 p. 36, Def 4.19 / Prop 4.20 p. 37, 4.21–4.22 pp. 38–39, Thm 4.25 p. 40, Constr 4.28 p. 42, Thm 4.29 p. 43, Ex 4.33 pp. 46–47 (2044–2070) | Generator boundaries at line 1299–1300 equal the README's cup/cap row. Ex 4.33: deg(cup_W) = −Σ_non-loop edges k(N−k) + Σ_vertices ((k+l)(N−k−l)+kl) and shift −½(deg cup_S + deg cup_T): the README's δ = ½(w_N(S)+w_N(T)). Constr 4.10: W^# right mate, #W left mate, as README 5.1. The axis picture of Conv 4.3 was read from a rendering of p. 30: the 0-axis arrow points left. |
| 6.1 | DW Def 5.1 p. 34 (`dw line 1626`), Remark 5.7 with (5.1.7)–(5.1.8) p. 37 (1714–1724); BN as above; GW Lemma 8 p. 3 (line 133) | Agree; (5.1.8) carries the q^(−ab) shift on the merge. |
| 7.1 | BN Def 8.1 printed pp. 1473–1474 (`bn line 1413`–1425) | Canopoly over a planar algebra; morphisms of canopolies; oriented variant. Agrees. |

**Cross-roadmap citations resolved (main `3090489d`).** KhovanovHomology K1 (line 92), K2 (168), K3 (247), unchanged since the last review (`git log ffac5139..HEAD` on the folder is empty); the open pull request that touches that folder differs from main only in one prose line outside K1–K3. PivotalSpherical Layers 0–2 (lines 257, 283, 318). TemperleyLieb Layer 2 (333), Layer 6 (680, which defines tensor ideals on a general monoidal preadditive category, line 382), Layer 7 (767). SchurWeyl Layer 7 (580; vertical Pieri at 668, dual Jacobi–Trudi at 838). Ownership: `roadmaps grep` for foam, canopol, Robert–Wagner, Frobenius coalgebra and equivariant Grassmannian over the open pull requests and main finds only this roadmap; no other `Suggested.lean` declares a `TauCetiRoadmap.Foams` name.

**Library declarations opened at the branch pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `Coalgebra.IsFrobenius` (class over `[CoalgebraStruct R A]`, `RingTheory/Coalgebra/IsFrobenius.lean`), `YoungDiagram.colLen` (`Combinatorics/Young/YoungDiagram.lean:325`; cells are (row, column), `col j` filters on the second coordinate, line 312), `LinearMap.IsFrobeniusFunctional` (`Algebra/Algebra/Frobenius/Basic.lean:90`), `hsymm_mul_diagramSchurPoly` and `hsymm_mul_schurPoly` (`Schur/Pieri.lean:231`, 282), `shiftFunctorZeroIso`, `shiftFunctorAddIso` (`GradedModuleCat/Shift.lean:35`, 51), `directSumObj` (`GradedModuleCat/Abelian.lean:209`), `InternalGrading.tensorProduct`, `tmul_mem_tensorProduct`, `isHomogeneous_assoc_symm` (`GradedModule/TensorProduct.lean:196`, 231, 240), `MorphismIdeal` (`MorphismIdeal/Basic.lean:85`), and the ribbon-graph files named in R01.

**Adversarial pass.** Coefficients ℤ unless stated.

| Statement (section) | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Frobenius headline, hypothesis (0.8) | ℤ[X]/(X²) with ε(X)=1; ε(X)=2 | Gram [[0,1],[1,0]], det −1, perfect; [[0,2],[2,0]], det −4, not perfect | pass |
| Frobenius headline, uniqueness (0.8) | general; A = R, ε = id | Frobenius law and counit give Δ(a) = (a⊗1)Δ(1) and Σ ε(a xᵢ) yᵢ = a, so Δ(1) is the copairing element, unique for a perfect pairing; A = R: Δ(1) = 1⊗1 | pass |
| Freeness headline (2.8) | p = 0; p = diag(1,0) on shifts (a,b); p(x,y) = (x,e₁x), shifts (2,0); N = 0 | empty basis; (1,0) of degree a; p² = p, image basis (1,e₁) of degree 2 with e₁ ∈ Λ_(2−0); Λ₀ = ℤ with grading ⊤ at 0, ⊥ elsewhere | pass |
| `elementaryCoefficient` (2.11) | n = 2, r = −1, 0, 2, 3 (elaborated) | 0, 1, x₁ (the entry at index 1), 0 | pass; the negative index gives 0, not the constant term |
| `circleIdeal` (2.11) | (N,a) = (1,0), (1,1), (2,1) | b₁ − e₁; c₁ − e₁; b₁ + c₁ − e₁ and c₁b₁ − e₂, so x² − e₁x + e₂ with x = c₁ | pass; equals the README display |
| Circle basis headline (2.11) | (N,a) = (0,0), (1,0), (1,1), (2,1), (4,2) | quotient ℤ, basis the empty determinant 1; Λ₁, basis c₀ = 1; Λ₁, 0×0 determinant 1; basis (1, c₁); 6 = C(4,2) diagrams | pass |
| Dual Jacobi–Trudi (2.11) | N = 4, a = 2: λ = (2), (1,1), (2,1) | column lengths (1,1), (2,0), (2,1): det [[c₁,c₂],[1,c₁]] = c₁²−c₂; det [[c₂,0],[0,1]] = c₂; det [[c₂,0],[1,c₁]] = c₁c₂; weights 4, 4, 6 = 2|λ| | pass |
| Rectangle convention (2.11) | cells (i,j) with i < a, j < N−a | at most a rows of length ≤ N−a: Schur polynomials in a variables; matrix of size N−a ≥ λ₁ indexed by columns | pass; the transposed rectangle would index the wrong alphabet |
| Circle algebra N = 2, a = 1 (2.11) | x² = e₁x − e₂, ε_σ(1) = 0, ε_σ(x) = σ | x-matrix [[0,−e₂],[1,e₁]]; pairing [[0,σ],[σ,σe₁]], det −σ²; ε(x(x−e₁)) = σe₁ − σe₁ = 0, so dual basis (σ⁻¹(x−e₁), σ⁻¹) | pass |
| Top-Schur traces (1.2, 2.11) | a = 0..3 | 1, σ, −σ², −σ³; at σ = −1: 1, −1, −1, 1 = (−1)^(a(a+1)/2) | pass |
| Normalization exponent (1.2, 2.5) | a-sphere, torus, genus 2; birth, death of a counterclockwise 1-circle | χ_lin/2 = a, 0, −a; E = (1+0−1)/2 = 0 and (1+1−0)/2 = 1, sum 1 = exponent of the sphere | pass |
| Frobenius degrees (1.3, 1.4) | c = 1, deg X = 2; c = −1, deg X = −2 | A{−1}: 1, X in degrees −1, 1; V = A{1}: 1, X in degrees 1, −1; m: 2 → 1, Δ: 1 → 0, η: 0 → 1, ε: −1 → 0 | pass; equals BN's v± |
| Radical versus perfect (2.1) | B = 2xy on ℤ, then mod 2 | radical 0; mod 2 radical 𝔽₂, quotient 0 ≠ ℤ ⊗ 𝔽₂ | pass |
| Planarity test (2.4) | theta, ρ = (abc)(ACB) and (abc)(ABC); circle with one bivalent vertex | ρτ = (aC)(bA)(cB): 2−3+3 = 2; one 6-cycle: 2−3+1 = 0; ρ = τ = (d d′), ρτ = id with two fixed points: 1−1+2 = 2 | pass |
| Square relation (2.7) | N = 4, boundary (0,0,0,1,1,0) | Q_01 = 2, P_R = 0, R₀ = 1 | pass |
| Transport (2.9) | vu = id after ℤ → 𝔽₂; e₁ ↦ 1; eᵢ ↦ 0 | an equation of maps persists; 1 has degree 0 ≠ 2, ungraded; 0 is homogeneous | pass |
| Reconstruction (2.10) | id_W = Σ uᵢvᵢ | x = Σ uᵢ(vᵢx); a map killing all uᵢ kills x | pass |
| Bar-Natan states (2.12, 2.13) | one, two circles | states 1, X against tests X, 1 give δ; degrees 1, −1 and 2, 0, 0, −2; swap sign +1 | pass |
| Boundary weight (4.1) | vertex (k,l,k+l); merge a = b = 1, N = 3 | ½[k(N−k)+l(N−l)+(k+l)(N−k−l)] = (k+l)(N−k−l)+kl, so w_N(W) is half the boundary sum and w_N(S) = w_N(T); 6 − 3 = 3 = (2+2+2)/2 | pass |
| Identity degree (4.1, 4.2) | a-strand; one point | disk −a(N−a) plus δ = a(N−a); −c plus c | pass, 0 |
| Tensorator typing (Conventions, 3.1) | S : s → t, T : s′ → t′ | (s⊠T) ≫ (S⊠t′) and (S⊠s′) ≫ (t⊠T) both s⊠s′ → t⊠t′ | pass |
| Adjunction degrees (5.1, 6.2) | a = b = 1; a = 1, b = 2 | unit of M ⊣ S{−ab} lies in Hom⁰(id, (M≫S){−ab}) = Hom^(ab); counit in Hom^(−ab); degrees ±1 and ±2 | pass |
| KH3 maps (6.1) | 1, X | η: 1 ↦ 1; ε: 0, 1; m: (1, X, X, 0); Δ: 1⊗X + X⊗1, X⊗X; split then merge: 2X, 0 | pass |

## Not verifiable

- Blanchet–Habegger–Masbaum–Vogel, Proposition 1.1 and the universal construction, p. 886 (2.1): paywalled, recorded uncertified last round; not fetched again. GMW Lemmas 3.18–3.19 were read as the foam adaptation.
- `Suggested.lean` at main's pins (R03): the only elaboration permitted here is in the pull request's worktree at its own pins.
- The q-graded form of the 2.7 relations and the higher coherence equations of Layers 3 and 5: located, not checked term by term; no error is alleged.

## Source issues

- none
