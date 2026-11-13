<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13792#issuecomment-6849130763 -->
Review (claude) of 8235bf0

Verdict: needs_changes

1. **F01** (P2) Fifteen sections plan objects that RealSemisimpleLieGroups already plans

   **Location.** `packages/LieGroupsPartII/design/README.md`, "Scope and ownership": "This roadmap owns … the Tits system of a real reductive group; standard parabolic subalgebras and subgroups and their Langlands decompositions; … general parabolic subgroups and subalgebras, and the dynamical description". The scope names AutomorphicFormsOnReductiveGroups and NoncompactQuantumSymmetry and never RealSemisimpleLieGroups.

   **Claim.** This roadmap is the single owner of these objects.

   **Witness.** Open pull request #2229, `TauCetiRoadmap/RealSemisimpleLieGroups/README.md` (head `9a938c5`), "Scope and ownership", about lines 39–46: it owns "the Tits system `(P, N_G(𝔞))`, the Bruhat decomposition", "standard parabolic subalgebras and subgroups … Langlands decompositions, general parabolic subgroups and their type … the dynamical description, and the comparison with algebraic `ℝ`-parabolic subgroups".

   Section by section (line numbers are of that README at that head, approximate to one line):

   | This design | RealSemisimpleLieGroups | Same object? |
   | --- | --- | --- |
   | §1.2 conjugacy of Cartan involutions of a real semisimple Lie algebra | §0.2 (line 360), headline `exists_conj_cartanInvolution` | Same theorem. This design adds uniqueness of `X` and `σ'σ = e^{2 ad X}`. |
   | §2.1 positive systems through the indivisible subsystem | §1.2 (line 478) | Same: bijection with bases of the reduced subsystem, simple transitivity, non-negative integer combinations. This design adds the subsystem `Φ_{Π'}` and the stabilizer statement. |
   | §2.3 `N_G(𝔞) = N_K(𝔞)·A`, `N_G(𝔞)/Z_G(𝔞) ≅ W_G` | §3.2 (line 841) | Same. |
   | §2.4 "`W_G = W(Σ)` when `M` meets every component" | §2.3 (line 640) | Same implication. The converse and the other equivalences are only here. |
   | §3.2–§3.4 `P = MAN`, its Langlands decomposition, one conjugacy class | §3.1 (line 804) | Same statements for connected groups with semisimple Lie algebra and finite centre. This design's class is wider (any reductive Cartan datum). |
   | §4.2 big cell, cell dimensions, Bruhat over `W(Σ)` | §3.2–§3.3 (lines 841, 866) | Same under the component condition. The decomposition over `W_G` without it is only here. |
   | §4.3 the Tits system `(G, P, N_G(𝔞), S)` | §3.3 (line 866), headline `exists_titsSystem` | Same construction, same hypothesis (`M` meets every component), same axiom-by-axiom route. |
   | §5.1–§5.3 `𝔮_{Π'}`, the classification of subalgebras containing `𝔮_∅`, the eigenspace description | §4.1 (line 912) | Same. |
   | §6.1 standard parabolic subgroups | §4.2 (line 935) | Same, through the same Tau Ceti declarations. |
   | §6.3 Langlands decomposition of `Q_{Π'}` | §4.3 (line 958) | Same. |
   | §7.2 parabolic subgroups, type, the bijection with parabolic subalgebras | §4.4 (line 985) | Same. |
   | §7.3 (ii) dynamical description | §4.4, `dynamicalParabolic` | Same. Part (i), without the component condition, is only here. |
   | §9.1 `𝐇(ℝ)` satisfies the component condition | §2.3 (line 640, last sentence) | Same statement, by a different route (Borel–Tits 14.4). |
   | §9.2 comparison on all chamber faces | §4.5 (line 1031) | Same: `Q_{Π'} = G ∩ P_𝐆(ν)(ℝ)` for `ν` vanishing exactly on `Π'`. |
   | §9.3 complexification criterion | §4.4 | Same criterion. This design adds the centre condition for reductive `𝔤`. |

   Instance: for `SL_3(ℝ)` both texts build the Tits system with `B` upper triangular and `N` monomial, list the same four standard parabolics, and both give `X = diag(1, 1, −2)` (up to scale) as the element whose non-negative eigenspaces are the block `(2, 1)` algebra.

   RealSemisimpleLieGroups does not cite this roadmap, and no roadmap on main or in an open pull request cites `LieGroupsPartII` (`roadmaps grep 'LieGroupsPartII'`: no match). So nothing depends on this design keeping these sections.

   **Why this design is the one that changes.** #2229 is an open pull request adding a new roadmap folder, which this roadmap may consume. This design has no pull request and is not in the merge order, so the other roadmap cannot cite it. If the maintainers want the reverse division, that is their decision and should be recorded as a maintainer note.

   **Exact repair.**

   1. In "Scope and ownership", add a "Stated by RealSemisimpleLieGroups" bullet naming §§0.2, 1.2, 2.3, 3.1–3.3, 4.1–4.5, and remove the corresponding items from the "owns" list. Add a `From TauCetiRoadmap.RealSemisimpleLieGroups` subsection to the supplier contracts and a supplier entry in `design/plan.json`.
   2. Delete as targets, and cite instead: §1.2, §4.3, §5.1–§5.3, §6.1, §6.3, §7.2, §9.2. For §4.3 keep one sentence: an Iwasawa triple satisfying the component condition is a "minimal parabolic datum" in the sense of RealSemisimpleLieGroups §3.1, so its §3.3 applies.
   3. Keep as stated variants, each with one clause saying how it differs:
      - §1.3 (reductive groups with equal split centre, disconnected groups);
      - §2.1 only the subsystem `Φ_{Π'}` and stabilizer facts, the rest cited from §1.2 there;
      - §2.3 only the `K⁰` representatives, `N_{K⁰}(𝔞)/Z_{K⁰}(𝔞) = W(Σ)` and normality;
      - §2.4 the definition and the converse directions;
      - §3.2–§3.4 for an arbitrary reductive Cartan datum (the other roadmap covers connected semisimple groups with finite centre and AutomorphicFormsOnReductiveGroups the algebraic class);
      - §4.2 the decomposition over `W_G` and the count of open cells without the component condition;
      - §6.2 (`⁰L` with a non-trivial component action);
      - §7.3 (i);
      - §9.3 only if the centre condition is not already in §4.4 there, otherwise cite.
   4. §9.1: keep the self-adjoint-linear-group statement; cite §2.3 there for the component condition, or say in one clause that the axiom (v) route is kept as an alternative proof of the same statement.
   5. Layer 8: say in §8.2 how `dynamicParabolic G X` on `Subgroup (GL (Fin n) ℝ)` relates to `dynamicalParabolic X` there (same subgroup under the adapter of §8.1), and re-point the `*Needs:*` lines of §8.3 at the cited sections.
   6. Unchanged and owned here: §1.1, §2.5, §2.6, §3.1, §4.1, §7.1, §8.1.
   7. Update the summary, "How to read the build", the plan targets and their prerequisites, and the `cited_for` lists of `sources.toml` to match.

   **Repair test.** On `SL_3(ℝ)` the cited sections give the six cells, four standard parabolics and the `(2, 1)` block algebra, so nothing downstream of §§4.3–7.2 loses its input. On `O(1,1)` (component condition fails) the kept variants still give two cells over `W_G`, `N_G(𝔮_∅) = G ≠ P`, and `Q(Y) = P` of index two; none of this is in the other roadmap. On `ℝ ⋊ C₂` the kept §6.2 still gives `⁰L = L`, `F = 0`, which the other roadmap's `M_{Π'} × A_{Π'}` statement does not cover.

2. **F02** (P3) §5.3 cites a paper for a statement the paper does not make

   **Location.** `packages/LieGroupsPartII/design/README.md` §5.3: "(Brown–Rodriguez Hertz–Wang 2022, §1.2; Knapp 2002, Ch. VII §7.)", after the three eigenspace statements. Plan target 5.3 has the same paper as its only locator.

   **Claim.** The cited §1.2 supports the description of `𝔮_{Π'}`, `𝔩_{Π'}`, `𝔫_{Π'}` by eigenspaces of `ad X`.

   **Witness.** `brown-rodriguezhertz-wang2022` lines 122–157 (§1.2, pp. 3–4) give the root-sum formula (1) and the subgroup correspondence for connected semisimple groups with finite centre. No element `X`, eigenvalue or centralizer appears there.

   **Exact repair.** Cite the paper in §5.3 as §5.1 does, for the root-sum formula only ("with `𝔮_{Π'}` as in equation (1)"), and leave Knapp, Ch. VII §7 as the locator of the eigenspace statement. Make plan target 5.3's locator `knapp2002`, Ch. VII §7, with the paper as a secondary reference. If R01 is applied and §5.3 becomes a citation, this finding lapses.

   **Repair test.** For `X = diag(1, 1, −2)` in `𝔰𝔩_3(ℝ)` the eigenvalues of `ad X` on `E₁₂, E₂₁, E₁₃, E₂₃, E₃₁, E₃₂` are `0, 0, 3, 3, −3, −3`; formula (1) with `Π' = {α₁}` lists the same six-dimensional algebra, but only the computation, not the paper, connects the two.

Two findings: one P2 (blocking) and one P3. All five round-3 findings are repaired, and the mathematics of the changed passages and of the 15 sampled targets checks out. The blocking finding is new and is about ownership, not correctness: the open pull request #2229 (RealSemisimpleLieGroups, a new roadmap folder) plans the same objects as about half of this design's sections, and this design does not mention it. No design, plan or manifest file was changed; only the two review deliverables were written.

A maintainer may prefer to decide R01 rather than have a fix worker apply it: the repair removes or narrows 15 of the 31 numbered sections. It is stated below as an exact section-by-section repair so that either route is possible.

## Previous findings, checked individually

Identifiers are those of round 3. None was marked "not actionable in this package".

| Round-3 finding | Repaired passage | Status |
| --- | --- | --- |
| R01, transpose APIs without symmetry or stability | `design/README.md` §8.2 API: "`θ` maps `dynamicParabolic G X` onto `dynamicParabolic (θG) (−Xᵀ)`", with the same-`G`, `±X` forms only "When `G` is transpose-stable and `X` is symmetric". `design/plan.json` 8.2, 8.2b, 8.2c carry the same wording and both negative controls. | Repaired |
| R02, §2.3 reconstructs the base Weyl quotient | §2.3: "let `W_G = N_K(𝔞)/Z_K(𝔞)` be LieGroups Layer 9's restricted Weyl group … This section compares it with `W(Σ)`". Plan 2.3 is now the theorem `IwasawaTriple.restrictedWeyl_comparison`. §2.6 takes chamber coverage from the base. | Repaired |
| R03, ReductiveGroups contract drops split hypotheses | Contract: "Layer 7's Bruhat decomposition and Tits system … are stated for a split maximal torus `𝐓` and a Borel subgroup `𝐁 ⊇ 𝐓`; they are not consumed." Plan supplier entry lists `Layer 7` only. | Repaired |
| R04, missing local needs and locators | §2.1, §3.2 and §5.1 now have `*Needs:*` lines; §§3.2, 3.4, 5.1, 8.2, 8.3 have locators. | Repaired (one locator still overreaches: R02 below) |
| R05, rank-zero qualifications | §8.3 Check: "For `p = q ≥ 1` … the condition fails. For `p = q = 0`, `O(0, 0) = 1` … the condition holds." Plan 8.3 and 9.1 tests carry `n ≥ 1` with the `n = 0` case stated. | Repaired |

The same patterns were looked for in the rest of the design. I found no further same-`G` transport claim without its hypotheses, no further reconstruction of a LieGroups Layer 9 object, no further unqualified ReductiveGroups import, and no further unbounded `n` or `p`. The duplication pattern of R02 does recur, against a different roadmap: that is R01 below.

## Verified sound

### Coverage

I read all 937 lines of the README, the 40 plan targets (94 internal edges, no missing id, no cycle; every definition target has at least 3 tests) and the 8 manifest entries. The round-3 table carries computed values for every numbered section; I relied on it for unchanged text and recomputed the repaired passages and the 15 sampled targets.

No route-specific shortcut, algorithm, copied passage, `set_option`, sorry'd data, pull-request number, local path, HTML anchor or LaTeX delimiter was found in the design. The nine layers are named by their mathematics and each ends with Examples and Dependencies. There are no maintainer notes.

### Adversarial table

`θ` is transpose-inverse in matrix examples. Values marked "exact" were computed in rational arithmetic.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §8.2 general transport (repaired) | `GL₂`, `X = ((1,1),(0,0))`, `g = I + X` | `θ(g) = ((1/2,0),(−1/2,1))`; `S⁻¹XS = diag(1,0)`; `S⁻¹θ(g)S = ((0,1),(−1/2,3/2))`; `θ(g)Xᵀ = Xᵀθ(g) = ((1/2,0),(1/2,0))` (exact) | `θ(g)` is in the `−Xᵀ` group and not in the `−X` group. Holds. |
| §8.2 transport proof | any `g`, `X` | `θ(e^{−tX} g e^{tX}) = e^{tXᵀ} θ(g) e^{−tXᵀ}`, the transpose of the `X`-family of `g⁻¹`; `g⁻¹` is a polynomial in `g` since `det g ≠ 0` | The bounded-family set is closed under inverses. Holds. |
| §8.2 same-`G` form | `G` upper unitriangular, `X = 0` | `dynamicLevi G 0 = G`; `θ(I + E₁₂) = I − E₂₁ ∉ G` | Transpose stability is needed, as stated. |
| §8.2 factorization order | `((2,3),(0,5))`, `X = diag(1,0)` | `diag(2,5)·((1,3/2),(0,1)) = ((2,3),(0,5))`; `u·l` needs `3/5` | Order `l·u` as stated. |
| §8.2 normalization hypothesis | `G = OᵀSL₂(ℤ)O`, `O` rotation by 30° | `O g Oᵀ = ((2,3),(1,2))`, determinant 1; `(O l Oᵀ)₁₂ = 1.5` | `g ∈ G`, limit `l ∉ G`. Hypothesis needed, as stated. |
| §2.3 `K⁰` representative (repaired) | `SL₂`, `X = E₁₂` | `X + dθX = ((0,1),(−1,0))`; `c = −π/2` gives `((0,−1),(1,0))`, acting by `−1` on `diag(1,−1)`; `c = −π/4` sends it to `±((0,1),(1,0)) ∉ 𝔞` | Holds; the constant matters. |
| §2.3 comparison | `O(1,1)`, `SL₂`, `GL₀` | `(|N_{K⁰}/Z_{K⁰}|, |W(Σ)|, |W_G|) = (1,1,2), (2,2,2), (1,1,1)` | Holds. |
| §1.1 definition | `GL₂`; `SU(2)` with `Ad(diag(i,−i))`; circle | `tr(H²) = 2`, `tr(J²) = −2`; `exp(πJ) = −1` collides with `(−1, 0)`; `exp(1) = exp(0)` | Sign and the two non-examples as stated. |
| §1.2 | `𝔰𝔩₂`, `g = diag(2,1/2)`; compact; zero algebra | `σ'σ = Ad(diag(4,1/4)) = e^{2 ad X}`, `X = diag(log 2, −log 2)`; `X/2` gives `Ad(diag(√2,1/√2)) ≠ Ad(g)`; compact and zero: `X = 0` | Factor 2 and uniqueness hold. |
| §1.3 | `ℝ ⋊ C₂`; `ℝ × S¹` tilted | `θ_a` is a homomorphism (the case `ε = ε' = 1` gives `0 = a − a`); `c_b θ₀ c_b⁻¹(t,1) = (−t + 4b, 1)`, so `b = a/4`; `θ_c² = id`, `𝔭_c = {(x, cx)}` | Cocycle step and non-conjugacy as stated. |
| §1.3 step 1 | any datum | `Lie` of the maximal compact subgroup of `Z(G⁰)⁰` is `𝔷 ∩ 𝔨`: a vector in it and in `𝔭` has a bounded one-parameter group inside the closed copy of `𝔭` | The claim `𝔷 ∩ 𝔨 = 𝔷 ∩ 𝔨'` holds. |
| §2.1 | `BC₁`, `BC₂`, `A₂`, empty | `BC₁`: `Π = {λ}` (`2λ = λ + λ`); `BC₂`: `Φ_ind = B₂`, `|W| = 8`, `Φ ∩ span(e₂) = {±e₂, ±2e₂}`; `A₂`: 6 systems; empty: 1 | Holds. |
| §2.5 | `ℝ^×` with forms `xy`, `2xy`; `SL₃` | `g = 1` works though `B(1,1) = 1 ≠ 2`; six positive systems, six permutations | Holds; forms are not identified. |
| §3.1 | `GL₃`, `𝔰 = ℝ·diag(1,1,−2)`, `0`, `𝔞` | `dim L = 5, 9, 3`; roots `±α₁`, all, none | Holds. |
| §3.1 component condition | general | `k ∈ K⁰ ∩ L` moved into `N_{K⁰}(𝔞)` by `(K ∩ L)⁰`, then into `Z_{K⁰}(𝔞)` by reflections in roots vanishing on `𝔰` | Inheritance holds. |
| §3.3 (e) | `𝔤𝔩₂` | orthogonal of upper triangular for `tr(XY)` is `ℝE₁₂` (dim 1); nilradical is dim 2 | "Orthogonal, not nilradical" holds. |
| §3.3 (f) | `O(1,1)`; `Σ = ∅` with the condition | `[G : P] = 2`, `N_G(P) = G`; with the condition `K = M·K⁰ = M`, so `P = MA = G` | Condition needed and sufficient. |
| §3.4 rank-one Check | `dim 𝔞 = 1`, `Σ ≠ ∅` | `W_G` acts faithfully and orthogonally on a line, so `|W_G| ≤ 2`; `A`-fixed points on `G/P` are 2 | "Exactly `P` and `θ(P)`" holds even for disconnected `G`. |
| §5.3 | `𝔰𝔩₃`, `X = diag(1,1,−2)`, `0`, regular | eigenvalues `0,0,3,3,−3,−3`; `dim 𝔮 = 6`, `dim 𝔩 = 4`, `dim 𝔫 = 2`; `8/8/0` at `0` | Holds. Agrees with §5.1 (block `(2,1)`) and §7.2 (type `{α₁}` stabilizes a plane). |
| §6.2 | `ℝ ⋊ C₂`; `ℝ^×`; `ℝ² ⋊ C₂` swap; `GL_n` | `ℓ(−t) = ℓ(t)` forces `ℓ = 0`, `F = 0`, `⁰L = L`; `⁰L = {±1}`; `pr_F(3,1) = (2,2)`, residual `(1,−1)`; `h = (log|det|/n)·1`, `n ≥ 1` | Holds; no division at `n = 0`. |
| §7.1 | `g = b w b'` | `B` and `wBw⁻¹` generate `P_{supp(w)}`, so `supp(w) ⊆ J`; the third bullet follows from the first (`gBg⁻¹ ⊆ P_{J'}` gives `g ∈ P_{J'}`, then `P_J ⊆ P_{J'}`) | Holds. |
| §7.2 | `SL₃`, compact, `O(1,1)` | four types; one type; `N_G(Lie P) = G ≠ P` | Holds with the condition. |
| §8.1 | discrete `{diag(2^k, 2^{−k})}`; upper unipotent | tangent algebras `0` and `ℝE₁₂`; `K = 1` in both; polar map not onto | Both fields needed. Finiteness is exactly what puts `½ log(gᵀg)` in the tangent algebra. |
| §8.3 `eq_dynamicParabolic_of_le` | `X ∈ 𝔞` with `P ≤ dynamicParabolic G X` | `N` inside forces `β(X) ≥ 0` on `Σ⁺`; then equality of parabolics ⇔ same zero set of simple roots ⇔ same centralizer; `GL₂`: `0` and `I` both give `G` | "Iff" holds in both directions. |
| §8.3 regularity of `H₀` | general | `Z_𝔤(H₀) = 𝔪 ⊕ 𝔞 ⊕ ⨁_{β(H₀)=0} 𝔤^β`, equal to the centralizer of `𝔞` iff no root vanishes | The stated condition is regularity. |
| §8.3 Check (repaired) | `O(p,q)`: `p > q ≥ 1`; `p = q ≥ 1`; `p = q = 0` | components met: 4 of 4; 2 of 4; 1 of 1 | Holds. |
| §9.3 | `𝔤𝔩₂` trace-zero upper; `ℝ·1`; full upper; `𝔰𝔲₂`; abelian | dims 2, 1, 3; first has a Borel but not `1`, second the reverse; `𝔰𝔲₂`: only `𝔤`; abelian: `𝔷 = 𝔤` forces `𝔮 = 𝔤` | Both conditions needed; rank zero passes. |
| ReductiveGroups contract (repaired) | split `GL₂`; `SU(2)` over `ℝ` | two cells; real rank 0, absolute rank 1, no real Borel | The split Tits theorem is correctly not consumed. |

### Sources and the seeded sample

Four cached texts were read at the cited lines. Four books are settled as uncertified and were not requested again. No source was fetched and no request file was written.

| Target | Outcome |
| --- | --- |
| 1.1, 1.2, 1.3, 2.5, 3.1, 3.3, 3.4, 7.2, 8.1, 9.3 | Locators are Knapp (and Warner, Wallach) by chapter and section: uncertified, not readable. Statements checked mathematically in the table. |
| 2.1 | Bourbaki VI §1: uncertified. Statements checked on `BC₁`, `BC₂`, `A₂`. |
| 5.3 | `brown-rodriguezhertz-wang2022` lines 122–144: setting (line 124) and formula (1) (lines 138–141, p. 3) are there; the eigenspace statement is not. R02. |
| 6.2 | Wallach 2 §2.2 and Knapp VII §2: uncertified. The manifest says the finite-component extension is this roadmap's own argument, which the README repeats. |
| 7.1 | `borel-tits1965` line 1931, Corollaire 5.18 (ii), on the page printed 101: conjugate containment of standard parabolics and membership of the conjugating element. Supports the algebraic analogue as cited. Bourbaki IV §2: uncertified. |
| 8.2 | Elementary; the README gives the proof. The papers cited in the plan are background only. |

Further locators checked in `borel-tits1965`: Théorème 4.15 at line 1488 (pp. 90–91); Corollaire 5.9 at line 1802 (p. 98); Proposition 5.17 and Corollaires 5.18–5.20 at lines 1924–1946 (pp. 101–102); Proposition 9.3 at line 2938 (p. 126), for a locally compact field of characteristic zero; Théorème 14.4 at line 3750 (p. 146). All match the README and the manifest.

### Library declarations opened at the pins

Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, as in `lake-manifest.json` and the README.

- Mathlib: `LieDerivation.IsKilling.exists_eq_ad` (`Algebra/Lie/Derivation/Killing.lean:108`), `Matrix.exp_transpose` and `Matrix.exp_conj` (`Analysis/Normed/Algebra/MatrixExponential.lean:113, 185`), `unitarySubgroup` (`Algebra/Star/Unitary.lean:273`), `Matrix.orthogonalGroup` (`LinearAlgebra/UnitaryGroup.lean:318`), `Matrix.symplecticGroup` (`LinearAlgebra/SymplecticGroup.lean:102`, a submonoid of matrices), `DoubleCoset.doubleCoset` (`GroupTheory/DoubleCoset.lean:37`), `RootPairing.weylGroup` (`LinearAlgebra/RootSystem/WeylGroup.lean:55`), `Module.End.eigenspace` (`LinearAlgebra/Eigenspace/Basic.lean:423`), `LieAlgebra.IsSolvable` and `derivedSeries` (`Algebra/Lie/Solvable.lean:259, 69`).
- Tau Ceti, Lie: `map_lieExp` (`Geometry/Lie/Functor.lean:315`), `lieMap_injective` (`Geometry/Lie/Faithfulness.lean:50`), `lieExp` (`Geometry/Lie/Exponential/Basic.lean:140`), `lieSubalgebraOfSubgroup` (`Geometry/Lie/Subgroup/LieAlgebra.lean:277`), `isEmbeddedLieSubgroup_of_isClosed` (`Geometry/Lie/Subgroup/Embedded.lean:157`), `conj_lieExp` (`Geometry/Lie/Adjoint/Exponential/Basic.lean:110`).
- Tau Ceti, Tits systems: `TitsSystem` (`GroupTheory/TitsSystem/Basic.lean:50`), `existsUnique_mem_bruhatCell`, `bruhatCell_injective`, `disjoint_bruhatCell_iff` (`Bruhat/Uniqueness.lean:111, 35, 99`), `standardParabolic`, `mem_standardParabolic_iff`, `coe_standardParabolic`, `subgroupB_eq_top_iff` (`Parabolic/Basic.lean:48, 152, 160, 206`), `standardParabolic_eq_of_subgroupB_le`, `standardParabolicOrderIso` (`Parabolic/Classification.lean:114, 146`), `normalizer_eq_of_subgroupB_le`, `normalizer_standardParabolic` (`Parabolic/Normalizer.lean:66, 77`), `parabolicDoubleCosetEquiv` (`Parabolic/DoubleCoset.lean:199`), `parabolicTitsSystem` (`Parabolic/TitsSystem.lean:110`), `ofRankOne` (`RankOne.lean:63`), `coxeterSystem` (`Coxeter.lean:178`).
- Tau Ceti, roots and matrices: `RootPairing.Base.existsUnique_map_eq` (`LinearAlgebra/RootSystem/Weyl/Bases.lean:170`), `stabilizer_eq_closure_wallReflections` (`LinearAlgebra/RootSystem/FundamentalDomain.lean:201`), `glTitsSystem`, `glTitsSystemWeylGroupMulEquivPerm` (`…/Diagonal/TitsSystem.lean:195, 270`; carrier `GL (Fin (n + 1)) k`), `iwasawaHomeomorph`, `existsUnique_iwasawa` (`…/Iwasawa.lean:224, 280`), `upperTriangularGroup`, `upperUnitriangularGroup`, `posDiagonalSubgroup`, `unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`…/RestrictedWeylGroup.lean:230`), `GL2Borel.mem_doubleCoset_weyl_iff` (`…/Bruhat.lean:218`), the KAK and maximal-compact theorems (`…/Cartan.lean:65`, `…/MaximalCompact.lean:158`), `existsUnique_posDef_mul_unitary` (`Analysis/Matrix/Polar.lean:76`).
- Tau Ceti, algebraic: `Cocharacter.parabolic`, `limit`, `levi`, `unipotent` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154, 208, 245, 277`), `borelSubalgebra` (`Algebra/Lie/Weights/Borel.lean:439`).

Every backticked library name in the README resolves at the pins. A second `map_lieExp` and `lieMap_injective` exist in `Geometry/Lie/ContinuousFunctor.lean:92, 105` for continuous homomorphisms; the README cites the smooth ones with their file and line, which is unambiguous.

### Suppliers, ownership and overlap

- **LieGroups (main).** Layers 0–4, 7, 9 exist at `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` lines 252–1199. `Suggested.lean` has `exists_monoidHom_of_lieHom` (196), `FiniteCartanMatrixModel` (459), `CartanInvolution` with `global_model` (484, 490), `IsRealReductive` (499), `IwasawaData` (509) with `Nplus` (567) and `chamber_normalizer_cover` (583), `iwasawaDecomposition` (598), `kakDecomposition` (605), `cartan_polar_decomposition` (612). The Layer 9 bullet at README lines 1355–1361 states the actual quotient `N_K(a)/Z_K(a)`, the compact normalizer representatives and `Ad(K)a = p`, as the contract says.
- **ReductiveGroups (main).** Layer 7 at line 2821: every parabolic `k`-subgroup is some `P_G(λ)` (2907), the relative root system (2929), the Tits system in the split case (2917, 2937). The contract matches.
- **AutomorphicFormsOnReductiveGroups (open).** §2.3a exists (its README line 373).
- **ArithmeticLocallySymmetricSpaces (open).** ALS.F.1 (line 580), ALS.0.1–0.3 and the names `realPoints_lieGroup`, `IsCartanInvolution`, `IsCartanInvolution.conj` exist there. The two leads of the citation tool are that roadmap's planned names, cited as such.
- **MordellLawrenceVenkatesh (open).** §3.10 exists (line 1462).
- **Consumers.** AutomorphicSpectralTheoryPartII, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups and FuchsianOrbifoldsPartII are open and in the merge order; KleinianGroups is open pull request #432. None is cited as a supplier.
- **Declared gaps.** `minimal-parabolic-orderings` and `real-compactness-criterion` have the same slugs in the README and the plan, name ReductiveGroups Layer 7, and each asks for one statement with its hypotheses. Borel–Tits 5.9 and 9.3 support them. Neither is provided by ReductiveGroups Layer 7, Mathlib or Tau Ceti today. Not findings. If R01 is applied and §9.2 becomes a citation, both gaps lose their only consumer here and should be dropped from this plan.
- **Board packages.** The index lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory; none concerns this subject.
- **Open pull requests.** #2229 is not among the 201 names of `scratch/open-pull-requests.md`; I read it with `roadmaps show`, as the overlap list names it. `scratch/overlaps.md` reports no other pull request changing this roadmap, no dropped id and no id defined only by a revision.

For ArithmeticLocallySymmetricSpaces I read the cited sections and names, not its whole scope section; for the others below I read "Scope and ownership" (for RealSemisimpleLieGroups, also Layers 0–4 in full, and for AutomorphicFormsOnReductiveGroups §2.3a in full, whose strict-chamber comparison matches the contract).

Overlap check: read RealSemisimpleLieGroups (#2229), FlagVarieties (#2114 and main), AutomorphicFormsOnReductiveGroups (#1037), ShimuraData (#1038), ArithmeticLocallySymmetricSpaces (#871), LieGroups (main), ReductiveGroups (main). Shared with RealSemisimpleLieGroups: the fifteen sections of R01, owner RealSemisimpleLieGroups. Shared with LieGroups: the restricted Weyl quotient and chamber coverage, owner LieGroups (now imported). Shared with AutomorphicFormsOnReductiveGroups: the minimal algebraic comparison, owner AutomorphicFormsOnReductiveGroups (imported). Nothing shared with FlagVarieties, ShimuraData, ArithmeticLocallySymmetricSpaces or ReductiveGroups beyond the cited imports.

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after MordellLawrenceVenkatesh (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1902 edges, 0 problem(s)
```

No UPWARD or CYCLE line. RealSemisimpleLieGroups is not in the merge order either; after R01 the gate should be run again, and this roadmap placed after it.

### Headlines and the Lean file

There is no `Suggested.lean` at the design stage. Elaboration: not available (this lane does not elaborate). No Lean command was run and no one-tactic probe was possible.

The README's headline theorems are: conjugacy of the underlying Cartan involutions and of Iwasawa triples; `P = MAN` and its Langlands decomposition; the Bruhat decomposition with cell coordinates; the Tits system; the classification of standard parabolic subalgebras and subgroups; the Langlands decomposition of `Q_{Π'}`; parabolic subgroups by type and Lie algebra; the dynamical description; the wall comparison; the complexification criterion. Their pinned forms are the six matrix statements of §8.2–§8.3, which use only native carriers and simple predicates.

Two points for the package stage, given R01:

- `exists_titsSystem_linear` and RealSemisimpleLieGroups' `exists_titsSystem` would state the same theorem on two carriers. After R01 the matrix headline should be kept only where it says more (disconnected groups, no semisimplicity).
- The twelve backticked names of this roadmap's own in the README are claims about a future `Suggested.lean`. They are consistent with the plan.

## Not verifiable

- **knapp2002**, **bourbaki-lie4-6**, **warner1972**, **wallach1988**: settled as uncertified. Their sections, pages and hypotheses were not read. Ten of the fifteen sampled targets have only these as locators.
- Lean elaboration, `#check` comparison and the padding probe: not available in this lane, and there is no Lean file.
- Ownership against open pull requests was checked only through the roadmap tools and the supplied lists. RealSemisimpleLieGroups was read at head `9a938c5`; a later head may differ.
- Whether RealSemisimpleLieGroups §4.4's complexification criterion is meant for reductive `𝔤₀` with centre: its text says "a Borel subalgebra of `𝔤₀ ⊗ ℂ`" and does not say. This decides the last line of repair step 3.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, arXiv v2 printed p. 3 (line 134): the source says a simple root is a positive root that is not a linear combination of other positive roots; it should be not a sum of two positive roots (non-negative integer combinations); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8235bf0e77e496e0dc3bb787fe5108436baee47c", "job": "REV-DESIGN-LieGroupsPartII~4", "model": "fable", "worker": "chris-x29"} -->
