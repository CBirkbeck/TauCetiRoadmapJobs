# Review of TopologicalKTheory (pull request #1807 at 3748165)

**Verdict:** needs changes

## R01 (P3) — T3.2 attributes its sequence model to an unnamed source

**Location:** `TauCetiRoadmap/TopologicalKTheory/README.md` line 1281: "First construct the source's finite sequences of bundles on X with their differentials defined only on Y, exact there".

**Claim:** "the source" has no antecedent: no work is named in T3 before this line, and T3.2 (the sequence model, append-zero `L_n→L_(n+1)`, the Euler map) carries no locator.

**Witness:** Lines 1246–1296 name no author or title. The global-complex half of the item is `segal-1968` line 414 (Proposition (3.1), p. 139) with its Appendix (line 750, p. 148).

**Repair:** Replace the sentence opening by: "First construct the finite sequences of bundles on X with differentials defined only on Y and exact there (Atiyah–Bott–Shapiro, *Clifford modules*, §7), with isomorphism, homotopy and adjacent identity-pair stabilization. Separately construct global complexes exact on Y (Segal, *Equivariant K-theory*, Proposition (3.1), p. 139, and Appendix, p. 148) and prove …".

## R02 (P3) — the CompactGroups gap is located in a roadmap that is not on main, at the wrong section

**Location:** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 204–205 and 1558–1559: "`gap:banach-gfinite-density`, the gap that AutomorphicFormsOnReductiveGroups §2.1 declares on that layer".

**Claim:** This roadmap is on main and now points its reader to a roadmap that exists only in an open pull request; and that roadmap's §2.1 consumes the gap, it does not declare it.

**Witness:** AutomorphicFormsOnReductiveGroups is absent from main (open #1037). At its head the declaration "What CompactGroups must provide (gap:banach-gfinite-density)" is README line 54, in the supplier contracts; §2.1 starts at line 302. Main's text of this roadmap (line 86) names no roadmap.

**Repair:** Restore main's wording in both places: "under its Layer 5 contract `gap:banach-gfinite-density`, which its Banach-representation consumers record as a supplier gap, the G-finite vectors …". The statement of the theorem consumed (lines 1562–1564) already stands on its own.

## R03 (P3) — three headline theorems carry no locator at the claim

**Location:** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 1356–1358 (T4, "The proof follows the elementary clutching/polynomial approach of Atiyah–Bott"), line 1521 (T5.3, Thom isomorphism), lines 1844–1846 (T6.7, equivariant Thom and `R(G)≃K_(G,c)(V)`).

**Claim:** The product theorem, the Thom isomorphism and the equivariant Thom theorem are stated with no theorem number or page; T4 names a paper and a method only.

**Witness:** `hatcher-vbkt` line 1613: Theorem 2.2, p. 41, is T4's statement for compact Hausdorff X. `segal-1968` line 462: Proposition (3.2), p. 140, is T6.7's statement, for a locally compact G-space, proof deferred there to elliptic families.

**Repair:** T4, lines 1357–1358: "… for compact Hausdorff X (Hatcher, *Vector Bundles and K-Theory*, Theorem 2.2, p. 41). The route is the polynomial-clutching proof of Atiyah–Bott (1964);". T5.3, after "by multiplication by the Koszul class": "(Segal, *Equivariant K-theory*, Proposition (3.2), p. 140, for the trivial group)". T6.7, after "`R(G)≃K_(G,c)(V)`": "(Segal, Proposition (3.2), p. 140; Atiyah, *Bott periodicity and the index of elliptic operators*, §4, for the transfer argument)".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| T2.0 pair relation and group completion (seeded) | X=pt; X=∅; TS² over S²; ∐ₙpt; X=ℝ | pt: (ℂⁿ,ℂᵐ)↦n−m, ℤ. ∅: 1=0. TS²⊕1≃1³ gives [TS²]=2 with G=1. ∐: (n)ₙ∈∏ℤ, not ⊕ℤ. K⁰(ℝ)=ℤ, K_c⁰(ℝ)=0 | holds; `hatcher-vbkt` lines 1515–1549 (pp. 39–40) support it |
| T2.0 product over set-indexed unions | Gr(∏Mᵢ)→∏Gr(Mᵢ) | Onto: representatives chosen componentwise. Injective: aᵢ+gᵢ=bᵢ+gᵢ for each i gives a+g=b+g with g=(gᵢ) | holds |
| T7.0 shear inverse on BO (seeded) | π₄, π₁, π₂; track k=1,N=2; k=0,N=1; k=1,N=4 | sh_*(a,b)=(a,a+b), inverse (a,b−a), ν_*=−1 on π₄=ℤ, trivial on ℤ/2. Tracks: e₁→e₂→e₀; e₀→e₁→e₀; (e₁,e₂,e₃)→(e₀,e₁,e₂), planes never degenerate | holds; rank of [γ^⊥]−[1^N] is −k |
| `nonempty_homotopyGroup_orthogonalGroup_mulEquiv` (T7.1) | k=1,n=3; 2,4; 3,5; 4,6; 7,9; 8,10; boundary k=3,n=4; k=4,n=5 | Table at k mod 8: ℤ/2, 0, ℤ, 0, ℤ, ℤ/2 against π₁SO(3)=ℤ/2, π₂=0, π₃SO(5)=ℤ, π₄SO(6)=0, π₇SO(9)=ℤ, π₈SO(10)=ℤ/2. Excluded: π₃SO(4)=ℤ², π₄SO(5)=ℤ/2 | holds; n≥k+2 is sharp |
| T7.1 stable range | LES of O(n)→O(n+1)→Sⁿ; i=0; i=3 | π_(i+1)(Sⁿ)=0 for i≤n−2 gives bijection, π_i(Sⁿ)=0 for i≤n−1 gives onto. π₃: ℤ²→ℤ onto at n=4, bijective from n=5 | holds; Hatcher p. 108 states n>i+1 |
| T7.1 complexification sequence and coefficients | every step of lines 2211–2226 | a₋₁=a₋₂=a₋₃=0, a₋₄≅K²=ℤ; a₃ torsion inside ℤ so 0; δ(K⁻²)=2ℤ so c(a₂)=0, η²≠0; 0→a₄→K⁻⁴→a₂→0 gives c(a)=±2u² | Z, Z/2, Z/2, 0, Z, 0, 0, 0 |
| T7.1 product formula `b·μ(N₈)=±β_R⁸` | n=8, 4, 1; symbols on Λ(ℝ¹) | Graded irreducibles: 16·16=256=dim Λ(ℝ⁸); 8·8=64>16; 2·2=4>2. A(1)²=−1, B(1)²=1, AB+BA=0 on 1 and e | n=8 only, as stated |
| T7.1 ring `Z[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` | c∘r on u², u⁴; a² in M(Cl₈) | c(r(u²))=2u²=c(a); c(r(u⁴))=2u⁴=c(2b); a² has even dimension 32, m₁+m₂=4, class m₁−m₂∈{−4,…,4}; c injective gives 4 | holds |
| T7.1 loop comparison ΩBO≃O | n=2 conjugation; i=0 lift | w₃·diag(1,A)·w₃=[[d,c,0],[b,a,0],[0,0,1]]=diag(w₂Aw₂,1). Half-turn of lines lifts (1,0)→(−1,0), image −1∈O(1) | holds |
| T4 product theorem and `K(S²)≃Z[β]/(β²)` | d=1 pencil; z, z⁻¹, z², constant; non-normal B | Pencil reduces to diag(1,p₀+p₁z). β-coefficients 1, −1, 2, 0 give 1+β, 1−β, 1+2β, 1. P=[[1,−2/3],[0,0]], PB=BP=[[1/2,−1/3],[0,0]] | holds |
| T5.2–T5.3 projective bundle relation and Thom class | r=2 on P(M⊕1); r=0; trivial line | Σ(−1)ʲΛʲE·t^(r−j)=t²−(M+1)t+M=(t−1)(t−M). r=0: K(∅)=0. λ₋₁: 1−1=0; L: 1−(1−β)=β. Line class −β, wedge-only +β | consistent with Conventions |
| T6.6–T6.7 transfer and `R(G)≃K_(G,c)(V)` | r=1; r=2 class [V]−[det V]−1; elliptic-curve fibre | r=1 identity. Full torus: t₁+t₂−t₁t₂−1=−(t₁−1)(t₂−1)≠0. U(1)×1: (t+1)−t−1=0. H^(0,1)≠0 gives transfer(1)=0 | holds; projective fibre needed |
| T1.6a numerable classification, gap partition | weights (.7,.3); (1/2,1/3,1/6); tie (1/2,1/2) | q: .4, .3, sum 1·.4+2·.3=1. Three gaps of 1/6, sum 1/6+2/6+3/6=1. Tie: singletons 0, pair 1/2, sum 1 | holds |
| T1.5a first Stiefel groups | m=1,r=2; m=2,r=2; r≥3 | Degree 1−(−1)^m: 2 gives π₁V₂(ℝ³)=ℤ/2; 0 gives π₂V₂(ℝ⁴)=ℤ (S³×S²). Odd m: boundary image 2ℤ; even m: source ℤ/2 | holds |
| T1.6b–c signs | k=1..4; diagonal law | Inversions k(k−1)/2: 0,1,3,6, so ε=+,−,−,+. Exponent of ε_kε_(k+1)(−1)^k is k²+k, even. μ(e₀,e₁)=span(e₀,e₃)≠span(e₁,e₂) | holds |
| T2.3, T2.5 λ and Adams series | u=1+Lt; 1+at+bt²; (1+Lt)(1+Mt); β | Signed coefficients L, L², L³; a, a²−2b, a³−3ab; Lⁿ⁺¹+Mⁿ⁺¹. λ_t(β)=1+βt−βt²+…, so λʲ(β)=(−1)^(j−1)β | holds |
| T3.4–T3.5 boundary and block symbol | pair (D²,S¹); M*M, MM* | K⁻¹(D²)=0, K⁻¹(S¹)=ℤ→K(D²,S¹)=ℤ onto since K(D²,S¹)→K(D²) is zero. Cross terms −σ*⊗τ*+σ*⊗τ*=0; diagonals as listed | holds |
| T3.2 (R01) | search of lines 1246–1296 for a named source | No author or title; Segal Prop. (3.1) matches the global-complex half | finding |
| T6.1 density input (R02) | AutomorphicFormsOnReductiveGroups on main and at #1037 | Not on main. Declaration at line 54; §2.1 at line 302 consumes | finding |

- **Gate.** The worker's gate passed with `build=0`. My run with `--base origin/main` shows every check 0 except `outside-folder=24`, the two files of each of the 12 folders named as this pull request's own; the filtered `git diff --stat` is empty.
- **Dependency check.** `depcheck: 240 roadmaps, 2267 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0 with the one `sorry` warning (58:8). `#check @` of the one declaration: no binder lost; type equals the README statement (lines 2227–2230). One-tactic probe (`simp`, `infer_instance`, `exact ⟨MulEquiv.refl _⟩`) fails on all three; the table entries evaluate by `decide` to 2, 1, 0, 0, 2 at k=1, 2, 3, 7, 8.
- **Source locators: 14 checked against the text.** Hatcher §2.1 pp. 39–40 and Prop. 2.1 (lines 1505–1549), Thm 1.6, Prop. 1.7, Lemma 1.21 (788, 794, 1466), Theorem 2.20 (2450), §4.1 p. 108 (4168), Introduction p. 1 table (101–102); Mitchell Props 2.1, 2.2, 3.1, 3.6, Lemma 7.2 and the two pullback bijections (76, 84, 152, 228, 554, 97–108); Kolář–Michor–Slovák §§10.1–10.2, 10.6–10.9 (3986–4235); Kriz–May §9 title (68); Freed–Debray §5 (803–805); Segal Prop. (2.4) (231).
- **Library declarations: 160 backticked names searched at the pins, 34 opened.** Among them `SplitK0` (`CategoryTheory/GrothendieckGroup/Split.lean:128`), `FiniteRankBundleCore` (`Topology/VectorBundle/FiniteRank/Basic.lean:56`, `Preadditive` :118, biproducts `Biproduct.lean:353`, no monoidal instance), `PrincipalBundle` (`Topology/FiberBundle/Principal.lean:156`, `division` :191, `pullback` :423), `mem_serreFibrations_of_exists_trivialization` (`SerreFibration/FiberBundle.lean:365`), `subsingleton_homotopyGroup_sphere_of_lt` and `homotopyGroupSphereAddEquiv` (`AlgebraicTopology/Sphere/HomotopyGroup.lean:66`, :110), `specialOrthogonalGroupFundamentalGroupMulEquiv` (`Spin/UniversalCover.lean:237`), `PowerSeries.logDeriv_mul` (`RingTheory/PowerSeries/Log.lean:89`), `gapPartition` (`PartitionOfUnity/Gap.lean:419`); Mathlib `Projectivization.instTopologicalSpace` (`Topology/Algebra/Projectivization.lean:44`), `IsCoveringMap.liftHomotopyRel` (`Topology/Homotopy/Lifting.lean:343`), `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:55`). Tau Ceti's second `Projectivization.instTopologicalSpace` (`Topology/Algebra/Projectivization.lean:90`) and the imports of `Plucker.lean` and `Stabilization.lean` are as lines 91–95 say. No λ-ring or Adams-operation interface exists at either pin.
- **Cross-roadmap citations: 19 resolved** at this head or on main: AlgebraicTopology §§4.5, 4.6, 4.8, 5.5, 8.1, 8.5, 8.10–8.12 with its three consumer names (README lines 5424–5434); GeneralizedCohomology G2.8, G4.0b (defined in this pull request's own folder, line 2986), G5.0; CharacteristicClasses C1.1a, C1.1b, C1.5; ComplexKahlerGeometry K1, K5, K7.1, K7.2; CompactGroups Layers 0, 2, 4, 5; SmoothBundlesConnections B1.1, B1.2, B1.4, B2; BanachAlgebras A2; RepresentationTheory/RootSystems; GeometricTopology Layer 1. AlgebraicTopology lines 2547 and 5363 still name only T1.5, not T7.1, as consumer of §5.5's sequence (its folder's matter).
- **Pull-request text.** The TopologicalKTheory paragraph matches the head: no mention of HomotopySpheres or DGFloer remains in the README; 21 declarations removed, 1 added; `RelativeSymbol`, the segment bound and the inside projection are README targets T3.1, T4.2, T4.4. The shared-folder order with #1808 is stated.
- **Standing, outside this folder.** HomotopySpheres on main (§4A.1–4A.2, README lines 139–140, and its `Suggested.lean` lines 139–184) and DGFloerPartII (#1799, 4.2a–4.2c, README lines 71–74, 1584–1612) still own stable O, SO, the stable range and π_i of the orthogonal groups, which T7.1 owns here. The description says both are to cite T7.1; neither does yet. Recorded on the board as deferred D01 (P2); D02 (P3) is the AlgebraicTopology consumer line above.

Overlap check: read CharacteristicClasses (this head, main), GeneralizedCohomology (this head, main), IndexTheory (main), DGFloerPartII (#1799), HomotopySpheres (main, #284), OperatorKTheory (main). Stable O/SO, their stable range and real Bott periodicity: T7.1, with HomotopySpheres and DGFloerPartII still to cite it (D01). Smooth real and complex Grassmannian upgrade: T1.5; GeneralizedCohomology G4.0b keeps the quaternionic carriers. Finite oriented carriers and classifiers: T1.6; CharacteristicClasses C1.1a–b consumes. Equivariant Thom and the sphere Koszul class: T6, T7 item 5; IndexTheory consumes. Geometric complex Bott periodicity: T4; OperatorKTheory owns the C*-algebra form. Degree-zero Adams operations: T2.5; no other owner found.

Source independence: 10 passages compared with 5 sources (Hatcher, Mitchell, Kolář–Michor–Slovák, Segal, Freed–Debray), none shared beyond forced statements of under a dozen words; largest share hatcher-vbkt, 6 of 22 locators (tied with mitchell-principal-bundles); contents compared with hatcher-vbkt: independent (T3's exact sequences precede T4's product theorem and T2 holds the Adams operations, against Hatcher's 2.1 product theorem, 2.2 exact sequences, 2.3 Adams operations; T5–T7 have no counterpart run).

## Not verifiable

- Atiyah, *K-theory and reality* (1966), §2 and Theorem 3.10 (T7.1): not in the sources cache and not in the manifest; behind a paywall.
- `sibson-1969` (T7.0), `atiyah-bott-1964` (T4, T5.2), `abs-1964` (T7.1, and §7 in R01's repair), `husemoller-fibre-bundles` (T6.4), `atiyah-1968-bott-index` (T6.5, R03's repair): uncertified, cited by locator only.
- Ownership against open pull requests was checked through `roadmaps grep` and the checkout of DGFloerPartII only.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/TopologicalKTheory/README.md` line 2386 cites Atiyah, *K-theory and reality*, for two headline theorems of T7.1; the work has no entry in `packages/TopologicalKTheory/sources.toml`, which instead records `eschenburg-hanke-bott`, a work the README does not cite.
