# Review of GeometricQuantization (pull request #1186 at 2c84ca0)

**Verdict:** needs changes

This is a full review of the folder at `2c84ca0`. The folder is unchanged since the head the previous review read (the change set is empty), so the previous review's only finding, the stale Tau Ceti pin, is still open and is carried as R01. R02 is new: two display formulas render with stray italics on GitHub and lose a subscript and two asterisks. Neither finding is blocking. The gate passes, the dependency check is clean, `Suggested.lean` elaborates with `sorry` as its only warning, and the adversarial table below found no false statement, sign or normalisation error.

## R01 (P3) — The branch still pins Tau Ceti `a91d3aa`, where ten cited Tau Ceti declarations do not exist

Previous review R01 (and R03 before that). Not repaired: the head is unchanged.

**Location.** `lake-manifest.json` line 8, `"rev": "a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039"` (Tau Ceti), with Mathlib `6b7abb3c` and `lean-toolchain` `v4.35.0-rc3`. Affected passages: `TauCetiRoadmap/GeometricQuantization/README.md` lines 56–66 (Conventions), 131–154 (Tau Ceti contract), 474–481 (§2.3), the *Needs* lines 406–408, 541–546 and 937, and the `Suggested.lean` docstring lines 14–19 and 27–28.

**Claim.** The README cites the following Tau Ceti declarations. None of them exists at the branch pin `a91d3aa`; all of them exist at main's pin `2fd255d`, at the file and in the namespace the README gives:
- `TauCeti.SmoothForm` (`DifferentialForm/Smooth.lean`:479 at main; the branch has no `DifferentialForm/` directory);
- `SmoothTwoForm.IsHamiltonianVectorField`, `.hamiltonianVectorField` and `.poissonBracket` (`Symplectic/Hamiltonian/Manifold.lean`:124, 179, 338);
- `SmoothTwoForm.IsNondegenerate.hamiltonianVectorField_poissonBracket` (`Hamiltonian/Bracket.lean`:182, in `namespace IsNondegenerate` from line 175);
- `TauCeti.InfinitesimalAction` (`VectorField/InfinitesimalAction.lean`:83);
- `SmoothTwoForm.IsMomentMap`, `.momentCocycle`, `IsMomentMap.momentCocycle_eq` and `IsMomentMap.momentCocycle_mem_twoCocycle` (`Hamiltonian/MomentMap.lean`:133, 388, 505, 542; `namespace IsMomentMap` runs over lines 462–560).

Line 63's "`TauCeti.SmoothTwoForm I M` is the abbreviation for `TauCeti.SmoothForm I M ℝ 2`" is also false at the branch pin, where `SmoothTwoForm` is a `structure`. It is true at main's pin, where `TwoForm/Basic.lean`:37 has `abbrev SmoothTwoForm`.

**Witness.** In this branch's `.lake/packages/TauCeti/TauCeti`, `Geometry/Symplectic/` has no `Hamiltonian` entry, `grep -rn 'def hamiltonianVectorField'` has 0 hits, and `Geometry/Manifold/TwoForm/Basic.lean`:61 reads `structure SmoothTwoForm`.

**Repair.** No change to the text. Merge `origin/main` into the branch and re-run the gate. `git merge-tree --write-tree HEAD origin/main` (print-only) exits 0 at this head. Since the merge base `83f4d77`, main has changed `lake-manifest.json` and `lean-toolchain` and nothing in this folder. `Suggested.lean` uses five Mathlib names, and their statements at main's Mathlib pin `1b1ccf4` are textually identical to the branch pin (`TwoVariable.lean`:124, 252, 328, 385, 391 there). After the merge, also reword docstring line 17. "The pinned smooth principal bundles" presupposes a carrier that neither pin has: the branch has no principal bundle at all, and main has only the topological `TauCeti.PrincipalBundle` (`Topology/FiberBundle/Principal.lean`:156). Say that Tau Ceti has only that topological class, with no smooth structure, principal connection or associated line. No edit inside the folder can repair the pin itself. If the repair job cannot merge a branch, this is an operator step.

## R02 (P3) — Two display formulas render with stray italics on GitHub, losing a subscript and two asterisks

**Location.** `TauCetiRoadmap/GeometricQuantization/README.md` lines 1618–1619, `H⁰(M,L^n)_λ ≃ H⁰(M,E)^T ≃ H⁰(Mss_ξ,E)^T / ≃ H⁰_orb(R_ξ,L_(n,λ,ξ)).` (§6.7), and line 766, `lattice is X^*(T). The forgetful map is restriction/pairing X^*(T)→P.` (§3.4). Both are bare paragraph text. Lines 652, 1474, 1580, 1586 and 1597 are also bare display formulas. They render correctly, but they break the same rule.

**Claim.** The house style puts a display formula in a code span or an indented code block, and this README does so at lines 1280, 1301 and 1306. Under CommonMark's emphasis rules, which GitHub also uses, the `_` after `)` at 1618 opens emphasis and the `_` in `L_(` at 1619 closes it. §6.7's isomorphism chain therefore renders in italics as "H⁰(M,L^n)λ ≃ … L(n,λ,ξ)", dropping the subscripts `_λ` and `_(n,λ,ξ)`. At 766 the two `*` pair, so the character lattice renders twice as "X^(T)".

**Witness.** `markdown_it` in CommonMark mode renders 1618–1619 as `H⁰(M,L^n)<em>λ ≃ … L</em>(n,λ,ξ))` and line 766 as `X^<em>(T). … X^</em>(T)→P`. Lines 652, 1474, 1580, 1586 and 1597 render without emphasis.

**Repair.** Put each of the seven display formulas in a backtick code span, as at line 1280, and write `X^*(T)` and `X^*(T)→P` at line 766 as code spans. Tested with the same renderer: `` `H⁰(M,L^n)_λ ≃ H⁰(M,E)^T ≃ H⁰(Mss_ξ,E)^T ≃ H⁰_orb(R_ξ,L_(n,λ,ξ))` `` and ``lattice is `X^*(T)`. The forgetful map is restriction/pairing `X^*(T)→P`.`` both render with no emphasis.

## Previous findings

- **R01 (P3, stale Tau Ceti pin): not repaired.** `lake-manifest.json` line 8 still reads `a91d3aa`, and the change set since the previous review is empty. It is carried as R01 above, with the docstring wording added to the repair. No repair report marks it "not actionable in this package" (the board has review reports 1–10 and no repair report), so nothing is re-raised.

## Verified sound

**Gate, dependency check, elaboration.**
- The worker's gate at `2c84ca0`: every check `0`, `build=0`, `OK`.
- Dependency check, complete output: `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. Merge order: GeometricQuantization is line 153. Its suppliers in open pull requests come earlier: IndexTheory (10), SmoothBundlesConnections (12), PseudodifferentialOperators (13), ComplexComparisonPartII (39), K3Surfaces (135, not cited) and LieGroupoidsPoisson (152). The other suppliers are on main. None of the fifteen forbidden roadmaps is cited.
- `lake env lean TauCetiRoadmap/GeometricQuantization/Suggested.lean`: exit 0. The only output is `Suggested.lean:92:8: warning: declaration uses `sorry``.
- `#check @` in a scratch copy gives `thetaSections : ℕ → ℂ → ℝ → ℝ → Submodule ℂ (ℂ → ℂ)` and `finrank_thetaSections : ∀ (k : ℕ), 0 < k → ∀ (τ : ℂ), 0 < τ.im → ∀ (α β : ℝ), Module.finrank ℂ ↥(thetaSections k τ α β) = k`. Neither declaration uses section variables, so nothing is lost. Both match README §5.3 lines 1062–1065 and 1097–1100: integer `k>0`, `τ∈ℍ`, real `α,β` (the README says "modulo integers"; the space depends only on the classes), and the factor `exp(2πiβ−πikτ−2πikz)`.
- One-tactic padding probe on `finrank_thetaSections`: `simp` makes no progress, `rfl` fails (not definitionally equal), `infer_instance` fails (not a class) and `aesop` makes no progress; `exact?` suggests only the theorem itself. It is not padding. The proved `example` is the only other declaration. It checks the sign of the automorphy factor against Mathlib's `jacobiTheta₂_add_left'` (factor `cexp (-π * I * (τ + 2 * z))`), and would fail under the opposite sign, so it tests the kept definition rather than computing a value.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The only backticked names the README gives as this roadmap's own are `thetaSections` and `finrank_thetaSections`, and both are declared. Form: one module docstring, `namespace TauCetiRoadmap.GeometricQuantization`, one Layer 5 section comment, a docstring on every declaration, `theorem`, a single `import Mathlib`, no `set_option` and no sorry'd data.

**Library declarations opened at the pins.**
- Mathlib `6b7abb3c` (branch): `jacobiTheta₂` (`NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`:251), `summable_jacobiTheta₂_term_iff` (:123, `↔ 0 < im τ`), `differentiableAt_jacobiTheta₂_fst` (:327), `jacobiTheta₂_add_left` (:384), `jacobiTheta₂_add_left'` (:390); `CovariantDerivative` (`Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean`:365); `LieAlgebra.IsKilling.rootSystem` (`Algebra/Lie/Weights/RootSystem.lean`:411); `ContinuousMonoidHom.comp` (`Topology/Algebra/ContinuousMonoidHom.lean`:152); `QuotientGroup.lift`, `lift_mk`, `lift_comp_mk'` (`GroupTheory/QuotientGroup/Defs.lean`:249, 253, 262); `continuous_quot_lift` (`Topology/Constructions.lean`:729); `VectorField.mlieBracket_smul_left` (`Geometry/Manifold/VectorField/LieBracket.lean`:505, `[f•V,W]=−(df W)•V+f•[V,W]`, the sign §4.2 uses); `VectorField.leibniz_identity_mlieBracket` (:1153).
- Tau Ceti `a91d3aa` (branch): `ODE.exists_contDiffAt_picard_solution` (`Analysis/ODE/SmoothParameter.lean`:207). It assumes finite-dimensional `E`, `F`, `ContDiffAt ℝ (n+1) f (p₀,x₀)` and `f(p₀,y)=0` near `x₀`, and gives a `C^(n+1)` family `γ`, exactly as README lines 156–161 say. Also opened: `fourierChar (n : ℤ)` with explicit period `T` (`RepresentationTheory/Compact/Circle.lean`:126) and `fourierRep` (:142); `formalCharacter` (`Algebra/Lie/Weights/FormalCharacter.lean`:156, valued in `AddMonoidAlgebra ℤ (Dual K L)`); `formalCharacter_coeff_eq_finrank_weightSpace` (:485) under `[CharZero K] [IsAlgClosed K] [IsKilling K L] [FiniteDimensional K L]`, a Cartan `H` and `[FiniteDimensional K M]`; `isIntegralWeight_of_formalCharacter_coeff_ne_zero` (:493), `omit [IsAlgClosed K]`, with `[IsTriangularizable K H L]`. These are exactly the hypotheses at README lines 1234–1241. `SmoothTwoForm.IsSymplectic` (`Geometry/Symplectic/Manifold/TwoForm.lean`). The ten missing names are listed in R01.
- Tau Ceti `2fd255d` (main): every name in R01, at the file and namespace given there.

**Cross-roadmap citations resolved** (on main `01daf25` unless stated).
- SmoothBundlesConnections B1.4 (421), B2.1 (559), B2.2 (605), B2.4 (776), B3.1 (871), B4.1 (979), B4.2 (1010), B5.0 (1072), B5.2 (1209), B6.2 (1668), B6.3 (1716), B6.4 (1739), B6.5 (1780).
- LieGroupoidsPoisson §G4.1 (1144: Lie-algebra instances on smooth functions) and §G4.2 (1181: `π♯=−(ω♭)⁻¹`). Recomputed: `X_f=−π♯df` and `π(df,dg)=dg(π♯df)=−dg(X_f)=df(X_g)`; on `dq∧dp` this gives `{q,p}=1`.
- ConvexityToric T1 (32; `Λ_Z=(2π)⁻¹ker(exp)`, `(1/i)dχ`, restriction/quotient formulas and `2πα∨∈ker(exp)` at 41–48), T3 (106; norm-square semiflow and single-point limit), T4 (156; Liouville `ω^n/n!`, DH measure and full-isotropy comparison).
- HamiltonianReduction R1 (33; group defect θ with `dθ₁(η)(ξ)=c_μ(ξ,η)`), R2 (127), R2a (157), R3 (187). CotangentLagrangian C1 (25).
- LieGroups Layer 5A (641), Layer 6 (673; coroots `α∨=2α♯/‖α‖²` at 750, rank-one maps with `dφ(diag(i,−i))=α∨` at 751), Layer 7 (787; `H/N` at 868, polar map at 916), Layer 8 (1078; two Borel conventions at 1087, `m=⟨μ,α∨⟩` at 1158).
- SchubertGeometry S9 item 1 (109) and item 7 (122; `K/H≅G/P−`, the KKS Kähler metric, coefficient-1 cell comparison with R2a).
- ComplexKahlerGeometry K3 (296; locally bounded extension at 437), K4 (444; Koszul–Malgrange at 482), K5b.1 (1208), K6.0 (1245), K6.1 (1274), K7.2 (1444; `binomial(n+k,n)` at 1452; GQ named as consumer at 1478; "theta sections of positive torus line bundles and their quantization are GeometricQuantization's targets" at 1517).
- Orbifolds O1 (87), O2 (154), O4 (296), O4-T (419), O5 (672).
- DifferentialGeometry 0.4 (294; `SmoothForm I M F k` and the `SmoothTwoForm` abbreviation), 1.4 (325), 3.1 (375), 3.2–3.4 (379–394), 4.3 (463), 5.4 (524), Layers 5–8 (503–816).
- AlgebraicTopology Stages 4–6 (499, 849, 946). SelfAdjointSpectralTheory SA-A21 (225), SA-A22 (227), SA-C39–C42 (888–893). PseudodifferentialOperators P1 (162), P2 (543). CompactGroups `fourierBasis` (14–16).
- IndexTheory at its open head `6d85f5d4`: I6.1 (1240), I7.3 (1392), I8.2 (1595), I8.3 (1614, isolated nondegenerate fixed points only, as §6.2 says) and I8.4 (1636, `(g·s)(x)=g_E s(g⁻¹x)`).
- ComplexComparisonPartII at its open head: C0.3 (README line 1353), C1.7 (1910), C1.8 (1954, analytic Serre vanishing), C1.9 (1984), C5.1 (3000), C5.4 (3724; frame-torsor bijection onto `H¹(M,O_M^×)` and the exponential connecting map), and the consumer paragraph naming "GeometricQuantization §3.3" (5314).

**Overlap with open pull requests.** `scratch/overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id. I checked the open revisions of the cited suppliers by hand:
- AlgebraicTopology #1652 (`946a78ab`) renames "Stage k" to "Layer k", but README lines 715–728 there state "Stage k is Layer k" item by item, so "AlgebraicTopology Stages 4–6" still resolves.
- ConvexityToric #1651 (`f049e2f`) renames T1–T5 to Layers 1–5 and keeps "The labels T1–T5 denote these same five layers" (line 132).
- CotangentLagrangian C1 (#1651) and HamiltonianReduction R1, R2, R2a and R3 (#1187) are unchanged.
- SchubertGeometry #1224 (`368c92d5`) keeps S9.1 (1677) and S9.7 (1730). It assigns "the ordinary holomorphic Picard group of the compact flag K/H, its root-degree basis and the compact character-to-degree forgetful map" to GeometricQuantization §§3.3–3.4 (lines 44–50) and lists GQ as a consumer (1918–1920). That matches this README, so there is no cycle.
- DifferentialGeometry #886 keeps 0.4, 1.4, 3.1–3.4, 4.3 and 5.4. ComplexKahlerGeometry #1234 keeps K3–K7, K5a, K5b.1, K6.0, K6.1 and K7.1–K7.2. SelfAdjointSpectralTheory #1027 keeps SA-A21, SA-A22 and SA-C39–C42.

**Ownership against open work.** I ran `roadmaps grep` over main and every open head for: theta sections with characteristics or dimension; prequantum, prequantization and Bohr–Sommerfeld; Kodaira embedding and projectivity; Kawasaki and orbifold Riemann–Roch; quantization commutes with reduction; Duistermaat–Heckman limits; and Appell–Humbert. None found a second owner of an object this roadmap owns:
- ComplexKahlerGeometry line 1517 assigns the torus theta sections to this roadmap.
- AbelianSchemesAndArithmeticModuli A2.4 (#849) proves the algebraic `h⁰(A,L)=χ(L)` over a field, not the analytic theta space.
- K3Surfaces §1.1 (#1285, `a23ff3aa`, line 479) builds a peak-section Kodaira embedding only for positive lines on its K3 surfaces. No roadmap before line 153 states the general compact-Kähler, torus-equivariant theorem, so §6.2 owns it, and its line 1197 sentence correctly excludes ComplexKahlerGeometry K7.
- Tau Ceti at both pins has no theta-section space: `jacobiTheta₂` appears there only in theta-series and Gauss-sum files. Mathlib's `JacobiTheta` files have no dimension or basis statement.
- No open `Suggested.lean` declares anything in `TauCetiRoadmap.GeometricQuantization`.

**Sources at the sampled locators.** Printed pages were confirmed from the running heads in each text.

| Target | Locator | Text read | Supports the statement as written? |
|---|---|---|---|
| 2.3 | Tuynman v2 Thm 7.9 p. 39 | tuynman lines 1918–1930; convention lines 25–32 | Yes. Connected simply connected group and complete generating fields give a unique global left action. His `ρ` carries a minus sign that makes it a homomorphism, so the README's anti-homomorphism `ξ↦−Y_(μ^ξ)` is the stated translation. |
| 3.1, 3.4 | Graham–Vogan Ex. 5.8 p. 25 | — | Not readable; see "Not verifiable". |
| 3.3, 3.4 | Demailly V (11.2), (11.3) p. 267; (12.1) p. 268; VI §9.1 (9.1) p. 314 | demailly lines 13142–13221, 15562–15575 | Yes. `Pic=H¹(X,𝒪*)`; `d''` is the canonical (0,1)-connection; Chern connection. (9.1) is the exponential sequence for a compact connected Kähler X, and §3.3 proves `H^q(𝒪)=0` before using it. |
| 4.1–4.3, 5.3 | Schottenloher v15.6 Def. 9.8 p. 125, Def. 10.1 p. 141, Def. 11.4 and Prop. 11.5 pp. 167–168 | schottenloher lines 5049–5069, 5732–5750, 6858–6900 | Yes. Integrable maximal isotropic distribution; `∇_X s=0` on P; Bohr–Sommerfeld variety by trivial leaf holonomy; polarized sections vanish off it. Def. 11.4 is stated for a reducible complex polarization, of which the real one is a case. |
| 2.1, 2.2, 1.1 | Schottenloher Ex. 7.3 p. 96, Rem. 7.4 p. 97, Thm 7.8 p. 99, Prop. 7.10 p. 101, Props 7.15–7.16 p. 105 | lines 3964–4011, 4078–4180, 4336–4364 | Yes. `q(F)=−(i/2π)∇_{X_F}+F` with `[q(F),q(G)]=(i/2π)q({F,G})`, which is the README's sign after conjugation and `2π↔1/ℏ`. Complete `X_F` gives essential self-adjointness. |
| 4.2 | deductions; Mathlib `mlieBracket_smul_left`, `leibniz_identity_mlieBracket`; Tau Ceti bracket identity | pinned declarations above | Yes at main's Tau Ceti pin (R01 at the branch pin). |
| 6.1, 6.7, 6.10 | Sjamaar v1 §2.2 (2.3) and the section-action formula, p. 24 | sjamaar lines 1233–1258; `dΦ^ξ=ι_{ξ_M}ω` at 196, `Jξ_M=grad Φ^ξ` at 226 | Yes. `ω=−(2πi)⁻¹Θ` and `ξ·s=−∇_{ξ_M}s+2πiΦ^ξ s`; with `μ=2πΦ` this is §6.7's `a·s=−∇_{X_a}s+iμ_a s`. |
| 6.6 | Sjamaar Prop. 2.2 p. 19, Thm 2.8 p. 22, Prop. 2.11 pp. 24–25 | lines 957–1012, 1134–1160, 1232–1290 | Yes. Line 1255 assumes the global `G_ℂ` action, and the README constructs it. |
| 6.7 | Sjamaar Thm 2.15 pp. 27–28 | lines 1439–1488 | Yes for the statement, with (2.4) `d/dt⟨s,s⟩=8π‖Φ‖²⟨s,s⟩`. The proof has the gap listed under "Source issues"; the README's maximum and continuity argument avoids it. |
| 6.2 | Demailly VII Thm 13.1 p. 358, Cor. 13.3 and Thm 14.1 p. 359 | lines 17541–17633 | Yes. Jet surjectivity for `L^k` with `k≥C(m+1)`; positive ⇔ ample; Kodaira's criterion. |
| 6.3a, 6.4 | Vergne v1 §3 p. 4, Thm 3.2 p. 5 | vergne lines 159–213 | Yes. `RR_G(exp X)=(2iπ)^{−d}∫e^{iΩ(X)}Todd(X)` and `Θ_M(k)∼k^dΣk^{−n}DH_n`. The top-degree part of `(2iπ)^{−d}e^{iΩ}` is `(2π)^{−d}Ω^d/d!`, the README's `j=0` term. |
| 6.3a, 6.5, 6.8, 6.9 | Meinrenken v2 (3)–(5) p. 2; Thm 2.1 p. 5; (17)–(21) pp. 6–7 | meinrenken lines 36–67, 156–199, 201–242 | Yes. Regular μ and `m≫0`, with `m=1` when `J(M)⊂𝔤*_reg`, which always holds for a torus; sector phases `ρ_μ(g_j⁻¹)c_L(g_j)`, period-k quasi-polynomials. |
| 6.8 | Ma–Marinescu v1 §5.2 (5.12), Thm 5.4 p. 33 | ma-marinescu lines 1540–1616 | Yes, for proper orbifold bundles ((5.9) reduces to the proper part), the hypothesis the README says it does not impose. |
| 6.9, 6.11 | deductions from Meinrenken pp. 6–7 and ComplexKahlerGeometry K7.2 | values in the table below | Yes. |

**Adversarial table.** Values computed this round, with ℏ=1 unless stated, `ω=dq∧dp`, `θ=p dq` and `X_f=f_p∂q−f_q∂p` from `ι_{X_f}ω=df`.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions: `[X_f,X_g]=−X_{ {f,g} }` (R01's bracket identity) | `f=q²,g=p` | `X_f=−2q∂p`, `X_g=∂q`, `[X_f,X_g]=2∂p`; `{f,g}=2q`, `X_{2q}=−2∂p` | agrees |
| Conventions: `F_∇=−(i/ℏ)ω`, `c₁=[ω/2πℏ]`; conjugate dictionary | `∇=d+iθ/ℏ` | `F=i dθ/ℏ`, `F(∂q,∂p)=−i/ℏ`; `iF/2π=ω/2πℏ`; conjugating gives `[Q′_f,Q′_g]=conj(−iℏQ)=iℏQ′` | agrees |
| §1.1 holonomy | `β=ℏdq/2`; bounding cycle | `exp(−(i/ℏ)(ℏ/2))=e^{−i/2}`; `∮_{∂Σ}θ=−∫ω` gives `exp((i/ℏ)∫ω)` | agrees |
| §2.1 `[Y_f,Y_g]=Y_{ {f,g} }` in general | curvature term `a([X^h,Y^h])=−ω(X,Y)/ℏ` | `[X_f^h,X_g^h]=−X^h_{ {f,g} }−({f,g}/ℏ)V`; the two cross terms give `+2{f,g}V/ℏ`; total `Y_{ {f,g} }` | agrees |
| §2.1 plane lifts | `a=dt−p dq` | `Y_q=∂p+q∂t`, `Y_p=−∂q`, bracket `∂t`; `F_q=−∂p+q∂t`, `F_p=∂q+2p∂t`, bracket `−3∂t=F_{−1}−2V` | agrees |
| §2.2 Stone generator and deficiency | `f=c`; `iℏ∂q` on `(0,∞)` | flow of `(c/ℏ)V` gives `U_t=e^{itc/ℏ}` and `Q_c=−iℏ(c/ℏ)(i)=c`; `e^{q/ℏ}∉L²`, `‖e^{−q/ℏ}‖²=ℏ/2`, indices `(0,1)` | agrees |
| §2.3 descent (R01 cites its moment API) | Circle on a point with `μ≡ℏ` and `μ≡ℏ/2`; translations; `Ĝ` | `−Y_ℏ=−V`, so `e^{−2πi}=1` and `e^{−πi}=−1`; `c={q,p}=1`, bracket `−1/ℏ`; `(f,z)·(f,χ(f)⁻¹)⁻¹=(1,zχ(f))`, so the kernel of `Ĝ→G` is Circle | agrees |
| §2.3 Tuynman sign | his `ρ(X)=−(positive field)` | the README's `ξ↦−Y_{μ^ξ}` is the anti-homomorphism of positive fields | agrees |
| §3.1 characters | `H=μ₂`; `S₃` | trivial and sign: derivative 0, values 1 and −1; `ker sign=A₃` of order 3 | agrees |
| §3.2 periods | SU(2), SO(3) at radius 1/2 and 1 | `exp(2πH₀)=I`, `exp(πH₀)=−I`, `α(H₀)=2`; area `4πr`: 2π and 4π; `μ(2Z)=1,2`; phase `e^{iπ}=−1`, `e^{2πi}=1` | agrees |
| §3.3 fibre argument, vanishing | `α_i∉I`; `ℂP¹`; `SU(3)/T`; elliptic curve | `P_{α_i}∩P_I=B`, so `P_{α_i}/B≅P¹` maps isomorphically; `⟨ϖ_j,α_i∨⟩=δ_ij`; a harmonic (0,q)-form is K-invariant with fibre weights of one strict sign, so it is 0; `h^{0,1}=1` breaks injectivity | agrees |
| §3.4 forgetful maps (R02 touches line 766) | SO(3), SU(2), U(2), U(3) | `a↦⟨a,α∨⟩=2a`, image 2ℤ; `det^a z^b=det^a z^{b−a}`, degree `a−b`; `O(k)↔z^{−k}`; `ζ^{−k}`: U(2) O(1) gives −1, U(3) O(1) gives `e^{−2πi/3}`, O(3) gives 1 | agrees |
| §4.1 polarized sections | `P=span ∂p` | `∇_{∂p}q=0`, `∇_{∂p}p=1`; `ω(∂q,∂p)=1` | agrees |
| §4.2 observables and `A_P`-module | `p`, `p²`, `X_{af}` | `[2p∂q,∂p]=−2∂q`; `∇_{∂q}=∂q+ip`, so `Q_{p²}1=i·2p·ip+p²=−p²`; `[aX_f+fX_a,Y]` has terms in P because `Y(a)=0` | agrees |
| §5.1 flow with phase | group law; `v=∂q,u=0` | `∫₀ˢu∘ψ_{−r−t}dr=∫_t^{t+s}u∘ψ_{−r}dr`, so `U_tU_s=U_{t+s}`; `d/dt` at 0 is `−L_v+(i/ℏ)u=(i/ℏ)Q`; `φ(q−t)` | agrees |
| §5.3 headline `finrank_thetaSections` | general; `k=0`; `Im τ<0`; `k=1,α=1/2` | `s=Σc_me^{2πi(m+α)z}` and the τ law give `c_{m+k}=e^{2πi(m+α)τ−2πiβ+πikτ}c_m`; ratio modulus `e^{−π(2m+2α+k)Im τ}`, so Gaussian decay both ways and k free coefficients; `k=0`: constants, dimension 1; `Im τ<0`: growth, dimension 0; `k=1,α=1/2`: dimension 1 | true; both hypotheses needed |
| §5.3 metric, curvature, holonomy | `τ=i,k=1`; general `τ=τ₁+iτ₂` | `h(z+τ)/h(z)=e^{−4πky−2πkτ₂}`, factor `|·|²=e^{4πky+2πkτ₂}`; `∂log h=2πik(y/τ₂)dz`; `F=(πk/τ₂)dz∧dz̄=−2πik dq∧dp=−iω/ℏ`; along the q-loop `A=2πikp dq`, holonomy `e^{−2πi(kp+α)}`; `k=2`: p=0, 1/2 give 1 and p=1/4 gives −1 | agrees |
| §6.1 weights and twist | ℂP¹ (0,2); twist 1 | `y↦t^{−2}y`, weights `0,…,−2n`; twisted `n,…,−n`; μ image `[−2,0]` with `μ([1:0])=0` from `μ=μ(p)−c r²` near `[1:0]` | agrees |
| §6.2 residues | `m=3`, thresholds (2,4,1) | `k≥4` covers 12, 13, 14; `i_*(L^j)(k)=i_*(L^{j+mk})` | agrees |
| §6.3a fixed components | ℂP¹ O(1); ℂP² weights (0,0,1), O(1) | ℂP¹: `1/(1−u)+u/(1−u⁻¹)=1+u`. ℂP²: line term `2/(1−t⁻¹)−t⁻¹/(1−t⁻¹)²` and point term `t⁻¹/(1−t)²` sum to `(2t³−3t²+1)/(t(t−1)²)=2+t⁻¹`, which is χ₁ | agrees, including a positive-dimensional F |
| §6.3a near-identity | O(n) on ℂP¹; DH | `n⁻¹(n+1)=1+1/n`; localized `∫e^{ω/2π+iμX}=(1−e^{−2iX})/(2iX)`, the Fourier transform of `½·1_[−2,0]` | agrees |
| §6.4 limit | ℂP¹ (0,2); ℂP² O(1); point | mass `(n+1)/n→1`, density 1/2; `binom(n+2,2)/n²→1/2=(2π)^{−2}∫ω²/2`; `δ_κ` | agrees |
| §6.5 cosets | doubled ℂP¹; `[pt/μ₂]` | `Ann(μ₂)=2ℤ`, index 2; `(1±1)/2=1,0` | agrees |
| §6.6 potential | ℂP¹ (0,1), `n=2,λ=−1,m=1`, `[1:1]` | `exp(ia)[1:1]=[1:e^{−a}]`, `μ−ξ=tanh(a)/2`, `2mn(μ−ξ)=2tanh a=κ′`; `g(X,X)=1/2`, `κ″(0)=2`; supports `{−1,0,1}`, `{−1}`, `{1}`; FS moments at fixed points `1,−1=2(μ+1/2)` | agrees |
| §6.7 Kostant bound (R02 touches 1618–1619) | `r=1/4`, section `xy` | `‖xy‖²=4/25`, `η=3/10`, `4·2·(9/100)(4/25)=72/625`. Directly: `−grad f=2ηρ∂ρ`, `d‖s‖²/dρ=2ρ(1−ρ²)/(1+ρ²)³=48/125`, times `2ηρ=3/10` gives `72/625`; max on `r=1` is `1/4≥4/25` | agrees |
| §6.7 empty level | max of `‖s‖²` | `JX_a‖s‖²=−2nη_a‖s‖²=0` gives `μ=ξ` | agrees |
| §6.8 inertia, positivity | `[pt/μ₂]`; `ε=1/2,C₀=3`; O(n) on ℂP¹ | totals 1 and 0; `nε−C₀`: 0 at n=6, 1/2 at n=7; normal factor `1−(−1)=2`; `O(n+2)` | agrees |
| §6.9 counts | (0,1,2), `n=6` | `C_n(j)=⌊j/2⌋+1`; j=2,3 give 2 and 2, leading terms 1 and 3/2; the μ₂ stratum `{y=0}` is a point in `R_ξ` (dimension 0 < 1), hence the parity term; doubled ℂP¹: `q_Bρ_B=1` | agrees |
| §6.10 transport | `T²` on ℂP¹; β=(0,b) or (1,b) | quotient weights `−j` or `−j−n`; adding `nβ` gives `(−j,nb)` in both cases | agrees |
| §6.11 counts and densities | (0,1,−2) at n=2, 3; both densities | `{0,1,−2,2,−1,−4}`; n=3 gives 0 twice and eight weights once (10 in all); `(1−x)/3−max(0,−x/2)` gives `(x+2)/6` and `(1−x)/3`, masses 1/3 and 1/6; (0,1,2): `x/2−max(0,x−1)=min(x,2−x)/2` | agrees |
| Docstring "not statable" claims | both pins | no principal connection, no character-associated smooth line, no flag, orbifold or polarized-section carrier; only a topological `TauCeti.PrincipalBundle` at main (R01 repair); the theta space is statable and is stated | agrees, with R01's wording fix |

**Headline theorems (README) and their status in `Suggested.lean`.**
- Stated: §5.3's Kähler quantization of the degree-k torus (`finrank_thetaSections`).
- Named in the docstring as not statable, each with the carrier it lacks: §2.1 lift and commutator; §2.2 complete-flow unitary group and essential self-adjointness; §2.3 covering lift, descent and circle extension; §3.1–3.2 homogeneous character/descent and fixed-moment integrality; §3.3–3.4 period, Picard and forgetful maps; §4.2–4.3 and §5.1 polarization preservation and half-density realization; §5.2 projective quantization (the dimension itself is ComplexKahlerGeometry K7.2's) and the Bohr–Sommerfeld torus; §6.2 positive-line/index bridge; §6.3a equivariant Riemann–Roch; §6.4 distribution limit; §6.6–6.8 complexified action, Kostant bound and regular reduction; §6.9 quasi-polynomials.

I checked each "not statable" claim at both pins. No stand-in is used.

## Not verifiable

- **Graham–Vogan**, *Geometric quantization for nilpotent coadjoint orbits* (§3.1 Ex. 5.8 p. 25; §3.2 Def. 6.4 p. 37; §5.1 Def. 5.5 and (5.7) pp. 23–25). The author-page PDF fetched through the sources service has a text layer of glyph names, not words, and OCR is not installed on this worker. These locators remain cited by page and item number only. The statements they support are standard, and the README also derives them from the displayed quotient relation.
- **Elaboration at main's pins.** The Lean commands this review may run build only at the branch pins `a91d3aa`/`6b7abb3c`. At main's pins I compared statements textually, and checked with the print-only `git merge-tree` that the merge is conflict-free (R01).
- **Context-only references** (Kostant, Woodhouse, Śniatycki, Cannas da Silva, Kodaira 1954, Meinrenken–Sjamaar) carry no locator and no claim rests on them; they were not read.

## Source issues

- **Error** in sjamaar at Theorem 2.15, proof, printed p. 28 (sjamaar line 1487): the source puts the gradient-flow limit of a semistable point inside its complexified orbit and equates the invariant section's values there; it should place the limit only in the orbit closure and get nonvanishing from the nondecreasing norm (2.4) and continuity; affects the proof.
- **Misprint** in demailly at VI §9.1, printed p. 314 (demailly line 15573): the source cites (V-11.6), a notation item, for the Dolbeault identification of `H¹(X,𝒪)`; it should cite (V-11.5), the Dolbeault–sheaf comparison with trivial coefficients; affects nothing.
- **Misprint** in demailly at proof of VII Theorem 13.1, printed p. 359 (demailly line 17603): the source calls the canonical section with divisor E a section of the inverse of `𝒪(E)`; it should be a section of `𝒪(E)`, as the stated type of its negative powers requires; affects the proof.
