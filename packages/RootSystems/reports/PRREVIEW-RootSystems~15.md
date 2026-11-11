# Review of RootSystems (pull request #2212 at 41120c6)
Folder: `TauCetiRoadmap/RepresentationTheory/RootSystems/`

**Verdict:** needs changes

## R01 (P2) — The Summary's finiteness criterion drops finite generation

**Location:** `README.md:10–11`: "the criterion that a Coxeter group is finite exactly when its geometric form is positive definite".

**Claim:** As worded the criterion is false. The roadmap's index type is arbitrary (Conventions, `README.md:105–106`), and the headline `finite_iff_geometricForm_posDef` (`Suggested.lean:122`) also requires `Finite I`.

**Witness:** This is the roadmap's own §3.3 Check (`README.md:907–911`): for I = ℕ with entry 3 at consecutive nodes, the form is positive definite (leading minors of each Aₙ segment are positive) but W contains every S_{n+1}, so W is infinite.

**Repair:** Replace the clause with "the criterion that a Coxeter group is finite exactly when it has finitely many generators and its geometric form is positive definite". On the I = ℕ chain the second condition fails and W is infinite, as the corrected sentence says.

## R02 (P3) — Gate failure: seven short names read as roadmap-own declarations

**Location:** `README.md:381–383` and `README.md:1003–1005`: "`TauCeti.DynkinType.coxeterMatrix_A`, `coxeterMatrix_B`, `coxeterMatrix_C`, `coxeterMatrix_E6`, `coxeterMatrix_E7`, `coxeterMatrix_E8`, `coxeterMatrix_F4` and `coxeterMatrix_G2`".

**Claim:** The gate fails with `readme-ids-missing=7` (rule: a backticked name of the roadmap's own must be declared in `Suggested.lean`). The seven unqualified names are Tau Ceti declarations, but the gate reads them as this roadmap's own.

**Witness:** Gate rerun at this head: `readme-ids-missing: coxeterMatrix_B … coxeterMatrix_G2 … FAIL`. All seven are in `TauCeti/LinearAlgebra/RootSystem/Coxeter/DynkinType.lean` (lines 189, 198, 257, 264, 271, 287, 296).

**Repair:** In both places write the full names: `TauCeti.DynkinType.coxeterMatrix_B`, `TauCeti.DynkinType.coxeterMatrix_C`, `TauCeti.DynkinType.coxeterMatrix_E6`, `TauCeti.DynkinType.coxeterMatrix_E7`, `TauCeti.DynkinType.coxeterMatrix_E8`, `TauCeti.DynkinType.coxeterMatrix_F4`, `TauCeti.DynkinType.coxeterMatrix_G2`. All seven resolve at the Tau Ceti pin, and every other gate counter is 0.

## R03 (P3) — `FiniteCoxeterType.ofDynkinType` is named but not declared

**Location:** `README.md:999`: "`FiniteCoxeterType.ofDynkinType` sends the Dynkin types A n, D n, E6, E7, E8 and F4 to the types of the same name". The name appears again as `ofDynkinType t` at `README.md:1006` and `1073`.

**Claim:** An API bullet uses a backticked name of the roadmap's own that `Suggested.lean` does not declare. No headline needs it: the pull request's description calls it a README target.

**Witness:** `grep ofDynkinType Suggested.lean` returns nothing. The citation resolver finds `ofDynkinType` nowhere at the pins or in any roadmap.

**Repair:** State it in prose without a name. At line 999, write "The dictionary from Dynkin types sends A n, D n, E6, E7, E8 and F4 to the types of the same name, …". At line 1006, write "… a Coxeter group with the matrix of the image of t." At line 1073, write "… and hence of the image of t under this dictionary."

## R04 (P3) — Two targets in §§3.4–3.5 have no locator

**Location:** `README.md:926–928`: "Prove that B(x,x)=Σ_K B_K(x_K,x_K) … and that B is positive definite if and only if B_K is positive definite for every component K." Also `README.md:1018–1020`, the statement of `finite_iff_forall_connectedComponent`.

**Claim:** Neither target carries a locator. The only locators nearby belong to the graph definition and to Proposition 4.1.7.

**Witness:** davis08 lines 17326–17332, §C.1, printed p. 433, state both facts in Davis's own setting: a decomposable matrix is positive definite exactly when each indecomposable principal block is, and with Theorem 6.12.9 this reduces finite Coxeter groups to the irreducible case.

**Repair:** After "positive definite for every component K" add "(Davis, §C.1, p. 433)". After "the matrix of a valid type" at line 1020 add "(Davis, §C.1, p. 433, with Theorem 6.12.9, p. 119, and Theorem C.1.2, p. 433)".

## R05 (P3) — The new Conventions sentence contradicts Layer 1

**Location:** `README.md:114–115`: "Finiteness of I or of W and positive definiteness of B occur only in §§3.3–3.5, as stated hypotheses or conclusions."

**Claim:** Finiteness of I is also a hypothesis in Layer 1. §3.3's own volume route relies on that Layer 1 transport.

**Witness:** `README.md:609`, in §1.3: "For finite I, transport to `I → ℝ` through `Finsupp.linearEquivFunOnFinite`". `README.md:655`, in §1.4: "With finite I the form is the usual integral Gram matrix."

**Repair:** Replace the sentence with "Finiteness of W and positive definiteness of B occur only in §§3.3–3.5, as stated hypotheses or conclusions; before them, finiteness of I enters only the coordinate transport to `I → ℝ` of §1.3 and the integral Gram matrix of §1.4."

## R06 (P3) — The description's summary block states the classification without finite generation

**Location:** Pull request description, summary block: "a Coxeter group is then finite exactly when every component of its graph has one of these types."

**Claim:** The head's `finite_iff_forall_connectedComponent` (`Suggested.lean:193–198`) requires `Finite I` as well. Without it the sentence is false.

**Witness:** README §3.4 Check (`README.md:966–969`): for I = ℕ with every off-diagonal entry 2, every component is A 1, yet W is an infinite elementary abelian 2-group.

**Repair:** Replace the sentence with "a Coxeter group is then finite exactly when it has finitely many generators and every component of its graph has one of these types."

## R07 (P3) — Source id davis08 has no manifest record

**Location:** `README.md:1558–1565`: "M. W. Davis, *The Geometry and Topology of Coxeter Groups*, … source id davis08, [author's copy](https://people.math.osu.edu/davis.12/davisbook.pdf)".

**Claim:** The README cites the key `davis08`, but the roadmap's manifest has no record of it, although §§3.3–3.5 rest on it.

**Witness:** `grep -c davis packages/RootSystems/sources.toml` gives 0, and the manifest has only seven `[[source]]` tables. The sources service fetches the author's copy legally (author page).

**Repair:** Add a `[[source]]` record `davis08` to `packages/RootSystems/sources.toml` through `sources fetch --id davis08 --licence-class author-page`, using the author's URL. Give the locators of `README.md:1562–1565` and `cited_for` = 3.3, 3.4, 3.5.

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result |
|---|---|---|---|
| §3.3 `finite_iff_geometricForm_posDef` | empty I; A₁; I₂(5); ∞ pair; chain 3,7; triangle 3,3,3; ℕ chain | \|W\| 1, 2, 10 with Gram det 1, (5−√5)/8≈0.345; ∞ pair 0 at (1,1); det −0.0617; 0 at (1,1,1); ℕ: positive definite, W infinite | Pass; `Finite I` needed |
| §3.3 volume route | A₁; I₂(5) | vol D / vol(C∩D) = 2/1 = 2 and π/(π/10) = 10, equal to the group orders; C has angle π/5 | Pass |
| §3.3 averaging route | A₁; A₂ | B′(x,αᵢ)=cᵢB(x,αᵢ); (cᵢ−cⱼ)B(αᵢ,αⱼ)=0 forces cᵢ=cⱼ on edges; B=B′(Δ·,Δ·) | Pass |
| §3.4 form decomposition | A₁²; A₂; ℕ with all entries 2 | blocks [1],[1]; one 2×2 block; each block [1], B is the dot product, W infinite | Pass; no locator (R04) |
| §3.4 `isComplement'_parabolic_compl` | A₁², J={0}; A₂, J={0}; J=∅ | 4 products, each unique; A₂ gives {1,s₁,s₂,s₁s₂} only, missing s₂s₁, s₁s₂s₁; w=1·w | Pass; entry hypothesis needed |
| §3.5 `FiniteCoxeterType` entries and rank | I 5, I 6, I 1, B 2, B 3, H3, H4, F4, D 5 | entries 5, 6, 2, 4, (1,2)=4 and (0,1)=3, 5, 5, 4; rank 5 (`decide`/`simp` at pin) | Pass |
| §3.5 `Valid` | A 0, B 1, D 3, I 3, I 4 | all invalid; A 2 = I 3, B 2 = I 4, A 3 = D 3 as matrices | Pass; ranges give uniqueness |
| Native D vs Mathlib D | D 4 | native (2,3)=2, (0,1)=(1,2)=(1,3)=3; Mathlib (1,2)=(2,3)=(1,3)=3, form 0 at (0,1,1,1) | Pass; README uses native |
| `FiniteCoxeterType.connected_graph_and_posDef` | A₁–A₆, B₂–B₆, D₄–D₇, E₆–E₈, F₄, H₃, H₄, I 5–I 8 | det 2B: n+1; 2; 4; 3,2,1; 1; 0.764; 0.146; 1.382, 1, 0.753, 0.586 = 4sin²(π/m) | Pass; matches Table C.1 |
| H₃/H₄ leading minors | Mathlib numbering | 1, 3/4, 0.0955 = (3−√5)/8; 1, 3/4, 1/2, 0.00912 = (7−3√5)/32 | Pass |
| Comparison vectors (§3.5) | the seven configurations | cycle 0; ∞ pair 0; (3,6) chain 0; C̃ₖ 0 (k=2..5); B̃ᵣ 0 (r=1..4); 3,5,3 gives −0.472; 5,3,3,3 gives −0.416 = 13−6√5 | Pass |
| Label bounds | c(m)=4cos²(π/m) | c3+c5 = 3.618 < 4; c4+c4 = 4; c4+c5 = 4.618; c3+c6 = 4 | Pass: labels in {3,4,5}, at most one ≥ 4 |
| Symmetrizer for labels 3, 4 | tree with one 4-edge | dA at the 4-edge is −2 = √2·2·(−√2/2); 3-edges −1 (d=1), −2 (d=2) | Pass |
| `existsUnique_finiteCoxeterType` | two commuting nodes; empty I; ℕ chain; B₃ vs C₃ | disconnected: no type; empty: `Connected` fails; ℕ connected and positive definite with no type; B₃ and C₃ both give B 3 | Pass; `Finite I` needed |
| Uniqueness invariants | D₄, D₅, E₆; B₄, F₄; I 5, H3 | leaves at the degree-3 node: 3, 2, 1; 4-edge has a leaf / has none; rank 2 vs 3 | Pass |
| `finite_iff_forall_connectedComponent` | empty; A₁²; ℕ with all entries 2 | no components, W=1; two A 1 components, \|W\|=4; all components A 1 but W infinite | Pass; `Finite I` needed |
| Summary sentence | ℕ chain with labels 3 | form positive definite; W ⊇ S_{n+1} for all n, so infinite | Fails as worded (R01) |
| Conventions sentence | §1.3 line 609; §1.4 line 655 | "For finite I" occurs outside §§3.3–3.5 | Fails as worded (R05) |
| §1.3 `geometric_faithfulness` | A₂; ∞ pair; empty I | ρ(s₁s₂)α₁ = α₂; ρ(s₁s₂)α₁ = 3α₁+2α₂; trivial W on the zero space | Pass |
| §1.4 `integral_geometric_realization` | A=[2]; A=[1] | x ↦ −x, c(−1) = −1; [1] violates A = 2B on the diagonal | Pass |
| §2.2 length and Poincaré | A₂; G₂ | lengths 0,1,2,3; 1+2q+2q²+q³ sums to 6; longest length 6, order 12 | Pass |
| §3.1 consumed classification | B₂/C₂; A₀ | `(C 2).Valid` false, `(B 2).Valid` true, C needs n ≥ 3 (`#print` at pin); A 0 invalid | Pass |
| §3.2 `nonempty_weylGroup_mulEquiv_perm_of_typeA` | n = 0..3 | orders 1, 2, 6, 24 = (n+1)! | Pass |
| §4.2 `eq_highestRoot_of_forall_root_add_notMem` | B₂ at α₁+2α₂ and α₁+α₂; A₁² | 2α₁+2α₂ and α₁+3α₂ not roots, so highest; α₁+2α₂ is a root; A₁² has two maximal roots | Pass; irreducibility needed |
| §4.3 numbered counts | E₆, E₇, E₈ | positive roots 36, 63, 120; heights of the highest root 11, 17, 29 | Pass |
| §5.1 `weyl_based_complement` | A₂ | \|Aut\| = 12 = 6·2; base stabilizer {1, diagram flip} | Pass |
| §5.2 `existsUnique_basedAut_of_cartanMatrix` | A₁, A₂, B₂, D₄, E₆ | Cartan-preserving permutations 1, 2, 1, 6, 2, each extending once | Pass |
| §5.3 full integral data | rank 0; rootless rank 1, 2; SL₂ | Aut 1, {±1}, GL₂(ℤ); root 2 spans 2ℤ ⊊ ℤ | Pass |
| §6.1 components | A₂, A₁², empty | 1, 2, 0 components | Pass |
| §6.2 `invariantMetric_unique_scale` | A₁ forms xy, 3xy; A₁³ diag(1,2,5) | c = 3, unique; reducible case has three independent scales | Pass; irreducibility needed |

- Previous review (r14, on the earlier revision at 16d2d99): accepted, with no open finding. Its repairs persist at this head: `rational_classification` is absent, the type A headline is present and the module header is unchanged.
- Gate rerun: FAIL, with only `readme-ids-missing=7` (R02); every other counter is 0. Dependency check: `depcheck: 205 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The diff adds no roadmap supplier.
- `lake env lean Suggested.lean`: exit 0, 15 `declaration uses sorry` warnings and nothing else. `#check @name` on the 8 new declarations through the built module: binders match the README (`Finite I` only in `existsUnique_finiteCoxeterType`).
- One-tactic probe (`simp`, `rfl`, `decide`, `infer_instance`, `exact?`, `aesop`) on the five new theorems: none closes. Twenty `decide`/`simp` examples on the new definitions pass.
- Source locators checked against the text: 25. davis08: 9, including Table 6.1 rendered at printed p. 104. milne17: 9 (C.16, C.21–C.25, C(g) p. 621, table (180), C.55 p. 625). sga3iii: 7 (6.1.3, 6.7.1, 6.7.2, 7.3.2, 7.3.4, 7.4.5, 7.4.6, pp. 90–106).
- Library declarations: 44 resolved by `#check` at the pins, and the 14 file paths the new contracts name were confirmed. No native finiteness criterion, Coxeter product decomposition or finite-Coxeter enumeration exists in Mathlib or Tau Ceti; the Loogle leads are unrelated.
- Ownership: ReflectionInvariantTheory on main (`README.md:131`) and KacMoody on main (`README.md:61–65`) both name RootSystems as owner of the Coxeter classification and combinatorics. No open pull request changes RootSystems, and none cites §§3.3–3.5.
- Overlap check: read RootSystemsPartII, KacMoody and ReductiveGroups (main); OrthogonalTamagawaAndLatticeMass, SchubertGeometry, EnriquesSurfaces, PseudolineArrangementsAndOrientedMatroids and LieHighestWeight (open); and ReflectionInvariantTheory (main). Nothing is shared: PseudolineArrangementsAndOrientedMatroids 9.4–9.5 computes |H₃| = 120 from Tau Ceti's triangle-group orders and cites RootSystems §1.3, so it is a consumer, not a second owner.

## Not verifiable

- humphreys90, bourbaki46, bjornerbrenti05, humphreys72, kac90: settled as uncertified. They are cited by locator only in sampled §§1.3, 1.4, 2.2, 3.1, 3.2, 4.3 and 5.1–5.3, and those sections were checked against the pinned declarations instead.
- The 15 admitted theorems were elaborated and tested on instances, not proved.

## Source issues

- **Misprint** in davis08 at Lemma C.3.1, proof, p. 437: the source justifies the first inequality of (C.3) by A being positive definite; it should say positive semidefinite, the lemma's hypothesis; affects nothing.
