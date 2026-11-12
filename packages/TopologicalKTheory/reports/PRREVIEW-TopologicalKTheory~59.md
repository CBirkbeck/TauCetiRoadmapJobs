# Review of TopologicalKTheory (pull request #1807 at 2faed4d)

**Verdict:** needs changes

## R01 (P2) — T1.5, T1.6d and T6.6 build on Tau Ceti's `projectivizationHomeomorph`, which cannot share an environment with Mathlib's projectivization topology

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 571–573: "In rank one the real and complex projective comparison homeomorphisms from native `Projectivization 𝕜 (Fin (n+1)→𝕜)` to `TauCeti.finiteGrassmannian 𝕜 1 (n+1)` are Tau Ceti's `projectivizationHomeomorph`". The same dependency is at lines 83–86, 985–990 and 1734–1737.
- **Claim.** Three targets need Tau Ceti's homeomorphism and Mathlib's `Projectivization.instTopologicalSpace` in the same environment:
  - T1.5's diffeomorphism to ComplexKahlerGeometry K7.1's CP structure;
  - T1.6d's comparison of rank-one cells and stage inclusions;
  - T6.6's homogeneous diffeomorphism.

  Tau Ceti states the homeomorphism on its own copy of that instance, and the two cannot be imported together at the pins. So no target owns the comparison on Mathlib's instance.
- **Witness.** `import Mathlib` followed by `import TauCeti.Topology.Grassmannian.Projectivization` fails: "environment already contains 'Projectivization.instTopologicalSpace._aux_1' from Mathlib.Topology.Algebra.Projectivization". `…Grassmannian.Plucker` and `…Grassmannian.Stabilization` fail the same way. ComplexKahlerGeometry lines 2711–2717 build K7.1 on Mathlib's instance.
- **Repair.**
  1. Lines 83–86: replace the clause with "the rank-one homeomorphism `projectivizationHomeomorph`, stated on Tau Ceti's own copy of the projectivization topology (`Topology/Algebra/Projectivization.lean` declares Mathlib's instance name again, so `Projectivization.lean`, `Plucker.lean` and `Stabilization.lean` are not imported together with Mathlib's instance)".
  2. Lines 571–575: replace them with "In rank one own the comparison homeomorphisms `Projectivization 𝕜 (Fin (n+1)→𝕜) ≃ₜ TauCeti.finiteGrassmannian 𝕜 1 (n+1)` on Mathlib's `Projectivization.instTopologicalSpace`, with underlying equivalence `Projectivization.equivSubmodule`, by Tau Ceti's argument (Mathlib's `Projectivization.continuous_iff` and `continuous_mk`, Tau Ceti's `finiteGrassmannian.isQuotientMap_frameSpan`), and their compatibility with the coordinate maps `TauCeti.finiteGrassmannian.map` (`Map.lean`);".
  3. Line 987 and line 1734: cite "T1.5's rank-one homeomorphism" in place of Tau Ceti's `projectivizationHomeomorph`.

  Tested: with `import Mathlib`, `TauCeti.Topology.Grassmannian.Basic` and `TauCeti.LinearAlgebra.Projectivization.Basic`, Tau Ceti's proof elaborates as `ℙ 𝕜 (Fin N → 𝕜) ≃ₜ finiteGrassmannian 𝕜 1 N` on Mathlib's instance (exit 0, no errors); `Map.lean` imports cleanly with Mathlib.

## R02 (P2) — DGFloerPartII and HomotopySpheres still own O, SO, the stable range and π_i(SO), which T7.1 owns

This carries R01 of the previous review, which is not repaired.

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 228–233: "T7.1 owns the stable orthogonal and special orthogonal groups O and SO … the stable range of those inclusions, the stable homotopy groups π_i(O) and π_i(SO), the loop comparisons ΩBO≃O and ΩBSO≃SO".
- **Claim.** This roadmap is on main, so it is the earlier owner, and open roadmaps cite it. Two open roadmaps still own the same objects:
  - DGFloerPartII owns O, SO, their stable range and π_i(SO);
  - HomotopySpheres owns the stable SO table and ΩBSO≃SO.

  So these objects still have two owners.
- **Witness.** DGFloerPartII at its unchanged head 43d9b63: README line 71 claims "the stable orthogonal and special orthogonal groups with the finite-to-stable range (4.2a)"; `Suggested.lean` lines 362–395 state the five SO theorems. HomotopySpheres at 7fbf648, README lines 41 and 140–150, likewise.
- **Repair.** The repair is outside this folder. Nothing in this folder changes.
  1. In DGFloerPartII (#1799):
     - 4.2a cites TopologicalKTheory T7.1 for O, SO, the block inclusions and the stable range;
     - 4.2c cites T7.1 for π_i(O) and π_i(SO);
     - its `Suggested.lean` drops the five theorems listed in the Witness;
     - U, Sp, the Clifford chain and the Morse-theoretic Bott maps stay in DGFloerPartII.
  2. In HomotopySpheres (#1287), §4A–4B cite T7.1 for stable O/SO, ΩBSO≃SO and the stable SO table.
  3. Both descriptions name #1807 as a dependency.

  Tested: nothing is lost. For k=j+1, DGFloerPartII's three π_(j+1)(SO(m)) cases match this file's table:

  | j mod 8 | DGFloerPartII | this file |
  |---|---|---|
  | 1, 3, 4, 5 | trivial | `ZMod 1` |
  | 0, 7 | ℤ/2 | `ZMod 2` |
  | 2, 6 | ℤ | `ZMod 0` |

  A search of this README for `HomotopySpheres` and `DGFloer` finds 0 lines, so the repair creates no cycle.

## R03 (P3) — A T7.1 Check says the colimit along A↦diag(A,−1) carries no group structure; it carries one

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 1948–1950: "sends the identity of O(n) to diag(1,…,1,−1), so it is not a homomorphism and its colimit carries no group structure".
- **Claim.** That colimit is homeomorphic to O, so it is a topological group. What fails is only that the matrix group laws of the stages pass to it.
- **Witness.** Set j_n(A)=diag(A,−1) and φ_n(A)=−A. Then φ_(n+1)(j_n(A)) = diag(−A,1) = ι_n(φ_n(A)), so the φ_n identify the two colimits. The group law transported to the stages is A*B=−AB.
- **Repair.** Replace the sentence with "The map A↦diag(A,−1) sends the identity of O(n) to diag(1,…,1,−1), so it is not a homomorphism of the matrix groups and their group laws do not pass to its colimit; the determinant is also not compatible with it."

## R04 (P3) — T4, the complex Bott periodicity layer, has no Checks

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 1315–1392. T4 defines generalized clutching, the companion pencil, the inside Riesz projector and V_d(E,p). The nearest **Checks.** lists are at line 1290 (T3.4) and line 1406 (T5.1).
- **Claim.** None of T4's definitions has a Checks list. Each needs at least three discriminating Checks.
- **Witness.** `awk` lists the line numbers of the **Checks.** headers; none falls between 1315 and 1392. The sign checks are stated only in prose at line 1376: "computing z, z^(−1), identity and scalar powers".
- **Repair.** After item 6 insert:

  ```text
  **Checks.**
  - Companion pencil, d=1: for p(z)=p₁z+p₀ the 2-block pencil with upper row (1,−z) and final row (p₁,p₀) has block determinant p₀+p₁z=p(z), so it is invertible on the circle exactly where p is; an upper row (1,z) would give p₀−p₁z=p(−z).
  - β-coefficients over a point, E the trivial line: z gives V=E, coefficient 1, class [L]=1+β; z⁻¹ gives 0−1=−1, class [L⁻¹]=1−β; z² gives 2, class [L²]=1+2β since β²=0; a nonzero constant gives 0 and class 1. The reversed sign would give z⁻¹ the class [L].
  - Inside projector: for B=diag(0,2) it is diag(1,0); for the non-normal B=[[1/2,1],[0,2]], with eigenvectors e₁ and (2,3), it is [[1,−2/3],[0,0]], idempotent and commuting with B; the orthogonal projection onto ℂe₁ sends (2,3) to (2,0)≠0 and is excluded.
  ```

## R05 (P3) — T6.6's third Check is vacuous

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 1771–1774: "for r=2 the standard representation restricts to `t₁+t₂≠0`".
- **Claim.** The Check is meant to test injectivity of restriction. Every nonzero representation restricts to a nonzero class under any restriction, so the Check also holds for a non-injective restriction.
- **Witness.** Restriction to the non-maximal subgroup U(1)×1 is not injective: it sends V to t+1, which is nonzero, while [V]−[det V]−1 goes to (t+1)−t−1=0. The Check passes there too.
- **Repair.** Replace the last sentence with "For r=2 the class [V]−[det V]−1 of the standard representation maps to t₁+t₂−t₁t₂−1=−(t₁−1)(t₂−1)≠0 in R(T); restricted instead to the non-maximal U(1)×1 it maps to (t+1)−t−1=0, so injectivity needs the full torus."

## R06 (P3) — AlgebraicTopology still lists only T1.5 as a consumer of §5.5's homotopy sequence

This carries R02 of the previous review, which is partly repaired.

- **Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:
  - line 2522: "TopologicalKTheory T1.5 consumes the based homotopy sequence";
  - lines 5334–5336: "(T1.5), the CW and Whitehead tools of Layers 4 and 8.5 (T1.6)".
- **Claim.** These sentences name only part of what this roadmap consumes:
  - T7.1 consumes §5.5 at this README's lines 147–148, 1939 and 1982;
  - T1.5 consumes §4.6 (line 165);
  - T7.1 consumes §4.8 (line 1909);
  - T7.0 consumes §8.5 (line 1835).
- **Witness.** The tower item is repaired: AlgebraicTopology line 5391 now reads "`cofibrationTowerHomotopyEquivalence` (MorseTheory, DGFloerPartII)". Line 2522 and lines 5334–5336 still say what they said at 88b5f6b.
- **Repair.**
  1. Line 2522: "TopologicalKTheory T1.5 and T7.1 consume the based homotopy sequence".
  2. Lines 5334–5336: "TopologicalKTheory consumes §5.5's based homotopy long exact sequence (T1.5, T7.1), §4.6's projective spaces (T1.5), §4.8's compact generation (T7.1), the CW and Whitehead tools of Layers 4 and 8.5 (T1.6, T7.0), and §4.5's Kelley product CW structure and based homotopy inverses with §8.1's Kelley-product comparison of homotopy groups (T7.0)."

## R07 (P3) — The description does not say that TopologicalKTheory's `Suggested.lean` drops 21 declarations

- **Location.** The description's TopologicalKTheory paragraph: "Its Suggested.lean states π_k(O(n)) for n ≥ k+2."
- **Claim.** The folder's change against main removes 21 Lean declarations and adds 1. The description names only the one it adds.
- **Witness.** The worker's change list for this folder: "Lean declarations: 21 removed, 1 added". Among the removed are `partitionGap`, `RelativeSymbol`, `exists_finite_trivial_embedding`, `finiteGrassmannian` and `finiteGrassmannianQuotientConventionEquiv`.
- **Repair.** Replace the sentence with: "Its Suggested.lean drops its 21 declarations. The finite Grassmannian, frame and orthonormal-span carriers and the gap-partition colouring are now pinned in Tau Ceti, and `exists_finite_trivial_embedding` is now Tau Ceti's `exists_continuous_injective_fin_of_compactSpace`. `RelativeSymbol`, `exists_continuous_inside_projection` and `isUnit_segment_of_uniform_inverse_bound` stay README targets (T3.1, T4.4, T4.2). The file now states one headline, π_k(O(n)) for n ≥ k+2."

## R08 (P3) — Article typo in the Fredholm supplier paragraph

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 248–249: "an closed-manifold index consumer must reuse this construction."
- **Claim.** The article is wrong.
- **Witness.** The two words "an" and "closed-manifold" sit on either side of the line break at line 248.
- **Repair.** "a closed-manifold index consumer must reuse this construction."

## Previous findings

- **R01 (r58), carried as R02: not repaired.** DGFloerPartII's head is still 43d9b63. Its README line 71 and `Suggested.lean` lines 362–395 are unchanged.
- **R02 (r58), carried as R06: partly repaired.** AlgebraicTopology line 5391 now names "MorseTheory, DGFloerPartII", so the tower citation is fixed. Line 2522 still names only T1.5.
- **r58 remarks, all repaired.**
  - Sphere connectivity is now consumed from Tau Ceti (lines 128–144, 505–511, 1936–1939).
  - T2.5 now has four Checks (lines 1156–1175).
  - The run-together digits ("it is1", "rank0") are gone: the regex `[a-z][0-9][a-z]| and[0-9]` finds no line.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| T2.0 group completion (seeded) | `X=∅`; `pt`; discrete `ℕ`; Hatcher §2.1 | zero ring; `ℤ` by n−m; `(n)ₙ∈∏ℤ`; source: E₁−E₁′=E₂−E₂′ iff E₁⊕E₂′≈ₛE₂⊕E₁′, transitivity by cancellation | supported; the arbitrary-G relation is transitive without compactness |
| T2.0 Check TS² | `TS²⊕1≃1³` | `[TS²]=2` with G=1; β has rank 0 and is nonzero | agrees |
| T7.0 shear inverse (seeded) | `π₄(BO)=ℤ`; `π₁,π₂(BO)=ℤ/2` | `sh_*=(a,a+b)` forces `ν_*=−1`; on ℤ/2, −1 is +1 | agrees |
| T7.0 complement class | `γ⊕γ⊥≅1^N` | `[γ⊥]−(N−k)=−([γ]−k)`; full class `[γ⊥]−N=−[γ]` | agrees |
| T7.0 track | `k=1,N=2`; `k=0,N=1` | planes `(e₁,e₂)` then `(e₂,e₀)`, ending at `span e₀`; quarter-turn counterclockwise then clockwise | as stated; backtracking loop |
| `nonempty_homotopyGroup_orthogonalGroup_mulEquiv` | k=i+1 = 1,2,3,7,8,9,11, with n≥k+2 | `rfl`: 2,1,0,0,2,2,0; true groups ℤ/2, 0, ℤ, ℤ, ℤ/2, ℤ/2, ℤ | agree |
| same, padding probe | `simp`; `infer_instance`; `exact ⟨MulEquiv.refl _⟩` | unsolved goals; instance not synthesized; type mismatch | headline, not padding |
| K(S²)=ℤ[β]/(β²) (T4; docstring) | `L⊕L≃L²⊕1` | `(1+β)²=1+2β` gives `β²=0`; no `FiniteRank/Monoidal.lean` at the pin | not statable, named |
| Complex Thom (T5.3) | trivial line over pt | `Kc(pt)=ℤ→Kc(ℂ)=ℤβ`, `1↦−β`; wedge-only form `(−1)¹·(−β)=β` | consistent with the T3.1 and T5.1 Checks |
| Equivariant Thom (T6.7) | `G=1`; `G=S¹` on ℂ with weight 1 | `ℤ≅Kc(ℂ)`; `R(S¹)=ℤ[t,t⁻¹]` | not statable, named |
| Real Bott, KO form (T7.1) | KO⁰, KO⁻¹ | `ℤ≅ℤb`; `ℤ/2≅ℤ/2` under ·b | not statable, named |
| Coefficient sequence | q=0,2,4,8 | a₋₁=a₋₂=a₋₃=0, a₋₄=ℤ; δ:ℤ→ℤ has image 2ℤ; 0→a₄→ℤ→ℤ/2→0; a₈≅K⁻⁸ | ℤ,ℤ/2,ℤ/2,0,ℤ,0,0,0 |
| Coefficient ring | `c(a)=2u²`, `c(b)=u⁴` | `c(a²)=4u⁴=c(4b)`, c injective on a₈; `ηa∈a₅=0`; `r(u³)∈a₆=0` | `a²=4b` |
| (1,1)-periodicity | X=pt, (0,0)→(1,1) | `KR(pt)=ℤ→KR^(1,1)(pt)=ℤβ_R`; β_R on the fixed points is `[Möbius]−1=η≠0` | agrees with the Check |
| Eightfold symbols | n=1 on Λ(ℝ); dimensions | `A²=−1`, `B²=1`, `AB+BA=0`; `16·16=256`; n=1: 4>2; n=4: 64>16 | as stated |
| Eightfold route | composites μ∘b and b∘μ | both are ±β_R⁸, so b is injective, and onto for p≥8; block sign `(−1)^(8p)=1` | as stated |
| Stable equivalence ℤ×BO→Ω⁸ | π₀, π₁ | `ℤ→π₈=ℤ`, `1↦b`; `ℤ/2→π₉=ℤ/2` | isomorphisms; not statable (no BO at the pin) |
| Numerable classification (T1.6a; docstring) | n=1, X=S¹ | `[S¹,RP∞]=ℤ/2`, the trivial and Möbius lines; no infinite Grassmannian at the pin | not statable, named |
| R01 imports | `import Mathlib` with 10 Tau Ceti modules | Basic, Orthonormal, Graph, Tautological, Map, Oriented, Orientation.Cover load; Projectivization, Plucker, Stabilization clash | repair compiles, exit 0 |
| R02 table | j mod 8 | trivial at 1,3,4,5; ℤ/2 at 0,7; ℤ at 2,6, equal to this file's values at k=j+1 | duplicate owner |
| R03 wrong model | `j_n(A)=diag(A,−1)`, `φ_n(A)=−A` | `φ_(n+1)j_n(A)=diag(−A,1)=ι_nφ_n(A)`; transported law `A*B=−AB` | the colimit is a group |
| R04 proposed Checks | z, z⁻¹, z², c; d=1 pencil; `B=[[1/2,1],[0,2]]` | coefficients 1, −1, 2, 0; `det=p₀+p₁z`; `P=[[1,−2/3],[0,0]]` with `PB=BP=[[1/2,−1/3],[0,0]]` | as proposed |
| R05 restriction | `U(1)×1⊂U(2)`; torus T | `V−det−1↦(t+1)−t−1=0`; on T it maps to `−(t₁−1)(t₂−1)≠0` | the old Check holds on both |
| R06 consumers | Stage 5.5, §4.6, §4.8, §8.5 citations here | T1.5 and T7.1 (lines 147, 1939, 1982); lines 165, 1909, 1835; AT lists T1.5 and T1.6 | incomplete |
| R07 description | diff against origin/main | 21 declarations removed, 1 added; the text names the 1 | omission |
| T1.1 Checks | CP¹ line; rank 1 at 0 on ℝ | transition z, cocycle `1·z·z⁻¹=1`, class 1+β against 1; the stratum {0} is not open | as stated |
| T1.5a degree | m=1, 2 | `(cos2θ,sin2θ)` has degree 2, giving π₁(SO(3))=ℤ/2; degree 0 gives π₂(V₂(ℝ⁴))=ℤ | agrees |
| T1.6b/c signs | k=1,…,4 | inversions 0,1,3,6; ε=+,−,−,+; `ε_kε_(k+1)(−1)^k=(−1)^(k²+k)=1` | agrees |
| T2.5 coefficient | `u=1+at+bt²` | `a`, `a²−2b`, `a³−3ab` = N₁, N₂, N₃ at e₃=0; without u⁻¹, −2b | agrees |
| T3.5 block matrix | M*M, MM* | diagonals `σ*σ⊗1+1⊗τ*τ` and `σσ*⊗1+1⊗ττ*`; cross terms `−σ*⊗τ*+σ*⊗τ*=0` | agrees |
| T6.4 Checks | S₃, f=(12), k=(13); Klein bottle | `(12)(13)≠(13)(12)`; `H₁=ℤ⊕ℤ/2`, so it is not the torus | agrees |
| T7.1 stable range | (i,n)=(1,2), (1,3), (3,4), (3,5) | ℤ→ℤ/2 onto; bijective; ℤ²→ℤ onto; ℤ≅ℤ | onto at n=i+1, bijective for n≥i+2 |
| T7.1 loop and KR Checks | `w₃diag(1,A)w₃`; S^(1,0), S^(0,1), S^(1,1), S^(2,0) | `[[d,c,0],[b,a,0],[0,0,1]]`; swapped, fixed, two fixed points, free | agrees |

- **Gate.** Re-run with `--base origin/main`: every check 0 except `outside-folder=24`, the two files of each of the 12 folders the brief names as this pull request's own; filtered `git diff --stat` empty; `git merge-tree` with origin/main clean; the worker's gate passed, `build=0` included.
- **Dependency check.** `depcheck: 236 roadmaps, 2156 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean …/Suggested.lean` exits 0 in 5.2 s, only `sorry` at 58:8; the elaborated type equals the signatures file and README lines 2165–2168 (i≥1, n≥i+2 ↔ `i + 3 ≤ n`); no section variables, `set_option` or sorry'd data.
- **Source locators: 16 checked.** `hatcher-vbkt` lines 1515–1549, 788–795, 1466, 100–102, 4168; `mitchell-principal-bundles` lines 76, 84, 100–113, 152, 228, 554; `kolar-michor-slovak` lines 3986, 4025–4034, 4124–4235; `debray-freed-ktheory` lines 803–806; `kriz-may` line 68.
- **Library declarations.** About 55 Tau Ceti and 4 Mathlib declarations opened at the pins, all present, e.g. `subsingleton_homotopyGroup_sphere_of_lt` (Sphere/HomotopyGroup.lean:66), `TauCeti.PrincipalBundle` (Principal.lean:156), `OrthonormalFrameBundle.exists_trivialization` (:499), `ContRepresentation` (Continuous/Basic.lean:55, no continuity in G).
- **Cross-roadmap citations: 20 resolved.** AlgebraicTopology §§4.5, 4.6, 4.8, 5.5, 8.1, 8.5 and lines 5395–5404; GeneralizedCohomology G2.8, G4.0b, G5.0; ComplexKahlerGeometry K1, K5, K7.1, K7.2 and line 2924; CharacteristicClasses C1.1d; SpinRepresentations Layer 7; AutomorphicFormsOnReductiveGroups' gap (#1037 line 53); `roadmaps resolve` lists nothing missing.
- **Ownership.** `roadmaps grep` for KR, ABS and real Bott finds second owners only in DGFloerPartII and HomotopySpheres (#284, #1287; R02); GeneralizedCohomology G5.5 consumes T7's ABS; none of the 21 removed Lean names is cited outside this roadmap (main, #1854).
- **Overlaps.** #1808 and #1854 also change this folder, ordered this PR → #1808 → #1854 in the description; no cited id is dropped, and this pull request drops no cited id.

## Not verifiable

- **Atiyah, *K-theory and reality* (1966).** It is cited for §2 and Theorem 3.10. The sources service found no legal copy: the DOI landing page at academic.oup.com returned 403, and the manifest has no key for it.
- **Settled as uncertified** and cited by locator, not read: `sibson-1969` (T7.0, seeded), `abs-1964`, `atiyah-bott-1964`, `husemoller-fibre-bundles`, `atiyah-1968-bott-index` and `eschenburg-hanke-bott`.
- **`segal-1968`** is cited as a whole paper with no locator, so there was nothing to check.
- **Ownership against open pull requests** was checked through the sibling checkouts and `roadmaps grep` only.

## Source issues

- none
