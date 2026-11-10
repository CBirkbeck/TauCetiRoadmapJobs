# Review of IntegrableSystems (pull request #1651 at c1e867d)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** accepted

Full review. Both files of the folder are byte-identical to the head `860e384` (and to `2fc76b2`); the pins (`lake-manifest.json`, `lean-toolchain`) and the family index do not differ from `origin/main` (`71c8f21`). What moved since then is the sibling `CotangentLagrangian` (README and `Suggested.lean`, whose C3 and C3.1 this roadmap consumes) and five lines of `ConvexityToric/README.md`. I re-read both files in full, recomputed every Check and worked example, and re-resolved the citations into the changed siblings. There is no finding.

## Verified sound

**Gate, build and dependency direction.**
- The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `outside-folder=0`, all scanners 0). My own run has every scanner 0 and `depcheck=0`; it lists `outside-folder=4`, naming only the README and `Suggested.lean` of `ConvexityToric` and `CotangentLagrangian`, which the pull request owns. The exclusion diff against `origin/main` is empty.
- `lake env lean` on `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean`: exactly four `declaration uses sorry` warnings (lines 73, 108, 123, 151), nothing else.
- Dependency check, no UPWARD, CYCLE or `moved:` line:

```
depcheck: 234 roadmaps, 2267 edges, 0 problem(s)
```

**Lean form and signatures.** One module docstring, a single `import Mathlib` plus seven `TauCeti.*` modules that all exist at the pin, no `set_option`, no sorry'd data, `theorem` only, a docstring on each of the six declarations. `#check @` for all six in one scratch copy: the elaborated types agree with `signatures.md` and with the README statements. `exists_actionAngle` carries `FiniteDimensional ℝ E`, `I.Boundaryless`, `T2Space M`, `IsManifold I ∞ M` and `Fact (0 < p)`; the two I3 theorems carry `FiniteDimensional ℝ E`, `I.Boundaryless`, `IsManifold I ∞ M`; `strict_annulus_two_fixed_points`, `strip` and `interiorFundamentalDomain` use no section variable. No binder is lost.

**Headlines and padding.** Headlines of the README: Liouville–Arnold action–angle coordinates (I2, stated), the second-order property and the Legendre transport (I3, both stated), the strict annulus theorem (I5, stated), the Lagrangian regular level, the stabilizer quotient and central-force conservation (proved at the pin, cited in the docstring and not restated), and the period-lattice bundle, its classes, the global criteria and the pendulum monodromy (named in the docstring as not statable: no lattice bundle `Λ ⊂ T*B` or sheaf `Z¹/Λ` at the pin). One-tactic probe (`first | (simp; done) | rfl | infer_instance | (simp_all; done) | (aesop; done) | sorry`) on a scratch copy: all four theorems still report `sorry`. The two definitions have real bodies and are used by the I5 statement.

**Pinned declarations** (59 backticked library names in the README, each located at the pin; Tau Ceti `2fd255d`, Mathlib `1b1ccf4`). Among them: `Geometry/Symplectic/Hamiltonian/Integrable.lean` 91 (`IsFirstIntegral`), 172 (`IsIntegrableSystem`), 202, 234, 249, 280, 316; `Hamiltonian/Involutive.lean` 102, 119, 208, 234; `Hamiltonian/Complete.lean` 94; `Hamiltonian/CommutingFlow.lean` 185, 227; `Hamiltonian/LiouvilleArnold.lean` 260, 318, 360, 391; `Hamiltonian/Manifold.lean` 179 (`hamiltonianVectorField`), 338 (`poissonBracket`), 416, 541; `Hamiltonian/CentralForce.lean` 92, 104, 211, 283, 382; `CentralForce/Kepler.lean` 205; `Oscillator/ActionAngle.lean` 101; `Cotangent/Bundle/Legendre.lean` 121, 198, 247, 277, 451, 468, 510, 532, 549; `Cotangent/Bundle/Liouville.lean` 144, 279; `Manifold/Instances/AddCircle.lean` 91 (`PeriodLine`), 258, 296, 388, 560, 624; `DifferentialForm/AddCircle.lean` 92, 156, 201, 229; `Orientation/AddCircle.lean` 110; `DifferentialForm/Torus.lean` 90, 251; `Orientation/Torus.lean` 67; `Instances/CircleFamily.lean` 49; `DifferentialForm/CircleFamily.lean` 125, 313; `CircleFamily/Pullback.lean` 85; `Instances/Quotient.lean` 242, 253; Mathlib `Topology/Algebra/ProperAction/CompactlyGenerated.lean` 95 and `Analysis/Normed/Module/Alternating/Basic.lean` 294. `isLagrangian_ker_mfderiv` at `Integrable.lean` 202 needs a regular point and a nondegenerate form, as the README says. `library-matches.md` has no same-name hit.

**Cross-roadmap citations.** `roadmaps resolve` finds no unresolved citation or Lean name. Siblings at this head: `ConvexityToric/README.md` 204 (`## Layer 1: Compact symplectic actions and local models`, the anchor of README line 21) and 206 (`### 1.1`); `CotangentLagrangian/README.md` 381 (`## C3`), 470 (`### C3.1`), 482–509 (chain dictionary, which names IntegrableSystems I5.2 as its instance at 509); family index line 84 (`## S0`). On main, the cited roadmaps (DifferentialGeometry Layers 0, 1, 3, 8.4; SmoothBundlesConnections B1.0, B6.1, B6.6; CharacteristicClasses C1.2b; AlgebraicTopology Stages 5–6; HamiltonianReduction R1; HopfRinow; LieGroups) have an empty diff between `08d58bb` and `71c8f21`, so the 13 citations resolve as before.

**Overlaps and ownership.** The only other open pull request touching this folder is the pin bump #1187; the description's `merge-order` block orders this pull request before it. No cited id is dropped or defined only by an open revision; this pull request drops none. The four theorem names and `interiorFundamentalDomain` occur in no other roadmap's `Suggested.lean`. The closest roadmaps in vocabulary are the family's own and HamiltonianSystems, which this roadmap does not cite; IntegrableSystems is on main and is the earlier owner. The description's IntegrableSystems paragraph agrees with the head. No gap is declared and none is needed.

**Sources.** The README flags no locator as unverified. Read at their locators: `lecalvez-wang` lines 75–82 (boundary twist condition for a lift, Theorem 1, printed p. 704: at least two fixed points of the lift's kind, for homeomorphisms, as the README says); `cds` lines 4470–4483 (Theorem 18.12, parts (a) and (b), §18.4); `smale1959` lines 15–17 (Theorem B, p. 621: contractibility of square diffeomorphisms equal to the identity near the boundary); `gramain1973` lines 48–60 (Théorème 1, pp. 53–54: homotopy type O(2) for the cylinder); `egms` lines 533–555 (polar orbits, only P₊ contributes).

**Adversarial pass** (values recomputed this round).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| "Supplied by Tau Ceti", I1 | oscillator on ℝ², n=1; n=0 | regular set ℝ²∖{0} dense; 2·1 = dim; ker dH = span X_H is a line, Lagrangian; k ≤ n: 1 ≤ 1; n=0: empty tuple, 0 = 0 | agrees with pinned statements | none |
| "Supplied by Tau Ceti", I2 | H=νI; f=p on T*ℝ | proper needed for completeness (pinned line 94); stabilizer 2πν⁻¹ℤ discrete, ℝ/Λ compact; f=p: stabilizer 0, level a line, no torus claimed | agrees | none |
| "Supplied by Tau Ceti", I4 | Kepler | I_r+|ℓ| = κ√(m/(−2E)) gives H = −mκ²/(2(I_r+|ℓ|)²); Ω_r = mκ²/I³; T = 2πI³/(mκ²) with I=√(mκa) gives 2π√(m/κ)a^(3/2); circular E=−mκ²/(2ℓ²): I_r = 0, e = 0 | agrees | none |
| "Quotient and atlas" | p>0, compacts in [−R,R] | n·t = t+np; integers with \|np\| ≤ 2R: at most 2⌊2R/p⌋+1; lifts differ by np, transition derivative 1 | agrees | none |
| "Group, translations and time form" | circuit t↦q_p(t), 0≤t≤p | ∫dt = p; q_p^*α = dt determines α since q_p is a surjective local diffeomorphism; ×(−1) pulls dt_p to −dt_p | agrees | none |
| "Scaling" | p=1, q=2π; composition | derivative q/p = 2π; (r/q)(q/p) = r/p; dt_p = (p/2π)dθ; D_(p,p) = id | agrees | none |
| "Finite products and open restrictions" | two factors; empty index set | dt₂∧dt₁ = −dt₁∧dt₂ (transposition sign −1); empty product a point, sign +1; period of dt_i on the j-th circle 0 for j≠i | agrees | none |
| "The positive-period total family" | cover Q, deck t↦t+np | Q^*η = p·d(t/p) = dt−(t/p)dp; after deck: dt+n dp−(t/p)dp−n dp, same; Q^*dη = (1/p)dp∧dt ≠ 0; i_p^*η = dt_p | agrees | none |
| "Smooth parameter families and estimates" | k=0,1,2 on \|t\|≤R, p≥ε | t/p, −t/p², 2t/p³; bounds R/ε, R/ε², 2R/ε³; ∂_t∂_p^k = (−1)^k k!/p^(k+1); η_q = qβ = (q/p)η_p | agrees | none |
| `exists_actionAngle` and its Checks | oscillator; critical point; n=0; f=p | (q,p)=(r sinθ, r cosθ): dq∧dp = r dθ∧dr = dθ∧dI, H=I; counterclockwise gives −dθ∧dI; n=0: point, D=ℝ⁰, image = whole (one-point) bundle; f=p: L a line, `hLc` fails; period p: θ↦(p/2π)θ, I↦(2π/p)I, product preserved | true as stated | none |
| I2 period lattice | H=νI | dI = (1/2π)λ dc with λ=2π/ν gives dI = dc/ν; Λ = 2πν⁻¹ℤ | agrees | none |
| I2 global example | a(r,φ)=(r cosφ, r sinφ) on (1,2)×(0,3π) | det Da = r > 0, local diffeomorphism; a(r,π/2) = a(r,5π/2), not injective | agrees | none |
| `mfderiv_proj_lagrangianVectorField` | L=½mv²−V; L=v | ι_Xω_L = m(a dv−b dq) = mv dv+V′dq gives a=v, b=−V′/m; L=v: ω_L=0, field 0 ≠ v, `hreg` fails | true | none |
| `mfderiv_legendreMap_lagrangianVectorField` | same L; L=e^v | dFL(v,−V′/m) = (v,−V′) = X_H at p=mv; e^v: FL misses p≤0, `hbij` fails | true | none |
| I4 free particle against C3 (README 354) | S=−m‖q−Q‖²/(2t) | p = d_qS = m(Q−q)/t, so Q = q+tp/m; P = −d_QS = p; m=1 is C3's acceptance map | agrees with `CotangentLagrangian/README.md` C3 | none |
| I5.0 convention against C3/C3.1 (README 435, 544) | G_k = −S_k | C3.1 relation p=d_1G, P=−d_2G becomes y=−∂_1S, Y=∂_2S; matching equation −d_2G_(k−1)=d_1G_k becomes Y_(k−1)=y_k; marked point (x_1, d_1G_1) = (x_1,y_1) | agrees | none |
| I5.0 normalization | ρ≡1; ρ=1+y; shear R_c | s=a=1, identity; s=a=3/2, v=(2y+y²)/3, a du∧dv = (1+y)dx∧dy; S=(X−x)²/(2c): y=Y=(X−x)/c | agrees | none |
| I5.1 Checks | F=(x+(2y−1)/8,y), c=1 and c=1/8; Moser data ρ=1+ε sin 2πx | N=(x−(6y+1)/8,y), N_Xy=−3/4; c=1/8: N_Xy=+1/8; S_1 = −(2/3)(x−X)²+(x−X)/6−1/96, zero at x−X=1/8, S_12=4/3; a_t=0, b_t=ε(1−cos 2πx)/(2π), dβ=ε sin(2πx)dx∧dy; d/ds ψ^*ω_s = ψ^*(dι_Xω_s+dβ) = 0 exactly for ι_Xω=−β | agrees | none |
| I5.2 Checks | K=1, d=x_2−x_1 | W = −d²/6−d/6−1/96 = 1/32−(d+1/2)²/6 (1/24 unnormalized); y_1 = −(4/3)d−1/6 ∈ [0,1] iff d ∈ [−7/8,−1/8]; critical d=−1/2 gives y_1=1/2, the fixed circle of F | agrees | none |
| I5.3 face formula and Checks | K=1 | ydot_1 = S_11(Y_2−y_1)+S_12(Y_1−y_2) with S_11=−4/3, S_12=4/3, Y_2=y_2=−d: −(8/9)(d+1/2); −1/3 at d=−1/8 (face y_1=0), +1/3 at d=−7/8 (face y_1=1), both outward; d′ = −2W′ = (2/3)(d+1/2); S_11 = −S_12B′ with B′=1 | agrees | none |
| I5.4 Checks | K=1 | G = u−(6v+1)/8; ∂_uG=1, ∂_vG=−3/4; G(0,0)=−1/8, G(1,1)=1/8; root (6v+1)/8 ∈ [1/8,7/8]; flow ydot=1: exit set the upper circle, Ȟ^*(P,L)=0, Inv(P)=∅ | agrees | none |
| `strict_annulus_two_fixed_points`, `strip`, `interiorFundamentalDomain` | F=(x+(2y−1)/8,y), ρ≡1; rigid rotation; boundary points | det DF=1, `harea` 1·1=1; lower −1/8<0, upper +1/8>0; fixed set y=1/2, e.g. (0,1/2) and (1/2,1/2), distinct in [0,1)×(0,1); rotation x+1/4 fails `hlower`; ρ>0 and `harea` force det DF>0; a fixed point at y=0 or 1 contradicts the strict inequalities | true; Le Calvez–Wang Thm 1 after the I5.0 normalization | none |
| I4 pendulum monodromy | loop around (1,0) | γ_J fixed, γ₂ ↦ γ₂+γ_J: matrix [[1,1],[0,1]], determinant 1, not the identity; only P₊ contributes (`egms` line 555) | agrees | none |

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50; Marsden–Ratiu, Ch. 7; Duistermaat 1980; Conley–Zehnder 1983; Epstein 1966, Thm. 6.4; Spanier, Ch. 6; Lee; Hofer–Zehnder. The manifest records them as uncertified and the README cites them by locator only. The statements resting on them were checked by computation (table above); Liouville–Arnold also against `cds` Theorem 18.12 (lines 4470–4483).
- Ownership against open pull requests was checked with `roadmaps grep` and the overlap list only, not by reading every open folder.

## Source issues

- none
