# Review of HeckeStacksAndLocalShtukasPartII (pull request #1844 at e1a397e)

**Verdict:** needs changes

Two P3 findings, nothing blocking. The gate passes, the dependency check is clean, the one Lean headline (Viehmann's chart bound and its attainment) elaborates and is not padding, and every target of the seeded sample, every supplier citation and every pinned declaration named in the README resolves where it is cited. The Layer 2 Checks were recomputed by machine and all agree. Details under Verified sound.

## R01 (P3) — Two constructions carry fewer than three Checks

**Location.** `TauCetiRoadmap/HeckeStacksAndLocalShtukasPartII/README.md` lines 468–486 (§0.6, "Change of framing, centralizers and Kottwitz obstruction") and lines 1745–1774 (§7.5, "Proper-Levi image comparison").

**Claim.** §0.6 constructs the framing identification `gI ↦ hgI` from `X_w(b)` to `X_w(b′)` and the `J_b(F)`-action, and is consumed by name downstream ("framing transport of §0.6", line 1906); §7.5 constructs, for each matching Levi class, the map from the Levi locus to `X_w(b)` and lists its API under "The comparison has the following API". Both are constructions with an interface, and each has two Checks.

**Witness.** Counting the `**Checks.**` bullets per subsection gives 2 for §0.6 (lines 483–484) and 2 for §7.5 (lines 1771–1772); every other construction with an API block in the README has at least three (§0.1 has 5, §3.5 has 5, §7.1 has 8, §4.3 has 7).

**Repair.** Add one discriminating Check to each, for example:

- §0.6: for the superbasic slope-1/2 class of GL₂, `J_b(F)` is the unit group of the quaternion division algebra; its element of reduced-norm valuation 1 is the shift `e_i ↦ e_(i+1)` of §2.3 and sends the determinant-zero component of `X_μ(b)` to the determinant-one component, while the valuation-zero subgroup preserves each component. The action changes components and leaves `κ` unchanged (vie06 line 96–99).
- §7.5: for GL₂, `M = T`, `w = t^(1,0)` and `b = diag(ϖ,1)`, the matching torus class is `(1,0)` alone; the Levi locus `X^T_(1,0)(b) ≅ T(L)/T(O_L)` is discrete, and its image covers `X_w(b)`, which has dimension `ℓ(w) − 〈2ρ,ν_b〉 = 1 − 1 = 0` by §1.1; the non-matching class `(0,1)` contributes no point.

## R02 (P3) — A citation label is garbled in four places

**Location.** `TauCetiRoadmap/HeckeStacksAndLocalShtukasPartII/README.md` lines 333, 497, 786 and 796.

**Claim.** The Needs and Dependencies lines cite "BunGAndNewtonStrata §1.15, defect of a σ-class of a σ-class".

**Witness.** The BunGAndNewtonStrata head (#1241) has `### 1.15 Defect of a sigma class` (its README line 569); the phrase "of a σ-class" is doubled in all four places.

**Repair.** Replace the four occurrences by "BunGAndNewtonStrata §1.15, defect of a σ-class".

## Verified sound

**Gate and build.** The worker's gate at e1a397e: every check passed (`build=0`, `depcheck=0`, `statement-hygiene=0`, `outside-folder=0`). `lake env lean` on `Suggested.lean`: exit 0, the two expected `declaration uses sorry` warnings (lines 122 and 132) and nothing else. The outside-folder diff against `origin/main` is empty.

**Dependency check**, exact output:

```text
depcheck: 239 roadmaps, 2359 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every supplier cited (ReductiveGroupsPartII, SchemeAndStackFoundations, RepresentationTheory.RootSystems on main; SmoothRepresentationsOfLocalGroups, InverseGaloisAndArithmeticFundamentalGroups, VStackSheavesAndLisseCategories, GeometricSatakeAndFusion, BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, RootSystemsPartII in open pull requests) precedes this roadmap in the merge order (positions 22, 44, 118, 121, 177, 179, 197 against 198).

**Lean file (7 declarations).** A scratch copy with `#check @name` for all seven elaborated; the types equal those in the worker's signature listing and match the README: `chartIndices_bound` carries `0 < m`, `0 < h`, `m.Coprime h`, `Monotone μ`, `∑ μ = m` and asserts finiteness of `V` and `2·ncard V ≤ Σ_i (2i+1−h)μ_i − (h−1)` in `ℤ`; `exists_isCyclic_chartIndices_eq` asserts a cyclic witness with equality. No section binder is lost. One-tactic probe on a scratch copy (`simp`, `simp_all`, `constructor <;> simp_all`, `exact ⟨Set.toFinite _, by simp⟩`): every attempt reports "does nothing" and falls through to `sorry`; neither theorem is padding. The structure `ExtendedSemiModule` transcribes vie06 Definition 3.4 clause by clause (vie06 lines 132–145): support of `φ` (1), `φ(a+h) ≥ φ(a)+1` (2), the `semiModuleJump` bound with equality on tails (3), and the `h` sequences with successor rule and initial multiset `μ` (4a–c); `chartIndices` is (4.1) at vie06 line 265; `IsCyclic` is the sentence after Definition 3.4 (line 146). Imports: `module`, `public import Mathlib`, `@[expose] public section`, the form the gate accepts (imports=0, no-import-mathlib=0). No `set_option`, no sorry'd data, no `lemma`. All seven Lean names appear in the README (lines 642, 664, 674, 675, 678, 767, 769) and every backticked name of the roadmap's own in the README is declared.

**Headline theorems.** The README's headline list (lines 261–268) is geometric except for the chart bound; the module docstring names each geometric headline and the carrier it lacks (affine flag moduli, lattice-moduli strata, admissible loop spaces, torsor Grassmannians with Frobenius-graph pullbacks, the Kottwitz-set interface, Newton-stratified Iwahori cells, flag-incidence moduli, Levi loci). None is statable at the pins: the pinned Tau Ceti has Coxeter parabolics, root-pairing chambers and a Witt-vector isocrystal theory but no loop group, affine Grassmannian or extended affine Weyl group with length; Mathlib has none either. The one statable headline is stated.

**Seeded sample (15 targets), each read at its locator.**

| Target | Locator read | Result |
|---|---|---|
| 0.5 realization and dimension | he14 Definition 1.1 and §1.3 (lines 198–212); zhu17 (3.1.1)–(3.1.2) (lines 2109–2119), Definition A.13 (2721–2727), Proposition A.15–Corollary A.16 (2745–2788); he21 §1.5 (130–141), §2.2 (186–193) | supports the statement: locally closed, finite-dimensional, locally finite type (he14); pfp perfect spaces, deperfection models, universal homeomorphism = isomorphism (zhu17); tame and `p ∤ |π₁(G_der)|` hypotheses as the README says (he14 lines 173–176) |
| 2.1 normalized semi-modules | vie06 Definition 3.1, Remark 3.2, Lemma 3.3 (lines 106–131) | supports; the type enumeration with maximal `μ′_i` is the proof of Lemma 3.3 |
| 2.2 extended semi-modules | vie06 Definition 3.4, Example 3.5, Lemmas 3.6–3.8 (lines 132–199) | supports; Example 3.5 recomputed (table below) |
| 2.4 chart dimensions | vie06 Theorem 4.3 and proof (lines 266–375); zhu17 end of proof of Proposition 3.3 (line 2296–2297) | supports: `U(A,φ)` nonempty open, bijection on `k`-points, `U = A^V` for cyclic |
| 2.5 superbasic dimension formula | vie06 §2 (lines 79–99), Proposition 5.2 (382–430), Theorem 5.3 and proof (431–557); Example 5.4–5.5 | supports; `def(b) = h−1` at line 97; nonemptiness iff `Σμ_i = m` at line 82 |
| 3.4 Levi fibres | ham15 Definitions 2.5 and 2.7, Lemmas 2.6 and 2.8, Proposition 2.9 (lines 162–206); ghkr06 Proposition 5.6.1 (1360–1427), Theorem 5.8.1 (1446–1471); zhu17 §3.1.2 (2163–2182) | supports; fibre dimension `d + 〈ρ,ν−ν_dom〉 − 〈2ρ_N,ν〉` at ham15 line 202 |
| 3.6 unramified norm | zhu17 Lemmas 3.5 and 3.7 (lines 2254–2277) | supports the isomorphism, the `ρ`-pairing identity and `def_G(b) = def_H(Nm b)`; index convention: see Source issues |
| 3.9 virtual upper bound | he21 Theorem 2.1 (line 210); he14 Theorem 10.3 and Corollary 10.4 (1128–1157); he15 Theorem 2.30 (1531–1544) | supports; he15's `d_w([b])` carries `+〈ρ,ν_b〉` and bounds the stratum, as the README warns |
| 4.3 fundamental representatives, cell comparison | nie15 Theorem 1.3 (lines 99–102) and proof (414–430); ghkr10 Definition 13.1.2 and Proposition 13.1.3 (1667–1696); mv20 proof of Proposition 3.5 (302–315), paragraph before Theorem 3.10 (350–357), Theorem 3.10, Corollaries 3.11–3.12 (358–383), Lemma 3.2 (266–267); he15 Theorem 2.23 (1373–1395) | supports; `ℓ(y) = 〈2ρ_N,ν〉` is ghkr10 13.1.3(3); the quotient of dimension `ℓ(y_b)` is mv20 line 374–375 |
| 4.5 mutual advantage | he21 §3.3 (lines 243–250) and §4.1 (265) | supports: `≈_σ` preserves cordiality by definition |
| 4.6 cordial saturation | mv20 Theorem 3.16 and proof (418–453), Corollary 3.17 (458–459), Remark 1.3 (150–162); he21 Theorem 4.1 (267–269) | supports; closure and equidimensionality are equal-characteristic only (mv20 lines 160–162) |
| 4.7 generic class of `x t^λ` | he21 Theorem 4.2 (273–274), §4.3 (286–293), §4.4 (296–304) | supports, including the closure chain and `ℓ(xt^λ) − ℓη = ℓ(t^λ) = 〈λ^♦,2ρ〉` |
| 7.2 Levi Kottwitz obstruction | he21 Theorem 6.3 and footnote (496–498, 514–515); ghn15 Theorem 3.3.1 (409–415), Corollary 3.6.1 (537–539); ghnerr Proposition 0.0.2 (58–70) | supports; the all-classes form and the basic-only uniqueness are as the README says |
| 8.1 shrunken nonemptiness | he21 Theorem 6.1 (480–482), §6.2 (500–507), §6.3 (509–525) | supports the biconditional; the README's hypothesis is weaker than the printed one and is what the proof uses (row in the table below) |
| 8.4 large-translation range | he21 Corollary 6.4 and §6.4 (526–537) | supports; the README's averaged form follows by the same two lines (529–533) |

Locators also opened while checking the sample: he21 Proposition 5.1 and Corollaries 5.3–5.4 (307–341), §5.2 (342–355), Proposition 5.6 and §5.4 (369–475) for §§5.1–6.4; he14 Theorem 6.1 and Corollary 6.2 (777–834), Propositions 11.6–11.7 (1244–1308), Theorem 12.1 (1311–1327) for §§1.3 and 7.4; ghn15 Lemma 3.6.3, Propositions 3.6.4–3.6.5 (543–582) for §§7.3 and 8.3; mv20 §2 (224–236) for the Newton order; he15 Theorem 2.27 (1482–1485).

**Supplier citations resolved (every round, at the current copies).** ReductiveGroupsPartII on main: all 18 target ids cited (`apartment` line 1852, `echelonnage-root-system` 2185, `affine-roots-and-filtrations` 1999, `algebraic-fundamental-group` 2448, `kottwitz-homomorphism` 2706, `parahoric-subgroup` 4289, `associated-parahorics` 4532, `lang-theorem` 5203, `lang-for-pro-algebraic-groups` 5222, `iwahori-weyl-group` 5535, `affine-tits-system` 5713, `kottwitz-quotient` 5748, `iwahori-bruhat-decomposition` 5730, `simple-cell-multiplication` 5817, `length-and-bruhat-order` 5656, `dominant-coinvariant-cocharacters` 5994, `translation-length-formula` 6104, `dominant-normal-form` 6127) and RG2.0.4 (852). The sign transport the README states (its `t^(1,0) = diag(ϖ,1)` is RG2.4's `t^(−1,0)`) agrees with RG2.4's own check `length_translation_gl2`, which labels the class of `diag(ϖ⁻¹,1)` as the translation by `(1,0)` (main line 5689–5691). BunGAndNewtonStrata at #1241: §§0.6, 0.8, 1.7, 1.8, 1.10, 1.11, 1.13, 1.14, 1.15, 1.18, 1.27, 1.30, 1.43, 1.45 all exist (lines 123–1061); §1.43 is stated for finite extensions of `ℚ_p` (line 1029–1031), as the README's "p-adic scope" says; §1.45 states the Levi Newton comparison the README consumes. GeometricSatakeAndFusion at #1235: GS0 "Witt bounds, determinant lines and projective models" (line 546; a second layer also labelled GS0 exists at line 228, which the README disambiguates by title), §§0.28, 0.29, 0.32, 0.38, 0.39, GS1 §1.4, GS2 §§2.4, 2.6 exist; §0.39 states exactly the ordinary `(ℓu+ℓv−ℓuv)/2` and Demazure `ℓu+ℓv−ℓ(u*v)` fibre bounds the README imports. VStackSheavesAndLisseCategories at #1230: VS4.0 "Newton geometry" (line 1133) defines the order by equal Kottwitz invariant and Newton dominance. InverseGaloisAndArithmeticFundamentalGroups at #850: IG.0.T2 (502) and IG.0.T3 (537). SmoothRepresentationsOfLocalGroups at #1688: SR.1.5 with `iwahori-matsumoto` (split datum, `(T_s−q)(T_s+1)=0`) and `bernstein-presentation` (1565–1597). RootSystemsPartII at #1731: §1.1 "Integral root dominance" (line 75). RepresentationTheory.RootSystems on main: Layers 1 and 2 (lines 248, 432). SchemeAndStackFoundations on main: §§0.7 (`fibre_dimension_formula` at 785), 0.9, 0.23–0.26, Layer 1. HeckeStacksAndLocalShtukas at #1252: HS0–HS4.

**Pinned declarations opened** (Mathlib f6090c70, Tau Ceti 358314d4): `DoubleCoset.doubleCoset` (`Mathlib/GroupTheory/DoubleCoset.lean` 37, two arbitrary sets), `mem_doubleCoset` (44), `doubleCoset_eq_of_mem` (51, subgroups); `QuotientGroup.leftRel` and `leftRel_apply` (`Mathlib/GroupTheory/Coset/Defs.lean` 66, 71); `Set.ncard` (junk 0 on infinite sets, `Mathlib/Data/Set/Card.lean` header); `finsum` (`Mathlib/Algebra/BigOperators/Finprod.lean` 99); `WithBot` (`Mathlib/Order/TypeTags.lean` 22); `DoubleCoset.mul_mem_doubleCoset_iff` (`TauCeti/GroupTheory/DoubleCoset/Basic.lean` 100, hypothesis `b ∈ H`); `CoxeterSystem.parabolic` (101), `IsMinimalCosetRep` (233), `length_mul_of_isMinimalCosetRep` (280), `existsUnique_isMinimalCosetRep_mul` (330) in `TauCeti/GroupTheory/Coxeter/Parabolic.lean`; `TauCeti.inversions` (`Inversions/Basic.lean` 50), `isLeast_ncard_inversions` (148) and `ncard_inversions_mul_le` (172) in `Inversions/Length.lean` (no cancellation equality, as the README says); `dominantChamber`, `openDominantChamber` (`Chamber.lean` 135, 138); `existsUnique_mem_orbit_inter_dominantChamber` (`FundamentalDomain.lean` 234, under `IsRootSystem`); `longestElement` (`LongestElement.lean` 196); `DynkinType.simplyConnectedRootDatum` (`SimplyConnectedRootDatum/Assembly.lean`). No Demazure product and no twisted conjugacy on Coxeter groups exist at the pins, so the RootSystemsPartII gaps ask for nothing provided.

**Declared gaps.** All 13 slugs of `plan.json` (`unipotent-linearization`, `demazure-product`, `twisted-redmin`, `straight-finite-parabolic`, `finite-coxeter-basic-class`, `parabolic-root-length`, `dominant-subtraction`, `superbasic-classification`, `newton-poset-length`, `newton-cell-strong-purity`, `newton-cell-greatest`, `levi-intersection-dimension`, `twisted-affine-cocenter`) appear in the README as "What `<Supplier>` must provide (the … contract)" with a named supplier and a one-sentence need carrying its hypotheses and a locator (lines 145, 160, 164, 166, 168, 170, 180, 201, 205, 207, 209, 221, 246). None has supplier `none`; none asks for what the pins or an earlier roadmap provide; the Newton chain-length and strong-purity needs are mv20 lines 434–441 verbatim in content. The README labels them by name rather than by `gap:<slug>`; the slugs match one-to-one, so the intake can read them.

**Ownership and overlap.** `roadmaps grep` over main and the 466 open pull requests for "affine Deligne–Lusztig", "cordial", "virtual dimension", "superbasic", "semi-module", "shrunken", "class polynomial": outside this roadmap the only hits are reference-list entries (BunGAndNewtonStrata, GeometricSatakeAndFusion, DiamondsAndVStacksPartII, ReductiveGroupsPartII and four others cite GLX or He for other purposes) and IgusaVarietiesAndTorsionConcentration §0.27's PEL Rapoport–Zink formal schemes, which the Scope excludes. No other roadmap constructs the loci, their dimensions or the cordial theory; the flag correspondences and fibre bounds live in GS0 §§0.38–0.39 and are imported, not restated. The overlap tool lists no pull request changing this roadmap and no dropped or revision-only id.

**README shape and policy.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–8 each with Examples and Dependencies, Downstream consumers, References. No LaTeX, no process words, no pull-request numbers, no local paths (gate `latex=0`, `residue=0`, `prnum=0`, `private-paths=0`). Every theorem has hypotheses and a locator; the Check counts are tabulated above (only R01 falls short).

**Adversarial pass.** Values computed on each side; Layer 2 rows were recomputed by a script (normalized semi-module from a type, cyclic `φ`, chart set `V`).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.1 residue basis, normalization, type | `h=2,m=1,A=ℕ`; `h=1`; empty set; `A=1+ℕ` | `B={0,1}`, sum `1=h(h−1)/2`, type `(0,1)`; `h=1`: `B={0}`, `A=ℕ`; `∅` has no `h`-element basis; `1+ℕ` has sum `3`, normalization `ℕ` | holds; Checks agree |
| §2.2 Example 3.5 (`h=5,m=4`) | `B={−2,−1,2,5,6}`, `φ(−1)=0`, `φ=jump` elsewhere | `φ` on `−2..11`: `0,0,0,1,2,2,1,1,2,3,3,2`; initial values of the five sequences `{0,0,2,2,0}=μ`; `jump(−1)=1>φ(−1)` (since `3,−2∈A`, `−7∉A`) | noncyclic as claimed; vie06 Figure 1 agrees |
| §2.5 bound and attainment | `(h,m,μ)=(2,1,(0,1))`, `(3,4,(0,0,4))`, `(5,4,(0,0,0,2,2))`, `(4,5,(0,0,2,3))` | `V=∅`, bound `0`; `B={−3,1,5}`, `V={(5,6),(5,7),(5,10)}`, `2|V|=6=bound`; Example 3.5 module: `V={(4,6),(4,7),(5,6),(5,7)}`, `8≤8`; `B={−4,1,3,6}`, `V={(3,4),(3,5),(3,6),(3,9)}`, `8=8` | holds; equals vie06 Examples 5.4–5.5 |
| §2.5 equality fails for a non-dominant type | `(h,m)=(4,5)`, type `(0,2,0,3)` | `B={−2,0,3,5}`, initial values `{0,0,2,3}`, `V={(3,4),(5,6),(5,8)}`, `2|V|=6<8` | the README's negative control holds |
| §2.5 `ρ`, defect, formula | increasing convention, `ν=(m/h,…)` | `ρ_k=(2k−1−h)/2`, `〈ρ,ν〉=0`, `def=h−1`; `d(b,μ)=Σ_{i}Σ_{j≤i}(m/h−μ_j)−(h−1)/2=〈ρ,μ〉−(h−1)/2`; for `(3,4,(0,0,4))`: `4/3+8/3−1=3` | the Lean right-hand side `Σ(2i+1−h)μ_i−(h−1)` is `2d` |
| Lean `ExtendedSemiModule` degenerate inputs | `h=1`, `m` arbitrary; `h=0` | `h=1`: `B={0}`, `A=ℕ`, `φ(a)=a+m`, `V=∅`, bound `0`, cyclic; `h=0`: `sSup` junk, excluded by `0<h` | no vacuity; `⊥+1=⊥` makes `φ_add_h` harmless off `A` |
| finiteness of `V` | general `(A,φ)` | for `b=b_r+kh`, `φ(b)≥k`, so `φ(b)<φ(a)` bounds `k`; on a tail `φ(a)=φ(a−h)+1` leaves no `φ(b)` strictly between | the `Finite` conjunct is a theorem, not junk |
| Conventions: alcove image of `s t^(nα∨)` | split adjoint `A₁`, base alcove `(−1,0)` | `t^(nα∨)`: `(−2n−1,−2n)`; then `s`: `(2n,2n+1)`; `ℓ=2n+1`, `η=s`, `d_w(1)=n+1` | holds (§§0.2, 7.3, 8.2, 8.4 agree) |
| §0.2 virtual dimension | GL₂, `w=b=t^(1,0)`; slope-1/2 basic, `w=s t^(1,0)` | `(1+0−0)/2−1/2=0`; `(2+1−1)/2−0=1` | holds |
| §0.3 shrunkenness vs `λ≥2ρ∨` | adjoint `A₂`, `λ=6ω₁∨=4α₁∨+2α₂∨` | `λ−2ρ∨=2α₁∨≥_ℤ0` but `〈α₂,λ〉=0`: `α₂`-values stay in `(−1,0)` | not shrunken; §8.4 Check agrees |
| §1.2–1.4 reduction and advantage | affine `A₁`, `w=s₀s₁s₀`, `b=1`, `[t^(α∨)]` | endpoints `s₁` (dim 1) and `s₁s₀` (`−∞`); `1+max=2`; `T_w≡zT_(s₁s₀)+T_(s₁)`, `(3+1+0)/2=2`; at `[t^(α∨)]`: `(3+2+1)/2−2=1`, `X_(s₁)` empty; `u=t^(−α∨)`: `ℓη=0`, `(3+1−2−0)/2=1=1−0` | all seven Checks agree with §1.3's formula |
| §3.1 root-slope sum | GL₂, `ν_M=(a,b)`, `a−b=±2` | `min(2,0)=0=〈ρ,0〉`; `min(−2,0)=−2=〈(½,−½),(−2,2)〉`; general identity `Σ_{α∈R_N}min(〈α,ν〉,0)=〈ρ,ν−ν_dom〉` for `M`-central `ν` | holds |
| §3.4 Levi fibre | GL₂, `M=T`, `μ=(1,0)`, `b=diag(1,t)`, `μ_M=(0,1)` | `n(u)diag(1,t)=[[1,ut],[0,t]]`, position `μ` iff `ut∈k[[t]]`, one coset: `d=0`; `〈ρ,ν_M−ν_G〉=−1`, `〈2ρ_N,ν_M〉=−1`; fibre `0`; Lemma 2.8 bound `〈ρ,(1,1)〉−0=0` with equality | holds |
| §3.6 norm order | degree 3, `b=(1,U,V)`, `σ` fixing coefficients | `(σx)_τ=σ(x_(σ⁻¹τ))` from `a⊗b↦(τ(a)b)_τ`; eliminating gives `b_(τ₀)σ(b_(τ₁))σ²(b_(τ₂))` with `τ_i=σ^(−i)τ₀`: `UV=[[2,1],[1,1]]`; opposite cycle `VU=[[1,1],[1,2]]` | README convention is the consistent one |
| §3.8 spherical values | GL₂, `μ=(1,0)` basic; `μ=(1,−1)`, `b=1`; `b=1`, `μ=(1,0)` | `〈ρ,μ−ν〉−def/2=½−½=0`; `1−0=1`; `κ` mismatch `0≠1`, locus empty though the value is `½` | holds |
| §4.3 fundamental representative | GL₂, `y=t^(1,0)`; `t^(0,1)`; basic `τ`; non-straight `s` | `φ_y(U_α(c))=U_α(ϖσc)`: `φ_y(I_N)=U_α(ϖ²O)⊆U_α(ϖO)`; `φ_y⁻¹(I_N̄)=U_(−α)(ϖO)`, quotient `O/ϖO`, dim `1=〈2ρ,(1,0)〉`; `t^(0,1)`: opposite parabolic, dim `1`; `τ`: `N=1`, dim `0`; `Ad(ṡ)σ(I)` is the opposite Iwahori | holds; dependence on `y` as stated |
| §4.3 codimensions | GL₂, `w=s t^(1,0)`, basic and ordinary | `dim_I N = 1+0 = 1`, `c=1`; `1+1=2`, `c=0`; `dim I/I_n=4n`: `5−4=9−8=1`, `6−4=10−8=2` | holds |
| §4.6 chain length | GL₂, ordinary `(1,0)` over basic `(½,½)` | `(〈2ρ,(½,−½)〉+1−0)/2=(1+1)/2=1`; dims `(2+1−0)/2−½=1` and `(2+1−1)/2−0=1` | holds; mv20 line 434–437 |
| §4.7 cordiality | GL₂, `x=s`, `λ=(1,0)` | `ℓw−ℓη=2−1=1=〈(1,0),(1,−1)〉−0` | holds |
| §5.1 double flat | adjoint `A₁`, `λ=2ω∨`, `y=s`; `λ=ω∨`; unitary `A₂`, `λ=ρ∨`, `y=s₁`; `λ=ω₁∨` | `ρ_J∨=η_J∨=ω∨`, `λ^♭♭=0`; `0−_dom ω∨`: least dominant `nω∨` with `n+1` even is `ω∨`; `η_J∨=−w₀(−ω₂∨)=ω₁∨`, `ω₂∨−_dom ω₁∨=ω₁∨` (`(a,b)=(1,0)` is the least solution of `2a+b≡2 mod 3`), `λ−λ^♭♭=ω₂∨∉Q∨`, lower-bound gap `2ω₁∨−ω₂∨=α₁∨`; second example gives `ω₂∨` | holds |
| §5.2 factorization | unitary `A₂`, `x=y=s₁`, `λ=ρ∨` | `J′={s₁}`, `x′=s₂`, `z=s₁`, `β=ω₂∨+s₂ω₂∨=2ω₂∨−α₂∨=ω₁∨=γ`; `w₁=t^(ω₂∨)`, `w₂=t^(−ω₁∨+ω₂∨)`, product `t^(α₂∨)=s₁t^(ρ∨)s₁`; lengths `2+2=4=1+4−1`; `a=s₂*s₂=s₂` | holds |
| §5.1/8.2 shrunkenness of the unitary example | `w=s₁t^(ρ∨)s₁` | alcove values `α₁:(0,1)`, `α₂:(−3,−2)`, `θ:(−2,−1)` (pointwise: `a₁+1`, `a₂−2`, `a₁+a₂−1`) | shrunken as claimed |
| §6.2–6.3 fibre bounds | `A₁` example; unitary `A₂` example | `N₁=(0+2−2)/2=0`, `N₂=0`; `N₁=(1+2−3)/2=0`, `N₂=1+1−1=1`; `d_w−d_(at^γ)=(6−4)/2=1=N₁+N₂` | holds; he21 lines 429, 459, 463–474 |
| §7.4 basic seed | `A₁`, `a=s`, `γ=α∨` | `T_(s₁s₀s₁)≡T_(s₀)T_(s₁)²=zT_(s₀s₁)+T_(s₀)`, coefficient `1` of degree `0` at `s₀=t^γs`, dimension `(3+1+0)/2=2` | holds |
| §7.4 route is independent of shrunkenness | split PGL₃, `w=s₁s₂t^(ω₁∨)` | `w` shrunken (values `(1,2),(−2,−1),(0,1)`), full support; §5.2 gives `J′={s₂}`, `x′=s₁`, `z=s₂`, `γ=ω₁∨`, `a=s₂*s₁=s₂s₁`; `a t^γ` has `α₁`-values `〈α₂,v〉−0∈(−1,0)`: not shrunken; he14 Proposition 11.6 (`J=S`, `y=1`, `μ≠0`) still gives the positive coefficient | the README is right to build the seed without shrunkenness (Source issues) |
| §8.1 hypothesis on `λ^♦` versus he21's `λ` | general; Res_(E/F)PGL₂, `λ=(α∨,0)`, `b=1` | he21 uses the gap only in §6.2 through `κ_(M_J)⊗ℚ`, which sees `λ` in rational `σ`-coinvariants, i.e. `λ^♦`; `ν_b−ν_(b′)∈Σℚ_≥0α∨` and `ν_(b′)` is `σ`-invariant, so `λ^♦−ν_(b′)` has all coefficients `>0` and is not in `ℚΦ∨_J`; for Res PGL₂, `λ−ν_b=(α∨,0)` fails he21's printed hypothesis while `λ^♦−ν_b=(α∨/2,α∨/2)` passes | the README's weaker hypothesis is supported by the proof; §8.3 Check agrees |
| §8.3 basic specialization | adjoint `A₂`, `w=w₀`, `λ=0`; `A₁`, `w=s t^(nα∨)` | `λ=0` and shrunken force `w=w₀` (ghn15 lines 575–581); dimension `(3+3−0)/2=3`; `(2n+1+1)/2=n+1` | holds |
| §8.4 range | adjoint `A₁`, `λ=α∨=2ρ∨`, `b=1` | `(λ^♭♭)^♦≥λ^♦−2ρ∨=0≥ν_b`; gap `2ρ∨` strictly positive; dimension `2` | holds |
| §0.6 transport direction (R01 target) | `S₃`, `b=(12)`, `h=(123)` | `b′=hbh⁻¹=(23)`; `(hg)⁻¹b′(hg)=g⁻¹bg`; with `h⁻¹` instead, `(h⁻¹g)⁻¹b′(h⁻¹g)=g⁻¹h b′ h⁻¹g=g⁻¹(13)g≠g⁻¹bg` | holds |
| §7.5 cover (R01 target) | GL₂, `M=T`, `w=t^(1,0)`, `b=diag(ϖ,1)` | fibre of `B(T)→B(G)` over `[b]` is `{(1,0),(0,1)}`; `κ_T(x⁻¹wσ(x))=(1,0)` selects one; `dim X_w(b)=1−1=0` | holds; a third Check is what R01 asks for |
| Supplier sign convention | GL₂ | README `t^(1,0)=diag(ϖ,1)`; RG2.4 `length_translation_gl2`: translation `(1,0)` is the class of `diag(ϖ⁻¹,1)` | the stated transport `λ↦−λ` is correct |
| GS0 §0.39 bounds | `u=v=s` | ordinary `(1+1−0)/2=1` (`A¹`), Demazure `1+1−1=1` (`G_m`) | matches §§6.1, 6.3 |

## Not verifiable

- None of the sampled locators was unreadable. All seventeen manifest texts are in the cache (he21 is an OCR text; its displayed formulas are partly garbled, and the statements of Theorems 2.1, 3.2, 4.1, 4.2, 4.4, 5.5, 6.1, 6.3 and Corollary 6.4 were read from the surrounding prose and cross-checked against mv20, he14, he15 and ghn15).
- ghn15 Corollary 2.2.2 (cited at §3.2) was not opened; the erratum's Proposition 0.0.1, which replaces it, was.

## Source issues

- **Gap** in he21 at §6.3, printed p. 14: the nonemptiness of the reduced locus is cited from he15 Theorem 2.27, which needs a shrunken alcove, but the element produced by Theorem 5.5 need not be shrunken (split PGL₃, `w=s₁s₂t^(ω₁∨)` reduces to `s₂s₁t^(ω₁∨)`); it should use he14 Propositions 11.6–11.7 with `J=S`; affects the proof.
- **Error** in he21 at Remark 6.2, printed p. 13: says a dominant nonzero `λ_w−ν_b` has strictly positive coefficients on every simple coroot; false when the absolute root system is reducible (Res_(E/F)PGL₂, `λ=(α∨,0)`, `b=1`); it should concern the `σ`-average or assume absolute simplicity; affects nothing.
- **Misprint** in he14 at Proposition 11.6, printed p. 399: the hypothesis reads `supp_δ(v)=J` with `v` undefined; it should be `supp_δ(x)=J`; affects nothing.
- **Misprint** in he14 at the proof of Proposition 11.6, printed p. 400: the displayed term for the case `supp_δ(s_ix′)≠J` carries the index `s_i` on the right; it should be `s_(δ(i))`; affects nothing.
- **Misprint** in zhu17 at §3.1.3, printed p. 458: the embeddings are indexed `τ_i=σ^i(τ₀)`, while the stated norm `b_(τ₀)σ(b_(τ₁))⋯` and the diagram require `τ_i=σ^(−i)(τ₀)` under the identification `E⊗_F L≅∏_τ L`; it should read `σ^(−i)`; affects nothing.
- **Error** in ghn15 at Proposition 2.2.1, PDF p. 6: claims the component map to the adjoint flag variety is injective; it should be the componentwise isomorphism under `char k ∤ |π₁(G_ad)|`; affects a stated result; corrected in print at ghnerr Proposition 0.0.1.
- **Error** in ghn15 at Proposition 3.5.1, PDF p. 13: asserts at most one Levi class over any class; it should assume `[b]` basic (GL₂ torus counterexample); affects a stated result; corrected in print at ghnerr Proposition 0.0.2.
