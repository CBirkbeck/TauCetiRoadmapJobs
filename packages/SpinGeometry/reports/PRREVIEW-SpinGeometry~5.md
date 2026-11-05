# Review of SpinGeometry (pull request #1674 at 60cedda)

**Verdict:** accepted

:robot: Full AI review of the folder `TauCetiRoadmap/SpinGeometry/` at 60cedda. The head is the one the previous review read, so the author could not have acted on its findings; each of them is re-assessed independently below, and the whole roadmap is reviewed again. No P1 or P2 finding survived verification. The four findings below are P3 notes for the author to take or leave.

## R01 (P3) — Layer 4 target G4.4a consumes Layer 5's G5.3

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:951`: "*Needs:* G4.2–G4.4; AlgebraicTopology §8.9; … G5.3 for the square-root comparison."; also :179 and :969.

**Claim:** G4.4a's rank-two comparison "Compare G5.3's square-root description, retaining the root isomorphism" (:933–934) is placed in Layer 4.

**Witness:** `README.md:1106` (G5.3 *Needs:* G4.1–G4.4; G5.1) and `:1121` (Layer 5 depends on G4.1–G4.4). Layer 4 therefore needs Layer 5 and Layer 5 needs Layer 4: a coarse layer cycle, although the target graph is acyclic (G5.3 does not need G4.4a). The dependency tool counts only roadmap-level edges and does not see it.

**Repair:** Move the two sentences on the G5.3 comparison (`README.md:933–934` and `:949`) to the end of G5.3 as its closing paragraph, which already needs G4.1–G4.4; delete "G5.3" from G4.4a's *Needs:* line, from Layer 4's Dependencies (:969) and from "How to read the build" (:179). Tested on TS²: e=2, root with c₁=1, w₂=0, one lift, stable rank 3: unchanged by where the comparison is stated.

## R02 (P3) — G3.1 narrows the associated-bundle descent to compact groups

**Location:** `README.md:582`: "For a compact Lie group G with orthogonal ρ:G→O(V), unitary μ:G→U(E) and intertwining equality …".

**Claim:** The descent of Clifford algebra and module structures to P×_G Cl(V), P×_G V, P×_G E is stated for compact G.

**Witness:** nicolaescu line 29607–29628 (§12.1.5, p. 636) states the construction for a Lie group G with orthogonal ρ and unitary μ, with no compactness, and the proof route the README names (the invariant tensor and Lemma 12.1.31, nicolaescu line 29637) uses none. Instance: G=ℝ, ρ(t)= rotation by 2t on the plane, μ(t)=diag(e^(−it),e^(it)) on the Fock plane; μ(t)c(v)μ(t)⁻¹=c(ρ(t)v) holds (it is the spin representation through ℝ→Spin(2)), and every step of G3.1 goes through.

**Repair:** Replace "compact Lie group G" by "Lie group G", keeping the orthogonal and unitary hypotheses, and add the ℝ-instance above as a Check (a non-compact group for which the descent still holds). Nothing downstream uses compactness of G: the only groups applied are Spin(n), SO(n) and the rank-zero μ₂.

## R03 (P3) — Roadmap-level reciprocal supply with three roadmaps on main

**Location:** `README.md:1583`: "GeneralizedCohomology G5.5 consumes Spin G1.3's trace but is independent of Spin G6.0."; also :840 (C3.5), :1277 (G5.5), :1426 (R7).

**Claim:** SpinGeometry both supplies and consumes GeneralizedCohomology, CharacteristicClasses and RiemannianGeometry.

**Witness:** Main `TauCetiRoadmap/GeneralizedCohomology/README.md:1908` consumes Spin G1.3; main `CharacteristicClasses/README.md:911` consumes G4.1a; main `RiemannianGeometry/README.md:1337` consumes G1.2/G2.2/G3.4. Main `TauCetiRoadmap/SpinGeometry/README.md:61`, `:50`, `:36` already cite G5.5, C3.5 and R7 in the other direction, so both edges of all three pairs predate this pull request. I checked the target-level order at both ends of each pair: G1.3 → G5.5 → G5.0/G6.0; G4.1a → C3.5 → G4.3 (recorded identically at `CharacteristicClasses/README.md:940`); G1.2/G2.2/G3.4 → R7 → G6.4. No target cycle exists, and the mechanical check reports 0 problems.

**Repair:** Not repairable inside this folder. Roadmap-level acyclicity would need the algebraic and frame foundations (G1–G3, G4.1) to become a separate earlier roadmap with the three merged consumers repointed, which re-plans three roadmaps on main and the partially implemented G1 (STATUS.md records G1 landing in Tau Ceti). Earlier reviews rated this P1; since the edges are pre-existing, agreed at both ends, acyclic at target level and outside this pull request's scope, I record it at P3 so the human approver sees it, and do not block on it.

## R04 (P3) — Complete the Kirby source record

**Location:** `packages/SpinGeometry/sources.toml`, entry `kirby`; `README.md:1597–1599`.

**Claim:** The cited works are recorded in the source manifest.

**Witness:** The manifest had `abs`, `nicolaescu` and `lawson-michelsohn` but no entry for Kirby. Fetching Kirby through the sources service for this review (author-page copy, legal, OCR text) recorded a `kirby` entry with locator, url, sha256, licence class and status, but without `authors`, `title`, `year` or `venue`.

**Repair:** The worker adds `authors = "R. C. Kirby"`, `title = "The topology of 4-manifolds"`, `year = 1989`, `venue = "Lecture Notes in Mathematics 1374, Springer"` to the existing `kirby` entry; never a second key.

## Previous findings

- Previous R01 (P1, reciprocal roadmap dependencies) — not repaired (the head is unchanged); re-assessed above as R03 (P3). Reason for the change: both directions of every pair are on main already, the target-level order is recorded identically at both ends and is acyclic, and the only repair re-plans three merged roadmaps from outside this folder.
- Previous R02 (P2, G4.4a belongs in SpinGeometryPartII) — not repaired; not upheld. `CONTRIBUTING.md:15` names "revising an existing one" as a normal pull request, `README.md:215` of the repository gives rules for revising. G4.4a adds one comparison target inside Layer 4, which STATUS.md records as not yet started; it changes no existing target, no supplier contract and no consumer. The "existing work is never re-planned" principle addresses a roadmap re-planning another roadmap's objects, which this is not. The human approver may still prefer a Part II; the mathematics and placement are otherwise sound (R01 asks for one paragraph to move).
- Previous R03 (P3, record the cited works) — largely resolved: the board manifest already recorded three of the four works (the earlier review looked for a `sources.toml` inside the roadmap folder, where the gate's stray-file rule forbids one); Kirby is now recorded, with the metadata gap of R04.

## Verified sound

**Gate and build.** The worker's gate at 60cedda passes every check. `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` from the worktree elaborates in 34 s with exactly five `declaration uses sorry` warnings and no error. `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean. The file has a single `import Mathlib`, no `set_option`, no `lemma`, no sorried data, a docstring on all 11 declarations, and its module docstring names each geometric headline that is not statable and the carrier it lacks.

**Dependency check** (the required command, unchanged output):

```text
depcheck: 205 roadmaps, 1672 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. SmoothBundlesConnections, PseudodifferentialOperators and TangentialBordism are open pull requests earlier in the merge order (`ORDER.txt` lines 8–10); every other supplier is on main. IndexTheory I7.5 and TangentialBordism B3.0 are named only as downstream consumers (`README.md:1259`, `:1543`), not in any *Needs:* line.

**Elaborated signatures.** A scratch copy with `#check @name` for all 11 declarations elaborated; each type was compared with its README statement. None lost a section binder: `multiplicityEvaluation_exists` keeps `[FiniteDimensional ℂ S] [Nontrivial S]` and leaves E unrestricted (README :288–291); `cliffordScalarTrace_exists` keeps `[InnerProductSpace ℝ V] [FiniteDimensional ℝ V]` and `Q v = -inner v v` (README :351–353); the three chirality theorems keep the orthonormal basis and `IsGeometricAction` (README :465–469, "arbitrary complex inner-product modules S"). Every backticked name of the roadmap's own in the README is declared in the file (11 of 11), and every Lean name appears in the README.

**One-tactic probes.** On a scratch copy each of the five sorried theorems was tried with `simp`, `rfl`, `infer_instance` and `aesop`: all 20 attempts fail (`simp made no progress` or unsolved goal, `rfl` not definitional, no instance, aesop exhausted). No library lemma closes any of them by `exact`: at the Tau Ceti pin the scalar trace, the Morita evaluation and the chirality package do not exist (see pins). No declaration restates a definition, mirrors a Check or computes a value; the proven value-computing lemmas of main's file were removed. No padding.

**Headline theorems.** From the README: the Morita evaluation and negative-metric trace (G1.3); intrinsic chirality, Hodge and graded products (G2); Clifford bundles and compatible connections (G3); spin obstruction, lift torsor and the skeletal comparison (G4); spinor bundles, chiral products and plane roots (G5); Dirac symbols and closed domains, square and Lichnerowicz formulas, exterior realization, compact-support symbol, the real KO index and its products, and the four-dimensional quaternionic normalization (G6). The three algebraic ones are stated; each geometric one is named in the docstring with its missing carrier (algebra-bundle action, principal lift, differential operator and bundle Sobolev domains, real regular bundle and family index). None of the geometric ones is statable with a few simple definitions at the pins.

**Pins opened** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf, from `lake-manifest.json`; file names relative to those repositories):

| Declaration | File and content |
| --- | --- |
| `CliffordAlgebra.equivBaseChange` | `Mathlib/LinearAlgebra/CliffordAlgebra/BaseChange.lean:182`: `Cl(Q.baseChange A) ≃ₐ[A] A ⊗[R] Cl Q`; its `.symm` is the tensor-to-base-change map the Conventions use |
| `star_def`, `star_ι`, `star_smul` | `Mathlib/LinearAlgebra/CliffordAlgebra/Star.lean:43`, `:50`, `:56`: `star x = reverse (involute x)`, `star (ι m) = -ι m`, scalars fixed, as the Conventions say |
| `lipschitzGroup`, `spinGroup` | `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:61`, `:292`: closure of the invertible vectors, so native Spin(0) = {1}, as G1.1/G4.1a say |
| `comp_ι_sq_scalar`, `ι_mul_ι_add_swap`, `equivExterior`, `equivEven`, `EquivEven.Q'`, `prodEquiv` | `Basic.lean`, `EvenEquiv.lean`, `Contraction.lean`, `Prod.lean` under `Mathlib/LinearAlgebra/CliffordAlgebra/` |
| `ModuleCat.matrixEquivalence`, `moritaEquivalenceMatrix`, `Matrix.Module.matrixModule`, `LinearMap.toMatrixAlgEquiv` | `Mathlib/RingTheory/Morita/Matrix.lean`, `Mathlib/LinearAlgebra/Matrix/Module.lean`, `Mathlib/LinearAlgebra/Matrix/ToLin.lean` |
| `TensorProduct.star_tmul`, `Matrix.linftyOpNormedRing` | `Mathlib/Algebra/Star/TensorProduct.lean`, `Mathlib/Analysis/Matrix/Normed.lean` |
| `IsContMDiffRiemannianBundle`, `CovariantDerivative`, `leviCivitaConnection` | `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:67`, `CovariantDerivative/Basic.lean`, `CovariantDerivative/LeviCivita.lean:359` |
| 20 Tau Ceti names of G4.1a–G4.2, G6.7 and Scope | all present: `Topology/Algebra/CliffordAlgebra/Spin/{Covering,Compact,Connected}.lean`, `Spin/Real/Projection.lean`, `Topology/Algebra/QuadraticForm/RealSpecialOrthogonal.lean`, `LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean`, `Geometry/Lie/CliffordAlgebra/Spin/{Projection,Differential}.lean`, `Geometry/Lie/Functor.lean`, `Geometry/Manifold/LocalDiffeomorph.lean`, `Geometry/Lie/Subgroup/Embedded.lean`, `LinearAlgebra/CliffordAlgebra/Spin/EvenUnitary.lean`, `RepresentationTheory/QuaternionicStructure.lean`, `RepresentationTheory/Spin/Structure.lean`, `RepresentationTheory/Spin/Polarization/CliffordAction.lean` |
| Absent at the pin | `scalarTrace` (only a private matrix helper at `TauCeti/Algebra/Lie/GeneralLinear/Clifford.lean:57`), `isotypicTensorEquivOfBijective`, `spinGroupEquivNeg`, `conjStar`: the STATUS.md declarations landed after the pin, so the stated headlines duplicate nothing at the pin. At a later pin bump `cliffordScalarTrace_exists` becomes a citation of `trace_mulLeft_eq_two_pow_mul_scalarTrace` and the positivity lemmas named in STATUS.md. |

**Cross-roadmap citations resolved** (main, or the open head the brief names):

| Citation | Witness |
| --- | --- |
| SpinRepresentations L0–L4, L7, L9, Layer 2 `SpinCompactTopologyFoundation` | main `RepresentationTheory/SpinRepresentations/README.md:316–1010`; the foundation at `:520`, consumed by L7 at `:935` |
| OrthogonalSpinGroups L0–L2 | `Completed/OrthogonalSpinGroups/README.md:331`, `:408`, `:610` |
| HopfRinow L1 (Levi-Civita) | `Completed/HopfRinow/README.md:264–300`: nondegenerate Levi-Civita supplier, positive comparison to Mathlib's `leviCivitaConnection` |
| RiemannianGeometry R1, R5, R7 | main `:179`, `:1042`, `:1293`; R7's consumption of G1.2/G2.2/G3.4 at `:1337` |
| DifferentialGeometry L0–L2, L5–L9 | main `:268`, `:311`, `:341`, `:503–862` |
| ComplexKahlerGeometry K1, K4, K5, K5a | main `:96`, `:444`, `:568`, `:570` |
| CharacteristicClasses C1, C1.0, C3.2, C3.5, C7.3 | main `:211`, `:213`, `:826` (w_n = e mod 2), `:901–944` (spin-cover cocycle, w₂ comparison, item order G4.1a → C3.5 → G4.3), `:1555–1560` (`TSⁿ⊕ε¹≅ε^(n+1)`) |
| AlgebraicTopology Stages 2–6, §8.9 | main `:326–946`; Stage 8 item 9 "Relative obstruction cochains" and ordering row `:2108` |
| TopologicalKTheory T1–T4, T6.4, T7 | main `:163`, `:613`, `:754`, `:816`, `:962` (T6.4 at `:67`, `:72`), `:1148`; `c(a)=2u²`, `c(b)=u⁴`, raw-volume signs of a and b at `:1236–1266` |
| GeneralizedCohomology G5.5 and its 11 named declarations | main `:1373`, `:1892–2104`; every name (`realHilbertClosedFunctionalCalculus` … `realMixedCliffordBottTransport`) occurs there |
| SmoothBundlesConnections B1–B5, B6.0, B2.1, B3.3 | open head via `roadmaps show`: `:220`, `:560`, `:937`, `:1307` |
| PseudodifferentialOperators P1.0, P4, P5, P6 | head `rev/952`: `:151`, `:769`, `:914`, `:1470`; the README's anchors match these headings |
| TangentialBordism B3.0, IndexTheory I7.5 (downstream mentions) | `rev/942/…/TangentialBordism/README.md:1700`; `rev/1077/…/IndexTheory/README.md:854–871` (item 5 of I7, `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex`) |

**Ownership.** `roadmaps grep` for skeletal/one-skeleton/two-skeleton spin structures, Kirby, the scalar-part trace and Lichnerowicz: no other roadmap on main, at the open heads or in the board packages constructs the skeletal comparison, the regular-module trace or the Spin Lichnerowicz package; TangentialBordism `:2517` compares BSpin mapping spaces (different object), GaugeQuiltFieldTheory `:78` consumes Spin G4. Ownership against open pull requests whose files the brief does not give was not checked beyond the grep index. Coordination note for the human: a second open pull request, #1780, revises the same folder from main's older shape (its README still names `cliffordScalarTrace`); one of the two must be rebased onto the other.

**Sources checked at their locators** (nicolaescu: PDF page marker = printed page + 12; kirby: marker = printed page + 8):

| Target | Locator | Found |
| --- | --- | --- |
| G1.1 | Def. 12.1.10, Cor. 12.1.14, pp. 626–627: nicolaescu line 29261, 29301 | uv+vu = −2q(u,v); isometries induce functorial algebra maps |
| G1.3 | Cor. 12.1.22, Rem. 12.1.23, p. 632: line 29466, 29470; Prop. 12.1.27, p. 634: line 29526; §12.1.2, p. 629: line 29351–29362 | every Cl_2k-module is S⊗W with W = Hom_Cl(S,E), W arbitrary; metric with ρ(y†)=ρ(y)*, unique up to a constant; ordered monomials form a basis (the diagonal trace argument is the roadmap's own) |
| G1.4 | Lemma 12.1.29, Prop. 12.1.30, pp. 634–635: line 29553, 29562 | Cl_m ≅ Cl^even_(m+1) by x⁰+x¹ ↦ x⁰+e₀x¹ |
| G2.1, G2.2 | Ex. 12.1.24, Example 12.1.25, eq. (12.1.1), pp. 632–633: line 29486, 29500–29514 | Γ = i^k e₁⋯e_2k, Γ²=1, S± kernels; Λ*V⊗ℂ ≅ S⊗S*; Γω = i^(k+p(p−1))*ω |
| G3.1, G3.3 | §12.1.5, Example 12.1.33, Lemma 12.1.31, pp. 636–637: line 29603–29657 | associated bundles from (ρ, c, μ) with the intertwining square, tensor-invariance reading, Levi-Civita footnote; SO(V) on Λ*V |
| G3.4, G6.4 | Prop. 12.2.1, p. 657: line 30497 | (g,∇^g) is a Dirac structure on Λ_ℂT*M with operator d+d* |
| G4.2, G4.3, G4.4 | §12.2.3, Prop. 12.2.25, Rem. 12.2.28, Ex. 12.2.29, pp. 668–669: line 30914–30981 | lifted cocycles, Čech 2-cocycle ε, w₂=0 iff spin, isomorphism of spin structures, free transitive H¹ action |
| G4.4a | Kirby, Chapter IV, pp. 33–34: kirby line 1115–1131, 1133–1143, 1155–1167, 1175–1182 | skeletal definition, n≥3 caveat with the torus example, stabilization by ε¹ (n=2) or ε² (n=1), principal-cover definition, w₂ and the H¹ set, Lie-group preferred structure, Proposition 1 |
| G5.0 | Ex. 12.1.15, Example 12.1.18, pp. 628–629: line 29351, 29377 | c(x†)=c(x)* on Λ*V with the induced metric; Λ*V is a self-adjoint real super-module |
| G5.1 | Lemma 12.2.32, pp. 670–672: line 31005–31058 | S(M)=P_Spin×_Δ S, ρ_*⁻¹ of the Levi-Civita forms, Clifford connection |
| G6.1, G6.0 | Def. 12.1.64, Props. 12.1.65–12.1.66, pp. 653–655: line 30304, 30323, 30370 | skew-Hermitian c(α), Levi-Civita compatibility, formal self-adjointness by normal coordinates |
| G6.2, G6.0 | Thm. 12.1.67, p. 656: line 30412–30465 | D² = ∇*∇ + Σ_(i<j) c(e_i)c(e_j)F_ij = ½Σ_(i,j) |
| G6.3, G6.0 | Thm. 12.2.33 and its proof, pp. 672–673: line 31077–31101; Ex. 12.1.68, p. 657: line 30468 | contraction by Clifford relations, R_ijkl=R_klij and Bianchi to s/4, no evenness used; twisted formula |
| G6.5 | Ex. 12.2.30, p. 670: line 30984; Ex. 12.2.35, p. 673: line 31121 | two spin structures on S¹; T³ spectra through the H¹ action and the Lie framing |
| G6.6 | §12.2.3, p. 672: line 31059–31069 | block form with symbol Clifford multiplication |
| G6.7 | §12.1.8, pp. 651–653: line 30201–30282 | Cl₄ ≅ M₂(ℍ), Spin(4) = SU(2)×SU(2), Γ = −e₁e₂e₃e₄, quaternionic S±₄ |

**Adversarial table.** Matrices act on columns; A=[[0,−1],[1,0]], B=[[0,i],[i,0]], Γ=diag(1,−1) on the Fock plane with orthonormal basis (1, √2·e₁^(1,0)); blades e_I in an orthonormal basis with e_i²=−1.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: Clifford sign | unit e; v=0 | c(e)²=−1=Q(e); c(0)²=0=Q(0) | holds |
| Conventions: symbols | D=i∂ on ℝ, ξ=1 | σ_geom=i; σ_F=i·i=−1; σ_F(D²)=1=ξ² | holds |
| Conventions: curvature sign | unit S² | R(e₁,e₂)e₂=e₁, R(e₁,e₂)e₁=−e₂; K=1; Scal=2 | holds |
| G1.1 base-change direction | pin | `equivBaseChange ℂ Q : Cl(Q.baseChange ℂ) ≃ ℂ⊗Cl Q`; `.symm` maps the tensor carrier to the base-changed algebra as `README.md:43` says | holds |
| G1.1 positive-to-negative map | e with e²=+1 | (ie)²=−1 | holds |
| G1.1 rank 0 | V=0 | Cl=ℝ; `evenUnitaryGroup`={±1} (2 elements); native `spinGroup` = closure of ∅ = {1} (1 element) | holds, distinct as stated |
| G1.2 Fock plane | e₁, e₂=Je₁ | c(e₁)=A, c(e₂)=B; A²=B²=−Id; AB+BA=0; Γ=iAB=diag(1,−1), vacuum in S⁺ | holds |
| G1.2 metric normalization | w=e₁^(1,0) | h_ℂ(w,w)=g_ℂ(w̄,w)=1/2; h_J(e₁,e₂)=g(e₁,e₂)−ig(e₁,Je₂)=i=2h_ℂ(e₁^(1,0),e₂^(1,0)) | holds |
| G1.2 rescaling | T=2^(p/2) on Λ^p | TεT⁻¹=√2ε; T(−2ι)T⁻¹=−√2ι | holds |
| G1.3 star positivity | blades with k=|I|=0,1,2,3 | star(e_I)=(−1)^k(−1)^(k(k−1)/2)e_I; e_I²=(−1)^(k(k−1)/2)(−1)^k; product +1 every k; τ(star a·a)=Σa_I² | holds; faithful |
| G1.3 negative control for hQ | Q=+⟨·,·⟩ | star(e)e=−e²=−1, τ=−1<0 | hypothesis necessary |
| G1.3 normalization | n=0,1,2 | tr L₁=1,2,4; 2^(−n)·tr=1 | holds |
| G1.3 cyclicity | a=e₁,b=e₂; a=b=e₁ | τ(ab)=τ(ba)=0; both −1 | holds |
| G1.3 Check | a=1+e₁+2e₂ | τ(star a·a)=1+1+4=6; unnormalized trace of 1 is 4 | holds |
| G1.3 trace junk value | Lean `LinearMap.trace` | Cl(Q) has a finite basis, so the classical definition gives the true trace whatever instances are present | no junk |
| G1.3 Morita evaluation | V=0,S=ℂ,E=ℕ→₀ℂ; E=0; E=S; general E | T↦T(1) bijective; 0≃0; e(s⊗Id)=s; Cl≅M_n(ℂ) is simple Artinian, E=⊕_I S, Hom(S,⊕_I S)=⊕_I ℂ since S is finitely generated | holds for infinite-dimensional E |
| G1.4 central label | n=1; n=3 | (ie)²=1; (i²e₁e₂e₃)²=(e₁e₂e₃)²=(−1)³(−1)³=1; e_j commutes with the odd product | holds |
| G1.4 ψ(ω) | plane (e₁,e₀) | ψ(ie₁)=ie₀e₁=−ie₁e₀=−Γ | holds |
| G2.1 Γ² and anticommutation | ℓ=0,1,2 | (c₁⋯c_2ℓ)²=(−1)^ℓ; (i^ℓ)²=(−1)^ℓ; Γ²=1; Γc_j=(−1)^(2ℓ−1)c_jΓ=−c_jΓ, using polar(e_i,e_j)=−2+1+1=0 | holds; `h.1` needed |
| G2.1 degenerate carriers | ℓ=0; S=0 | Γ=Id, S⁺=⊤, S⁻=ker(2·Id)=⊥, IsCompl; S=0 gives ⊥,⊥ which are complementary | holds |
| G2.1 unused clause | Gram diag(1,2) on ℂ² | A† w.r.t. the new product = [[0,2],[−1/2,0]] ≠ −A, yet Γ²=1 | skew-adjointness unused by the three theorems; note only |
| G2.2 Hodge formula | plane p=0,1,2 | Γ1=i e₁₂, Γe₁=i e₂, Γe₁₂=−i by c=ε−ι; i^(1+p(p−1))*ω gives the same three values; Γ²1=1, Γ²e₁=e₁ | holds |
| G2.2 normalized Hilbert–Schmidt | plane Id | tr(Id†Id)=2; 2^(−1)·2=1=‖1‖² | holds |
| G2.2 reverse-dual chirality | ℓ=1 | Γ_(S*)=i^ℓ c₁ᵀ⋯c_2ℓᵀ=i^ℓ(c_2ℓ⋯c₁)ᵀ=(−1)^ℓΓ_Sᵀ=diag(−1,1) | holds |
| G2.3 product grading | two planes | Γ_V⊗Γ_W eigenvalues (1,−1,−1,1); (c_V⊗Id)(Γ_V⊗c_W)+(Γ_V⊗c_W)(c_V⊗Id)=(cΓ+Γc)⊗c_W=0 | holds |
| G3.1 trivial line | a+be | (a+be)(c+de)=(ac−bd)+(ad+bc)e; ‖a+be‖²=a²+b²; e↦2e has square −4 | holds |
| G3.1 compactness | G=ℝ, ρ(t)=rot(2t), μ(t)=diag(e^(−it),e^(it)) | μ(t)c(v)μ(t)⁻¹=c(ρ(t)v) since conjugation by cos t+sin t e₁e₂ rotates by 2t | holds without compactness (R02) |
| G3.3 Hermitian is insufficient | B=diag(i,−i), c(e₁)=A | BA−AB=[[0,−2i],[−2i,0]] | holds |
| G3.4 exterior operator | ℝ, (f,h) | D(f,h)=(−h′,f′); D²(x²,0)=(−2,0)=−∂²; point: D=0 | holds |
| G4.1a covers | Spin(2) z=i,−1; rank 1 | z²=−1,1; kernel {±1}; Spin(1)={±1}, SO(1)={1} | holds |
| G4.1b differential | θ↦2θ | derivative 2, inverse 1/2 | holds |
| G4.2 metric change | g′=4g | B=4, B^(−1/2)=1/2; ‖e/2‖_g′=1 | holds |
| G4.3 obstruction | S² plane bundles e=1,2 | w₂=1,0; lifts 0,1 | holds |
| G4.4 torsor | S¹; T² | H¹ orders 2, 4; twice-twisted = original | holds |
| G4.4a skeletal classes | trivial rank-3 bundle on S¹; disc with boundary loop of parity 1 | π₁SO(3)=ℤ/2 gives 2 classes = 2 lifts; cochain value 1 but H²(disc)=0 | holds; cochain ≠ class |
| G4.4a stabilization | Spin(3)×_SO(3)SO(n), n=1,2; TS² | {±1}; connected double cover of SO(2); e=2, w₂=0, TS²⊕ε¹≅ε³, one lift | holds |
| G4.4a rank-two criterion | H²=ℤ,e=2; e=1; H²=ℤ/2,e≠0 | 2c=e has c=1; none; 2H²=0 so ρ(e)≠0 by exactness; unstabilized frame over X² kills e|X² and H²(X)→H²(X²) is injective | holds |
| G4.4a layer order | Needs lines | G4.4a → G5.3 → G4.1–G4.4: 0 target cycles, 1 layer cycle | R01 |
| G5.0 external action | Cl(0,1), basis (1,e) | C₊(e)=[[0,1],[1,0]], C₊²=Id; c₋(e)=A, A²=−Id; C₊c₋+c₋C₊=0 on both basis vectors; untwisted R_e²=−Id | holds |
| G5.0 adjoints | R_w, ε | R_w orthogonal with R_w²=−‖w‖², so R_wᵀ=−R_w; εR_w=−R_wε; (R_wε)ᵀ=R_wε; (R_wε)²=‖w‖² | holds |
| G5.0 equivariance | g=e₁e₂ | even g commutes with ε and with R_w; odd e₁ anticommutes with ε | evenness needed, as stated |
| G5.3 characters | z=cos θ+sin θ e₁e₂ | ρ(z)=cos θ+sin θ·AB=diag(e^(−iθ),e^(iθ)); S⁺ weight z⁻¹, S⁻ weight z; zvz⁻¹ rotates by 2θ so E has weight z²; (S⁻)²≃E | holds |
| G5.3 roots on S² | e=2; e=1 | c₁(root)=1; 2c₁=1 unsolvable | holds |
| G6.0/G6.3 spin curvature | A=(e_i↦e_j, e_j↦−e_i) | ¼Σ⟨Ae_i,e_j⟩e_ie_j=½e_ie_j, whose adjoint action is A; on S²: R^S=−½c₁c₂, c₁c₂R^S=½=Scal/4 | holds |
| G6.0 contraction, all ranks | constant curvature 1, n=0..4 | Σ_(i<j)−(c_ic_j)²/2 = 0,0,1/2,3/2,3 = n(n−1)/4 | holds, odd rank included |
| G6.0 regular-module volume signs | Cl(0,4)≅M₂(ℍ); Cl(0,8)≅M₁₆(ℝ) | dims 16, 256; graded irreducibles 2×8 and 2×16; sums a−a=0 and 8b−8b=0 | holds |
| G6.0 KO calibrations | signed points; circles; T²; λ=0,1 | ±1; periodic kernel 1 → η, antiperiodic 0; η² and 0; bounded transform 0, 1/√2 | holds |
| G6.1 local operator | D=i∂; f=x; Fourier 1/k | D e^(ikx)=−k e^(ikx); [D,x]=c(e); Σ1/k²<∞, Σ1=∞ | holds |
| G6.2 curvature factor; perturbation | plane B; D′=D+Id | Σ_(i,j)c_ic_jR_ij=2c₁c₂B; D′²−D²=2D+Id | holds |
| G6.3 twist | F₁₂=if·Id | c₁c₂·if=fΓ, eigenvalues ±f | holds; positivity needs the twist term |
| G6.4 harmonics | flat circle; point | (1,1); (1,0) | holds |
| G6.5 spectra | length 2π; T²; Sⁿ | ℤ and ℤ+½, kernels 1, 0; four twists, only (0,0) has zero momentum; Scal=n(n−1) | holds |
| G6.6 symbol | ξ≠0; t∈[0,1]; base ℝ | c(ξ)⁻¹=−c(ξ)/‖ξ‖²; |e^(iπt/2)|=1; zero section of Tℝ noncompact | holds |
| G6.7 volume identities | Cl(0,4) | ω₋²=(−1)⁶·1=1; ωe_Iω=(−1)^|I|e_I=ε(e_I); C₊(e₁)⋯C₊(e₄)s=sω=R_ω s; on the even part R_ω=L_ω=−Γ | holds |
| G6.7 quaternionic parity | J(z,w)=(−w̄,z̄); line J(z)=a z̄; flat T⁴ | J²=−Id, dims 2 and 1; |a|²=−1 impossible; kernels (2,2), index 0=2·0 | holds |

The pass found no false identity, no reversed sign and no vacuous quantifier; the three defects it surfaced are R01, R02 and the unused clause note.

## Not verifiable

- Lawson–Michelsohn Chapters I–II and Atiyah–Bott–Shapiro §§6 and 11 are settled as `uncertified` in the manifest (paywalled); they are cited by locator only and were not opened.
- Kirby's OCR is damaged at kirby line 1141 and 1156 (the fibre-restriction formula and the w₁ sentence); the checks above use the legible surrounding lines only.
- The finite computations above test the closed-manifold analytic statements (Sobolev domains, functional calculus, KO classification) on their calibration cases; they are not proofs of those theorems, whose inputs are the named GeneralizedCohomology G5.5, PDO P6 and ComplexKahlerGeometry K5a contracts.

## Source issues

- none
